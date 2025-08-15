USE RevNet;

-- 1) Base tables with no dependencies

INSERT INTO Users
(Username, FirstName, MiddleName, LastName, Email, BirthDate, City, State, Country, Gender, Bio, ProfilePictureUrl, Role)
VALUES
('boostedjake', 'Jacob', 'Andrew', 'Carter', 'jacob.carter@example.com', '1992-07-19', 'San Diego', 'California', 'USA', 'Male', 'Weekend track days and turbo tinkerer.', 'https://example.com/avatars/boostedjake.jpg', 'Consumer'),
('gripqueen', 'Sophia', NULL, 'Nguyen', 'sophia.nguyen@example.com', '1995-03-02', 'Seattle', 'Washington', 'USA', 'Female', 'Autocross addict, coffee and camber.', 'https://example.com/avatars/gripqueen.jpg', 'Consumer,Moderator'),
('revhunter', 'Liam', 'Joseph', 'Martinez', 'liam.martinez@example.com', '1988-11-05', 'Austin', 'Texas', 'USA', 'Male', 'Chasing redlines and perfect heel-toe.', 'https://example.com/avatars/revhunter.jpg', 'Consumer'),
('stancealex', 'Alex', NULL, 'Wong', 'alex.wong@example.com', '1994-01-22', 'Vancouver', NULL, 'Canada', 'Non-Binary', 'Low and slow with daily driver vibes.', 'https://example.com/avatars/stancealex.jpg', 'Consumer'),
('trackmaria', 'Maria', 'Isabel', 'Garcia', 'maria.garcia@example.com', '1991-09-14', 'Phoenix', 'Arizona', 'USA', 'Female', 'HPDE coach and brake pad evangelist.', 'https://example.com/avatars/trackmaria.jpg', 'Event Organizer'),
('flat6fan', 'Ethan', NULL, 'Keller', 'ethan.keller@example.com', '1987-06-08', 'Munich', NULL, 'Germany', 'Male', 'Air-cooled stories and canyon runs.', 'https://example.com/avatars/flat6fan.jpg', 'Consumer'),
('turbo_tess', 'Tessa', 'May', 'Robinson', 'tessa.robinson@example.com', '1998-02-26', 'Portland', 'Oregon', 'USA', 'Female', 'DIY tuner, E85 experiments.', 'https://example.com/avatars/turbo_tess.jpg', 'Consumer'),
('apexpilot', 'Noah', 'James', 'Bennett', 'noah.bennett@example.com', '1990-12-03', 'Charlotte', 'North Carolina', 'USA', 'Male', 'Time-attack hopeful and data nerd.', 'https://example.com/avatars/apexpilot.jpg', 'Consumer,Event Organizer'),
('boxsterbeth', 'Bethany', NULL, 'Clark', 'bethany.clark@example.com', '1993-05-28', 'Miami', 'Florida', 'USA', 'Female', 'Convertible life and sunset cruises.', 'https://example.com/avatars/boxsterbeth.jpg', 'Consumer'),
('quattro_kid', 'Oliver', 'Ray', 'Meyer', 'oliver.meyer@example.com', '1996-08-17', 'Frankfurt', NULL, 'Germany', 'Male', 'Snow runs with quattro grip.', 'https://example.com/avatars/quattro_kid.jpg', 'Consumer'),
('vtec_sam', 'Samuel', NULL, 'Lee', 'samuel.lee@example.com', '1997-04-10', 'San Jose', 'California', 'USA', 'Male', 'NA builds and VTEC screaming.', 'https://example.com/avatars/vtec_sam.jpg', 'Consumer'),
('detaildiva', 'Ava', 'Rose', 'Mitchell', 'ava.mitchell@example.com', '1999-01-09', 'Chicago', 'Illinois', 'USA', 'Female', 'Ceramic coatings and swirl-free paint.', 'https://example.com/avatars/detaildiva.jpg', 'Consumer,Event Organizer'),
('rallyross', 'Ross', 'Alan', 'Fraser', 'ross.fraser@example.com', '1989-10-21', 'Edinburgh', NULL, 'UK', 'Male', 'Gravel stages and soft springs.', 'https://example.com/avatars/rallyross.jpg', 'Consumer'),
('miatamike', 'Michael', NULL, 'Young', 'michael.young@example.com', '1994-07-03', 'Tampa', 'Florida', 'USA', 'Male', 'Because Miata is always the answer.', 'https://example.com/avatars/miatamike.jpg', 'Consumer'),
('gtrhana', 'Hana', 'Kei', 'Tanaka', 'hana.tanaka@example.com', '1992-03-15', 'Osaka', NULL, 'Japan', 'Female', 'Night meets and touge practice.', 'https://example.com/avatars/gtrhana.jpg', 'Consumer,Moderator'),
('slidejas', 'Jasper', 'Cole', 'Wright', 'jasper.wright@example.com', '1993-11-30', 'Atlanta', 'Georgia', 'USA', 'Male', 'Grassroots drifting on a budget.', 'https://example.com/avatars/slidejas.jpg', 'Consumer'),
('carbonkat', 'Katherine', NULL, 'Diaz', 'katherine.diaz@example.com', '1995-06-12', 'Denver', 'Colorado', 'USA', 'Female', 'Weight reduction and aero tweaks.', 'https://example.com/avatars/carbonkat.jpg', 'Consumer'),
('boxerbrad', 'Bradley', 'Owen', 'Hughes', 'bradley.hughes@example.com', '1986-04-04', 'Sydney', NULL, 'Australia', 'Male', 'Flat-four burble enthusiast.', 'https://example.com/avatars/boxerbrad.jpg', 'Consumer'),
('euroella', 'Ella', NULL, 'Fischer', 'ella.fischer@example.com', '1998-09-02', 'Hamburg', NULL, 'Germany', 'Female', 'OEM+ builds and subtle stance.', 'https://example.com/avatars/euroella.jpg', 'Consumer'),
('cobra_kai', 'Kai', 'Thomas', 'Andrews', 'kai.andrews@example.com', '1991-12-18', 'Dallas', 'Texas', 'USA', 'Male', 'Supercharger whine is therapy.', 'https://example.com/avatars/cobra_kai.jpg', 'Consumer'),
('rsrachel', 'Rachel', 'Anne', 'Barker', 'rachel.barker@example.com', '1996-05-06', 'Portland', 'Oregon', 'USA', 'Female', 'Track prep and brake ducts.', 'https://example.com/avatars/rsrachel.jpg', 'Event Organizer'),
('octanedean', 'Dean', NULL, 'Peters', 'dean.peters@example.com', '1988-02-11', 'Cleveland', 'Ohio', 'USA', 'Male', 'Fuel maps and dyno sheets.', 'https://example.com/avatars/octanedean.jpg', 'Consumer'),
('chromenick', 'Nicholas', 'Paul', 'Santos', 'nicholas.santos@example.com', '1993-08-27', 'San Antonio', 'Texas', 'USA', 'Male', 'Restomod builds and chrome polish.', 'https://example.com/avatars/chromenick.jpg', 'Consumer'),
('ev_aria', 'Aria', NULL, 'Lopez', 'aria.lopez@example.com', '1999-10-01', 'San Francisco', 'California', 'USA', 'Female', 'EV swaps and instant torque.', 'https://example.com/avatars/ev_aria.jpg', 'Consumer,Moderator'),
('boostbri', 'Brian', 'Lee', 'Kim', 'brian.kim@example.com', '1992-01-26', 'Seoul', NULL, 'South Korea', 'Male', 'Twin-scroll turbos and spicy tunes.', 'https://example.com/avatars/boostbri.jpg', 'Consumer'),
('wagonwiz', 'Isabella', NULL, 'Moretti', 'isabella.moretti@example.com', '1995-03-29', 'Milan', NULL, 'Italy', 'Female', 'Fast wagons and road trips.', 'https://example.com/avatars/wagonwiz.jpg', 'Consumer'),
('pitlane_pete', 'Peter', 'John', 'Walsh', 'peter.walsh@example.com', '1987-07-16', 'Dublin', NULL, 'Ireland', 'Male', 'Pit strategy and tire temps.', 'https://example.com/avatars/pitlane_pete.jpg', 'Consumer'),
('bluemica', 'Maya', 'Skye', 'Turner', 'maya.turner@example.com', '1994-04-20', 'New York', 'New York', 'USA', 'Female', 'Paint correction and rare colors.', 'https://example.com/avatars/bluemica.jpg', 'Consumer,Event Organizer'),
('oversteeryu', 'Yu', NULL, 'Zhang', 'yu.zhang@example.com', '1991-09-09', 'Shanghai', NULL, 'China', 'Non-Binary', 'Chasing clean transitions at the track.', 'https://example.com/avatars/oversteeryu.jpg', 'Consumer'),
('camberkev', 'Kevin', 'Ross', 'Baker', 'kevin.baker@example.com', '1989-05-24', 'Columbus', 'Ohio', 'USA', 'Male', 'Fitment experiments and meaty tires.', 'https://example.com/avatars/camberkev.jpg', 'Consumer'),
('flatplanejay', 'Jay', NULL, 'Morgan', 'jay.morgan@example.com', '1990-02-02', 'Los Angeles', 'California', 'USA', 'Male', 'NA screamers and track etiquette.', 'https://example.com/avatars/flatplanejay.jpg', 'Consumer'),
('ceramiclily', 'Lily', 'Grace', 'Hernandez', 'lily.hernandez@example.com', '1997-06-07', 'Miami', 'Florida', 'USA', 'Female', 'Detailing studio owner and teacher.', 'https://example.com/avatars/ceramiclily.jpg', 'Event Organizer'),
('rs3rob', 'Robert', NULL, 'Kovac', 'robert.kovac@example.com', '1986-03-31', 'Zagreb', NULL, 'Croatia', 'Male', 'Five-cylinder fanboy forever.', 'https://example.com/avatars/rs3rob.jpg', 'Consumer'),
('touge_tori', 'Tori', 'Aiko', 'Sato', 'tori.sato@example.com', '1998-12-11', 'Nagano', NULL, 'Japan', 'Female', 'Early mornings on empty roads.', 'https://example.com/avatars/touge_tori.jpg', 'Consumer'),
('vinyldan', 'Daniel', NULL, 'Price', 'daniel.price@example.com', '1993-01-13', 'Nashville', 'Tennessee', 'USA', 'Male', 'Livery design and wraps.', 'https://example.com/avatars/vinyldan.jpg', 'Consumer'),
('knucklekat', 'Katrina', 'Mae', 'Owens', 'katrina.owens@example.com', '1992-10-23', 'Kansas City', 'Missouri', 'USA', 'Female', 'Angle kits and clutch kicks.', 'https://example.com/avatars/knucklekat.jpg', 'Consumer'),
('downforce_dre', 'Andre', 'Luis', 'Silva', 'andre.silva@example.com', '1991-01-05', 'São Paulo', NULL, 'Brazil', 'Male', 'Splitter science and diffuser talk.', 'https://example.com/avatars/downforce_dre.jpg', 'Consumer'),
('sleeperseb', 'Sebastian', NULL, 'Ivanov', 'sebastian.ivanov@example.com', '1988-08-08', 'Sofia', NULL, 'Bulgaria', 'Male', 'Quiet outside, wild under the hood.', 'https://example.com/avatars/sleeperseb.jpg', 'Consumer'),
('pitcrew_pam', 'Pamela', 'Jean', 'Cole', 'pamela.cole@example.com', '1987-05-18', 'Philadelphia', 'Pennsylvania', 'USA', 'Female', 'Event ops and safety marshal.', 'https://example.com/avatars/pitcrew_pam.jpg', 'Event Organizer,Consumer'),
('modmax', 'Max', NULL, 'Reed', 'max.reed@example.com', '1996-11-27', 'Boise', 'Idaho', 'USA', 'Male', 'ECUs, logs, and long nights.', 'https://example.com/avatars/modmax.jpg', 'Moderator');




INSERT INTO Group_Chat (OwnerId, Name, CreatedAt) VALUES
(7,  'JDM Night Run',                 '2024-01-14 20:45:10'),
(12, 'Euro Track Rats',               '2024-03-02 09:12:31'),
(3,  'Turbo Tuesdays',                 '2025-02-11 18:03:22'),
(21, 'Muscle Cars & Coffee',          '2023-11-05 08:17:44'),
(30, 'Canyon Carvers PNW',            '2024-06-22 07:55:13'),
(15, 'Touge Dawn Patrol',             '2025-05-19 05:42:09'),
(26, 'EV Swaps & Hybrids',            '2024-09-28 12:03:58'),
(9,  'Convertible Sunset Crew',       '2024-08-18 19:26:41'),
(33, 'Time Attack Data Nerds',        '2025-01-09 21:50:35'),
(18, 'Boxer Burble Society',          '2024-11-12 15:14:27'),
(5,  'HPDE First-Timers',             '2024-02-25 10:09:02'),
(22, 'Brake Duct Whisperers',         '2024-04:18 16:22:51'),
(1,  'Oversteer Anonymous',           '2023-12-29 22:39:10'),
(37, 'OEM+ Perfectionists',           '2024-10-07 13:01:43'),
(11, 'NA Screamer Club',              '2025-03-16 17:34:55'),
(24, 'Dyno Day Diehards',             '2024-07-03 14:20:48'),
(6,  'Air-Cooled Alley',              '2024-05-26 11:45:29'),
(28, 'Fitment & Meaty Tires',         '2025-04-05 09:57:36'),;


