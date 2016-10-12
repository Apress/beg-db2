-- Note: Remember to alter the schema name to the appropriate value for your installation
CONNECT TO SAMPLE;
CREATE TABLE FUZZY.SKILL ( SKILLNO INTEGER NOT NULL , SKILLNAME VARCHAR (50)
NOT NULL , SKILLDESCRIPTION VARCHAR (1000) ) ;
COMMENT ON TABLE FUZZY.SKILL IS 'Skills for Employees';
CONNECT RESET;