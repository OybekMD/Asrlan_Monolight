package repo

import "context"

type ProfileUser struct {
	Name      string `json:"name"`
	Username  string `json:"username"`
	Bio       string `json:"bio"`
	BirthDay  string `json:"birth_day"`
	Avatar    string `json:"avatar"`
	Coint     int64  `json:"coint"`
	Score     int64  `json:"score"`
	Rank      int64  `json:"rank"`
	Streak    int64  `json:"streak"`
	CreatedAt string `json:"created_at"`
	UpdatedAt string `json:"updated_at"`
}

// Statistic start
type Statistic struct {
	Score  int64  `json:"score"`
	Period string `json:"period"`
}

type StatisticMonth struct {
	Month []Statistic `json:"month"`
}

// Statistic end

type Profile struct {
	User        ProfileUser  `json:"user"`
	Social      Social       `json:"social"`
	Certificate []*string    `json:"certificate"`
	Badge       []*Badge     `json:"badge"`
	Statistic   []*Statistic `json:"statistic"`
}

type Certificate struct {
	Name   string `json:"name"`
	Pdfile string `json:"pdfile"`
}

type ProfileStorageI interface {
	GetStatisticYear(ctx context.Context, year, userid string) (map[string][]Statistic, error)
	GetStatisticWMY(ctx context.Context, period, userid string) ([]*Statistic, error)
	GetBadge(ctx context.Context, userid string) ([]*Badge, int64, error)
	GetUser(ctx context.Context, username string) (*ProfileUser, error)
	GetCertificate(ctx context.Context, user_id string) ([]*Certificate, error)
}
