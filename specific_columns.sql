/*INSERTING SPECIFIC COLUMNS INTO MYSQL WORK BENCH USING THE LOAD DATA LOCAL INFILE COMMAND

PREREQUESTS: FIRST SET GLOBAL VARIABLE 'LOCAL_INFILE' TO "TRUE".
			 
IF ERROR RISES :
				`Error Code: 2068. LOAD DATA LOCAL INFILE file request rejected due to restrictions on access.’
THEN:
	OPEN DATABASE -> MANAGE CONNECTIONS -> go to the 'ADVANCED' -> sub-tab, and in the -> 'OTHERS' box add the line 'OPT_LOCAL_INFILE=1'.


*/

show global variables like 'local_infile';
set global local_infile=true;

create table test(s_no integer primary key auto_increment,
					name_1 varchar(30));

LOAD DATA LOCAL INFILE 'D:/test.csv' 
INTO TABLE test
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@S_NO, @NAME_1)			--@ REFERS (@S_NO) TO THE CSV_FILE COLUMN WHERE AS  (S_NO) REFERS TO THE COLUMN NAME OF THE TABLE
SET S_NO=@S_NO,NAME_1=@NAME_1;

SELECT * FROM TEST
