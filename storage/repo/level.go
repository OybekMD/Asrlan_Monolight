package repo

import "context"

type Level struct {
	Id           int64  `json:"id"`
	Name         string `json:"name"`
	LanguageId   int64  `json:"language_id"`
	LanguageName string `json:"language_name"`
	CreatedAt    string `json:"created_at"`
	UpdatedAt    string `json:"updated_at"`
}

type LevelStorageI interface {
	Create(ctx context.Context, badge *Level) (*Level, error)
	Update(ctx context.Context, badge *Level) (*Level, error)
	Delete(ctx context.Context, id string) (bool, error)
	Get(ctx context.Context, id string) (*Level, error)
	GetAll(ctx context.Context, page, limit uint64) ([]*Level, int64, error)
}
