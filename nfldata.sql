-- -----------------------------------------------------
-- Table division
-- -----------------------------------------------------
DELETE FROM division;
INSERT INTO division (div_name,div_conference) VALUES ('NORTH','AFC');
INSERT INTO division (div_name,div_conference) VALUES ('NORTH','NFC');


-- -----------------------------------------------------
-- Table state
-- -----------------------------------------------------
DELETE FROM state;
INSERT INTO state (sta_namd) VALUES ('Maryland');
INSERT INTO state (sta_namd) VALUES ('Ohio');
INSERT INTO state (sta_namd) VALUES ('Pennsylvania');
INSERT INTO state (sta_namd) VALUES ('Illinois');
INSERT INTO state (sta_namd) VALUES ('Michigan');
INSERT INTO state (sta_namd) VALUES ('Wisconsin');
INSERT INTO state (sta_namd) VALUES ('Minnesota');
INSERT INTO state (sta_namd) VALUES ('New Jersey');
INSERT INTO state (sta_namd) VALUES ('Delaware');
INSERT INTO state (sta_namd) VALUES ('Florida');
INSERT INTO state (sta_namd) VALUES ('Luisiana');
INSERT INTO state (sta_namd) VALUES ('Mississippi');
INSERT INTO state (sta_namd) VALUES ('Texas');
INSERT INTO state (sta_namd) VALUES ('South Carolina');
INSERT INTO state (sta_namd) VALUES ('Georgia');
INSERT INTO state (sta_namd) VALUES ('California');
INSERT INTO state (sta_namd) VALUES ('Connecticut');
INSERT INTO state (sta_namd) VALUES ('Indiana');
INSERT INTO state (sta_namd) VALUES ('Alabama');
INSERT INTO state (sta_namd) VALUES ('Kansas');
INSERT INTO state (sta_namd) VALUES ('Oklahoma');
INSERT INTO state (sta_namd) VALUES ('Virginia');