INSERT INTO Advertiser (Name, Email, CompanyName, CreatedAt) VALUES
('Marcus Allen',     'marcus.allen@trackstarpromo.com',   'TrackStar Promotions',          '2024-01-12 10:14:22'),
('Sophie Turner',    'sophie@eurodetailers.com',          'Euro Detailers',                '2024-03-08 15:42:09'),
('James Mitchell',   'james.m@turbohaus.com',             'TurboHaus Performance',         '2025-02-19 11:25:47'),
('Hannah Lee',       'hannah@stancecreative.com',         'Stance Creative Media',          '2023-11-04 09:56:38'),
('Liam Johnson',     'liam@canyoncoffeeauto.com',         'Canyon Coffee & Auto',           '2024-06-21 08:33:55'),
('Olivia Brooks',    'olivia.b@revlineads.com',           'RevLine Advertising',            '2025-05-15 14:27:41'),
('Ethan Morales',    'ethan@oversteerstudio.com',         'Oversteer Studio',               '2024-09-26 17:19:03'),
('Ava Robinson',     'ava.robinson@pitstopmedia.com',     'Pit Stop Media Group',           '2024-08-14 13:04:17'),
('Noah White',       'noah@dynodayevents.com',            'Dyno Day Events',                '2025-01-08 16:42:59'),
('Isabella Hughes',  'isabella@boxerburble.com',          'Boxer Burble Marketing',         '2024-11-09 12:56:11'),
('Daniel Kim',       'daniel.kim@hpdepros.com',           'HPDE Pros',                      '2024-02-23 09:22:38'),
('Mia Carter',       'mia@brakeductlabs.com',             'Brake Duct Labs',                '2024-04-15 14:35:21'),
('Oliver Martinez',  'oliver@oemplusmedia.com',           'OEM Plus Media',                 '2023-12-28 11:44:56'),
('Emma Watson',      'emma@nascreamers.com',              'NA Screamer Marketing',          '2024-10-05 15:06:42'),
('Benjamin Ross',    'ben.ross@dynodaycrew.com',          'Dyno Day Crew Media',            '2025-03-12 10:54:29'),
('Charlotte Green',  'charlotte@aircooledads.com',        'Air-Cooled Alley Ads',           '2024-07-02 09:38:15'),
('Lucas Wright',     'lucas@fitmentfactory.com',          'Fitment Factory',                '2024-05-25 13:19:47'),
('Amelia Scott',     'amelia.scott@wrapworks.com',        'WrapWorks',                      '2025-04-04 08:51:03'),
('Henry Evans',      'henry.evans@heeltoepro.com',        'Heel-Toe Pro Marketing',         '2024-08-31 18:12:57'),
('Grace Cooper',     'grace@driftpitsmedia.com',          'Drift Pits Media',               '2023-10-19 21:05:16'),
('Jack Ramirez',     'jack@detailingceramic.com',         'Detailing & Ceramic Pros',       '2024-12-03 14:48:34'),
('Lily Foster',      'lily.foster@quattrosnow.com',       'Quattro Snow Media',             '2024-03-28 09:30:50'),
('Alexander Gray',   'alex.gray@superchargerads.com',     'Supercharger Whine Ads',         '2025-01-25 12:07:22'),
('Zoe Baker',        'zoe@rallygravelmedia.com',          'Rally Gravel Media',             '2024-06-09 10:53:44'),
('Matthew King',     'matt.king@wagonwednesday.com',      'Wagon Wednesday Advertising',    '2024-08-05 16:11:33'),
('Chloe Morris',     'chloe.morris@pitsafetymarketing.com','Pit & Safety Marketing',        '2023-09-11 13:18:55'),
('William Adams',    'will.adams@paintcorrection.com',    'Paint Correction Lab',           '2024-11-23 09:06:49'),
('Sofia Perez',      'sofia@fivecylfans.com',             'Five-Cylinder Fans',             '2025-05-01 17:23:12'),
('Ryan Brooks',      'ryan@morningstretches.com',         'Morning Stretches Media',        '2024-02-04 07:25:37'),
('Natalie Simmons',  'natalie@restomodroundtable.com',    'Restomod Roundtable',            '2024-04-26 18:14:22'),
('Thomas Rivera',    'thomas@splitterdiffuser.com',       'Splitter & Diffuser Science',    '2025-06-10 15:07:18'),
('Victoria Hughes',  'victoria@brakepadco.com',           'Brake Pad Co',                   '2023-12-09 12:16:07'),
('Jacob Bennett',    'jacob@stancegarage.com',            'Stance Garage',                  '2024-10-28 11:04:39'),
('Harper Young',     'harper@ecu_tunepro.com',            'ECU Tune Pro',                   '2025-02-22 20:41:16');


-- 2) Community (needs Group_Chat, Users)
INSERT INTO Community (OwnerId, ChatId, CreatedAt, Name, Description) VALUES
(7,   1,  '2024-01-15 10:22:11', 'JDM Night Run',       'Late-night meets and touge planning.'),
(12,  2,  '2024-03-03 08:55:40', 'Euro Track Rats',     'Lap times, setups, and Nürburgring dreams.'),
(3,   3,  '2025-02-12 18:07:19', 'Turbo Tuesdays',      'Boost chat, logs, turbos, and tunes.'),
(21,  4,  '2023-11-05 08:33:50', 'Muscle & Coffee',     'Classics, caffeine, and quarter-mile stories.'),
(30,  5,  '2024-06-22 07:59:03', 'Canyon Carvers',      'Routes, pace notes, and safety tips.'),
(15,  6,  '2025-05-19 05:45:51', 'Touge Dawn',          'Sunrise runs and smooth lines.'),
(26,  7,  '2024-09-28 12:08:44', 'EV Swaps Hub',        'Battery packs, controllers, instant torque.'),
(9,   8,  '2024-08-18 19:30:12', 'Sunset Converts',     'Top-down cruises and photo spots.'),
(33,  9,  '2025-01-09 21:54:20', 'Time Attack Data',    'Telemetry, sectors, and PB hunting.'),
(18, 10,  '2024-11-12 15:18:09', 'Boxer Burble Soc',    'Flat engines, exhaust notes, and builds.'),
(5,  11,  '2024-02-25 10:12:36', 'HPDE Starters',       'Beginner HPDE Q&A and checklists.'),
(22, 12,  '2024-04-18 16:25:41', 'Brake Duct Lab',      'Cooling, pads, and rotor life.'),
(1,  13,  '2023-12-29 22:42:55', 'Oversteer Anon',      'Spin stories, recovery, and technique.'),
(37, 14,  '2024-10-07 13:05:22', 'OEM+ Purists',        'Factory-plus mods and tasteful tweaks.'),
(11, 15,  '2025-03-16 17:38:27', 'NA Screamer Club',    'High-rev NA builds and sound checks.'),
(24, 16,  '2024-07-03 14:24:39', 'Dyno Day Crew',       'Charts, AFRs, and correction factors.'),
(6,  17,  '2024-05-26 11:48:18', 'Air-Cooled Alley',    'Cooling fins, carbs, and classics.'),
(28, 18,  '2025-04-05 10:01:03', 'Fitment & Meat',      'Stance vs. grip: find the balance.'),
(19, 19,  '2024-09-02 18:15:51', 'Wraps & Liveries',    'Designs, vinyl tips, and reveals.'),
(35, 20,  '2023-10-21 20:08:46', 'Heel-Toe Room',       'Footwork drills and rev-matching.'),
(16, 21,  '2024-12-01 19:46:55', 'Drift Pits',          'Grassroots drift tech and events.'),
(2,  22,  '2024-03-30 08:31:10', 'Detail & Ceramic',    'Paint care, coatings, and tools.'),
(29, 23,  '2025-01-27 07:35:19', 'Quattro Snow',        'Winter tires and quattro adventures.'),
(10, 24,  '2024-06-10 12:58:47', 'Supercharger Whine',  'Twin-screw vs. roots and belt talk.'),
(4,  25,  '2024-01-07 09:04:41', 'Rally Gravel',        'Stages, notes, and soft-spring setups.'),
(25, 26,  '2024-08-07 21:15:02', 'Wagon Wednesday',     'Fast wagons and sleeper haulers.'),
(31, 27,  '2023-09-12 13:22:33', 'Pit & Safety',        'Marshall ops, flags, and comms.'),
(8,  28,  '2024-11-24 10:10:01', 'Paint Correction',    'Compounds, pads, lighting, and tests.'),
(32, 29,  '2025-05-02 16:52:43', 'Five-Cyl Fans',       'Odd-fire glory and RS lore.'),
(23, 30,  '2024-02-05 06:25:44', 'Morning Stretches',   'Early runs, warmups, and coffee maps.');

-- 3) Event (needs Users, Community)
INSERT INTO Event
(HostId, CommunityId, Name, Description, Type, StartTime, EndTime, Region, Country)
VALUES
(7,   1,  'JDM Night Run',        'Late-night city loop with photo stops and safety briefing.',       'Cruise',       '2025-01-18 21:00:00', '2025-01-19 00:00:00', 'Los Angeles, CA',        'USA'),
(12,  2,  'Euro Track Day',       'Open lapping day; novice and intermediate run groups.',            'Track Day',    '2025-03-02 08:00:00', '2025-03-02 16:00:00', 'Portland, OR',          'USA'),
(3,   3,  'Turbo Tuesdays',       'Boost tuning Q&A and log review over pizza.',                      'Workshop',     '2025-02-11 18:30:00', '2025-02-11 21:30:00', 'Austin, TX',            'USA'),
(21,  4,  'Muscle & Coffee',      'Cars & coffee meet focused on classics and restomods.',            'Meetup',       '2025-04-06 08:00:00', '2025-04-06 11:00:00', 'Charlotte, NC',         'USA'),
(30,  5,  'Canyon Cruise',        'Early-morning canyon run; radios recommended.',                    'Cruise',       '2025-06-22 06:00:00', '2025-06-22 09:00:00', 'Santa Clarita, CA',     'USA'),
(15,  6,  'Touge Dawn Run',       'Tight mountain section practice; spotters at key turns.',          'Rally',        '2025-05-19 05:30:00', '2025-05-19 08:30:00', 'Asheville, NC',         'USA'),
(26,  7,  'EV Swap Meetup',       'Battery pack mounting and controller wiring show-and-tell.',       'Meetup',       '2025-09-06 10:00:00', '2025-09-06 13:00:00', 'San Jose, CA',          'USA'),
(9,   8,  'Sunset Cruise',        'Coastal top-down cruise with photo ops at lookout.',               'Cruise',       '2025-08-23 18:30:00', '2025-08-23 21:00:00', 'Miami, FL',             'USA'),
(33,  9,  'Time Attack 101',      'Data logging basics and braking markers for PBs.',                 'Workshop',     '2025-01-09 19:00:00', '2025-01-09 21:30:00', 'Atlanta, GA',           'USA'),
(18, 10,  'Boxer Burble Meet',    'Subaru/Porsche meetup; exhaust setups comparison.',                'Meetup',       '2025-11-12 10:00:00', '2025-11-12 12:30:00', 'Sydney, NSW',           'Australia'),
(5,  11,  'HPDE Starters',        'Tech inspection walkthrough and track etiquette.',                 'Workshop',     '2025-02-25 17:30:00', '2025-02-25 20:30:00', 'Chicago, IL',           'USA'),
(22, 12,  'Brake Duct Clinic',    'Cooling strategies, pad compounds, and rotor life.',               'Workshop',     '2025-04-18 18:00:00', '2025-04-18 20:30:00', 'Phoenix, AZ',           'USA'),
(1,  13,  'Oversteer 101',        'Skidpad practice with instructors and spotters.',                  'Course',       '2025-12-07 09:00:00', '2025-12-07 12:00:00', 'Dublin',                'Ireland'),
(37, 14,  'OEM+ Showcase',        'Tasteful factory-plus builds; judging at noon.',                   'Show',         '2025-10-07 10:00:00', '2025-10-07 14:00:00', 'Munich',                'Germany'),
(11, 15,  'NA Screamers Meet',    'High-rev NA builds sound-off; dB meter on site.',                  'Meetup',       '2025-03-16 16:00:00', '2025-03-16 19:00:00', 'Los Angeles, CA',       'USA'),
(24, 16,  'Dyno Day',             'Back-to-back dyno pulls; AFR and timing discussion.',              'Dyno Day',     '2025-07-03 09:00:00', '2025-07-03 13:00:00', 'Cleveland, OH',         'USA'),
(6,  17,  'Air-Cooled Alley',     'Air-cooled clinic: shrouds, carbs, timing light demos.',           'Workshop',     '2025-05-26 11:00:00', '2025-05-26 13:30:00', 'Hamburg',               'Germany'),
(28, 18,  'Fitment vs Grip',      'Panel talk: stance vs performance; tire widths IRL.',              'Panel',        '2025-04-05 18:00:00', '2025-04-05 20:00:00', 'Portland, OR',          'USA'),
(19, 19,  'Wraps & Liveries',     'Design review and vinyl application demos.',                       'Workshop',     '2025-09-02 13:00:00', '2025-09-02 16:00:00', 'Milan',                 'Italy'),
(35, 20,  'Heel-Toe Practice',    'Footwork drills on cones; bring comfy shoes.',                     'Clinic',       '2025-10-21 18:00:00', '2025-10-21 20:00:00', 'Dallas, TX',            'USA'),
(16, 21,  'Grassroots Drift',     'Parking-lot layout; beginner-friendly course workers.',            'Drift',        '2025-12-01 17:00:00', '2025-12-01 20:00:00', 'Kansas City, MO',       'USA'),
(2,  22,  'Detailing Pro Tips',   'Compounds, pads, lighting, and paint depth gauges.',               'Workshop',     '2025-03-30 10:00:00', '2025-03-30 12:30:00', 'Philadelphia, PA',      'USA'),
(29, 23,  'Quattro Snow Prep',    'Winter tires, chains, and diff talk for snow runs.',               'Clinic',       '2025-01-27 18:00:00', '2025-01-27 20:00:00', 'Denver, CO',            'USA'),
(10, 24,  'Supercharger Talk',    'Twin-screw vs roots deep dive with belt path tips.',               'Seminar',      '2025-06-10 19:00:00', '2025-06-10 21:00:00', 'Dallas, TX',            'USA'),
(4,  25,  'Rally Gravel 101',     'Pace notes basics and soft-spring setups.',                        'Workshop',     '2025-01-07 09:00:00', '2025-01-07 12:00:00', 'Edinburgh',             'UK'),
(25, 26,  'Wagon Wednesday',      'Midweek family hauler lineup, kid- and dog-friendly.',             'Meetup',       '2025-08-27 18:00:00', '2025-08-27 20:00:00', 'Boston, MA',            'USA'),
(31, 27,  'Pit & Safety Ops',     'Flagging, radios, and pit wall best practices.',                   'Training',     '2025-09-12 13:00:00', '2025-09-12 16:00:00', 'Indianapolis, IN',      'USA'),
(8,  28,  'Paint Correction',     'Hands-on: DA vs rotary; finishing without holograms.',             'Workshop',     '2025-11-24 10:00:00', '2025-11-24 12:30:00', 'New York, NY',          'USA'),
(32, 29,  'Five-Cyl Fans',        'Five-cylinder lore and RS lineage meetup.',                        'Meetup',       '2025-05-02 18:30:00', '2025-05-02 20:30:00', 'Frankfurt',             'Germany'),
(23, 30,  'Morning Stretch',      'Sunrise run and coffee stop; radios on channel 7.',                'Cruise',       '2025-02-05 06:00:00', '2025-02-05 08:00:00', 'San Francisco, CA',     'USA'),
(13,  1,  'Restomod Roundtbl',    'Roundtable on tasteful modern touches for classics.',              'Panel',        '2025-09-20 15:00:00', '2025-09-20 17:00:00', 'Nashville, TN',         'USA'),
(27,  2,  'Splitter Science',     'Aero basics: splitters, diffusers, and ride height.',              'Seminar',      '2025-06-11 18:00:00', '2025-06-11 20:00:00', 'Detroit, MI',           'USA'),
(20,  3,  'Sleeper Builds',       'Understated exteriors hiding serious power.',                      'Meetup',       '2025-12-10 19:00:00', '2025-12-10 21:00:00', 'Seattle, WA',           'USA'),
(34,  4,  'Ops & Marshals',       'Event operations drills and marshal scenarios.',                   'Training',     '2025-10-29 09:00:00', '2025-10-29 12:00:00', 'Orlando, FL',           'USA'),
(14,  5,  'ECU Tuning Night',     'Live street-legal tuning demos and log review.',                   'Workshop',     '2025-02-23 19:00:00', '2025-02-23 22:00:00', 'Boise, ID',             'USA'),
(16, 21,  'Drift Night',          'Beginner-friendly skidpad; tire service on site.',                 'Drift',        '2025-08-30 17:30:00', '2025-08-30 21:30:00', 'St. Louis, MO',         'USA'),
(11, 15,  'Track Day Advanced',   'Advanced-only open lapping; point-by rules enforced.',             'Track Day',    '2025-09-14 08:00:00', '2025-09-14 16:00:00', 'Laguna Seca, CA',       'USA'),
(9,   8,  'Cars & Coffee',        'Open meet; arrive early for prime spots, be respectful.',          'Meetup',       '2025-08-17 07:30:00', '2025-08-17 10:30:00', 'Tampa, FL',             'USA');


