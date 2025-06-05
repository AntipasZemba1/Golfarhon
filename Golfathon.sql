-- --------------------------------------------------------------------------------
-- Name: Antipas Zemba
-- Abstract: Golfathon Database Assignment
-- --------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------
-- Options
-- --------------------------------------------------------------------------------
USE dbSQL1;   -- Get out of the master database
SET NOCOUNT ON;		-- Report only errors

-- uspCleanDatabase

-- --------------------------------------------------------------------------------
-- Drop Tables
-- --------------------------------------------------------------------------------
IF OBJECT_ID( 'TEventCorporateSponsorshipTypeCorporateSponsors' )	IS NOT NULL DROP TABLE TEventCorporateSponsorshipTypeCorporateSponsors
IF OBJECT_ID( 'TEventCorporateSponsorshipTypeBenefits' )		IS NOT NULL DROP TABLE TEventCorporateSponsorshipTypeBenefits
IF OBJECT_ID( 'TEventCorporateSponsorshipTypes' )			IS NOT NULL DROP TABLE TEventCorporateSponsorshipTypes
IF OBJECT_ID( 'TCorporateSponsors' )					IS NOT NULL DROP TABLE TCorporateSponsors
IF OBJECT_ID( 'TCorporateSponsorshipTypes' )				IS NOT NULL DROP TABLE TCorporateSponsorshipTypes

IF OBJECT_ID( 'TBenefits' )						IS NOT NULL DROP TABLE TBenefits
IF OBJECT_ID( 'TEventGolferTeamandClubs')				IS NOT NULL DROP TABLE TEventGolferTeamandClubs
IF OBJECT_ID( 'TEventGolferTeams' )			    		IS NOT NULL DROP TABLE TEventGolferTeams
IF OBJECT_ID( 'TEventGolferSponsors' )					IS NOT NULL DROP TABLE TEventGolferSponsors
IF OBJECT_ID( 'TEventGolfers' )						IS NOT NULL DROP TABLE TEventGolfers

IF OBJECT_ID( 'TSponsors' )						IS NOT NULL DROP TABLE TSponsors
IF OBJECT_ID( 'TEvents' )						IS NOT NULL DROP TABLE TEvents
IF OBJECT_ID( 'TGolfers' )						IS NOT NULL DROP TABLE TGolfers		
IF OBJECT_ID( 'TTeamandClubs' )						IS NOT NULL DROP TABLE TTeamandClubs
IF OBJECT_ID( 'TLevelofTeams' )						IS NOT NULL DROP TABLE TLevelofTeams

IF OBJECT_ID( 'TGenders' )						IS NOT NULL DROP TABLE TGenders
IF OBJECT_ID( 'TTypeofTeams' )						IS NOT NULL DROP TABLE TTypeofTeams
IF OBJECT_ID( 'TShirtSizes' )						IS NOT NULL DROP TABLE TShirtSizes
IF OBJECT_ID( 'TStates' )						IS NOT NULL DROP TABLE TStates
IF OBJECT_ID( 'TPaymentStatuses' )					IS NOT NULL DROP TABLE TPaymentStatuses

IF OBJECT_ID( 'TPaymentTypes' )						IS NOT NULL DROP TABLE TPaymentTypes 

-- --------------------------------------------------------------------------------
-- Step #1.1: Create Tables
-- --------------------------------------------------------------------------------
CREATE TABLE TEvents
(
	 intEventID			INTEGER		NOT NULL
	,dtmEventDate			Date		NOT NULL
	,CONSTRAINT TEvents_PK PRIMARY KEY ( intEventID )
)

CREATE TABLE TGolfers
(
	 intGolferID			INTEGER		NOT NULL
	,strFirstName			VARCHAR(255)	NOT NULL
	,strLastName			VARCHAR(255)	NOT NULL
	,strAddress			VARCHAR(255)	NOT NULL
	,strCity			VARCHAR(255)	NOT NULL
	,intStateID			INTEGER		NOT NULL
	,strZip				VARCHAR(255)	NOT NULL
	,strPhoneNumber			VARCHAR(255)	NOT NULL
	,strEmail			VARCHAR(255)	NOT NULL
	,intShirtSizeID			Integer		NOT NULL
	,intGenderID			Integer		NOT NULL
	,CONSTRAINT TGolfers_PK PRIMARY KEY ( intGolferID )
)

CREATE TABLE TShirtSizes
(
	 intShirtSizeID			INTEGER		NOT NULL
	,strShirtSizeDesc		VARCHAR(255)	NOT NULL
	,CONSTRAINT TShirtSizes_PK PRIMARY KEY ( intShirtSizeID )
)

