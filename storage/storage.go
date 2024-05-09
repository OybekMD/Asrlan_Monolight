package storage

import (
	"asrlan-monolight/storage/postgres"
	"asrlan-monolight/storage/repo"

	"github.com/jmoiron/sqlx"
)

type StorageI interface {
	Login() repo.LoginStorageI
	User() repo.UserStorageI
	Admin() repo.AdminStorageI
	Social() repo.SocialStorageI
	Badge() repo.BadgeStorageI
	UserBadge() repo.UserBadgeStorageI
	// Couser
	Language() repo.LanguageStorageI
	Level() repo.LevelStorageI
	Topic() repo.TopicStorageI
	Lesson() repo.LessonStorageI
}

type storagePg struct {
	loginRepo     repo.LoginStorageI
	userRepo      repo.UserStorageI
	adminRepo     repo.AdminStorageI
	socialRepo    repo.SocialStorageI
	badgeRepo     repo.BadgeStorageI
	userBadgeRepo repo.UserBadgeStorageI
	languageRepo  repo.LanguageStorageI
	levelRepo     repo.LevelStorageI
	topicRepo     repo.TopicStorageI
	lessonRepo    repo.LessonStorageI
}

func NewStoragePg(db *sqlx.DB) StorageI {
	return &storagePg{
		loginRepo:     postgres.NewLogin(db),
		userRepo:      postgres.NewUser(db),
		adminRepo:     postgres.NewAdmin(db),
		socialRepo:    postgres.NewSocial(db),
		badgeRepo:     postgres.NewBadge(db),
		userBadgeRepo: postgres.NewUserBadge(db),
		languageRepo:  postgres.NewLanguage(db),
		levelRepo:     postgres.NewLevel(db),
		topicRepo:     postgres.NewTopic(db),
		lessonRepo:    postgres.NewLesson(db),
	}
}

func (s *storagePg) Login() repo.LoginStorageI {
	return s.loginRepo
}

func (s *storagePg) User() repo.UserStorageI {
	return s.userRepo
}

func (s *storagePg) Admin() repo.AdminStorageI {
	return s.adminRepo
}

func (s *storagePg) Social() repo.SocialStorageI {
	return s.socialRepo
}

func (s *storagePg) Badge() repo.BadgeStorageI {
	return s.badgeRepo
}

func (s *storagePg) UserBadge() repo.UserBadgeStorageI {
	return s.userBadgeRepo
}

func (s *storagePg) Language() repo.LanguageStorageI {
	return s.languageRepo
}

func (s *storagePg) Level() repo.LevelStorageI {
	return s.levelRepo
}

func (s *storagePg) Topic() repo.TopicStorageI {
	return s.topicRepo
}

func (s *storagePg) Lesson() repo.LessonStorageI {
	return s.lessonRepo
}