-- 4) Post (needs Users, Advertiser, Community, Event)
INSERT INTO Post
(AuthorId, AdvertiserId, CommunityId, EventId, Likes, Dislikes, Title, Body, CreatedAt, Deleted, Flagged)
VALUES
-- 1-10: general user posts
(7,   NULL,  1,  NULL, 42, 1,  'First JDM Night Pics',        'Snapped a few rollers from last night''s loop. Thanks for keeping it safe.', '2025-01-19 00:30:12', 0, 0),
(12,  NULL,  2,  NULL, 65, 2,  'Euro Track Day Setup',        'Dialed in -2.2 camber front, fresh pads. PB incoming.',                      '2025-03-01 19:44:03', 0, 0),
(3,   NULL,  3,  NULL, 33, 0,  'Boost Leak Found',            'Tiny split in the coupler after the FMIC. Replaced and back on target.',     '2025-02-12 09:18:40', 0, 0),
(21,  NULL,  4,  NULL, 28, 3,  'Cars & Coffee Recap',         'Great turnout—five classic fastbacks and a blown small-block.',              '2025-04-06 12:03:22', 0, 0),
(30,  NULL,  5,  NULL, 51, 1,  'Canyon Route GPX',            'Sharing the GPX file for Sunday''s run. Mind the gravel at mile 18.',       '2025-06-21 20:11:57', 0, 0),
(15,  NULL,  6,  NULL, 40, 0,  'Touge Dawn Plan',             'Meet at the lower lot 5:15AM. Radios on channel 3.',                         '2025-05-18 21:09:14', 0, 0),
(26,  NULL,  7,  NULL, 24, 2,  'EV Swap Parts List',          'Posted BOM for the rear subframe and HV contactor wiring.',                  '2025-09-01 13:32:09', 0, 0),
(9,   NULL,  8,  NULL, 37, 1,  'Best Sunset Pullouts',        'Map markers for photos—please keep traffic moving and be respectful.',       '2025-08-16 18:02:51', 0, 0),
(33,  NULL,  9,  NULL, 56, 4,  'Sector Times Analysis',       'Overlayed throttle traces—braking earlier netted +0.3s in S3.',              '2025-01-10 08:41:26', 0, 0),
(18,  NULL, 10,  NULL, 22, 0,  'Flat-Six Exhaust Poll',       'Vote: x-pipe vs. h-pipe vs. single exit. Sound clips attached.',             '2025-11-10 09:14:55', 0, 0),

-- 11-20: more user posts
(5,   NULL, 11,  NULL, 19, 0,  'HPDE Tech Checklist',         'Helmet dates, torque wheels, brake fluid, numbers. What else?',              '2025-02-20 17:06:12', 0, 0),
(22,  NULL, 12,  NULL, 44, 1,  'Pad Compound Review',         'Tried the new street/track hybrid—initial bite is wild.',                     '2025-04-18 21:10:04', 0, 0),
(1,   NULL, 13,  NULL, 31, 5,  'Skidpad Learnings',           'Spins happen. Throttle lift mid-corner was my culprit.',                      '2025-12-07 12:15:37', 0, 0),
(37,  NULL, 14,  NULL, 27, 0,  'OEM+ Parts Sources',          'Share your trusted vendors for factory-plus upgrades.',                       '2025-10-06 18:03:43', 0, 0),
(11,  NULL, 15,  NULL, 48, 2,  'High-Rev Sound-Off',          'Post clips of your NA builds. Keep revs reasonable…ish.',                     '2025-03-16 20:49:11', 0, 0),
(24,  NULL, 16,  NULL, 53, 1,  'Dyno Graph Dump',             'Back-to-back pulls—timing ramp 2 degrees later helped.',                      '2025-07-03 14:55:24', 0, 0),
(6,   NULL, 17,  NULL, 18, 0,  'Cooling Shroud DIY',          'Cardboard template, aluminum cut, rivnut tool—easy win.',                     '2025-05-26 12:51:05', 0, 0),
(28,  NULL, 18,  NULL, 26, 3,  'Meaty Tire Fitment',          'Square 265/35 fit with a mild pull—no rub on full lock.',                     '2025-04-05 20:12:33', 0, 0),
(19,  NULL, 19,  NULL, 21, 0,  'Livery Concept WIP',          'Mockups for the 90s throwback—opinions on color blocking?',                   '2025-09-01 19:02:44', 0, 0),
(35,  NULL, 20,  NULL, 29, 1,  'Heel-Toe Drill',              'Cones laid out in the mall lot; practicing blips today.',                     '2025-10-21 21:05:12', 0, 0),

-- 21-30: a couple flagged/deleted for moderation realism
(16,  NULL, 21,  NULL, 14, 6,  'Drift Course Ideas',          'Sketching a tighter layout for beginners—feedback welcome.',                  '2025-12-01 10:33:47', 0, 0),
(2,   NULL, 22,  NULL, 39, 0,  'Compound Comparison',         'Finishing passes with softer pad killed the haze.',                           '2025-03-30 12:01:18', 0, 0),
(29,  NULL, 23,  NULL, 25, 2,  'Snow Tire Sizes',             'Narrower section in winter felt more planted—agree?',                         '2025-01-26 20:47:39', 0, 0),
(10,  NULL, 24,  NULL, 41, 1,  'Twin-Screw Belt Path',        'Idler relocation eliminated squeal. Diagram attached.',                        '2025-06-10 22:20:03', 0, 0),
(4,   NULL, 25,  NULL, 17, 0,  'Gravel Notes Template',       'Printable pace notes sheet for practice stages.',                              '2025-01-07 10:28:11', 0, 0),
(25,  NULL, 26,  NULL, 32, 0,  'Wagon Lineup',                'Let’s see the family haulers—bonus points for sleeper builds.',               '2025-08-27 09:44:52', 0, 0),
(31,  NULL, 27,  NULL, 22, 1,  'Pit Radio Etiquette',         'Keep channels clear for control—examples inside.',                            '2025-09-12 15:04:30', 0, 0),
(8,   NULL, 28,  NULL, 36, 0,  'Rotary vs DA',                'Side-by-side finish shots on black paint. Thoughts?',                          '2025-11-24 11:49:33', 0, 0),
(32,  NULL, 29,  NULL, 23, 0,  'Five-Cyl History',            'Thread on the odd-fire charm and rally lineage.',                              '2025-05-02 21:04:55', 0, 0),
(23,  NULL, 30,  NULL, 27, 4,  'Morning Route Options',       'Three sunrise loops—vote on which gets coffee at the end.',                   '2025-02-05 07:12:06', 0, 0),

-- 31-40: advertiser posts (AuthorId NULL, AdvertiserId set)
(NULL,  1,  16, NULL, 120, 9, 'TrackStar Promo',             'Save on HPDE registrations—bundle coaching and timing transponders.',        '2025-07-01 08:00:00', 0, 0),
(NULL,  2,  28, NULL,  76, 3, 'EuroDetailers Tips',          'Swirl-free wash guide: pre-soak, two-bucket, plush towels.',                  '2025-03-10 09:15:00', 0, 0),
(NULL,  3,   3, NULL,  84, 5, 'TurboHaus Sale',              'Intercooler kits 15% off this week—free clamps included.',                    '2025-02-20 12:00:00', 0, 0),
(NULL,  4,  14, NULL,  59, 1, 'StanceCreative Reel',         'OEM+ feature drops Friday—submit your builds.',                                '2025-11-03 10:30:00', 0, 0),
(NULL,  5,   5, NULL,  63, 2, 'CanyonCoffee Event',          'Saturday sunrise meet—free espresso shots for first 20 cars.',                '2025-06-19 07:00:00', 0, 0),
(NULL,  6,   9, NULL,  71, 6, 'RevLine Ad Credit',           'Earn bonus impressions when linking dyno sheets to your posts.',               '2025-05-14 16:45:00', 0, 0),
(NULL,  7,   7, NULL,  58, 2, 'Oversteer Studio',            'Now booking photo/video for drift days—group rates available.',                '2025-09-05 11:10:00', 0, 0),
(NULL,  8,  27, NULL,  47, 1, 'Pit Stop Media',              'Announcing live radio comms coverage for next month''s event.',               '2025-08-12 13:00:00', 0, 0),
(NULL,  9,  16, NULL,  66, 4, 'Dyno Day Events',             'Bring your car—discounts for back-to-back pulls, prizes for top WHP.',        '2025-07-02 10:00:00', 0, 0),
(NULL, 10,  10, NULL,  52, 0, 'Boxer Burble Merch',          'New tees and plates—flat-six silhouette line drops today.',                    '2025-11-11 09:00:00', 0, 0),

-- 41-50: more ads + a couple marked flagged/deleted
(NULL, 11,  11, NULL,  40, 2, 'HPDE Pros Slots',             'Limited coaching slots left—novice friendly, telemetry included.',            '2025-02-24 08:30:00', 0, 0),
(NULL, 12,  12, NULL,  45, 1, 'Brake Duct Labs',             'Pre-bent ducts and hardware kits back in stock.',                             '2025-04-16 14:00:00', 0, 0),
(NULL, 13,  14, NULL,  33, 3, 'OEM Plus Media',              'Feature your OEM+ car in our next series—apply inside.',                      '2023-12-29 11:30:00', 0, 0),
(NULL, 14,  15, NULL,  61, 5, 'NA Screamer Mkting',          'Mic day for high-rev builds—sound booth on site.',                             '2025-10-04 12:00:00', 0, 0),
(NULL, 15,  16, NULL,  77, 8, 'Dyno Day Crew',               'Community dyno day—RSVP for an extra pull.',                                  '2025-07-01 09:00:00', 0, 1),
(NULL, 16,   1, NULL,  26, 0, 'Air-Cooled Alley Ads',        'Vintage cooling shrouds reproduced—limited batch.',                            '2025-07-02 08:10:00', 0, 0),
(NULL, 17,  18, NULL,  36, 2, 'Fitment Factory',             'Wheel fitment consultation—book a sizing session.',                            '2025-05-26 13:00:00', 0, 0),
(NULL, 18,  19, NULL,  30, 1, 'WrapWorks Drop',              'Retro livery kits now available in matte and gloss.',                         '2025-04-03 10:00:00', 0, 0),
(NULL, 19,  20, NULL,  42, 4, 'Heel-Toe Pro',                'Pedal spacing kit—improve your blip consistency.',                             '2025-10-22 08:00:00', 0, 0),
(NULL, 20,  21, NULL,  38, 2, 'Drift Pits Media',            'Grassroots coverage package—clips for drivers included.',                      '2025-12-01 09:00:00', 1, 1),

-- 51-60: event-related posts (EventId set; some by users, some by advertisers)
(7,   NULL,  1,  1,   49, 2, 'Night Run Info',               'Route finalized; gas stop at mile 24. Bring radios.',                         '2025-01-17 20:00:00', 0, 0),
(12,  NULL,  2,  2,   58, 1, 'Track Day Brief',              'Passing zones updated. Point-bys required in all groups.',                    '2025-03-01 17:30:00', 0, 0),
(3,   NULL,  3,  3,   34, 0, 'Turbo Class Notes',            'Slides for the Turbo Tuesdays workshop attached.',                            '2025-02-10 22:12:00', 0, 0),
(21,  NULL,  4,  4,   23, 0, 'Coffee Parking Map',           'Overflow lot opens 7:30. Please don’t rev near residents.',                   '2025-04-05 20:45:00', 0, 0),
(30,  NULL,  5,  5,   46, 2, 'Canyon Safety',                'Corner marshals at blind bends; emergency number in the event page.',         '2025-06-21 18:00:00', 0, 0),
(NULL,  9, 16, 16,   31, 3, 'Dyno Day Partner',              'We''re sponsoring top WHP award—see rules.',                                   '2025-07-02 08:30:00', 0, 0),
(NULL, 11, 11, 11,   22, 1, 'Coaching Signup',               'Reserve your seat for the HPDE Starters session.',                             '2025-02-23 10:00:00', 0, 0),
(NULL, 24, 16, 16,   27, 2, 'Prize Announcement',            'Back-to-back pull winners get transponder credits.',                           '2025-07-02 11:15:00', 0, 0),
(6,   NULL, 17, 17,   18, 0, 'Air-Cooled Agenda',            'Timing light demo after lunch; bring your dwell meters.',                      '2025-05-25 17:40:00', 0, 0),
(28,  NULL, 18, 18,   29, 1, 'Fitment Panel Qs',             'Drop your questions for the stance vs grip panel.',                            '2025-04-04 09:55:00', 0, 0),

-- 61-70: more user posts across communities
(19,  NULL, 19, NULL, 20, 0, 'Vinyl Squeegee Picks',         'Hard vs soft edges—what works for you on compound curves?',                    '2025-09-01 20:10:00', 0, 0),
(35,  NULL, 20, NULL, 26, 0, 'Heel-Toe Shoes',               'Thin soles helped—share your favorites.',                                     '2025-10-20 18:33:00', 0, 0),
(16,  NULL, 21, NULL, 31, 2, 'Drift Tire Choice',            'New 200TW option feels progressive—heat cycle impressions attached.',         '2025-12-01 11:11:00', 0, 0),
(2,   NULL, 22, NULL, 44, 1, 'Coating Durability',           'Year-two update on ceramic—holding strong after 12 washes.',                  '2025-03-30 13:47:00', 0, 0),
(29,  NULL, 23, NULL, 19, 0, 'Chains vs Studs',              'For real snow runs, what''s worked best with quattro?',                       '2025-01-26 21:55:00', 0, 0),
(10,  NULL, 24, NULL, 33, 1, 'Pulley Ratios',                'Switched to 3.35:1—logged IATs are manageable with the new HX.',              '2025-06-10 23:15:00', 0, 0),
(4,   NULL, 25, NULL, 16, 0, 'Gravel Tire PSI',              'Dropping to mid-20s helped claw through the sand wash.',                      '2025-01-07 11:40:00', 0, 0),
(25,  NULL, 26, NULL, 28, 0, 'Wagon Roof Racks',             'Wind noise solutions? Fairings worth it?',                                     '2025-08-26 20:44:00', 0, 0),
(31,  NULL, 27, NULL, 24, 0, 'Flag Signals Quiz',            'Quick refresher before next weekend''s event.',                                '2025-09-12 16:12:00', 0, 0),
(8,   NULL, 28, NULL, 35, 2, 'Pad/Polish Combos',            'Finisher that plays nice on soft paints—what''s your go-to?',                  '2025-11-24 12:22:00', 0, 0);


