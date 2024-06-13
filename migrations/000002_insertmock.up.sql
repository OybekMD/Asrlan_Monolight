
INSERT INTO languages (name, picture) VALUES ('English', 'asrlan.jprq.app/media/mdata/languages/us.png');
INSERT INTO languages (name, picture) VALUES ('Russian', 'asrlan.jprq.app/media/mdata/languages/ru.png');
INSERT INTO languages (name, picture) VALUES ('Arabic', 'asrlan.jprq.app/media/mdata/languages/sa.png');

INSERT INTO levels (name, real_level, picture, language_id) VALUES ('Beginner', 1, 'asrlan.jprq.app/media/mdata/levels/beginner.png', 1);
INSERT INTO levels (name, real_level, picture, language_id) VALUES ('Elementary', 2, 'asrlan.jprq.app/media/mdata/levels/elementary.png', 1);
INSERT INTO levels (name, real_level, picture, language_id) VALUES ('Pre-intermediate', 3, 'asrlan.jprq.app/media/mdata/levels/preintermidiet.png', 1);

INSERT INTO topics (name, level_id) VALUES
    ('Alphabet and Self-introduction | alifbo va O`zini tanishtirish', 1),
    ('Numbers and time | Raqamlar va vaqt', 1),
    ('Daily routines | Kundalik tartiblar', 1);
    -- ('Family and friends | Oila va do`stlar', 1),
    -- ('Food and drinks | Taom va ichimliklar', 1),
    -- ('Shopping | Xarid qilish', 1),
    -- ('Weather | Ob-xavo', 1),
    -- ('At school | Maktabda', 1),
    -- ('Hobbies and interests | Odatlar va qiziqishlar', 1),
    -- ('Travel and transportation | Sayohat va transport', 1);

-- E education include Vocabulary
-- Q quiz include Exersize
INSERT INTO lessons (name, lesson_type, topic_id) VALUES
    ('English alphabet | Ingliz alifbosi', 'V', 1), --done
    ('Vocabulary: Self-Introduction | Lug`at: O`zini tanishtirish', 'V', 1), --done
    ('Grammar: To be (am, is, are) | Grammatika: bo`lmoq (am, is, are)', 'G', 1), --done
    ('Exercise: Introducing yourself to a partner. | Mashq: o`zingizni sherik bilan tanishtirish', 'E', 1),
    ('Vocabulary: Personal information | Lug`at: shaxsiy ma`lumotlarni', 'V', 1),
    ('Grammar: Question forms using to be | Grammatika: to be dan foydalanadigan savol shakllari', 'G', 1),
    ('Exercise. Information questions | Mashq qilish. ma`lumotlarga oid savollar', 'E', 1),
    ('Exercise: Overall vocabulary: | Mashq: Umumiy lug`at', 'E', 1),
    ('Exercise: Overall Grammar | Mashq: Umumiy grammatika', 'E', 1),

     ('Vocabulary: Numbers 1-100 | Lug`at: Raqamlar 1-100', 'V', 2),
    ('Grammar: Using numbers in sentences| Grammatika: Gaplarda raqamlardan foydalanish', 'G', 2),
    ('Exercise: Practice saying and writing numbers | Mashq: raqamlarni aytish va yozishni mashq qiling', 'E', 2),
    ('Vocabulary: Time | Lug`at: Vaqt', 'V', 2),
    ('Grammar: Asking and telling the time | Grammatika: vaqtni so`rash va aytish', 'G', 2),
    ('Exercise: Practice asking and telling the time | Mashq: sherik bilan vaqtni so`rash va aytishni', 'E', 2),
    ('Exercise: Overall vocabulary | Mashq: Umumiy lug`at', 'E', 2),
    ('Exercise: Overall Grammar | Mashq: Umumiy grammatika', 'E', 2),

    ('Vocabulary: Daily Activities | Lug`at: Kundalik harakatlar', 'V', 3),
    ('Grammar: Present Simple tense for routines | Grammatika: Muntazam ishlar uchun Hozirgi oddiy zamon', 'G', 3),
    ('Exercise: Describe your daily routine | Mashq: kundalik tartibingizni tasvirlab bering', 'E', 3),
    ('Vocabulary: Talking About Frequency | Lug`at: Takrorlanishlar haqida gapirish', 'V', 3),
    ('Grammar: Adverbs of frequency | Grammatika: Chastota qo`shimchalari', 'G', 3);



