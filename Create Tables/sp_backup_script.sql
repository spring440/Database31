ALTER PROC dbo.sp_backup_script
AS
BEGIN
  CREATE TABLE Person
  (
    person_id   INT IDENTITY
      PRIMARY KEY,
    person_name VARCHAR(64)
  );

  CREATE TABLE Presenter
  (
    presenter_id        INT IDENTITY
      PRIMARY KEY,
    person_id           INT
      CONSTRAINT Presenter_Person_person_id_fk
      REFERENCES Person,
    speaking_experience VARCHAR(MAX)
  );

  CREATE TABLE Volunteer
  (
    volunteer_id    INT IDENTITY
      CONSTRAINT Volunteer_volunteer_id_pk
      PRIMARY KEY,
    person_id       INT
      CONSTRAINT Volunteer_Person_person_id_fk
      REFERENCES Person,
    volunteer_tasks VARCHAR(MAX),
    event_id        INT
  );

  CREATE TABLE Organizer
  (
    organizer_id   INT IDENTITY
      PRIMARY KEY,
    person_id      INT
      CONSTRAINT Organizer_Person_person_id_fk
      REFERENCES Person,
    organizer_task VARCHAR(MAX),
    event_id       INT
  );

  CREATE TABLE Attendee
  (
    attendee_id     INT IDENTITY
      PRIMARY KEY,
    person_id       INT
      CONSTRAINT Attendee_Person_person_id_fk
      REFERENCES Person,
    attendee_loc_id INT,
    email           VARCHAR(256)
  );

  CREATE TABLE Attendee_Address
  (
    attendee_location_id    INT IDENTITY
      PRIMARY KEY,
    attendee_street_address VARCHAR(128),
    attendee_city           VARCHAR(64),
    attendee_zip            VARCHAR(16),
    attendee_state_country  VARCHAR(64)
  );

  ALTER TABLE Attendee
    ADD CONSTRAINT Attendee_Attendee_Address_attendee_location_id_fk
  FOREIGN KEY (attendee_loc_id) REFERENCES Attendee_Address;

  CREATE TABLE Sponsors
  (
    sponsor_id     INT IDENTITY
      PRIMARY KEY,
    sponsor_name   VARCHAR(128),
    sponsor_status VARCHAR(32),
    table_id       INT
  );

  CREATE TABLE Events
  (
    event_id     INT IDENTITY
      PRIMARY KEY,
    event_date   VARCHAR(32),
    event_name   VARCHAR(32),
    event_loc_id INT
  );

  CREATE TABLE Venues
  (
    venue_id     INT IDENTITY
      PRIMARY KEY,
    venue_city   VARCHAR(64),
    venue_region VARCHAR(64)
  );

  ALTER TABLE Events
    ADD CONSTRAINT Events_Venues_event_loc_id_fk
  FOREIGN KEY (event_loc_id) REFERENCES Venues;

  CREATE TABLE Lecture_Hall
  (
    room_id      INT IDENTITY PRIMARY KEY,
    room_number  INT NOT NULL,
    event_loc_id INT
      CONSTRAINT Classroom_Venues_event_loc_id_fk
      REFERENCES Venues,
    capacity     INT
  );


  CREATE TABLE Track
  (
    track_id INT IDENTITY
      PRIMARY KEY,
    topic    VARCHAR(256)
  )

  CREATE TABLE Performance
  (
    performance_id        INT IDENTITY
      PRIMARY KEY,
    presentation_id       INT,
    avg_performance_score INT
  );

  CREATE TABLE Tables
  (
    table_id     INT IDENTITY PRIMARY KEY,
    table_number INT,
    event_id     INT
      CONSTRAINT Tables_Events_event_id_fk
      REFERENCES Events
  );

  ALTER TABLE Sponsors
    ADD CONSTRAINT Sponsors_Tables_table_id_fk
  FOREIGN KEY (table_id) REFERENCES Tables;

  CREATE TABLE Lecture_Times
  (
    lecture_time_id INT IDENTITY
      PRIMARY KEY,
    presentation_id INT,
    room_id         INT
      CONSTRAINT Schedule_Classroom_room_id_fk
      REFERENCES Lecture_Hall,
    start_time      DATETIME,
    end_time        DATETIME,
    track_id        INT
      CONSTRAINT Schedule_Track_track_id_fk
      REFERENCES Track
  );

  CREATE TABLE Presentation
  (
    presentation_id INT IDENTITY
      PRIMARY KEY,
    title           VARCHAR(256),
    difficulty      VARCHAR(32),
    venue_id        INT
      CONSTRAINT Presentation_Event_Locations_venue_id_fk
      REFERENCES Venues
  );

  ALTER TABLE Performance
    ADD CONSTRAINT Performance_Presentation_presentation_id_fk
  FOREIGN KEY (presentation_id) REFERENCES Presentation;

  ALTER TABLE Lecture_Times
    ADD CONSTRAINT Schedule_Presentation_presentation_id_fk
  FOREIGN KEY (presentation_id) REFERENCES Presentation;

  CREATE TABLE Presentation_Presenter
  (
    presenter_id    INT NOT NULL
      CONSTRAINT Presentation_Presenter_Presenter_presenter_id_fk
      REFERENCES Presenter,
    presentation_id INT NOT NULL
      CONSTRAINT Presentation_Presenter_Presentation_presentation_id_fk
      REFERENCES Presentation,
    CONSTRAINT tb_pk
    PRIMARY KEY (presenter_id, presentation_id)
  );


  INSERT INTO Person VALUES ('Amanda Long');
  INSERT INTO Person VALUES ('Christian Shan');
  INSERT INTO Person VALUES ('Troy Sara');
  INSERT INTO Person VALUES ('Kaitlyn Baker');
  INSERT INTO Person VALUES ('Suzanne Ma');
  INSERT INTO Person VALUES ('Anna Jones');
  INSERT INTO Person VALUES ('Carlos Baker');
  INSERT INTO Person VALUES ('Tanya Munoz');
  INSERT INTO Person VALUES ('Tabitha Gill');
  INSERT INTO Person VALUES ('Alexis Lee');
  INSERT INTO Person VALUES ('Erick Suri');
  INSERT INTO Person VALUES ('Marcus Evans');
  INSERT INTO Person VALUES ('Marcus Clark');
  INSERT INTO Person VALUES ('Gilbert Xu');
  INSERT INTO Person VALUES ('Paula Rubio');
  INSERT INTO Person VALUES ('Julian Isla');
  INSERT INTO Person VALUES ('Jesse Scott');
  INSERT INTO Person VALUES ('Naomi Sanz');
  INSERT INTO Person VALUES ('Isabella Lee');
  INSERT INTO Person VALUES ('Dawn Yuan');
  INSERT INTO Person VALUES ('Olivia Blue');
  INSERT INTO Person VALUES ('Emmanuel Lopez');
  INSERT INTO Person VALUES ('Nathan Yang');
  INSERT INTO Person VALUES ('Gabrielle Wood');
  INSERT INTO Person VALUES ('Katrina Anand');
  INSERT INTO Person VALUES ('Anthony Jones');
  INSERT INTO Person VALUES ('Natalie Reed');
  INSERT INTO Person VALUES ('Dakota Ross');
  INSERT INTO Person VALUES ('Shawn Goel');
  INSERT INTO Person VALUES ('Nicole Diaz');
  INSERT INTO Person VALUES ('Wyatt Davis');
  INSERT INTO Person VALUES ('Christy Huang');
  INSERT INTO Person VALUES ('Sydney Evans');
  INSERT INTO Person VALUES ('Katherine Baker');
  INSERT INTO Person VALUES ('Edward Wood');
  INSERT INTO Person VALUES ('Johnny Rai');
  INSERT INTO Person VALUES ('Emily Moore');
  INSERT INTO Person VALUES ('Randy Yang');
  INSERT INTO Person VALUES ('Roy Ruiz');
  INSERT INTO Person VALUES ('Marshall Sun');
  INSERT INTO Person VALUES ('Gabriella Perez');
  INSERT INTO Person VALUES ('Erika Gill');
  INSERT INTO Person VALUES ('Kathryn Shen');
  INSERT INTO Person VALUES ('Sharon Yuan');
  INSERT INTO Person VALUES ('Victoria Lee');
  INSERT INTO Person VALUES ('Brenda Arun');
  INSERT INTO Person VALUES ('Alex Scott');
  INSERT INTO Person VALUES ('Yolanda Luo');
  INSERT INTO Person VALUES ('Martin Vance');
  INSERT INTO Person VALUES ('Jeremy Roberts');
  INSERT INTO Person VALUES ('Amanda Ramirez');
  INSERT INTO Person VALUES ('Jada Nelson');
  INSERT INTO Person VALUES ('Hunter Wright');
  INSERT INTO Person VALUES ('Sierra Wright');
  INSERT INTO Person VALUES ('Sarah Simmons');
  INSERT INTO Person VALUES ('Mandar Samant');
  INSERT INTO Person VALUES ('Isaiah Rogers');
  INSERT INTO Person VALUES ('Ian Foster');
  INSERT INTO Person VALUES ('Ben Miller');
  INSERT INTO Person VALUES ('Sarah Barnes');
  INSERT INTO Person VALUES ('Casey Martin');
  INSERT INTO Person VALUES ('Victoria Murphy');
  INSERT INTO Person VALUES ('Sydney Rogers');
  INSERT INTO Person VALUES ('Marvin Hernandez');
  INSERT INTO Person VALUES ('Carlos Carter');
  INSERT INTO Person VALUES ('Rebekah Garcia');
  INSERT INTO Person VALUES ('Haley Henderson');
  INSERT INTO Person VALUES ('Jacob Taylor');
  INSERT INTO Person VALUES ('Seth Martin');
  INSERT INTO Person VALUES ('Larry Suarez');
  INSERT INTO Person VALUES ('Garrett Vargas');
  INSERT INTO Person VALUES ('Abby Martinez');
  INSERT INTO Person VALUES ('Justin Thomas');
  INSERT INTO Person VALUES ('Evelyn Martinez');
  INSERT INTO Person VALUES ('Pamela Chapman');
  INSERT INTO Person VALUES ('Kayla Griffin');
  INSERT INTO Person VALUES ('Jill Navarro');
  INSERT INTO Person VALUES ('Nathan Walker');
  INSERT INTO Person VALUES ('Tabitha Moreno');
  INSERT INTO Person VALUES ('Mason Sanchez');
  INSERT INTO Person VALUES ('Natasha Navarro');
  INSERT INTO Person VALUES ('Kevin Russell');
  INSERT INTO Person VALUES ('Katelyn Rivera');
  INSERT INTO Person VALUES ('Alfredo Ortega');
  INSERT INTO Person VALUES ('Andrea Campbell');
  INSERT INTO Person VALUES ('Jeremy Peterson');
  INSERT INTO Person VALUES ('Arianna Ramirez');
  INSERT INTO Person VALUES ('Mario Sharma');
  INSERT INTO Person VALUES ('Adam Collins');
  INSERT INTO Person VALUES ('Taylor Martin');
  INSERT INTO Person VALUES ('Gabriel Collins');
  INSERT INTO Person VALUES ('Randall Martin');
  INSERT INTO Person VALUES ('Samantha Jenkins');
  INSERT INTO Person VALUES ('Justin Simmons');
  INSERT INTO Person VALUES ('Ethan Winston');
  INSERT INTO Person VALUES ('Hunter Roberts');
  INSERT INTO Person VALUES ('Nathaniel Murphy');
  INSERT INTO Person VALUES ('Charles Wilson');
  INSERT INTO Person VALUES ('Carrie Alvarez');
  INSERT INTO Person VALUES ('Paige Alexander');
  INSERT INTO Person VALUES ('Aaron Bertrand');
  INSERT INTO Person VALUES ('Adam Jorgensen');
  INSERT INTO Person VALUES ('Allan Hirt');
  INSERT INTO Person VALUES ('Andy Leonard');
  INSERT INTO Person VALUES ('Brandon Leach');
  INSERT INTO Person VALUES ('Brent Ozar');
  INSERT INTO Person VALUES ('Carl Berglund');
  INSERT INTO Person VALUES ('Chris Bell');
  INSERT INTO Person VALUES ('Chris Seferlis');
  INSERT INTO Person VALUES ('David Bermingham');
  INSERT INTO Person VALUES ('David Hansen');
  INSERT INTO Person VALUES ('David Peter Hansen');
  INSERT INTO Person VALUES ('Dennis Messina');
  INSERT INTO Person VALUES ('Edward Pollack');
  INSERT INTO Person VALUES ('George Walters');
  INSERT INTO Person VALUES ('Gigi Bell');
  INSERT INTO Person VALUES ('Grant Fritchey');
  INSERT INTO Person VALUES ('Greg Moore');
  INSERT INTO Person VALUES ('Hilary Cotter');
  INSERT INTO Person VALUES ('Jack Corbett');
  INSERT INTO Person VALUES ('James Serra');
  INSERT INTO Person VALUES ('Jason Brimhall');
  INSERT INTO Person VALUES ('Jason Horner');
  INSERT INTO Person VALUES ('Jeremiah Peschka');
  INSERT INTO Person VALUES ('Joe Chang');
  INSERT INTO Person VALUES ('John Flannery');
  INSERT INTO Person VALUES ('John Miner');
  INSERT INTO Person VALUES ('John Sterrett');
  INSERT INTO Person VALUES ('Joseph D`Antoni');
  INSERT INTO Person VALUES ('Kennie Pontoppidan');
  INSERT INTO Person VALUES ('Kevin Goff');
  INSERT INTO Person VALUES ('Kevin Schenega');
  INSERT INTO Person VALUES ('Melissa Riley');
  INSERT INTO Person VALUES ('Michael Corey');
  INSERT INTO Person VALUES ('Michael Wharton');
  INSERT INTO Person VALUES ('Mickey Stuewe');
  INSERT INTO Person VALUES ('Mike Hillwig');
  INSERT INTO Person VALUES ('Mike Walsh');
  INSERT INTO Person VALUES ('Mohammad Yusuf');
  INSERT INTO Person VALUES ('Paresh Motiwala');
  INSERT INTO Person VALUES ('Paul Rizza');
  INSERT INTO Person VALUES ('Richie Rump');
  INSERT INTO Person VALUES ('Robert Pearl');
  INSERT INTO Person VALUES ('Sayed Saeed');
  INSERT INTO Person VALUES ('SQLSaturday 364');
  INSERT INTO Person VALUES ('Stacia Misner');
  INSERT INTO Person VALUES ('Stephane Frachette');
  INSERT INTO Person VALUES ('Steve Simon');
  INSERT INTO Person VALUES ('Sunil Kadimdiwan');
  INSERT INTO Person VALUES ('Thomas Grohser');
  INSERT INTO Person VALUES ('Todd Chittenden');
  INSERT INTO Person VALUES ('Varsham Papikian');
  --   Begin random person
  INSERT INTO Person VALUES ('Jerri Mikuszewski');
  INSERT INTO Person VALUES ('Na Mood');
  INSERT INTO Person VALUES ('Mikki Gerster');
  INSERT INTO Person VALUES ('Ellis Chennault');
  INSERT INTO Person VALUES ('Sarina Hanko');
  INSERT INTO Person VALUES ('Dianna Rumfelt');
  INSERT INTO Person VALUES ('Julietta Polaco');
  INSERT INTO Person VALUES ('Manual Kasserman');
  INSERT INTO Person VALUES ('Rebbecca Dishian');
  INSERT INTO Person VALUES ('Rhea Karstens');
  INSERT INTO Person VALUES ('Fred Otter');
  INSERT INTO Person VALUES ('Page Mullenax');
  INSERT INTO Person VALUES ('Lynette Machon');
  INSERT INTO Person VALUES ('Marti Gajica');
  INSERT INTO Person VALUES ('Eugenie Kawasaki');
  INSERT INTO Person VALUES ('Rosamaria Lardner');
  INSERT INTO Person VALUES ('Marvin Kirkhart');
  INSERT INTO Person VALUES ('Augustina Meginnis');
  INSERT INTO Person VALUES ('Cleo Lancon');
  INSERT INTO Person VALUES ('Meryl Viel');
  INSERT INTO Person VALUES ('Fae Cattladge');
  INSERT INTO Person VALUES ('Elizabeth Mages');
  INSERT INTO Person VALUES ('Virgie Fino');
  INSERT INTO Person VALUES ('Madlyn Catania');
  INSERT INTO Person VALUES ('Trevor Kincaid');
  INSERT INTO Person VALUES ('Sheila Piccone');
  INSERT INTO Person VALUES ('Marlo Holtsoi');
  INSERT INTO Person VALUES ('Shawanna Baires');
  INSERT INTO Person VALUES ('Tamela Betran');
  INSERT INTO Person VALUES ('Merlene Puzo');
  INSERT INTO Person VALUES ('Reena Mcghay');
  INSERT INTO Person VALUES ('Genaro Fitsgerald');
  INSERT INTO Person VALUES ('Sunni Chestnutt');
  INSERT INTO Person VALUES ('Sacha Trotto');
  INSERT INTO Person VALUES ('Rhea Cuizon');
  INSERT INTO Person VALUES ('Leda Exum');
  INSERT INTO Person VALUES ('Ebony Suits');
  INSERT INTO Person VALUES ('Yun Salle');
  INSERT INTO Person VALUES ('Kassandra Gresh');
  INSERT INTO Person VALUES ('Jolene Masaki');
  INSERT INTO Person VALUES ('Carolann Widger');
  INSERT INTO Person VALUES ('Diedre Pazmino');
  INSERT INTO Person VALUES ('Sylvia Peppard');
  INSERT INTO Person VALUES ('Alyce Utt');
  INSERT INTO Person VALUES ('Jasper Cabla');
  INSERT INTO Person VALUES ('Doreatha Reekers');
  INSERT INTO Person VALUES ('Wilton Reitano');
  INSERT INTO Person VALUES ('Sari Lockley');
  INSERT INTO Person VALUES ('Kala Caivano');
  INSERT INTO Person VALUES ('Lajuana Doss');
  INSERT INTO Person VALUES ('Loan Rouser');
  INSERT INTO Person VALUES ('Aleta Hellar');
  INSERT INTO Person VALUES ('Maddie Hilleary');
  INSERT INTO Person VALUES ('Leonore Caminita');
  INSERT INTO Person VALUES ('Sena Zukerman');
  INSERT INTO Person VALUES ('Wm Shevitz');
  INSERT INTO Person VALUES ('Cheryle Sanderson');
  INSERT INTO Person VALUES ('Luci Cartagena');
  INSERT INTO Person VALUES ('Megan Mcentee');
  INSERT INTO Person VALUES ('Shila Ternullo');
  INSERT INTO Person VALUES ('Vinnie Routledge');
  INSERT INTO Person VALUES ('Shavonne Zschoche');
  INSERT INTO Person VALUES ('Cruz Connolly');
  INSERT INTO Person VALUES ('Marisha Hedge');
  INSERT INTO Person VALUES ('Opal Verdell');
  INSERT INTO Person VALUES ('Brooke Penski');
  INSERT INTO Person VALUES ('Pattie Xia');
  INSERT INTO Person VALUES ('Rebecca Cajka');
  INSERT INTO Person VALUES ('Shonda Muoio');
  INSERT INTO Person VALUES ('Erline Ishihara');
  INSERT INTO Person VALUES ('Karl Dumler');
  INSERT INTO Person VALUES ('Jerry Reinartz');
  INSERT INTO Person VALUES ('Darrell Delira');
  INSERT INTO Person VALUES ('Leigha Gimble');
  INSERT INTO Person VALUES ('Nannie Bagby');
  INSERT INTO Person VALUES ('Lucius Sheff');
  INSERT INTO Person VALUES ('Reena Siegal');
  INSERT INTO Person VALUES ('Millie Gott');
  INSERT INTO Person VALUES ('Verlie Damone');
  INSERT INTO Person VALUES ('Theressa Bischoff');
  INSERT INTO Person VALUES ('Kenton Derossett');
  INSERT INTO Person VALUES ('Julio Gerstle');
  INSERT INTO Person VALUES ('Belinda Chicoine');
  INSERT INTO Person VALUES ('Kena Loughnane');
  INSERT INTO Person VALUES ('Dalene Colmenares');
  INSERT INTO Person VALUES ('Selina Harns');
  INSERT INTO Person VALUES ('Patsy Minneweather');
  INSERT INTO Person VALUES ('Jeremiah Loudermelt');
  INSERT INTO Person VALUES ('Armando Thornbrough');
  INSERT INTO Person VALUES ('Crystal Villalobos');
  INSERT INTO Person VALUES ('Gilberte Warford');
  INSERT INTO Person VALUES ('Alba Ronero');
  INSERT INTO Person VALUES ('Adelaide String');
  INSERT INTO Person VALUES ('Shannan Kirschke');
  INSERT INTO Person VALUES ('Chaya Kickel');
  INSERT INTO Person VALUES ('Le Garnto');
  INSERT INTO Person VALUES ('Larraine Calame');
  INSERT INTO Person VALUES ('Christinia Rodrigeuz');
  INSERT INTO Person VALUES ('Noah Mcnellie');
  INSERT INTO Person VALUES ('Elizbeth Widhalm');
  INSERT INTO Person VALUES ('Reatha Lohwasser');
  INSERT INTO Person VALUES ('Dalene Midgley');
  INSERT INTO Person VALUES ('Lori Maslonka');
  INSERT INTO Person VALUES ('Winnifred Montrella');
  INSERT INTO Person VALUES ('Randy Trillas');
  INSERT INTO Person VALUES ('Benjamin Shirvanian');
  INSERT INTO Person VALUES ('Jackeline Blackstone');
  INSERT INTO Person VALUES ('Jenny Brez');
  INSERT INTO Person VALUES ('Ethelene Wozny');
  INSERT INTO Person VALUES ('Tyrell Vilegas');
  INSERT INTO Person VALUES ('Mora Sperbeck');
  INSERT INTO Person VALUES ('Adelina Hemmer');
  INSERT INTO Person VALUES ('Brande Zapatas');
  INSERT INTO Person VALUES ('Kenia Petaccio');
  INSERT INTO Person VALUES ('Shirl Krutsch');
  INSERT INTO Person VALUES ('Chris Nett');
  INSERT INTO Person VALUES ('Ghislaine Mickleberry');
  INSERT INTO Person VALUES ('Bennett Hemley');
  INSERT INTO Person VALUES ('Ardelia Beteta');
  INSERT INTO Person VALUES ('Tiffaney Ruscetti');
  INSERT INTO Person VALUES ('Ninfa Lynge');
  INSERT INTO Person VALUES ('Gita Colombo');
  INSERT INTO Person VALUES ('Abe Madise');
  INSERT INTO Person VALUES ('Jeannetta Wider');
  INSERT INTO Person VALUES ('Danae Mosley');
  INSERT INTO Person VALUES ('Lynetta Bartz');
  INSERT INTO Person VALUES ('Retta Grange');
  INSERT INTO Person VALUES ('Arla Barroso');
  INSERT INTO Person VALUES ('Lawerence Gearheart');
  INSERT INTO Person VALUES ('Basilia Older');
  INSERT INTO Person VALUES ('Kym Lilyblade');
  INSERT INTO Person VALUES ('Takisha Puffenberger');
  INSERT INTO Person VALUES ('Sergio Drossos');
  INSERT INTO Person VALUES ('Dottie Strassel');
  INSERT INTO Person VALUES ('Tamra Harbison');
  INSERT INTO Person VALUES ('Drusilla Colombini');
  INSERT INTO Person VALUES ('Arturo Karasek');
  INSERT INTO Person VALUES ('Bonita Bogust');
  INSERT INTO Person VALUES ('Mikel Tenerovich');
  INSERT INTO Person VALUES ('Janel Visnosky');
  INSERT INTO Person VALUES ('Terra Bayt');
  INSERT INTO Person VALUES ('Hermina Weck');
  INSERT INTO Person VALUES ('Shanon Brogan');
  INSERT INTO Person VALUES ('Darlena Korbal');
  INSERT INTO Person VALUES ('Lucie Boerger');
  INSERT INTO Person VALUES ('Jazmine Verley');
  INSERT INTO Person VALUES ('Val Stech');
  INSERT INTO Person VALUES ('Hank Pinger');
  INSERT INTO Person VALUES ('Bob Cristales');
  INSERT INTO Person VALUES ('Dodie Edvalson');
  INSERT INTO Person VALUES ('Raymonde Caroselli');
  INSERT INTO Person VALUES ('Nathanael Jeanlouis');
  INSERT INTO Person VALUES ('Yang Kelso');
  INSERT INTO Person VALUES ('Dionne Studmire');
  INSERT INTO Person VALUES ('Lyla Dorries');
  INSERT INTO Person VALUES ('Cristina Ursery');
  INSERT INTO Person VALUES ('Florida Garinger');
  INSERT INTO Person VALUES ('Delmy Geniesse');
  INSERT INTO Person VALUES ('Nidia Sauber');
  INSERT INTO Person VALUES ('Mellie Reinowski');
  INSERT INTO Person VALUES ('Ramona Colabrese');
  INSERT INTO Person VALUES ('Bryon Durke');
  INSERT INTO Person VALUES ('Brenda Fanelli');
  INSERT INTO Person VALUES ('Goldie Gomez');
  INSERT INTO Person VALUES ('Kathyrn Liebl');
  INSERT INTO Person VALUES ('Suzanne Naquin');
  INSERT INTO Person VALUES ('Sharron Schul');
  INSERT INTO Person VALUES ('Donella Kalenkoski');
  INSERT INTO Person VALUES ('Amado Klocke');
  INSERT INTO Person VALUES ('Deangelo Goller');
  INSERT INTO Person VALUES ('Arturo Degooyer');
  INSERT INTO Person VALUES ('Asia Ganoe');
  INSERT INTO Person VALUES ('Melodie Joynson');
  INSERT INTO Person VALUES ('Cindie Grune');
  INSERT INTO Person VALUES ('Venita Succar');
  INSERT INTO Person VALUES ('Colette Wooddell');
  INSERT INTO Person VALUES ('Rae Maha');
  INSERT INTO Person VALUES ('Laraine Iriarte');
  INSERT INTO Person VALUES ('Cheryl Gasner');
  INSERT INTO Person VALUES ('Sunshine Murri');
  INSERT INTO Person VALUES ('Emelina Groebner');
  INSERT INTO Person VALUES ('Maureen Belin');
  INSERT INTO Person VALUES ('Shalon Rower');
  INSERT INTO Person VALUES ('Marilu Tabuena');
  INSERT INTO Person VALUES ('Tereasa Jeavons');
  INSERT INTO Person VALUES ('Cherise Erebia');
  INSERT INTO Person VALUES ('Courtney Neimeyer');
  INSERT INTO Person VALUES ('Sheila Defrank');
  INSERT INTO Person VALUES ('Jannette Chao');
  INSERT INTO Person VALUES ('Molly Buchholtz');
  INSERT INTO Person VALUES ('Adriana Swietoniowski');
  INSERT INTO Person VALUES ('Elvie Villalta');
  INSERT INTO Person VALUES ('Bernice Jodway');
  INSERT INTO Person VALUES ('Stan Fribley');
  INSERT INTO Person VALUES ('Fallon Bachhuber');
  INSERT INTO Person VALUES ('Carmon Mathers');
  INSERT INTO Person VALUES ('Harrison Thorpe');
  INSERT INTO Person VALUES ('Charita Mrowka');
  INSERT INTO Person VALUES ('Yoshiko Benchoff');
  INSERT INTO Person VALUES ('Lucile Gilland');
  INSERT INTO Person VALUES ('Liberty Mikesell');
  INSERT INTO Person VALUES ('Andy Massart');
  INSERT INTO Person VALUES ('Nelia Zevenbergen');
  INSERT INTO Person VALUES ('Maryanne Heinzig');
  INSERT INTO Person VALUES ('Estelle Harbinson');
  INSERT INTO Person VALUES ('Demetrice Stutheit');
  INSERT INTO Person VALUES ('Michiko Hickinbotham');
  INSERT INTO Person VALUES ('Silas Trevis');
  INSERT INTO Person VALUES ('Mohammed Nestingen');
  INSERT INTO Person VALUES ('Shantelle Patria');
  INSERT INTO Person VALUES ('Vashti Ackerley');
  INSERT INTO Person VALUES ('Euna Dettloff');
  INSERT INTO Person VALUES ('Filomena Killoy');
  INSERT INTO Person VALUES ('Marina Stancle');
  INSERT INTO Person VALUES ('Colton Guin');
  INSERT INTO Person VALUES ('Jama Wiechert');
  INSERT INTO Person VALUES ('Racquel Pettas');
  INSERT INTO Person VALUES ('Coleen Gullick');
  INSERT INTO Person VALUES ('Kenna Kiley');
  INSERT INTO Person VALUES ('Edison Malkiewicz');
  INSERT INTO Person VALUES ('Marcelina Baoloy');
  INSERT INTO Person VALUES ('Rea Hamway');
  INSERT INTO Person VALUES ('Estelle Nomura');
  INSERT INTO Person VALUES ('Brett Jirjis');
  INSERT INTO Person VALUES ('Loris Yocius');
  INSERT INTO Person VALUES ('Lamar Strachan');
  INSERT INTO Person VALUES ('Ramiro Cenat');
  INSERT INTO Person VALUES ('Lindsay Tinley');
  INSERT INTO Person VALUES ('Kena Dolores');
  INSERT INTO Person VALUES ('Arlene Weeda');
  INSERT INTO Person VALUES ('Elia Scherff');
  INSERT INTO Person VALUES ('Cari Shears');
  INSERT INTO Person VALUES ('Mirta Wilts');
  INSERT INTO Person VALUES ('Jarvis Kinnon');
  INSERT INTO Person VALUES ('Angele Chatt');
  INSERT INTO Person VALUES ('Tonita Rashid');
  INSERT INTO Person VALUES ('Veronica Flicek');
  INSERT INTO Person VALUES ('Randall Beuerle');
  INSERT INTO Person VALUES ('Marianna Mcgaffey');
  INSERT INTO Person VALUES ('Basil Forge');
  INSERT INTO Person VALUES ('Hester Ketchem');
  INSERT INTO Person VALUES ('Minta Skepple');
  INSERT INTO Person VALUES ('Serafina Warmbrod');
  INSERT INTO Person VALUES ('Azucena Elgart');
  INSERT INTO Person VALUES ('Leora Boudin');
  INSERT INTO Person VALUES ('Isis Hargens');
  INSERT INTO Person VALUES ('Ima Even');
  INSERT INTO Person VALUES ('Shelba Poppo');
  INSERT INTO Person VALUES ('Dolly Childes');
  INSERT INTO Person VALUES ('Lola Lina');
  INSERT INTO Person VALUES ('Kylie Battee');
  INSERT INTO Person VALUES ('Bill Wanless');
  INSERT INTO Person VALUES ('Elfreda Ritch');
  INSERT INTO Person VALUES ('Arnetta Ville');
  INSERT INTO Person VALUES ('Hilaria Palys');
  INSERT INTO Person VALUES ('Kaycee Vandermeer');
  INSERT INTO Person VALUES ('Aurelio Elsaesser');
  INSERT INTO Person VALUES ('Karyn Nayman');
  INSERT INTO Person VALUES ('Caron Hyacinthe');
  INSERT INTO Person VALUES ('Devora Nordyke');
  INSERT INTO Person VALUES ('Rema Carneal');
  INSERT INTO Person VALUES ('Shu Kissner');
  INSERT INTO Person VALUES ('Tia Vito');
  INSERT INTO Person VALUES ('Nedra Baires');
  INSERT INTO Person VALUES ('Domitila Jorinscay');
  INSERT INTO Person VALUES ('Alvaro Columbres');
  INSERT INTO Person VALUES ('Fiona Luallen');
  INSERT INTO Person VALUES ('Al Gesell');
  INSERT INTO Person VALUES ('Joi Espree');
  INSERT INTO Person VALUES ('Rona Brockmeier');
  INSERT INTO Person VALUES ('Natalia Lescarbeau');
  INSERT INTO Person VALUES ('Rosendo Merlos');
  INSERT INTO Person VALUES ('Olinda Fecher');
  INSERT INTO Person VALUES ('Becky Bangura');
  INSERT INTO Person VALUES ('Myrta Demattia');
  INSERT INTO Person VALUES ('Arletta Brakeman');
  INSERT INTO Person VALUES ('Demetrice Ballew');
  INSERT INTO Person VALUES ('Carleen Leis');
  INSERT INTO Person VALUES ('Elvin Minnich');
  INSERT INTO Person VALUES ('Ingeborg Hoffeditz');
  INSERT INTO Person VALUES ('Lana Whildin');
  INSERT INTO Person VALUES ('Azucena Vanlaar');
  INSERT INTO Person VALUES ('Bennett Thixton');
  INSERT INTO Person VALUES ('Keva Ashman');
  INSERT INTO Person VALUES ('Terrance Seawood');
  INSERT INTO Person VALUES ('Hae Bamforth');
  INSERT INTO Person VALUES ('Gwendolyn Kriete');
  INSERT INTO Person VALUES ('Anderson Dougharity');
  INSERT INTO Person VALUES ('Alvin Kilbride');
  INSERT INTO Person VALUES ('Nathanael Lehnertz');
  INSERT INTO Person VALUES ('Jorge Traux');
  INSERT INTO Person VALUES ('Renata Lill');
  INSERT INTO Person VALUES ('Shana Papageorge');
  INSERT INTO Person VALUES ('Viva Ternasky');
  INSERT INTO Person VALUES ('Stanton Stoeke');
  INSERT INTO Person VALUES ('Emelina Furlotte');
  INSERT INTO Person VALUES ('Quinton Stelling');
  INSERT INTO Person VALUES ('Justin Marble');
  INSERT INTO Person VALUES ('Sabra Chesbrough');
  INSERT INTO Person VALUES ('Dillon Cantero');
  INSERT INTO Person VALUES ('Clint Stallsmith');
  INSERT INTO Person VALUES ('Veronique Kaai');
  INSERT INTO Person VALUES ('Marita Lenling');
  INSERT INTO Person VALUES ('Rosalinda Armenteros');
  INSERT INTO Person VALUES ('Ismael Sickafoose');
  INSERT INTO Person VALUES ('Lanie Coerver');
  INSERT INTO Person VALUES ('Mitsuko Derkach');
  INSERT INTO Person VALUES ('Junita Rachels');
  INSERT INTO Person VALUES ('Byron Iwanejko');
  INSERT INTO Person VALUES ('Adria Schoepflin');
  INSERT INTO Person VALUES ('Katharyn Rezendes');
  INSERT INTO Person VALUES ('Alecia Schoenle');
  INSERT INTO Person VALUES ('Gearldine Mcmillen');
  INSERT INTO Person VALUES ('Regenia Potthoff');
  INSERT INTO Person VALUES ('Devora Inciong');
  INSERT INTO Person VALUES ('Marshall Frigon');
  INSERT INTO Person VALUES ('Evelia Schepens');
  INSERT INTO Person VALUES ('Katelynn Jeziorski');
  INSERT INTO Person VALUES ('Pearl Kry');
  INSERT INTO Person VALUES ('Elke Winrow');
  INSERT INTO Person VALUES ('Lanny Grassano');
  INSERT INTO Person VALUES ('Nichol Wanamaker');
  INSERT INTO Person VALUES ('Duane Tewell');
  INSERT INTO Person VALUES ('Hilario Kryst');
  INSERT INTO Person VALUES ('Bennie Fort');
  INSERT INTO Person VALUES ('Ligia Schlenger');
  INSERT INTO Person VALUES ('Iola Fumero');
  INSERT INTO Person VALUES ('Jenifer Vignaux');
  INSERT INTO Person VALUES ('Claretta Barros');
  INSERT INTO Person VALUES ('Frieda Carrow');
  INSERT INTO Person VALUES ('Jocelyn Ficht');
  INSERT INTO Person VALUES ('Jacques Beyers');
  INSERT INTO Person VALUES ('Tobie Fukada');
  INSERT INTO Person VALUES ('America Urbano');
  INSERT INTO Person VALUES ('Ludie Lunt');
  INSERT INTO Person VALUES ('Leisa Pundt');
  INSERT INTO Person VALUES ('Wendie Ventry');
  INSERT INTO Person VALUES ('Elbert Itzkowitz');
  INSERT INTO Person VALUES ('Herlinda Abercrombie');
  INSERT INTO Person VALUES ('Ricky Babick');
  INSERT INTO Person VALUES ('Leonie Febus');
  INSERT INTO Person VALUES ('Evie Nido');
  INSERT INTO Person VALUES ('Derek Kesselring');
  INSERT INTO Person VALUES ('Harland Gamblin');
  INSERT INTO Person VALUES ('Casimira Stratos');
  INSERT INTO Person VALUES ('Mervin Methvin');
  INSERT INTO Person VALUES ('Ressie Phebus');
  INSERT INTO Person VALUES ('Santana Mciff');
  INSERT INTO Person VALUES ('Inger Scheaffer');
  INSERT INTO Person VALUES ('Deirdre Knauss');
  INSERT INTO Person VALUES ('Georgeann Lalk');
  INSERT INTO Person VALUES ('Ricki Daffron');
  INSERT INTO Person VALUES ('Erick Sipper');
  INSERT INTO Person VALUES ('Oretha Richmon');
  INSERT INTO Person VALUES ('Vivian Haverland');
  INSERT INTO Person VALUES ('Isaac Towell');
  INSERT INTO Person VALUES ('Darlene Gerrits');
  INSERT INTO Person VALUES ('Carmen Nicolet');
  INSERT INTO Person VALUES ('Tamela Duquaine');
  INSERT INTO Person VALUES ('Roxanne Niblett');
  INSERT INTO Person VALUES ('Pat Teahan');
  INSERT INTO Person VALUES ('Donnetta Kingston');
  INSERT INTO Person VALUES ('Barbie Markarian');
  INSERT INTO Person VALUES ('Breanne Gingell');
  INSERT INTO Person VALUES ('Camelia Ganaway');
  INSERT INTO Person VALUES ('Rina Danni');
  INSERT INTO Person VALUES ('Jewel Forguson');
  INSERT INTO Person VALUES ('Jeana Kowall');
  INSERT INTO Person VALUES ('Amalia Roundabush');
  INSERT INTO Person VALUES ('Ayako Stanberry');
  INSERT INTO Person VALUES ('Herma Westermeier');
  INSERT INTO Person VALUES ('Milissa Lupi');
  INSERT INTO Person VALUES ('Arlen Sievel');
  INSERT INTO Person VALUES ('Mardell Incle');
  INSERT INTO Person VALUES ('Annemarie Cerasoli');
  INSERT INTO Person VALUES ('Marcell Marcelli');
  INSERT INTO Person VALUES ('Agatha Melillo');
  INSERT INTO Person VALUES ('Annemarie Vagott');
  INSERT INTO Person VALUES ('Maggie Korff');
  INSERT INTO Person VALUES ('Flor Smtih');
  INSERT INTO Person VALUES ('Easter Dastoli');
  INSERT INTO Person VALUES ('Mayra Cuningham');
  INSERT INTO Person VALUES ('Golden Mleczynski');
  INSERT INTO Person VALUES ('Efren Schildknecht');
  INSERT INTO Person VALUES ('Alisa Losh');
  INSERT INTO Person VALUES ('Phillip Rosebrook');
  INSERT INTO Person VALUES ('Cleveland Ijames');
  INSERT INTO Person VALUES ('Dortha Vescio');
  INSERT INTO Person VALUES ('Millie Berrier');
  INSERT INTO Person VALUES ('Claudette Rainie');
  INSERT INTO Person VALUES ('Aura Muran');
  INSERT INTO Person VALUES ('Tiana Hallman');
  INSERT INTO Person VALUES ('Vance Tallon');
  INSERT INTO Person VALUES ('Shawana Awad');
  INSERT INTO Person VALUES ('Rivka Sackett');
  INSERT INTO Person VALUES ('Edmund Chavera');
  INSERT INTO Person VALUES ('Crystal Ledl');
  INSERT INTO Person VALUES ('Clotilde Beedy');
  INSERT INTO Person VALUES ('Aiko Swinderman');
  INSERT INTO Person VALUES ('Brett Matamoros');
  INSERT INTO Person VALUES ('Charita Dimezza');
  INSERT INTO Person VALUES ('Daniel Catani');
  INSERT INTO Person VALUES ('Ivy Sesco');
  INSERT INTO Person VALUES ('Talisha Jorinscay');
  INSERT INTO Person VALUES ('Edgardo Groholski');
  INSERT INTO Person VALUES ('Apryl Harnan');
  INSERT INTO Person VALUES ('Eldora Dove');
  INSERT INTO Person VALUES ('Sau Loar');
  INSERT INTO Person VALUES ('Tracee Gillcrest');
  INSERT INTO Person VALUES ('Allan Gentle');
  INSERT INTO Person VALUES ('Manda Durk');
  INSERT INTO Person VALUES ('Jacquelin Andresen');
  INSERT INTO Person VALUES ('Marcela Ensley');
  INSERT INTO Person VALUES ('Nan Larman');
  INSERT INTO Person VALUES ('Marva Larbi');
  INSERT INTO Person VALUES ('Porsche Samowitz');
  INSERT INTO Person VALUES ('Asha Sandoral');
  INSERT INTO Person VALUES ('Larita Greger');
  INSERT INTO Person VALUES ('Tonie Vinzant');
  INSERT INTO Person VALUES ('Carolee Pedlar');
  INSERT INTO Person VALUES ('Rhett Souto');
  INSERT INTO Person VALUES ('Cira Wotring');
  INSERT INTO Person VALUES ('Alma Thamann');
  INSERT INTO Person VALUES ('Palma Jahnel');
  INSERT INTO Person VALUES ('Karisa Albor');
  INSERT INTO Person VALUES ('Bobbie Ellicott');
  INSERT INTO Person VALUES ('Gianna Petrusky');
  INSERT INTO Person VALUES ('Mara Trejo');
  INSERT INTO Person VALUES ('Tomasa Tear');
  INSERT INTO Person VALUES ('Matthew Champaco');
  INSERT INTO Person VALUES ('Gudrun Phillip');
  INSERT INTO Person VALUES ('Frankie Goodheart');
  INSERT INTO Person VALUES ('Nila Essaid');
  INSERT INTO Person VALUES ('Jetta Mautte');
  INSERT INTO Person VALUES ('Amberly Glossner');
  INSERT INTO Person VALUES ('Euna Ioli');
  INSERT INTO Person VALUES ('Billi Isachsen');
  INSERT INTO Person VALUES ('Sherise Boyle');
  INSERT INTO Person VALUES ('Michelina Klouda');
  INSERT INTO Person VALUES ('Sherril Yuenger');
  INSERT INTO Person VALUES ('Aurelio Redeker');
  INSERT INTO Person VALUES ('Hiram Homestead');
  INSERT INTO Person VALUES ('Jimmie Casselman');
  INSERT INTO Person VALUES ('Jaimie Bleininger');
  INSERT INTO Person VALUES ('Shay Barrack');
  INSERT INTO Person VALUES ('Estell Atwill');
  INSERT INTO Person VALUES ('Laure Heline');
  INSERT INTO Person VALUES ('Tijuana Bezanson');
  INSERT INTO Person VALUES ('Janet Slowinski');
  INSERT INTO Person VALUES ('Berry Garand');
  INSERT INTO Person VALUES ('Queenie Grills');
  INSERT INTO Person VALUES ('Herma Aste');
  INSERT INTO Person VALUES ('Arletha Reeb');
  INSERT INTO Person VALUES ('Michell Kiyabu');
  INSERT INTO Person VALUES ('Justin Giampietro');
  INSERT INTO Person VALUES ('Elden Mandich');
  INSERT INTO Person VALUES ('Gloria Dharas');
  INSERT INTO Person VALUES ('Collen Theo');
  INSERT INTO Person VALUES ('Jonelle Matis');
  INSERT INTO Person VALUES ('Justin Sementilli');
  INSERT INTO Person VALUES ('Carma Scholtz');
  INSERT INTO Person VALUES ('Jasmine Ridgle');
  INSERT INTO Person VALUES ('Richie Kapelke');
  INSERT INTO Person VALUES ('Kassandra Drosick');
  INSERT INTO Person VALUES ('Antionette Older');
  INSERT INTO Person VALUES ('Lashonda Braud');
  INSERT INTO Person VALUES ('Wilber Marchese');
  INSERT INTO Person VALUES ('Martin Racca');
  INSERT INTO Person VALUES ('Kari Blevans');
  INSERT INTO Person VALUES ('Evalyn Litano');
  INSERT INTO Person VALUES ('Margit Fusha');
  INSERT INTO Person VALUES ('Kiesha Mackstutis');
  INSERT INTO Person VALUES ('Caren Burkland');
  INSERT INTO Person VALUES ('Yoko Liberati');
  INSERT INTO Person VALUES ('Melissia Donnelly');
  INSERT INTO Person VALUES ('Mertie Daufeldt');
  INSERT INTO Person VALUES ('Shemeka Galvis');
  INSERT INTO Person VALUES ('Harold Markou');
  INSERT INTO Person VALUES ('Seth Vizcaino');
  INSERT INTO Person VALUES ('Juanita Weiskopf');
  INSERT INTO Person VALUES ('Felicitas Mcleon');
  INSERT INTO Person VALUES ('Aurora Gallegas');
  INSERT INTO Person VALUES ('Karlene Besemer');
  INSERT INTO Person VALUES ('Lise Mickonis');
  INSERT INTO Person VALUES ('Corinna Lonzo');
  INSERT INTO Person VALUES ('Josphine Corlew');
  INSERT INTO Person VALUES ('Nadia Skillom');
  INSERT INTO Person VALUES ('Rey Mccollins');
  INSERT INTO Person VALUES ('Russ Roucoulet');
  INSERT INTO Person VALUES ('Shirleen Dollings');
  INSERT INTO Person VALUES ('Phil Laughman');
  INSERT INTO Person VALUES ('Carolee Lazarine');
  INSERT INTO Person VALUES ('Bennett Witte');
  INSERT INTO Person VALUES ('Coralie Adelgren');
  INSERT INTO Person VALUES ('Shiloh Haigh');
  INSERT INTO Person VALUES ('Hoa Mcgillen');
  INSERT INTO Person VALUES ('Roxana Annarumo');
  INSERT INTO Person VALUES ('Owen Milloway');
  INSERT INTO Person VALUES ('Hugh Pert');
  INSERT INTO Person VALUES ('Shirely Mctague');


  INSERT INTO Attendee_Address VALUES ('10 Napa Ct.', 'Lebanon', '97355', 'Oregon');
  INSERT INTO Attendee_Address VALUES ('1000 Bidweld Street', 'Haney', 'V2W 1W2', 'British Columbia');
  INSERT INTO Attendee_Address VALUES ('1002 N. Spoonwood Court', 'Hervey Bay', '4655', 'Queensland');
  INSERT INTO Attendee_Address VALUES ('1003 Matterhorn Ct', 'Lebanon', '97355', 'Oregon');
  INSERT INTO Attendee_Address VALUES ('1005 Matterhorn Ct.', 'Cambridge', 'CB4 4BZ', 'England');
  INSERT INTO Attendee_Address VALUES ('1005 Matterhorn Ct.', 'Mill Valley', '94941', 'California');
  INSERT INTO Attendee_Address VALUES ('1005 Tanager Court', 'Corvallis', '97330', 'Oregon');
  INSERT INTO Attendee_Address VALUES ('1005 Tanager Court', 'Milsons Point', '2061', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('1006 Deercreek Ln', 'Bellflower', '90706', 'California');
  INSERT INTO Attendee_Address VALUES ('1006 Deercreek Ln', 'Torrance', '90505', 'California');
  INSERT INTO Attendee_Address VALUES ('101 Adobe Dr', 'Coffs Harbour', '2450', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('101 Adobe Dr', 'Puyallup', '98371', 'Washington');
  INSERT INTO Attendee_Address VALUES ('101, avenue de la Gare', 'Peterborough', 'PB12', 'England');
  INSERT INTO Attendee_Address VALUES ('1010 Maple', 'Baltimore', '21201', 'Maryland');
  INSERT INTO Attendee_Address VALUES ('1011 Yolanda Circle', 'Berkeley', '94704', 'California');
  INSERT INTO Attendee_Address VALUES ('1011 Yolanda Circle', 'N. Vancouver', 'V7L 4J4', 'British Columbia');
  INSERT INTO Attendee_Address VALUES ('1013 Holiday Hills Dr.', 'Bremerton', '98312', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1013 Holiday Hills Dr.', 'Gateshead', 'GA10', 'England');
  INSERT INTO Attendee_Address VALUES ('1015 Lynwood Drive', 'Metchosin', 'V9', 'British Columbia');
  INSERT INTO Attendee_Address VALUES ('1019 Carletto Drive', 'Berkeley', '94704', 'California');
  INSERT INTO Attendee_Address VALUES ('1019 Mt. Davidson Court', 'Burien', '98168', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1019 Mt. Davidson Court', 'London', 'SW8 4BG', 'England');
  INSERT INTO Attendee_Address VALUES ('102 Vista Place', 'Santa Monica', '90401', 'California');
  INSERT INTO Attendee_Address VALUES ('1020 Book Road', 'Bremerton', '98312', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1020 Carletto Drive', 'Matraville', '2036', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('1020 Carletto Drive', 'Santa Cruz', '95062', 'California');
  INSERT INTO Attendee_Address VALUES ('1023 Hawkins Street', 'Lebanon', '97355', 'Oregon');
  INSERT INTO Attendee_Address VALUES ('1024 Walnut Blvd.', 'Colma', '94014', 'California');
  INSERT INTO Attendee_Address VALUES ('1025 Holly Oak Drive', 'Leeds', 'LE18', 'England');
  INSERT INTO Attendee_Address VALUES ('1025 R St.', 'Kirkland', '98033', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1025 Yosemite Dr.', 'Oregon City', '97045', 'Oregon');
  INSERT INTO Attendee_Address VALUES ('1028 Green View Court', 'Chula Vista', '91910', 'California');
  INSERT INTO Attendee_Address VALUES ('1028 Green View Court', 'Oregon City', '97045', 'Oregon');
  INSERT INTO Attendee_Address VALUES ('1037 Hayes Court', 'Stoke-on-Trent', 'AS23', 'England');
  INSERT INTO Attendee_Address VALUES ('1039 Adelaide St.', 'West Covina', '91791', 'California');
  INSERT INTO Attendee_Address VALUES ('104 Hilltop Dr.', 'Springwood', '2777', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('104 Kaski Ln.', 'Portland', '97205', 'Oregon');
  INSERT INTO Attendee_Address VALUES ('1040 Greenbush Drive', 'Silverwater', '2264', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('1040 Northridge Road', 'London', 'W1X3SE', 'England');
  INSERT INTO Attendee_Address VALUES ('1044 San Carlos', 'Cincinnati', '45202', 'Ohio');
  INSERT INTO Attendee_Address VALUES ('1045 Lolita Drive', 'Torrance', '90505', 'California');
  INSERT INTO Attendee_Address VALUES ('1045 Lolita Drive', 'Townsville', '4810', 'Queensland');
  INSERT INTO Attendee_Address VALUES ('1047 Las Quebradas Lane', 'North Sydney', '2055', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('1048 Burwood Way', 'Hervey Bay', '4655', 'Queensland');
  INSERT INTO Attendee_Address VALUES ('1048 Las Quebradas Lane', 'Walla Walla', '99362', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1048 Las Quebradas Lane', 'Wollongong', '2500', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('105 Clark Creek Lane', 'Port Macquarie', '2444', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('105 Woodruff Ln.', 'Bellingham', '98225', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1050 Creed Ave', 'London', 'W10 6BL', 'England');
  INSERT INTO Attendee_Address VALUES ('081, boulevard du Montparnasse', 'Seattle', '98104', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1 Smiling Tree Court Space 55', 'Los Angeles', '90012', 'California');
  INSERT INTO Attendee_Address VALUES ('100, rue des Rosiers', 'Everett', '98201', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1002 N. Spoonwood Court', 'Berkeley', '94704', 'California');
  INSERT INTO Attendee_Address VALUES ('1005 Fremont Street', 'Colma', '94014', 'California');
  INSERT INTO Attendee_Address VALUES ('1005 Valley Oak Plaza', 'Langley', 'V3A 4R2', 'British Columbia');
  INSERT INTO Attendee_Address VALUES ('1005 Valley Oak Plaza', 'London', 'SW6 SBY', 'England');
  INSERT INTO Attendee_Address VALUES ('1007 Cardinet Dr.', 'El Cajon', '92020', 'California');
  INSERT INTO Attendee_Address VALUES ('1008 Lydia Lane', 'Burbank', '91502', 'California');
  INSERT INTO Attendee_Address VALUES ('101 Candy Rd.', 'Redmond', '98052', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1011 Green St.', 'Bellingham', '98225', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1013 Buchanan Rd', 'Port Macquarie', '2444', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('1013 Buchanan Rd', 'Yakima', '98901', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1016 Park Avenue', 'Burbank', '91502', 'California');
  INSERT INTO Attendee_Address VALUES ('1019 Book Road', 'Rhodes', '2138', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('1019 Buchanan Road', 'Woodland Hills', '91364', 'California');
  INSERT INTO Attendee_Address VALUES ('1019 Candy Rd.', 'Coffs Harbour', '2450', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('1019 Chance Drive', 'Sedro Woolley', '98284', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1019 Kenwal Rd.', 'Lake Oswego', '97034', 'Oregon');
  INSERT INTO Attendee_Address VALUES ('1019 Pennsylvania Blvd', 'Marysville', '98270', 'Washington');
  INSERT INTO Attendee_Address VALUES ('102 Vista Place', 'Milton Keynes', 'MK8 8DF', 'England');
  INSERT INTO Attendee_Address VALUES ('10203 Acorn Avenue', 'Calgary', 'T2P 2G8', 'Alberta');
  INSERT INTO Attendee_Address VALUES ('1023 Hawkins Street', 'Townsville', '4810', 'Queensland');
  INSERT INTO Attendee_Address VALUES ('1023 Riveria Way', 'Burbank', '91502', 'California');
  INSERT INTO Attendee_Address VALUES ('1023 Riviera Way', 'Oxford', 'OX1', 'England');
  INSERT INTO Attendee_Address VALUES ('1025 Yosemite Dr.', 'Townsville', '4810', 'Queensland');
  INSERT INTO Attendee_Address VALUES ('1026 Mt. Wilson Pl.', 'Lynnwood', '98036', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1026 Mt. Wilson Pl.', 'South Melbourne', '3205', 'Victoria');
  INSERT INTO Attendee_Address VALUES ('1028 Indigo Ct.', 'Issaquah', '98027', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1028 Indigo Ct.', 'Warrnambool', '3280', 'Victoria');
  INSERT INTO Attendee_Address VALUES ('1028 Royal Oak Rd.', 'Burlingame', '94010', 'California');
  INSERT INTO Attendee_Address VALUES ('1029 Birchwood Dr', 'Burien', '98168', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1029 Birchwood Dr', 'Olympia', '98501', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1030 Ambush Dr.', 'Bury', 'PE17', 'England');
  INSERT INTO Attendee_Address VALUES ('1032 Buena Vista', 'North Ryde', '2113', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('1032 Coats Road', 'Stoke-on-Trent', 'AS23', 'England');
  INSERT INTO Attendee_Address VALUES ('1035 Arguello Blvd.', 'San Diego', '92102', 'California');
  INSERT INTO Attendee_Address VALUES ('1036 Mason Dr', 'Port Orchard', '98366', 'Washington');
  INSERT INTO Attendee_Address VALUES ('1039 Adelaide St.', 'Port Macquarie', '2444', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('104 Hilltop Dr.', 'Concord', '94519', 'California');
  INSERT INTO Attendee_Address VALUES ('1040 Greenbush Drive', 'Newton', 'V2L3W8', 'British Columbia');
  INSERT INTO Attendee_Address VALUES ('1040 Northridge Road', 'Woodland Hills', '91364', 'California');
  INSERT INTO Attendee_Address VALUES ('1042 Hooftrail Way', 'Newcastle', '2300', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('1046 Cloverleaf Circle', 'Shawnee', 'V8Z 4N5', 'British Columbia');
  INSERT INTO Attendee_Address VALUES ('1046 San Carlos Avenue', 'Colma', '94014', 'California');
  INSERT INTO Attendee_Address VALUES ('1047 Las Quebradas Lane', 'Oak Bay', 'V8P', 'British Columbia');
  INSERT INTO Attendee_Address VALUES ('1048 Burwood Way', 'Haney', 'V2W 1W2', 'British Columbia');
  INSERT INTO Attendee_Address VALUES ('105 Woodruff Ln.', 'Oakland', '94611', 'California');
  INSERT INTO Attendee_Address VALUES ('1050 Creed Ave', 'Lebanon', '97355', 'Oregon');
  INSERT INTO Attendee_Address VALUES ('1050 Greenhills Circle', 'Lane Cove', '1597', 'New South Wales');
  INSERT INTO Attendee_Address VALUES ('1050 Greenhills Circle', 'Langley', 'V3A 4R2', 'British Columbia');


  INSERT INTO Attendee VALUES ('1', '1', 'ALong@gmail.com');
  INSERT INTO Attendee VALUES ('2', '2', 'CShan@gmail.com');
  INSERT INTO Attendee VALUES ('3', '3', 'TSara@gmail.com');
  INSERT INTO Attendee VALUES ('4', '4', 'KBaker@gmail.com');
  INSERT INTO Attendee VALUES ('5', '5', 'SMa@gmail.com');
  INSERT INTO Attendee VALUES ('6', '6', 'AJones@gmail.com');
  INSERT INTO Attendee VALUES ('7', '7', 'CBaker@gmail.com');
  INSERT INTO Attendee VALUES ('8', '8', 'TMunoz@gmail.com');
  INSERT INTO Attendee VALUES ('9', '9', 'TGill@gmail.com');
  INSERT INTO Attendee VALUES ('10', '10', 'ALee@gmail.com');
  INSERT INTO Attendee VALUES ('11', '11', 'ESuri@gmail.com');
  INSERT INTO Attendee VALUES ('12', '12', 'MEvans@gmail.com');
  INSERT INTO Attendee VALUES ('13', '13', 'MClark@gmail.com');
  INSERT INTO Attendee VALUES ('14', '14', 'GXu@gmail.com');
  INSERT INTO Attendee VALUES ('15', '15', 'PRubio@gmail.com');
  INSERT INTO Attendee VALUES ('16', '16', 'JIsla@gmail.com');
  INSERT INTO Attendee VALUES ('17', '17', 'JScott@gmail.com');
  INSERT INTO Attendee VALUES ('18', '18', 'NSanz@gmail.com');
  INSERT INTO Attendee VALUES ('19', '19', 'ILee@gmail.com');
  INSERT INTO Attendee VALUES ('20', '20', 'DYuan@gmail.com');
  INSERT INTO Attendee VALUES ('21', '21', 'OBlue@gmail.com');
  INSERT INTO Attendee VALUES ('22', '22', 'ELopez@gmail.com');
  INSERT INTO Attendee VALUES ('23', '23', 'NYang@gmail.com');
  INSERT INTO Attendee VALUES ('24', '24', 'GWood@gmail.com');
  INSERT INTO Attendee VALUES ('25', '25', 'KAnand@gmail.com');
  INSERT INTO Attendee VALUES ('26', '26', 'AJones@gmail.com');
  INSERT INTO Attendee VALUES ('27', '27', 'NReed@gmail.com');
  INSERT INTO Attendee VALUES ('28', '28', 'DRoss@gmail.com');
  INSERT INTO Attendee VALUES ('29', '29', 'SGoel@gmail.com');
  INSERT INTO Attendee VALUES ('30', '30', 'NDiaz@gmail.com');
  INSERT INTO Attendee VALUES ('31', '31', 'WDavis@gmail.com');
  INSERT INTO Attendee VALUES ('32', '32', 'CHuang@gmail.com');
  INSERT INTO Attendee VALUES ('33', '33', 'SEvans@gmail.com');
  INSERT INTO Attendee VALUES ('34', '34', 'KBaker@gmail.com');
  INSERT INTO Attendee VALUES ('35', '35', 'EWood@gmail.com');
  INSERT INTO Attendee VALUES ('36', '36', 'JRai@gmail.com');
  INSERT INTO Attendee VALUES ('37', '37', 'EMoore@gmail.com');
  INSERT INTO Attendee VALUES ('38', '38', 'RYang@gmail.com');
  INSERT INTO Attendee VALUES ('39', '39', 'RRuiz@gmail.com');
  INSERT INTO Attendee VALUES ('40', '40', 'MSun@gmail.com');
  INSERT INTO Attendee VALUES ('41', '41', 'GPerez@gmail.com');
  INSERT INTO Attendee VALUES ('42', '42', 'EGill@gmail.com');
  INSERT INTO Attendee VALUES ('43', '43', 'KShen@gmail.com');
  INSERT INTO Attendee VALUES ('44', '44', 'SYuan@gmail.com');
  INSERT INTO Attendee VALUES ('45', '45', 'VLee@gmail.com');
  INSERT INTO Attendee VALUES ('46', '46', 'BArun@gmail.com');
  INSERT INTO Attendee VALUES ('47', '47', 'AScott@gmail.com');
  INSERT INTO Attendee VALUES ('48', '48', 'YLuo@gmail.com');
  INSERT INTO Attendee VALUES ('49', '49', 'MVance@gmail.com');
  INSERT INTO Attendee VALUES ('50', '50', 'JRoberts@yahoo.com');
  INSERT INTO Attendee VALUES ('51', '51', 'ARamirez@yahoo.com');
  INSERT INTO Attendee VALUES ('52', '52', 'JNelson@yahoo.com');
  INSERT INTO Attendee VALUES ('53', '53', 'HWright@yahoo.com');
  INSERT INTO Attendee VALUES ('54', '54', 'SWright@yahoo.com');
  INSERT INTO Attendee VALUES ('55', '55', 'SSimmons@yahoo.com');
  INSERT INTO Attendee VALUES ('56', '56', 'MSamant@yahoo.com');
  INSERT INTO Attendee VALUES ('57', '57', 'IRogers@yahoo.com');
  INSERT INTO Attendee VALUES ('58', '58', 'IFoster@yahoo.com');
  INSERT INTO Attendee VALUES ('59', '59', 'BMiller@yahoo.com');
  INSERT INTO Attendee VALUES ('60', '60', 'SBarnes@yahoo.com');
  INSERT INTO Attendee VALUES ('61', '61', 'CMartin@yahoo.com');
  INSERT INTO Attendee VALUES ('62', '62', 'VMurphy@yahoo.com');
  INSERT INTO Attendee VALUES ('63', '63', 'SRogers@yahoo.com');
  INSERT INTO Attendee VALUES ('64', '64', 'MHernandez@yahoo.com');
  INSERT INTO Attendee VALUES ('65', '65', 'CCarter@yahoo.com');
  INSERT INTO Attendee VALUES ('66', '66', 'RGarcia@yahoo.com');
  INSERT INTO Attendee VALUES ('67', '67', 'HHenderson@yahoo.com');
  INSERT INTO Attendee VALUES ('68', '68', 'JTaylor@yahoo.com');
  INSERT INTO Attendee VALUES ('69', '69', 'SMartin@yahoo.com');
  INSERT INTO Attendee VALUES ('70', '70', 'LSuarez@yahoo.com');
  INSERT INTO Attendee VALUES ('71', '71', 'GVargas@yahoo.com');
  INSERT INTO Attendee VALUES ('72', '72', 'AMartinez@yahoo.com');
  INSERT INTO Attendee VALUES ('73', '73', 'JThomas@yahoo.com');
  INSERT INTO Attendee VALUES ('74', '74', 'EMartinez@yahoo.com');
  INSERT INTO Attendee VALUES ('75', '75', 'PChapman@yahoo.com');
  INSERT INTO Attendee VALUES ('76', '76', 'KGriffin@yahoo.com');
  INSERT INTO Attendee VALUES ('77', '77', 'JNavarro@yahoo.com');
  INSERT INTO Attendee VALUES ('78', '78', 'NWalker@yahoo.com');
  INSERT INTO Attendee VALUES ('79', '79', 'TMoreno@yahoo.com');
  INSERT INTO Attendee VALUES ('80', '80', 'MSanchez@yahoo.com');
  INSERT INTO Attendee VALUES ('81', '81', 'NNavarro@yahoo.com');
  INSERT INTO Attendee VALUES ('82', '82', 'KRussell@yahoo.com');
  INSERT INTO Attendee VALUES ('83', '83', 'KRivera@yahoo.com');
  INSERT INTO Attendee VALUES ('84', '84', 'AOrtega@yahoo.com');
  INSERT INTO Attendee VALUES ('85', '85', 'ACampbell@yahoo.com');
  INSERT INTO Attendee VALUES ('86', '86', 'JPeterson@yahoo.com');
  INSERT INTO Attendee VALUES ('87', '87', 'ARamirez@yahoo.com');
  INSERT INTO Attendee VALUES ('88', '88', 'MSharma@yahoo.com');
  INSERT INTO Attendee VALUES ('89', '89', 'ACollins@yahoo.com');
  INSERT INTO Attendee VALUES ('90', '90', 'TMartin@yahoo.com');
  INSERT INTO Attendee VALUES ('91', '91', 'GCollins@yahoo.com');
  INSERT INTO Attendee VALUES ('92', '92', 'RMartin@yahoo.com');
  INSERT INTO Attendee VALUES ('93', '93', 'SJenkins@yahoo.com');
  INSERT INTO Attendee VALUES ('94', '94', 'JSimmons@yahoo.com');
  INSERT INTO Attendee VALUES ('95', '95', 'EWinston@yahoo.com');
  INSERT INTO Attendee VALUES ('96', '96', 'HRoberts@yahoo.com');
  INSERT INTO Attendee VALUES ('97', '97', 'NMurphy@yahoo.com');
  INSERT INTO Attendee VALUES ('98', '98', 'CWilson@yahoo.com');
  INSERT INTO Attendee VALUES ('99', '99', 'CAlvarez@yahoo.com');
  INSERT INTO Attendee VALUES ('100', '100', 'PAlexander@yahoo.com');

  INSERT INTO Presenter (person_id) VALUES (101);
  INSERT INTO Presenter (person_id) VALUES (102);
  INSERT INTO Presenter (person_id) VALUES (103);
  INSERT INTO Presenter (person_id) VALUES (104);
  INSERT INTO Presenter (person_id) VALUES (105);
  INSERT INTO Presenter (person_id) VALUES (106);
  INSERT INTO Presenter (person_id) VALUES (107);
  INSERT INTO Presenter (person_id) VALUES (108);
  INSERT INTO Presenter (person_id) VALUES (109);
  INSERT INTO Presenter (person_id) VALUES (110);
  INSERT INTO Presenter (person_id) VALUES (111);
  INSERT INTO Presenter (person_id) VALUES (112);
  INSERT INTO Presenter (person_id) VALUES (113);
  INSERT INTO Presenter (person_id) VALUES (114);
  INSERT INTO Presenter (person_id) VALUES (115);
  INSERT INTO Presenter (person_id) VALUES (116);
  INSERT INTO Presenter (person_id) VALUES (117);
  INSERT INTO Presenter (person_id) VALUES (118);
  INSERT INTO Presenter (person_id) VALUES (119);
  INSERT INTO Presenter (person_id) VALUES (120);
  INSERT INTO Presenter (person_id) VALUES (121);
  INSERT INTO Presenter (person_id) VALUES (122);
  INSERT INTO Presenter (person_id) VALUES (123);
  INSERT INTO Presenter (person_id) VALUES (124);
  INSERT INTO Presenter (person_id) VALUES (125);
  INSERT INTO Presenter (person_id) VALUES (126);
  INSERT INTO Presenter (person_id) VALUES (127);
  INSERT INTO Presenter (person_id) VALUES (128);
  INSERT INTO Presenter (person_id) VALUES (129);
  INSERT INTO Presenter (person_id) VALUES (130);
  INSERT INTO Presenter (person_id) VALUES (131);
  INSERT INTO Presenter (person_id) VALUES (132);
  INSERT INTO Presenter (person_id) VALUES (133);
  INSERT INTO Presenter (person_id) VALUES (134);
  INSERT INTO Presenter (person_id) VALUES (135);
  INSERT INTO Presenter (person_id) VALUES (136);
  INSERT INTO Presenter (person_id) VALUES (137);
  INSERT INTO Presenter (person_id) VALUES (138);
  INSERT INTO Presenter (person_id) VALUES (139);
  INSERT INTO Presenter (person_id) VALUES (140);
  INSERT INTO Presenter (person_id) VALUES (141);
  INSERT INTO Presenter (person_id) VALUES (142);
  INSERT INTO Presenter (person_id) VALUES (143);
  INSERT INTO Presenter (person_id) VALUES (144);
  INSERT INTO Presenter (person_id) VALUES (145);
  INSERT INTO Presenter (person_id) VALUES (146);
  INSERT INTO Presenter (person_id) VALUES (147);
  INSERT INTO Presenter (person_id) VALUES (148);
  INSERT INTO Presenter (person_id) VALUES (149);
  INSERT INTO Presenter (person_id) VALUES (150);
  INSERT INTO Presenter (person_id) VALUES (151);
  INSERT INTO Presenter (person_id) VALUES (152);
  INSERT INTO Presenter (person_id) VALUES (153);


  INSERT INTO Volunteer (person_id) VALUES (330);
  INSERT INTO Volunteer (person_id) VALUES (217);
  INSERT INTO Volunteer (person_id) VALUES (211);
  INSERT INTO Volunteer (person_id) VALUES (637);
  INSERT INTO Volunteer (person_id) VALUES (356);
  INSERT INTO Volunteer (person_id) VALUES (571);
  INSERT INTO Volunteer (person_id) VALUES (396);
  INSERT INTO Volunteer (person_id) VALUES (355);
  INSERT INTO Volunteer (person_id) VALUES (281);
  INSERT INTO Volunteer (person_id) VALUES (184);
  INSERT INTO Volunteer (person_id) VALUES (336);
  INSERT INTO Volunteer (person_id) VALUES (524);
  INSERT INTO Volunteer (person_id) VALUES (262);
  INSERT INTO Volunteer (person_id) VALUES (181);
  INSERT INTO Volunteer (person_id) VALUES (500);
  INSERT INTO Volunteer (person_id) VALUES (313);
  INSERT INTO Volunteer (person_id) VALUES (219);
  INSERT INTO Volunteer (person_id) VALUES (503);
  INSERT INTO Volunteer (person_id) VALUES (272);
  INSERT INTO Volunteer (person_id) VALUES (176);
  INSERT INTO Volunteer (person_id) VALUES (253);
  INSERT INTO Volunteer (person_id) VALUES (238);
  INSERT INTO Volunteer (person_id) VALUES (306);
  INSERT INTO Volunteer (person_id) VALUES (643);
  INSERT INTO Volunteer (person_id) VALUES (471);
  INSERT INTO Volunteer (person_id) VALUES (551);
  INSERT INTO Volunteer (person_id) VALUES (232);
  INSERT INTO Volunteer (person_id) VALUES (384);
  INSERT INTO Volunteer (person_id) VALUES (162);
  INSERT INTO Volunteer (person_id) VALUES (627);
  INSERT INTO Volunteer (person_id) VALUES (212);
  INSERT INTO Volunteer (person_id) VALUES (187);
  INSERT INTO Volunteer (person_id) VALUES (468);
  INSERT INTO Volunteer (person_id) VALUES (159);
  INSERT INTO Volunteer (person_id) VALUES (178);
  INSERT INTO Volunteer (person_id) VALUES (276);
  INSERT INTO Volunteer (person_id) VALUES (413);
  INSERT INTO Volunteer (person_id) VALUES (513);
  INSERT INTO Volunteer (person_id) VALUES (246);
  INSERT INTO Volunteer (person_id) VALUES (292);
  INSERT INTO Volunteer (person_id) VALUES (395);
  INSERT INTO Volunteer (person_id) VALUES (460);
  INSERT INTO Volunteer (person_id) VALUES (494);
  INSERT INTO Volunteer (person_id) VALUES (582);
  INSERT INTO Volunteer (person_id) VALUES (177);
  INSERT INTO Volunteer (person_id) VALUES (450);
  INSERT INTO Volunteer (person_id) VALUES (189);
  INSERT INTO Volunteer (person_id) VALUES (304);
  INSERT INTO Volunteer (person_id) VALUES (345);
  INSERT INTO Volunteer (person_id) VALUES (381);
  INSERT INTO Volunteer (person_id) VALUES (410);
  INSERT INTO Volunteer (person_id) VALUES (504);
  INSERT INTO Volunteer (person_id) VALUES (268);
  INSERT INTO Volunteer (person_id) VALUES (160);
  INSERT INTO Volunteer (person_id) VALUES (154);
  INSERT INTO Volunteer (person_id) VALUES (616);
  INSERT INTO Volunteer (person_id) VALUES (383);
  INSERT INTO Volunteer (person_id) VALUES (427);
  INSERT INTO Volunteer (person_id) VALUES (518);
  INSERT INTO Volunteer (person_id) VALUES (459);
  INSERT INTO Volunteer (person_id) VALUES (266);
  INSERT INTO Volunteer (person_id) VALUES (474);
  INSERT INTO Volunteer (person_id) VALUES (479);
  INSERT INTO Volunteer (person_id) VALUES (543);
  INSERT INTO Volunteer (person_id) VALUES (339);
  INSERT INTO Volunteer (person_id) VALUES (191);
  INSERT INTO Volunteer (person_id) VALUES (375);
  INSERT INTO Volunteer (person_id) VALUES (506);
  INSERT INTO Volunteer (person_id) VALUES (435);
  INSERT INTO Volunteer (person_id) VALUES (192);
  INSERT INTO Volunteer (person_id) VALUES (602);
  INSERT INTO Volunteer (person_id) VALUES (230);
  INSERT INTO Volunteer (person_id) VALUES (462);
  INSERT INTO Volunteer (person_id) VALUES (416);
  INSERT INTO Volunteer (person_id) VALUES (348);
  INSERT INTO Volunteer (person_id) VALUES (463);
  INSERT INTO Volunteer (person_id) VALUES (452);
  INSERT INTO Volunteer (person_id) VALUES (548);
  INSERT INTO Volunteer (person_id) VALUES (273);
  INSERT INTO Volunteer (person_id) VALUES (480);
  INSERT INTO Volunteer (person_id) VALUES (510);
  INSERT INTO Volunteer (person_id) VALUES (577);
  INSERT INTO Volunteer (person_id) VALUES (201);
  INSERT INTO Volunteer (person_id) VALUES (365);
  INSERT INTO Volunteer (person_id) VALUES (517);
  INSERT INTO Volunteer (person_id) VALUES (549);
  INSERT INTO Volunteer (person_id) VALUES (332);
  INSERT INTO Volunteer (person_id) VALUES (335);
  INSERT INTO Volunteer (person_id) VALUES (354);
  INSERT INTO Volunteer (person_id) VALUES (505);
  INSERT INTO Volunteer (person_id) VALUES (583);
  INSERT INTO Volunteer (person_id) VALUES (563);
  INSERT INTO Volunteer (person_id) VALUES (544);
  INSERT INTO Volunteer (person_id) VALUES (251);
  INSERT INTO Volunteer (person_id) VALUES (303);
  INSERT INTO Volunteer (person_id) VALUES (235);
  INSERT INTO Volunteer (person_id) VALUES (388);
  INSERT INTO Volunteer (person_id) VALUES (169);
  INSERT INTO Volunteer (person_id) VALUES (274);
  INSERT INTO Volunteer (person_id) VALUES (576);
  INSERT INTO Volunteer (person_id) VALUES (428);
  INSERT INTO Volunteer (person_id) VALUES (231);
  INSERT INTO Volunteer (person_id) VALUES (222);
  INSERT INTO Volunteer (person_id) VALUES (558);
  INSERT INTO Volunteer (person_id) VALUES (530);
  INSERT INTO Volunteer (person_id) VALUES (237);
  INSERT INTO Volunteer (person_id) VALUES (300);
  INSERT INTO Volunteer (person_id) VALUES (394);
  INSERT INTO Volunteer (person_id) VALUES (264);
  INSERT INTO Volunteer (person_id) VALUES (436);
  INSERT INTO Volunteer (person_id) VALUES (286);
  INSERT INTO Volunteer (person_id) VALUES (250);
  INSERT INTO Volunteer (person_id) VALUES (586);
  INSERT INTO Volunteer (person_id) VALUES (598);
  INSERT INTO Volunteer (person_id) VALUES (342);
  INSERT INTO Volunteer (person_id) VALUES (214);
  INSERT INTO Volunteer (person_id) VALUES (223);
  INSERT INTO Volunteer (person_id) VALUES (195);
  INSERT INTO Volunteer (person_id) VALUES (175);
  INSERT INTO Volunteer (person_id) VALUES (433);
  INSERT INTO Volunteer (person_id) VALUES (456);
  INSERT INTO Volunteer (person_id) VALUES (448);
  INSERT INTO Volunteer (person_id) VALUES (487);
  INSERT INTO Volunteer (person_id) VALUES (153);
  INSERT INTO Volunteer (person_id) VALUES (649);
  INSERT INTO Volunteer (person_id) VALUES (553);
  INSERT INTO Volunteer (person_id) VALUES (398);
  INSERT INTO Volunteer (person_id) VALUES (626);
  INSERT INTO Volunteer (person_id) VALUES (351);
  INSERT INTO Volunteer (person_id) VALUES (564);
  INSERT INTO Volunteer (person_id) VALUES (475);
  INSERT INTO Volunteer (person_id) VALUES (541);
  INSERT INTO Volunteer (person_id) VALUES (584);
  INSERT INTO Volunteer (person_id) VALUES (635);
  INSERT INTO Volunteer (person_id) VALUES (559);
  INSERT INTO Volunteer (person_id) VALUES (497);
  INSERT INTO Volunteer (person_id) VALUES (224);
  INSERT INTO Volunteer (person_id) VALUES (555);
  INSERT INTO Volunteer (person_id) VALUES (645);
  INSERT INTO Volunteer (person_id) VALUES (399);
  INSERT INTO Volunteer (person_id) VALUES (341);
  INSERT INTO Volunteer (person_id) VALUES (240);
  INSERT INTO Volunteer (person_id) VALUES (161);
  INSERT INTO Volunteer (person_id) VALUES (495);
  INSERT INTO Volunteer (person_id) VALUES (523);
  INSERT INTO Volunteer (person_id) VALUES (556);
  INSERT INTO Volunteer (person_id) VALUES (163);
  INSERT INTO Volunteer (person_id) VALUES (431);
  INSERT INTO Volunteer (person_id) VALUES (236);
  INSERT INTO Volunteer (person_id) VALUES (279);
  INSERT INTO Volunteer (person_id) VALUES (185);
  INSERT INTO Volunteer (person_id) VALUES (173);
  INSERT INTO Volunteer (person_id) VALUES (631);
  INSERT INTO Volunteer (person_id) VALUES (554);
  INSERT INTO Volunteer (person_id) VALUES (481);
  INSERT INTO Volunteer (person_id) VALUES (372);
  INSERT INTO Volunteer (person_id) VALUES (325);
  INSERT INTO Volunteer (person_id) VALUES (575);
  INSERT INTO Volunteer (person_id) VALUES (377);
  INSERT INTO Volunteer (person_id) VALUES (333);
  INSERT INTO Volunteer (person_id) VALUES (204);
  INSERT INTO Volunteer (person_id) VALUES (550);
  INSERT INTO Volunteer (person_id) VALUES (434);
  INSERT INTO Volunteer (person_id) VALUES (216);
  INSERT INTO Volunteer (person_id) VALUES (439);
  INSERT INTO Volunteer (person_id) VALUES (418);
  INSERT INTO Volunteer (person_id) VALUES (295);
  INSERT INTO Volunteer (person_id) VALUES (629);
  INSERT INTO Volunteer (person_id) VALUES (337);
  INSERT INTO Volunteer (person_id) VALUES (446);
  INSERT INTO Volunteer (person_id) VALUES (367);
  INSERT INTO Volunteer (person_id) VALUES (390);
  INSERT INTO Volunteer (person_id) VALUES (562);
  INSERT INTO Volunteer (person_id) VALUES (285);
  INSERT INTO Volunteer (person_id) VALUES (172);
  INSERT INTO Volunteer (person_id) VALUES (488);
  INSERT INTO Volunteer (person_id) VALUES (454);
  INSERT INTO Volunteer (person_id) VALUES (357);
  INSERT INTO Volunteer (person_id) VALUES (470);


  INSERT INTO Organizer (person_id) VALUES (599);
  INSERT INTO Organizer (person_id) VALUES (573);
  INSERT INTO Organizer (person_id) VALUES (414);
  INSERT INTO Organizer (person_id) VALUES (604);
  INSERT INTO Organizer (person_id) VALUES (611);
  INSERT INTO Organizer (person_id) VALUES (263);
  INSERT INTO Organizer (person_id) VALUES (441);
  INSERT INTO Organizer (person_id) VALUES (547);
  INSERT INTO Organizer (person_id) VALUES (501);
  INSERT INTO Organizer (person_id) VALUES (324);
  INSERT INTO Organizer (person_id) VALUES (227);
  INSERT INTO Organizer (person_id) VALUES (527);
  INSERT INTO Organizer (person_id) VALUES (287);
  INSERT INTO Organizer (person_id) VALUES (613);
  INSERT INTO Organizer (person_id) VALUES (572);
  INSERT INTO Organizer (person_id) VALUES (298);
  INSERT INTO Organizer (person_id) VALUES (209);
  INSERT INTO Organizer (person_id) VALUES (521);
  INSERT INTO Organizer (person_id) VALUES (374);
  INSERT INTO Organizer (person_id) VALUES (213);
  INSERT INTO Organizer (person_id) VALUES (502);
  INSERT INTO Organizer (person_id) VALUES (633);
  INSERT INTO Organizer (person_id) VALUES (199);
  INSERT INTO Organizer (person_id) VALUES (646);
  INSERT INTO Organizer (person_id) VALUES (190);
  INSERT INTO Organizer (person_id) VALUES (516);
  INSERT INTO Organizer (person_id) VALUES (226);
  INSERT INTO Organizer (person_id) VALUES (578);
  INSERT INTO Organizer (person_id) VALUES (308);
  INSERT INTO Organizer (person_id) VALUES (615);
  INSERT INTO Organizer (person_id) VALUES (183);
  INSERT INTO Organizer (person_id) VALUES (411);
  INSERT INTO Organizer (person_id) VALUES (188);
  INSERT INTO Organizer (person_id) VALUES (193);
  INSERT INTO Organizer (person_id) VALUES (320);
  INSERT INTO Organizer (person_id) VALUES (297);
  INSERT INTO Organizer (person_id) VALUES (437);
  INSERT INTO Organizer (person_id) VALUES (408);
  INSERT INTO Organizer (person_id) VALUES (171);
  INSERT INTO Organizer (person_id) VALUES (621);


  INSERT INTO Venues VALUES ('Budapest', 'Europe/Middle East/Africa');
  INSERT INTO Venues VALUES ('Baltimore', 'Canada/US');
  INSERT INTO Venues VALUES ('Bogota', 'Latin America');
  INSERT INTO Venues VALUES ('Kyiv', 'Europe/Middle East/Africa');
  INSERT INTO Venues VALUES ('New York City', 'Canada/US');
  INSERT INTO Venues VALUES ('Brisbane', 'Asia Pacific');
  INSERT INTO Venues VALUES ('Plovdiv', 'Europe/Middle East/Africa');
  INSERT INTO Venues VALUES ('Philadelphia', 'Canada/US');
  INSERT INTO Venues VALUES ('All', 'All');


  INSERT INTO Events VALUES ('6-May-17', 'SQLSaturday #626', 1);
  INSERT INTO Events VALUES ('6-May-17', 'SQLSaturday #615', 2);
  INSERT INTO Events VALUES ('13-May-17', 'SQLSaturday #608', 3);
  INSERT INTO Events VALUES ('20-May-17', 'SQLSaturday #616', 4);
  INSERT INTO Events VALUES ('20-May-17', 'SQLSaturday #588', 5);
  INSERT INTO Events VALUES ('27-May-17', 'SQLSaturday #630', 6);
  INSERT INTO Events VALUES ('27-May-17', 'SQLSaturday #599', 7);
  INSERT INTO Events VALUES ('3-Jun-17', 'SQLSaturday #638', 8);


  INSERT INTO Tables VALUES (1, 3);
  INSERT INTO Tables VALUES (2, 6);
  INSERT INTO Tables VALUES (3, 2);
  INSERT INTO Tables VALUES (4, 8);
  INSERT INTO Tables VALUES (5, 2);
  INSERT INTO Tables VALUES (6, 1);
  INSERT INTO Tables VALUES (7, 5);
  INSERT INTO Tables VALUES (8, 7);
  INSERT INTO Tables VALUES (9, 4);
  INSERT INTO Tables VALUES (10, 7);


  INSERT INTO Sponsors VALUES ('VMWare', 'Platinum Sponsor', 4);
  INSERT INTO Sponsors VALUES ('Verizon Digital Media Services', 'Platinum Sponsor', 4);
  INSERT INTO Sponsors VALUES ('Microsoft Corporation (GAP) (GAP Sponsor)', 'Platinum Sponsor', 6);
  INSERT INTO Sponsors VALUES ('Tintri', 'Platinum Sponsor', 5);
  INSERT INTO Sponsors VALUES ('Amazon Web Services, LLC', 'Gold Sponsor', 2);
  INSERT INTO Sponsors VALUES ('Pyramid Analytics (GAP Sponsor)', 'Gold Sponsor', 8);
  INSERT INTO Sponsors VALUES ('Pure Storage', 'Gold Sponsor', 3);
  INSERT INTO Sponsors VALUES ('Profisee', 'Gold Sponsor', 3);
  INSERT INTO Sponsors VALUES ('NetLib Security', 'Silver Sponsor', 1);
  INSERT INTO Sponsors VALUES ('Melissa DATA Corp.', 'Silver Sponsor', 1);
  INSERT INTO Sponsors VALUES ('Red Gate Software', 'Silver Sponsor', 9);
  INSERT INTO Sponsors VALUES ('SentryOne', 'Silver Sponsor', 7);
  INSERT INTO Sponsors VALUES ('Hush Hush', 'Bronze Sponsor', 2);
  INSERT INTO Sponsors VALUES ('COZYROC', 'Bronze Sponsor', 10);
  INSERT INTO Sponsors VALUES ('SQLDocKit BY Acceleratio Ltd.', 'Bronze Sponsor', 6);


  INSERT INTO Lecture_Hall VALUES (1, 1, 50);
  INSERT INTO Lecture_Hall VALUES (2, 2, 50);
  INSERT INTO Lecture_Hall VALUES (3, 3, 50);
  INSERT INTO Lecture_Hall VALUES (4, 4, 50);
  INSERT INTO Lecture_Hall VALUES (5, 5, 50);
  INSERT INTO Lecture_Hall VALUES (6, 6, 50);
  INSERT INTO Lecture_Hall VALUES (7, 7, 50);
  INSERT INTO Lecture_Hall VALUES (8, 8, 50);
  INSERT INTO Lecture_Hall VALUES (9, 1, 50);
  INSERT INTO Lecture_Hall VALUES (10, 2, 50);
  INSERT INTO Lecture_Hall VALUES (11, 3, 50);
  INSERT INTO Lecture_Hall VALUES (12, 4, 50);
  INSERT INTO Lecture_Hall VALUES (13, 5, 50);
  INSERT INTO Lecture_Hall VALUES (14, 6, 50);
  INSERT INTO Lecture_Hall VALUES (15, 7, 50);
  INSERT INTO Lecture_Hall VALUES (16, 8, 50);
  INSERT INTO Lecture_Hall VALUES (17, 1, 50);
  INSERT INTO Lecture_Hall VALUES (18, 2, 50);
  INSERT INTO Lecture_Hall VALUES (19, 3, 50);
  INSERT INTO Lecture_Hall VALUES (20, 4, 50);
  INSERT INTO Lecture_Hall VALUES (21, 5, 50);
  INSERT INTO Lecture_Hall VALUES (22, 6, 50);
  INSERT INTO Lecture_Hall VALUES (23, 7, 50);
  INSERT INTO Lecture_Hall VALUES (24, 8, 50);
  INSERT INTO Lecture_Hall VALUES (25, 1, 50);
  INSERT INTO Lecture_Hall VALUES (26, 2, 50);
  INSERT INTO Lecture_Hall VALUES (27, 3, 50);
  INSERT INTO Lecture_Hall VALUES (28, 4, 50);
  INSERT INTO Lecture_Hall VALUES (29, 5, 50);
  INSERT INTO Lecture_Hall VALUES (30, 6, 50);
  INSERT INTO Lecture_Hall VALUES (31, 7, 50);
  INSERT INTO Lecture_Hall VALUES (32, 8, 50);
  INSERT INTO Lecture_Hall VALUES (33, 1, 50);
  INSERT INTO Lecture_Hall VALUES (34, 2, 50);
  INSERT INTO Lecture_Hall VALUES (35, 3, 50);


  INSERT INTO Presentation VALUES ('A dive into Data Quality Services', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('A Dynamic World Demands Dynamic SQL', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('A Dynamic World Demands Dynamic SQL', 'Intermediate', 4);
  INSERT INTO Presentation
  VALUES ('Absolute Introductory Session on SQL Server 2014 In-Memory Optimized Databases (Hekaton)', 'Beginner', 1);
  INSERT INTO Presentation
  VALUES ('AlwaysOn: Improve reliability and reporting performance with one cool tech', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('An introduction to Data Mining', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('An Introduction to Database Design', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Autogenerating a process data warehouse', 'Advanced', 5);
  INSERT INTO Presentation VALUES ('Automate your daily checklist with PBM and CMS', 'Intermediate', 1);
  INSERT INTO Presentation VALUES
    ('Automated Installing and Configuration of SQL2014/SQL2012 AlwaysOn Across Multiple Datacenters', 'Intermediate',
     5);
  INSERT INTO Presentation VALUES
    ('Automated Installing and Configuration of SQL2014/SQL2012 AlwaysOn Across Multiple Datacenters', 'Intermediate',
     4);
  INSERT INTO Presentation VALUES ('Automating Execution Plan Analysis', 'Advanced', 4);
  INSERT INTO Presentation VALUES ('Automating Execution Plan Analysis', 'Advanced', 5);
  INSERT INTO Presentation VALUES ('Automating SQL Server using PowerShell', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Balanced Scorecards using SSRS', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Baselines and Performance Monitoring with PAL', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Basic Database Design', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Basic Database Programming', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('Become a BI Independent Consultant!', 'Beginner', 1);
  INSERT INTO Presentation VALUES ('Becoming a Top DBA--Learning Automation in SQL Server', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('Best Practices Document', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('Best Practices for Efficient SSRS Report Creation', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Biggest Loser: Database Edition', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Building a BI Solution in the Cloud', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Building an Effective Data Warehouse Architecture', 'Beginner', 5);
  INSERT INTO Presentation
  VALUES ('Building an Effective Data Warehouse Architecture with the cloud and MPP', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Bulk load and minimal logged inserts', 'Advanced', 5);
  INSERT INTO Presentation VALUES
    ('Business Analytics with SQL Server & Power Map:Everything you want to know but were afraid to ask',
     'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Challenges to designing financial warehouses, lessons learnt', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Change Data Capture in SQL Server 2008/2012', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Changing Your Habits to Improve the Performance of Your T-SQL', 'Beginner', 4);
  INSERT INTO Presentation
  VALUES ('Clusters Your Way: #SANLess Clusters for Physical, Virtual,  and Cloud Environments', 'Beginner', 4);
  INSERT INTO Presentation
  VALUES ('Clusters Your Way: #SANLess Clusters for Physical, Virtual,  and Cloud Environments', 'Non-Technical', 4);
  INSERT INTO Presentation VALUES ('Coffee Break', 'Non-Technical', 9);
  INSERT INTO Presentation VALUES ('Creating A Performance Health Repository - using MDW', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('Creating efficient and effective SSRS BI Solutions', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('Creating efficient and effective SSRS BI Solutions', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Data Partitioning', 'Intermediate', 5);
  INSERT INTO Presentation
  VALUES ('Data Tier Application Testing with NUnit and Distributed Replay', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Database design for mere developers', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Database design for mere developers', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Database Design: Solving Problems Before they Start!', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Database Modeling and Design', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Database Virtualization and Drinking out of the Fire Hose', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('DAX and the tabular model', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('DBA FOR DUMMIES', 'Beginner', 1);
  INSERT INTO Presentation VALUES ('Dealing With Difficult Person', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('Development Lifecycle with SQL Server Data Tools and DACFx', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('Did You Vote Today? A DBAs Guide to Cluster Quorum', 'Advanced', 4);
  INSERT INTO Presentation VALUES ('Dimensional Modeling Design Patterns: Beyond Basics', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('Dimensional Modeling Design Patterns: Beyond Basics', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Diving Into Query Execution Plans', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Dynamic SQL: Writing Efficient Queries on the Fly', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('Easy Architecture Design for HA and DR', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Enhancing your career: Building your personal brand', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Establishing a SLA', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('ETL not ELT! Common mistakes and misconceptions about SSIS', 'Advanced', 1);
  INSERT INTO Presentation VALUES ('Event Kickoff and Networking', 'Non-Technical', 5);
  INSERT INTO Presentation VALUES ('Execution Plans: What Can You Do With Them?', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Faster, Better Decisions with Self Service Business Analytics', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Full Text Indexing Basics', 'Beginner', 1);
  INSERT INTO Presentation VALUES ('Get your Mining Model Predictions out to all', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Getting a job with Microsoft', 'Non-Technical', 5);
  INSERT INTO Presentation VALUES ('Graph Databases for SQL Server Professionals', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Hacking Expos - Using SSL to Protect SQL Connections', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Hacking the SSIS 2012 Catalog', 'Beginner', 1);
  INSERT INTO Presentation VALUES ('Hidden in plain sight: master your tools', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Highly Available SQL Server in Windows Azure IaaS', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('How to Make a LOT More Money as a Consultant', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('How to Think Like the Engine', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Hybrid Cloud Scenarios with SQL Server 2014', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Hybrid Solutions: The Future of SQL Server Disaster Recovery', 'Intermediate', 1);
  INSERT INTO Presentation
  VALUES ('Implementing Data Warehouse Patterns with the Microsoft BI Tools', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Inroduction to Triggers', 'Beginner', 1);
  INSERT INTO Presentation VALUES ('Integrating Reporting Services with SharePoint', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Integration Services (SSIS) for the DBA', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Introducing Power BI', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Introduction to Database Recovery', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Introduction to High Availability with SQL Server', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Introduction to Powershell for DBA`s', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Introduction to SQL Server - Part 1', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Introduction to SQL Server - Part 2', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Is That A Failover Cluster On Your Laptop/Desktop?', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Leaving the Windows Open', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Lunch Break', 'Non-Technical', 9);
  INSERT INTO Presentation VALUES ('Lunchtime Keynote', 'Non-Technical', 5);
  INSERT INTO Presentation VALUES ('Master Data Services Best Practices', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Master Data Services Disaster Recovery', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Mind your language!! Cursors are a dirty word', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Modern Data Warehousing', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Monitoring Server health via Reporting Services dashboards', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Monitoring SQL Server using Extended Events', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Multidimensional vs Tabular - May the Best Model Win', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Murder They Wrote', 'Intermediate', 5);
  INSERT INTO Presentation VALUES ('Never Have to Say "Mayday!!!" Again', 'Beginner', 5);
  INSERT INTO Presentation
  VALUES ('Now you see it! Now you dont! Conjuring many reports utilizing only one SSRS report.', 'Intermediate', 5);
  INSERT INTO Presentation
  VALUES ('Optimal Infrastructure Strategies for Cisco UCS, Nexus and SQL Server', 'Non-Technical', 1);
  INSERT INTO Presentation VALUES ('Optimizing Protected Indexes', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Partitioning as a design pattern', 'Advanced', 1);
  INSERT INTO Presentation VALUES ('Power BI Components in Microsoft`s Self-Service BI Suite', 'Beginner', 5);
  INSERT INTO Presentation VALUES ('Power to the person!!', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('PowerShell Basics for SQLServer', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('PowerShell for the Reluctant DBA / Developer', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('Prevent Recovery Amnesia Forget the Backups', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('Query Optimization Crash Course', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('Raffle', 'Non-Technical', 9);
  INSERT INTO Presentation VALUES ('Rapid Application Development with Master Data Services', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('Recovery and Backup for Beginners', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('Reduce, Reuse, Recycle: Automating Your BI Framework', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('Registrations', 'Non-Technical', 9);
  INSERT INTO Presentation VALUES ('Replicaton Technologies', 'Advanced', 4);
  INSERT INTO Presentation VALUES ('Reporting Services for Mere DBAs', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('Scaling with SQL Server Service Broker', 'Advanced', 4);
  INSERT INTO Presentation VALUES ('Scaling with SQL Server Service Broker', 'Advanced', 4);
  INSERT INTO Presentation VALUES ('Self-Service Data Integration with Power Query', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('Shortcuts to Building SSIS in .Net', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('So You Want To Be A Consultant?', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('SQL anti patterns', 'Advanced', 4);
  INSERT INTO Presentation VALUES ('SQL Server 2012/2014 Columnstore index', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('SQL Server 2012/2014 Performance Tuning All Up', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('SQL Server 2014 Data Access Layers', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('SQL Server 2014 New Features', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('SQL Server AlwaysOn Availability Groups', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('SQL Server and the Cloud', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('SQL Server Compression and what it can do for you', 'Advanced', 4);
  INSERT INTO Presentation VALUES ('SQL Server Reporting Services 2014 on Steroids!!', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('SQL Server Reporting Services Best Practices', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('SQL Server Reporting Services, attendees choose', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('SQL Server Storage Engine under the hood', 'Intermediate', 4);
  INSERT INTO Presentation VALUES ('SQL Server Storage internals: Looking under the hood.', 'Advanced', 4);
  INSERT INTO Presentation VALUES ('SSIS 2014 Data Flow Tuning Tips and Tricks', 'Beginner', 4);
  INSERT INTO Presentation
  VALUES ('Standalone to High-Availability Clusters over Lunch with Time to Spare', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Stress testing SQL Server', 'Advanced', 4);
  INSERT INTO Presentation VALUES ('Table partitioning for Azure SQL Databases', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('Testing', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('The future of the data professional', 'Beginner', 4);
  INSERT INTO Presentation VALUES ('The Quest for the Golden Record:MDM Best Practices', 'Beginner', 1);
  INSERT INTO Presentation VALUES ('The Quest to Find Bad Data With Data Profiling', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('The Spy Who Loathed Me - An Intro to SQL Security', 'Beginner', 1);
  INSERT INTO Presentation VALUES ('Tired of the CRUD? Automate it!', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Top 5 Ways to Improve Your triggers', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Tricks that have saved my bacon', 'Beginner', 1);
  INSERT INTO Presentation VALUES ('T-SQL : Bad Habits & Best Practices', 'Beginner', 1);
  INSERT INTO Presentation VALUES ('T-SQL for Application Developers - Attendees chose', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Tune Queries By Fixing Bad Parameter Sniffing', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Using Extended Events in SQL Server', 'Advanced', 1);
  INSERT INTO Presentation VALUES ('Watch Brent Tune Queries', 'Intermediate', 1);
  INSERT INTO Presentation
  VALUES ('What every SQL Server DBA needs to know about Windows Server 10 Technical Preview', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('What exactly is big data and why should I care?', 'Beginner', 1);
  INSERT INTO Presentation VALUES ('What is it like to work for Microsoft?', 'Beginner', 1);
  INSERT INTO Presentation VALUES ('Whats new in SQL Server Integration Services 2012', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Why do we shun using tools for DBA job?', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('Why OLAP? Building SSAS cubes and benefits of OLAP', 'Intermediate', 1);
  INSERT INTO Presentation VALUES ('You`re Doing It Wrong!!', 'Intermediate', 1);


  INSERT INTO Track VALUES ('Application & Database Development');
  INSERT INTO Track VALUES ('BI Information Delivery');
  INSERT INTO Track VALUES ('BI Platform Architecture, Development & Administration');
  INSERT INTO Track VALUES ('Cloud Application Development & Deployment');
  INSERT INTO Track VALUES ('Enterprise Database Administration (DBA) & Deployment');
  INSERT INTO Track VALUES ('Professional Development');
  INSERT INTO Track VALUES ('Strategy and Architecture');


  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (1, 1, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (2, 2, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (3, 3, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (4, 4, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (5, 5, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (6, 6, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (7, 7, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (8, 8, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (9, 9, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (10, 10, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (11, 11, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (12, 12, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (13, 13, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (14, 14, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (15, 15, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (16, 16, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (17, 17, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (18, 18, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (19, 19, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (20, 20, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (21, 21, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (22, 22, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (23, 23, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (24, 24, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (25, 25, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (26, 26, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (27, 27, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (28, 28, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (29, 29, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (30, 30, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (31, 31, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (32, 32, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (33, 33, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (34, 34, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (35, 35, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (36, 1, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (37, 2, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (38, 3, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (39, 4, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (40, 5, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (41, 6, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (42, 7, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (43, 8, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (44, 9, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (45, 10, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (46, 11, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (47, 12, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (48, 13, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (49, 14, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (50, 15, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (51, 16, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (52, 17, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (53, 18, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (54, 19, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (55, 20, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (56, 21, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (57, 22, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (58, 23, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (59, 24, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (60, 25, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (61, 26, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (62, 27, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (63, 28, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (64, 29, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (65, 30, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (66, 31, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (67, 32, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (68, 33, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (69, 34, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (70, 35, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (71, 1, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (72, 2, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (73, 3, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (74, 4, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (75, 5, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (76, 6, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (77, 7, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (78, 8, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (79, 9, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (80, 10, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (81, 11, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (82, 12, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (83, 13, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (84, 14, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (85, 15, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (86, 16, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (87, 17, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (88, 18, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (89, 19, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (90, 20, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (91, 21, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (92, 22, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (93, 23, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (94, 24, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (95, 25, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (96, 26, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (97, 27, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (98, 28, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (99, 29, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (100, 30, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (101, 31, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (102, 32, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (103, 33, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (104, 34, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (105, 35, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (106, 1, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (107, 2, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (108, 3, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (109, 4, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (110, 5, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (111, 6, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (112, 7, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (113, 8, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (114, 9, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (115, 10, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (116, 11, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (117, 12, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (118, 13, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (119, 14, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (120, 15, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (121, 16, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (122, 17, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (123, 18, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (124, 19, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (125, 20, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (126, 21, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (127, 22, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (128, 23, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (129, 24, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (130, 25, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (131, 26, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (132, 27, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (133, 28, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (134, 29, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (135, 30, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (136, 31, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (137, 32, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (138, 33, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (139, 34, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (140, 35, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (141, 1, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (142, 2, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (143, 3, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (144, 4, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (145, 5, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (146, 6, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (147, 7, 7);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (148, 8, 1);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (149, 9, 2);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (150, 10, 3);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (151, 11, 4);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (152, 12, 5);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (153, 13, 6);
  INSERT INTO Lecture_Times (presentation_id, room_id, track_id) VALUES (154, 14, 7);


  INSERT INTO Presentation_Presenter VALUES (48, 1);
  INSERT INTO Presentation_Presenter VALUES (24, 2);
  INSERT INTO Presentation_Presenter VALUES (24, 3);
  INSERT INTO Presentation_Presenter VALUES (31, 4);
  INSERT INTO Presentation_Presenter VALUES (9, 5);
  INSERT INTO Presentation_Presenter VALUES (48, 6);
  INSERT INTO Presentation_Presenter VALUES (39, 7);
  INSERT INTO Presentation_Presenter VALUES (30, 8);
  INSERT INTO Presentation_Presenter VALUES (28, 9);
  INSERT INTO Presentation_Presenter VALUES (50, 10);
  INSERT INTO Presentation_Presenter VALUES (50, 11);
  INSERT INTO Presentation_Presenter VALUES (25, 12);
  INSERT INTO Presentation_Presenter VALUES (25, 13);
  INSERT INTO Presentation_Presenter VALUES (35, 14);
  INSERT INTO Presentation_Presenter VALUES (49, 15);
  INSERT INTO Presentation_Presenter VALUES (38, 16);
  INSERT INTO Presentation_Presenter VALUES (27, 17);
  INSERT INTO Presentation_Presenter VALUES (27, 18);
  INSERT INTO Presentation_Presenter VALUES (21, 19);
  INSERT INTO Presentation_Presenter VALUES (29, 20);
  INSERT INTO Presentation_Presenter VALUES (40, 21);
  INSERT INTO Presentation_Presenter VALUES (36, 22);
  INSERT INTO Presentation_Presenter VALUES (27, 23);
  INSERT INTO Presentation_Presenter VALUES (46, 24);
  INSERT INTO Presentation_Presenter VALUES (21, 25);
  INSERT INTO Presentation_Presenter VALUES (21, 26);
  INSERT INTO Presentation_Presenter VALUES (11, 27);
  INSERT INTO Presentation_Presenter VALUES (48, 28);
  INSERT INTO Presentation_Presenter VALUES (48, 29);
  INSERT INTO Presentation_Presenter VALUES (31, 30);
  INSERT INTO Presentation_Presenter VALUES (36, 31);
  INSERT INTO Presentation_Presenter VALUES (3, 32);
  INSERT INTO Presentation_Presenter VALUES (3, 33);
  INSERT INTO Presentation_Presenter VALUES (45, 34);
  INSERT INTO Presentation_Presenter VALUES (43, 35);
  INSERT INTO Presentation_Presenter VALUES (48, 36);
  INSERT INTO Presentation_Presenter VALUES (48, 37);
  INSERT INTO Presentation_Presenter VALUES (26, 38);
  INSERT INTO Presentation_Presenter VALUES (26, 39);
  INSERT INTO Presentation_Presenter VALUES (48, 40);
  INSERT INTO Presentation_Presenter VALUES (48, 41);
  INSERT INTO Presentation_Presenter VALUES (14, 42);
  INSERT INTO Presentation_Presenter VALUES (39, 43);
  INSERT INTO Presentation_Presenter VALUES (34, 44);
  INSERT INTO Presentation_Presenter VALUES (48, 45);
  INSERT INTO Presentation_Presenter VALUES (43, 46);
  INSERT INTO Presentation_Presenter VALUES (16, 47);
  INSERT INTO Presentation_Presenter VALUES (26, 48);
  INSERT INTO Presentation_Presenter VALUES (3, 49);
  INSERT INTO Presentation_Presenter VALUES (23, 50);
  INSERT INTO Presentation_Presenter VALUES (23, 51);
  INSERT INTO Presentation_Presenter VALUES (14, 52);
  INSERT INTO Presentation_Presenter VALUES (14, 53);
  INSERT INTO Presentation_Presenter VALUES (6, 54);
  INSERT INTO Presentation_Presenter VALUES (21, 55);
  INSERT INTO Presentation_Presenter VALUES (50, 56);
  INSERT INTO Presentation_Presenter VALUES (41, 57);
  INSERT INTO Presentation_Presenter VALUES (45, 58);
  INSERT INTO Presentation_Presenter VALUES (17, 59);
  INSERT INTO Presentation_Presenter VALUES (44, 60);
  INSERT INTO Presentation_Presenter VALUES (27, 61);
  INSERT INTO Presentation_Presenter VALUES (48, 62);
  INSERT INTO Presentation_Presenter VALUES (41, 63);
  INSERT INTO Presentation_Presenter VALUES (47, 64);
  INSERT INTO Presentation_Presenter VALUES (8, 65);
  INSERT INTO Presentation_Presenter VALUES (4, 66);
  INSERT INTO Presentation_Presenter VALUES (52, 67);
  INSERT INTO Presentation_Presenter VALUES (10, 68);
  INSERT INTO Presentation_Presenter VALUES (21, 69);
  INSERT INTO Presentation_Presenter VALUES (6, 70);
  INSERT INTO Presentation_Presenter VALUES (15, 71);
  INSERT INTO Presentation_Presenter VALUES (3, 72);
  INSERT INTO Presentation_Presenter VALUES (31, 73);
  INSERT INTO Presentation_Presenter VALUES (20, 74);
  INSERT INTO Presentation_Presenter VALUES (31, 75);
  INSERT INTO Presentation_Presenter VALUES (12, 76);
  INSERT INTO Presentation_Presenter VALUES (46, 77);
  INSERT INTO Presentation_Presenter VALUES (26, 78);
  INSERT INTO Presentation_Presenter VALUES (28, 79);
  INSERT INTO Presentation_Presenter VALUES (28, 80);
  INSERT INTO Presentation_Presenter VALUES (5, 81);
  INSERT INTO Presentation_Presenter VALUES (5, 82);
  INSERT INTO Presentation_Presenter VALUES (3, 83);
  INSERT INTO Presentation_Presenter VALUES (24, 84);
  INSERT INTO Presentation_Presenter VALUES (45, 85);
  INSERT INTO Presentation_Presenter VALUES (45, 86);
  INSERT INTO Presentation_Presenter VALUES (48, 87);
  INSERT INTO Presentation_Presenter VALUES (48, 88);
  INSERT INTO Presentation_Presenter VALUES (48, 89);
  INSERT INTO Presentation_Presenter VALUES (21, 90);
  INSERT INTO Presentation_Presenter VALUES (48, 91);
  INSERT INTO Presentation_Presenter VALUES (19, 92);
  INSERT INTO Presentation_Presenter VALUES (46, 93);
  INSERT INTO Presentation_Presenter VALUES (22, 94);
  INSERT INTO Presentation_Presenter VALUES (38, 95);
  INSERT INTO Presentation_Presenter VALUES (48, 96);
  INSERT INTO Presentation_Presenter VALUES (32, 97);
  INSERT INTO Presentation_Presenter VALUES (8, 98);
  INSERT INTO Presentation_Presenter VALUES (30, 99);
  INSERT INTO Presentation_Presenter VALUES (51, 100);
  INSERT INTO Presentation_Presenter VALUES (48, 101);
  INSERT INTO Presentation_Presenter VALUES (35, 102);
  INSERT INTO Presentation_Presenter VALUES (23, 103);
  INSERT INTO Presentation_Presenter VALUES (8, 104);
  INSERT INTO Presentation_Presenter VALUES (14, 105);
  INSERT INTO Presentation_Presenter VALUES (45, 106);
  INSERT INTO Presentation_Presenter VALUES (48, 107);
  INSERT INTO Presentation_Presenter VALUES (37, 108);
  INSERT INTO Presentation_Presenter VALUES (46, 109);
  INSERT INTO Presentation_Presenter VALUES (45, 110);
  INSERT INTO Presentation_Presenter VALUES (19, 111);
  INSERT INTO Presentation_Presenter VALUES (22, 112);
  INSERT INTO Presentation_Presenter VALUES (19, 113);
  INSERT INTO Presentation_Presenter VALUES (19, 114);
  INSERT INTO Presentation_Presenter VALUES (47, 115);
  INSERT INTO Presentation_Presenter VALUES (41, 116);
  INSERT INTO Presentation_Presenter VALUES (3, 117);
  INSERT INTO Presentation_Presenter VALUES (30, 118);
  INSERT INTO Presentation_Presenter VALUES (31, 119);
  INSERT INTO Presentation_Presenter VALUES (15, 120);
  INSERT INTO Presentation_Presenter VALUES (48, 121);
  INSERT INTO Presentation_Presenter VALUES (15, 122);
  INSERT INTO Presentation_Presenter VALUES (15, 123);
  INSERT INTO Presentation_Presenter VALUES (12, 124);
  INSERT INTO Presentation_Presenter VALUES (22, 125);
  INSERT INTO Presentation_Presenter VALUES (48, 126);
  INSERT INTO Presentation_Presenter VALUES (48, 127);
  INSERT INTO Presentation_Presenter VALUES (31, 128);
  INSERT INTO Presentation_Presenter VALUES (50, 129);
  INSERT INTO Presentation_Presenter VALUES (5, 130);
  INSERT INTO Presentation_Presenter VALUES (4, 131);
  INSERT INTO Presentation_Presenter VALUES (7, 132);
  INSERT INTO Presentation_Presenter VALUES (19, 133);
  INSERT INTO Presentation_Presenter VALUES (27, 134);
  INSERT INTO Presentation_Presenter VALUES (33, 135);
  INSERT INTO Presentation_Presenter VALUES (2, 136);
  INSERT INTO Presentation_Presenter VALUES (13, 137);
  INSERT INTO Presentation_Presenter VALUES (42, 138);
  INSERT INTO Presentation_Presenter VALUES (8, 139);
  INSERT INTO Presentation_Presenter VALUES (20, 140);
  INSERT INTO Presentation_Presenter VALUES (1, 141);
  INSERT INTO Presentation_Presenter VALUES (18, 142);
  INSERT INTO Presentation_Presenter VALUES (1, 143);
  INSERT INTO Presentation_Presenter VALUES (31, 144);
  INSERT INTO Presentation_Presenter VALUES (17, 145);
  INSERT INTO Presentation_Presenter VALUES (22, 146);
  INSERT INTO Presentation_Presenter VALUES (6, 147);
  INSERT INTO Presentation_Presenter VALUES (10, 148);
  INSERT INTO Presentation_Presenter VALUES (21, 149);
  INSERT INTO Presentation_Presenter VALUES (21, 150);
  INSERT INTO Presentation_Presenter VALUES (31, 151);
  INSERT INTO Presentation_Presenter VALUES (40, 152);
  INSERT INTO Presentation_Presenter VALUES (31, 153);
  INSERT INTO Presentation_Presenter VALUES (38, 154);

END
GO