-- -----------------------------------------------------
-- Table city
-- -----------------------------------------------------
DELETE FROM city;
INSERT INTO city (cit_name,cit_staid) VALUES('Baltimore', (SELECT sta_id from state WHERE sta_namd='Maryland') );
INSERT INTO city (cit_name,cit_staid) VALUES('Cincinatti', (SELECT sta_id from state WHERE sta_namd='Ohio') );
INSERT INTO city (cit_name,cit_staid) VALUES('Cleveland', (SELECT sta_id from state WHERE sta_namd='Ohio') );
INSERT INTO city (cit_name,cit_staid) VALUES('Pittsburgh', (SELECT sta_id from state WHERE sta_namd='Pennsylvania') );
INSERT INTO city (cit_name,cit_staid) VALUES('Chicago', (SELECT sta_id from state WHERE sta_namd='Illinois') );
INSERT INTO city (cit_name,cit_staid) VALUES('Detroit', (SELECT sta_id from state WHERE sta_namd='Michigan') );
INSERT INTO city (cit_name,cit_staid) VALUES('Green Bay', (SELECT sta_id from state WHERE sta_namd='Wisconsin') );
INSERT INTO city (cit_name,cit_staid) VALUES('Minneapolis', (SELECT sta_id from state WHERE sta_namd='Minnesota') );
INSERT INTO city (cit_name,cit_staid) VALUES('Audubon', (SELECT sta_id from state WHERE sta_namd='New Jersey') );
INSERT INTO city (cit_name,cit_staid) VALUES('Fort Lauderdale', (SELECT sta_id from state WHERE sta_namd='Florida') );
INSERT INTO city (cit_name,cit_staid) VALUES('New Orleans', (SELECT sta_id from state WHERE sta_namd='Luisiana') );
INSERT INTO city (cit_name,cit_staid) VALUES('Katy', (SELECT sta_id from state WHERE sta_namd='Texas') );
INSERT INTO city (cit_name,cit_staid) VALUES('Ridgeville', (SELECT sta_id from state WHERE sta_namd='South Carolina') );
INSERT INTO city (cit_name,cit_staid) VALUES('Baton Rouge', (SELECT sta_id from state WHERE sta_namd='Luisiana') );
INSERT INTO city (cit_name,cit_staid) VALUES('Bakersfield', (SELECT sta_id from state WHERE sta_namd='California') );
INSERT INTO city (cit_name,cit_staid) VALUES('Columbus', (SELECT sta_id from state WHERE sta_namd='Ohio') );
INSERT INTO city (cit_name,cit_staid) VALUES('Jeannette', (SELECT sta_id from state WHERE sta_namd='Pennsylvania') );
INSERT INTO city (cit_name,cit_staid) VALUES('Lima', (SELECT sta_id from state WHERE sta_namd='Ohio') );
INSERT INTO city (cit_name,cit_staid) VALUES('Miami', (SELECT sta_id from state WHERE sta_namd='Florida') );
INSERT INTO city (cit_name,cit_staid) VALUES('Lakewood', (SELECT sta_id from state WHERE sta_namd='Ohio') );
INSERT INTO city (cit_name,cit_staid) VALUES('Fairfield', (SELECT sta_id from state WHERE sta_namd='Connecticut') );
INSERT INTO city (cit_name,cit_staid) VALUES('Matthews', (SELECT sta_id from state WHERE sta_namd='South Carolina') );
INSERT INTO city (cit_name,cit_staid) VALUES('Tampa', (SELECT sta_id from state WHERE sta_namd='Florida') );
INSERT INTO city (cit_name,cit_staid) VALUES('Manville', (SELECT sta_id from state WHERE sta_namd='New Jersey') );
INSERT INTO city (cit_name,cit_staid) VALUES('South Euclid', (SELECT sta_id from state WHERE sta_namd='Ohio') );
INSERT INTO city (cit_name,cit_staid) VALUES('Los Angeles', (SELECT sta_id from state WHERE sta_namd='California') );
INSERT INTO city (cit_name,cit_staid) VALUES('Chico', (SELECT sta_id from state WHERE sta_namd='California') );
INSERT INTO city (cit_name,cit_staid) VALUES('Gretna', (SELECT sta_id from state WHERE sta_namd='Luisiana') );
INSERT INTO city (cit_name,cit_staid) VALUES('Manhattan', (SELECT sta_id from state WHERE sta_namd='Kansas') );
INSERT INTO city (cit_name,cit_staid) VALUES('Oklahoma City', (SELECT sta_id from state WHERE sta_namd='Oklahoma') );
INSERT INTO city (cit_name,cit_staid) VALUES('Alexandria', (SELECT sta_id from state WHERE sta_namd='Virginia') );
INSERT INTO city (cit_name,cit_staid) VALUES('Atlanta', (SELECT sta_id from state WHERE sta_namd='Georgia') );






-- -----------------------------------------------------
-- Table stadium
-- -----------------------------------------------------
DELETE FROM stadium;
INSERT INTO stadium (std_name,std_capacity,std_citid) VALUES ('M&T Bank Stadium','71.008', (SELECT cit_id from city WHERE cit_name='Baltimore'));
INSERT INTO stadium (std_name,std_capacity,std_citid) VALUES ('Paul Brown Stadium','65.535', (SELECT cit_id from city WHERE cit_name='Cincinatti'));
INSERT INTO stadium (std_name,std_capacity,std_citid) VALUES ('FirstEnergy Stadium','73.200', (SELECT cit_id from city WHERE cit_name='Cleveland'));
INSERT INTO stadium (std_name,std_capacity,std_citid) VALUES ('Heinz Field','65.050', (SELECT cit_id from city WHERE cit_name='Pittsburgh'));
INSERT INTO stadium (std_name,std_capacity,std_citid) VALUES ('Soldier Field','61.500', (SELECT cit_id from city WHERE cit_name='Chicago'));
INSERT INTO stadium (std_name,std_capacity,std_citid) VALUES ('Ford Field','65.000', (SELECT cit_id from city WHERE cit_name='Detroit'));
INSERT INTO stadium (std_name,std_capacity,std_citid) VALUES ('Lambeau Field','80.735', (SELECT cit_id from city WHERE cit_name='Green Bay'));
INSERT INTO stadium (std_name,std_capacity,std_citid) VALUES ('U.S. Bank Stadium','66.655', (SELECT cit_id from city WHERE cit_name='Minneapolis'));


