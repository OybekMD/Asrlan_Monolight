package repo

import "context"

type Dashboard struct {
	Topics    []Topics `json:"topics"`
}

type Topics struct {
	TopicId    int64     `json:"topic_id"`
	TopicName  string    `json:"topic_name"`
	TopicScore int64     `json:"score"`
	Lessons    []Lessons `json:"lessons"`
}
type Lessons struct {
	LessonId    int64  `json:"id"`
	LessonName  string `json:"lesson_name"`
	LessonScore int64  `json:"score"`
}

type DashboardStorageI interface {
	GetDashboard(ctx context.Context, userId, language_id, level_id string) (*Dashboard, error)
}
