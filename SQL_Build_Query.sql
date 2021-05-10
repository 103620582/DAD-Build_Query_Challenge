/*
Joy Ambrose -- 10362058

TOUR (TourName, Description)
PK - TourName

EVENT (EventYear, EventMonth, EventDay, Fee, TourName)
PK - (EventYear, EventMonth, EventDay)
FK - (TourName) References TOUR

CLIENT (ClientID, Surname, GivenName, Gender)
PK - (ClientID)

BOOKING (ClientID, TourName, EventMonth, EventDay, Payment, DateBooked)
PK - (ClientID, Tourname, EventMonth, EventDay, EventYear)
FK - (ClientID) References CLIENT
FK - (TourName) References TOUR
FK - (EventYear, EventMonth, EventDay) References Event

*/



CREATE TABLE TOUR (
    TourName    NVARCHAR(100)
,   Description NVARCHAR(500)
,   PRIMARY KEY (TourName)
);

CREATE TABLE CLIENT (
    ClientID    INT
,   Surname     NVARCHAR(100) NOT NULL
,   GivenName   NVARCHAR(100) NOT NULL
,   Gender      NVARCHAR(1) 
,   PRIMARY KEY (ClientID)
);

CREATE TABLE EVENT (
    TourName    NVARCHAR(100)
,   EventMonth  NVARCHAR(3)
,   EventDay    INT
,   EventYear   INT
,   EventFee    MONEY NOT NULL
,   PRIMARY KEY (EventYear, EventMonth, EventDay)
,   FOREIGN KEY (TourName) REFERENCES TOUR (TourName)
);

CREATE TABLE BOOKING (
    ClientID    INT
,   TourName    NVARCHAR(100)
,   EventMonth  NVARCHAR(3)
,   EventDay    INT 
,   EventYear   INT
,   Payment     INT
,   DateBooked  DATE NOT NULL
,   PRIMARY KEY (ClientID, TourName, EventMonth, EventDay, EventYear)
,   FOREIGN KEY (ClientID) REFERENCES CLIENT (ClientID)
,   FOREIGN KEY (TourName) REFERENCES TOUR (TourName)
,   FOREIGN KEY (EventYear, EventMonth, EventDay) REFERENCES EVENT (EventYear, EventMonth, EventDay)
);


SELECT *
FROM INFORMATION_SCHEMA.TABLES