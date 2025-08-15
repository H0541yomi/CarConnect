-- Naming conventions
-- - No underscore in Attributes. Only use underscore in Tables
-- - Capitalize the first letter of each word

DROP DATABASE IF EXISTS RevNet;
CREATE DATABASE IF NOT EXISTS RevNet;


USE RevNet;



DROP TABLE IF EXISTS Car_Meta;
DROP TABLE IF EXISTS Car_Build;
DROP TABLE IF EXISTS Cars;
DROP TABLE IF EXISTS Supply_List;
DROP TABLE IF EXISTS Equipment_List;
DROP TABLE IF EXISTS Resources_Templates;
DROP TABLE IF EXISTS Event_RSVPs;
DROP TABLE IF EXISTS Form_Questions;
DROP TABLE IF EXISTS RSVP;
DROP TABLE IF EXISTS Group_Users;
DROP TABLE IF EXISTS Moderator_Deletes_Post;
DROP TABLE IF EXISTS Moderator_Deletes_Comment;
DROP TABLE IF EXISTS Bot_Flags_Post;
DROP TABLE IF EXISTS Bot_Flags_Comment;
DROP TABLE IF EXISTS Script;
DROP TABLE IF EXISTS Bot;
DROP TABLE IF EXISTS Post_Images;
DROP TABLE IF EXISTS Campaign_Posts_Data;
DROP TABLE IF EXISTS Post_Analytics;
DROP TABLE IF EXISTS Post_Meta;
DROP TABLE IF EXISTS Comment_Meta;
DROP TABLE IF EXISTS Community_Members;
DROP TABLE IF EXISTS Comment;
DROP TABLE IF EXISTS Message;
DROP TABLE IF EXISTS Campaign_Analytics;
DROP TABLE IF EXISTS Post;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Advertiser;
DROP TABLE IF EXISTS Community;
DROP TABLE IF EXISTS Group_Chat;
DROP TABLE IF EXISTS Users;


CREATE TABLE IF NOT EXISTS Users
(
   UserId            INT PRIMARY KEY AUTO_INCREMENT,
   Username          VARCHAR(20) NOT NULL UNIQUE,
   FirstName         VARCHAR(50),
   MiddleName        VARCHAR(50),
   LastName          VARCHAR(50),
   Email             VARCHAR(100),
   BirthDate         DATE,
   City              VARCHAR(100),
   State             VARCHAR(100),
   Country           VARCHAR(50),
   Gender            ENUM ('Male', 'Female', 'Non-Binary'),
   Bio               TEXT,
   ProfilePictureUrl VARCHAR(9999),
   Role              SET ('Consumer', 'Event Organizer', 'Moderator') DEFAULT 'Consumer'
);