CREATE TABLE TEventGolfers
(						
	 intEventGolferID		INTEGER		NOT NULL
	,intEventID			INTEGER		NOT NULL
	,intGolferID			INTEGER		NOT NULL
	,strReasonforPlaying		VARCHAR(8000)	NOT NULL
	,CONSTRAINT TEventGolfers_PK PRIMARY KEY ( intEventGolferID )
)

CREATE TABLE TEventGolferTeamandClubs
(						
	 intEventGolferTeamandClubID	INTEGER		NOT NULL
	,intEventGolferID		INTEGER		NOT NULL
	,intTeamandClubID		INTEGER		NOT NULL
	,CONSTRAINT TEventGolferTeams_PK PRIMARY KEY ( intEventGolferTeamandClubID )
)

CREATE TABLE TTeamandClubs
(						
	 intTeamandClubID		INTEGER		NOT NULL
	,intTypeofTeamID		INTEGER		NOT NULL
	,intLevelofTeamID		INTEGER		NOT NULL
	,intGenderID			INTEGER		NOT NULL
	,CONSTRAINT TTeamandClubs_PK PRIMARY KEY ( intTeamandClubID )
)

CREATE TABLE TTypeofTeams
(
	 intTypeofTeamID		INTEGER		NOT NULL
	,strTypeofTeamDesc		Varchar(255)	NOT NULL
	,CONSTRAINT TTypeofTeams_PK PRIMARY KEY ( intTypeofTeamID )
)

CREATE TABLE TLevelofTeams
(
	 intLevelofTeamID		INTEGER		NOT NULL
	,strLevelDesc			Varchar(255)	NOT NULL
	,CONSTRAINT TLevelofTeams_PK PRIMARY KEY ( intLevelofTeamID )
)

CREATE TABLE TGenders
(
	 intGenderID			INTEGER		NOT NULL
	,strGenderDesc			Varchar(255)	NOT NULL
	,CONSTRAINT TGenders_PK PRIMARY KEY ( intGenderID )
)

CREATE TABLE TEventGolferSponsors 
(
	 intEventGolferSponsorID	INTEGER		NOT NULL
	,intEventGolferID		INTEGER		NOT NULL
	,intSponsorID			INTEGER		NOT NULL
	,monPledgeAmount		MONEY		NOT NULL
	,dteDateofPledge		DATE		NOT NULL
	,intPaymentStatusID		INTEGER		NOT NULL
	,intPaymentTypeID		INTEGER		NOT NULL
	,CONSTRAINT TEventGolferSponsors_PK PRIMARY KEY ( intEventGolferSponsorID )
)

CREATE TABLE TSponsors
(
	 intSponsorID			INTEGER		NOT NULL
	,strFirstName			VARCHAR(255)	NOT NULL
	,strLastName			VARCHAR(255)	NOT NULL
	,strAddress			VARCHAR(255)	NOT NULL
	,strCity			VARCHAR(255)	NOT NULL
	,intStateID			INTEGER		NOT NULL
	,strZip				VARCHAR(255)	NOT NULL
	,strPhoneNumber			VARCHAR(255)	NOT NULL
	,strEmail			VARCHAR(255)	NOT NULL
	,CONSTRAINT TSponsors_PK PRIMARY KEY ( intSponsorID )
)

CREATE TABLE TPaymentTypes
(
	 intPaymentTypeID		INTEGER		NOT NULL
	,strPaymentTypeDesc		Varchar(255)	NOT NULL
	,CONSTRAINT TPaymentTypes_PK PRIMARY KEY ( intPaymentTypeID )
)

CREATE TABLE TPaymentStatuses
(
	 intPaymentStatusID		INTEGER		NOT NULL
	,strPaymentStatuseDesc		Varchar(255)	NOT NULL
	,CONSTRAINT TPaymentStatuses_PK PRIMARY KEY ( intPaymentStatusID )

)

CREATE TABLE TStates
(
	 intStateID			INTEGER		NOT NULL
	,strStateDesc			Varchar(255)	NOT NULL
	,CONSTRAINT TStates_PK PRIMARY KEY ( intStateID )
)

CREATE TABLE TEventCorporateSponsorshipTypes
(
	 intEventCorporateSponsorshipTypeID	INTEGER		NOT NULL
	,intEventID				INTEGER		NOT NULL
	,intCorporateSponsorshipTypeID		INTEGER		NOT NULL
	,monTypeCost				MONEY		NOT NULL
	,intAvailable				INTEGER		NOT NULL
	,CONSTRAINT EventCorporateSponsorshipTypes_PK PRIMARY KEY ( intEventCorporateSponsorshipTypeID )
)