-- English alphabet | Ingliz alifbosi
INSERT INTO contents (lesson_id, gentype, title, text_data) VALUES
    (1, 2, 'Xarf Aa: Apple | Olma', 'Aa [ eɪ ]'),
    (1, 2, 'Xarf Bb: Book | Kitob', 'Bb [ biː ]'),
    (1, 2, 'Xarf Cc: Car | Mashina', 'Cc [ siː ]'),
    (1, 2, 'Xarf Dd: Door | Eshik', 'Dd [ diː ]'),
    (1, 2, 'Xarf Ee: Egg | Tuxum', 'Ee [ iː ]'),
    (1, 2, 'Xarf Ff: Flower | Gul', 'Ff [ ɛf ]'),
    (1, 2, 'Xarf Gg: Gift | Sovg`a', 'Gg [ dʒiː ]'),
    (1, 2, 'Xarf Hh: House | Uy', 'Hh [ eɪtʃ ]'),
    (1, 2, 'Xarf Ii: Ice cream | Muzqaymoq', 'Ii [ aɪ ]'),
    (1, 2, 'Xarf Jj: Juice | Ichimlik', 'Jj [ dʒeɪ ]'),
    (1, 2, 'Xarf Kk: King | Podishox', 'Kk [ keɪ ]'),
    (1, 2, 'Xarf Ll: Lead | Barik yoki yaproq', 'Ll [ ɛl ]'),
    (1, 2, 'Xarf Mm: Milk | Sut', 'Mm [ ɛm ]'),
    (1, 2, 'Xarf Nn: Notebook | Daftar', 'Nn [ ɛn ]'),
    (1, 2, 'Xarf Oo: Ocean | Dengiz', 'Oo [ oʊ ]'),
    (1, 2, 'Xarf Pp: Pizza | Pitsa', 'Pp [ piː ]'),
    (1, 2, 'Xarf Qq: Question mark | So`roq belgisi', 'Qq [ kjuː ]'),
    (1, 2, 'Xarf Rr: Rain | Yomg`ir', 'Rr [ ɑr ]'),
    (1, 2, 'Xarf Ss: Sun | Quyosh', 'Ss [ ɛs ]'),
    (1, 2, 'Xarf Tt: Tree | Daraxt', 'Tt [ tiː ]'),
    (1, 2, 'Xarf Uu: Umbrella | Soyabon', 'Uu [ juː ]'),
    (1, 2, 'Xarf Vv: Voclano | Vulqon', 'Vv [ viː ]'),
    (1, 2, 'Xarf Ww: Window | Deraza', 'Ww [ ˈdʌbljuː ]'),
    (1, 2, 'Xarf Xx: X-ray | Rengen', 'Xx [ ɛks ]'),
    (1, 2, 'Xarf Yy: Yatch | Yaxta', 'Yy [ waɪ ]'),
    (1, 2, 'Xarf Zz: Zero | No`l', 'Zz [ zɛd ]');