-- 5) Campaign_Analytics (needs Advertiser)
INSERT INTO Campaign_Analytics
(CampaignId, Timestamp, AnalystId, Name, TotalClicks, TotalViews, AverageConversions, AverageImpressions, AverageCTR, AverageCPC)
VALUES
-- Campaign 1 (Mar/Apr/May 2025)
(1, '2025-03-01 10:00:00',  4, 'Mar 2025', 1890, 42000,  62.50, 1354.00, 0.045, 1.12),
(1, '2025-04-01 10:00:00',  4, 'Apr 2025', 2115, 46800,  70.20, 1560.00, 0.045, 1.08),
(1, '2025-05-01 10:00:00',  4, 'May 2025', 2340, 50250,  74.10, 1621.00, 0.047, 1.05),

-- Campaign 2
(2, '2025-03-01 10:05:00',  7, 'Mar 2025', 1320, 31000,  44.30, 1000.00, 0.043, 0.95),
(2, '2025-04-01 10:05:00',  7, 'Apr 2025', 1475, 33200,  48.10, 1106.00, 0.044, 0.98),
(2, '2025-05-01 10:05:00',  7, 'May 2025', 1580, 34950,  50.25, 1128.00, 0.045, 0.96),

-- Campaign 3
(3, '2025-03-01 10:10:00', 12, 'Mar 2025', 2560, 52000,  81.20, 1677.00, 0.049, 1.24),
(3, '2025-04-01 10:10:00', 12, 'Apr 2025', 2735, 54800,  85.60, 1756.00, 0.050, 1.21),
(3, '2025-05-01 10:10:00', 12, 'May 2025', 2895, 57500,  88.10, 1855.00, 0.050, 1.19),

-- Campaign 4
(4, '2025-03-01 10:15:00', 15, 'Mar 2025',  980, 24000,  31.75,  774.00, 0.041, 0.83),
(4, '2025-04-01 10:15:00', 15, 'Apr 2025', 1120, 26200,  35.15,  873.00, 0.043, 0.85),
(4, '2025-05-01 10:15:00', 15, 'May 2025', 1245, 28500,  38.30,  919.00, 0.044, 0.88),

-- Campaign 5
(5, '2025-03-01 10:20:00',  1, 'Mar 2025', 1750, 39000,  57.60, 1297.00, 0.045, 1.02),
(5, '2025-04-01 10:20:00',  1, 'Apr 2025', 1885, 41500,  60.90, 1383.00, 0.045, 1.01),
(5, '2025-05-01 10:20:00',  1, 'May 2025', 2040, 44250,  64.40, 1452.00, 0.046, 0.99),

-- Campaign 6
(6, '2025-03-01 10:25:00',  6, 'Mar 2025',  860, 20500,  27.30,  661.00, 0.042, 0.77),
(6, '2025-04-01 10:25:00',  6, 'Apr 2025',  950, 22100,  30.15,  736.00, 0.043, 0.79),
(6, '2025-05-01 10:25:00',  6, 'May 2025', 1040, 23800,  32.90,  767.00, 0.044, 0.81),

-- Campaign 7
(7, '2025-03-01 10:30:00',  8, 'Mar 2025', 1425, 32000,  46.40, 1032.00, 0.045, 1.07),
(7, '2025-04-01 10:30:00',  8, 'Apr 2025', 1560, 34500,  49.85, 1147.00, 0.045, 1.05),
(7, '2025-05-01 10:30:00',  8, 'May 2025', 1690, 37000,  53.20, 1194.00, 0.046, 1.03),

-- Campaign 8
(8, '2025-03-01 10:35:00',  9, 'Mar 2025', 2210, 50000,  72.10, 1613.00, 0.044, 1.18),
(8, '2025-04-01 10:35:00',  9, 'Apr 2025', 2375, 52800,  76.55, 1703.00, 0.045, 1.16),
(8, '2025-05-01 10:35:00',  9, 'May 2025', 2510, 55250,  79.80, 1782.00, 0.045, 1.15),

-- Campaign 9
(9, '2025-03-01 10:40:00', 10, 'Mar 2025', 1960, 43000,  63.35, 1387.00, 0.046, 1.09),
(9, '2025-04-01 10:40:00', 10, 'Apr 2025', 2090, 45500,  66.70, 1453.00, 0.046, 1.07),
(9, '2025-05-01 10:40:00', 10, 'May 2025', 2245, 48250,  70.25, 1557.00, 0.047, 1.06),

-- Campaign 10
(10, '2025-03-01 10:45:00', 11, 'Mar 2025', 1180, 27000,  38.10,  871.00, 0.044, 0.92),
(10, '2025-04-01 10:45:00', 11, 'Apr 2025', 1285, 29200,  40.85,  933.00, 0.044, 0.94),
(10, '2025-05-01 10:45:00', 11, 'May 2025', 1390, 31500,  43.60, 1016.00, 0.044, 0.96),

-- Campaign 11
(11, '2025-03-01 10:50:00', 13, 'Mar 2025',  760, 18500,  24.10,  597.00, 0.041, 0.75),
(11, '2025-04-01 10:50:00', 13, 'Apr 2025',  845, 20100,  26.30,  657.00, 0.042, 0.77),
(11, '2025-05-01 10:50:00', 13, 'May 2025',  930, 21800,  28.90,  703.00, 0.043, 0.80),

-- Campaign 12
(12, '2025-03-01 10:55:00', 14, 'Mar 2025', 1630, 36000,  52.25, 1161.00, 0.045, 1.04),
(12, '2025-04-01 10:55:00', 14, 'Apr 2025', 1780, 38500,  55.60, 1242.00, 0.046, 1.02),
(12, '2025-05-01 10:55:00', 14, 'May 2025', 1915, 41000,  58.75, 1323.00, 0.047, 1.01),

-- Campaign 13
(13, '2025-03-01 11:00:00', 16, 'Mar 2025', 2440, 54000,  77.10, 1742.00, 0.045, 1.20),
(13, '2025-04-01 11:00:00', 16, 'Apr 2025', 2615, 56600,  81.40, 1819.00, 0.046, 1.17),
(13, '2025-05-01 11:00:00', 16, 'May 2025', 2780, 59200,  84.90, 1890.00, 0.047, 1.16),

-- Campaign 14
(14, '2025-03-01 11:05:00', 18, 'Mar 2025', 1360, 30000,  43.80,  968.00, 0.045, 0.99),
(14, '2025-04-01 11:05:00', 18, 'Apr 2025', 1485, 32200,  46.90, 1039.00, 0.046, 1.01),
(14, '2025-05-01 11:05:00', 18, 'May 2025', 1610, 34500,  49.70, 1113.00, 0.047, 1.03),

-- Campaign 15
(15, '2025-03-01 11:10:00', 20, 'Mar 2025',  900, 21000,  28.40,  677.00, 0.043, 0.82),
(15, '2025-04-01 11:10:00', 20, 'Apr 2025',  990, 22800,  30.95,  727.00, 0.043, 0.84),
(15, '2025-05-01 11:10:00', 20, 'May 2025', 1085, 24750,  33.50,  798.00, 0.044, 0.86),

-- Campaign 16
(16, '2025-03-01 11:15:00', 22, 'Mar 2025', 1710, 38000,  55.60, 1226.00, 0.045, 1.06),
(16, '2025-04-01 11:15:00', 22, 'Apr 2025', 1845, 40200,  58.40, 1296.00, 0.046, 1.05),
(16, '2025-05-01 11:15:00', 22, 'May 2025', 1980, 42600,  61.75, 1374.00, 0.046, 1.03),

-- Campaign 17
(17, '2025-03-01 11:20:00', 24, 'Mar 2025',  640, 16000,  20.30,  516.00, 0.040, 0.73),
(17, '2025-04-01 11:20:00', 24, 'Apr 2025',  720, 17600,  22.45,  568.00, 0.041, 0.75),
(17, '2025-05-01 11:20:00', 24, 'May 2025',  785, 19000,  24.10,  613.00, 0.041, 0.77),

-- Campaign 18
(18, '2025-03-01 11:25:00', 25, 'Mar 2025', 2275, 51000,  73.60, 1657.00, 0.045, 1.15),
(18, '2025-04-01 11:25:00', 25, 'Apr 2025', 2430, 53500,  77.40, 1726.00, 0.045, 1.13),
(18, '2025-05-01 11:25:00', 25, 'May 2025', 2590, 56000,  80.20, 1807.00, 0.046, 1.12),

-- Campaign 19
(19, '2025-03-01 11:30:00', 27, 'Mar 2025', 1530, 34000,  49.80, 1097.00, 0.045, 1.00),
(19, '2025-04-01 11:30:00', 27, 'Apr 2025', 1650, 36250,  52.60, 1169.00, 0.046, 1.01),
(19, '2025-05-01 11:30:00', 27, 'May 2025', 1780, 38500,  55.90, 1242.00, 0.046, 1.03),

-- Campaign 20
(20, '2025-03-01 11:35:00', 30, 'Mar 2025',  990, 23500,  31.40,  758.00, 0.042, 0.88),
(20, '2025-04-01 11:35:00', 30, 'Apr 2025', 1085, 25250,  33.95,  818.00, 0.043, 0.90),
(20, '2025-05-01 11:35:00', 30, 'May 2025', 1190, 27000,  36.50,  871.00, 0.044, 0.92);


-- 6) Message (needs Users, Group_Chat)
INSERT INTO Message (AuthorId, GroupId, Body, CreatedAt) VALUES
(7,   1,  'Rolling out from the pier at 9:15. Radios on ch.3.',                     '2025-01-14 20:51:12'),
(12,  2,  'Anyone have baseline camber/caster for RS4 at PIR?',                      '2025-03-02 08:59:03'),
(3,   3,  'Boost builds tomorrow—bring your logs.',                                   '2025-02-11 18:05:44'),
(21,  4,  'Parking near the roastery fills by 8. Get there early!',                   '2023-11-05 07:55:10'),
(30,  5,  'Canyon route updated. Watch for gravel at mile 18.',                       '2024-06-22 07:58:33'),
(15,  6,  'Meet at lower lot 5:15AM. Warm up tires before the first run.',            '2025-05-19 05:39:10'),
(26,  7,  'Who''s got a link to the latest inverter firmware?',                       '2024-09-28 12:04:51'),
(9,   8,  'Sunset is 7:52. Golden hour photos at the overlook.',                      '2024-08-18 19:28:22'),
(33,  9,  'Overlayed my S3 throttle trace—brake earlier for a cleaner exit.',         '2025-01-09 21:52:05'),
(18, 10,  'H-pipe vs x-pipe on flat-six—post clips.',                                  '2024-11-12 15:16:43'),
(5,  11,  'HPDE tech checklist: torque wheels, fluids, helmet dates.',                '2024-02-25 10:10:51'),
(22, 12,  'Pad compound poll: endurance vs sprint?',                                   '2024-04-18 16:24:09'),
(1,  13,  'Skidpad tomorrow. Remember: eyes up, smooth inputs.',                      '2023-12-29 22:40:40'),
(37, 14,  'OEM+ sources for trim clips? Avoiding brittle aftermarket.',               '2024-10-07 13:03:11'),
(11, 15,  'NA sound-off thread. Keep it civil and keep revs reasonable.',              '2025-03-16 17:36:21'),
(24, 16,  'Dyno queue opens 9:00. Two pulls each, back-to-back.',                     '2024-07-03 14:22:08'),
(6,  17,  'Carb sync after lunch. Bring vacuum gauges.',                               '2024-05-26 11:46:57'),
(28, 18,  'Anyone running a square 265 setup on BRZ? Rubbing at full lock?',          '2025-04-05 09:59:42'),
(19, 19,  'Vinyl corner technique—heat first or stretch first?',                       '2024-09-02 18:14:10'),
(35, 20,  'Heel-toe drill tonight—cones in the back corner of the lot.',              '2023-10-21 20:07:09'),
(16, 21,  'Drift layout idea: tighter inner clip at turn 2.',                          '2024-12-01 19:45:10'),
(2,  22,  'Best lights for paint correction booths?',                                  '2024-03-30 08:30:51'),
(29, 23,  'Snow tire sizes—narrower felt more planted last season.',                   '2025-01-27 07:34:11'),
(10, 24,  'Twin-screw belt squeal fixed with idler relocation.',                       '2024-06-10 12:57:21'),
(4,  25,  'Pace notes template updated—printable A5 cards.',                           '2024-01-07 09:03:28'),
(25, 26,  'Wagon lineup Wednesday—kids and dogs welcome.',                              '2024-08-07 21:13:16'),
(31, 27,  'Keep radio channel 1 clear for race control.',                               '2023-09-12 13:21:01'),
(8,  28,  'DA vs rotary—post your finishing combos on soft paint.',                    '2024-11-24 10:08:50'),
(32, 29,  'Five-cylinder lore thread—drop your favorite rally clips.',                 '2025-05-02 16:51:02'),
(23, 30,  'Sunrise loop poll—option B has better coffee.',                              '2024-02-05 06:24:33'),
(7,   1,  'We''ll regroup at the gas station at mile 24.',                              '2025-01-14 21:07:14'),
(12,  2,  'RS4 rear toe—anyone tried slight toe-in for stability?',                    '2025-03-02 09:11:40'),
(3,   3,  'Small vacuum leak was the culprit—idle stabilized.',                         '2025-02-11 18:22:14'),
(21,  4,  'Bring trash bags; let''s leave the lot cleaner than we found it.',          '2023-11-05 08:18:59'),
(30,  5,  'New GPX uploaded to the files tab.',                                        '2024-06-22 08:02:21'),
(15,  6,  'Spotter volunteers? Need two at the hairpins.',                              '2025-05-19 05:48:37'),
(26,  7,  'Charging layout sketch posted—feedback welcome.',                            '2024-09-28 12:10:22'),
(9,   8,  'Top-down cruise tonight—watch your spacing near the bridge.',               '2024-08-18 19:33:03'),
(33,  9,  'Sector 2 braking marker moved 10m earlier—PB improved.',                     '2025-01-09 22:01:43'),
(18, 10,  'H-pipe drone at 2k rpm—any fixes besides resonators?',                       '2024-11-12 15:20:39'),
(5,  11,  'Torque spec reminder: 88–95 lb-ft for most wheels here.',                    '2024-02-25 10:13:44'),
(22, 12,  'Rotor temp paint: green burned off in two sessions.',                        '2024-04-18 16:27:27'),
(1,  13,  'If you spin, both feet in. Breathe. Reset.',                                 '2023-12-29 22:44:03'),
(37, 14,  'OEM+ = tasteful. No fake vents, please.',                                     '2024-10-07 13:06:30'),
(11, 15,  'Sound meter will be on site; keep it friendly.',                              '2025-03-16 17:40:33'),
(24, 16,  'Dyno operator asks for tow hooks visible—thanks!',                            '2024-07-03 14:26:55'),
(6,  17,  'Timing light demo moved to 12:45.',                                           '2024-05-26 11:50:31'),
(28, 18,  'Square setup notes posted to docs.',                                          '2025-04-05 10:02:58'),
(19, 19,  'Wrap with heat, then squeegee—less silvering.',                               '2024-09-02 18:18:06'),
(35, 20,  'Use thin soles for cleaner blips.',                                           '2023-10-21 20:10:12'),
(16, 21,  'Chalked a new clipping point—check the map.',                                 '2024-12-01 19:48:03'),
(2,  22,  'Finishing pad: soft foam saved my clear coat.',                               '2024-03-30 08:33:40'),
(29, 23,  'Chains vs studs for mountain passes?',                                        '2025-01-27 07:37:40'),
(10, 24,  'Belt route photo added to docs.',                                             '2024-06-10 13:01:08'),
(4,  25,  'Gravel PSI: start at mid-20s, adjust by feel.',                               '2024-01-07 09:06:12'),
(25, 26,  'Post your favorite wagon sleeper builds.',                                    '2024-08-07 21:16:20'),
(31, 27,  'Flag test Sunday—study the chart.',                                           '2023-09-12 13:24:59'),
(8,  28,  'New microfiber brand review posted.',                                         '2024-11-24 10:12:41'),
(32, 29,  'Best five-cyl soundtrack? RS3 or old UR-quattro?',                            '2025-05-02 16:55:31'),
(23, 30,  'Early coffee stop moved one block east.',                                     '2024-02-05 06:28:17');


