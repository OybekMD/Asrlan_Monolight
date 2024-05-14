package models

import "asrlan-monolight/storage/repo"

type (
	LessonCreate struct {
		Name string `json:"lesson_name"`
	}

	LessonRequest struct {
		Id string `json:"id"`
	}

	LessonResponse struct {
		Id        int64  `json:"id"`
		Name      string `json:"lesson_name"`
		TopicId   int64  `json:"topic_id"`
		TopicName string `json:"topic_name"`
		CreatedAt string `json:"created_at"`
		UpdatedAt string `json:"updated_at"`
	}

	LessonListResponse struct {
		Lessons []*repo.Lesson
	}

	LessonUpdate struct {
		Id   int64  `json:"id"`
		Name string `json:"lesson_name"`
	}
)