INSERT INTO content_files (content_id, sound_data, image_data) VALUES 
    (1, 'asrlan.jprq.app/media/sound/letters/a.mp3', 'asrlan.jprq.app/media/mdata/objects/apple.png'),
    (2, 'asrlan.jprq.app/media/sound/letters/b.mp3', 'asrlan.jprq.app/media/mdata/objects/book.png'),
    (3, 'asrlan.jprq.app/media/sound/letters/c.mp3', 'asrlan.jprq.app/media/mdata/objects/car.png'),
    (4, 'asrlan.jprq.app/media/sound/letters/d.mp3', 'asrlan.jprq.app/media/mdata/objects/door.png'),
    (5, 'asrlan.jprq.app/media/sound/letters/e.mp3', 'asrlan.jprq.app/media/mdata/objects/egg.png'),
    (6, 'asrlan.jprq.app/media/sound/letters/f.mp3', 'asrlan.jprq.app/media/mdata/objects/flower.png'),
    (7, 'asrlan.jprq.app/media/sound/letters/g.mp3', 'asrlan.jprq.app/media/mdata/objects/gift.png'),
    (8, 'asrlan.jprq.app/media/sound/letters/h.mp3', 'asrlan.jprq.app/media/mdata/objects/house.png'),
    (9, 'asrlan.jprq.app/media/sound/letters/i.mp3', 'asrlan.jprq.app/media/mdata/objects/ice_cream.png'),
    (10, 'asrlan.jprq.app/media/sound/letters/j.mp3', 'asrlan.jprq.app/media/mdata/objects/juice.png'),
    (11, 'asrlan.jprq.app/media/sound/letters/k.mp3', 'asrlan.jprq.app/media/mdata/objects/king.png'),
    (12, 'asrlan.jprq.app/media/sound/letters/l.mp3', 'asrlan.jprq.app/media/mdata/objects/leaf.png'),
    (13, 'asrlan.jprq.app/media/sound/letters/m.mp3', 'asrlan.jprq.app/media/mdata/objects/milk.png'),
    (14, 'asrlan.jprq.app/media/sound/letters/n.mp3', 'asrlan.jprq.app/media/mdata/objects/notebook.png'),
    (15, 'asrlan.jprq.app/media/sound/letters/o.mp3', 'asrlan.jprq.app/media/mdata/objects/ocean.png'),
    (16, 'asrlan.jprq.app/media/sound/letters/p.mp3', 'asrlan.jprq.app/media/mdata/objects/pizza.png'),
    (17, 'asrlan.jprq.app/media/sound/letters/q.mp3', 'asrlan.jprq.app/media/mdata/objects/question_mark.png'),
    (18, 'asrlan.jprq.app/media/sound/letters/r.mp3', 'asrlan.jprq.app/media/mdata/objects/rainycloud.png'),
    (19, 'asrlan.jprq.app/media/sound/letters/s.mp3', 'asrlan.jprq.app/media/mdata/objects/sun.png'),
    (20, 'asrlan.jprq.app/media/sound/letters/t.mp3', 'asrlan.jprq.app/media/mdata/objects/tree.png'),
    (21, 'asrlan.jprq.app/media/sound/letters/u.mp3', 'asrlan.jprq.app/media/mdata/objects/umbrella.png'),
    (22, 'asrlan.jprq.app/media/sound/letters/v.mp3', 'asrlan.jprq.app/media/mdata/objects/volcano.png'),
    (23, 'asrlan.jprq.app/media/sound/letters/w.mp3', 'asrlan.jprq.app/media/mdata/objects/window.png'),
    (24, 'asrlan.jprq.app/media/sound/letters/x.mp3', 'asrlan.jprq.app/media/mdata/objects/x-ray.png'),
    (25, 'asrlan.jprq.app/media/sound/letters/y.mp3', 'asrlan.jprq.app/media/mdata/objects/yacht.png'),
    (26, 'asrlan.jprq.app/media/sound/letters/z.mp3', 'asrlan.jprq.app/media/mdata/objects/zero.png');

-- Vocabulary: Self-Introduction and Some stuffs | Lug`at: O`zini tanishtirish va Ba`zi buyumlar
INSERT INTO contents (lesson_id, gentype, title, text_data) VALUES
    (2, 1, 'Odam bilan salomlashish', 'Hello - Salom'),
    (2, 1, 'Qanday qilib xayirlashish', 'Goodbye - Xayr'),

    (2, 2, 'Ertalab kimgadir salom berish uchun', 'Good morning - Hayrli tong'),
    (2, 2, 'Peshin vaqtida kimgadir salom berish uchun', 'Good afternoon - Hayrli kun'),
    (2, 2, 'Kechqurun odamlar bilan salomlashish', 'Good evening - Hayrli kech'),

    (2, 1, 'Birovning xolatini bilish uchun', 'How are you? - Qalaysiz?'),
    (2, 1, 'Biror kishini birinchi marta uchratganingizda', 'Nice to meet you - Tanishganimdan xursandman'),
    (2, 1, 'Minnatdorchilik bildirish', 'Thank you - Rahmat'),
    (2, 1, 'Muloyimlik bilan birovning etiborini jalb qilish', 'Excuse me - Kechirasiz');

INSERT INTO content_files (content_id, sound_data, image_data) VALUES 
    (29, 'asrlan.jprq.app/media/sound/good_morning', 'asrlan.jprq.app/media/mdata/objects/Good_morning.jpg'),
    (30, 'asrlan.jprq.app/media/sound/good_afternoon', 'asrlan.jprq.app/media/mdata/objects/Good_afternoon.jpg'),
    (31, 'asrlan.jprq.app/media/sound/good_evening', 'asrlan.jprq.app/media/mdata/objects/Good_evening.jpg');


-- Grammar: To be (am, is, are) | Grammatika: bo`lmoq (am, is, are)
INSERT INTO contents (lesson_id, gentype, title, text_data) VALUES
    (3, 1, 'To Be: Present Simple | Bo`lmoq: Hozirgi zamon', 'The present simple form of "to be" is used to describe permanent or long-lasting situations. Example: He is a doctor | "To be" ning hozirgi oddiy shakli doimiy yoki uzoq davom etadigan vaziyatlarni tasvirlash uchun ishlatiladi. Misol: U shifokor');

