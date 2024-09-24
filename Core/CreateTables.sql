/* Create tables Line, Station, Services */
CREATE TABLE Lines (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Stations (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    LineID INT,
    IsClosed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (LineID) REFERENCES Lines(ID)
);

CREATE TABLE Services (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE StationService (
    ID SERIAL PRIMARY KEY,
    StationID INT,
    ServiceID INT,
    FOREIGN KEY (StationID) REFERENCES Stations(ID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ID)
);