-- IMPORTANT: Заполнены не все таблицы, поскольку незаполненные таблицы должны заполняться непосредственно администратором платформы из приложения

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)

-- Started on 2025-03-19 11:08:58 +07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3543 (class 1262 OID 27766)
-- Name: vanessa_company; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "vanessa_company" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru_RU.UTF-8';


\connect "vanessa_company"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3537 (class 0 OID 27936)
-- Dependencies: 246
-- Data for Name: animal_type; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3513 (class 0 OID 27799)
-- Dependencies: 222
-- Data for Name: auth; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (1, 'miroslav_1984', '(!4yNhCbQL') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (2, 'selivanjakushev', 'XOR7aLaN)W') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (3, 'moisevolkov', 'Ihqkq7Ls!9') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (4, 'voronovkonon', 'Pf0ED8ki*W') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (5, 'natalja84', 'r$_L6QOuvw') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (6, 'marija1986', 'oM)3XKmqe%') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (7, 'tlihacheva', '+o0gTvPfP#') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (8, 'silvestr_14', 'ly%4BZoodE') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (9, 'bobrovsvjatoslav', 'C#5JrEG9gZ') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (10, 'ratmir1983', '(Yvj1Fw8LU') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (11, 'fedotovkliment', '1*35(GU9_n') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (12, 'veniamintihonov', 'Wfn4Onnu_6') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (13, 'kazimirsamolov', '4sU+2HNo*+') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (14, 'isidor_2004', '0aYA7kBn(k') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (15, 'lavr1980', 'C27KRNrKR^') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (16, 'nikonovvjacheslav', 'UjSEFsJN%4') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (17, 'apollon97', '^*7gGHFcBp') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (18, 'vorontsovvlas', '8(I(Y9Yj)2') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (19, 'hlobanov', 'w7d0TGnb@V') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (20, 'xabramov', 'tfs385Ef_1') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (21, 'julian16', '*49X#fab)w') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (22, 'mitofan33', 'e#6zEPFmJ$') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (23, 'viktor1993', 'e3Mh7mnE$l') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (24, 'aleksandrkapustin', 'q_11n)otxN') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (25, 'lidija_48', 'N(CS1_Gs6F') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (26, 'kasjanfedoseev', '_2AJdr9kSQ') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (27, 'eduard_2003', '+J6Hzt#d1r') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (28, 'svetozar1976', 'Bh9TTOOi6_') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (29, 'kirill_2012', 'ko!3Q(+wv*') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (30, 'efimovhristofor', '^BAwBFMqq4') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (31, 'silvestr_2018', '@+m9nVvBg0') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (32, 'margarita24', '*$wcXhYz13') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (33, 'sbikova', '@38mThLba!') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (34, 'modest_2000', '&g6GsJp@h3') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (35, 'potapovavera', 'H3#Du)2s)4') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (36, 'olimpiada_73', ')C5FOGqf_!') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (37, 'qlavrentev', '7L2)RArs&e') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (38, 'ershovadam', 'Gjv!s0Mb_0') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (39, 'fade_56', '&_9G2jkMba') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (40, 'avgust2008', '#5^3BoOcXW') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (41, 'prokl94', '+11$IXL$*r') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (42, 'pantelemon_2017', '*@2XmScfG(') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (43, 'rogovadrian', 'MQdLSXSc$0') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (44, 'xbaranova', 'V6sqQUDv!q') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (45, 'moise1991', 'Vl8Xocijy@') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (46, 'noskovereme', 'hH3#2T^a7$') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (47, 'suhanovivan', '*n#d3Sder5') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (48, 'zikovamargarita', 'k#3VHUhCm@') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (49, 'voronovippolit', ')B40wO&q#%') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (50, 'mvlasova', '@3sGrfxgt5') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (51, 'dobroslav91', 'p18kGSpq&7') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (52, 'marfa_2018', '3q*iM5Uy&^') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (53, 'tatjana_13', '_3V5A3Ig@q') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (54, 'zuevavarvara', 'A(Fa+bir*0') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (55, 'dmitri1981', '+57NmJpTq*') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (56, 'polikarp_72', '!*_D7A)pe)') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (57, 'mark1990', 'm3PONQvh&^') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (58, 'kudrjavtsevanina', 'Ye4o&H3cx+') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (59, 'mihail78', '^W6+VxncHe') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (60, 'ezhuravleva', '!7Qd%nPQ3^') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (61, 'hmorozov', 'urn8Ck+lf(') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (62, 'irina33', 'MH7!Fk%d+s') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (63, 'agapkalinin', 'SVA4OsmX_3') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (64, 'bikovelizar', 'zB1)bKhC)J') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (65, 'potapovaoktjabrina', '%c1kY^h49B') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (66, 'mihail2002', '^FH9StpS8w') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (67, 'vafanasev', 'rH5UApKu+3') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (68, 'artemevjanuari', '@VsUWotk7x') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (69, 'filippovleonti', 'K^v5HerKAI') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (70, 'evgeni83', '#a3!kOJev!') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (71, 'ybobrova', '5adPVvz$*S') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (72, 'yshchukina', 'UsP7MwspQ*') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (73, 'tfedoseev', '+yNtDPs&3Z') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (74, 'terentevaagafja', 'BhK1aYXom@') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (75, 'gerasim_09', 'F*(72TKnh^') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (76, 'ratmir_34', '+%)(E5Ys%e') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (77, 'gremislavmuhin', '*L_U+ob89v') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (78, 'terentizhukov', '%@38AbVmtr') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (79, 'vatslavbeljakov', '(%5aO^Uc&J') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (80, 'tihon_2022', ')39!Iu&P!$') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (81, 'semen_41', 'lB#j7Afs!4') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (82, 'kuprijan03', '^JXYt0p6$9') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (83, 'pbirjukova', ')8_9Ygqdf)') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (84, 'maja1975', '%0ULBbott5') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (85, 'taras_1982', '*8ZcbIpN(9') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (86, 'mili_06', '+BED&ixl)1') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (87, 'egorovaekaterina', '#pRvXb8w6X') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (88, 'darja03', '##kW8Tzijp') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (89, 'avgust1979', 'M!w3PXp7DL') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (90, 'sila_1978', '+GG3C*Qm1i') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (91, 'azari37', 'y&VX5NIag#') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (92, 'borislavgordeev', '@7UM!kaj^q') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (93, 'nekrasovajulija', 'n4EgHkm7+l') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (94, 'ignatovanani', 'M2xI%hEi_K') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (95, 'krasilnikovpantelemon', 'qmzAydQs@3') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (96, 'pavel1999', '2)8DPjwW1G') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (97, 'nestor95', 'I!8Ic4^faz') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (98, 'bikovaalina', 'Q&W1fdQdfi') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (99, 'radim1985', 'qr1DcR6nU_') ON CONFLICT DO NOTHING;
INSERT INTO "public"."auth" ("IDAuth", "Login", "Password") VALUES (100, 'zchernova', '%1Shi1%7_T') ON CONFLICT DO NOTHING;