-- 7) Comment (needs Post, Users)
INSERT INTO Comment
(PostId, AuthorId, Likes, Dislikes, Body, CreatedAt, Deleted, Flagged)
VALUES
(1,   12, 14, 0,  'Those rollers look insane—what lens were you using?',                                '2025-01-19 01:12:44', 0, 0),
(1,   7,   9, 1,  'Frame 3 is my favorite. Thanks for keeping spacing tight.',                           '2025-01-19 02:05:10', 0, 0),
(2,   33, 11, 0,  '−2.2 front worked for me too; watch inner tire wear.',                                '2025-03-01 20:02:09', 0, 0),
(3,   15,  7, 0,  'Good catch—pressurized smoke test saves hours.',                                      '2025-02-12 10:11:33', 0, 0),
(4,   30, 10, 1,  'That blown small-block sounded *angry* 😅',                                           '2025-04-06 12:15:22', 0, 0),
(5,   11, 18, 0,  'Thanks for the GPX—added to my Garmin.',                                              '2025-06-21 20:30:00', 0, 0),
(6,   28, 12, 0,  'Channel 3 confirmed. I''ll bring spare radios.',                                      '2025-05-18 21:20:45', 0, 0),
(7,   19,  8, 0,  'Post your inverter part numbers? Curious on your BOM.',                               '2025-09-01 13:50:12', 0, 0),
(8,   9,  15, 0,  'Overlook lot gets windy—bring clamps for flags.',                                     '2025-08-16 18:33:19', 0, 0),
(9,   33, 22, 2,  'Braking earlier let me stay flat sooner—PB by .28!',                                  '2025-01-10 09:02:54', 0, 0),
(10,  18,  6, 0,  'X-pipe on mine mellowed drone but lost some burble.',                                  '2025-11-10 09:20:40', 0, 0),
(11,  5,   9, 0,  'Add brake fluid flush to your checklist—cheap insurance.',                             '2025-02-20 17:19:11', 0, 0),
(12,  22, 13, 1,  'That hybrid pad is bitey when cold—agree.',                                           '2025-04-18 21:21:03', 0, 0),
(13,  1,   8, 2,  'Skidpad humbled me last weekend too. Progress > pride.',                              '2025-12-07 12:30:15', 0, 0),
(14,  37,  7, 0,  'Dealer trim clips > brittle aftermarket every time.',                                  '2025-10-06 18:20:17', 0, 0),
(15,  11, 16, 0,  'Sound limit at our track is 96 dB—ask first!',                                        '2025-03-16 21:00:40', 0, 0),
(16,  24, 14, 1,  'Timing ramp change makes sense—pulls look smoother.',                                 '2025-07-03 15:01:22', 0, 0),
(17,  6,   5, 0,  'Rivnut tool is a game changer for shrouds.',                                           '2025-05-26 13:02:31', 0, 0),
(18,  28,  9, 0,  'Square 265s on a mild pull worked on my BRZ too.',                                    '2025-04-05 20:30:50', 0, 0),
(19,  19,  6, 0,  'Color blocking #2 pops on overcast days.',                                            '2025-09-01 19:21:12', 0, 0),
(20,  35, 10, 0,  'Try thin-sole karting shoes—night/day difference.',                                   '2025-10-21 21:12:48', 0, 0),
(21,  16,  7, 0,  'Tighter inner clip will help new folks commit.',                                       '2025-12-01 10:45:29', 0, 0),
(22,  2,  12, 0,  'Finishing pass with softer pad always saves me.',                                     '2025-03-30 12:12:19', 0, 0),
(23,  29,  9, 0,  'Narrower winters = more bite in deep snow.',                                          '2025-01-26 21:02:04', 0, 0),
(24,  10, 13, 0,  'Idler relocation also freed belt wrap—nice.',                                         '2025-06-10 22:31:00', 0, 0),
(25,  4,   8, 0,  'Pace notes template is super usable—thanks!',                                         '2025-01-07 10:40:31', 0, 0),
(26,  25, 11, 1,  'Sleeper wagons are criminally underrated.',                                           '2025-08-27 09:55:18', 0, 0),
(27,  31,  7, 0,  'Race control thanks you 😅 Keep channel 1 open.',                                      '2025-09-12 15:20:17', 0, 0),
(28,  8,  10, 0,  'On black paint, rotary + soft pad = chef''s kiss.',                                   '2025-11-24 12:01:11', 0, 0),
(29,  32,  8, 0,  'UR-quattro clips never get old.',                                                      '2025-05-02 21:12:14', 0, 0),
(30,  23,  9, 0,  'Route C has the best sunrise view—coffee still decent.',                              '2025-02-05 07:18:42', 0, 0),
(31,  7,  21, 2,  'Discount + coaching is a solid combo. I''m in.',                                      '2025-07-01 08:40:11', 0, 0),
(32, 12,  15, 0,  'Two-bucket + pre-soak saved my soft clear.',                                          '2025-03-10 09:44:22', 0, 0),
(33,  3,  17, 1,  'Do the IC kits include t-bolt clamps? Asking for a friend.',                          '2025-02-20 12:20:49', 0, 0),
(34, 21,  11, 0,  'OEM+ features always do well—submit your cars!',                                      '2025-11-03 10:45:33', 0, 0),
(35, 30,  13, 0,  'Free espresso? That''s how you get a crowd 😄',                                       '2025-06-19 07:20:08', 0, 0),
(36, 24,  12, 2,  'Bonus impressions sound neat—any fine print?',                                        '2025-05-14 17:01:45', 0, 0),
(37, 26,   9, 0,  'Booking for the drift day—sent a DM.',                                                '2025-09-05 11:20:19', 0, 0),
(38,  9,  10, 0,  'Live comms would be epic for drivers.',                                               '2025-08-12 13:17:51', 0, 0),
(39, 11,  14, 1,  'Prize rules pinned—thanks for sponsoring.',                                           '2025-07-02 10:15:20', 0, 0),
(40, 18,   8, 0,  'Flat-six silhouette tee is a must.',                                                  '2025-11-11 09:14:55', 0, 0),
(41, 22,   7, 0,  'Telemetry included? That''s huge for novices.',                                       '2025-02-24 08:42:01', 0, 0),
(42,  5,  10, 0,  'Pre-bent ducts saved my weekend—install is 30 min.',                                  '2025-04-16 14:12:50', 0, 0),
(43, 37,   6, 0,  'Application form submitted!',                                                         '2023-12-29 12:05:03', 0, 0),
(44, 11,  12, 1,  'Mic day will be spicy—bring earplugs.',                                               '2025-10-04 12:20:10', 0, 0),
(45, 24,  16, 3,  'RSVP''d—two pulls and a heat soak session please.',                                   '2025-07-01 09:20:40', 0, 1),
(46,  6,   9, 0,  'Those shrouds look factory—nicely done.',                                             '2025-07-02 08:20:03', 0, 0),
(47, 28,  10, 0,  'Booked a sizing session next week.',                                                  '2025-05-26 13:14:21', 0, 0),
(48, 19,   8, 0,  'Matte retro livery hits different in sun.',                                           '2025-04-03 10:13:42', 0, 0),
(49, 35,  11, 0,  'Pedal kit fixed my miss-blips—+1.',                                                   '2025-10-22 08:18:09', 0, 0),
(50, 20,   2, 3,  'Post removed by mods for promo spam.',                                                '2025-12-01 10:02:00', 1, 1),
(51,  7,  13, 0,  'Gas stop noted—channel 3 confirmed.',                                                 '2025-01-17 20:15:40', 0, 0),
(52, 12,  14, 0,  'Point-bys make everyone faster. Good call.',                                          '2025-03-01 17:49:28', 0, 0),
(53,  3,   9, 0,  'Slides were super clear—thanks for sharing.',                                         '2025-02-10 22:40:12', 0, 0),
(54, 21,   7, 0,  'Please no revving in the neighborhood 🙏',                                            '2025-04-05 21:01:29', 0, 0),
(55, 30,  12, 1,  'Saving the emergency number to my phone now.',                                        '2025-06-21 18:13:09', 0, 0),
(56,  9,  10, 0,  'Top WHP award? Let''s gooo.',                                                         '2025-07-02 08:41:11', 0, 0),
(57, 11,   8, 0,  'Signed up—any helmet rentals for beginners?',                                         '2025-02-23 10:17:39', 0, 0),
(58, 24,   7, 0,  'Transponder credits are a nice touch.',                                               '2025-07-02 11:28:44', 0, 0),
(59,  6,   6, 0,  'Adding dwell meters to my tool list.',                                                '2025-05-25 18:01:07', 0, 0),
(60, 28,  11, 0,  'Question queued! Excited for the panel.',                                             '2025-04-04 10:02:32', 0, 0),
(61, 19,   5, 0,  'Soft squeegee for compound curves, always.',                                          '2025-09-01 20:24:28', 0, 0),
(62, 35,   9, 0,  'Vans Ultrarange felt great for blips.',                                               '2025-10-20 18:44:33', 0, 0),
(63, 16,   8, 1,  '200TW felt progressive after two heat cycles.',                                       '2025-12-01 11:20:40', 0, 0),
(64,  2,  12, 0,  'Two-year ceramic update is impressive.',                                              '2025-03-30 13:59:01', 0, 0),
(65, 29,   6, 0,  'Chains for deep stuff; studs if legal. YMMV.',                                        '2025-01-26 22:05:57', 0, 0),
(66, 10,  10, 0,  '3.35:1 with new HX is spicy—watch IATs midday.',                                      '2025-06-10 23:26:22', 0, 0),
(67,  4,   7, 0,  'Mid-20s PSI saved my run too.',                                                        '2025-01-07 11:50:58', 0, 0),
(68, 25,   8, 0,  'Fairings help, but so does sealing the rack feet.',                                   '2025-08-26 21:02:10', 0, 0),
(69, 31,   9, 0,  'Posting the flag chart now—test Sunday.',                                             '2025-09-12 16:20:40', 0, 0),
(70,  8,  10, 2,  'Soft paint + finishing polish = mirror.',                                             '2025-11-24 12:41:55', 0, 0),
(31, 14,   6, 0,  'Bundle deal is clutch for beginners.',                                                '2025-07-01 08:49:09', 0, 0),
(33, 22,   5, 0,  'Yes—t-bolts are included this month.',                                                '2025-02-20 12:28:51', 0, 0),
(45,  5,   1, 4,  'This feels like over-promotion—tone it down.',                                        '2025-07-01 09:31:00', 0, 1),
(50, 18,   0, 6,  'Spammy and off-topic—reported.',                                                      '2025-12-01 10:05:12', 1, 1),
(44, 33,   4, 0,  'Please respect sound limits everyone.',                                               '2025-10-04 12:34:45', 0, 0),
(56, 21,   3, 0,  'We''ll livestream the award ceremony.',                                                '2025-07-02 08:49:28', 0, 0),
(60, 12,   2, 0,  'Adding my questions now—thanks!',                                                     '2025-04-04 10:11:59', 0, 0),
(9,  33,  15, 0,  'Sector maps uploaded in files.',                                                      '2025-01-10 09:28:10', 0, 0);