INSERT INTO contents (lesson_id, gentype, title) VALUES
    (3, 3, 'To Be: Examples for Present Simple | Bo`lmoq: Hozirgi zamon misollar');

INSERT INTO content_files (content_id, image_data) VALUES 
    (37, 'asrlan.jprq.app/media/mdata/objects/boyps.jpg');

INSERT INTO contents (lesson_id, gentype, title, text_data) VALUES
    (3, 1, 'To Be: Present Simple | Bo`lmoq: Hozirgi zamon', 'I`m a doctor | Men doktorman \n Bu gapimizda bilishimiz mumkinki bu avvaldan to hozirgi \n vaqtga qadat bo`layotgan uchun buni\nHozirgi zamon deya olamiz`'),
    (3, 1, 'To Be: Present Simple | Bo`lmoq: Hozirgi zamon', 'Biz yana bilishimi kerak bo`gan narsa bu (to be)lar\n Bular (am, is, are) ularning maxsus ishlatiladigan joyi mavjud\nI am\nHe is\nShe is\nIt is\nThey are\nWe are`'),
    (3, 1, 'To Be: Examples for Present Simple | Bo`lmoq: Hozirgi zamon misollar', 'He is Teacher = U o`qituvchi\nJamshit is Student = Jamshit o`quvchi\nWe are programmers = Bizlar dasturchilarmiz\nThey are workers = Ular ishchilar');


-- Exercise: Introducing yourself to a partner. | Mashq: o`zingizni sherik bilan tanishtirish
INSERT INTO contents (lesson_id, gentype, title, correct_answer) VALUES 
    (4, 4, 'Qaysi rasm "Hayrli tong"ni ifodalaydi?', 2),
    (4, 4, 'Qaysi rasm "Hayrli kun"ni ifodalaydi?', 4),
    (4, 4, 'Qaysi rasm "Hayrli kech"ni ifodalaydi?', 1);

INSERT INTO content_files (content_id, image_data) VALUES 
    (41, 'asrlan.jprq.app/media/mdata/objects/apple.png'),
    (41, 'asrlan.jprq.app/media/mdata/objects/Good_morning.jpg'),
    (41, 'asrlan.jprq.app/media/mdata/objects/car.png'),
    (41, 'asrlan.jprq.app/media/mdata/objects/door.png'),

    (42, 'asrlan.jprq.app/media/mdata/objects/book.png'),
    (42, 'asrlan.jprq.app/media/mdata/objects/flower.png'),
    (42, 'asrlan.jprq.app/media/mdata/objects/Good_morning.jpg'),
    (42, 'asrlan.jprq.app/media/mdata/objects/Good_afternoon.jpg'),

    (43, 'asrlan.jprq.app/media/mdata/objects/Good_evening.jpg'),
    (43, 'asrlan.jprq.app/media/mdata/objects/door.png'),
    (43, 'asrlan.jprq.app/media/mdata/objects/king.png'),
    (43, 'asrlan.jprq.app/media/mdata/objects/ocean.png');




-- Personal information | Lug`at: shaxsiy ma`lumotlarni
INSERT INTO contents (lesson_id, gentype, title, text_data) VALUES 
(3, 1, 'Ismni so`rash', 'What is your name? - Ismingiz nima?'),
(3, 1, 'Ismni so`ragan insonga javob berish', 'My name is Tony - Mening ismim Tony'),
(3, 1, 'Yoshni so`rash', 'How old are you? - Yoshingiz nechida?'),
(3, 1, 'Yoshni so`ragan insonga javob berish', 'I`m 20 years old - Men 20 yoshman'),
(3, 1, 'Kasbni so`rash', 'What do you do? - Siz nima ish qilasiz?'),
(3, 1, 'Kasbni so`ragan insonga javob berish', 'I`m a teacher - Men o`qituvchiman'),
(3, 1, 'Telefon raqamini so`rash', 'What is your phone number? - Telefon raqamingiz nima?'),
(3, 1, 'Telefon so`ragan insonga javob berish', 'My phone number is +998110091234 - Mening telfon raqamim +998110091234'),
(3, 1, 'Tug`ilgan joyni so`rash', 'Where are you from? - Siz qayerdansiz?'),
(3, 1, 'Tug`ilgan joyni so`ragan insonga javob berish', 'I`m from Uzbekiston - Men O`zbekistondanman');