--
-- TOC entry 3507 (class 0 OID 27778)
-- Dependencies: 216
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."branches" ("IDBranch", "IDCity", "BranchName", "Address") VALUES (1, 10, 'Зимний иммунитет', 'Заводская 68') ON CONFLICT DO NOTHING;
INSERT INTO "public"."branches" ("IDBranch", "IDCity", "BranchName", "Address") VALUES (2, 9, 'Главный филиал', 'Невский проспект 4') ON CONFLICT DO NOTHING;
INSERT INTO "public"."branches" ("IDBranch", "IDCity", "BranchName", "Address") VALUES (3, 8, 'Пример здоровья', 'Ленина 23') ON CONFLICT DO NOTHING;
INSERT INTO "public"."branches" ("IDBranch", "IDCity", "BranchName", "Address") VALUES (4, 7, 'Екатерининская клиника', 'Ельцина 6') ON CONFLICT DO NOTHING;
INSERT INTO "public"."branches" ("IDBranch", "IDCity", "BranchName", "Address") VALUES (5, 6, 'Ванесса-Челябинск', 'Писателей 9') ON CONFLICT DO NOTHING;
INSERT INTO "public"."branches" ("IDBranch", "IDCity", "BranchName", "Address") VALUES (6, 5, 'Ванесса-Пермь', 'Речная 12') ON CONFLICT DO NOTHING;
INSERT INTO "public"."branches" ("IDBranch", "IDCity", "BranchName", "Address") VALUES (7, 4, 'Здоровые питомцы', 'Проходная 7') ON CONFLICT DO NOTHING;
INSERT INTO "public"."branches" ("IDBranch", "IDCity", "BranchName", "Address") VALUES (8, 3, 'Дом здоровья Ванессы', 'Линейная 36') ON CONFLICT DO NOTHING;
INSERT INTO "public"."branches" ("IDBranch", "IDCity", "BranchName", "Address") VALUES (9, 2, 'Оздоровительный центр', 'Железнодорожников 2') ON CONFLICT DO NOTHING;
INSERT INTO "public"."branches" ("IDBranch", "IDCity", "BranchName", "Address") VALUES (10, 1, 'Дом зверюшек', 'Чехова 38') ON CONFLICT DO NOTHING;


--
-- TOC entry 3529 (class 0 OID 27857)
-- Dependencies: 238
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."cities" ("IDCity", "Name") VALUES (1, 'Севастополь') ON CONFLICT DO NOTHING;
INSERT INTO "public"."cities" ("IDCity", "Name") VALUES (2, 'Сочи') ON CONFLICT DO NOTHING;
INSERT INTO "public"."cities" ("IDCity", "Name") VALUES (3, 'Адлер') ON CONFLICT DO NOTHING;
INSERT INTO "public"."cities" ("IDCity", "Name") VALUES (4, 'Красноярск') ON CONFLICT DO NOTHING;
INSERT INTO "public"."cities" ("IDCity", "Name") VALUES (5, 'Пермь') ON CONFLICT DO NOTHING;
INSERT INTO "public"."cities" ("IDCity", "Name") VALUES (6, 'Челябинск') ON CONFLICT DO NOTHING;
INSERT INTO "public"."cities" ("IDCity", "Name") VALUES (7, 'Екатеринбург') ON CONFLICT DO NOTHING;
INSERT INTO "public"."cities" ("IDCity", "Name") VALUES (8, 'Москва') ON CONFLICT DO NOTHING;
INSERT INTO "public"."cities" ("IDCity", "Name") VALUES (9, 'Санкт-Петербург') ON CONFLICT DO NOTHING;
INSERT INTO "public"."cities" ("IDCity", "Name") VALUES (10, 'Новосибирск') ON CONFLICT DO NOTHING;


