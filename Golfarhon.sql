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
IF OBJECT_ID( 'TEventCorporateSponsorshipTypeBenefits' )		    IS NOT NULL DROP TABLE TEventCorporateSponsorshipTypeBenefits
IF OBJECT_ID( 'TEventCorporateSponsorshipTypes' )			        IS NOT NULL DROP TABLE TEventCorporateSponsorshipTypes
IF OBJECT_ID( 'TCorporateSponsors' )					            IS NOT NULL DROP TABLE TCorporateSponsors
IF OBJECT_ID( 'TCorporateSponsorshipTypes' )				        IS NOT NULL DROP TABLE TCorporateSponsorshipTypes

IF OBJECT_ID( 'TBenefits' )						IS NOT NULL DROP TABLE TBenefits
IF OBJECT_ID( 'TEventGolferTeamandClubs')		IS NOT NULL DROP TABLE TEventGolferTeamandClubs
IF OBJECT_ID( 'TEventGolferTeams' )			    IS NOT NULL DROP TABLE TEventGolferTeams
IF OBJECT_ID( 'TEventGolferSponsors' )			IS NOT NULL DROP TABLE TEventGolferSponsors
IF OBJECT_ID( 'TEventGolfers' )					IS NOT NULL DROP TABLE TEventGolfers

IF OBJECT_ID( 'TSponsors' )						IS NOT NULL DROP TABLE TSponsors
IF OBJECT_ID( 'TEvents' )						IS NOT NULL DROP TABLE TEvents
IF OBJECT_ID( 'TGolfers' )						IS NOT NULL DROP TABLE TGolfers		
IF OBJECT_ID( 'TTeamandClubs' )					IS NOT NULL DROP TABLE TTeamandClubs
IF OBJECT_ID( 'TLevelofTeams' )					IS NOT NULL DROP TABLE TLevelofTeams

IF OBJECT_ID( 'TGenders' )						IS NOT NULL DROP TABLE TGenders
IF OBJECT_ID( 'TTypeofTeams' )					IS NOT NULL DROP TABLE TTypeofTeams
IF OBJECT_ID( 'TShirtSizes' )					IS NOT NULL DROP TABLE TShirtSizes
IF OBJECT_ID( 'TStates' )						IS NOT NULL DROP TABLE TStates
IF OBJECT_ID( 'TPaymentStatuses' )				IS NOT NULL DROP TABLE TPaymentStatuses

IF OBJECT_ID( 'TPaymentTypes' )					IS NOT NULL DROP TABLE TPaymentTypes 
