INSERT INTO admins (email) VALUES ('azimjon8253@gmail.com');

INSERT INTO users (id, name, username, bio, birth_day, email, password, avatar, coint, score, refresh_token)
VALUES
    ('423e4567-e89b-12d3-a456-426614174004', 'Emily Brown', 'emilyb', 'Passionate chef exploring new culinary horizons.', '1995-03-08', 'emilyb@example.com', '$2a$14$pz9Nimb0eNF/4BwYwrF9m.CVLrL6YeK.tFWV3vMsFgds0oBMhwFRq', 'asrlan.jprq.app/media/image/240ed90a-0610-46f1-8e4f-1978d3ddc988.jpg', 180, 1000, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJvZmZiZWs1QGdtYWlsLmNvbSJ9.rFtJOyLUD4Oi3KXYn3FfZQiNloD9K2rF8a9liQf4o0A'),
    ('223e4567-e89b-12d3-a456-426614174002', 'Alice Smith', 'alicesmith', 'Marketing professional with a flair for creativity.', '1985-06-15', 'alicesmith@example.com', '$2a$14$pz9Nimb0eNF/4BwYwrF9m.CVLrL6YeK.tFWV3vMsFgds0oBMhwFRq', 'asrlan.jprq.app/media/image/bbdbe01e-c2af-4407-93c1-f54deeb2625f.jpg', 150, 900, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJvZmZiZWs1QGdtYWlsLmNvbSJ9.rFtJOyLUD4Oi3KXYn3FfZQiNloD9K2rF8a9liQf4o0A'),
    ('678e9012-e89b-12d3-a456-426614174006', 'Tony Alexson', 'tonyme', 'Tech geek and startup enthusiast. My motto is Never Give Up', '1998-04-18', 'offbek5@gmail.com', '$2a$14$pz9Nimb0eNF/4BwYwrF9m.CVLrL6YeK.tFWV3vMsFgds0oBMhwFRq', 'asrlan.jprq.app/media/image/71cf7dc2-48af-4e8e-a3f3-d0711925ab51.jpg', 180, 800, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJvZmZiZWs1QGdtYWlsLmNvbSJ9.rFtJOyLUD4Oi3KXYn3FfZQiNloD9K2rF8a9liQf4o0A'),
    ('8a22ae56-d927-11ee-90e4-d8bbc174b998', 'Davron Nuriddinov', 'davronchik', 'Passionate about technology and coding.', '2003-05-15', 'nuriddinovdavron2003@gmail.com', '$2a$14$pz9Nimb0eNF/4BwYwrF9m.CVLrL6YeK.tFWV3vMsFgds0oBMhwFRq', 'asrlan.jprq.app/media/image/9337160e-89d3-4c08-9eba-0ba73103f605.jpg', 100, 1500, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJvZmZiZWs1QGdtYWlsLmNvbSJ9.rFtJOyLUD4Oi3KXYn3FfZQiNloD9K2rF8a9liQf4o0A'),
    ('a23d35b3-afb0-4e6d-9229-7c011f0e6441', 'Azimjon Khudoyberdiyev', 'azimjon', 'Frontend dev at Asrlan and React master', '2004-03-08', 'azimjon8253@gmail.com', '$2a$14$pz9Nimb0eNF/4BwYwrF9m.CVLrL6YeK.tFWV3vMsFgds0oBMhwFRq', '', 180, 1000, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJvZmZiZWs1QGdtYWlsLmNvbSJ9.rFtJOyLUD4Oi3KXYn3FfZQiNloD9K2rF8a9liQf4o0A');

INSERT INTO badges (name, badge_date, badge_type, picture) VALUES
    ('Star Performer', '2024-04-01', 'month', 'asrlan.jprq.app/media/images/07dd9973-0300-4725-a40e-fcd48d9e3ba0.png'),
    ('Community Contributor', '2024-01-20', 'extra', 'asrlan.jprq.app/media/images/d0d62fe2-8540-4df4-ba9f-493cc241348b.png'),
    ('Innovator of the Month', '2024-03-05', 'month', 'asrlan.jprq.app/media/images/4a053a83-7cfc-4d53-916b-0e3033eaa056.png'),
    ('Super User', '2024-02-01', 'extra', 'asrlan.jprq.app/media/images/9142cfd4-be08-4ec1-a50e-e1cb58fbdf90.png'),
    ('Top Supporter', '2024-01-10', 'month', 'asrlan.jprq.app/media/images/91614e50-baf2-4c0d-b1a7-456718e7d34c.png');

INSERT INTO user_badge (user_id, badge_id) VALUES
    ('8a22ae56-d927-11ee-90e4-d8bbc174b998', 1),
    ('8a22ae56-d927-11ee-90e4-d8bbc174b998', 2),
    ('8a22ae56-d927-11ee-90e4-d8bbc174b998', 3),
    ('8a22ae56-d927-11ee-90e4-d8bbc174b998', 4),
    ('8a22ae56-d927-11ee-90e4-d8bbc174b998', 5),
    ('678e9012-e89b-12d3-a456-426614174006', 1),
    ('678e9012-e89b-12d3-a456-426614174006', 3),
    ('678e9012-e89b-12d3-a456-426614174006', 5),
    ('223e4567-e89b-12d3-a456-426614174002', 4),
    ('223e4567-e89b-12d3-a456-426614174002', 5),
    ('423e4567-e89b-12d3-a456-426614174004', 1);

-- Inserting mock data into the socials table
INSERT INTO socials (location_name, location_url, education_name, education_url, telegram_name, telegram_url, twitter_name, twitter_url, instagram_name, instagram_url, youtube_name, youtube_url, linkedin_name, linkedin_url, website_name, website_url, user_id)
VALUES 
('New York City', 'https://example.com/nyc', 'Harvard University', 'https://example.com/harvard', 'mytelegram', 'https://t.me/mytelegram', 'mytwitter', 'https://twitter.com/mytwitter', 'myinstagram', 'https://www.instagram.com/myinstagram', 'myyoutube', 'https://www.youtube.com/myyoutube', 'John Doe', 'https://www.linkedin.com/in/johndoe', 'Personal Website', 'https://www.johndoe.com', '423e4567-e89b-12d3-a456-426614174004'),
('Los Angeles', 'https://example.com/la', 'Stanford University', 'https://example.com/stanford', 'mytelegram', 'https://t.me/mytelegram', 'mytwitter', 'https://twitter.com/mytwitter', 'myinstagram', 'https://www.instagram.com/myinstagram', 'myyoutube', 'https://www.youtube.com/myyoutube', 'Jane Smith', 'https://www.linkedin.com/in/janesmith', 'Personal Blog', 'https://www.janesmithblog.com', '223e4567-e89b-12d3-a456-426614174002'),
('Chicago', 'https://example.com/chicago', 'MIT', 'https://example.com/mit', 'mytelegram', 'https://t.me/mytelegram', 'mytwitter', 'https://twitter.com/mytwitter', 'myinstagram', 'https://www.instagram.com/myinstagram', 'myyoutube', 'https://www.youtube.com/myyoutube', 'Robert Johnson', 'https://www.linkedin.com/in/robertjohnson', 'Portfolio', 'https://www.robertportfolio.com', '678e9012-e89b-12d3-a456-426614174006'),
('San Francisco', 'https://example.com/sf', 'University of California', 'https://example.com/uc', 'mytelegram', 'https://t.me/mytelegram', 'mytwitter', 'https://twitter.com/mytwitter', 'myinstagram', 'https://www.instagram.com/myinstagram', 'myyoutube', 'https://www.youtube.com/myyoutube', 'Emily Williams', 'https://www.linkedin.com/in/emilywilliams', 'Personal Site', 'https://www.emilywebsite.com', '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
('Seattle', 'https://example.com/seattle', 'University of Washington', 'https://example.com/uw', 'mytelegram', 'https://t.me/mytelegram', 'mytwitter', 'https://twitter.com/mytwitter', 'myinstagram', 'https://www.instagram.com/myinstagram', 'myyoutube', 'https://www.youtube.com/myyoutube', 'Michael Brown', 'https://www.linkedin.com/in/michaelbrown', 'Professional Portfolio', 'https://www.michaelportfolio.com', 'a23d35b3-afb0-4e6d-9229-7c011f0e6441');



INSERT INTO activitys (day, score, user_id) VALUES
    ('2024-01-05', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-01-10', 50, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-01-15', 30, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-01-20', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-01-25', 30, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-02-01', 50, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-02-05', 20, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-02-10', 30, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-02-15', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-02-20', 50, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-02-25', 30, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-03-01', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-03-05', 30, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-03-10', 50, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-03-15', 20, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-03-20', 30, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-03-25', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-03-30', 50, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-04-05', 30, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-04-10', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-04-20', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-04-25', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-04-30', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-05-01', 60, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-05-05', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-05-10', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-05-15', 90, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-05-20', 100, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-05-25', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-05-30', 40, '8a22ae56-d927-11ee-90e4-d8bbc174b998');
    
INSERT INTO activitys (day, score, user_id) VALUES
    ('2024-02-01', 50, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-02-05', 20, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-02-10', 30, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-02-15', 40, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-02-20', 50, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-02-25', 30, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-03-01', 40, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-03-05', 30, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-03-10', 50, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-03-15', 20, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-03-20', 30, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-03-25', 40, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-03-30', 50, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-04-05', 30, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-04-10', 40, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-04-20', 40, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-04-25', 40, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-04-30', 40, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-05-01', 60, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-05-05', 40, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-05-10', 40, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-05-15', 90, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-05-20', 100, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-05-25', 40, '678e9012-e89b-12d3-a456-426614174006'),
    ('2024-05-30', 40, '678e9012-e89b-12d3-a456-426614174006');

INSERT INTO activitys (day, score, user_id) VALUES
    ('2024-03-01', 40, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-03-05', 30, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-03-10', 50, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-03-15', 20, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-03-20', 30, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-03-25', 40, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-03-30', 50, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-04-05', 30, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-04-10', 40, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-04-20', 40, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-04-25', 40, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-04-30', 40, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-05-01', 60, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-05-05', 40, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-05-10', 40, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-05-15', 90, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-05-20', 100, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-05-25', 40, '223e4567-e89b-12d3-a456-426614174002'),
    ('2024-05-30', 40, '223e4567-e89b-12d3-a456-426614174002');

INSERT INTO activitys (day, score, user_id) VALUES
    ('2024-04-05', 30, '423e4567-e89b-12d3-a456-426614174004'),
    ('2024-04-10', 40, '423e4567-e89b-12d3-a456-426614174004'),
    ('2024-04-20', 40, '423e4567-e89b-12d3-a456-426614174004'),
    ('2024-04-25', 40, '423e4567-e89b-12d3-a456-426614174004'),
    ('2024-04-30', 40, '423e4567-e89b-12d3-a456-426614174004'),
    ('2024-05-01', 60, '423e4567-e89b-12d3-a456-426614174004'),
    ('2024-05-05', 40, '423e4567-e89b-12d3-a456-426614174004'),
    ('2024-05-10', 40, '423e4567-e89b-12d3-a456-426614174004'),
    ('2024-05-15', 90, '423e4567-e89b-12d3-a456-426614174004'),
    ('2024-05-20', 100, '423e4567-e89b-12d3-a456-426614174004'),
    ('2024-05-25', 40, '423e4567-e89b-12d3-a456-426614174004'),
    ('2024-05-30', 40, '423e4567-e89b-12d3-a456-426614174004');


INSERT INTO languages (name, picture) VALUES ('English', 'asrlan.jprq.app/media/image/flags/us.png');

INSERT INTO levels (name, language_id) VALUES ('Beginner', 1);

INSERT INTO topics (name, level_id) VALUES
    ('Alphabet | Greetings and Introductions', 1),
    ('Everyday Activities', 1),
    ('Numbers and Counting', 1),
    ('Family and Relationships', 1),
    ('Colors and Shapes', 1),
    ('Weather', 1),
    ('Days of the Week and Months', 1),
    ('Food and cooking methods', 1);


INSERT INTO lessons (name, topic_id) VALUES
    ('English alphabet', 1),
    ('Basic greetings', 1),
    ('Quiz vocabularys', 1),
    ('Present simple and to be', 1),
    ('Introducing yourself', 1),
    ('Asking and responding to "How are you?"', 1),
    ('Common phrases for small talk', 1),
    ('Formal and informal greetings', 1),
    ('Meeting someone for the first time', 1),
    ('Daily routines', 2),
    ('Morning and evening activities', 2),
    ('Household chores', 2),
    ('Personal hygiene', 2),
    ('Getting dressed', 2),
    ('Cooking and meal preparation', 2),
    ('Shopping for groceries', 2),
    ('Using public transportation', 2),
    ('Free time and leisure activities', 2),
    ('Expressing likes and dislikes', 2),
    ('Counting numbers', 3),
    ('Phone numbers', 3),
    ('Asking age', 3),
    ('Comunicate with numbers', 3),
    ('Roles within a family', 4),
    ('Family vocabularys', 4),
    ('Family traditions and customs', 4),
    ('Communication within families', 4),
    ('Parent-child relationships', 4),
    ('Introduction to colors', 5),
    ('Color vocabulary', 5),
    ('Color mixing', 5),
    ('Basic shapes', 5),
    ('Shapes vocabulary', 5),
    ('Colored shapes', 5),
    ('Weather patterns', 6),
    ('Weather-related vocabulary', 6),
    ('Climate types', 6),
    ('Seasonal weather changes', 6),
    ('Extreme weather events', 6),
    ('Days of the week', 7),
    ('Months of the year', 7),
    ('Calendar Basics', 7),
    ('Seasons and weather patterns', 7),
    ('Time measurement', 7),
    ('Time-related vocabulary', 7),
    ('Types of food', 8),
    ('Food vocabulary', 8),
    ('Cooking Techniques', 8),
    ('Cooking Techniques vocabulary', 8),
    ('Healthy Eating Habits', 8),
    ('Stuffs of kitchen vocabulary', 8);

INSERT INTO contents (lesson_id, gentype, title, text_data) VALUES
    (1, 2, 'Xarf | Letter Aa', 'Aa [ eɪ ]'),
    (1, 2, 'Xarf | Letter Bb', 'Bb [ biː ]'),
    (1, 2, 'Xarf | Letter Cc', 'Cc [ siː ]'),
    (1, 2, 'Xarf | Letter Dd', 'Dd [ diː ]'),
    (1, 2, 'Xarf | Letter Ee', 'Ee [ iː ]'),
    (1, 2, 'Xarf | Letter Ff', 'Ff [ ɛf ]'),
    (1, 2, 'Xarf | Letter Gg', 'Gg [ dʒiː ]'),
    (1, 2, 'Xarf | Letter Hh', 'Hh [ eɪtʃ ]'),
    (1, 2, 'Xarf | Letter Ii', 'Ii [ aɪ ]'),
    (1, 2, 'Xarf | Letter Jj', 'Jj [ dʒeɪ ]'),
    (1, 2, 'Xarf | Letter Kk', 'Kk [ keɪ ]'),
    (1, 2, 'Xarf | Letter Ll', 'Ll [ ɛl ]'),
    (1, 2, 'Xarf | Letter Mm', 'Mm [ ɛm ]'),
    (1, 2, 'Xarf | Letter Nn', 'Nn [ ɛn ]'),
    (1, 2, 'Xarf | Letter Oo', 'Oo [ oʊ ]'),
    (1, 2, 'Xarf | Letter Pp', 'Pp [ piː ]'),
    (1, 2, 'Xarf | Letter Qq', 'Qq [ kjuː ]'),
    (1, 2, 'Xarf | Letter Rr', 'Rr [ ɑr ]'),
    (1, 2, 'Xarf | Letter Ss', 'Ss [ ɛs ]'),
    (1, 2, 'Xarf | Letter Tt', 'Tt [ tiː ]'),
    (1, 2, 'Xarf | Letter Uu', 'Uu [ juː ]'),
    (1, 2, 'Xarf | Letter Vv', 'Vv [ viː ]'),
    (1, 2, 'Xarf | Letter Ww', 'Ww [ ˈdʌbljuː ]'),
    (1, 2, 'Xarf | Letter Xx', 'Xx [ ɛks ]'),
    (1, 2, 'Xarf | Letter Yy', 'Yy [ waɪ ]'),
    (1, 2, 'Xarf | Letter Zz', 'Zz [ zɛd ]');

INSERT INTO content_files (content_id, sound_data, image_data) VALUES 
    (1, 'asrlan.jprq.app/media/sound/letters/a.mp3', 'asrlan.jprq.app/media/image/letters/apple.png'),
    (2, 'asrlan.jprq.app/media/sound/letters/b.mp3', 'asrlan.jprq.app/media/image/letters/book.png'),
    (3, 'asrlan.jprq.app/media/sound/letters/c.mp3', 'asrlan.jprq.app/media/image/letters/car.png'),
    (4, 'asrlan.jprq.app/media/sound/letters/d.mp3', 'asrlan.jprq.app/media/image/letters/door.png'),
    (5, 'asrlan.jprq.app/media/sound/letters/e.mp3', 'asrlan.jprq.app/media/image/letters/egg.png'),
    (6, 'asrlan.jprq.app/media/sound/letters/f.mp3', 'asrlan.jprq.app/media/image/letters/flower.png'),
    (7, 'asrlan.jprq.app/media/sound/letters/g.mp3', 'asrlan.jprq.app/media/image/letters/gift.png'),
    (8, 'asrlan.jprq.app/media/sound/letters/h.mp3', 'asrlan.jprq.app/media/image/letters/house.png'),
    (9, 'asrlan.jprq.app/media/sound/letters/i.mp3', 'asrlan.jprq.app/media/image/letters/ice_cream.png'),
    (10, 'asrlan.jprq.app/media/sound/letters/j.mp3', 'asrlan.jprq.app/media/image/letters/juice.png'),
    (11, 'asrlan.jprq.app/media/sound/letters/k.mp3', 'asrlan.jprq.app/media/image/letters/king.png'),
    (12, 'asrlan.jprq.app/media/sound/letters/l.mp3', 'asrlan.jprq.app/media/image/letters/leaf.png'),
    (13, 'asrlan.jprq.app/media/sound/letters/m.mp3', 'asrlan.jprq.app/media/image/letters/milk.png'),
    (14, 'asrlan.jprq.app/media/sound/letters/n.mp3', 'asrlan.jprq.app/media/image/letters/notebook.png'),
    (15, 'asrlan.jprq.app/media/sound/letters/o.mp3', 'asrlan.jprq.app/media/image/letters/ocean.png'),
    (16, 'asrlan.jprq.app/media/sound/letters/p.mp3', 'asrlan.jprq.app/media/image/letters/pizza.png'),
    (17, 'asrlan.jprq.app/media/sound/letters/q.mp3', 'asrlan.jprq.app/media/image/letters/question_mark.png'),
    (18, 'asrlan.jprq.app/media/sound/letters/r.mp3', 'asrlan.jprq.app/media/image/letters/rainycloud.png'),
    (19, 'asrlan.jprq.app/media/sound/letters/s.mp3', 'asrlan.jprq.app/media/image/letters/sun.png'),
    (20, 'asrlan.jprq.app/media/sound/letters/t.mp3', 'asrlan.jprq.app/media/image/letters/tree.png'),
    (21, 'asrlan.jprq.app/media/sound/letters/u.mp3', 'asrlan.jprq.app/media/image/letters/umbrella.png'),
    (22, 'asrlan.jprq.app/media/sound/letters/v.mp3', 'asrlan.jprq.app/media/image/letters/volcano.png'),
    (23, 'asrlan.jprq.app/media/sound/letters/w.mp3', 'asrlan.jprq.app/media/image/letters/window.png'),
    (24, 'asrlan.jprq.app/media/sound/letters/x.mp3', 'asrlan.jprq.app/media/image/letters/x-ray.png'),
    (25, 'asrlan.jprq.app/media/sound/letters/y.mp3', 'asrlan.jprq.app/media/image/letters/yacht.png'),
    (26, 'asrlan.jprq.app/media/sound/letters/z.mp3', 'asrlan.jprq.app/media/image/letters/zero.png');

INSERT INTO contents (lesson_id, gentype, title, text_data) VALUES 
    (2, 1, 'Odam bilan salomlashish', 'Hello - Salom'),
    (2, 1, 'Qanday qilib xayrlashish', 'Goodbye - Xayr'),
    (2, 1, 'Ertalab kimgadir salom berish uchun', 'Good morning - Hayrli tong'),
    (2, 1, 'Peshin vaqtida kimgadir salom berish uchun', 'Good afternoon - Hayrli kun'),
    (2, 1, 'Kechqurun odamlar bilan salomlashish', 'Good evening - Hayrli kech'),
    (2, 1, 'Birovning xolatini bilish uchun', 'How are you? - Qalaysiz?'),
    (2, 1, 'Biror kishini birinchi marta uchratganingizda', 'Nice to meet you - Tanishganimdan xursandman'),
    (2, 1, 'Minnatdorchilik bildirish', 'Thank you - Rahmat'),
    (2, 1, 'Muloyimlik bilan birovning etiborini jalb qilish', 'Excuse me - Kechirasiz');

INSERT INTO contents (lesson_id, gentype, title, correct_answer) VALUES 
    (3, 4, 'Qaysi biri A', 1),
    (3, 4, 'Qaysi biri B', 2),
    (3, 4, 'Qaysi biri C', 3),
    (3, 4, 'Qaysi biri D', 1),
    (3, 4, 'Qaysi biri E', 2);

INSERT INTO content_files (content_id, image_data) VALUES 
    (36, 'asrlan.jprq.app/media/image/letters/apple.png'),
    (36, 'asrlan.jprq.app/media/image/letters/book.png'),
    (36, 'asrlan.jprq.app/media/image/letters/car.png'),
    (37, 'asrlan.jprq.app/media/image/letters/door.png'),
    (37, 'asrlan.jprq.app/media/image/letters/book.png'),
    (37, 'asrlan.jprq.app/media/image/letters/flower.png'),
    (38, 'asrlan.jprq.app/media/image/letters/gift.png'),
    (38, 'asrlan.jprq.app/media/image/letters/house.png'),
    (38, 'asrlan.jprq.app/media/image/letters/car.png'),
    (39, 'asrlan.jprq.app/media/image/letters/door.png'),
    (39, 'asrlan.jprq.app/media/image/letters/king.png'),
    (39, 'asrlan.jprq.app/media/image/letters/leaf.png'),
    (40, 'asrlan.jprq.app/media/image/letters/milk.png'),
    (40, 'asrlan.jprq.app/media/image/letters/egg.png'),
    (40, 'asrlan.jprq.app/media/image/letters/ocean.png');

INSERT INTO contents (lesson_id, gentype, title) VALUES 
    (4, 3, 'To bega misollar');

INSERT INTO content_files (content_id, image_data) VALUES 
    (41, 'asrlan.jprq.app/media/image/989e8d2b-a65c-4a98-b197-3f11e630aecc.jpg');

INSERT INTO contents (lesson_id, gentype, title, text_data) VALUES 
    (4, 1, 'To bega misollar', 'I am a student - Men talabaman\nHe (She) is a student - U talaba\nIt is a cat - U mushuk\nWe are students - Biz talabamiz\nYou are students - Sizlar talabasiz\nThey are students - Ular talaba');

INSERT INTO contents (lesson_id, gentype, title, question, text_data, arr_text, correct_answer) VALUES 
    (5, 5, 'To`g`ri so`zni belgilang', 'u yigit', 'He is', ARRAY['Boy', 'Girl', 'Book'], 1),
    (5, 5, 'To`g`ri so`zni belgilang', 'u mushuk', 'It is', ARRAY['Hat', 'Cat', 'Book'], 2),
    (5, 5, 'To`g`ri so`zni belgilang', 'u olma', 'It is', ARRAY['Apple', 'Banana', 'Door'], 2);

INSERT INTO content_files (content_id, image_data) VALUES
    (43, 'asrlan.jprq.app/media/image/e6c2e1f6-3b21-452b-8e3b-aabe0b3f3942.png'),
    (44, 'asrlan.jprq.app/media/image/ffae9b37-53a0-41fa-a218-2ec155aa926a.png'),
    (45, 'asrlan.jprq.app/media/image/736b4d92-8c72-480b-a3b2-6440770dc038.png');

INSERT INTO contents (lesson_id, gentype, title, question, arr_text, correct_answer) VALUES 
    (6, 6, 'To`g`ri so`zni belgilang', 'Tuz', ARRAY['Bread', 'Book', 'Salt'], 3),
    (6, 6, 'To`g`ri so`zni belgilang', 'Mushuk', ARRAY['Cat', 'Apple', 'Book'], 1),
    (6, 6, 'To`g`ri so`zni belgilang', 'Olma', ARRAY['Banana', 'Apple', 'Window'], 2),
    (6, 6, 'To`g`ri so`zni belgilang', 'Mashina', ARRAY['Car', 'House', 'Salt'], 1),
    (6, 6, 'To`g`ri so`zni belgilang', 'Sut', ARRAY['Pizza', 'Tree', 'Milk'], 3),
    (6, 6, 'To`g`ri so`zni belgilang', 'Soyobon', ARRAY['Leaf', 'Umbrella', 'Car'], 2);

INSERT INTO contents (lesson_id, gentype, title, text_data) VALUES
    (7, 1, 'And / Or', 'and = va\nor = yoki\nAnd ga misollar:\ncat and dog = mushuk va kuchuk\nbread and salt = non va tuz\nOr ga misollar:\ncat or dog = mushuk yoki kuchuk\nbread or salt = non yoki tuz');

INSERT INTO contents (lesson_id, gentype, title, question, arr_text, text_data) VALUES 
    (7, 7, 'To`g`ri javobni belgilang', 'Tuz yoki non', ARRAY['Bread', 'or', 'and', 'Book', 'Salt'], 'Salt or bread'),
    (7, 7, 'To`g`ri javobni belgilang', 'Non va soyobon', ARRAY['Cat', 'or', 'and', 'Apple', 'Book'], 'Bread and umbrella'),
    (7, 7, 'To`g`ri javobni belgilang', 'Mashina va Kitob', ARRAY['Banana', 'or', 'and', 'Apple', 'Window'], 'Car and book'),
    (7, 7, 'To`g`ri javobni belgilang', 'Pitsa yoki Non', ARRAY['Car', 'or', 'and', 'House', 'Salt'], 'Pizza or bread'),
    (7, 7, 'To`g`ri javobni belgilang', 'Daraxt va Quyosh', ARRAY['Pizza', 'or', 'and', 'Tree', 'Milk'], 'Tree and sun'),
    (7, 7, 'To`g`ri javobni belgilang', 'Uy va Sut', ARRAY['Leaf', 'or', 'and', 'Umbrella', 'Car'], 'House and milk');

INSERT INTO contents (lesson_id, gentype, title, arr_text, correct_answer) VALUES 
    (8, 8, 'Nimani eshitgingiz?', ARRAY['And', 'Or'], 2),
    (8, 8, 'Nimani eshitgingiz?', ARRAY['And', 'Or'], 1),
    (8, 8, 'Nimani eshitgingiz?', ARRAY['And', 'Cat', 'House'], 3),
    (8, 8, 'Nimani eshitgingiz?', ARRAY['Cat', 'Leaf', 'Window'], 1),
    (8, 8, 'Nimani eshitgingiz?', ARRAY['Ice cream', 'Pizza', 'Apple'], 3);

INSERT INTO content_files (content_id, sound_data) VALUES
    (59, 'asrlan.jprq.app/media/sound/b3fb91c4-0ed1-42cd-8af7-bcd5e933ffc7.mp3'), -- voise or
    (60, 'asrlan.jprq.app/media/sound/8cf14e60-9528-4762-81f5-a4290d8a1827.mp3'), -- voise and
    (61, 'asrlan.jprq.app/media/sound/8e6c35ee-e4d7-4720-9ee8-1e7f84b88aa2.mp3'), -- voise house
    (62, 'asrlan.jprq.app/media/sound/d8b961b4-af8d-416b-a129-4242faf4ba89.mp3'), -- voise cat
    (63, 'asrlan.jprq.app/media/sound/181d4bf2-4b53-4368-b53c-084929f4c7c0.mp3'); -- voise apple