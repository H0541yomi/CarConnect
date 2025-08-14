USE RevNet;

-- 1) Base tables with no dependencies

INSERT INTO Users
(Username, FirstName, LastName, Email, BirthDate, City, State, Country, Gender, Bio, ProfilePictureUrl, Role)
VALUES
('dev_alex', 'Alex', 'Kim', 'alex.kim@example.com', '1995-08-14',
 'Seattle', 'WA', 'USA', 'Non-Binary', 'Automation developer',
 'https://picsum.photos/seed/alex/200/200', 'Consumer,Moderator');

INSERT INTO Group_Chat (OwnerId, Name)
VALUES 
(1, 'General Chat'),
(2, 'Car Enthusiasts');

INSERT INTO Advertiser (Name, Email, CompanyName)
VALUES 
('AdCorp', 'contact@adcorp.com', 'AdCorp Inc.'),
('PromoPro', 'hello@promopro.com', 'PromoPro Ltd');

-- 2) Community (needs Group_Chat, Users)
INSERT INTO Community (OwnerId, ChatId, Name, Description)
VALUES
(1, 1, 'Photography', 'A place for photo lovers'),
(2, 2, 'Cars Club', 'Car modification discussions');

-- 3) Event (needs Users, Community)
INSERT INTO Event (HostId, CommunityId, Name, Description, Type, StartTime, EndTime, Region, Country)
VALUES
(1, 1, 'Photo Walk', 'Outdoor photography event', 'Meetup', '2025-09-01 10:00:00', '2025-09-01 14:00:00', 'Northeast', 'USA'),
(2, 2, 'Car Show', 'Annual custom car showcase', 'Expo', '2025-09-15 09:00:00', '2025-09-15 18:00:00', 'Midwest', 'USA');

-- 4) Post (needs Users, Advertiser, Community, Event)
INSERT INTO Post (AuthorId, AdvertiserId, CommunityId, EventId, Title, Body)
VALUES
(1, 1, 1, 1, 'Welcome to the Photo Walk', 'Details about the event...'),
(2, 2, 2, 2, 'Car Show Highlights', 'Check out these amazing cars...');

-- 5) Campaign_Analytics (needs Advertiser)
INSERT INTO Campaign_Analytics (CampaignId, AnalystId, Name, TotalClicks, TotalViews)
VALUES
(1, 1, 'Photo Campaign', 100, 500),
(2, 2, 'Car Campaign', 200, 800);

-- 6) Message (needs Users, Group_Chat)
INSERT INTO Message (AuthorId, GroupId, Body)
VALUES
(1, 1, 'Hello everyone!'),
(2, 2, 'See you at the car show.');

-- 7) Comment (needs Post, Users)
INSERT INTO Comment (PostId, AuthorId, Body)
VALUES
(1, 2, 'Looking forward to it!'),
(2, 1, 'Nice post!');

-- 8) Community_Members
INSERT INTO Community_Members (CommunityId, UserId)
VALUES
(1, 1), (1, 2), (2, 2), (2, 3);

-- 9) Post_Meta
INSERT INTO Post_Meta (UserId, PostId, Liked, Seen)
VALUES
(1, 1, TRUE, TRUE),
(2, 2, TRUE, FALSE);

-- 10) Comment_Meta
INSERT INTO Comment_Meta (UserId, CommentId, Liked)
VALUES
(1, 1, TRUE),
(2, 2, TRUE);

-- 11) Post_Analytics
INSERT INTO Post_Analytics (PostId, Views, Clicks)
VALUES
(1, 50, 10),
(2, 120, 25);

-- 12) Campaign_Posts_Data
INSERT INTO Campaign_Posts_Data (CampaignId, Timestamp, AnalyticsId)
VALUES
(1, '2025-08-01 12:00:00', 1),
(2, '2025-08-02 12:00:00', 2);

-- 13) Post_Images
INSERT INTO Post_Images (PostId, Url)
VALUES
(1, 'https://example.com/image1.jpg'),
(2, 'https://example.com/image2.jpg');

-- 14) Bot (needs Users)
INSERT INTO Bot (DevId, Name)
VALUES
(1, 'SpamBot'),
(2, 'AutoModerator');

INSERT INTO Bot (Name, DevId)
VALUES ('AutoMod', 10);  -- replace 1 with the actual UserId


-- 15) Script (needs Bot)
INSERT INTO Script (BotId, Script)
VALUES
(1, 'if post.contains("spam") then delete'),
(2, 'flag inappropriate comments');

INSERT INTO Script (BotId, Script)
VALUES
(10, 'if (post.includes("spam")) { flag(); }'),
(10, 'if (comment.length > 1000) { notify("too long"); }');


-- 16) Bot_Flags_Post
INSERT INTO Bot_Flags_Post (BotId, PostId)
VALUES
(1, 1),
(2, 2);

-- 17) Bot_Flags_Comment
INSERT INTO Bot_Flags_Comment (BotId, CommentId)
VALUES
(1, 1),
(2, 2);

-- 18) Moderator_Deletes_Comment
INSERT INTO Moderator_Deletes_Comment (UserId, CommentId)
VALUES
(3, 1);

-- 19) Moderator_Deletes_Post
INSERT INTO Moderator_Deletes_Post (UserId, PostId)
VALUES
(3, 1);

-- 20) Group_Users
INSERT INTO Group_Users (GroupId, UserId)
VALUES
(1, 1), (1, 2), (2, 2), (2, 3);

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