CREATE TABLE TCorporateSponsorshipTypes
(
	 intCorporateSponsorshipTypeID		INTEGER		NOT NULL
	,strTypeDescription			VARCHAR(255)	NOT NULL
	,CONSTRAINT TCorporateSponsorshipTypes_PK PRIMARY KEY (  intCorporateSponsorshipTypeID )
)

CREATE TABLE TEventCorporateSponsorshipTypeBenefits
(
	 intEventCorporateSponsorshipTypeBenefitID	INTEGER		NOT NULL
	,intEventCorporateSponsorshipTypeID		INTEGER		NOT NULL
	,intBenefitID					INTEGER		NOT NULL  
	,CONSTRAINT TEventCorporateSponsorshipTypeBenefits_PK PRIMARY KEY ( intEventCorporateSponsorshipTypeBenefitID )
)

CREATE TABLE TBenefits
(
	 intBenefitID			INTEGER		NOT NULL
	,strBenefitDescription		ARCHAR(255)	NOT NULL  
	,CONSTRAINT TBenefits_PK PRIMARY KEY ( intBenefitID )
)


CREATE TABLE TEventCorporateSponsorshipTypeCorporateSponsors
(
	 intEventCorporateSponsorshipTypeCorporateSponsorID		INTEGER		NOT NULL
	,intEventCorporateSponsorshipTypeID				INTEGER		NOT NULL
	,intCorporateSponsorID						INTEGER		NOT NULL
	,CONSTRAINT TCorporateSponsorshipsCorporateSponsors_PK PRIMARY KEY ( intEventCorporateSponsorshipTypeCorporateSponsorID )	 
)

CREATE TABLE TCorporateSponsors
(
	 intCorporateSponsorID			INTEGER		NOT NULL
	,strCompanyName				VARCHAR(255)	NOT NULL
	,strFirstName				VARCHAR(255)	NOT NULL
	,strLastName				VARCHAR(255)	NOT NULL
	,strAddress				VARCHAR(255)	NOT NULL
	,strCity				VARCHAR(255)	NOT NULL
	,intStateID				INTEGER		NOT NULL
	,strZip					VARCHAR(255)	NOT NULL
	,strPhoneNumber				VARCHAR(255)	NOT NULL
	,strEmail				VARCHAR(255)	NOT NULL
	,CONSTRAINT TCorporateSponsors_PK PRIMARY KEY ( intCorporateSponsorID )
)

-- --------------------------------------------------------------------------------
-- Step #1.2: Identify and Create Foreign Keys
-- --------------------------------------------------------------------------------
--
-- #	Child						Parent					Column(s)
-- -	-----						------					---------
-- 1	TGolfer						TShirtSizes				intShirtSizeID   --
-- 2	TEventGolfers					TEvents					intEventID --
-- 3	TEventGolfers					TGolfers				intGolferID --

-- 4	TEventGolferTeamandClubs			TEventGolfers				intEventGolferID --

-- 5	TEventGolferTeamandClubs			TTeamandClubs				intTeamandClubID --
-- 6	TTeamandClubs					TTypeofTeams				intTypeofTeamID --
-- 7	TTeamandClubs					TLevelofTeams				intLevelofTeamID --
-- 8	TTeamandClubs					TGenders				intGenderID --

-- 9	TEventGolferSponsorships			TEventGolfers				intEventGolferID --
-- 10	TEventGolferSponsorships			TSponsors				intSponsorID --
-- 11	TEventGolferSponsorships			TPaymentTypes				intPaymentTypeID  --
-- 12	TEventGolferSponsorships			TPaymentStatuses			TPaymentStatusID --
	
-- 13	TEventCorporateSponsorshipTypes			TEvents					intEventID --
-- 14	TEventCorporateSponsorshipTypes			TCorporateSponsorshipTypes		intCorporateSponsorshipTypeID --

-- 15	TEventCorporateSponsorshipTypeBenefits		TEventCorporateSponsorshipsTypes	intEventCorporateSponsorshipsTypeID
-- 16	TEventCorporateSponsorshipTypeBenefits		TBenefits				intBenefitID 
-- 17	TEventCorporateSponsorshipTypeCorporateSponsors	TEventCorporateSponsorTypes		intEventCorporateSponsorshipsTypeID
-- 18	TEventCorporateSponsorshipTypeCorporateSponsors	TCorporateSponsors			intCorporateSponsorID

-- 19	TGolfer						TStates					intStateID
-- 20	TSponsors					TStates					intStateID
-- 21	TCorporateSponsors				TStates					intStateID
			