-- 8) Community_Members
INSERT INTO Community_Members (CommunityId, UserId) VALUES
-- Community 1
(1,1),(1,8),(1,15),(1,22),(1,29),(1,36),
-- Community 2
(2,2),(2,9),(2,16),(2,23),(2,30),(2,37),
-- Community 3
(3,3),(3,10),(3,17),(3,24),(3,31),(3,38),
-- Community 4
(4,4),(4,11),(4,18),(4,25),(4,32),(4,39),
-- Community 5
(5,5),(5,12),(5,19),(5,26),(5,33),(5,40),
-- Community 6
(6,6),(6,13),(6,20),(6,27),(6,34),(6,1),
-- Community 7
(7,7),(7,14),(7,21),(7,28),(7,35),(7,2),
-- Community 8
(8,8),(8,15),(8,22),(8,29),(8,36),(8,3),
-- Community 9
(9,9),(9,16),(9,23),(9,30),(9,37),(9,4),
-- Community 10
(10,10),(10,17),(10,24),(10,31),(10,38),(10,5),
-- Community 11
(11,11),(11,18),(11,25),(11,32),(11,39),(11,6),
-- Community 12
(12,12),(12,19),(12,26),(12,33),(12,40),(12,7),
-- Community 13
(13,13),(13,20),(13,27),(13,34),(13,1),(13,8),
-- Community 14
(14,14),(14,21),(14,28),(14,35),(14,2),(14,9),
-- Community 15
(15,15),(15,22),(15,29),(15,36),(15,3),(15,10),
-- Community 16
(16,16),(16,23),(16,30),(16,37),(16,4),(16,11),
-- Community 17
(17,17),(17,24),(17,31),(17,38),(17,5),(17,12),
-- Community 18
(18,18),(18,25),(18,32),(18,39),(18,6),(18,13),
-- Community 19
(19,19),(19,26),(19,33),(19,40),(19,7),(19,14),
-- Community 20
(20,20),(20,27),(20,34),(20,1),(20,8),(20,15),
-- Community 21
(21,21),(21,28),(21,35),(21,2),(21,9),(21,16),
-- Community 22
(22,22),(22,29),(22,36),(22,3),(22,10),(22,17),
-- Community 23
(23,23),(23,30),(23,37),(23,4),(23,11),(23,18),
-- Community 24
(24,24),(24,31),(24,38),(24,5),(24,12),(24,19),
-- Community 25
(25,25),(25,32),(25,39),(25,6),(25,13),(25,20),
-- Community 26
(26,26),(26,33),(26,40),(26,7),(26,14),(26,21),
-- Community 27
(27,27),(27,34),(27,1),(27,8),(27,15),(27,22),
-- Community 28
(28,28),(28,35),(28,2),(28,9),(28,16),(28,23),
-- Community 29
(29,29),(29,36),(29,3),(29,10),(29,17),(29,24),
-- Community 30
(30,30),(30,37),(30,4),(30,11),(30,18),(30,25);


-- 9) Post_Meta
INSERT INTO Post_Meta (UserId, PostId, Liked, Disliked, Seen, Clicked) VALUES
(1, 1, 1, 0, 1, 1),
(18, 1, 1, 0, 1, 0),
(2, 2, 0, 1, 1, 0),
(19, 2, 0, 0, 1, 0),
(3, 3, 1, 0, 1, 0),
(20, 3, 0, 0, 1, 1),
(4, 4, 1, 0, 1, 1),
(21, 4, 1, 0, 1, 0),
(5, 5, 0, 1, 1, 0),
(22, 5, 0, 0, 1, 0),
(6, 6, 1, 0, 1, 0),
(23, 6, 0, 0, 1, 1),
(7, 7, 1, 0, 1, 1),
(24, 7, 1, 0, 1, 0),
(8, 8, 0, 1, 1, 0),
(25, 8, 0, 0, 1, 0),
(9, 9, 1, 0, 1, 0),
(26, 9, 0, 0, 1, 1),
(10, 10, 1, 0, 1, 1),
(27, 10, 1, 0, 1, 0),
(11, 11, 0, 1, 1, 0),
(28, 11, 0, 0, 1, 0),
(12, 12, 1, 0, 1, 0),
(29, 12, 0, 0, 1, 1),
(13, 13, 1, 0, 1, 1),
(30, 13, 1, 0, 1, 0),
(14, 14, 0, 1, 1, 0),
(31, 14, 0, 0, 1, 0),
(15, 15, 1, 0, 1, 0),
(32, 15, 0, 0, 1, 1),
(16, 16, 1, 0, 1, 1),
(33, 16, 1, 0, 1, 0),
(17, 17, 0, 1, 1, 0),
(34, 17, 0, 0, 1, 0),
(18, 18, 1, 0, 1, 0),
(35, 18, 0, 0, 1, 1),
(19, 19, 1, 0, 1, 1),
(36, 19, 1, 0, 1, 0),
(20, 20, 0, 1, 1, 0),
(37, 20, 0, 0, 1, 0),
(21, 21, 1, 0, 1, 0),
(38, 21, 0, 0, 1, 1),
(22, 22, 1, 0, 1, 1),
(39, 22, 1, 0, 1, 0),
(23, 23, 0, 1, 1, 0),
(40, 23, 0, 0, 1, 0),
(24, 24, 1, 0, 1, 0),
(1, 24, 0, 0, 1, 1),
(25, 25, 1, 0, 1, 1),
(2, 25, 1, 0, 1, 0),
(26, 26, 0, 1, 1, 0),
(3, 26, 0, 0, 1, 0),
(27, 27, 1, 0, 1, 0),
(4, 27, 0, 0, 1, 1),
(28, 28, 1, 0, 1, 1),
(5, 28, 1, 0, 1, 0),
(29, 29, 0, 1, 1, 0),
(6, 29, 0, 0, 1, 0),
(30, 30, 1, 0, 1, 0),
(7, 30, 0, 0, 1, 1),
(31, 31, 1, 0, 1, 1),
(8, 31, 1, 0, 1, 0),
(32, 32, 0, 1, 1, 0),
(9, 32, 0, 0, 1, 0),
(33, 33, 1, 0, 1, 0),
(10, 33, 0, 0, 1, 1),
(34, 34, 1, 0, 1, 1),
(11, 34, 1, 0, 1, 0),
(35, 35, 0, 1, 1, 0),
(12, 35, 0, 0, 1, 0),
(36, 36, 1, 0, 1, 0),
(13, 36, 0, 0, 1, 1),
(37, 37, 1, 0, 1, 1),
(14, 37, 1, 0, 1, 0),
(38, 38, 0, 1, 1, 0),
(15, 38, 0, 0, 1, 0),
(39, 39, 1, 0, 1, 0),
(16, 39, 0, 0, 1, 1),
(40, 40, 1, 0, 1, 1),
(17, 40, 1, 0, 1, 0),
(1, 41, 0, 1, 1, 0),
(18, 41, 0, 0, 1, 0),
(2, 42, 1, 0, 1, 0),
(19, 42, 0, 0, 1, 1),
(3, 43, 1, 0, 1, 1),
(20, 43, 1, 0, 1, 0),
(4, 44, 0, 1, 1, 0),
(21, 44, 0, 0, 1, 0),
(5, 45, 1, 0, 1, 0),
(22, 45, 0, 0, 1, 1),
(6, 46, 1, 0, 1, 1),
(23, 46, 1, 0, 1, 0),
(7, 47, 0, 1, 1, 0),
(24, 47, 0, 0, 1, 0),
(8, 48, 1, 0, 1, 0),
(25, 48, 0, 0, 1, 1),
(9, 49, 1, 0, 1, 1),
(26, 49, 1, 0, 1, 0),
(10, 50, 0, 1, 1, 0),
(27, 50, 0, 0, 1, 0),
(11, 51, 1, 0, 1, 0),
(28, 51, 0, 0, 1, 1),
(12, 52, 1, 0, 1, 1),
(29, 52, 1, 0, 1, 0),
(13, 53, 0, 1, 1, 0),
(30, 53, 0, 0, 1, 0),
(14, 54, 1, 0, 1, 0),
(31, 54, 0, 0, 1, 1),
(15, 55, 1, 0, 1, 1),
(32, 55, 1, 0, 1, 0),
(16, 56, 0, 1, 1, 0),
(33, 56, 0, 0, 1, 0),
(17, 57, 1, 0, 1, 0),
(34, 57, 0, 0, 1, 1),
(18, 58, 1, 0, 1, 1),
(35, 58, 1, 0, 1, 0),
(19, 59, 0, 1, 1, 0),
(36, 59, 0, 0, 1, 0),
(20, 60, 1, 0, 1, 0),
(37, 60, 0, 0, 1, 1),
(21, 61, 1, 0, 1, 1),
(38, 61, 1, 0, 1, 0),
(22, 62, 0, 1, 1, 0),
(39, 62, 0, 0, 1, 0),
(23, 63, 1, 0, 1, 0),
(40, 63, 0, 0, 1, 1),
(24, 64, 1, 0, 1, 1),
(1, 64, 1, 0, 1, 0),
(25, 65, 0, 1, 1, 0),
(2, 65, 0, 0, 1, 0),
(26, 66, 1, 0, 1, 0),
(3, 66, 0, 0, 1, 1),
(27, 67, 1, 0, 1, 1),
(4, 67, 1, 0, 1, 0),
(28, 68, 0, 1, 1, 0),
(5, 68, 0, 0, 1, 0),
(29, 69, 1, 0, 1, 0),
(6, 69, 0, 0, 1, 1),
(30, 70, 1, 0, 1, 1),
(7, 70, 1, 0, 1, 0);

-- 10) Comment_Meta
INSERT INTO Comment_Meta (UserId, CommentId, Liked, Disliked, Seen) VALUES
(1,1,1,0,1),(22,1,0,0,1),
(2,2,1,0,1),(23,2,0,0,1),
(3,3,1,0,1),(24,3,0,0,1),
(4,4,1,0,1),(25,4,0,0,1),
(5,5,1,0,1),(26,5,0,0,1),
(6,6,1,0,1),(27,6,0,0,1),
(7,7,1,0,1),(28,7,0,0,1),
(8,8,1,0,1),(29,8,0,0,1),
(9,9,1,0,1),(30,9,0,0,1),
(10,10,1,0,1),(31,10,0,0,1),
(11,11,1,0,1),(32,11,0,0,1),
(12,12,1,0,1),(33,12,0,0,1),
(13,13,1,0,1),(34,13,0,0,1),
(14,14,1,0,1),(35,14,0,0,1),
(15,15,1,0,1),(36,15,0,0,1),
(16,16,1,0,1),(37,16,0,0,1),
(17,17,1,0,1),(38,17,0,0,1),
(18,18,1,0,1),(39,18,0,0,1),
(19,19,1,0,1),(40,19,0,0,1),
(20,20,1,0,1),(1,20,0,0,1),
(21,21,1,0,1),(2,21,0,0,1),
(22,22,1,0,1),(3,22,0,0,1),
(23,23,1,0,1),(4,23,0,0,1),
(24,24,1,0,1),(5,24,0,0,1),
(25,25,1,0,1),(6,25,0,0,1),
(26,26,1,0,1),(7,26,0,0,1),
(27,27,1,0,1),(8,27,0,0,1),
(28,28,1,0,1),(9,28,0,0,1),
(29,29,1,0,1),(10,29,0,0,1),
(30,30,1,0,1),(11,30,0,0,1),
(31,31,1,0,1),(12,31,0,0,1),
(32,32,1,0,1),(13,32,0,0,1),
(33,33,1,0,1),(14,33,0,0,1),
(34,34,1,0,1),(15,34,0,0,1),
(35,35,1,0,1),(16,35,0,0,1),
(36,36,1,0,1),(17,36,0,0,1),
(37,37,1,0,1),(18,37,0,0,1),
(38,38,1,0,1),(19,38,0,0,1),
(39,39,1,0,1),(20,39,0,0,1),
(40,40,1,0,1),(21,40,0,0,1),
(1,41,1,0,1),(22,41,0,0,1),
(2,42,1,0,1),(23,42,0,0,1),
(3,43,1,0,1),(24,43,0,0,1),
(4,44,1,0,1),(25,44,0,0,1),
(5,45,1,0,1),(26,45,0,0,1),
(6,46,1,0,1),(27,46,0,0,1),
(7,47,1,0,1),(28,47,0,0,1),
(8,48,1,0,1),(29,48,0,0,1),
(9,49,1,0,1),(30,49,0,0,1),
(10,50,1,0,1),(31,50,0,0,1),
(11,51,1,0,1),(32,51,0,0,1),
(12,52,1,0,1),(33,52,0,0,1),
(13,53,1,0,1),(34,53,0,0,1),
(14,54,1,0,1),(35,54,0,0,1),
(15,55,1,0,1),(36,55,0,0,1),
(16,56,1,0,1),(37,56,0,0,1),
(17,57,1,0,1),(38,57,0,0,1),
(18,58,1,0,1),(39,58,0,0,1),
(19,59,1,0,1),(40,59,0,0,1),
(20,60,1,0,1),(1,60,0,0,1),
(21,61,1,0,1),(2,61,0,0,1),
(22,62,1,0,1),(3,62,0,0,1),
(23,63,1,0,1),(4,63,0,0,1),
(24,64,1,0,1),(5,64,0,0,1),
(25,65,1,0,1),(6,65,0,0,1),
(26,66,1,0,1),(7,66,0,0,1),
(27,67,1,0,1),(8,67,0,0,1),
(28,68,1,0,1),(9,68,0,0,1),
(29,69,1,0,1),(10,69,0,0,1),
(30,70,1,0,1),(11,70,0,0,1),
(31,71,1,0,1),(12,71,0,0,1),
(32,72,1,0,1),(13,72,0,0,1),
(33,73,1,0,1),(14,73,0,0,1),
(34,74,1,0,1),(15,74,0,0,1),
(35,75,1,0,1),(16,75,0,0,1);


-- 11) Post_Analytics
INSERT INTO Post_Analytics
(PostId, Timestamp, Views, Clicks, CTR, CPC, Conversions, Impressions)
VALUES
( 1, '2025-01-10 10:00:00', 2750, 162, 0.050, 0.95, 19, 3235),
( 2, '2025-01-11 10:00:00', 2780, 164, 0.050, 0.92, 20, 3270),
( 3, '2025-01-12 10:00:00', 2810, 170, 0.052, 1.02, 21, 3305),
( 4, '2025-01-13 10:00:00', 2840, 176, 0.053, 0.88, 22, 3340),
( 5, '2025-01-14 10:00:00', 2870, 168, 0.049, 1.09, 18, 3375),
( 6, '2025-01-15 10:00:00', 2900, 182, 0.055, 0.83, 24, 3410),
( 7, '2025-01-16 10:00:00', 2930, 160, 0.047, 0.97, 17, 3445),
( 8, '2025-01-17 10:00:00', 2960, 188, 0.056, 1.06, 25, 3480),
( 9, '2025-01-18 10:00:00', 2990, 201, 0.060, 0.79, 27, 3515),
(10, '2025-01-19 10:00:00', 3020, 176, 0.053, 0.91, 20, 3550),
(11, '2025-01-20 10:00:00', 3050, 189, 0.055, 1.08, 23, 3585),
(12, '2025-01-21 10:00:00', 3080, 164, 0.047, 0.86, 18, 3620),
(13, '2025-01-22 10:00:00', 3110, 203, 0.061, 1.11, 28, 3655),
(14, '2025-01-23 10:00:00', 3140, 196, 0.059, 0.82, 26, 3690),
(15, '2025-01-24 10:00:00', 3170, 173, 0.051, 0.94, 21, 3725),
(16, '2025-01-25 10:00:00', 3200, 208, 0.064, 1.15, 30, 3760),
(17, '2025-01-26 10:00:00', 3230, 188, 0.056, 0.77, 24, 3795),
(18, '2025-01-27 10:00:00', 3260, 171, 0.050, 0.99, 20, 3830),
(19, '2025-01-28 10:00:00', 3290, 212, 0.064, 1.22, 31, 3865),
(20, '2025-01-29 10:00:00', 3320, 199, 0.059, 0.88, 26, 3900),
(21, '2025-01-30 10:00:00', 3350, 168, 0.049, 0.90, 19, 3935),
(22, '2025-01-31 10:00:00', 3380, 221, 0.065, 1.04, 33, 3970),
(23, '2025-02-01 10:00:00', 3410, 206, 0.060, 0.74, 27, 4005),
(24, '2025-02-02 10:00:00', 3440, 184, 0.053, 1.10, 22, 4040),
(25, '2025-02-03 10:00:00', 3470, 228, 0.066, 0.85, 34, 4075),
(26, '2025-02-04 10:00:00', 3500, 210, 0.060, 0.93, 29, 4110),
(27, '2025-02-05 10:00:00', 3530, 176, 0.050, 1.07, 21, 4145),
(28, '2025-02-06 10:00:00', 3560, 233, 0.066, 0.81, 35, 4180),
(29, '2025-02-07 10:00:00', 3590, 219, 0.062, 0.96, 32, 4215),
(30, '2025-02-08 10:00:00', 3620, 189, 0.052, 0.89, 24, 4250),
(31, '2025-02-09 10:00:00', 3650, 243, 0.066, 1.02, 36, 4285),
(32, '2025-02-10 10:00:00', 3680, 227, 0.061, 0.76, 31, 4320),
(33, '2025-02-11 10:00:00', 3710, 194, 0.052, 1.28, 25, 4355),
(34, '2025-02-12 10:00:00', 3740, 255, 0.068, 0.87, 38, 4390),
(35, '2025-02-13 10:00:00', 3770, 237, 0.063, 1.19, 34, 4425),
(36, '2025-02-14 10:00:00', 3800, 205, 0.054, 0.84, 27, 4460),
(37, '2025-02-15 10:00:00', 3830, 172, 0.045, 1.13, 20, 4495),
(38, '2025-02-16 10:00:00', 3860, 252, 0.066, 0.98, 37, 4530),
(39, '2025-02-17 10:00:00', 3890, 236, 0.060, 0.75, 33, 4565),
(40, '2025-02-18 10:00:00', 3920, 199, 0.051, 1.07, 26, 4600);


