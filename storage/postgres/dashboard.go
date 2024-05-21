package postgres

import (
	"asrlan-monolight/api/helper/certificate"
	impemail "asrlan-monolight/api/helper/email"
	"asrlan-monolight/storage/repo"
	"context"
	"database/sql"
	"fmt"
	"log"

	"github.com/jmoiron/sqlx"
)

type dashboardRepo struct {
	db *sqlx.DB
}

func NewDashboard(db *sqlx.DB) repo.DashboardStorageI {
	return &dashboardRepo{
		db: db,
	}
}

// // // What about sending email to user about he/she got a certificate
func (s *dashboardRepo) CreateCertificate(ctx context.Context, user_id string, level_id int64) (bool, error) {
	// What is this mean true and false?
	// true = we should create
	// false = we alread created or we shouldn't create
	fmt.Println("user_id:", user_id, "level_id:", level_id)
	queryExist := `
		SELECT
			count(1)
		FROM
			certificates
		WHERE
			level_id = $1
			AND user_id = $2`

	var isExists int

	row := s.db.QueryRowContext(ctx, queryExist, level_id, user_id)
	err := row.Scan(&isExists)
	if err != nil {
		fmt.Println("error 1", err)
		log.Println("Error getting count of number of certificate", err.Error())
		return false, err
	}

	if isExists != 0 {
		fmt.Println("error 2", err)
		return false, nil
	}
	// We need data: name, level, language
	var name, email, level, language string
	queryGetNLL := `
	SELECT
		u.name AS user_name,
		u.email AS user_email,
		l.name AS level_name,
		lang.name AS language_name
	FROM
		users u
	JOIN
		user_level ul ON u.id = ul.user_id
	JOIN
		levels l ON ul.level_id = l.id
	JOIN
		user_language ulang ON u.id = ulang.user_id
	JOIN
		languages lang ON ulang.language_id = lang.id
	WHERE
		u.id = $1
		AND ul.level_id = $2
		AND ulang.status = TRUE
	ORDER BY
		u.name;
	`

	err = s.db.QueryRowContext(ctx, queryGetNLL, user_id, level_id).Scan(&name, &email, &level, &language)
	if err != nil {
		fmt.Println("error 3", err)
		log.Println("Eror creating lesson in postgres method", err.Error())
		return false, err
	}

	certificatePath, err := certificate.GenerateCertificate(name, level, language)
	if err != nil {
		fmt.Println("error 4", err)
		log.Println("Error GenerateCertificate:", err.Error())
		return false, err
	}

	query := `
	INSERT INTO certificates (
		name,
		pdfile,
		level_id,
		user_id
	)
	VALUES ($1, $2, $3, $4)
	`
	insertName := language+" "+level

	_, err = s.db.ExecContext(
		ctx,
		query,
		insertName,
		certificatePath,
		certificatePath,
		level_id,
		user_id,
	)

	if err != nil {
		fmt.Println("error 5", err)
		log.Println("Eror creating Certificate in postgres method", err.Error())
		return false, err
	}

	body := impemail.EmailCertificate{
		Name: name,
		Url:  certificatePath,
	}

	impemail.SendEmailCertificate([]string{email}, "Asrlan Congratulations\n", "./api/helper/email/certificate.html", body)

	return true, err
}

func (s *dashboardRepo) UpCreateLevel(ctx context.Context, userLevel *repo.UserLevel) (bool, error) {
	queryExist := `
	UPDATE
		user_level
	SET
		score = $1
	WHERE
		user_id = $2
		AND level_id = $3
	`
	if userLevel.Score == 100 {
		isHave, err := s.CreateCertificate(ctx, userLevel.UserId, userLevel.LevelId)
		if err != nil {
			return false, err
		}
		if !isHave {
			fmt.Println("NOOOOOOOOOOOOOOOO created!")
		}
	}
	result, err := s.db.ExecContext(ctx,
		queryExist,
		userLevel.Score,
		userLevel.UserId,
		userLevel.LevelId,
	)
	if err != nil {
		log.Println("Error deleting user", err.Error())
		return false, err
	}

	rowEffect, err := result.RowsAffected()
	if err != nil {
		log.Println("Error getting row effect", err.Error())
		return false, err
	}

	if rowEffect != 0 {
		return true, nil
	}

	query := `
	INSERT INTO user_level (
		score,
		user_id,
		level_id
	)
	VALUES ($1, $2, $3)
	`

	_, err = s.db.ExecContext(
		ctx,
		query,
		userLevel.Score,
		userLevel.UserId,
		userLevel.LevelId,
	)

	if err != nil {
		log.Println("Eror creating userLevel in postgres method", err.Error())
		return false, err
	}

	// Add Generate Certificate

	return true, err
}

func (s *dashboardRepo) UpCreateTopic(ctx context.Context, userTopic *repo.UserTopic) (bool, error) {
	queryExist := `
	UPDATE
		user_topic
	SET
		score = $1
	WHERE
		user_id = $2
		AND topic_id = $3
	`
	result, err := s.db.ExecContext(ctx,
		queryExist,
		userTopic.Score,
		userTopic.UserId,
		userTopic.TopicId,
	)
	if err != nil {
		log.Println("Error deleting user", err.Error())
		return false, err
	}

	rowEffect, err := result.RowsAffected()
	if err != nil {
		log.Println("Error getting row effect", err.Error())
		return false, err
	}

	if rowEffect != 0 {
		return true, nil
	}

	query := `
	INSERT INTO user_topic (
		score,
		user_id,
		topic_id
	)
	VALUES ($1, $2, $3)
	`

	_, err = s.db.ExecContext(
		ctx,
		query,
		userTopic.Score,
		userTopic.UserId,
		userTopic.TopicId,
	)

	if err != nil {
		log.Println("Eror creating userTopic in postgres method", err.Error())
		return false, err
	}

	return true, err
}

