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


INSERT INTO TOUR (TourName, Description) VALUES ('North', 'Tour of wineries and outlets of the Bedigo and Castlemaine region');
INSERT INTO TOUR (TourName, Description) VALUES ('South', 'Tour of wineries and outlets of Mornington Penisula');
INSERT INTO TOUR (TourName, Description) VALUES ('West', 'Tour of wineries and outlets of the Geelong and Otways region');

INSERT INTO CLIENT (ClientID, Surname, GivenName, Gender) VALUES (1, 'Price', 'Taylor', 'M');
INSERT INTO CLIENT (ClientID, Surname, GivenName, Gender) VALUES (2, 'Gamble', 'Ellyse', 'F');
INSERT INTO CLIENT (ClientID, Surname, GivenName, Gender) VALUES (3, 'Tan', 'Tilly', 'F');
INSERT INTO CLIENT (ClientID, Surname, GivenName, Gender) VALUES (103620582, 'Ambrose', 'Joy', 'F');

INSERT INTO EVENT (TourName, EventYear, EventMonth, EventDay, EventFee) VALUES ('North', 2016, 'Jan', 9, 200);
INSERT INTO EVENT (TourName, EventYear, EventMonth, EventDay, EventFee) VALUES ('North', 2016, 'Feb', 13, 225);
INSERT INTO EVENT (TourName, EventYear, EventMonth, EventDay, EventFee) VALUES ('South', 2016, 'Jan', 9, 200);
INSERT INTO EVENT (TourName, EventYear, EventMonth, EventDay, EventFee) VALUES ('South', 2016, 'Jan', 16, 200);
INSERT INTO EVENT (TourName, EventYear, EventMonth, EventDay, EventFee) VALUES ('West', 2016, 'Jan', 29, 225);

INSERT INTO BOOKING (ClientID, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES (1, 'North', 'Jan', 9, 2016, 200, '2015-12-10');
INSERT INTO BOOKING (ClientID, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES (2, 'North', 'Jan', 9, 2016, 200, '2015-12-16');
INSERT INTO BOOKING (ClientID, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES (1, 'North', 'Feb', 13, 2016, 225, '2016-01-08');
INSERT INTO BOOKING (ClientID, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES (2, 'North', 'Feb', 13, 2916, 125, '2016-01-14');
INSERT INTO BOOKING (ClientID, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES (3, 'North', 'Feb', 13, 2016, 225, '2016-02-03');
INSERT INTO BOOKING (ClientID, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES (1, 'South', 'Jan', 9, 2016, 200, '2015-12-10');
INSERT INTO BOOKING (ClientID, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES (2, 'South', 'Jan', 16, 2016, 200, '2015-12-18');
INSERT INTO BOOKING (ClientID, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES (3, 'South', 'Jan', 16, 2016, 200, '2016-01-09');
INSERT INTO BOOKING (ClientID, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES (2, 'West', 'Jan', 29, 2016, 225, '2015-12-17');
INSERT INTO BOOKING (ClientID, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES (3, 'West', 'Jan', 29, 2016, 200, '2015-12-18');

SELECT * 
from CLIENT