-- -----------------------------------------------------
-- Table team
-- -----------------------------------------------------
DELETE FROM team;
INSERT INTO team (tea_name,tea_owner,tea_yearfoundation,tea_stdid,tea_citid,tea_divid) VALUES ('Baltimore Ravens', 'Steve Bisciotti', '1996',
    (SELECT std_id from stadium WHERE std_name='M&T Bank Stadium') , (SELECT cit_id from city WHERE cit_name='Baltimore'), (SELECT div_id from division WHERE div_conference='AFC'));
INSERT INTO team (tea_name,tea_owner,tea_yearfoundation,tea_stdid,tea_citid,tea_divid) VALUES ('Cincinnati Bengals', 'Mike Brown', '1968',
    (SELECT std_id from stadium WHERE std_name='Paul Brown Stadium') , (SELECT cit_id from city WHERE cit_name='Cincinatti'), (SELECT div_id from division WHERE div_conference='AFC'));
INSERT INTO team (tea_name,tea_owner,tea_yearfoundation,tea_stdid,tea_citid,tea_divid) VALUES ('Cleveland Browns', 'Jimmy Haslam', '1946',
    (SELECT std_id from stadium WHERE std_name='FirstEnergy Stadium') , (SELECT cit_id from city WHERE cit_name='Cleveland'), (SELECT div_id from division WHERE div_conference='AFC'));
INSERT INTO team (tea_name,tea_owner,tea_yearfoundation,tea_stdid,tea_citid,tea_divid) VALUES ('Pittsburgh Steelers', 'Rooney family', '1933',
    (SELECT std_id from stadium WHERE std_name='Heinz Field') , (SELECT cit_id from city WHERE cit_name='Pittsburgh'), (SELECT div_id from division WHERE div_conference='AFC'));
INSERT INTO team (tea_name,tea_owner,tea_yearfoundation,tea_stdid,tea_citid,tea_divid) VALUES ('Chicago Bears', 'Virginia Halas McCaskey', '1919',
    (SELECT std_id from stadium WHERE std_name='Soldier Field') , (SELECT cit_id from city WHERE cit_name='Chicago'), (SELECT div_id from division WHERE div_conference='NFC'));
INSERT INTO team (tea_name,tea_owner,tea_yearfoundation,tea_stdid,tea_citid,tea_divid) VALUES ('Detroit Lions', 'Martha Firestone Ford', '1929',
    (SELECT std_id from stadium WHERE std_name='Ford Field') , (SELECT cit_id from city WHERE cit_name='Detroit'), (SELECT div_id from division WHERE div_conference='NFC'));
INSERT INTO team (tea_name,tea_owner,tea_yearfoundation,tea_stdid,tea_citid,tea_divid) VALUES ('Green Bay Packers', 'Green Bay Packers', '1919',
    (SELECT std_id from stadium WHERE std_name='Lambeau Field') , (SELECT cit_id from city WHERE cit_name='Green Bay'), (SELECT div_id from division WHERE div_conference='NFC'));
INSERT INTO team (tea_name,tea_owner,tea_yearfoundation,tea_stdid,tea_citid,tea_divid) VALUES ('Minnesota Vikings', 'Jordan Howard', '1961',
    (SELECT std_id from stadium WHERE std_name='U.S. Bank Stadium') , (SELECT cit_id from city WHERE cit_name='Minneapolis'), (SELECT div_id from division WHERE div_conference='NFC'));