func (s *dashboardRepo) GetDashboard(ctx context.Context, userId string, language_id, level_id int64) (*repo.Dashboard, error) {
	queryTopic := `
		SELECT
			t.id,
			t.name
		FROM
			topics t
		WHERE
			t.level_id = $1
		ORDER BY
			t.id
	`

	rows, err := s.db.QueryContext(ctx, queryTopic, level_id)
	if err != nil {
		fmt.Println("error 1:", err)
		log.Println("Error selecting badges with page and limit in postgres", err.Error())
		return nil, err
	}
	defer rows.Close()
	var topics []repo.Topics

	var overAllTopicScore int64
	var levelScore int64
	for rows.Next() {
		var topicId int64
		var topicName string
		var topicScore int64

		// err := rows.Scan(&topicId, &topicName, &topicScore)
		err := rows.Scan(&topicId, &topicName)
		if err != nil {
			fmt.Println("error 2:", err)
			log.Println("Error scanning Topic rows:", err)
			continue
		}

		var lessons []repo.Lessons

		queryLesson := `
		SELECT
			l.id,
			l.name,
			COALESCE(ul.score, 0) AS score
		FROM
			lessons l
		LEFT JOIN user_lesson ul ON ul.lesson_id = l.id AND ul.user_id = $1
		WHERE
			l.topic_id = $2
		ORDER BY
    		l.id
		`
		lessonRows, err := s.db.QueryContext(ctx, queryLesson, userId, topicId)
		if err != nil {
			log.Println("Error selecting badges with page and limit in postgres", err.Error())
			return nil, err
		}
		var overAllLessonScore int64
		for lessonRows.Next() {
			var lessonId int64
			var lessonName string
			var lessonScore int64

			// Scan requires pointers to the destination variables
			err := lessonRows.Scan(&lessonId, &lessonName, &lessonScore)
			if err != nil {
				log.Println("Error scanning lesson rows:", err)
				return nil, err
			}

			lessons = append(lessons, repo.Lessons{
				LessonId:    lessonId,
				LessonName:  lessonName,
				LessonScore: lessonScore,
			})
			overAllLessonScore += lessonScore
		}

		lessonsCount := int64(len(lessons))
		if overAllLessonScore != 0 {
			topicScore = 100 - (((lessonsCount * 100) - overAllLessonScore) / 10)
		}

		topics = append(topics, repo.Topics{
			TopicId:    topicId,
			TopicName:  topicName,
			TopicScore: topicScore,
			Lessons:    lessons,
		})
		overAllTopicScore += topicScore

		if topicScore != 0 {
			status, err := s.UpCreateTopic(ctx, &repo.UserTopic{
				Score:   topicScore,
				UserId:  userId,
				TopicId: topicId,
			})
			if !status || err != nil {
				return nil, err
			}
		}
	}
	if err := rows.Err(); err != nil {
		log.Println("Error iterating through rows:", err)
		return nil, err
	}

	topicsCount := int64(len(topics))
	if overAllTopicScore != 0 {
		levelScore = 100 - (((topicsCount * 100) - overAllTopicScore) / 10)
	}

	status, err := s.UpCreateLevel(ctx, &repo.UserLevel{
		Score:   levelScore,
		UserId:  userId,
		LevelId: level_id,
	})
	if !status || err != nil {
		return nil, err
	}

	var dashboard repo.Dashboard

	dashboard.Topics = topics

	return &dashboard, nil
}

func (s *dashboardRepo) GetLeaderboard(ctx context.Context, period, level_id string) ([]*repo.Leaderboard, error) {
	query := fmt.Sprintf(
		`SELECT
		u.name,
		u.username,
		u.avatar,
		uscores.total_score
	FROM
		users u
	JOIN
		(
			SELECT
				a.user_id,
				SUM(a.score) AS total_score
			FROM
				activitys a
			WHERE
				a.created_at >= CURRENT_DATE - INTERVAL '%s months'
			GROUP BY
				a.user_id
		) uscores ON u.id = uscores.user_id
	JOIN
		user_level ulev ON u.id = ulev.user_id
	WHERE
		ulev.level_id = %s
	ORDER BY
		uscores.total_score DESC;
	`, period, level_id)

	rows, err := s.db.QueryContext(ctx, query)
	if err != nil {
		fmt.Println("error 1:", err)
		log.Println("Error Leaderboard in postgres", err.Error())
		return nil, err
	}
	defer rows.Close()
	var leaders []*repo.Leaderboard

	for rows.Next() {
		var leader repo.Leaderboard
		var nullAvatar sql.NullString
		err := rows.Scan(
			&leader.Name,
			&leader.Username,
			&nullAvatar,
			&leader.Score,
		)
		if err != nil {
			fmt.Println("error 2:", err)
			log.Println("Error scanning Topic rows:", err)
			continue
		}
		if nullAvatar.Valid {
			leader.Avatar = nullAvatar.String
		}

		leaders = append(leaders, &leader)
	}

	if err := rows.Err(); err != nil {
		log.Println("Error iterating through rows:", err)
		return nil, err
	}

	return leaders, nil
}
