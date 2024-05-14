package postgres

import (
	"asrlan-monolight/storage/repo"
	"context"
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

func (s *dashboardRepo) GetDashboard(ctx context.Context, userId, language_id, level_id string) (*repo.Dashboard, error) {
	fmt.Println("worked")
	// queryTopic := `
	// 	SELECT
	// 		t.id,
	// 		t.name,
	// 		ut.score
	// 	FROM
	// 		topics t
	// 	JOIN
	// 		levels l ON $1 = l.language_id
	// 	JOIN
	// 		user_topic ut ON ut.user_id = $2
	// 	WHERE
	// 		t.level_id = $3
	// 	ORDER BY
	// 		t.id
	// `
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

	fmt.Println("lang_id:", language_id)
	fmt.Println("level_id:", level_id)
	fmt.Println("user_id:", userId)

	rows, err := s.db.QueryContext(ctx, queryTopic, level_id)
	if err != nil {
		fmt.Println("error 1:", err)
		log.Println("Error selecting badges with page and limit in postgres", err.Error())
		return nil, err
	}
	defer rows.Close()
	var topics []repo.Topics

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
	}

	if err := rows.Err(); err != nil {
		log.Println("Error iterating through rows:", err)
		return nil, err
	}

	var dashboard repo.Dashboard

	dashboard.Topics = topics

	return &dashboard, nil
}
