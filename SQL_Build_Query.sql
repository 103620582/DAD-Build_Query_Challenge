/*
Joy Ambrose -- 103620582
*/

/* 

TOUR (TourName, Description)
PK - TourName

EVENT (EventYear, EventMonth, EventDay, Fee, TourName)
PK - (EventYear, EventMonth, EventDay)
FK - (TourName) References TOUR

CLIENT (ClientID, Surname, GivenName, Gender)
PK - (ClientID)

BOOKING (DateBooked, Payment, EventYear, EventMonth, EventDay, ClientID, )
PK - (DateBooked)
FK - (EventYear, EventMonth, EventDay) References Event
FK - (ClientID) References CLIENT