-- 12) Campaign_Posts_Data
```sql
INSERT INTO Campaign_Posts_Data
(CampaignId, AnalyticsId, Timestamp)
VALUES
-- Campaign 1 (Mar/Apr/May)
(1, 1,  '2025-03-01 10:00:00'),
(1, 11, '2025-03-01 10:00:00'),
(1, 21, '2025-03-01 10:00:00'),
(1, 1,  '2025-04-01 10:00:00'),
(1, 21, '2025-04-01 10:00:00'),
(1, 1,  '2025-05-01 10:00:00'),
(1, 21, '2025-05-01 10:00:00'),

-- Campaign 2
(2, 2,  '2025-03-01 10:05:00'),
(2, 12, '2025-03-01 10:05:00'),
(2, 22, '2025-03-01 10:05:00'),
(2, 2,  '2025-04-01 10:05:00'),
(2, 22, '2025-04-01 10:05:00'),
(2, 2,  '2025-05-01 10:05:00'),
(2, 22, '2025-05-01 10:05:00'),

-- Campaign 3
(3, 3,  '2025-03-01 10:10:00'),
(3, 13, '2025-03-01 10:10:00'),
(3, 23, '2025-03-01 10:10:00'),
(3, 3,  '2025-04-01 10:10:00'),
(3, 23, '2025-04-01 10:10:00'),
(3, 3,  '2025-05-01 10:10:00'),
(3, 23, '2025-05-01 10:10:00'),

-- Campaign 4
(4, 4,  '2025-03-01 10:15:00'),
(4, 14, '2025-03-01 10:15:00'),
(4, 24, '2025-03-01 10:15:00'),
(4, 4,  '2025-04-01 10:15:00'),
(4, 24, '2025-04-01 10:15:00'),
(4, 4,  '2025-05-01 10:15:00'),
(4, 24, '2025-05-01 10:15:00'),

-- Campaign 5
(5, 5,  '2025-03-01 10:20:00'),
(5, 15, '2025-03-01 10:20:00'),
(5, 25, '2025-03-01 10:20:00'),
(5, 5,  '2025-04-01 10:20:00'),
(5, 25, '2025-04-01 10:20:00'),
(5, 5,  '2025-05-01 10:20:00'),
(5, 25, '2025-05-01 10:20:00'),

-- Campaign 6
(6, 6,  '2025-03-01 10:25:00'),
(6, 16, '2025-03-01 10:25:00'),
(6, 26, '2025-03-01 10:25:00'),
(6, 6,  '2025-04-01 10:25:00'),
(6, 26, '2025-04-01 10:25:00'),
(6, 6,  '2025-05-01 10:25:00'),
(6, 26, '2025-05-01 10:25:00'),

-- Campaign 7
(7, 7,  '2025-03-01 10:30:00'),
(7, 17, '2025-03-01 10:30:00'),
(7, 27, '2025-03-01 10:30:00'),
(7, 7,  '2025-04-01 10:30:00'),
(7, 27, '2025-04-01 10:30:00'),
(7, 7,  '2025-05-01 10:30:00'),
(7, 27, '2025-05-01 10:30:00'),

-- Campaign 8
(8, 8,  '2025-03-01 10:35:00'),
(8, 18, '2025-03-01 10:35:00'),
(8, 28, '2025-03-01 10:35:00'),
(8, 8,  '2025-04-01 10:35:00'),
(8, 28, '2025-04-01 10:35:00'),
(8, 8,  '2025-05-01 10:35:00'),
(8, 28, '2025-05-01 10:35:00'),

-- Campaign 9
(9, 9,  '2025-03-01 10:40:00'),
(9, 19, '2025-03-01 10:40:00'),
(9, 29, '2025-03-01 10:40:00'),
(9, 9,  '2025-04-01 10:40:00'),
(9, 29, '2025-04-01 10:40:00'),
(9, 9,  '2025-05-01 10:40:00'),
(9, 29, '2025-05-01 10:40:00'),

-- Campaign 10
(10, 10, '2025-03-01 10:45:00'),
(10, 20, '2025-03-01 10:45:00'),
(10, 30, '2025-03-01 10:45:00'),
(10, 10, '2025-04-01 10:45:00'),
(10, 30, '2025-04-01 10:45:00'),
(10, 10, '2025-05-01 10:45:00'),
(10, 30, '2025-05-01 10:45:00'),

-- Campaign 11
(11, 11, '2025-03-01 10:50:00'),
(11, 21, '2025-03-01 10:50:00'),
(11, 31, '2025-03-01 10:50:00'),
(11, 11, '2025-04-01 10:50:00'),
(11, 31, '2025-04-01 10:50:00'),
(11, 11, '2025-05-01 10:50:00'),
(11, 31, '2025-05-01 10:50:00'),

-- Campaign 12
(12, 12, '2025-03-01 10:55:00'),
(12, 22, '2025-03-01 10:55:00'),
(12, 32, '2025-03-01 10:55:00'),
(12, 12, '2025-04-01 10:55:00'),
(12, 32, '2025-04-01 10:55:00'),
(12, 12, '2025-05-01 10:55:00'),
(12, 32, '2025-05-01 10:55:00'),

-- Campaign 13
(13, 13, '2025-03-01 11:00:00'),
(13, 23, '2025-03-01 11:00:00'),
(13, 33, '2025-03-01 11:00:00'),
(13, 13, '2025-04-01 11:00:00'),
(13, 33, '2025-04-01 11:00:00'),
(13, 13, '2025-05-01 11:00:00'),
(13, 33, '2025-05-01 11:00:00'),

-- Campaign 14
(14, 14, '2025-03-01 11:05:00'),
(14, 24, '2025-03-01 11:05:00'),
(14, 34, '2025-03-01 11:05:00'),
(14, 14, '2025-04-01 11:05:00'),
(14, 34, '2025-04-01 11:05:00'),
(14, 14, '2025-05-01 11:05:00'),
(14, 34, '2025-05-01 11:05:00'),

-- Campaign 15
(15, 15, '2025-03-01 11:10:00'),
(15, 25, '2025-03-01 11:10:00'),
(15, 35, '2025-03-01 11:10:00'),
(15, 15, '2025-04-01 11:10:00'),
(15, 35, '2025-04-01 11:10:00'),
(15, 15, '2025-05-01 11:10:00'),
(15, 35, '2025-05-01 11:10:00'),

-- Campaign 16
(16, 16, '2025-03-01 11:15:00'),
(16, 26, '2025-03-01 11:15:00'),
(16, 36, '2025-03-01 11:15:00'),
(16, 16, '2025-04-01 11:15:00'),
(16, 36, '2025-04-01 11:15:00'),
(16, 16, '2025-05-01 11:15:00'),
(16, 36, '2025-05-01 11:15:00'),

-- Campaign 17
(17, 17, '2025-03-01 11:20:00'),
(17, 27, '2025-03-01 11:20:00'),
(17, 37, '2025-03-01 11:20:00'),
(17, 17, '2025-04-01 11:20:00'),
(17, 37, '2025-04-01 11:20:00'),
(17, 17, '2025-05-01 11:20:00'),
(17, 37, '2025-05-01 11:20:00'),

-- Campaign 18
(18, 18, '2025-03-01 11:25:00'),
(18, 28, '2025-03-01 11:25:00'),
(18, 38, '2025-03-01 11:25:00'),
(18, 18, '2025-04-01 11:25:00'),
(18, 38, '2025-04-01 11:25:00'),
(18, 18, '2025-05-01 11:25:00'),
(18, 38, '2025-05-01 11:25:00'),

-- Campaign 19
(19, 19, '2025-03-01 11:30:00'),
(19, 29, '2025-03-01 11:30:00'),
(19, 39, '2025-03-01 11:30:00'),
(19, 19, '2025-04-01 11:30:00'),
(19, 39, '2025-04-01 11:30:00'),
(19, 19, '2025-05-01 11:30:00'),
(19, 39, '2025-05-01 11:30:00'),

-- Campaign 20
(20, 20, '2025-03-01 11:35:00'),
(20, 30, '2025-03-01 11:35:00'),
(20, 40, '2025-03-01 11:35:00'),
(20, 20, '2025-04-01 11:35:00'),
(20, 40, '2025-04-01 11:35:00'),
(20, 20, '2025-05-01 11:35:00'),
(20, 40, '2025-05-01 11:35:00');
```


-- 13) Post_Images
```sql
INSERT INTO Post_Images (PostId, Url) VALUES
-- Post 1–15 (2 images each)
(1,  'https://cdn.carsocial.app/posts/1/photo_1.jpg'),
(1,  'https://cdn.carsocial.app/posts/1/photo_2.jpg'),
(2,  'https://cdn.carsocial.app/posts/2/photo_1.jpg'),
(2,  'https://cdn.carsocial.app/posts/2/photo_2.jpg'),
(3,  'https://cdn.carsocial.app/posts/3/photo_1.jpg'),
(3,  'https://cdn.carsocial.app/posts/3/photo_2.jpg'),
(4,  'https://cdn.carsocial.app/posts/4/photo_1.jpg'),
(4,  'https://cdn.carsocial.app/posts/4/photo_2.jpg'),
(5,  'https://cdn.carsocial.app/posts/5/photo_1.jpg'),
(5,  'https://cdn.carsocial.app/posts/5/photo_2.jpg'),
(6,  'https://cdn.carsocial.app/posts/6/photo_1.jpg'),
(6,  'https://cdn.carsocial.app/posts/6/photo_2.jpg'),
(7,  'https://cdn.carsocial.app/posts/7/photo_1.jpg'),
(7,  'https://cdn.carsocial.app/posts/7/photo_2.jpg'),
(8,  'https://cdn.carsocial.app/posts/8/photo_1.jpg'),
(8,  'https://cdn.carsocial.app/posts/8/photo_2.jpg'),
(9,  'https://cdn.carsocial.app/posts/9/photo_1.jpg'),
(9,  'https://cdn.carsocial.app/posts/9/photo_2.jpg'),
(10, 'https://cdn.carsocial.app/posts/10/photo_1.jpg'),
(10, 'https://cdn.carsocial.app/posts/10/photo_2.jpg'),
(11, 'https://cdn.carsocial.app/posts/11/photo_1.jpg'),
(11, 'https://cdn.carsocial.app/posts/11/photo_2.jpg'),
(12, 'https://cdn.carsocial.app/posts/12/photo_1.jpg'),
(12, 'https://cdn.carsocial.app/posts/12/photo_2.jpg'),
(13, 'https://cdn.carsocial.app/posts/13/photo_1.jpg'),
(13, 'https://cdn.carsocial.app/posts/13/photo_2.jpg'),
(14, 'https://cdn.carsocial.app/posts/14/photo_1.jpg'),
(14, 'https://cdn.carsocial.app/posts/14/photo_2.jpg'),
(15, 'https://cdn.carsocial.app/posts/15/photo_1.jpg'),
(15, 'https://cdn.carsocial.app/posts/15/photo_2.jpg'),

-- Post 16–35 (2 images each)
(16, 'https://cdn.carsocial.app/posts/16/photo_1.jpg'),
(16, 'https://cdn.carsocial.app/posts/16/photo_2.jpg'),
(17, 'https://cdn.carsocial.app/posts/17/photo_1.jpg'),
(17, 'https://cdn.carsocial.app/posts/17/photo_2.jpg'),
(18, 'https://cdn.carsocial.app/posts/18/photo_1.jpg'),
(18, 'https://cdn.carsocial.app/posts/18/photo_2.jpg'),
(19, 'https://cdn.carsocial.app/posts/19/photo_1.jpg'),
(19, 'https://cdn.carsocial.app/posts/19/photo_2.jpg'),
(20, 'https://cdn.carsocial.app/posts/20/photo_1.jpg'),
(20, 'https://cdn.carsocial.app/posts/20/photo_2.jpg'),
(21, 'https://cdn.carsocial.app/posts/21/photo_1.jpg'),
(21, 'https://cdn.carsocial.app/posts/21/photo_2.jpg'),
(22, 'https://cdn.carsocial.app/posts/22/photo_1.jpg'),
(22, 'https://cdn.carsocial.app/posts/22/photo_2.jpg'),
(23, 'https://cdn.carsocial.app/posts/23/photo_1.jpg'),
(23, 'https://cdn.carsocial.app/posts/23/photo_2.jpg'),
(24, 'https://cdn.carsocial.app/posts/24/photo_1.jpg'),
(24, 'https://cdn.carsocial.app/posts/24/photo_2.jpg'),
(25, 'https://cdn.carsocial.app/posts/25/photo_1.jpg'),
(25, 'https://cdn.carsocial.app/posts/25/photo_2.jpg'),
(26, 'https://cdn.carsocial.app/posts/26/photo_1.jpg'),
(26, 'https://cdn.carsocial.app/posts/26/photo_2.jpg'),
(27, 'https://cdn.carsocial.app/posts/27/photo_1.jpg'),
(27, 'https://cdn.carsocial.app/posts/27/photo_2.jpg'),
(28, 'https://cdn.carsocial.app/posts/28/photo_1.jpg'),
(28, 'https://cdn.carsocial.app/posts/28/photo_2.jpg'),
(29, 'https://cdn.carsocial.app/posts/29/photo_1.jpg'),
(29, 'https://cdn.carsocial.app/posts/29/photo_2.jpg'),
(30, 'https://cdn.carsocial.app/posts/30/photo_1.jpg'),
(30, 'https://cdn.carsocial.app/posts/30/photo_2.jpg'),
(31, 'https://cdn.carsocial.app/posts/31/photo_1.jpg'),
(31, 'https://cdn.carsocial.app/posts/31/photo_2.jpg'),
(32, 'https://cdn.carsocial.app/posts/32/photo_1.jpg'),
(32, 'https://cdn.carsocial.app/posts/32/photo_2.jpg'),
(33, 'https://cdn.carsocial.app/posts/33/photo_1.jpg'),
(33, 'https://cdn.carsocial.app/posts/33/photo_2.jpg'),
(34, 'https://cdn.carsocial.app/posts/34/photo_1.jpg'),
(34, 'https://cdn.carsocial.app/posts/34/photo_2.jpg'),
(35, 'https://cdn.carsocial.app/posts/35/photo_1.jpg'),
(35, 'https://cdn.carsocial.app/posts/35/photo_2.jpg'),

-- Post 36–40 (1 image each)  => total 75 rows
(36, 'https://cdn.carsocial.app/posts/36/photo_1.jpg'),
(37, 'https://cdn.carsocial.app/posts/37/photo_1.jpg'),
(38, 'https://cdn.carsocial.app/posts/38/photo_1.jpg'),
(39, 'https://cdn.carsocial.app/posts/39/photo_1.jpg'),
(40, 'https://cdn.carsocial.app/posts/40/photo_1.jpg');
```

