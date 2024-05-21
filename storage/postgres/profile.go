package postgres

import (
	"asrlan-monolight/storage/repo"
	"context"
	"database/sql"
	"fmt"
	"log"

	"github.com/jmoiron/sqlx"
	"github.com/k0kubun/pp/v3"
)

type profileRepo struct {
	db *sqlx.DB
}

func NewProfile(db *sqlx.DB) repo.ProfileStorageI {
	return &profileRepo{
		db: db,
	}
}

// This function gets profile in postgres
func (s *profileRepo) GetStatisticWMY(ctx context.Context, period, userid string) ([]*repo.Statistic, error) {
	var query string
	switch period {
	case "1": // Week
		query = `
            SELECT 
                DATE(created_at) AS period, 
                SUM(score) AS score 
            FROM 
                activitys 
            WHERE
                user_id = $1
                AND DATE_TRUNC('week', created_at) = DATE_TRUNC('week', CURRENT_DATE)
            GROUP BY 
                DATE(created_at)
            ORDER BY 
                period
        `
	case "2": // Month
		query = `
            SELECT 
                DATE(created_at) AS period, 
                SUM(score) AS score 
            FROM 
                activitys 
            WHERE 
                user_id = $1
                AND DATE_TRUNC('month', created_at) = DATE_TRUNC('month', CURRENT_DATE)
            GROUP BY 
                DATE(created_at)
            ORDER BY 
                period;
        `
	case "3": // Year
		query = `
            SELECT 
                DATE(created_at) AS period, 
                SUM(score) AS score 
            FROM 
                activitys 
            WHERE 
                user_id = $1
                AND DATE_TRUNC('year', created_at) = DATE_TRUNC('year', CURRENT_DATE)
            GROUP BY 
                DATE(created_at)
            ORDER BY 
                period;
        `
	default:
		return nil, fmt.Errorf("invalid period: %s", period)
	}

	rows, err := s.db.QueryContext(ctx, query, userid)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var statistics []*repo.Statistic
	for rows.Next() {
		var stat repo.Statistic
		if err := rows.Scan(&stat.Period, &stat.Score); err != nil {
			return nil, err
		}
		statistics = append(statistics, &stat)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}

	return statistics, nil
}

func (s *profileRepo) GetStatisticYear(ctx context.Context, year, userid string) (map[string][]repo.Statistic, error) {
	// Initialize a map with all months
	monthlyStatistics := make(map[string][]repo.Statistic)
	monthsOrder := []string{"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"}
	for _, month := range monthsOrder {
		monthlyStatistics[month] = make([]repo.Statistic, 0)
	}

	query := `
        SELECT
            TO_CHAR(created_at, 'MM') AS month_number, 
            DATE(created_at) AS period, 
            SUM(score) AS score 
        FROM 
            activitys 
        WHERE 
            user_id = $1
            AND EXTRACT(YEAR FROM created_at) = $2
        GROUP BY 
            TO_CHAR(created_at, 'MM'), DATE(created_at)
        ORDER BY 
            MIN(created_at);
    `

	rows, err := s.db.QueryContext(ctx, query, userid, year)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	// Populate the map with the retrieved data
	for rows.Next() {
		var month string
		var stat repo.Statistic
		if err := rows.Scan(&month, &stat.Period, &stat.Score); err != nil {
			return nil, err
		}
		// month = strings.TrimSpace(month) // Remove any trailing spaces from month name
		monthlyStatistics[month] = append(monthlyStatistics[month], stat)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}

	// Remove empty slices from the map
	for month, stats := range monthlyStatistics {
		if len(stats) == 0 {
			delete(monthlyStatistics, month)
		}
	}

	return monthlyStatistics, nil
}

func (s *profileRepo) GetBadge(ctx context.Context, userid string) ([]*repo.Badge, int64, error) {
	query := `
	SELECT
		b.id,
		b.name, 
		b.badge_date, 
		b.badge_type, 
		b.picture,
		(SELECT COUNT(*) FROM badges) AS total_count
	FROM
		badges b
	JOIN
		user_badge ub ON ub.badge_id = b.id
	WHERE
		ub.user_id = $1
	`

	rows, err := s.db.QueryContext(ctx, query, userid)
	if err != nil {
		log.Println("Error selecting profile badges with in postgres", err.Error())
		return nil, 0, err
	}
	defer rows.Close()

	var responseBadges []*repo.Badge
	var badgeCount int64
	for rows.Next() {
		var badge repo.Badge
		err = rows.Scan(
			&badge.Id,
			&badge.Name,
			&badge.BadgeDate,
			&badge.BadgeType,
			&badge.Picture,
			&badgeCount,
		)
		if err != nil {
			log.Println("Error scanning badge in getall badge method of postgres", err.Error())
			return nil, 0, err
		}

		responseBadges = append(responseBadges, &badge)
	}

	return responseBadges, badgeCount, nil
}