INSERT INTO admins (email) VALUES ('azimjon8253@gmail.com');

INSERT INTO users (id, name, username, bio, birth_day, email, password, avatar, coint, score, refresh_token)
VALUES
    ('423e4567-e89b-12d3-a456-426614174004', 'Emily Brown', 'emilyb', 'Passionate chef exploring new culinary horizons.', '1995-03-08', 'emilyb@example.com', '$2a$14$pz9Nimb0eNF/4BwYwrF9m.CVLrL6YeK.tFWV3vMsFgds0oBMhwFRq', 'asrlan.jprq.app/media/mdata/240ed90a-0610-46f1-8e4f-1978d3ddc988.jpg', 180, 1000, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJvZmZiZWs1QGdtYWlsLmNvbSJ9.rFtJOyLUD4Oi3KXYn3FfZQiNloD9K2rF8a9liQf4o0A'),
    ('223e4567-e89b-12d3-a456-426614174002', 'Alice Smith', 'alicesmith', 'Marketing professional with a flair for creativity.', '1985-06-15', 'alicesmith@example.com', '$2a$14$pz9Nimb0eNF/4BwYwrF9m.CVLrL6YeK.tFWV3vMsFgds0oBMhwFRq', 'asrlan.jprq.app/media/mdata/bbdbe01e-c2af-4407-93c1-f54deeb2625f.jpg', 150, 900, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJvZmZiZWs1QGdtYWlsLmNvbSJ9.rFtJOyLUD4Oi3KXYn3FfZQiNloD9K2rF8a9liQf4o0A'),
    ('678e9012-e89b-12d3-a456-426614174006', 'Tony Alexson', 'tonyme', 'Tech geek and startup enthusiast. My motto is Never Give Up', '1998-04-18', 'offbek5@gmail.com', '$2a$14$pz9Nimb0eNF/4BwYwrF9m.CVLrL6YeK.tFWV3vMsFgds0oBMhwFRq', 'asrlan.jprq.app/media/mdata/71cf7dc2-48af-4e8e-a3f3-d0711925ab51.jpg', 180, 800, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJvZmZiZWs1QGdtYWlsLmNvbSJ9.rFtJOyLUD4Oi3KXYn3FfZQiNloD9K2rF8a9liQf4o0A'),
    ('8a22ae56-d927-11ee-90e4-d8bbc174b998', 'Davron Nuriddinov', 'davronchik', 'Passionate about technology and coding.', '2003-05-15', 'nuriddinovdavron2003@gmail.com', '$2a$14$pz9Nimb0eNF/4BwYwrF9m.CVLrL6YeK.tFWV3vMsFgds0oBMhwFRq', 'asrlan.jprq.app/media/mdata/9337160e-89d3-4c08-9eba-0ba73103f605.jpg', 100, 1500, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJvZmZiZWs1QGdtYWlsLmNvbSJ9.rFtJOyLUD4Oi3KXYn3FfZQiNloD9K2rF8a9liQf4o0A'),
    ('a23d35b3-afb0-4e6d-9229-7c011f0e6441', 'Azimjon Khudoyberdiyev', 'azimjon', 'Frontend dev at Asrlan and React master', '2004-03-08', 'azimjon8253@gmail.com', '$2a$14$pz9Nimb0eNF/4BwYwrF9m.CVLrL6YeK.tFWV3vMsFgds0oBMhwFRq', '', 180, 1000, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJvZmZiZWs1QGdtYWlsLmNvbSJ9.rFtJOyLUD4Oi3KXYn3FfZQiNloD9K2rF8a9liQf4o0A');

INSERT INTO badges (name, badge_date, badge_type, picture) VALUES
    ('Star Performer', '2024-04-01', 'month', 'asrlan.jprq.app/media/badges/2024_1.png'),
    ('Community Contributor', '2024-01-20', 'extra', 'asrlan.jprq.app/media/badges/2024_2.png'),
    ('Innovator of the Month', '2024-03-05', 'month', 'asrlan.jprq.app/media/badges/2024_3.png'),
    ('Super User', '2024-02-01', 'extra', 'asrlan.jprq.app/media/badges/2024_4.png'),
    ('Top Supporter', '2024-01-10', 'month', 'asrlan.jprq.app/media/badges/2024_5.png');

INSERT INTO badges (name, badge_date, badge_type, picture) VALUES
    ('Legend', '2024-01-10', 'extra', 'asrlan.jprq.app/media/mdata/rankbadge/legend.png'),
    ('Hero', '2024-01-10', 'extra', 'asrlan.jprq.app/media/mdata/rankbadge/hero.png'),
    ('Master', '2024-01-10', 'extra', 'asrlan.jprq.app/media/mdata/rankbadge/master.png'),
    ('Experts', '2024-01-10', 'extra', 'asrlan.jprq.app/media/mdata/rankbadge/experts.png'),
    ('Ninja', '2024-01-10', 'extra', 'asrlan.jprq.app/media/mdata/rankbadge/ninja.png'),
    ('Knight', '2024-01-10', 'extra', 'asrlan.jprq.app/media/mdata/rankbadge/knight.png'),
    ('Gladiator', '2024-01-10', 'extra', 'asrlan.jprq.app/media/mdata/rankbadge/gladiator.png'),
    ('Warrior', '2024-01-10', 'extra', 'asrlan.jprq.app/media/mdata/rankbadge/warrior.png'),
    ('Solider', '2024-01-10', 'extra', 'asrlan.jprq.app/media/mdata/rankbadge/solider.png'),
    ('Starter', '2024-01-10', 'extra', 'asrlan.jprq.app/media/mdata/rankbadge/starter.png');


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



INSERT INTO user_language (user_id, language_id) VALUES
    ('423e4567-e89b-12d3-a456-426614174004', 1),
    ('223e4567-e89b-12d3-a456-426614174002', 1),
    ('678e9012-e89b-12d3-a456-426614174006', 1),
    ('8a22ae56-d927-11ee-90e4-d8bbc174b998', 1);

INSERT INTO user_level (user_id, level_id) VALUES
    ('423e4567-e89b-12d3-a456-426614174004', 1),
    ('223e4567-e89b-12d3-a456-426614174002', 2),
    ('678e9012-e89b-12d3-a456-426614174006', 1),
    ('8a22ae56-d927-11ee-90e4-d8bbc174b998', 1);


INSERT INTO user_lesson (score, user_id, lesson_id, created_at)
VALUES
    (100, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 1, '2024-01-17' ),
    (100, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 2, '2024-01-17' ),
    (100, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 3, '2024-01-17' ),
    (76, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 4, '2024-01-17' ),
    (65, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 5, '2024-01-17' ),
    (50, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 6, '2024-01-17' ),
    (40, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 7, '2024-01-17' ),
    (50, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 8, '2024-01-17' ),
    (20, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 9, '2024-01-17' ),
    (45, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 10, '2024-01-17'),
    (87, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 11, '2024-02-17'),
    (10, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 12, '2024-02-17'),
    (10, '8a22ae56-d927-11ee-90e4-d8bbc174b998', 13, '2024-02-17');




INSERT INTO activitys (created_at, score, user_id) VALUES
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
    ('2024-05-16', 90, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-05-18', 90, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-05-19', 90, '8a22ae56-d927-11ee-90e4-d8bbc174b998'),
    ('2024-05-20', 100, '8a22ae56-d927-11ee-90e4-d8bbc174b998');
    
INSERT INTO activitys (created_at, score, user_id) VALUES
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

INSERT INTO activitys (created_at, score, user_id) VALUES
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

INSERT INTO activitys (created_at, score, user_id) VALUES
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

INSERT INTO books (name, picture, book_file, level_id) VALUES
    ('Free English Grammar', 'asrlan.jprq.app/media/image/75c785e9-369a-4969-ac8f-e3af2ee2832d.png', 'asrlan.jprq.app/media/pdf/Free_English_Grammar_(_PDFDrive_)_(1).pdf', 1);