-- 14) Bot (needs Users)
INSERT INTO Bot (DevId, Name) VALUES
(2,  'TrackHelper'),
(3,  'DynoWizard'),
(4,  'RouteScout'),
(5,  'GripAdvisor'),
(6,  'FitmentGenie'),
(7,  'TorqueTutor'),
(8,  'PitCrewBot'),
(9,  'PaintGuru'),
(10, 'BoostBuddy'),
(11, 'EventHerald'),
(12, 'PhotoPicker'),
(13, 'PadMatcher'),
(14, 'FuelEconomy'),
(15, 'LapTimer'),
(16, 'GearboxGuide'),
(17, 'MapMarker'),
(18, 'AlertBeacon'),
(19, 'VendorFinder'),
(20, 'PostScheduler'),
(21, 'SpamShield'),
(22, 'TrendWatcher'),
(23, 'MeetupMatcher'),
(24, 'AeroAdvisor'),
(25, 'DynoPlanner'),
(26, 'TuneTracker'),
(27, 'TrackMarshal'),
(28, 'PartsCrawler'),
(29, 'RoutePlanner'),
(30, 'WrapDesigner'),
(31, 'RSVPHelper');


-- 15) Script (needs Bot)
INSERT INTO Script (BotId, Script)
VALUES
(1,  'if post.contains("scam") then flag'),
(2,  'if (logs.missing("afr")) { notify("upload logs"); }'),
(3,  'if (route.reports > 3) { warn("hazard ahead"); }'),
(4,  'if (track.temp_c < 10) { suggest("raise tire psi"); }'),
(5,  'if (wheel.offset < +30) { alert("check fender clearance"); }'),
(6,  'if (part == "wheel_lug") { reply("torque 90 lb-ft"); }'),
(7,  'if (radio.chatter == "high") { post("use push-to-talk"); }'),
(8,  'if comment.contains("swirl") then suggest("finishing pad")'),
(9,  'if (boost.leak == true) { post("smoke test recommended"); }'),
(10, 'if (event.startsInHours(24)) { announce("final reminder"); }'),
(11, 'if (photo.sharpness < 0.7) { reject("pick another cover"); }'),
(12, 'if (rotor.temp > 500) { recommend("endurance pads"); }'),
(13, 'if (trip.range_km < 80) { addStop("fuel"); }'),
(14, 'if (lap.delta < -0.2) { cheer("new PB!"); }'),
(15, 'if (shift == "3->2") { coach("blip throttle"); }'),
(16, 'if (spot.type == "photo") { addPin(); }'),
(17, 'if report.contains("gravel") then broadcast("turn 7 hazard")'),
(18, 'if (price.drop > 10) { notify("deal found"); }'),
(19, 'if (engagement.hour == "high") { schedule(post); }'),
(20, 'if post.contains("spam") then delete'),
(21, 'if (topic.trending) { suggest("#hashtag"); }'),
(22, 'if (user.nearby && seats > 0) { suggest("carpool"); }'),
(23, 'if (rake_mm < 5) { advise("increase rake"); }'),
(24, 'if (dyno.queue > 10) { openSlot(30); }'),
(25, 'if (map == "E85") { note("use colder plugs"); }'),
(26, 'if (incident.reported) { flag("needs review"); }'),
(27, 'if (stock == 0) { watch("HX-88"); }'),
(28, 'if route.contains("toll") then avoid("toll")'),
(29, 'if (theme == "retro90s") { suggest("teal/purple"); }'),
(30, 'if (rsvp.remaining < 5) { notify("almost full"); }'),
(31, 'if (rsvp.window == "24h") { remind("respond now"); }');



-- 16) Bot_Flags_Post
INSERT INTO Bot_Flags_Post (BotId, PostId) VALUES
-- one flag per post (Posts 1–70), BotId cycles 1–31
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),
(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),
(31,31),
(1,32),(2,33),(3,34),(4,35),(5,36),(6,37),(7,38),(8,39),(9,40),(10,41),
(11,42),(12,43),(13,44),(14,45),(15,46),(16,47),(17,48),(18,49),(19,50),(20,51),
(21,52),(22,53),(23,54),(24,55),(25,56),(26,57),(27,58),(28,59),(29,60),(30,61),
(31,62),
(1,63),(2,64),(3,65),(4,66),(5,67),(6,68),(7,69),(8,70),

-- extra moderation on key posts (e.g., ads/spam-sensitive)
(20,45),(31,45),
(20,50),(31,50),(21,50),
(20,15),(20,35),
(21,25),(21,29),
(20,41);


-- 17) Bot_Flags_Comment
```sql
INSERT INTO Bot_Flags_Comment (BotId, CommentId) VALUES
(1,1),(15,1),
(2,2),(16,2),
(3,3),(17,3),
(4,4),(18,4),
(5,5),(19,5),
(6,6),(20,6),
(7,7),(21,7),
(8,8),(22,8),
(9,9),(23,9),
(10,10),(24,10),
(11,11),(25,11),
(12,12),(26,12),
(13,13),(27,13),
(14,14),(28,14),
(15,15),(29,15),
(16,16),(30,16),
(17,17),(31,17),
(18,18),(1,18),
(19,19),(2,19),
(20,20),(3,20),
(21,21),(4,21),
(22,22),(5,22),
(23,23),(6,23),
(24,24),(7,24),
(25,25),(8,25),
(26,26),(9,26),
(27,27),(10,27),
(28,28),(11,28),
(29,29),(12,29),
(30,30),(13,30),
(31,31),(14,31),
(1,32),(15,32),
(2,33),(16,33),
(3,34),(17,34),
(4,35),(18,35),
(5,36),(19,36),
(6,37),(20,37),
(7,38),(21,38),
(8,39),(22,39),
(9,40),(23,40),
(10,41),(24,41),
(11,42),(25,42),
(12,43),(26,43),
(13,44),(27,44),
(14,45),(28,45),
(15,46),(29,46),
(16,47),(30,47),
(17,48),(31,48),
(18,49),(1,49),
(19,50),(2,50),
(20,51),(3,51),
(21,52),(4,52),
(22,53),(5,53),
(23,54),(6,54),
(24,55),(7,55),
(25,56),(8,56),
(26,57),(9,57),
(27,58),(10,58),
(28,59),(11,59),
(29,60),(12,60),
(30,61),(13,61),
(31,62),(14,62),
(1,63),(15,63),
(2,64),(16,64),
(3,65),(17,65),
(4,66),(18,66),
(5,67),(19,67),
(6,68),(20,68),
(7,69),(21,69),
(8,70),(22,70),
(9,71),(23,71),
(10,72),(24,72),
(11,73),(25,73),
(12,74),(26,74),
(13,75),(27,75);
```


-- 18) Moderator_Deletes_Comment
INSERT INTO Moderator_Deletes_Comment (UserId, CommentId) VALUES
(3, 50),
(7, 12),
(11, 18),
(15, 25),
(19, 33),
(23, 37),
(27, 45),
(31, 57),
(35, 60),
(39, 63),
(5, 5),
(9, 22),
(13, 29),
(17, 41),
(21, 44),
(25, 49),
(29, 52),
(33, 55),
(37, 61),
(1, 64),
(6, 66),
(10, 69),
(14, 71),
(18, 73);


-- 19) Moderator_Deletes_Post
INSERT INTO Moderator_Deletes_Post (UserId, PostId) VALUES
(3, 50),
(7, 45),
(11, 41),
(15, 35),
(19, 20),
(23, 27),
(27, 31),
(31, 33),
(35, 39),
(39, 52),
(5, 12),
(9, 18),
(13, 24),
(17, 56),
(21, 58),
(25, 61),
(29, 63),
(33, 66),
(37, 68),
(1, 69),
(6, 70),
(10, 15),
(14, 25),
(18, 47);


-- 20) Group_Users
INSERT INTO Group_Users (GroupId, UserId) VALUES
(1,1),(1,8),(1,15),(1,22),(1,29),(1,36),
(2,2),(2,9),(2,16),(2,23),(2,30),(2,37),
(3,3),(3,10),(3,17),(3,24),(3,31),(3,38),
(4,4),(4,11),(4,18),(4,25),(4,32),(4,39),
(5,5),(5,12),(5,19),(5,26),(5,33),(5,40),
(6,6),(6,13),(6,20),(6,27),(6,34),(6,1),
(7,7),(7,14),(7,21),(7,28),(7,35),(7,2),
(8,8),(8,15),(8,22),(8,29),(8,36),(8,3),
(9,9),(9,16),(9,23),(9,30),(9,37),(9,4),
(10,10),(10,17),(10,24),(10,31),(10,38),(10,5),
(11,11),(11,18),(11,25),(11,32),(11,39),(11,6),
(12,12),(12,19),(12,26),(12,33),(12,40),(12,7),
(13,13),(13,20),(13,27),(13,34),(13,1),(13,8),
(14,14),(14,21),(14,28),(14,35),(14,2),(14,9),
(15,15),(15,22),(15,29),(15,36),(15,3),(15,10),
(16,16),(16,23),(16,30),(16,37),(16,4),(16,11),
(17,17),(17,24),(17,31),(17,38),(17,5),(17,12),
(18,18),(18,25),(18,32),(18,39),(18,6),(18,13),
(19,19),(19,26),(19,33),(19,40),(19,7),(19,14),
(20,20),(20,27),(20,34),(20,1),(20,8),(20,15),
(21,21),(21,28),(21,35),(21,2),(21,9),(21,16),
(22,22),(22,29),(22,36),(22,3),(22,10),(22,17),
(23,23),(23,30),(23,37),(23,4),(23,11),(23,18),
(24,24),(24,31),(24,38),(24,5),(24,12),(24,19),
(25,25),(25,32),(25,39),(25,6),(25,13),(25,20),
(26,26),(26,33),(26,40),(26,7),(26,14),(26,21),
(27,27),(27,34),(27,1),(27,8),(27,15),(27,22),
(28,28),(28,35),(28,2),(28,9),(28,16),(28,23),
(29,29),(29,36),(29,3),(29,10),(29,17),(29,24),
(30,30),(30,37),(30,4),(30,11),(30,18),(30,25),
(31,31),(31,38),(31,5),(31,12),(31,19),(31,26),
(32,32),(32,39),(32,6),(32,13),(32,20),(32,27),
(33,33),(33,40),(33,7),(33,14),(33,21),(33,28),
(34,34),(34,1),(34,8),(34,15),(34,22),(34,29),
(35,35),(35,2),(35,9),(35,16),(35,23),(35,30);

-- 21) RSVP (needs Users)
INSERT INTO RSVP (SubmitterId, Status)
VALUES
(1, 'Going'),
(2, 'Maybe');

-- 22) Form_Questions
INSERT INTO Form_Questions (RsvpId, Question, Answer)
VALUES
(1, 'Do you need parking?', 'Yes'),
(2, 'Bringing guests?', 'No');

-- 23) Event_RSVPs
INSERT INTO Event_RSVPs (RsvpId, EventId)
VALUES
(1, 1),
(2, 2);

-- 24) Resources_Templates (needs Event)
INSERT INTO Resources_Templates (EventId, Notes)
VALUES
(1, 'Need extra cameras'),
(2, 'Stage setup required');

-- 25) Equipment_List (needs Resources_Templates)
INSERT INTO Equipment_List (PlanId, Equipment, Amount)
VALUES
(1, 'Camera', 5),
(2, 'Stage Lights', 10);

-- 26) Supply_List (needs Resources_Templates)
INSERT INTO Supply_List (PlanId, Supply, Amount)
VALUES
(1, 'Batteries', 20),
(2, 'Water Bottles', 50);

-- 27) Cars (needs Users)
INSERT INTO Cars (OwnerId, Make, Model, ModelYear, ExteriorColor, InteriorColor, PurchaseDate)
VALUES
(1, 'Toyota', 'Corolla', 2020, 'Blue', 'Black', '2020-05-10'),
(2, 'Ford', 'Mustang', 2022, 'Red', 'Black', '2022-07-15');

-- 28) Car_Build (needs Cars)
INSERT INTO Car_Build (CarId, Exhaust, Turbo, Engine, Wheels, Downpipes)
VALUES
(1, 'Sport Exhaust', 'None', '1.8L', 'Alloy', 'Stock'),
(2, 'Performance Exhaust', 'Turbocharged', 'V8', 'Forged', 'Upgraded');

-- 29) Car_Meta (needs Cars)
INSERT INTO Car_Meta (CarId, Weight, Length, Width, Height, TopSpeed, FuelType)
VALUES
(1, 2800, 180, 70, 55, 120.5, 'Gasoline'),
(2, 3500, 190, 75, 55, 155.0, 'Gasoline');

-- 30) Follower_Followee
INSERT INTO Follower_Followee (FollowerId, FolloweeId)
VALUES
(1, 2),
(2, 1);