func (s *profileRepo) GetUser(ctx context.Context, username string) (*repo.ProfileUser, error) {
	pp.Println(username)
	query := `
	SELECT
		id,
		name, 
		username,
		bio, 
		birth_day, 
		avatar, 
		coint,
		created_at
	FROM
		users
	WHERE
		username = $1
	AND
		deleted_at IS NULL
	`

	var responseUser repo.ProfileUser
	var user_id string
	var nullBio, nullBirthDay, nullAvatar sql.NullString
	err := s.db.QueryRowContext(ctx, query, username).Scan(
		&user_id,
		&responseUser.Name,
		&responseUser.Username,
		&nullBio,
		&nullBirthDay,
		&nullAvatar,
		&responseUser.Coint,
		&responseUser.CreatedAt,
	)

	queryScore := `
	SELECT 
		SUM(score) AS total_score
	FROM 
		activitys 
	WHERE 
		user_id = $1
	`
	err = s.db.QueryRowContext(ctx, queryScore, user_id).Scan(
		&responseUser.Score,
	)

	if err != nil {
		log.Println("Eror getting user score in postgres method", err.Error())
		return nil, err
	}
	if nullBio.Valid {
		responseUser.Bio = nullBio.String
	}
	if nullBirthDay.Valid {
		responseUser.BirthDay = nullBirthDay.String
	}
	if nullAvatar.Valid {
		responseUser.Avatar = nullAvatar.String
	}

	queryStreak := `
	WITH activity_dates AS (
		SELECT DISTINCT DATE(created_at) AS activity_date
		FROM activitys
		WHERE user_id = $1
	),
	ranked_dates AS (
		SELECT 
			activity_date,
			RANK() OVER (ORDER BY activity_date) AS rank_date
		FROM activity_dates
	),
	streaks AS (
		SELECT 
			activity_date,
			rank_date,
			activity_date - INTERVAL '1 day' * (rank_date - 1) AS streak_group
		FROM ranked_dates
	),
	current_streak AS (
		SELECT 
			COUNT(*) AS streak_length
		FROM streaks
		WHERE streak_group = (
			SELECT streak_group
			FROM streaks
			ORDER BY activity_date DESC
			LIMIT 1
		)
	)
	SELECT streak_length
	FROM current_streak;
	`
	err = s.db.QueryRowContext(ctx, queryStreak, user_id).Scan(
		&responseUser.Streak,
	)
	if err != nil {
		log.Println("Eror getting user streak in postgres method", err.Error())
		return nil, err
	}


	queryRank := `
	WITH ranked_scores AS (
		SELECT
			a.user_id,
			RANK() OVER (ORDER BY SUM(a.score) DESC) AS rank
		FROM
			activitys a
		GROUP BY
			a.user_id
	)
	SELECT
		rs.rank
	FROM
		ranked_scores rs
	WHERE
		rs.user_id = $1
	`
	err = s.db.QueryRowContext(ctx, queryRank, user_id).Scan(
		&responseUser.Rank,
	)
	if err != nil {
		log.Println("Eror getting user streak in postgres method", err.Error())
		return nil, err
	}

	return &responseUser, nil
}

func (s *profileRepo) GetCertificate(ctx context.Context, user_id string) ([]*repo.Certificate, error) {
	query := `
	SELECT
		name,
		pdfile
	FROM
		certificates
	WHERE
		user_id = $1
	`

	rows, err := s.db.QueryContext(ctx, query, user_id)
	if err != nil {
		fmt.Println("Error1:", err)
		log.Println("Eror getting certificate in postgres method", err.Error())
		return nil, err
	}
	defer rows.Close()
	var responseCertificate []*repo.Certificate
	for rows.Next() {
		var certificate repo.Certificate
		err = rows.Scan(
			&certificate.Name,
			&certificate.Pdfile,
		)
		if err != nil {
			fmt.Println("Error2:", err)
			log.Println("Error scanning certificate method of postgres", err.Error())
			return nil, err
		}

		responseCertificate = append(responseCertificate, &certificate)
	}

	return responseCertificate, nil
}