-- -----------------------------------------------------
-- Table university
-- -----------------------------------------------------
DELETE FROM university;
INSERT INTO university (uni_name,uni_staid) VALUES ('University of Delaware',(SELECT sta_id from state WHERE sta_namd='Delaware') );
INSERT INTO university (uni_name,uni_staid) VALUES ('Towson University', (SELECT sta_id from state WHERE sta_namd='Maryland') );
INSERT INTO university (uni_name,uni_staid) VALUES ('University of Mississippi',(SELECT sta_id from state WHERE sta_namd='Mississippi') );
INSERT INTO university (uni_name,uni_staid) VALUES ('Texas Christian University',(SELECT sta_id from state WHERE sta_namd='Texas') );
INSERT INTO university (uni_name,uni_staid) VALUES ('University of Georgia',(SELECT sta_id from state WHERE sta_namd='Georgia') );
INSERT INTO university (uni_name,uni_staid) VALUES ('Louisiana State University',(SELECT sta_id from state WHERE sta_namd='Luisiana') );
INSERT INTO university (uni_name,uni_staid) VALUES ('University of Southern California',(SELECT sta_id from state WHERE sta_namd='California') );
INSERT INTO university (uni_name,uni_staid) VALUES ('Ohio State University',(SELECT sta_id from state WHERE sta_namd='Ohio') );
INSERT INTO university (uni_name,uni_staid) VALUES ('University of Miami',(SELECT sta_id from state WHERE sta_namd='Florida') );
INSERT INTO university (uni_name,uni_staid) VALUES ('Michigan State University',(SELECT sta_id from state WHERE sta_namd='Michigan') );
INSERT INTO university (uni_name,uni_staid) VALUES ('Indiana State University',(SELECT sta_id from state WHERE sta_namd='Indiana') );
INSERT INTO university (uni_name,uni_staid) VALUES ('University of South Carolina',(SELECT sta_id from state WHERE sta_namd='South Carolina') );
INSERT INTO university (uni_name,uni_staid) VALUES ('Notre Dame College',(SELECT sta_id from state WHERE sta_namd='Ohio') );
INSERT INTO university (uni_name,uni_staid) VALUES ('Etiwanda High School',(SELECT sta_id from state WHERE sta_namd='California') );
INSERT INTO university (uni_name,uni_staid) VALUES ('University of Alabama',(SELECT sta_id from state WHERE sta_namd='Alabama') );
INSERT INTO university (uni_name,uni_staid) VALUES ('Kansas State University',(SELECT sta_id from state WHERE sta_namd='Kansas') );
INSERT INTO university (uni_name,uni_staid) VALUES ('University of Oklahoma',(SELECT sta_id from state WHERE sta_namd='Oklahoma') );
INSERT INTO university (uni_name,uni_staid) VALUES ('Georgia Southern University',(SELECT sta_id from state WHERE sta_namd='Georgia') );
INSERT INTO university (uni_name,uni_staid) VALUES ('University of Maryland',(SELECT sta_id from state WHERE sta_namd='Maryland') );