CREATE TABLE IF NOT EXISTS Group_Chat
(
   GroupId   INT PRIMARY KEY AUTO_INCREMENT,
   OwnerId   INT,
   Name      VARCHAR(50) NOT NULL,
   CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (OwnerId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS Community
(
   CommunityId INT PRIMARY KEY AUTO_INCREMENT,
   OwnerId     INT,
   ChatId      INT         NOT NULL UNIQUE,
   CreatedAt   DATETIME DEFAULT CURRENT_TIMESTAMP,
   Name        VARCHAR(20) NOT NULL UNIQUE,
   Description TEXT,
   FOREIGN KEY (OwnerId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE SET NULL,
   FOREIGN KEY (ChatId) REFERENCES Group_Chat (GroupId)
       ON UPDATE CASCADE
       ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS Advertiser
(
   AdvertiserId INT PRIMARY KEY AUTO_INCREMENT,
   Name         VARCHAR(100),
   Email        VARCHAR(100),
   CompanyName  VARCHAR(100),
   CreatedAt    DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS Event
(
   EventId     INT PRIMARY KEY AUTO_INCREMENT,
   HostId      INT,
   CommunityId INT,
   Name        VARCHAR(20) NOT NULL,
   Description TEXT,
   Type        VARCHAR(20),
   StartTime   DATETIME,
   EndTime     DATETIME,
   Region      VARCHAR(100),
   Country     VARCHAR(50),
   INDEX (Name),
   FOREIGN KEY (HostId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (CommunityId) REFERENCES Community (CommunityId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Post
(
   PostId       INT PRIMARY KEY AUTO_INCREMENT,
   AuthorId     INT,
   AdvertiserId INT,
   CommunityId  INT,
   EventId      INT,
   Likes        INT UNSIGNED DEFAULT 0,
   Dislikes     INT UNSIGNED DEFAULT 0,
   Title        VARCHAR(128) NOT NULL,
   Body         text         NOT NULL,
   CreatedAt    DATETIME DEFAULT CURRENT_TIMESTAMP,
   Deleted      BOOLEAN DEFAULT 0 ,
   Flagged      BOOLEAN DEFAULT 0,
   INDEX (Title),
   INDEX (CreatedAt),
   FOREIGN KEY (AuthorId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (AdvertiserId) REFERENCES Advertiser (AdvertiserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (CommunityId) REFERENCES Community (CommunityId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (EventId) REFERENCES Event (EventId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Campaign_Analytics
(
   CampaignId         INT,
   Timestamp          DATETIME      DEFAULT CURRENT_TIMESTAMP,
   AnalystId          INT  NOT NULL,
   Name               VARCHAR(20) NOT NULL,
   TotalClicks        INT UNSIGNED  DEFAULT 0,
   TotalViews         INT UNSIGNED  DEFAULT 0,
   AverageConversions DECIMAL(8, 2) DEFAULT 0,
   AverageImpressions DECIMAL(8, 2) DEFAULT 0,
   AverageCTR         DECIMAL(4, 3) DEFAULT 0,
   AverageCPC         DECIMAL(5, 2) DEFAULT 0,
   PRIMARY KEY (CampaignId, Timestamp),
   INDEX (Name),
   FOREIGN KEY (AnalystId) REFERENCES Advertiser (AdvertiserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Message
(
   MessageId INT PRIMARY KEY AUTO_INCREMENT,
   AuthorId  INT  NOT NULL,
   GroupId   INT  NOT NULL,
   Body      TEXT NOT NULL,
   CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (AuthorId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (GroupId) REFERENCES Group_Chat (GroupId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Comment
(
   CommentId INT PRIMARY KEY AUTO_INCREMENT,
   PostId    INT  NOT NULL,
   AuthorId  INT  NOT NULL,
   Likes     INT UNSIGNED DEFAULT 0,
   Dislikes  INT UNSIGNED DEFAULT 0,
   Body      TEXT NOT NULL,
   CreatedAt DATETIME     DEFAULT CURRENT_TIMESTAMP,
   Deleted   BOOLEAN DEFAULT 0,
   Flagged   BOOLEAN DEFAULT 0,
   FOREIGN KEY (PostId) REFERENCES Post (PostId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (AuthorId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Community_Members
(
    CommunityId INT NOT NULL,
    UserId      INT NOT NULL,
    JoinedAt    DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (CommunityId, UserId),
    FOREIGN KEY (CommunityId) REFERENCES Community (CommunityId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (UserId) REFERENCES Users (UserId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Post_Meta
(
   PostMetaId INT  AUTO_INCREMENT PRIMARY KEY,
   UserId     INT NOT NULL,
   PostId     INT NOT NULL,
   Liked      BOOLEAN,
   Disliked   BOOLEAN,
   Seen       BOOLEAN,
   Clicked    BOOLEAN,
   FOREIGN KEY (UserId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (PostId) REFERENCES Post (PostId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Comment_Meta
(
   CommentMetaId INT AUTO_INCREMENT PRIMARY KEY,
   UserId        INT NOT NULL,
   CommentId     INT NOT NULL,
   Liked         BOOLEAN,
   Disliked      BOOLEAN,
   Seen          BOOLEAN,
   FOREIGN KEY (UserId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (CommentId) REFERENCES Comment (CommentId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Post_Analytics
(
   AnalyticsId INT AUTO_INCREMENT,
   Timestamp   DATETIME      DEFAULT CURRENT_TIMESTAMP,
   PostId      INT UNIQUE NOT NULL,
   Views       INT UNSIGNED  DEFAULT 0,
   Clicks      INT UNSIGNED  DEFAULT 0,
   CTR         DECIMAL(4, 3) DEFAULT 0,
   CPC         DECIMAL(5, 2) DEFAULT 0,
   Conversions INT UNSIGNED  DEFAULT 0,
   Impressions INT UNSIGNED  DEFAULT 0,
   PRIMARY KEY (AnalyticsId),
   FOREIGN KEY (PostId) REFERENCES Post (PostId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Campaign_Posts_Data
(
   CampaignId  INT NOT NULL,
   AnalyticsId INT NOT NULL,
   Timestamp DATETIME NOT NULL,
   PRIMARY KEY (CampaignId, Timestamp, AnalyticsId),
   FOREIGN KEY (CampaignId, Timestamp) 
        REFERENCES Campaign_Analytics (CampaignId, Timestamp)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (AnalyticsId) REFERENCES Post_Analytics (AnalyticsId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Post_Images
(
   ImageId INT AUTO_INCREMENT PRIMARY KEY,
   PostId INT NOT NULL,
   Url    TEXT NOT NULL,
   FOREIGN KEY (PostId) REFERENCES Post (PostId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Bot
(
   BotId INT PRIMARY KEY AUTO_INCREMENT,
   DevId INT UNIQUE,
   Name  VARCHAR(20) UNIQUE,
   FOREIGN KEY (DevId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS Script
(
   ScriptId INT PRIMARY KEY AUTO_INCREMENT,
   BotId    INT  NOT NULL,
   Script   TEXT NOT NULL,
   FOREIGN KEY (BotId) REFERENCES Bot (BotId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Bot_Flags_Post
(
   BotId  INT NOT NULL,
   PostId INT NOT NULL,
   PRIMARY KEY (BotId, PostId),
   FOREIGN KEY (BotId) REFERENCES Bot (BotId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (PostId) REFERENCES Post (PostId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Bot_Flags_Comment
(
   BotId     INT NOT NULL,
   CommentId INT NOT NULL,
   PRIMARY KEY (BotId, CommentId),
   FOREIGN KEY (BotId) REFERENCES Bot (BotId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (CommentId) REFERENCES Comment (CommentId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Moderator_Deletes_Comment
(
   UserId    INT NOT NULL,
   CommentId INT NOT NULL,
   PRIMARY KEY (UserId, CommentId),
   FOREIGN KEY (UserId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (CommentId) REFERENCES Comment (CommentId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Moderator_Deletes_Post
(
   UserId INT NOT NULL,
   PostId INT NOT NULL,
   PRIMARY KEY (UserId, PostId),
   FOREIGN KEY (UserId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (PostId) REFERENCES Post (PostId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Group_Users
(
   GroupId  INT NOT NULL,
   UserId   INT NOT NULL,
   JoinedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (GroupId, UserId),
   FOREIGN KEY (GroupId) REFERENCES Group_Chat (GroupId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (UserId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS RSVP
(
   RsvpId      INT PRIMARY KEY AUTO_INCREMENT,
   SubmitterId INT UNIQUE NOT NULL,
   Status      VARCHAR(20),
   SubmittedAt DATETIME DEFAULT CURRENT_TIMESTAMP
       ON UPDATE CURRENT_TIMESTAMP,
   FOREIGN KEY (SubmitterId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Form_Questions
(
   QuestionId INT PRIMARY KEY AUTO_INCREMENT,
   RsvpId    INT,
   Question   VARCHAR(400),
   Answer     TEXT,
   FOREIGN KEY (RsvpId) REFERENCES RSVP (RsvpId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Event_RSVPs
(
   RsvpId INT NOT NULL,
   EventId INT NOT NULL,
   PRIMARY KEY (RsvpId, EventId),
   FOREIGN KEY (RsvpId) REFERENCES RSVP (RsvpId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (EventId) REFERENCES Event (EventId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Resources_Templates
(
   PlanId  INT PRIMARY KEY AUTO_INCREMENT,
   EventId INT,
   Notes   TEXT,
   FOREIGN KEY (EventId) REFERENCES Event (EventId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Equipment_List
(
   EquipmentListId INT PRIMARY KEY AUTO_INCREMENT,
   PlanId       INT,
   Equipment    VARCHAR(100) NOT NULL,
   Amount       INT UNSIGNED NOT NULL,
   FOREIGN KEY (PlanId) REFERENCES Resources_Templates (PlanId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Supply_List
(
   SupplyListId INT PRIMARY KEY AUTO_INCREMENT,
   PlanId          INT,
   Supply          VARCHAR(100) NOT NULL,
   Amount          INT UNSIGNED NOT NULL,
   FOREIGN KEY (PlanId) REFERENCES Resources_Templates (PlanId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Cars
(
   CarId         INT PRIMARY KEY AUTO_INCREMENT,
   OwnerId       INT,
   Make          VARCHAR(50),
   Model         VARCHAR(50),
   ModelYear     YEAR,
   ExteriorColor VARCHAR(50),
   InteriorColor VARCHAR(50),
   PurchaseDate  DATE,
   FOREIGN KEY (OwnerId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS Car_Build
(
   BuildId   INT PRIMARY KEY AUTO_INCREMENT,
   CarId     INT,
   Exhaust   VARCHAR(128),
   Turbo     VARCHAR(128),
   Engine    VARCHAR(128),
   Wheels    VARCHAR(128),
   Downpipes VARCHAR(128),
   FOREIGN KEY (CarId) REFERENCES Cars (CarId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Car_Meta
(
   CarMetaId INT PRIMARY KEY AUTO_INCREMENT,
   CarId     INT UNIQUE NOT NULL,
   Weight    INT,
   Length    INT,
   Width     INT,
   Height    INT,
   TopSpeed  DECIMAL(6, 2),
   FuelType  VARCHAR(20),
   FOREIGN KEY (CarId) REFERENCES Cars (CarId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Follower_Followee
(
   FollowerId INT NOT NULL,
   FolloweeId INT NOT NULL,
   PRIMARY KEY (FolloweeId, FollowerId),
   FOREIGN KEY (FollowerId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
   FOREIGN KEY (FolloweeId) REFERENCES Users (UserId)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);
