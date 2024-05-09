package postgres

import (
	"asrlan-monolight/storage/repo"
	"context"
	"log"

	"github.com/jmoiron/sqlx"
	"github.com/k0kubun/pp"
)

type levelRepo struct {
	db *sqlx.DB
}

func NewLevel(db *sqlx.DB) repo.LevelStorageI {
	return &levelRepo{
		db: db,
	}
}

// This function create level in postgres
func (s *levelRepo) Create(ctx context.Context, level *repo.Level) (*repo.Level, error) {
	pp.Println(level)
	query := `
	INSERT INTO levels(
		name,
		language_id
	)
	VALUES ($1, $2) 
	RETURNING 
		id,
		created_at`

	err := s.db.QueryRowContext(
		ctx,
		query,
		level.Name,
		level.LanguageId).Scan(&level.Id, &level.CreatedAt)
	if err != nil {
		log.Println("Eror creating level in postgres method", err.Error())
		return nil, err
	}

	return level, nil
}

// This function update level info from postgres
func (s *levelRepo) Update(ctx context.Context, newLevel *repo.Level) (*repo.Level, error) {
	query := `
	UPDATE
		levels
	SET
		name=$1,
		updated_at=CURRENT_TIMESTAMP
	WHERE
		id=$2
	AND deleted_at IS NULL
	RETURNING
		language_id,
		created_at,
		updated_at
	`
	err := s.db.QueryRowContext(
		ctx,
		query,
		newLevel.Name,
		newLevel.Id,
	).Scan(&newLevel.LanguageId, &newLevel.CreatedAt, &newLevel.UpdatedAt)
	if err != nil {
		log.Println("Eror updating level in postgres method", err.Error())
		return nil, err
	}

	return newLevel, nil
}

// This function delete level info from postgres
func (s *levelRepo) Delete(ctx context.Context, id string) (bool, error) {
	pp.Println(id)
	query := `
	UPDATE
		levels
	SET
		deleted_at=CURRENT_TIMESTAMP
	WHERE
		id=$1
	`
	if _, err := s.db.QueryContext(ctx, query, id); err != nil {
		return false, err
	}
	return true, nil
}

// This function gets level in postgres
func (s *levelRepo) Get(ctx context.Context, id string) (*repo.Level, error) {
	pp.Println(id)
	query := `
	SELECT 
		levels.id,
    	levels.name,
    	languages.id,
    	languages.name,
		levels.created_at,
		levels.updated_at
	FROM 
		levels
	JOIN 
		languages ON levels.language_id = languages.id
	WHERE levels.id = $1 
	AND	languages.deleted_at IS NULL
	AND levels.deleted_at IS NULL
	`

	var responseLevel repo.Level
	err := s.db.QueryRowContext(ctx, query, id).Scan(
		&responseLevel.Id,
		&responseLevel.Name,
		&responseLevel.LanguageId,
		&responseLevel.LanguageName,
		&responseLevel.CreatedAt,
		&responseLevel.UpdatedAt,
	)
	if err != nil {
		log.Println("Eror getting level in postgres method", err.Error())
		return nil, err
	}

	return &responseLevel, nil
}

// This function get all level with page and limit posgtres
func (s *levelRepo) GetAll(ctx context.Context, page, limit uint64) ([]*repo.Level, int64, error) {
	query := `
	SELECT 
		levels.id,
		levels.name,
		languages.id,
		languages.name,
		levels.created_at,
		levels.updated_at
	FROM 
		levels
	JOIN 
		languages ON levels.language_id = languages.id
	WHERE 
		levels.deleted_at IS NULL
		AND languages.deleted_at IS NULL 
	LIMIT $1
	OFFSET $2
	`

	offset := limit * (page - 1)
	rows, err := s.db.QueryContext(ctx, query, limit, offset)
	if err != nil {
		log.Println("Error selecting levels with page and limit in postgres", err.Error())
		return nil, 0, err
	}
	defer rows.Close()

	var responseLevels []*repo.Level
	for rows.Next() {
		var level repo.Level
		err = rows.Scan(
			&level.Id,
			&level.Name,
			&level.LanguageId,
			&level.LanguageName,
			&level.CreatedAt,
			&level.UpdatedAt,
		)
		if err != nil {
			log.Println("Error scanning level in getall level method of postgres", err.Error())
			return nil, 0, err
		}

		responseLevels = append(responseLevels, &level)
	}

	count := len(responseLevels)

	return responseLevels, int64(count), nil
}