-- -----------------------------------------------------
-- Table player
-- -----------------------------------------------------
DELETE FROM player;
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Joe Flacco','1985-01-16',(SELECT cit_id from city WHERE cit_name='New Orleans'),
    (SELECT uni_id from university WHERE uni_name='University of Delaware'),'QB','78','245');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Terrance West','1991-01-28',(SELECT cit_id from city WHERE cit_name='Fort Lauderdale'),
    (SELECT uni_id from university WHERE uni_name='Towson University'),'RB','70','225');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Mike Wallace','1986-08-01',(SELECT cit_id from city WHERE cit_name='New Orleans'),
    (SELECT uni_id from university WHERE uni_name='University of Mississippi'),'WR','72','205');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Andy Dalton','1987-10-29',(SELECT cit_id from city WHERE cit_name='Katy'),
    (SELECT uni_id from university WHERE uni_name='Texas Christian University'),'QB','74','220');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('A.J. Green','1988-07-31',(SELECT cit_id from city WHERE cit_name='Ridgeville'),
    (SELECT uni_id from university WHERE uni_name='University of Georgia'),'WR','76','210');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Jeremy Hill','1992-10-20',(SELECT cit_id from city WHERE cit_name='Baton Rouge'),
    (SELECT uni_id from university WHERE uni_name='Louisiana State University'),'RB','73','235');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Cody Kessler','1993-5-11',(SELECT cit_id from city WHERE cit_name='Bakersfield'),
    (SELECT uni_id from university WHERE uni_name='University of Southern California'),'QB','72','215');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Isaiah Crowell','1993-1-8',(SELECT cit_id from city WHERE cit_name='Columbus'),
    (SELECT uni_id from university WHERE uni_name='University of Georgia'),'RB','60','225');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Terrelle Pryor','1989-6-20',(SELECT cit_id from city WHERE cit_name='Jeannette'),
    (SELECT uni_id from university WHERE uni_name='Ohio State University'),'RB','72','223');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Ben Roethlisberger','1982-3-2',(SELECT cit_id from city WHERE cit_name='Lima'),
    (SELECT uni_id from university WHERE uni_name='University of Miami'),'QB','72','240');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Le Veon Bell','1992-8-18',(SELECT cit_id from city WHERE cit_name='Columbus'),
    (SELECT uni_id from university WHERE uni_name='Michigan State University'),'RB','72','225');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Antonio Brown','1988-7-10',(SELECT cit_id from city WHERE cit_name='Miami'),
    (SELECT uni_id from university WHERE uni_name='Ohio State University'),'WR','60','181');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Brian Hoyer','1985-10-13',(SELECT cit_id from city WHERE cit_name='Lakewood'),
    (SELECT uni_id from university WHERE uni_name='Michigan State University'),'QB','72','215');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Jordan Howard','1994-11-2',(SELECT cit_id from city WHERE cit_name='Fairfield'),
    (SELECT uni_id from university WHERE uni_name='Indiana State University'),'RB','70','222');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Alshon Jeffery','1990-2-14',(SELECT cit_id from city WHERE cit_name='Matthews'),
    (SELECT uni_id from university WHERE uni_name='University of Southern California'),'WR','79','218');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Matthew Stafford','1988-2-7',(SELECT cit_id from city WHERE cit_name='Tampa'),
    (SELECT uni_id from university WHERE uni_name='University of Georgia'),'QB','76','226');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Theo Riddick','1991-5-4',(SELECT cit_id from city WHERE cit_name='Manville'),
    (SELECT uni_id from university WHERE uni_name='Notre Dame College'),'RB','71','201');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Marvin Jones','1990-3-12',(SELECT cit_id from city WHERE cit_name='Los Angeles'),
    (SELECT uni_id from university WHERE uni_name='Etiwanda High School'),'WR','74','198');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Aaron Rodgers','1983-12-2',(SELECT cit_id from city WHERE cit_name='Chico'),
    (SELECT uni_id from university WHERE uni_name='University of Southern California'),'QB','74','225');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Eddie Lacy','1990-6-2',(SELECT cit_id from city WHERE cit_name='Gretna'),
    (SELECT uni_id from university WHERE uni_name='University of Alabama'),'RB','61','234');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Jordy Nelson','1985-5-31',(SELECT cit_id from city WHERE cit_name='Manhattan'),
    (SELECT uni_id from university WHERE uni_name='Kansas State University'),'WR','75','217');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Sam Bradford','1987-11-8',(SELECT cit_id from city WHERE cit_name='Oklahoma City'),
    (SELECT uni_id from university WHERE uni_name='University of Oklahoma'),'QB','77','224');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Jerick McKinnon','1992-5-3',(SELECT cit_id from city WHERE cit_name='Atlanta'),
    (SELECT uni_id from university WHERE uni_name='Georgia Southern University'),'RB','71','205');
INSERT INTO player (pla_name,pla_dob,pla_citid,pla_uniid,pla_position,pla_height,pla_weight) VALUES ('Stefon Diggs','1993-11-29',(SELECT cit_id from city WHERE cit_name='Alexandria'),
    (SELECT uni_id from university WHERE uni_name='University of Maryland'),'WR','72','191');