--
-- TOC entry 3523 (class 0 OID 27836)
-- Dependencies: 232
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (3, 'Трофимов', 'Ефим', 'Августович', 'qzimin@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (5, 'Фокина', 'Зосима', 'Михайловна', 'kim_2006@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (6, 'Самсонов', 'Евстафий', 'Анисимович', 'mihe76@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (22, 'Воронцова', 'Аркадий', 'Демидович', 'ipati_59@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (1, 'Хохлов', 'Антон', 'Глебович', 'hohlov@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (2, 'Лыткин', 'Леонтий', 'Германович', 'lytkin_29@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (4, 'Антонов', 'Август', 'Владленович', 'antonovav@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (7, 'Борисова', 'Евгения', 'Аскольдовна', 'borisova@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (8, 'Юдина', 'Валерия', 'Георгиевна', 'yudina1974@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (9, 'Волков', 'Борислав', 'Владиславович', 'borislavvolkov@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (10, 'Мельников', 'Ярослав', 'Анатольевич', 'jaroslav88@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (11, 'Зиновьева', 'Мария', 'Гаврииловна', 'gurevanike@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (12, 'Галкин', 'Максим', 'Никифорович', 'kira81@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (13, 'Волков', 'Владимир', 'Эдуардович', 'guri12@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (14, 'Наумова', 'Юлия', 'Федосеевна', 'naumovilja@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (15, 'Яковлев', 'Олег', 'Ермолаевич', 'oleg2018@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (16, 'Кириллов', 'Феофан', 'Герасимович', 'kirillovfeofan@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (17, 'Демидова', 'Таисия', 'Тарасовна', 'demidova@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (18, 'Чернова', 'Елизавета', 'Леоновна', 'echernova@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (19, 'Грушин', 'Святослав', 'Авдеевич', 'cgrishin@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (20, 'Шубин', 'Станислав', 'Денисович', 'shubinstanislav@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (21, 'Рыбакова', 'Полина', 'Еремеевна', 'irakli_54@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (23, 'Киселев', 'Валерий', 'Тимурович', 'kiselevvaleri@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (24, 'Сильвестрова', 'Вера', 'Яновна', 'seliverstovaverjan@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (25, 'Аниткин', 'Арнольд', 'Давидович', 'anikita_07@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (26, 'Фадеева', 'Эвелина', 'Макаровна', 'fade_2002@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (27, 'Силин', 'Казимир', 'Викентьевич', 'kazimir78@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (28, 'Ильин', 'Игорь', 'Станиславович', 'igor_52@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (29, 'Куликов', 'Георгий', 'Сергеевич', 'georgikulikov@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (30, 'Гаврилина', 'Анастасия', 'Дмитриевна', 'gavrila_34@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (31, 'Блинова', 'Агафья', 'Филипповна', 'ablinova@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (32, 'Трофимов', 'Лаврентий', 'Святославович', 'trofimlavrentev@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (33, 'Селезнева', 'Людмила', 'Марковна', 'mselezneva@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (34, 'Анисимова', 'Юлия', 'Борисовна', 'anisimovajulija@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (35, 'Голубева', 'Карина', 'Ильинична', 'karisha@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (36, 'Стрелков', 'Бронислав', 'Романович', 'strelkov@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (37, 'Борисов', 'Аверкий', 'Елизарович', 'zborisova@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (38, 'Суханов', 'Савва', 'Георгиевич', 'olimpiada2002@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (39, 'Калашникова', 'Ирина', 'Игоревна', 'ikalashnikova@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (40, 'Маслов', 'Егор', 'Андреевич', 'maslovea@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (41, 'Мишин', 'Лев', 'Кузьмич', 'hmishin@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (42, 'Субботина', 'Вероника', 'Матвеевна', 'subbotinaveronika@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (43, 'Михеев', 'Ростислав', 'Ильясович', 'miheevrostislav@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (44, 'Щербакова', 'Мирослава', 'Леонидовна', 'shcherbakovamvrosi@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (45, 'Павлов', 'Илья', 'Матвеевич', 'iljapavlov@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (46, 'Кондратьев', 'Мина', 'Всеволодович', 'minakondratev@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (47, 'Лукина', 'Валерия', 'Винеаминовна', 'lukinavalerija@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (48, 'Дьячков', 'Эрнест', 'Егорович', 'ernest_2020@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (49, 'Владимиров', 'Христофор', 'Данилович', 'hristofor1978@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (50, 'Куприян', 'Адриан', 'Миронович', 'kuprijan_1975@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (51, 'Дмитриев', 'Леонид', 'Валерьянович', 'dmitrievferapont@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (52, 'Сорокина', 'Ирина', 'Валентиновна', 'irina_1999@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (53, 'Логинова', 'Рината', 'Геннадиевна', 'prov1990@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (54, 'Дементьева', 'Флора', 'Альбертовна', 'dementievaflora@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (55, 'Александров', 'Виссарион', 'Валерьянович', 'aleksandrovvissarion@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (56, 'Широких', 'Фома', 'Артёмович', 'foma_2010@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (57, 'Савельев', 'Епифан', 'Адрианович', 'savelev@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (58, 'Мясникова', 'Карина', 'Олеговна', 'mjasnikovkarl@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (59, 'Виноградова', 'Октябрина', 'Васильевна', 'oktjabrina55@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (60, 'Авдеева', 'Агата', 'Васильевна', 'agata61@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (61, 'Шаровалов', 'Валентин', 'Юлианович', 'sharovalov@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (62, 'Наумова', 'Юлия', 'Алексеевна', 'julija1980@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (63, 'Филатов', 'Христофор', 'Бориславович', 'hristoforfilatov@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (64, 'Никитин', 'Фёдор', 'Богданович', 'fadenikitin@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (65, 'Горшков', 'Лаврентий', 'Олегович', 'lavrusha14@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (66, 'Карпова', 'Юлиана', 'Матвеевна', 'uljan_1971@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (67, 'Климентьев', 'Остап', 'Федотович', 'kliment11@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (68, 'Агуреева', 'Ирина', 'Тимофеевна', 'agureva@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (69, 'Власов', 'Пётр', 'Олегович', 'petrvlasov@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (70, 'Дмитриев', 'Владилен', 'Ефимьевич', 'dmitri_2019@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (71, 'Моисеева', 'Светлана', 'Матвеевна', 'svetikmoiss@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (72, 'Костина', 'Зинаида', 'Егоровна', 'zinakostina@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (73, 'Кириллова', 'Элеонора', 'Матвеевна', 'isa1986@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (74, 'Одинцов', 'Матвей', 'Данилович', 'matve73@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (75, 'Волков', 'Лаврентий', 'Фомич', 'lavrenti1977@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (76, 'Савельев', 'Иосиф', 'Филиппович', 'iosif2002@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (77, 'Лихачев', 'Борислав', 'Терентьевич', 'borislav_01@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (78, 'Артемьев', 'Мстислав', 'Вячеславович', 'mstislav97@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (79, 'Савватеев', 'Кирилл', 'Фадеевич', 'savvati_40@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (80, 'Куликовский', 'Василий', 'Игоревич', 'kulikovvasili@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (81, 'Крылова', 'Агата', 'Олеговна', 'krilovaagata@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (82, 'Тарасов', 'Эдуард', 'Фадеевич', 'taras_2023@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (83, 'Степанова', 'Наталья', 'Захаровна', 'zakharovna567@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (84, 'Поляков', 'Игнатий', 'Антонович', 'ignati2004@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (85, 'Бобров', 'Николай', 'Венедиктович', 'boberkolya@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (86, 'Лобанов', 'Александр', 'Евсеевич', 'radim59@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (87, 'Калашникова', 'Сабрина', 'Матвеевна', 'kalashnikovsilanti@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (88, 'Горабачев', 'Виссарион', 'Эдвардович', 'gorbachevvissarion@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (89, 'Сафонова', 'Виктория', 'Антоновна', 'viktorin_2000@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (90, 'Антонов', 'Евстафий', 'Филиппович', 'antonovevstafi@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (91, 'Агафонова', 'Эмилия', 'Александровна', 'agafonovaemilija@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (92, 'Харитонов', 'Владислав', 'Алексеевич', 'vladislavharitonov@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (93, 'Агафонов', 'Емельян', 'Егорович', 'emeljan_81@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (94, 'Сидорова', 'Надежда', 'Олеговна', 'sidorovkonon@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (95, 'Игнатов', 'Пётр', 'Ярославович', 'petr10@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (96, 'Лучков', 'Дмитрий', 'Герасимович', 'luka_53@example.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (97, 'Игнабуров', 'Василий', 'Елизарович', 'ignatiburov@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (98, 'Ершова', 'Мирослава', 'Вадимовна', 'miroslavershov@example.net') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (99, 'Всеславов', 'Геннадий', 'Еремеевич', 'vseslav2025@example.org') ON CONFLICT DO NOTHING;
INSERT INTO "public"."clients" ("IDClient", "Surname", "Name", "Lastname", "Email") VALUES (100, 'Родионов', 'Дмитрий', 'Глебович', 'drodionov@example.org') ON CONFLICT DO NOTHING;


--
-- TOC entry 3517 (class 0 OID 27815)
-- Dependencies: 226
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3511 (class 0 OID 27792)
-- Dependencies: 220
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (1, 1, 5, 1, 'Евсеев', 'Степан', 'Ермолаевич', '5070141108', '+7 (750) 428-7449', 'anastasija1995.anatoli_79@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (2, 1, 4, 2, 'Шаров', 'Автоном', 'Федосьевич', '5012188076', '84864802248', 'kononkononov.julian2005@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (3, 1, 4, 3, 'Гусева', 'Акулина', 'Афанасьевна', '5063054800', '8 (949) 783-32-62', 'gromovlavrenti.sergeevizot@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (4, 1, 2, 4, 'Панфилова', 'Виктория', 'Рубеновна', '5076108493', '8 221 581 7375', 'ruben_1988.antonina_55@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (5, 1, 1, 5, 'Егорова', 'Галина', 'Леонидовна', '5034146946', '+73186791752', 'pankrati1973.blohinanonna@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (6, 1, 3, 6, 'Кудряшова', 'Евдокия', 'Руслановна', '5069357980', '8 009 796 13 14', 'nesterovavgust.ilarion_1990@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (7, 1, 3, 7, 'Терентьева', 'Прасковья', 'Алексеевна', '5094104680', '85141783308', 'izotaleksandrov.lfrolov@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (8, 1, 3, 8, 'Федорова', 'Олимпиада', 'Павловна', '5033175449', '+7 441 251 3456', 'rkolobov.timur89@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (9, 1, 3, 9, 'Аксенов', 'Олимпий', 'Изотович', '5044908769', '8 561 299 11 87', 'anikitanesterov.arefi_25@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (10, 1, 3, 10, 'Исаев', 'Трофим', 'Артёмович', '5036062927', '+78646338586', 'erofe1987.kulaginmilen@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (11, 2, 5, 11, 'Королева', 'Эмилия', 'Вячеславовна', '5016554189', '8 (635) 058-1546', 'naum74.nikanor35@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (12, 2, 4, 12, 'Некрасов', 'Агафон', 'Афанасьевич', '5082983980', '8 (556) 100-24-89', 'shirjaevsaveli.htihonova@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (13, 2, 4, 13, 'Щукин', 'Борислав', 'Ефимович', '5064237871', '+7 400 343 12 89', 'prokofi_05.bolshakovafevronija@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (14, 2, 2, 14, 'Шашков', 'Кирилл', 'Вячеславович', '5054061378', '80216190102', 'trofim_2011.zoja09@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (15, 2, 1, 15, 'Королев', 'Эрнест', 'Адамович', '5067902669', '+7 783 015 71 64', 'iosif_2017.belousovvatslav@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (16, 2, 3, 16, 'Максимов', 'Мартьян', 'Демьянович', '5074806540', '84217343543', 'kapitonvasilev.wdavidova@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (17, 2, 3, 17, 'Щербакова', 'Жанна', 'Харитоновна', '5046881675', '+77135260133', 'simonovtihon.beljakovkarl@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (18, 2, 3, 18, 'Суворова', 'Глафира', 'Аскольдовна', '5087783284', '8 (507) 793-24-13', 'mamontovamarija.makarovamilitsa@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (19, 2, 3, 19, 'Денисов', 'Гаврила', 'Валентинович', '5069663228', '+7 (838) 437-03-94', 'spiridon81.nkolesnikova@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (20, 2, 3, 20, 'Комиссарова', 'Наталья', 'Ивановна', '5056151356', '+7 (905) 150-59-74', 'viktor_83.bobrovaalla@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (21, 3, 5, 21, 'Жданов', 'Георгий', 'Антонович', '5051256136', '+7 (325) 705-2742', 'zikovfeliks.anike_86@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (22, 3, 4, 22, 'Кононова', 'Элеонора', 'Георгиевна', '5082244742', '8 (090) 783-1385', 'nikandr41.braginamarina@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (23, 3, 4, 23, 'Бобылев', 'Светозар', 'Гаврилович', '5095822411', '8 (502) 939-07-01', 'jgrigorev.aksenovasinklitikija@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (24, 3, 2, 24, 'Гордеев', 'Михей', 'Денисович', '5095394158', '+71754992322', 'fedosi1990.moiseevdenis@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (25, 3, 1, 25, 'Брагина', 'Фёкла', 'Эльдаровна', '5010919498', '+7 (154) 036-3370', 'florentindoronin.samsonovaolimpiada@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (26, 3, 3, 26, 'Коновалова', 'Анжелика', 'Степановна', '5010484459', '8 713 927 7749', 'nikanor_1997.zahar_2022@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (27, 3, 3, 27, 'Чернов', 'Мартын', 'Харитонович', '5070977932', '+7 (204) 245-12-90', 'seliverstovsimon.akulina_35@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (28, 3, 3, 28, 'Савельева', 'Евфросиния', 'Борисовна', '5086217528', '8 236 409 7646', 'minasitnikov.gordeevaolga@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (29, 3, 3, 29, 'Данилов', 'Нестор', 'Филимонович', '5032505441', '87202035112', 'arhipovanikita.aleksandr_32@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (30, 3, 3, 30, 'Назаров', 'Федосий', 'Арсенович', '5062705030', '+7 845 350 51 93', 'rjurik41.froldavidov@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (31, 4, 5, 31, 'Тихонова', 'Мария', 'Леонидовна', '5012718100', '8 (603) 833-00-09', 'kudrjashovaevdokija.prohor_1985@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (32, 4, 4, 32, 'Смирнов', 'Осип', 'Евсеевич', '5057850593', '8 179 679 9838', 'fokamedvedev.kudrjavtsevmina@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (33, 4, 4, 33, 'Лаврентьев', 'Феликс', 'Алексеевич', '5011963617', '87351836895', 'varfolome1971.velimirsolovev@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (34, 4, 2, 34, 'Савельева', 'Глафира', 'Артемовна', '5074970073', '8 (807) 583-84-44', 'polina2019.osip_2001@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (35, 4, 1, 35, 'Гурьева', 'Анастасия', 'Антоновна', '5076485863', '+7 (440) 165-7773', 'drozdovarseni.shubinjaropolk@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (36, 4, 3, 36, 'Гущина', 'Ульяна', 'Кирилловна', '5064719113', '+7 (455) 163-2876', 'bogdan_1973.anzhela12@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (37, 4, 3, 37, 'Корнилова', 'Марфа', 'Евгеньевна', '5042439990', '+7 670 455 3685', 'ipatirogov.milen1993@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (38, 4, 3, 38, 'Тимофеев', 'Потап', 'Трофимович', '5084667158', '8 397 846 2857', 'dementevfrol.zatsevapollinari@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (39, 4, 3, 39, 'Герасимова', 'Любовь', 'Святославовна', '5040685201', '+73555805183', 'averkievdokimov.kiselevantonin@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (40, 4, 3, 40, 'Сидорова', 'Наталья', 'Эдуардовна', '5041841472', '8 671 014 2938', 'nikita_27.kapiton1994@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (41, 5, 5, 41, 'Соколова', 'Варвара', 'Артемовна', '5034161341', '+7 182 765 83 01', 'vladlen_89.erofe2005@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (42, 5, 4, 42, 'Лебедев', 'Фома', 'Вилорович', '5071062200', '+7 242 366 8015', 'komarovviktorin.anike_1973@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (43, 5, 4, 43, 'Кошелев', 'Поликарп', 'Гавриилович', '5083785375', '8 (955) 334-6055', 'wlavrentev.stepan_1985@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (44, 5, 2, 44, 'Фомин', 'Автоном', 'Ефимович', '5023149050', '+7 (391) 714-55-21', 'pavlovstanimir.miheevaevdokija@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (45, 5, 1, 45, 'Блинова', 'Алла', 'Тимуровна', '5082635715', '85715337978', 'radovan_1992.guljaevaoktjabrina@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (46, 5, 3, 46, 'Кононов', 'Глеб', 'Дмитриевич', '5045359463', '8 653 088 55 81', 'smirnovakira.frodionova@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (47, 5, 3, 47, 'Титова', 'Нонна', 'Константиновна', '5044905958', '+7 585 385 92 00', 'yfedorov.viktor_40@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (48, 5, 3, 48, 'Ларионов', 'Антонин', 'Бориславович', '5055241746', '8 (585) 941-57-82', 'vsevolodkozlov.evfrosinija_79@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (49, 5, 3, 49, 'Голубев', 'Олег', 'Харлампович', '5019308428', '8 021 311 25 01', 'moiseevapelageja.konstantinovmechislav@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (50, 5, 3, 50, 'Третьякова', 'Октябрина', 'Кирилловна', '5025432989', '+7 472 823 06 90', 'anzhela_2003.ladislav80@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (51, 6, 5, 51, 'Ермаков', 'Амвросий', 'Демидович', '5023292452', '+7 (129) 323-51-59', 'adrian_70.izmailzimin@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (52, 6, 4, 52, 'Волкова', 'Зоя', 'Филипповна', '5069577100', '+7 (044) 446-3884', 'filimonlukin.fribakova@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (53, 6, 4, 53, 'Куликова', 'Любовь', 'Игоревна', '5053958527', '+7 (819) 884-28-71', 'leonidtrofimov.tverdislav_2020@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (54, 6, 2, 54, 'Белякова', 'Вероника', 'Даниловна', '5073634978', '+7 (932) 093-1176', 'samolovgerman.kir55@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (55, 6, 1, 55, 'Трофимова', 'Мария', 'Вениаминовна', '5022699274', '8 243 925 89 93', 'moisedjachkov.prov_66@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (56, 6, 3, 56, 'Нестеров', 'Мир', 'Игоревич', '5035741659', '+7 987 557 6672', 'seliverst_12.belozerovmodest@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (57, 6, 3, 57, 'Зуева', 'Юлия', 'Аскольдовна', '5070258777', '83519065804', 'haritonovtaras.shestakovaanna@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (58, 6, 3, 58, 'Агафонова', 'Алла', 'Анатольевна', '5034550649', '8 890 632 0734', 'radovan75.opahomov@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (59, 6, 3, 59, 'Капустина', 'Людмила', 'Ждановна', '5055590019', '8 (102) 527-40-03', 'osip1973.boris2023@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (60, 6, 3, 60, 'Власов', 'Панфил', 'Иосифович', '5034312712', '+7 903 332 63 26', 'milen_2016.dorofeevzinovi@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (61, 7, 5, 61, 'Соболев', 'Боян', 'Ильич', '5014552595', '8 291 022 7821', 'parfen22.nifont_2024@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (62, 7, 4, 62, 'Меркушев', 'Демьян', 'Эдгардович', '5078823460', '8 650 891 3466', 'evdokija44.samsonovmartjan@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (63, 7, 4, 63, 'Овчинников', 'Лонгин', 'Ефремович', '5081200149', '+7 (931) 072-9547', 'trofim_56.karpbeljakov@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (64, 7, 2, 64, 'Зиновьев', 'Гремислав', 'Якубович', '5093857405', '+7 (336) 729-22-47', 'martinovfedor.kazakovanatoli@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (65, 7, 1, 65, 'Борисов', 'Моисей', 'Алексеевич', '5069415871', '+77033346893', 'evfrosinija_30.ilarion2011@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (66, 7, 3, 66, 'Копылова', 'София', 'Олеговна', '5067494009', '+76100639942', 'klavdija_1975.prohorkotov@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (67, 7, 3, 67, 'Тетерин', 'Фрол', 'Гаврилович', '5036623624', '+7 712 561 60 48', 'igor97.trofimovgennadi@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (68, 7, 3, 68, 'Борисов', 'Мир', 'Дмитриевич', '5085663058', '8 541 113 4011', 'natan1978.davidovavera@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (69, 7, 3, 69, 'Чернова', 'Татьяна', 'Леоновна', '5057115625', '+7 932 427 2772', 'ljubosmisl14.gorbachevalekse@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (70, 7, 3, 70, 'Большакова', 'Лариса', 'Леонидовна', '5019797845', '88830069443', 'nkononov.bojan_37@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (71, 8, 5, 71, 'Сазонова', 'Вера', 'Архиповна', '5068551690', '+77577507942', 'efimovmilovan.kalashnikovterenti@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (72, 8, 4, 72, 'Савельев', 'Вениамин', 'Ильич', '5079177758', '+73257520634', 'noskovpavel.praskovja32@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (73, 8, 4, 73, 'Рожкова', 'Людмила', 'Рудольфовна', '5057904904', '8 (082) 247-70-35', 'komissarovamilitsa.nikitinradislav@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (74, 8, 2, 74, 'Фокин', 'Гаврила', 'Феофанович', '5096058915', '8 051 625 49 66', 'vladislav2000.nikonovaalevtina@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (75, 8, 1, 75, 'Тетерина', 'Ираида', 'Степановна', '5068702855', '88975047555', 'potapzinovev.ablohin@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (76, 8, 3, 76, 'Антонов', 'Эрнст', 'Абрамович', '5096567245', '+7 640 119 1202', 'ljubim1972.shubinvaleri@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (77, 8, 3, 77, 'Артемьев', 'Кондратий', 'Федотович', '5086852634', '+72690013519', 'lapintrifon.molchanovapolina@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (78, 8, 3, 78, 'Уварова', 'Феврония', 'Ивановна', '5026181739', '8 (722) 470-3420', 'pahom_40.innokentisisoev@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (79, 8, 3, 79, 'Филатова', 'Регина', 'Матвеевна', '5062120703', '+7 (202) 193-99-71', 'grigorevavgust.timur_1994@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (80, 8, 3, 80, 'Аксенов', 'Якуб', 'Зиновьевич', '5060097038', '8 (701) 982-5372', 'wlarionov.emil_2006@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (81, 9, 5, 81, 'Ефимова', 'Ия', 'Руслановна', '5040879066', '+74486582774', 'avtonom_1979.krilovvalerjan@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (82, 9, 4, 82, 'Никитина', 'Маргарита', 'Матвеевна', '5011758331', '8 (532) 816-05-49', 'anzhela_1980.lev_58@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (83, 9, 4, 83, 'Лапин', 'Ян', 'Викентьевич', '5079547860', '8 (357) 822-26-33', 'konstantinovspartak.anikebeljakov@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (84, 9, 2, 84, 'Горшкова', 'Ия', 'Артемовна', '5096703562', '+7 (163) 315-98-43', 'zosipova.kapustingostomisl@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (85, 9, 1, 85, 'Калинина', 'Юлия', 'Евгеньевна', '5067676702', '80406891059', 'ssitnikov.kulikovaivanna@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (86, 9, 3, 86, 'Белова', 'Ольга', 'Вениаминовна', '5053592555', '8 (263) 272-45-44', 'spiridon_14.olimpiada20@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (87, 9, 3, 87, 'Блинова', 'Василиса', 'Ефимовна', '5057608759', '8 942 179 5965', 'evdokimovalora.panfilovakira@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (88, 9, 3, 88, 'Рогов', 'Венедикт', 'Харлампович', '5078589226', '8 187 149 2743', 'leonti1997.vlasovostap@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (89, 9, 3, 89, 'Павлов', 'Исай', 'Фадеевич', '5041204755', '+7 (235) 431-92-84', 'selivan73.olimpi_52@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (90, 9, 3, 90, 'Пономарев', 'Спартак', 'Демьянович', '5072411277', '+7 (678) 783-0287', 'vsevolod2004.shchukinaakulina@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (91, 10, 5, 91, 'Макаров', 'Никифор', 'Брониславович', '5076436091', '+7 803 992 6861', 'mefodi_77.lukintit@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (92, 10, 4, 92, 'Архипова', 'Евгения', 'Станиславовна', '5039404614', '87222847745', 'rjabovaelizaveta.timofeevavalentina@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (93, 10, 4, 93, 'Лукина', 'Иванна', 'Анатольевна', '5025357272', '+7 (208) 221-0350', 'medvedevsamuil.dkalashnikov@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (94, 10, 2, 94, 'Лыткина', 'Октябрина', 'Викторовна', '5055308376', '+7 336 647 5156', 'knjazevanatalja.uvarovkornil@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (95, 10, 1, 95, 'Панфилова', 'Ольга', 'Руслановна', '5064967541', '88370808643', 'pahom57.jfrolova@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (96, 10, 3, 96, 'Анисимов', 'Евдоким', 'Ильич', '5047521445', '+7 (168) 316-9717', 'ipati27.dlihachev@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (97, 10, 3, 97, 'Кузнецов', 'Ермолай', 'Ааронович', '5054084291', '8 402 639 7902', 'dandreev.psitnikova@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (98, 10, 3, 98, 'Лебедева', 'Евфросиния', 'Павловна', '5050289195', '8 538 209 44 26', 'oktjabrina1984.nikitinfoka@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (99, 10, 3, 99, 'Шарапова', 'Галина', 'Альбертовна', '5038364509', '8 (961) 647-15-60', 'terentevamarfa.ruslan2016@vanessa.corp.com') ON CONFLICT DO NOTHING;
INSERT INTO "public"."employees" ("IDEmployee", "IDBranch", "IDPosition", "IDAuth", "Surname", "Name", "LastName", "PassportData", "PhoneNumber", "Email") VALUES (100, 10, 3, 100, 'Лихачев', 'Виктор', 'Федосьевич', '5091252314', '8 (327) 559-2331', 'danila2003.andronkoshelev@vanessa.corp.com') ON CONFLICT DO NOTHING;


--
-- TOC entry 3525 (class 0 OID 27843)
-- Dependencies: 234
-- Data for Name: online_orders; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3515 (class 0 OID 27806)
-- Dependencies: 224
-- Data for Name: patient_by_coupon; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3533 (class 0 OID 27871)
-- Dependencies: 242
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3535 (class 0 OID 27878)
-- Dependencies: 244
-- Data for Name: payments_methods; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."payments_methods" ("IDPaymentMethod", "Method") VALUES (1, 'Банковская карта                                  ') ON CONFLICT DO NOTHING;
INSERT INTO "public"."payments_methods" ("IDPaymentMethod", "Method") VALUES (2, 'Наличные                                          ') ON CONFLICT DO NOTHING;


--
-- TOC entry 3521 (class 0 OID 27829)
-- Dependencies: 230
-- Data for Name: pharmacy_products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (1, 'Амоксивет таблетки                                ', '850,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (2, 'ЦефтриВет раствор                                 ', '2 200,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (3, 'Энрофлокс 10% инъекция                            ', '1 500,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (4, 'Ивермек-Гель                                      ', '340,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (5, 'Гамавит капли                                     ', '670,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (6, 'Ветриммун таблетки                                ', '920,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (7, 'Тилозин-200 инъекция                              ', '1 800,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (8, 'Фармазин суспензия                                ', '450,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (9, 'Стрептоцид-Вет мазь                               ', '290,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (10, 'Гепатовет капсулы                                 ', '1 300,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (11, 'Антибио-Гель                                      ', '780,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (12, 'Вет-Иммуно раствор                                ', '2 100,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (13, 'Энрофлокс 5% таблетки                             ', '1 100,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (14, 'Ивермектин инъекция                               ', '950,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (15, 'Доксивет капсулы                                  ', '640,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (16, 'Ветаклав таблетки                                 ', '890,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (17, 'Цефавет суспензия                                 ', '1 750,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (18, 'Гентамицин-Вет мазь                               ', '410,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (19, 'Флунизол капли                                    ', '560,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (20, 'Метронидазол-Вет таблетки                         ', '320,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (21, 'Ветспирин раствор                                 ', '1 350,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (22, 'Азитро-Вет капсулы                                ', '1 980,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (23, 'Кетовет гель                                      ', '730,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (24, 'Левомицетин-Вет мазь                              ', '280,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (25, 'Тетрациклин-Вет таблетки                          ', '450,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (26, 'Ветримакс инъекция                                ', '1 600,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (27, 'Фенбендазол суспензия                             ', '620,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (28, 'Ампициллин-Вет капсулы                            ', '840,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (29, 'Энтеросгель-Вет                                   ', '390,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (30, 'Био-Йод мазь                                      ', '510,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (31, 'Вет-Детокс раствор                                ', '1 450,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (32, 'Ципрофлоксацин-Вет таблетки                       ', '920,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (33, 'Иммунофан инъекция                                ', '2 100,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (34, 'Гепатоджект капсулы                               ', '670,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (35, 'Вет-Анальгин таблетки                             ', '240,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (36, 'Римадил суспензия                                 ', '1 850,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (37, 'Дирофен гель                                      ', '590,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (38, 'Сульфадимезин-Вет мазь                            ', '330,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (39, 'Вет-Сорбент капсулы                               ', '780,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (40, 'Байтрил раствор                                   ', '1 520,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (41, 'Фуразолидон-Вет таблетки                          ', '410,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (42, 'Вет-Гастропротектор                               ', '890,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (43, 'Энроксил инъекция                                 ', '1 700,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (44, 'Клавулан-Вет капсулы                              ', '950,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (45, 'Вет-Витамин комплекс                              ', '640,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (46, 'Тилозин-50 суспензия                              ', '1 230,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (47, 'Амоксиклав-Вет таблетки                           ', '1 350,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (48, 'Ивермек-спрей                                     ', '720,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (49, 'Вет-Антисептик мазь                               ', '290,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (50, 'Цефотаксим-Вет инъекция                           ', '1 980,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (51, 'Гепатолек капсулы                                 ', '850,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (52, 'Вет-Пробиотик таблетки                            ', '560,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (53, 'Энтерофурил-Вет суспензия                         ', '1 120,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (54, 'Дексаметазон-Вет инъекция                         ', '760,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (55, 'Вет-Феррум гель                                   ', '430,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (56, 'Метоклопрамид-Вет таблетки                        ', '310,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (57, 'Вет-Антигистамин капли                            ', '670,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (58, 'Кетопрофен-Вет мазь                               ', '540,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (59, 'Азитромицин-Вет капсулы                           ', '920,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (60, 'Вет-Омез раствор                                  ', '1 450,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (61, 'Тиабендазол-Вет таблетки                          ', '380,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (62, 'Вет-Хондропротектор инъекция                      ', '2 100,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (63, 'Флуконазол-Вет капсулы                            ', '610,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (64, 'Вет-Анастетик спрей                               ', '890,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (65, 'Пенициллин-Вет суспензия                          ', '1 250,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (66, 'Вет-Диуретик таблетки                             ', '730,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (67, 'Лактофильтрум-Вет порошок                         ', '450,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (68, 'Вет-Антидепрессант капли                          ', '1 670,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (69, 'Циклоспорин-Вет мазь                              ', '980,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (70, 'Вет-Антибиотик инъекция                           ', '1 540,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (71, 'Вет-Гепарин раствор                               ', '1 320,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (72, 'Ацетилсалициловая кислота-Вет таблетки            ', '270,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (73, 'Вет-Имуноглобулин капсулы                         ', '1 850,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (74, 'Мирамистин-Вет спрей                              ', '490,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (75, 'Вет-Противовирусный гель                          ', '760,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (76, 'Димедрол-Вет инъекция                             ', '830,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (77, 'Вет-Антипаразит суспензия                         ', '1 120,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (78, 'Парацетамол-Вет таблетки                          ', '310,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (79, 'Вет-Ранозаживляющая мазь                          ', '590,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (80, 'Фурацилин-Вет раствор                             ', '440,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (81, 'Вет-Сердечный комплекс                            ', '1 680,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (82, 'Лоперамид-Вет капсулы                             ', '520,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (83, 'Вет-Противогрибковый спрей                        ', '910,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (84, 'Преднизолон-Вет инъекция                          ', '1 450,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (85, 'Вет-Антиоксидант таблетки                         ', '670,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (86, 'Бифидумбактерин-Вет порошок                       ', '380,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (87, 'Вет-Седативный гель                               ', '790,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (88, 'Атропин-Вет раствор                               ', '1 230,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (89, 'Вет-Жаропонижающий сироп                          ', '550,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (90, 'Цинковая мазь-Вет                                 ', '290,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (91, 'Вет-Противовоспалительный крем                    ', '680,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (92, 'Карсил-Вет капсулы                                ', '940,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (93, 'Вет-Антитромботический гель                       ', '1 150,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (94, 'Но-шпа-Вет инъекция                               ', '820,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (95, 'Вет-Витамин B12 таблетки                          ', '480,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (96, 'Линекс-Вет порошок                                ', '760,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (97, 'Вет-Обезболивающий пластырь                       ', '1 350,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (98, 'Хлоргексидин-Вет спрей                            ', '430,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (99, 'Вет-Антистресс капли                              ', '890,00 ₽') ON CONFLICT DO NOTHING;
INSERT INTO "public"."pharmacy_products" ("IDPharmacyProduct", "ProductName", "Price") VALUES (100, 'Эхинацея-Вет таблетки                             ', '620,00 ₽') ON CONFLICT DO NOTHING;


--
-- TOC entry 3527 (class 0 OID 27850)
-- Dependencies: 236
-- Data for Name: pickup_points; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."pickup_points" ("IDPickupPoints", "IDCity") VALUES (1, 1) ON CONFLICT DO NOTHING;
INSERT INTO "public"."pickup_points" ("IDPickupPoints", "IDCity") VALUES (2, 2) ON CONFLICT DO NOTHING;
INSERT INTO "public"."pickup_points" ("IDPickupPoints", "IDCity") VALUES (3, 3) ON CONFLICT DO NOTHING;
INSERT INTO "public"."pickup_points" ("IDPickupPoints", "IDCity") VALUES (4, 4) ON CONFLICT DO NOTHING;
INSERT INTO "public"."pickup_points" ("IDPickupPoints", "IDCity") VALUES (5, 5) ON CONFLICT DO NOTHING;
INSERT INTO "public"."pickup_points" ("IDPickupPoints", "IDCity") VALUES (6, 6) ON CONFLICT DO NOTHING;
INSERT INTO "public"."pickup_points" ("IDPickupPoints", "IDCity") VALUES (7, 7) ON CONFLICT DO NOTHING;
INSERT INTO "public"."pickup_points" ("IDPickupPoints", "IDCity") VALUES (8, 8) ON CONFLICT DO NOTHING;
INSERT INTO "public"."pickup_points" ("IDPickupPoints", "IDCity") VALUES (9, 9) ON CONFLICT DO NOTHING;
INSERT INTO "public"."pickup_points" ("IDPickupPoints", "IDCity") VALUES (10, 10) ON CONFLICT DO NOTHING;


--
-- TOC entry 3509 (class 0 OID 27785)
-- Dependencies: 218
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."positions" ("IDPosition", "PositionName") VALUES (1, 'Фармацевт-консультант') ON CONFLICT DO NOTHING;
INSERT INTO "public"."positions" ("IDPosition", "PositionName") VALUES (2, 'Бухгалтер') ON CONFLICT DO NOTHING;
INSERT INTO "public"."positions" ("IDPosition", "PositionName") VALUES (3, 'Врач-специалист') ON CONFLICT DO NOTHING;
INSERT INTO "public"."positions" ("IDPosition", "PositionName") VALUES (4, 'Дежурный врач приёмного отделения') ON CONFLICT DO NOTHING;
INSERT INTO "public"."positions" ("IDPosition", "PositionName") VALUES (5, 'Администратор внутр. учета') ON CONFLICT DO NOTHING;


--
-- TOC entry 3531 (class 0 OID 27864)
-- Dependencies: 240
-- Data for Name: salaries; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3519 (class 0 OID 27822)
-- Dependencies: 228
-- Data for Name: sale_of_pharmacy_products; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 245
-- Name: animal_type_IDAnimalType_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."animal_type_IDAnimalType_seq"', 1, false);


--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_IDAuth_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."auth_IDAuth_seq"', 100, true);


--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 215
-- Name: branches_IDBrabch_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."branches_IDBrabch_seq"', 10, true);


--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 237
-- Name: cities_IDCity_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."cities_IDCity_seq"', 10, true);


--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 231
-- Name: clinets_IDClient_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."clinets_IDClient_seq"', 100, true);


--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 225
-- Name: coupons_IDCoupon_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."coupons_IDCoupon_seq"', 1, false);


--
-- TOC entry 3567 (class 0 OID 0)
-- Dependencies: 219
-- Name: employees_IDEmployee_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."employees_IDEmployee_seq"', 288, true);


--
-- TOC entry 3568 (class 0 OID 0)
-- Dependencies: 233
-- Name: online_orders_IDOnlineOrder_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."online_orders_IDOnlineOrder_seq"', 1, false);


--
-- TOC entry 3569 (class 0 OID 0)
-- Dependencies: 223
-- Name: patient_by_coupon_IDReception_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."patient_by_coupon_IDReception_seq"', 1, false);


--
-- TOC entry 3570 (class 0 OID 0)
-- Dependencies: 241
-- Name: payments_IDPayment_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."payments_IDPayment_seq"', 1, false);


--
-- TOC entry 3571 (class 0 OID 0)
-- Dependencies: 243
-- Name: payments_methods_IDPaymentMethod_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."payments_methods_IDPaymentMethod_seq"', 2, true);


--
-- TOC entry 3572 (class 0 OID 0)
-- Dependencies: 229
-- Name: pharmacy_products_IDPharmacyProduct_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."pharmacy_products_IDPharmacyProduct_seq"', 1, false);


--
-- TOC entry 3573 (class 0 OID 0)
-- Dependencies: 235
-- Name: pickup_points_IDPickupPoints_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."pickup_points_IDPickupPoints_seq"', 10, true);


--
-- TOC entry 3574 (class 0 OID 0)
-- Dependencies: 217
-- Name: positions_IDPosition_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."positions_IDPosition_seq"', 6, true);


--
-- TOC entry 3575 (class 0 OID 0)
-- Dependencies: 239
-- Name: salaries_IDSalaries_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."salaries_IDSalaries_seq"', 1, false);


--
-- TOC entry 3576 (class 0 OID 0)
-- Dependencies: 227
-- Name: sale_of_pharmacy_products_IDSale_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"public"."sale_of_pharmacy_products_IDSale_seq"', 1, false);


-- Completed on 2025-03-19 11:08:58 +07

--
-- PostgreSQL database dump complete
--