-- -----------------------------------------------------
-- Table player_team
-- -----------------------------------------------------
DELETE FROM player_team;
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Joe Flacco'),
    (SELECT tea_id from team WHERE tea_name='Baltimore Ravens'),'5','2013','2018','66000000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Terrance West'),
    (SELECT tea_id from team WHERE tea_name='Baltimore Ravens'),'28','2016','2017','600000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Mike Wallace'),
    (SELECT tea_id from team WHERE tea_name='Baltimore Ravens'),'17','2016','2018','8000000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Andy Dalton'),
    (SELECT tea_id from team WHERE tea_name='Cincinnati Bengals'),'14','2014','2020','96000000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='A.J. Green'),
    (SELECT tea_id from team WHERE tea_name='Cincinnati Bengals'),'18','2015','2019','60000000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Jeremy Hill'),
    (SELECT tea_id from team WHERE tea_name='Cincinnati Bengals'),'32' ,'2014','2017','3753602','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Cody Kessler'),
    (SELECT tea_id from team WHERE tea_name='Cleveland Browns'),'6','2016','2019','34000000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Isaiah Crowell'),
    (SELECT tea_id from team WHERE tea_name='Cleveland Browns'),'34','2014','2017','1540000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Terrelle Pryor'),
    (SELECT tea_id from team WHERE tea_name='Cleveland Browns'),'11','2014','2017','3753602','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Ben Roethlisberger'),
    (SELECT tea_id from team WHERE tea_name='Pittsburgh Steelers'),'7','2015','2019','87400000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Le Veon Bell'),
    (SELECT tea_id from team WHERE tea_name='Pittsburgh Steelers'),'26','2013','2016','4120000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Antonio Brown'),
    (SELECT tea_id from team WHERE tea_name='Pittsburgh Steelers'),'84','2012','2017','41960000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Brian Hoyer'),
    (SELECT tea_id from team WHERE tea_name='Chicago Bears'),'2','2016','2017','2000000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Jordan Howard'),
    (SELECT tea_id from team WHERE tea_name='Chicago Bears'),'84','2016','2019','2588000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Alshon Jeffery'),
    (SELECT tea_id from team WHERE tea_name='Chicago Bears'),'27','2016','2017','14599000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Matthew Stafford'),
    (SELECT tea_id from team WHERE tea_name='Detroit Lions'),'9','2013','2017','53000000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Theo Riddick'),
    (SELECT tea_id from team WHERE tea_name='Detroit Lions'),'25','2016','2019','11550000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Marvin Jones'),
    (SELECT tea_id from team WHERE tea_name='Detroit Lions'),'11','2016','2020','40000000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Aaron Rodgers'),
    (SELECT tea_id from team WHERE tea_name='Green Bay Packers'),'12','2013','2020','110000000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Eddie Lacy'),
    (SELECT tea_id from team WHERE tea_name='Green Bay Packers'),'27','2013','2017','3392000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Jordy Nelson'),
    (SELECT tea_id from team WHERE tea_name='Green Bay Packers'),'87','2014','2018','39050000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Sam Bradford'),
    (SELECT tea_id from team WHERE tea_name='Minnesota Vikings'),'8','2016','2017','35000000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Jerick McKinnon'),
    (SELECT tea_id from team WHERE tea_name='Minnesota Vikings'),'21','2014','2017','2765000','1');
INSERT INTO player_team (plt_plaid,plt_teaid,plt_jerseynum,plt_contractstartdate,plt_contractenddate,plt_contractvalue,plt_active) VALUES ((SELECT pla_id from player WHERE pla_name='Stefon Diggs'),
    (SELECT tea_id from team WHERE tea_name='Minnesota Vikings'),'14','2015','2018','2507000','1');


-- -----------------------------------------------------
-- Table `nfldb`.`game`
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Table `nfldb`.`offensive_stats`
-- -----------------------------------------------------
