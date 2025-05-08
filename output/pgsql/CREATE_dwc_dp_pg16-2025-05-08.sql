--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: agent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agent (
    "agentID" text NOT NULL,
    "agentType" text,
    "agentTypeIRI" text,
    "agentTypeVocabulary" text,
    "preferredAgentName" text
);


ALTER TABLE public.agent OWNER TO postgres;

--
-- Name: TABLE agent; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.agent IS 'Preferred Agent Name - A name of an Agent preferred in searches and results.';


--
-- Name: COLUMN agent."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN agent."agentType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."agentType" IS 'Agent Type - A category that best matches the nature of an Agent.';


--
-- Name: COLUMN agent."agentTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."agentTypeIRI" IS 'Agent Type IRI - An IRI of a controlled vocabulary value for a type of Agent.';


--
-- Name: COLUMN agent."agentTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."agentTypeVocabulary" IS 'Agent Type Vocabulary - A reference to a controlled vocabulary in which the definition of a value in agentType is given.';


--
-- Name: COLUMN agent."preferredAgentName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."preferredAgentName" IS 'Preferred Agent Name - A name of an Agent preferred in searches and results.';


--
-- Name: agent-agent-role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."agent-agent-role" (
    "agentID" text NOT NULL,
    "relatedAgentID" text NOT NULL,
    "agentRole" text,
    "agentRoleIRI" text,
    "agentRoleVocabulary" text,
    "agentRoleOrder" integer,
    "agentRoleDate" text,
    CONSTRAINT "agent-agent-role_agentRoleOrder_check" CHECK (("agentRoleOrder" >= 1))
);


ALTER TABLE public."agent-agent-role" OWNER TO postgres;

--
-- Name: TABLE "agent-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."agent-agent-role" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "agent-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "agent-agent-role"."relatedAgentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."relatedAgentID" IS 'Related Agent ID - An identifier for a related Agent.';


--
-- Name: COLUMN "agent-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRole" IS 'Agent Role - A category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "agent-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRoleIRI" IS 'Agent Role IRI - An IRI of the controlled vocabulary value for a role of an Agent.';


--
-- Name: COLUMN "agent-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRoleVocabulary" IS 'Agent Role Vocabulary - A reference to a controlled vocabulary in which the definition of a value in agentRole is given.';


--
-- Name: COLUMN "agent-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRoleOrder" IS 'Agent Role Order - A numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "agent-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRoleDate" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: agent-identifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."agent-identifier" (
    identifier text NOT NULL,
    "agentID" text NOT NULL,
    "identifierType" text,
    "identifierTypeIRI" text,
    "identifierTypeVocabulary" text,
    "identifierLanguage" text
);


ALTER TABLE public."agent-identifier" OWNER TO postgres;

--
-- Name: TABLE "agent-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."agent-identifier" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: COLUMN "agent-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier".identifier IS 'Identifier - An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "agent-identifier"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "agent-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."identifierType" IS 'Identifier Type - A category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "agent-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."identifierTypeIRI" IS 'Identifier Type IRI - An IRI of a controlled vocabulary value for a type of Identifier.';


--
-- Name: COLUMN "agent-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."identifierTypeVocabulary" IS 'Identifier Type Vocabulary - A reference to a controlled vocabulary in which the definition of a value in identifierType is given.';


--
-- Name: COLUMN "agent-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."identifierLanguage" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: agent-media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."agent-media" (
    "mediaID" text NOT NULL,
    "agentID" text NOT NULL,
    "mediaSubjectCategory" text,
    "mediaSubjectCategoryIRI" text,
    "mediaSubjectCategoryVocabulary" text
);


ALTER TABLE public."agent-media" OWNER TO postgres;

--
-- Name: TABLE "agent-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."agent-media" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "agent-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN "agent-media"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "agent-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."mediaSubjectCategory" IS 'Media Subject Category - A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "agent-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."mediaSubjectCategoryIRI" IS 'Media Subject Category IRI - An IRI of a controlled vocabulary value for the subject category of a Media instance.';


--
-- Name: COLUMN "agent-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."mediaSubjectCategoryVocabulary" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: chronometric-age; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."chronometric-age" (
    "chronometricAgeID" text NOT NULL,
    "eventID" text NOT NULL,
    "verbatimChronometricAge" text,
    "chronometricAgeProtocol" text,
    "chronometricAgeProtocolID" text,
    "uncalibratedChronometricAge" text,
    "chronometricAgeConversionProtocol" text,
    "chronometricAgeConversionProtocolID" text,
    "earliestChronometricAge" text,
    "earliestChronometricAgeReferenceSystem" text,
    "latestChronometricAge" text,
    "latestChronometricAgeReferenceSystem" text,
    "chronometricAgeUncertaintyInYears" integer,
    "chronometricAgeUncertaintyMethod" text,
    "materialDated" text,
    "materialDatedID" text,
    "materialDatedRelationship" text,
    "chronometricAgeDeterminedBy" text,
    "chronometricAgeDeterminedByID" text,
    "chronometricAgeDeterminedDate" text,
    "chronometricAgeReferences" text,
    "chronometricAgeRemarks" text
);


ALTER TABLE public."chronometric-age" OWNER TO postgres;

--
-- Name: TABLE "chronometric-age"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age" IS 'Chronometric Age Remarks - Comments or notes about a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeID" IS 'Chronometric Age ID - An identifier for a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN "chronometric-age"."verbatimChronometricAge"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."verbatimChronometricAge" IS 'Verbatim Chronometric Age - A verbatim age for a dwc:Event, whether reported by a dating assay, associated references, or legacy information.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeProtocol" IS 'Chronometric Age Protocol - A description of or reference to a Protocol used to determine a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeProtocolID" IS 'Chronometric Age Protocol ID - An identifier for a Protocol used to determine a ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."uncalibratedChronometricAge"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."uncalibratedChronometricAge" IS 'Uncalibrated Chronometric Age - An output of a dating assay before it is calibrated into an age using a specific conversion protocol.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeConversionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeConversionProtocol" IS 'Chronometric Age Conversion Protocol - A description of or reference to a Protocol used to convert a chrono:uncalibratedChronometricAge into a chronometric age in years, as captured in the chrono:earliestChronometricAge, chrono:earliestChronometricAgeReferenceSystem, chrono:latestChronometricAge, and chrono:latestChronometricAgeReferenceSystem fields.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeConversionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeConversionProtocolID" IS 'Chronometric Age Conversion Protocol ID - An identifier for a Protocol used to convert a chrono:uncalibratedChronometricAge into a chronometric age in years, as captured in the chrono:earliestChronometricAge, chrono:earliestChronometricAgeReferenceSystem, chrono:latestChronometricAge, and chrono:latestChronometricAgeReferenceSystem fields.';


--
-- Name: COLUMN "chronometric-age"."earliestChronometricAge"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."earliestChronometricAge" IS 'Earliest Chronometric Age - A maximum/earliest/oldest possible age of a dwc:MaterialEntity as determined by a dating method.';


--
-- Name: COLUMN "chronometric-age"."earliestChronometricAgeReferenceSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."earliestChronometricAgeReferenceSystem" IS 'Earliest Chronometric Age Reference System - A reference system associated with a chrono:earliestChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."latestChronometricAge"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."latestChronometricAge" IS 'Latest Chronometric Age - A minimum/latest/youngest possible age of a dwc:MaterialEntity as determined by a dating method.';


--
-- Name: COLUMN "chronometric-age"."latestChronometricAgeReferenceSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."latestChronometricAgeReferenceSystem" IS 'Latest Chronometric Age Reference System - A reference system associated with a chrono:latestChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeUncertaintyInYears"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeUncertaintyInYears" IS 'Chronometric Age Uncertainty In Years - A temporal uncertainty of a chrono:earliestChronometricAge and chrono:latestChronometicAge in years.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeUncertaintyMethod"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeUncertaintyMethod" IS 'Chronometric Age Uncertainty Method - A method used to generate a value of chrono:ChronometricAgeUncertaintyInYears.';


--
-- Name: COLUMN "chronometric-age"."materialDated"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."materialDated" IS 'Material Dated - A description of a dwc:MaterialEntity on which a chrono:ChronometricAgeProtocol was actually performed, if known.';


--
-- Name: COLUMN "chronometric-age"."materialDatedID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."materialDatedID" IS 'Material Dated ID - An identifier for a dwc:MaterialEntity on which a chrono:ChronometricAgeProtocol was performed, if applicable.';


--
-- Name: COLUMN "chronometric-age"."materialDatedRelationship"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."materialDatedRelationship" IS 'Material Dated Relationship - A relationship of a chrono:materialDated to a dwc:MaterialEntity, from which a chrono:ChronometricAge of the related dwc:MaterialEntity and any related dwc:Occurrence is inferred.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeDeterminedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeDeterminedBy" IS 'Chronometric Age Determined By - A list (concatenated and separated) of names of Agents responsible for determining the chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeDeterminedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeDeterminedByID" IS 'Chronometric Age Determined By ID - An identifier for an Agent responsible for determining a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeDeterminedDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeDeterminedDate" IS 'Chronometric Age Determined Date - A date on which a chrono:ChronometricAge was determined.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeReferences" IS 'Chronometric Age References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with the chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeRemarks" IS 'Chronometric Age Remarks - Comments or notes about a chrono:ChronometricAge.';


--
-- Name: chronometric-age-agent-role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."chronometric-age-agent-role" (
    "agentID" text NOT NULL,
    "chronometricAgeID" text NOT NULL,
    "agentRole" text,
    "agentRoleIRI" text,
    "agentRoleVocabulary" text,
    "agentRoleOrder" integer,
    "agentRoleDate" text,
    CONSTRAINT "chronometric-age-agent-role_agentRoleOrder_check" CHECK (("agentRoleOrder" >= 1))
);


ALTER TABLE public."chronometric-age-agent-role" OWNER TO postgres;

--
-- Name: TABLE "chronometric-age-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age-agent-role" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "chronometric-age-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "chronometric-age-agent-role"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."chronometricAgeID" IS 'Chronometric Age ID - An identifier for a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRole" IS 'Agent Role - A category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "chronometric-age-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRoleIRI" IS 'Agent Role IRI - An IRI of the controlled vocabulary value for a role of an Agent.';


--
-- Name: COLUMN "chronometric-age-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRoleVocabulary" IS 'Agent Role Vocabulary - A reference to a controlled vocabulary in which the definition of a value in agentRole is given.';


--
-- Name: COLUMN "chronometric-age-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRoleOrder" IS 'Agent Role Order - A numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "chronometric-age-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRoleDate" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: chronometric-age-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."chronometric-age-assertion" (
    "assertionID" text NOT NULL,
    "chronometricAgeID" text NOT NULL,
    "assertionType" text,
    "assertionTypeIRI" text,
    "assertionTypeVocabulary" text,
    "assertionMadeDate" text,
    "assertionEffectiveDate" text,
    "assertionValue" text,
    "assertionValueIRI" text,
    "assertionValueVocabulary" text,
    "assertionValueNumeric" numeric,
    "assertionUnit" text,
    "assertionUnitIRI" text,
    "assertionUnitVocabulary" text,
    "assertionBy" text,
    "assertionByID" text,
    "assertionProtocols" text,
    "assertionProtocolID" text,
    "assertionReferences" text,
    "assertionRemarks" text
);


ALTER TABLE public."chronometric-age-assertion" OWNER TO postgres;

--
-- Name: TABLE "chronometric-age-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age-assertion" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionID" IS 'Assertion ID - An identifier for an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."chronometricAgeID" IS 'Chronometric Age ID - An identifier for a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionType" IS 'Assertion Type - A category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionTypeIRI" IS 'Assertion Type IRI - An IRI of a controlled vocabulary value for a type of Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionTypeVocabulary" IS 'Assertion Type Vocabulary - A reference to the controlled vocabulary in which the definition of a value in assertionType is given.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionMadeDate" IS 'Assertion Made Date - A date on which an Assertion was created.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionEffectiveDate" IS 'Assertion Effective Date - A date on which a state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionValue" IS 'Assertion Value - An asserted value, if it is not numeric.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionValueIRI" IS 'Assertion Value IRI - An IRI of the controlled vocabulary value for a value of an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionValueVocabulary" IS 'Assertion Value Vocabulary - A reference to a controlled vocabulary in which the definition of a value in assertionValue is given.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionValueNumeric" IS 'Assertion Value Numeric - An asserted value, if it is numeric.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionUnit" IS 'Assertion Unit - Units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionUnitIRI" IS 'Assertion Unit IRI - An IRI of a controlled vocabulary value for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionUnitVocabulary" IS 'Assertion Unit Vocabulary - A reference to a controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionBy" IS 'Assertion By - A list (concatenated and separated) of names of Agents responsible for making an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionByID" IS 'Assertion By ID - An identifier for an Agent responsible for making an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionProtocols" IS 'Assertion Protocols - Names of, references to, or descriptions of Protocols used in making an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionProtocolID" IS 'Assertion Protocol ID - An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionReferences" IS 'Assertion References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionRemarks" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: chronometric-age-media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."chronometric-age-media" (
    "mediaID" text NOT NULL,
    "chronometricAgeID" text NOT NULL,
    "mediaSubjectCategory" text,
    "mediaSubjectCategoryIRI" text,
    "mediaSubjectCategoryVocabulary" text
);


ALTER TABLE public."chronometric-age-media" OWNER TO postgres;

--
-- Name: TABLE "chronometric-age-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age-media" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "chronometric-age-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN "chronometric-age-media"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."chronometricAgeID" IS 'Chronometric Age ID - An identifier for a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."mediaSubjectCategory" IS 'Media Subject Category - A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "chronometric-age-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."mediaSubjectCategoryIRI" IS 'Media Subject Category IRI - An IRI of a controlled vocabulary value for the subject category of a Media instance.';


--
-- Name: COLUMN "chronometric-age-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."mediaSubjectCategoryVocabulary" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: chronometric-age-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."chronometric-age-protocol" (
    "protocolID" text NOT NULL,
    "chronometricAgeID" text NOT NULL
);


ALTER TABLE public."chronometric-age-protocol" OWNER TO postgres;

--
-- Name: TABLE "chronometric-age-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age-protocol" IS 'Chronometric Age ID - An identifier for a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-protocol"."protocolID" IS 'Protocol ID - An identifier for a Protocol.';


--
-- Name: COLUMN "chronometric-age-protocol"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-protocol"."chronometricAgeID" IS 'Chronometric Age ID - An identifier for a chrono:ChronometricAge.';


--
-- Name: chronometric-age-reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."chronometric-age-reference" (
    "referenceID" text NOT NULL,
    "chronometricAgeID" text NOT NULL
);


ALTER TABLE public."chronometric-age-reference" OWNER TO postgres;

--
-- Name: TABLE "chronometric-age-reference"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age-reference" IS 'Chronometric Age ID - An identifier for a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age-reference"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-reference"."referenceID" IS 'Reference ID - An identifier for a Reference.';


--
-- Name: COLUMN "chronometric-age-reference"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-reference"."chronometricAgeID" IS 'Chronometric Age ID - An identifier for a chrono:ChronometricAge.';


--
-- Name: collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection (
    "collectionID" text NOT NULL,
    "collectionType" text,
    "collectionName" text,
    "collectionCode" text,
    "institutionID" text,
    "institutionName" text,
    "institutionCode" text
);


ALTER TABLE public.collection OWNER TO postgres;

--
-- Name: TABLE collection; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.collection IS 'Institution Code - A name (or acronym) in use by an institution.';


--
-- Name: COLUMN collection."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."collectionID" IS 'Collection ID - An identifier for a Collection.';


--
-- Name: COLUMN collection."collectionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."collectionType" IS 'Collection Type - A category that best matches the nature of a Collection.';


--
-- Name: COLUMN collection."collectionName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."collectionName" IS 'Collection Name - A name of a Collection.';


--
-- Name: COLUMN collection."collectionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."collectionCode" IS 'Collection Code - A name, acronym, coden, or initialism identifying a Collection.';


--
-- Name: COLUMN collection."institutionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."institutionID" IS 'Institution ID - An identifier for an institution.';


--
-- Name: COLUMN collection."institutionName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."institutionName" IS 'Institution Name - A name of an institution or organization.';


--
-- Name: COLUMN collection."institutionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."institutionCode" IS 'Institution Code - A name (or acronym) in use by an institution.';


--
-- Name: collection-agent-role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."collection-agent-role" (
    "agentID" text NOT NULL,
    "collectionID" text NOT NULL,
    "agentRole" text,
    "agentRoleIRI" text,
    "agentRoleVocabulary" text,
    "agentRoleOrder" integer,
    "agentRoleDate" text,
    CONSTRAINT "collection-agent-role_agentRoleOrder_check" CHECK (("agentRoleOrder" >= 1))
);


ALTER TABLE public."collection-agent-role" OWNER TO postgres;

--
-- Name: TABLE "collection-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."collection-agent-role" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "collection-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "collection-agent-role"."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."collectionID" IS 'Collection ID - An identifier for a Collection.';


--
-- Name: COLUMN "collection-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRole" IS 'Agent Role - A category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "collection-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRoleIRI" IS 'Agent Role IRI - An IRI of the controlled vocabulary value for a role of an Agent.';


--
-- Name: COLUMN "collection-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRoleVocabulary" IS 'Agent Role Vocabulary - A reference to a controlled vocabulary in which the definition of a value in agentRole is given.';


--
-- Name: COLUMN "collection-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRoleOrder" IS 'Agent Role Order - A numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "collection-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRoleDate" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: collection-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."collection-assertion" (
    "assertionID" text NOT NULL,
    "collectionID" text NOT NULL,
    "assertionType" text,
    "assertionTypeIRI" text,
    "assertionTypeVocabulary" text,
    "assertionMadeDate" text,
    "assertionEffectiveDate" text,
    "assertionValue" text,
    "assertionValueIRI" text,
    "assertionValueVocabulary" text,
    "assertionValueNumeric" numeric,
    "assertionUnit" text,
    "assertionUnitIRI" text,
    "assertionUnitVocabulary" text,
    "assertionBy" text,
    "assertionByID" text,
    "assertionProtocols" text,
    "assertionProtocolID" text,
    "assertionReferences" text,
    "assertionRemarks" text
);


ALTER TABLE public."collection-assertion" OWNER TO postgres;

--
-- Name: TABLE "collection-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."collection-assertion" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionID" IS 'Assertion ID - An identifier for an Assertion.';


--
-- Name: COLUMN "collection-assertion"."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."collectionID" IS 'Collection ID - An identifier for a Collection.';


--
-- Name: COLUMN "collection-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionType" IS 'Assertion Type - A category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionTypeIRI" IS 'Assertion Type IRI - An IRI of a controlled vocabulary value for a type of Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionTypeVocabulary" IS 'Assertion Type Vocabulary - A reference to the controlled vocabulary in which the definition of a value in assertionType is given.';


--
-- Name: COLUMN "collection-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionMadeDate" IS 'Assertion Made Date - A date on which an Assertion was created.';


--
-- Name: COLUMN "collection-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionEffectiveDate" IS 'Assertion Effective Date - A date on which a state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "collection-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionValue" IS 'Assertion Value - An asserted value, if it is not numeric.';


--
-- Name: COLUMN "collection-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionValueIRI" IS 'Assertion Value IRI - An IRI of the controlled vocabulary value for a value of an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionValueVocabulary" IS 'Assertion Value Vocabulary - A reference to a controlled vocabulary in which the definition of a value in assertionValue is given.';


--
-- Name: COLUMN "collection-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionValueNumeric" IS 'Assertion Value Numeric - An asserted value, if it is numeric.';


--
-- Name: COLUMN "collection-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionUnit" IS 'Assertion Unit - Units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "collection-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionUnitIRI" IS 'Assertion Unit IRI - An IRI of a controlled vocabulary value for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "collection-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionUnitVocabulary" IS 'Assertion Unit Vocabulary - A reference to a controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "collection-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionBy" IS 'Assertion By - A list (concatenated and separated) of names of Agents responsible for making an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionByID" IS 'Assertion By ID - An identifier for an Agent responsible for making an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionProtocols" IS 'Assertion Protocols - Names of, references to, or descriptions of Protocols used in making an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionProtocolID" IS 'Assertion Protocol ID - An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionReferences" IS 'Assertion References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionRemarks" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: collection-media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."collection-media" (
    "mediaID" text NOT NULL,
    "collectionID" text NOT NULL,
    "mediaSubjectCategory" text,
    "mediaSubjectCategoryIRI" text,
    "mediaSubjectCategoryVocabulary" text
);


ALTER TABLE public."collection-media" OWNER TO postgres;

--
-- Name: TABLE "collection-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."collection-media" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "collection-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN "collection-media"."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."collectionID" IS 'Collection ID - An identifier for a Collection.';


--
-- Name: COLUMN "collection-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."mediaSubjectCategory" IS 'Media Subject Category - A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "collection-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."mediaSubjectCategoryIRI" IS 'Media Subject Category IRI - An IRI of a controlled vocabulary value for the subject category of a Media instance.';


--
-- Name: COLUMN "collection-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."mediaSubjectCategoryVocabulary" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    "eventID" text NOT NULL,
    "parentEventID" text,
    "preferredEventName" text,
    "eventCategory" text,
    "eventType" text,
    "datasetName" text,
    "datasetID" text,
    "fieldNumber" text,
    "eventConductedBy" text,
    "eventConductedByID" text,
    "eventDate" text,
    "eventTime" text,
    "startDayOfYear" integer,
    "endDayOfYear" integer,
    year integer,
    month integer,
    day integer,
    "verbatimEventDate" text,
    "verbatimLocality" text,
    "verbatimElevation" text,
    "verbatimDepth" text,
    "verbatimCoordinates" text,
    "verbatimLatitude" text,
    "verbatimLongitude" text,
    "verbatimCoordinateSystem" text,
    "verbatimSRS" text,
    "georeferenceVerificationStatus" text,
    habitat text,
    "eventEffort" text,
    "fieldNotes" text,
    "eventReferences" text,
    "eventRemarks" text,
    "locationID" text,
    "higherGeographyID" text,
    "higherGeography" text,
    continent text,
    "waterBody" text,
    "islandGroup" text,
    island text,
    country text,
    "countryCode" text,
    "stateProvince" text,
    county text,
    municipality text,
    locality text,
    "minimumElevationInMeters" numeric,
    "maximumElevationInMeters" numeric,
    "verticalDatum" text,
    "minimumDepthInMeters" numeric,
    "maximumDepthInMeters" numeric,
    "minimumDistanceAboveSurfaceInMeters" numeric,
    "maximumDistanceAboveSurfaceInMeters" numeric,
    "locationRemarks" text,
    "decimalLatitude" numeric,
    "decimalLongitude" numeric,
    "geodeticDatum" text,
    "coordinateUncertaintyInMeters" integer,
    "coordinatePrecision" numeric,
    "pointRadiusSpatialFit" numeric,
    "footprintWKT" text,
    "footprintSRS" text,
    "footprintSpatialFit" numeric,
    "georeferencedBy" text,
    "georeferencedByID" text,
    "georeferencedDate" text,
    "georeferenceProtocol" text,
    "georeferenceProtocolID" text,
    "georeferenceSources" text,
    "georeferenceRemarks" text,
    "informationWithheld" text,
    "dataGeneralizations" text,
    "preferredSpatialRepresentation" text,
    CONSTRAINT "event_coordinateUncertaintyInMeters_check" CHECK (("coordinateUncertaintyInMeters" >= 1)),
    CONSTRAINT "event_coordinateUncertaintyInMeters_check1" CHECK (("coordinateUncertaintyInMeters" <= 20037509)),
    CONSTRAINT event_day_check CHECK ((day <= 31)),
    CONSTRAINT event_day_check1 CHECK ((day >= 1)),
    CONSTRAINT "event_decimalLatitude_check" CHECK (("decimalLatitude" <= (90)::numeric)),
    CONSTRAINT "event_decimalLatitude_check1" CHECK (("decimalLatitude" >= ('-90'::integer)::numeric)),
    CONSTRAINT "event_decimalLongitude_check" CHECK (("decimalLongitude" <= (180)::numeric)),
    CONSTRAINT "event_decimalLongitude_check1" CHECK (("decimalLongitude" >= ('-180'::integer)::numeric)),
    CONSTRAINT "event_endDayOfYear_check" CHECK (("endDayOfYear" >= 1)),
    CONSTRAINT "event_endDayOfYear_check1" CHECK (("endDayOfYear" <= 366)),
    CONSTRAINT "event_maximumDepthInMeters_check" CHECK (("maximumDepthInMeters" <= (11000)::numeric)),
    CONSTRAINT "event_maximumDepthInMeters_check1" CHECK (("maximumDepthInMeters" >= (0)::numeric)),
    CONSTRAINT "event_maximumElevationInMeters_check" CHECK (("maximumElevationInMeters" <= (8850)::numeric)),
    CONSTRAINT "event_maximumElevationInMeters_check1" CHECK (("maximumElevationInMeters" >= ('-430'::integer)::numeric)),
    CONSTRAINT "event_minimumDepthInMeters_check" CHECK (("minimumDepthInMeters" >= (0)::numeric)),
    CONSTRAINT "event_minimumDepthInMeters_check1" CHECK (("minimumDepthInMeters" <= (11000)::numeric)),
    CONSTRAINT "event_minimumElevationInMeters_check" CHECK (("minimumElevationInMeters" >= ('-430'::integer)::numeric)),
    CONSTRAINT "event_minimumElevationInMeters_check1" CHECK (("minimumElevationInMeters" <= (8850)::numeric)),
    CONSTRAINT event_month_check CHECK ((month >= 1)),
    CONSTRAINT event_month_check1 CHECK ((month <= 12)),
    CONSTRAINT "event_pointRadiusSpatialFit_check" CHECK (("pointRadiusSpatialFit" >= (0)::numeric)),
    CONSTRAINT "event_startDayOfYear_check" CHECK (("startDayOfYear" >= 1)),
    CONSTRAINT "event_startDayOfYear_check1" CHECK (("startDayOfYear" <= 366))
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: TABLE event; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.event IS 'Preferred Spatial Representation - An indication of which spatial representation best represents the dcterms:Location.';


--
-- Name: COLUMN event."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN event."parentEventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."parentEventID" IS 'Parent Event ID - An identifier for a broader dwc:Event that groups this and potentially other dwc:Events.';


--
-- Name: COLUMN event."preferredEventName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."preferredEventName" IS 'Preferred Event Name - The name of a dwc:Event preferred in searches and results.';


--
-- Name: COLUMN event."eventCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventCategory" IS 'Event Category - A broad category that best matches the nature of a dwc:Event.';


--
-- Name: COLUMN event."eventType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventType" IS 'Event Type - A narrow category that best matches the nature of a dwc:Event.';


--
-- Name: COLUMN event."datasetName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."datasetName" IS 'Dataset Name - A name of a dataset from which data originated.';


--
-- Name: COLUMN event."datasetID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."datasetID" IS 'Dataset ID - An identifier for a dataset from which data originated.';


--
-- Name: COLUMN event."fieldNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."fieldNumber" IS 'Field Number - An identifier given to a dwc:Event in the field.';


--
-- Name: COLUMN event."eventConductedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventConductedBy" IS 'Event Conducted By - A list (concatenated and separated) of names of Agents responsible for conducting or recording a dwc:Event.';


--
-- Name: COLUMN event."eventConductedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventConductedByID" IS 'Event Conducted By ID - An identifier for the Agent responsible for conducting or recording a dwc:Event.';


--
-- Name: COLUMN event."eventDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventDate" IS 'Event Date - A date or time interval during which a dwc:Event occurred.';


--
-- Name: COLUMN event."eventTime"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventTime" IS 'Event Time - A time interval during which a dwc:Event occurred.';


--
-- Name: COLUMN event."startDayOfYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."startDayOfYear" IS 'Start Day Of Year - The earliest integer day of the year on which a dwc:Event occurred (1 for January 1, 365 for December 31, except in a leap year, in which case it is 366).';


--
-- Name: COLUMN event."endDayOfYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."endDayOfYear" IS 'End Day Of Year - The latest integer day of the year on which a dwc:Event occurred (1 for January 1, 365 for December 31, except in a leap year, in which case it is 366).';


--
-- Name: COLUMN event.year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.year IS 'Year - A four-digit year in which a dwc:Event occurred, according to the Common Era Calendar.';


--
-- Name: COLUMN event.month; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.month IS 'Month - An integer month in which a dwc:Event occurred.';


--
-- Name: COLUMN event.day; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.day IS 'Day - An integer day of the month on which a dwc:Event occurred.';


--
-- Name: COLUMN event."verbatimEventDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimEventDate" IS 'Verbatim Event Date - A verbatim original representation of the date and time information for a dwc:Event.';


--
-- Name: COLUMN event."verbatimLocality"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimLocality" IS 'Verbatim Locality - An original textual description of a dcterms:Location.';


--
-- Name: COLUMN event."verbatimElevation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimElevation" IS 'Verbatim Elevation - An original description of the elevation (altitude, usually above sea level) of a dcterms:Location.';


--
-- Name: COLUMN event."verbatimDepth"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimDepth" IS 'Verbatim Depth - An original description of the depth below a local surface.';


--
-- Name: COLUMN event."verbatimCoordinates"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimCoordinates" IS 'Verbatim Coordinates - Verbatim original spatial coordinates of a dcterms:Location.';


--
-- Name: COLUMN event."verbatimLatitude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimLatitude" IS 'Verbatim Latitude - A verbatim original latitude of a dcterms:Location.';


--
-- Name: COLUMN event."verbatimLongitude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimLongitude" IS 'Verbatim Longitude - A verbatim original longitude of a dcterms:Location.';


--
-- Name: COLUMN event."verbatimCoordinateSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimCoordinateSystem" IS 'Verbatim Coordinate System - A coordinate format for dwc:verbatimLatitude and dwc:verbatimLongitude or dwc:verbatimCoordinates.';


--
-- Name: COLUMN event."verbatimSRS"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimSRS" IS 'Verbatim SRS - An ellipsoid, geodetic datum, or spatial reference system (SRS) upon which coordinates given in dwc:verbatimLatitude and dwc:verbatimLongitude, or dwc:verbatimCoordinates are based.';


--
-- Name: COLUMN event."georeferenceVerificationStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceVerificationStatus" IS 'Georeference Verification Status - A categorical description of the extent to which a georeference has been verified to represent the best possible spatial description for a dcterms:Location.';


--
-- Name: COLUMN event.habitat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.habitat IS 'Habitat - A category or description of the habitat in which a dwc:Event occurred.';


--
-- Name: COLUMN event."eventEffort"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventEffort" IS 'Event Effort - An amount of effort expended during a dwc:Event.';


--
-- Name: COLUMN event."fieldNotes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."fieldNotes" IS 'Field Notes - One of a) an indicator of the existence of, b) a reference to (publication, URI), or c) the text of notes taken in the field about a dwc:Event.';


--
-- Name: COLUMN event."eventReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventReferences" IS 'Event References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a dwc:Event.';


--
-- Name: COLUMN event."eventRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventRemarks" IS 'Event Remarks - Comments or notes about a dwc:Event.';


--
-- Name: COLUMN event."locationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."locationID" IS 'Location ID - An identifier a dcterms:Location.';


--
-- Name: COLUMN event."higherGeographyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."higherGeographyID" IS 'Higher Geography ID - An identifier for a geographic region within which a dcterms:Location occurs.';


--
-- Name: COLUMN event."higherGeography"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."higherGeography" IS 'Higher Geography - A list (concatenated and separated) of geographic names less specific than the information captured in dwc:locality.';


--
-- Name: COLUMN event.continent; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.continent IS 'Continent - A name of a continent in which a dcterms:Location occurs.';


--
-- Name: COLUMN event."waterBody"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."waterBody" IS 'Water Body - A name of a water body in which a dcterms:Location occurs.';


--
-- Name: COLUMN event."islandGroup"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."islandGroup" IS 'Island Group - A name of an island group in which a dcterms:Location occurs.';


--
-- Name: COLUMN event.island; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.island IS 'Island - A name of an island on or near which a dcterms:Location occurs.';


--
-- Name: COLUMN event.country; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.country IS 'Country - A name of a country or major administrative unit in which a dcterms:Location occurs.';


--
-- Name: COLUMN event."countryCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."countryCode" IS 'Country Code - A standard code for a country in which a dcterms:Location occurs.';


--
-- Name: COLUMN event."stateProvince"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."stateProvince" IS 'State Province - A name of a next smaller administrative region than country (state, province, canton, department, region, etc.) in which a dcterms:Location occurs.';


--
-- Name: COLUMN event.county; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.county IS 'County - A full, unabbreviated name of a next smaller administrative region than dwc:stateProvince (county, shire, department, etc.) in which a dcterms:Location occurs.';


--
-- Name: COLUMN event.municipality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.municipality IS 'Municipality - A full, unabbreviated name of a next smaller administrative region than county (city, municipality, etc.) in which a dcterms:Location occurs. Do not use this term for a nearby named place that does not contain the actual location.';


--
-- Name: COLUMN event.locality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.locality IS 'Locality - A specific description of the location of a place.';


--
-- Name: COLUMN event."minimumElevationInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."minimumElevationInMeters" IS 'Minimum Elevation In Meters - A lower limit of a range of elevation (altitude, usually above sea level), in meters.';


--
-- Name: COLUMN event."maximumElevationInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."maximumElevationInMeters" IS 'Maximum Elevation In Meters - An upper limit of a range of elevation (altitude, usually above sea level), in meters.';


--
-- Name: COLUMN event."verticalDatum"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verticalDatum" IS 'Vertical Datum - A vertical datum used as a reference upon which the values in the elevation terms are based.';


--
-- Name: COLUMN event."minimumDepthInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."minimumDepthInMeters" IS 'Minimum Depth In Meters - A lesser depth of a range of depth below the local surface, in meters.';


--
-- Name: COLUMN event."maximumDepthInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."maximumDepthInMeters" IS 'Maximum Depth In Meters - A greater depth of a range of depth below the local surface, in meters.';


--
-- Name: COLUMN event."minimumDistanceAboveSurfaceInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."minimumDistanceAboveSurfaceInMeters" IS 'Minimum Distance Above Surface In Meters - A lesser distance in a range of distance from a reference surface in the vertical direction, in meters. Use positive values for locations above the surface, negative values for locations below. If depth measures are given, the reference surface is the location given by the depth, otherwise the reference surface is the location given by the elevation.';


--
-- Name: COLUMN event."maximumDistanceAboveSurfaceInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."maximumDistanceAboveSurfaceInMeters" IS 'Maximum Distance Above Surface In Meters - A greater distance in a range of distance from a reference surface in the vertical direction, in meters. Use positive values for locations above the surface, negative values for locations below. If depth measures are given, the reference surface is the location given by the depth, otherwise the reference surface is the location given by the elevation.';


--
-- Name: COLUMN event."locationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."locationRemarks" IS 'Location Remarks - Comments or notes about a dcterms:Location.';


--
-- Name: COLUMN event."decimalLatitude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."decimalLatitude" IS 'Decimal Latitude - A geographic latitude (in decimal degrees, using the spatial reference system given in dwc:geodeticDatum) of the geographic center of a dcterms:Location.';


--
-- Name: COLUMN event."decimalLongitude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."decimalLongitude" IS 'Decimal Longitude - A geographic longitude (in decimal degrees, using the spatial reference system given in dwc:geodeticDatum) of the geographic center of a dcterms:Location.';


--
-- Name: COLUMN event."geodeticDatum"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."geodeticDatum" IS 'Geodetic Datum - An ellipsoid, geodetic datum, or spatial reference system (SRS) upon which the geographic coordinates given in dwc:decimalLatitude and dwc:decimalLongitude as based.';


--
-- Name: COLUMN event."coordinateUncertaintyInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."coordinateUncertaintyInMeters" IS 'Coordinate Uncertainty In Meters - A horizontal distance (in meters) from a given dwc:decimalLatitude and dwc:decimalLongitude describing the smallest circle containing the whole of the dcterms:Location.';


--
-- Name: COLUMN event."coordinatePrecision"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."coordinatePrecision" IS 'Coordinate Precision - A decimal representation of the precision of the coordinates given in a dwc:decimalLatitude and dwc:decimalLongitude.';


--
-- Name: COLUMN event."pointRadiusSpatialFit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."pointRadiusSpatialFit" IS 'Point Radius Spatial Fit - A ratio of the area of a point-radius (dwc:decimalLatitude, dwc:decimalLongitude, dwc:coordinateUncertaintyInMeters) to the area of a true (original, or most specific) spatial representation of a dcterms:Location.';


--
-- Name: COLUMN event."footprintWKT"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."footprintWKT" IS 'Footprint WKT - A Well-Known Text (WKT) representation of the shape (footprint, geometry) that defines a dcterms:Location.';


--
-- Name: COLUMN event."footprintSRS"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."footprintSRS" IS 'Footprint SRS - An ellipsoid, geodetic datum, or spatial reference system (SRS) upon which a geometry given in dwc:footprintWKT is based.';


--
-- Name: COLUMN event."footprintSpatialFit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."footprintSpatialFit" IS 'Footprint Spatial Fit - A ratio of the area of a footprint (dwc:footprintWKT) to the area of a true (original, or most specific) spatial representation of a dcterms:Location.';


--
-- Name: COLUMN event."georeferencedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferencedBy" IS 'Georeferenced By - A list (concatenated and separated) of names of Agents responsible for determining a georeference (spatial representation) for a dcterms:Location.';


--
-- Name: COLUMN event."georeferencedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferencedByID" IS 'Georeferenced By ID - An identifier for the Agent responsible for determining a georeference for a dwc:Event.';


--
-- Name: COLUMN event."georeferencedDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferencedDate" IS 'Georeferenced Date - A date on which a dcterms:Location was georeferenced.';


--
-- Name: COLUMN event."georeferenceProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceProtocol" IS 'Georeference Protocol - A description or reference to a Protocol used to determine the spatial footprint, coordinates, and uncertainties.';


--
-- Name: COLUMN event."georeferenceProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceProtocolID" IS 'Georeference Protocol ID - An identifier for a Protocol used to georeference a dwc:Event.';


--
-- Name: COLUMN event."georeferenceSources"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceSources" IS 'Georeference Sources - A list (concatenated and separated) of maps, gazetteers, or other resources used to georeference a dcterms:Location, described specifically enough to allow anyone in the future to use the same resources.';


--
-- Name: COLUMN event."georeferenceRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceRemarks" IS 'Georeference Remarks - Comments or notes about a spatial description determination, explaining assumptions made in addition or opposition to the those formalized in the method referred to in dwc:georeferenceProtocol.';


--
-- Name: COLUMN event."informationWithheld"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."informationWithheld" IS 'Information Withheld - Additional information that exists, but that has not been shared in the given record.';


--
-- Name: COLUMN event."dataGeneralizations"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."dataGeneralizations" IS 'Data Generalizations - Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- Name: COLUMN event."preferredSpatialRepresentation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."preferredSpatialRepresentation" IS 'Preferred Spatial Representation - An indication of which spatial representation best represents the dcterms:Location.';


--
-- Name: event-agent-role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."event-agent-role" (
    "agentID" text NOT NULL,
    "eventID" text NOT NULL,
    "agentRole" text,
    "agentRoleIRI" text,
    "agentRoleVocabulary" text,
    "agentRoleOrder" integer,
    "agentRoleDate" text,
    CONSTRAINT "event-agent-role_agentRoleOrder_check" CHECK (("agentRoleOrder" >= 1))
);


ALTER TABLE public."event-agent-role" OWNER TO postgres;

--
-- Name: TABLE "event-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-agent-role" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "event-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "event-agent-role"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN "event-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRole" IS 'Agent Role - A category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "event-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRoleIRI" IS 'Agent Role IRI - An IRI of the controlled vocabulary value for a role of an Agent.';


--
-- Name: COLUMN "event-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRoleVocabulary" IS 'Agent Role Vocabulary - A reference to a controlled vocabulary in which the definition of a value in agentRole is given.';


--
-- Name: COLUMN "event-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRoleOrder" IS 'Agent Role Order - A numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "event-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRoleDate" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: event-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."event-assertion" (
    "assertionID" text NOT NULL,
    "eventID" text NOT NULL,
    "assertionType" text,
    "assertionTypeIRI" text,
    "assertionTypeVocabulary" text,
    "assertionMadeDate" text,
    "assertionEffectiveDate" text,
    "assertionValue" text,
    "assertionValueIRI" text,
    "assertionValueVocabulary" text,
    "assertionValueNumeric" numeric,
    "assertionUnit" text,
    "assertionUnitIRI" text,
    "assertionUnitVocabulary" text,
    "assertionBy" text,
    "assertionByID" text,
    "assertionProtocols" text,
    "assertionProtocolID" text,
    "assertionReferences" text,
    "assertionRemarks" text
);


ALTER TABLE public."event-assertion" OWNER TO postgres;

--
-- Name: TABLE "event-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-assertion" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionID" IS 'Assertion ID - An identifier for an Assertion.';


--
-- Name: COLUMN "event-assertion"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN "event-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionType" IS 'Assertion Type - A category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionTypeIRI" IS 'Assertion Type IRI - An IRI of a controlled vocabulary value for a type of Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionTypeVocabulary" IS 'Assertion Type Vocabulary - A reference to the controlled vocabulary in which the definition of a value in assertionType is given.';


--
-- Name: COLUMN "event-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionMadeDate" IS 'Assertion Made Date - A date on which an Assertion was created.';


--
-- Name: COLUMN "event-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionEffectiveDate" IS 'Assertion Effective Date - A date on which a state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "event-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionValue" IS 'Assertion Value - An asserted value, if it is not numeric.';


--
-- Name: COLUMN "event-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionValueIRI" IS 'Assertion Value IRI - An IRI of the controlled vocabulary value for a value of an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionValueVocabulary" IS 'Assertion Value Vocabulary - A reference to a controlled vocabulary in which the definition of a value in assertionValue is given.';


--
-- Name: COLUMN "event-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionValueNumeric" IS 'Assertion Value Numeric - An asserted value, if it is numeric.';


--
-- Name: COLUMN "event-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionUnit" IS 'Assertion Unit - Units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "event-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionUnitIRI" IS 'Assertion Unit IRI - An IRI of a controlled vocabulary value for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "event-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionUnitVocabulary" IS 'Assertion Unit Vocabulary - A reference to a controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "event-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionBy" IS 'Assertion By - A list (concatenated and separated) of names of Agents responsible for making an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionByID" IS 'Assertion By ID - An identifier for an Agent responsible for making an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionProtocols" IS 'Assertion Protocols - Names of, references to, or descriptions of Protocols used in making an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionProtocolID" IS 'Assertion Protocol ID - An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionReferences" IS 'Assertion References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionRemarks" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: event-identifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."event-identifier" (
    identifier text NOT NULL,
    "eventID" text NOT NULL,
    "identifierType" text,
    "identifierTypeIRI" text,
    "identifierTypeVocabulary" text,
    "identifierLanguage" text
);


ALTER TABLE public."event-identifier" OWNER TO postgres;

--
-- Name: TABLE "event-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-identifier" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: COLUMN "event-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier".identifier IS 'Identifier - An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "event-identifier"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN "event-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."identifierType" IS 'Identifier Type - A category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "event-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."identifierTypeIRI" IS 'Identifier Type IRI - An IRI of the controlled vocabulary value for a type of Identifier.';


--
-- Name: COLUMN "event-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."identifierTypeVocabulary" IS 'Identifier Type Vocabulary - A reference to a controlled vocabulary in which the definition of a value in identifierType is given.';


--
-- Name: COLUMN "event-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."identifierLanguage" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: event-media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."event-media" (
    "mediaID" text NOT NULL,
    "eventID" text NOT NULL,
    "mediaSubjectCategory" text,
    "mediaSubjectCategoryIRI" text,
    "mediaSubjectCategoryVocabulary" text
);


ALTER TABLE public."event-media" OWNER TO postgres;

--
-- Name: TABLE "event-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-media" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "event-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN "event-media"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN "event-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."mediaSubjectCategory" IS 'Media Subject Category - A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "event-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."mediaSubjectCategoryIRI" IS 'Media Subject Category IRI - An IRI of a controlled vocabulary value for the subject category of a Media instance.';


--
-- Name: COLUMN "event-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."mediaSubjectCategoryVocabulary" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: event-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."event-protocol" (
    "protocolID" text NOT NULL,
    "eventID" text NOT NULL
);


ALTER TABLE public."event-protocol" OWNER TO postgres;

--
-- Name: TABLE "event-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-protocol" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN "event-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-protocol"."protocolID" IS 'Protocol ID - An identifier for a Protocol.';


--
-- Name: COLUMN "event-protocol"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-protocol"."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: event-reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."event-reference" (
    "referenceID" text NOT NULL,
    "eventID" text NOT NULL
);


ALTER TABLE public."event-reference" OWNER TO postgres;

--
-- Name: TABLE "event-reference"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-reference" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN "event-reference"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-reference"."referenceID" IS 'Reference ID - An identifier for a Reference.';


--
-- Name: COLUMN "event-reference"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-reference"."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: geological-context; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."geological-context" (
    "geologicalContextID" text NOT NULL,
    "eventID" text,
    "earliestEonOrLowestEonothem" text,
    "latestEonOrHighestEonothem" text,
    "earliestEraOrLowestErathem" text,
    "latestEraOrHighestErathem" text,
    "earliestPeriodOrLowestSystem" text,
    "latestPeriodOrHighestSystem" text,
    "earliestEpochOrLowestSeries" text,
    "latestEpochOrHighestSeries" text,
    "earliestAgeOrLowestStage" text,
    "latestAgeOrHighestStage" text,
    "lowestBiostratigraphicZone" text,
    "highestBiostratigraphicZone" text,
    "lithostratigraphicTerms" text,
    "group" text,
    formation text,
    member text,
    bed text
);


ALTER TABLE public."geological-context" OWNER TO postgres;

--
-- Name: TABLE "geological-context"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."geological-context" IS 'Bed - A full name of a lithostratigraphic bed from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."geologicalContextID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."geologicalContextID" IS 'Geological Context ID - An identifier for a dwc:GeologicalContext.';


--
-- Name: COLUMN "geological-context"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN "geological-context"."earliestEonOrLowestEonothem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestEonOrLowestEonothem" IS 'Earliest Eon Or Lowest Eonothem - A full name of a earliest possible geochronologic eon or lowest chrono-stratigraphic eonothem or the informal name (''Precambrian'') attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."latestEonOrHighestEonothem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestEonOrHighestEonothem" IS 'Latest Eon Or Highest Eonothem - A full name of a latest possible geochronologic eon or highest chrono-stratigraphic eonothem or the informal name (''Precambrian'') attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."earliestEraOrLowestErathem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestEraOrLowestErathem" IS 'Earliest Era Or Lowest Erathem - A full name of a earliest possible geochronologic era or lowest chronostratigraphic erathem attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."latestEraOrHighestErathem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestEraOrHighestErathem" IS 'Latest Era Or Highest Erathem - A full name of a latest possible geochronologic era or highest chronostratigraphic erathem attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."earliestPeriodOrLowestSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestPeriodOrLowestSystem" IS 'Earliest Period Or Lowest System - A full name of a earliest possible geochronologic period or lowest chronostratigraphic system attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."latestPeriodOrHighestSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestPeriodOrHighestSystem" IS 'Latest Period Or Highest System - A full name of a latest possible geochronologic period or highest chronostratigraphic system attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."earliestEpochOrLowestSeries"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestEpochOrLowestSeries" IS 'Earliest Epoch Or Lowest Series - A full name of a earliest possible geochronologic epoch or lowest chronostratigraphic series attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."latestEpochOrHighestSeries"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestEpochOrHighestSeries" IS 'Latest Epoch Or Highest Series - A full name of a latest possible geochronologic epoch or highest chronostratigraphic series attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."earliestAgeOrLowestStage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestAgeOrLowestStage" IS 'Earliest Age Or Lowest Stage - A full name of a earliest possible geochronologic age or lowest chronostratigraphic stage attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."latestAgeOrHighestStage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestAgeOrHighestStage" IS 'Latest Age Or Highest Stage - A full name of a latest possible geochronologic age or highest chronostratigraphic stage attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."lowestBiostratigraphicZone"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."lowestBiostratigraphicZone" IS 'Lowest Biostratigraphic Zone - A full name of a lowest possible geological biostratigraphic zone of the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."highestBiostratigraphicZone"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."highestBiostratigraphicZone" IS 'Highest Biostratigraphic Zone - A full name of a highest possible geological biostratigraphic zone of the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."lithostratigraphicTerms"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."lithostratigraphicTerms" IS 'Lithostratigraphic Terms - A combination of all litho-stratigraphic names for a rock from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."group"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."group" IS 'Group - A full name of a lithostratigraphic group from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context".formation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context".formation IS 'Formation - A full name of a lithostratigraphic formation from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context".member; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context".member IS 'Member - A full name of a lithostratigraphic member from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context".bed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context".bed IS 'Bed - A full name of a lithostratigraphic bed from which a dwc:MaterialEntity was collected.';


--
-- Name: geological-context-media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."geological-context-media" (
    "mediaID" text NOT NULL,
    "geologicalContextID" text NOT NULL,
    "mediaSubjectCategory" text,
    "mediaSubjectCategoryIRI" text,
    "mediaSubjectCategoryVocabulary" text
);


ALTER TABLE public."geological-context-media" OWNER TO postgres;

--
-- Name: TABLE "geological-context-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."geological-context-media" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "geological-context-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN "geological-context-media"."geologicalContextID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."geologicalContextID" IS 'Geological Context ID - An identifier for a dwc:GeologicalContext.';


--
-- Name: COLUMN "geological-context-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."mediaSubjectCategory" IS 'Media Subject Category - A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "geological-context-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."mediaSubjectCategoryIRI" IS 'Media Subject Category IRI - An IRI of a controlled vocabulary value for the subject category of a Media instance.';


--
-- Name: COLUMN "geological-context-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."mediaSubjectCategoryVocabulary" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: identification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identification (
    "identificationID" text NOT NULL,
    "basedOnOccurrenceID" text,
    "basedOnMaterialEntityID" text,
    "basedOnNucleotideSequenceID" text,
    "basedOnNucleotideAnalysisID" text,
    "basedOnMediaID" text,
    "identificationType" text,
    "verbatimIdentification" text,
    "isAcceptedIdentification" boolean,
    "taxonFormula" text,
    "typeStatus" text,
    "typeDesignationType" text,
    "typifiedName" text,
    "identifiedBy" text,
    "identifiedByID" text,
    "dateIdentified" text,
    "identificationReferences" text,
    "taxonAssignmentMethod" text,
    "identificationVerificationStatus" text,
    "identificationRemarks" text,
    "taxonID" text,
    "higherClassificationName" text,
    "higherClassificationRank" text,
    "scientificName" text,
    "taxonRank" text,
    "taxonRemarks" text
);


ALTER TABLE public.identification OWNER TO postgres;

--
-- Name: TABLE identification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.identification IS 'Taxon Remarks - Comments or notes about a dwc:Taxon.';


--
-- Name: COLUMN identification."identificationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationID" IS 'Identification ID - An identifier for a dwc:Identification.';


--
-- Name: COLUMN identification."basedOnOccurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."basedOnOccurrenceID" IS 'Based On Occurrence ID - An identifier for a dwc:Occurrence based on which a dwc:Identification was made.';


--
-- Name: COLUMN identification."basedOnMaterialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."basedOnMaterialEntityID" IS 'Based On Material Entity ID - An identifier for a dwc:MaterialEntity based on which a dwc:Identification was made.';


--
-- Name: COLUMN identification."basedOnNucleotideSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."basedOnNucleotideSequenceID" IS 'Based On Nucleotide Sequence ID - An identifier for a NucleotideSequence based on which a dwc:Identification was made.';


--
-- Name: COLUMN identification."basedOnNucleotideAnalysisID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."basedOnNucleotideAnalysisID" IS 'Based On Nucleotide Analysis ID - An identifier for a NucleotideAnalysis based on which a dwc:Identification was made.';


--
-- Name: COLUMN identification."basedOnMediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."basedOnMediaID" IS 'Based On Media ID - An identifier for a Media instance based on which a dwc:Identification was made.';


--
-- Name: COLUMN identification."identificationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationType" IS 'Identification Type - A category that best matches the nature of a dwc:Identification.';


--
-- Name: COLUMN identification."verbatimIdentification"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."verbatimIdentification" IS 'Verbatim Identification - A string representing a taxonomic identification as it appeared in the original record.';


--
-- Name: COLUMN identification."isAcceptedIdentification"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."isAcceptedIdentification" IS 'Is Accepted Identification - A dwc:Identification of a dwc:Organism is a currently an accepted one.';


--
-- Name: COLUMN identification."taxonFormula"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonFormula" IS 'Taxon Formula - A string representing the pattern to use to construct a dwc:Identification from dwc:Taxon names and identification qualifiers.';


--
-- Name: COLUMN identification."typeStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."typeStatus" IS 'Type Status - A list (concatenated and separated) of nomenclatural types (type status, typified scientific name, publication) applied to the subject.';


--
-- Name: COLUMN identification."typeDesignationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."typeDesignationType" IS 'typeDesignationType - A category that best matches the nature of a type designation.';


--
-- Name: COLUMN identification."typifiedName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."typifiedName" IS 'Typified Name - A scientific name for which a specimen or other name is the type.';


--
-- Name: COLUMN identification."identifiedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identifiedBy" IS 'Identified By - A list (concatenated and separated) of names of Agents responsible for making a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN identification."identifiedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identifiedByID" IS 'Identified By ID - An identifier for the Agent responsible for making a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN identification."dateIdentified"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."dateIdentified" IS 'Date Identified - A date on which the subject was determined as representing a dwc:Taxon.';


--
-- Name: COLUMN identification."identificationReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationReferences" IS 'Identification References - A list (concatenated and separated) of identifiers for References (publication, bibliographic reference, global unique identifier, URI, metabarcoding reference database) used in a dwc:Identification.';


--
-- Name: COLUMN identification."taxonAssignmentMethod"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonAssignmentMethod" IS 'Taxon Assignment Method - Tool and thresholds used to compare sequences when computing ''species-level'' OTUs.';


--
-- Name: COLUMN identification."identificationVerificationStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationVerificationStatus" IS 'Identification Verification Status - A categorical indicator of the extent to which a taxonomic determination has been verified to be correct.';


--
-- Name: COLUMN identification."identificationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationRemarks" IS 'Identification Remarks - Comments or notes about a dwc:Identification.';


--
-- Name: COLUMN identification."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonID" IS 'Taxon ID - An identifier for a dwc:Taxon.';


--
-- Name: COLUMN identification."higherClassificationName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."higherClassificationName" IS 'Higher Classification Name - A full scientific name at a higher rank than the taxonRank of dwc:scientificName.';


--
-- Name: COLUMN identification."higherClassificationRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."higherClassificationRank" IS 'Higher Classification Rank - A taxonomic rank of the higherClassificationName.';


--
-- Name: COLUMN identification."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."scientificName" IS 'Scientific Name - A full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- Name: COLUMN identification."taxonRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonRank" IS 'Taxon Rank - A taxonomic rank of the most specific name in a dwc:scientificName.';


--
-- Name: COLUMN identification."taxonRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonRemarks" IS 'Taxon Remarks - Comments or notes about a dwc:Taxon.';


--
-- Name: identification-agent-role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."identification-agent-role" (
    "agentID" text NOT NULL,
    "identificationID" text NOT NULL,
    "agentRole" text,
    "agentRoleIRI" text,
    "agentRoleVocabulary" text,
    "agentRoleOrder" integer,
    "agentRoleDate" text,
    CONSTRAINT "identification-agent-role_agentRoleOrder_check" CHECK (("agentRoleOrder" >= 1))
);


ALTER TABLE public."identification-agent-role" OWNER TO postgres;

--
-- Name: TABLE "identification-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."identification-agent-role" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "identification-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "identification-agent-role"."identificationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."identificationID" IS 'Identification ID - An identifier for a dwc:Identification.';


--
-- Name: COLUMN "identification-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRole" IS 'Agent Role - A category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "identification-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRoleIRI" IS 'Agent Role IRI - An IRI of the controlled vocabulary value for a role of an Agent.';


--
-- Name: COLUMN "identification-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRoleVocabulary" IS 'Agent Role Vocabulary - A reference to a controlled vocabulary in which the definition of a value in agentRole is given.';


--
-- Name: COLUMN "identification-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRoleOrder" IS 'Agent Role Order - A numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "identification-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRoleDate" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: identification-taxon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."identification-taxon" (
    "identificationID" text NOT NULL,
    "taxonID" text,
    "taxonOrder" integer,
    "higherClassificationName" text,
    "higherClassificationRank" text,
    "scientificName" text,
    "taxonRank" text,
    "taxonRemarks" text,
    CONSTRAINT "identification-taxon_taxonOrder_check" CHECK (("taxonOrder" >= 1))
);


ALTER TABLE public."identification-taxon" OWNER TO postgres;

--
-- Name: TABLE "identification-taxon"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."identification-taxon" IS 'Taxon Remarks - Comments or notes about a dwc:Taxon.';


--
-- Name: COLUMN "identification-taxon"."identificationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."identificationID" IS 'Identification ID - An identifier for a dwc:Identification.';


--
-- Name: COLUMN "identification-taxon"."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."taxonID" IS 'Taxon ID - An identifier for a dwc:Taxon.';


--
-- Name: COLUMN "identification-taxon"."taxonOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."taxonOrder" IS 'Taxon Order - A numerical position of a dwc:Taxon in a taxonFormula.';


--
-- Name: COLUMN "identification-taxon"."higherClassificationName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."higherClassificationName" IS 'Higher Classification Name - A full scientific name at a higher rank than the taxonRank of dwc:scientificName.';


--
-- Name: COLUMN "identification-taxon"."higherClassificationRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."higherClassificationRank" IS 'Higher Classification Rank - A taxonomic rank of the higherClassificationName.';


--
-- Name: COLUMN "identification-taxon"."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."scientificName" IS 'Scientific Name - A full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- Name: COLUMN "identification-taxon"."taxonRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."taxonRank" IS 'Taxon Rank - A taxonomic rank of the most specific name in a dwc:scientificName.';


--
-- Name: COLUMN "identification-taxon"."taxonRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."taxonRemarks" IS 'Taxon Remarks - Comments or notes about a dwc:Taxon.';


--
-- Name: material; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.material (
    "materialEntityID" text NOT NULL,
    "eventID" text NOT NULL,
    "materialCategory" text,
    "materialEntityType" text,
    "institutionCode" text,
    "institutionID" text,
    "ownerInstitutionCode" text,
    "ownerInstitutionID" text,
    "collectionCode" text,
    "collectionID" text,
    "catalogNumber" text,
    "otherCatalogNumbers" text,
    "collectedBy" text,
    "collectedByID" text,
    "objectQuantity" text,
    "objectQuantityType" text,
    "recordNumber" text,
    preparations text,
    disposition text,
    "verbatimLabel" text,
    "associatedSequences" text,
    "materialReferences" text,
    "informationWithheld" text,
    "dataGeneralizations" text,
    "materialEntityRemarks" text,
    "evidenceForOccurrenceID" text,
    "derivedFromMaterialEntityID" text,
    "derivationEventID" text,
    "derivationType" text,
    "isPartOfMaterialEntityID" text,
    "verbatimIdentification" text,
    "taxonFormula" text,
    "typeStatus" text,
    "typeDesignationType" text,
    "typifiedName" text,
    "identifiedBy" text,
    "identifiedByID" text,
    "dateIdentified" text,
    "identificationReferences" text,
    "identificationVerificationStatus" text,
    "identificationRemarks" text,
    "taxonID" text,
    "higherClassificationName" text,
    "higherClassificationRank" text,
    "scientificName" text,
    "taxonRank" text,
    "taxonRemarks" text
);


ALTER TABLE public.material OWNER TO postgres;

--
-- Name: TABLE material; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.material IS 'Taxon Remarks - Comments or notes about a dwc:Taxon.';


--
-- Name: COLUMN material."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialEntityID" IS 'Material Entity ID - An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN material."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN material."materialCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialCategory" IS 'Material Category - A broad category that best matches the nature of a dwc:MaterialEntity.';


--
-- Name: COLUMN material."materialEntityType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialEntityType" IS 'Material Entity Type - A narrow category that best matches the nature of a dwc:MaterialEntity.';


--
-- Name: COLUMN material."institutionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."institutionCode" IS 'Institution Code - A name (or acronym) in use by an institution.';


--
-- Name: COLUMN material."institutionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."institutionID" IS 'Institution ID - An identifier for an institution.';


--
-- Name: COLUMN material."ownerInstitutionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."ownerInstitutionCode" IS 'Owner Institution Code - A name (or acronym) in use by an institution having ownership of a dwc:MaterialEntity.';


--
-- Name: COLUMN material."ownerInstitutionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."ownerInstitutionID" IS 'Owner Institution ID - An identifier for an institution that owns a dwc:MaterialEntity.';


--
-- Name: COLUMN material."collectionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."collectionCode" IS 'Collection Code - A name, acronym, coden, or initialism identifying a Collection.';


--
-- Name: COLUMN material."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."collectionID" IS 'Collection ID - An identifier for a Collection.';


--
-- Name: COLUMN material."catalogNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."catalogNumber" IS 'Catalog Number - An identifier (preferably unique) for a dwc:MaterialEntity within a Collection.';


--
-- Name: COLUMN material."otherCatalogNumbers"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."otherCatalogNumbers" IS 'Other Catalog Numbers - A list (concatenated and separated) of previous or alternate fully qualified catalog numbers or other human-used identifiers for the same dwc:MaterialEntity, whether in the current or any other data set or collection.';


--
-- Name: COLUMN material."collectedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."collectedBy" IS 'Collected By - A list (concatenated and separated) of names of Agents responsible for collecting a dwc:MaterialEntity.';


--
-- Name: COLUMN material."collectedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."collectedByID" IS 'Collected By ID - An identifier for the Agent responsible for collecting a dwc:MaterialEntity.';


--
-- Name: COLUMN material."objectQuantity"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."objectQuantity" IS 'Object Quantity - A number or enumeration value for the quantity of differentiable dwc:MaterialEntities comprising this dwc:MaterialEntity.';


--
-- Name: COLUMN material."objectQuantityType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."objectQuantityType" IS 'Object Quantity Type - A number or enumeration value for the quantity of differentiable dwc:MaterialEntities comprising this dwc:MaterialEntity.';


--
-- Name: COLUMN material."recordNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."recordNumber" IS 'Record Number - An identifier given to a dwc:MaterialEntity at the time it was recorded.';


--
-- Name: COLUMN material.preparations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material.preparations IS 'Preparations - A list (concatenated and separated) of preparations and preservation methods for a dwc:MaterialEntity.';


--
-- Name: COLUMN material.disposition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material.disposition IS 'Disposition - A current state of a dwc:MaterialEntity with respect to where it can be found.';


--
-- Name: COLUMN material."verbatimLabel"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."verbatimLabel" IS 'Verbatim Label - The content of this term should include no embellishments, prefixes, headers or other additions made to the text. Abbreviations must not be expanded and supposed misspellings must not be corrected. Lines or breakpoints between blocks of text that could be verified by seeing the original labels or images of them may be used. Examples of material entities include preserved specimens, fossil specimens, and material samples. Best practice is to use UTF-8 for all characters. Best practice is to add comment “verbatimLabel derived from human transcription” in dwc:occurrenceRemarks.';


--
-- Name: COLUMN material."associatedSequences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."associatedSequences" IS 'Associated Sequences - A list (concatenated and separated) of identifiers (publication, global unique identifier, URI) of genetic sequence information associated with a dwc:MaterialEntity.';


--
-- Name: COLUMN material."materialReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialReferences" IS 'Material References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a dwc:MaterialEntity.';


--
-- Name: COLUMN material."informationWithheld"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."informationWithheld" IS 'Information Withheld - Additional information that exists, but that has not been shared in the given record.';


--
-- Name: COLUMN material."dataGeneralizations"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."dataGeneralizations" IS 'Data Generalizations - Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- Name: COLUMN material."materialEntityRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialEntityRemarks" IS 'Material Entity Remarks - Comments or notes about a dwc:MaterialEntity.';


--
-- Name: COLUMN material."evidenceForOccurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."evidenceForOccurrenceID" IS 'Evidence For Occurrence ID - An identifier for a dwc:Occurrence for which a dwc:MaterialEntity provides evidence.';


--
-- Name: COLUMN material."derivedFromMaterialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."derivedFromMaterialEntityID" IS 'Derived From Material Entity ID - An identifier for a dwc:MaterialEntity from which this dwc:MaterialEntity was derived.';


--
-- Name: COLUMN material."derivationEventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."derivationEventID" IS 'Derivation Event ID - An identifier for a dwc:Event during which a dwc:MaterialEntity was derived from another dwc:MaterialEntity.';


--
-- Name: COLUMN material."derivationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."derivationType" IS 'Derivation Type - A category that best matches the nature of the derivation of a dwc:MaterialEntity from a dwc:MaterialEntity pointed to by derivedFromMaterialEntityID.';


--
-- Name: COLUMN material."isPartOfMaterialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."isPartOfMaterialEntityID" IS 'Is Part Of Material Entity ID - An identifier for a dwc:MaterialEntity of which this dwc:MaterialEntity is a part.';


--
-- Name: COLUMN material."verbatimIdentification"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."verbatimIdentification" IS 'Verbatim Identification - A string representing a taxonomic identification as it appeared in the original record.';


--
-- Name: COLUMN material."taxonFormula"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."taxonFormula" IS 'Taxon Formula - A string representing the pattern to use to construct a dwc:Identification from dwc:Taxon names and identification qualifiers.';


--
-- Name: COLUMN material."typeStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."typeStatus" IS 'Type Status - A list (concatenated and separated) of nomenclatural types (type status, typified scientific name, publication) applied to the subject.';


--
-- Name: COLUMN material."typeDesignationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."typeDesignationType" IS 'typeDesignationType - A category that best matches the nature of a type designation.';


--
-- Name: COLUMN material."typifiedName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."typifiedName" IS 'Typified Name - A scientific name for which a specimen or other name is the type.';


--
-- Name: COLUMN material."identifiedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identifiedBy" IS 'Identified By - A list (concatenated and separated) of names of Agents responsible for making a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN material."identifiedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identifiedByID" IS 'Identified By ID - An identifier for the Agent responsible for making a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN material."dateIdentified"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."dateIdentified" IS 'Date Identified - A date on which the subject was determined as representing a dwc:Taxon.';


--
-- Name: COLUMN material."identificationReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identificationReferences" IS 'Identification References - A list (concatenated and separated) of identifiers for References (publication, bibliographic reference, global unique identifier, URI, metabarcoding reference database) used in a dwc:Identification.';


--
-- Name: COLUMN material."identificationVerificationStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identificationVerificationStatus" IS 'Identification Verification Status - A categorical indicator of the extent to which a taxonomic determination has been verified to be correct.';


--
-- Name: COLUMN material."identificationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identificationRemarks" IS 'Identification Remarks - Comments or notes about a dwc:Identification.';


--
-- Name: COLUMN material."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."taxonID" IS 'Taxon ID - An identifier for a dwc:Taxon.';


--
-- Name: COLUMN material."higherClassificationName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."higherClassificationName" IS 'Higher Classification Name - A full scientific name at a higher rank than the taxonRank of dwc:scientificName.';


--
-- Name: COLUMN material."higherClassificationRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."higherClassificationRank" IS 'Higher Classification Rank - A taxonomic rank of the higherClassificationName.';


--
-- Name: COLUMN material."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."scientificName" IS 'Scientific Name - A full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- Name: COLUMN material."taxonRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."taxonRank" IS 'Taxon Rank - A taxonomic rank of the most specific name in a dwc:scientificName.';


--
-- Name: COLUMN material."taxonRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."taxonRemarks" IS 'Taxon Remarks - Comments or notes about a dwc:Taxon.';


--
-- Name: material-agent-role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."material-agent-role" (
    "agentID" text NOT NULL,
    "materialEntityID" text NOT NULL,
    "agentRole" text,
    "agentRoleIRI" text,
    "agentRoleVocabulary" text,
    "agentRoleOrder" integer,
    "agentRoleDate" text,
    CONSTRAINT "material-agent-role_agentRoleOrder_check" CHECK (("agentRoleOrder" >= 1))
);


ALTER TABLE public."material-agent-role" OWNER TO postgres;

--
-- Name: TABLE "material-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-agent-role" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "material-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "material-agent-role"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."materialEntityID" IS 'Material Entity ID - An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "material-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRole" IS 'Agent Role - A category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "material-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRoleIRI" IS 'Agent Role IRI - An IRI of the controlled vocabulary value for a role of an Agent.';


--
-- Name: COLUMN "material-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRoleVocabulary" IS 'Agent Role Vocabulary - A reference to a controlled vocabulary in which the definition of a value in agentRole is given.';


--
-- Name: COLUMN "material-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRoleOrder" IS 'Agent Role Order - A numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "material-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRoleDate" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: material-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."material-assertion" (
    "assertionID" text NOT NULL,
    "materialEntityID" text NOT NULL,
    "assertionType" text,
    "assertionTypeIRI" text,
    "assertionTypeVocabulary" text,
    "assertionMadeDate" text,
    "assertionEffectiveDate" text,
    "assertionValue" text,
    "assertionValueIRI" text,
    "assertionValueVocabulary" text,
    "assertionValueNumeric" numeric,
    "assertionUnit" text,
    "assertionUnitIRI" text,
    "assertionUnitVocabulary" text,
    "assertionBy" text,
    "assertionByID" text,
    "assertionProtocols" text,
    "assertionProtocolID" text,
    "assertionReferences" text,
    "assertionRemarks" text
);


ALTER TABLE public."material-assertion" OWNER TO postgres;

--
-- Name: TABLE "material-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-assertion" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionID" IS 'Assertion ID - An identifier for an Assertion.';


--
-- Name: COLUMN "material-assertion"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."materialEntityID" IS 'Material Entity ID - An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "material-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionType" IS 'Assertion Type - A category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionTypeIRI" IS 'Assertion Type IRI - An IRI of a controlled vocabulary value for a type of Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionTypeVocabulary" IS 'Assertion Type Vocabulary - A reference to the controlled vocabulary in which the definition of a value in assertionType is given.';


--
-- Name: COLUMN "material-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionMadeDate" IS 'Assertion Made Date - A date on which an Assertion was created.';


--
-- Name: COLUMN "material-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionEffectiveDate" IS 'Assertion Effective Date - A date on which a state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "material-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionValue" IS 'Assertion Value - An asserted value, if it is not numeric.';


--
-- Name: COLUMN "material-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionValueIRI" IS 'Assertion Value IRI - An IRI of the controlled vocabulary value for a value of an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionValueVocabulary" IS 'Assertion Value Vocabulary - A reference to a controlled vocabulary in which the definition of a value in assertionValue is given.';


--
-- Name: COLUMN "material-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionValueNumeric" IS 'Assertion Value Numeric - An asserted value, if it is numeric.';


--
-- Name: COLUMN "material-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionUnit" IS 'Assertion Unit - Units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "material-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionUnitIRI" IS 'Assertion Unit IRI - An IRI of a controlled vocabulary value for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "material-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionUnitVocabulary" IS 'Assertion Unit Vocabulary - A reference to a controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "material-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionBy" IS 'Assertion By - A list (concatenated and separated) of names of Agents responsible for making an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionByID" IS 'Assertion By ID - An identifier for an Agent responsible for making an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionProtocols" IS 'Assertion Protocols - Names of, references to, or descriptions of Protocols used in making an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionProtocolID" IS 'Assertion Protocol ID - An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionReferences" IS 'Assertion References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionRemarks" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: material-identifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."material-identifier" (
    identifier text NOT NULL,
    "materialEntityID" text NOT NULL,
    "identifierType" text,
    "identifierTypeIRI" text,
    "identifierTypeVocabulary" text,
    "identifierLanguage" text
);


ALTER TABLE public."material-identifier" OWNER TO postgres;

--
-- Name: TABLE "material-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-identifier" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: COLUMN "material-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier".identifier IS 'Identifier - An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "material-identifier"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."materialEntityID" IS 'Material Entity ID - An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "material-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."identifierType" IS 'Identifier Type - A category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "material-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."identifierTypeIRI" IS 'Identifier Type IRI - An IRI of a controlled vocabulary value for a type of Identifier.';


--
-- Name: COLUMN "material-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."identifierTypeVocabulary" IS 'Identifier Type Vocabulary - A reference to a controlled vocabulary in which the definition of a value in identifierType is given.';


--
-- Name: COLUMN "material-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."identifierLanguage" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: material-media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."material-media" (
    "mediaID" text NOT NULL,
    "materialEntityID" text NOT NULL,
    "mediaSubjectCategory" text,
    "mediaSubjectCategoryIRI" text,
    "mediaSubjectCategoryVocabulary" text
);


ALTER TABLE public."material-media" OWNER TO postgres;

--
-- Name: TABLE "material-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-media" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "material-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN "material-media"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."materialEntityID" IS 'Material Entity ID - An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "material-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."mediaSubjectCategory" IS 'Media Subject Category - A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "material-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."mediaSubjectCategoryIRI" IS 'Media Subject Category IRI - An IRI of a controlled vocabulary value for the subject category of a Media instance.';


--
-- Name: COLUMN "material-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."mediaSubjectCategoryVocabulary" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: material-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."material-protocol" (
    "protocolID" text NOT NULL,
    "materialEntityID" text NOT NULL
);


ALTER TABLE public."material-protocol" OWNER TO postgres;

--
-- Name: TABLE "material-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-protocol" IS 'Material Entity ID - An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "material-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-protocol"."protocolID" IS 'Protocol ID - An identifier for a Protocol.';


--
-- Name: COLUMN "material-protocol"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-protocol"."materialEntityID" IS 'Material Entity ID - An identifier for a dwc:MaterialEntity.';


--
-- Name: material-reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."material-reference" (
    "referenceID" text NOT NULL,
    "materialEntityID" text NOT NULL
);


ALTER TABLE public."material-reference" OWNER TO postgres;

--
-- Name: TABLE "material-reference"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-reference" IS 'Material Entity ID - An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "material-reference"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-reference"."referenceID" IS 'Reference ID - An identifier for a Reference.';


--
-- Name: COLUMN "material-reference"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-reference"."materialEntityID" IS 'Material Entity ID - An identifier for a dwc:MaterialEntity.';


--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    "mediaID" text NOT NULL,
    "mediaType" text,
    "accessURI" text,
    "WebStatement" text,
    format text,
    rights text,
    "Owner" text,
    source text,
    creator text,
    "creatorID" text,
    "CreateDate" text,
    modified text,
    "mediaLanguage" text,
    "mediaDescription" text
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: TABLE media; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.media IS 'Media Description - An account of the Media subject matter.';


--
-- Name: COLUMN media."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN media."mediaType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."mediaType" IS 'Media Type - A category that best matches the nature of an instance of Media.';


--
-- Name: COLUMN media."accessURI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."accessURI" IS 'Access Uri - A URI that uniquely identifies a service that provides a representation of the underlying resource.';


--
-- Name: COLUMN media."WebStatement"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."WebStatement" IS 'WebStatement - A Web URL for a statement of the ownership and usage rights for this resource.';


--
-- Name: COLUMN media.format; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.format IS 'Format - The file format, physical medium, or dimensions of the resource.';


--
-- Name: COLUMN media.rights; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.rights IS 'Rights - Information about rights held in and over the resource.';


--
-- Name: COLUMN media."Owner"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."Owner" IS 'Owner - A list of legal owners of the resource.';


--
-- Name: COLUMN media.source; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.source IS 'Source - A related resource from which the described resource is derived.';


--
-- Name: COLUMN media.creator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.creator IS 'Creator - An entity primarily responsible for making the resource.';


--
-- Name: COLUMN media."creatorID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."creatorID" IS 'Creator ID - An identifier for the entity primarily responsible for making the resource.';


--
-- Name: COLUMN media."CreateDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."CreateDate" IS 'Create Date - The date and time the resource was created. For a digital file, this need not match a file-system creation time. For a freshly created resource, it should be close to that time, modulo the time taken to write the file. Later file transfer, copying, and so on, can make the file-system time arbitrarily different.';


--
-- Name: COLUMN media.modified; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.modified IS 'Modified - Date on which the resource was changed.';


--
-- Name: COLUMN media."mediaLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."mediaLanguage" IS 'Media Language - A language of the content of a Media instance.';


--
-- Name: COLUMN media."mediaDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."mediaDescription" IS 'Media Description - An account of the Media subject matter.';


--
-- Name: media-agent-role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."media-agent-role" (
    "agentID" text NOT NULL,
    "mediaID" text NOT NULL,
    "agentRole" text,
    "agentRoleIRI" text,
    "agentRoleVocabulary" text,
    "agentRoleOrder" integer,
    "agentRoleDate" text,
    CONSTRAINT "media-agent-role_agentRoleOrder_check" CHECK (("agentRoleOrder" >= 1))
);


ALTER TABLE public."media-agent-role" OWNER TO postgres;

--
-- Name: TABLE "media-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."media-agent-role" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "media-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "media-agent-role"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN "media-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRole" IS 'Agent Role - A category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "media-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRoleIRI" IS 'Agent Role IRI - An IRI of the controlled vocabulary value for a role of an Agent.';


--
-- Name: COLUMN "media-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRoleVocabulary" IS 'Agent Role Vocabulary - A reference to a controlled vocabulary in which the definition of a value in agentRole is given.';


--
-- Name: COLUMN "media-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRoleOrder" IS 'Agent Role Order - A numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "media-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRoleDate" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: media-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."media-assertion" (
    "assertionID" text NOT NULL,
    "mediaID" text NOT NULL,
    "assertionType" text,
    "assertionTypeIRI" text,
    "assertionTypeVocabulary" text,
    "assertionMadeDate" text,
    "assertionEffectiveDate" text,
    "assertionValue" text,
    "assertionValueIRI" text,
    "assertionValueVocabulary" text,
    "assertionValueNumeric" numeric,
    "assertionUnit" text,
    "assertionUnitIRI" text,
    "assertionUnitVocabulary" text,
    "assertionBy" text,
    "assertionByID" text,
    "assertionProtocols" text,
    "assertionProtocolID" text,
    "assertionReferences" text,
    "assertionRemarks" text
);


ALTER TABLE public."media-assertion" OWNER TO postgres;

--
-- Name: TABLE "media-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."media-assertion" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionID" IS 'Assertion ID - An identifier for an Assertion.';


--
-- Name: COLUMN "media-assertion"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN "media-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionType" IS 'Assertion Type - A category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionTypeIRI" IS 'Assertion Type IRI - An IRI of a controlled vocabulary value for a type of Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionTypeVocabulary" IS 'Assertion Type Vocabulary - A reference to the controlled vocabulary in which the definition of a value in assertionType is given.';


--
-- Name: COLUMN "media-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionMadeDate" IS 'Assertion Made Date - A date on which an Assertion was created.';


--
-- Name: COLUMN "media-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionEffectiveDate" IS 'Assertion Effective Date - A date on which a state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "media-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionValue" IS 'Assertion Value - An asserted value, if it is not numeric.';


--
-- Name: COLUMN "media-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionValueIRI" IS 'Assertion Value IRI - An IRI of the controlled vocabulary value for a value of an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionValueVocabulary" IS 'Assertion Value Vocabulary - A reference to a controlled vocabulary in which the definition of a value in assertionValue is given.';


--
-- Name: COLUMN "media-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionValueNumeric" IS 'Assertion Value Numeric - An asserted value, if it is numeric.';


--
-- Name: COLUMN "media-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionUnit" IS 'Assertion Unit - Units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "media-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionUnitIRI" IS 'Assertion Unit IRI - An IRI of a controlled vocabulary value for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "media-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionUnitVocabulary" IS 'Assertion Unit Vocabulary - A reference to a controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "media-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionBy" IS 'Assertion By - A list (concatenated and separated) of names of Agents responsible for making an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionByID" IS 'Assertion By ID - An identifier for an Agent responsible for making an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionProtocols" IS 'Assertion Protocols - Names of, references to, or descriptions of Protocols used in making an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionProtocolID" IS 'Assertion Protocol ID - An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionReferences" IS 'Assertion References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionRemarks" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: media-identifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."media-identifier" (
    identifier text NOT NULL,
    "mediaID" text NOT NULL,
    "identifierType" text,
    "identifierTypeIRI" text,
    "identifierTypeVocabulary" text,
    "identifierLanguage" text
);


ALTER TABLE public."media-identifier" OWNER TO postgres;

--
-- Name: TABLE "media-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."media-identifier" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: COLUMN "media-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier".identifier IS 'Identifier - An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "media-identifier"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN "media-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."identifierType" IS 'Identifier Type - A category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "media-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."identifierTypeIRI" IS 'Identifier Type IRI - An IRI of a controlled vocabulary value for a type of Identifier.';


--
-- Name: COLUMN "media-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."identifierTypeVocabulary" IS 'Identifier Type Vocabulary - A reference to a controlled vocabulary in which the definition of a value in identifierType is given.';


--
-- Name: COLUMN "media-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."identifierLanguage" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: molecular-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."molecular-protocol" (
    "molecularProtocolID" text NOT NULL,
    "assayType" text,
    samp_name text,
    project_name text,
    experimental_factor text,
    samp_taxon_id text,
    neg_cont_type text,
    pos_cont_type text,
    env_broad_scale text,
    env_local_scale text,
    env_medium text,
    subspecf_gen_lin text,
    ploidy text,
    num_replicons text,
    extrachrom_elements text,
    estimated_size text,
    ref_biomaterial text,
    source_mat_id text,
    pathogenicity text,
    biotic_relationship text,
    specific_host text,
    host_spec_range text,
    host_disease_stat text,
    trophic_level text,
    propagation text,
    encoded_traits text,
    rel_to_oxygen text,
    isol_growth_condt text,
    samp_collec_device text,
    samp_collec_method text,
    samp_mat_process text,
    size_frac text,
    samp_size text,
    samp_vol_we_dna_ext text,
    source_uvig text,
    virus_enrich_appr text,
    nucl_acid_ext text,
    nucl_acid_amp text,
    lib_size text,
    lib_reads_seqd text,
    lib_layout text,
    lib_vector text,
    lib_screen text,
    target_gene text,
    target_subfragment text,
    pcr_primers text,
    mid text,
    adapters text,
    pcr_cond text,
    seq_meth text,
    seq_quality_check text,
    chimera_check text,
    tax_ident text,
    assembly_qual text,
    assembly_name text,
    assembly_software text,
    annot text,
    number_contig text,
    feat_pred text,
    ref_db text,
    sim_search_meth text,
    tax_class text,
    _16s_recover text,
    _16s_recover_software text,
    trnas text,
    trna_ext_software text,
    compl_score text,
    compl_software text,
    compl_appr text,
    contam_score text,
    contam_screen_input text,
    contam_screen_param text,
    decontam_software text,
    sort_tech text,
    single_cell_lysis_appr text,
    single_cell_lysis_prot text,
    wga_amp_appr text,
    wga_amp_kit text,
    bin_param text,
    bin_software text,
    reassembly_bin text,
    mag_cov_software text,
    vir_ident_software text,
    pred_genome_type text,
    pred_genome_struc text,
    detec_type text,
    otu_class_appr text,
    otu_seq_comp_appr text,
    otu_db text,
    host_pred_appr text,
    host_pred_est_acc text,
    associated_resource text,
    sop text,
    pcr_primer_forward text,
    pcr_primer_reverse text,
    pcr_primer_name_forward text,
    pcr_primer_name_reverse text,
    pcr_primer_reference text,
    "DNA_sequence" text,
    concentration text,
    "concentrationUnit" text,
    "methodDeterminationConcentrationAndRatios" text,
    "ratioOfAbsorbance260_230" text,
    "ratioOfAbsorbance260_280" text,
    "annealingTemp" text,
    "annealingTempUnit" text,
    "probeReporter" text,
    "probeQuencher" text,
    "ampliconSize" text,
    "thresholdQuantificationCycle" text,
    "baselineValue" text,
    "quantificationCycle" text,
    "automaticThresholdQuantificationCycle" text,
    "automaticBaselineValue" text,
    "contaminationAssessment" text,
    "partitionVolume" text,
    "partitionVolumeUnit" text,
    "estimatedNumberOfCopies" text,
    "amplificationReactionVolume" text,
    "amplificationReactionVolumeUnit" text,
    pcr_analysis_software text,
    "experimentalVariance" text,
    pcr_primer_lod text,
    pcr_primer_loq text
);


ALTER TABLE public."molecular-protocol" OWNER TO postgres;

--
-- Name: TABLE "molecular-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."molecular-protocol" IS 'pcr_primer_loq - The assay’s ability to quantify copy number at low levels.';


--
-- Name: COLUMN "molecular-protocol"."molecularProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."molecularProtocolID" IS 'Molecular Protocol ID - An identifier for a MolecularProtocol.';


--
-- Name: COLUMN "molecular-protocol"."assayType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."assayType" IS 'Assay Type - A method used in the study to detect taxon/taxa of interest in the sample.';


--
-- Name: COLUMN "molecular-protocol".samp_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_name IS 'samp_name - Sample Name is a name that you choose for the sample. It can have any format, but we suggest that you make it concise, unique and consistent within your lab, and as informative as possible. Every Sample Name from a single Submitter must be unique. ';


--
-- Name: COLUMN "molecular-protocol".project_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".project_name IS 'project_name - Name of the project within which the sequencing was organized.';


--
-- Name: COLUMN "molecular-protocol".experimental_factor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".experimental_factor IS 'experimental_factor - Experimental factors are essentially the variable aspects of an experiment design which can be used to describe an experiment, or set of experiments, in an increasingly detailed manner. This field accepts ontology terms from Experimental Factor Ontology (EFO) and/or Ontology for Biomedical Investigations (OBI). For a browser of EFO (v 2.95) terms, please see http://purl.bioontology.org/ontology/EFO; for a browser of OBI (v 2018-02-12) terms please see http://purl.bioontology.org/ontology/OBI.';


--
-- Name: COLUMN "molecular-protocol".samp_taxon_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_taxon_id IS 'samp_taxon_id - NCBI taxon id of the sample. Maybe be a single taxon or mixed taxa sample. Use "synthetic metagenome" for mock community/positive controls, or "blank sample" for negative controls.';


--
-- Name: COLUMN "molecular-protocol".neg_cont_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".neg_cont_type IS 'neg_cont_type - The substance or equipment used as a negative control in an investigation.';


--
-- Name: COLUMN "molecular-protocol".pos_cont_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pos_cont_type IS 'pos_cont_type - The substance, mixture, product, or apparatus used to verify that a process which is part of an investigation delivers a true positive.';


--
-- Name: COLUMN "molecular-protocol".env_broad_scale; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".env_broad_scale IS 'env_broad_scale - In this field, report which major environmental system your sample or specimen came from. The systems identified should have a coarse spatial grain, to provide the general environmental context of where the sampling was done (e.g. were you in the desert or a rainforest?). We recommend using subclasses of ENVO’s biome class: http://purl.obolibrary.org/obo/ENVO_00000428. Format (one term): termLabel [termID], Format (multiple terms): termLabel [termID]|termLabel [termID]|termLabel [termID]. Example: Annotating a water sample from the photic zone in middle of the Atlantic Ocean, consider: oceanic epipelagic zone biome [ENVO:01000033]. Example: Annotating a sample from the Amazon rainforest consider: tropical moist broadleaf forest biome [ENVO:01000228]. If needed, request new terms on the ENVO tracker, identified here: http://www.obofoundry.org/ontology/envo.html.';


--
-- Name: COLUMN "molecular-protocol".env_local_scale; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".env_local_scale IS 'env_local_scale - In this field, report the entity or entities which are in your sample or specimen’s local vicinity and which you believe have significant causal influences on your sample or specimen. Please use terms that are present in ENVO and which are of smaller spatial grain than your entry for env_broad_scale. Format (one term): termLabel [termID]; Format (multiple terms): termLabel [termID]|termLabel [termID]|termLabel [termID]. Example: Annotating a pooled sample taken from various vegetation layers in a forest consider: canopy [ENVO:00000047]|herb and fern layer [ENVO:01000337]|litter layer [ENVO:01000338]|understory [01000335]|shrub layer [ENVO:01000336]. If needed, request new terms on the ENVO tracker, identified here: http://www.obofoundry.org/ontology/envo.html.';


--
-- Name: COLUMN "molecular-protocol".env_medium; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".env_medium IS 'env_medium - In this field, report which environmental material or materials (pipe separated) immediately surrounded your sample or specimen prior to sampling, using one or more subclasses of ENVO’s environmental material class: http://purl.obolibrary.org/obo/ENVO_00010483. Format (one term): termLabel [termID]; Format (multiple terms): termLabel [termID]|termLabel [termID]|termLabel [termID]. Example: Annotating a fish swimming in the upper 100 m of the Atlantic Ocean, consider: ocean water [ENVO:00002151]. Example: Annotating a duck on a pond consider: pond water [ENVO:00002228]|air ENVO_00002005. If needed, request new terms on the ENVO tracker, identified here: http://www.obofoundry.org/ontology/envo.html.';


--
-- Name: COLUMN "molecular-protocol".subspecf_gen_lin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".subspecf_gen_lin IS 'subspecf_gen_lin - This should provide further information about the genetic distinctness of the sequenced organism by recording additional information e.g. serovar, serotype, biotype, ecotype, or any relevant genetic typing schemes like Group I plasmid. It can also contain alternative taxonomic information. It should contain both the lineage name, and the lineage rank, i.e. biovar:abc123.';


--
-- Name: COLUMN "molecular-protocol".ploidy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".ploidy IS 'ploidy - The ploidy level of the genome (e.g. allopolyploid, haploid, diploid, triploid, tetraploid). It has implications for the downstream study of duplicated gene and regions of the genomes (and perhaps for difficulties in assembly). For terms, please select terms listed under class ploidy (PATO:001374) of Phenotypic Quality Ontology (PATO), and for a browser of PATO (v 2018-03-27) please refer to http://purl.bioontology.org/ontology/PATO.';


--
-- Name: COLUMN "molecular-protocol".num_replicons; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".num_replicons IS 'num_replicons - Reports the number of replicons in a nuclear genome of eukaryotes, in the genome of a bacterium or archaea or the number of segments in a segmented virus. Always applied to the haploid chromosome count of a eukaryote.';


--
-- Name: COLUMN "molecular-protocol".extrachrom_elements; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".extrachrom_elements IS 'extrachrom_elements - Do plasmids exist of significant phenotypic consequence (e.g. ones that determine virulence or antibiotic resistance). Megaplasmids? Other plasmids (borrelia has 15+ plasmids).';


--
-- Name: COLUMN "molecular-protocol".estimated_size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".estimated_size IS 'estimated_size - The estimated size of the genome prior to sequencing. Of particular importance in the sequencing of (eukaryotic) genome which could remain in draft form for a long or unspecified period.';


--
-- Name: COLUMN "molecular-protocol".ref_biomaterial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".ref_biomaterial IS 'ref_biomaterial - Primary publication if isolated before genome publication; otherwise, primary genome report.';


--
-- Name: COLUMN "molecular-protocol".source_mat_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".source_mat_id IS 'source_mat_id - A unique identifier assigned to a material sample (as defined by http://rs.tdwg.org/dwc/terms/materialSampleID, and as opposed to a particular digital record of a material sample) used for extracting nucleic acids, and subsequent sequencing. The identifier can refer either to the original material collected or to any derived sub-samples. The INSDC qualifiers /specimen_voucher, /bio_material, or /culture_collection may or may not share the same value as the source_mat_id field. For instance, the /specimen_voucher qualifier and source_mat_id may both contain ´UAM:Herps:14´ , referring to both the specimen voucher and sampled tissue with the same identifier. However, the /culture_collection qualifier may refer to a value from an initial culture (e.g. ATCC:11775) while source_mat_id would refer to an identifier from some derived culture from which the nucleic acids were extracted (e.g. xatc123 or ark:/2154/R2).';


--
-- Name: COLUMN "molecular-protocol".pathogenicity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pathogenicity IS 'pathogenicity - To what is the entity pathogenic.';


--
-- Name: COLUMN "molecular-protocol".biotic_relationship; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".biotic_relationship IS 'biotic_relationship - Description of relationship(s) between the subject organism and other organism(s) it is associated with. E.g., parasite on species X; mutualist with species Y. The target organism is the subject of the relationship, and the other organism(s) is the object.';


--
-- Name: COLUMN "molecular-protocol".specific_host; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".specific_host IS 'specific_host - If there is a host involved, please provide its taxid (or environmental if not actually isolated from the dead or alive host - i.e. a pathogen could be isolated from a swipe of a bench etc) and report whether it is a laboratory or natural host).';


--
-- Name: COLUMN "molecular-protocol".host_spec_range; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".host_spec_range IS 'host_spec_range - The NCBI taxonomy identifier of the specific host if it is known.';


--
-- Name: COLUMN "molecular-protocol".host_disease_stat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".host_disease_stat IS 'host_disease_stat - List of diseases with which the host has been diagnosed; can include multiple diagnoses. The value of the field depends on host; for humans the terms should be chosen from the DO (Human Disease Ontology) at https://www.disease-ontology.org, non-human host diseases are free text.';


--
-- Name: COLUMN "molecular-protocol".trophic_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".trophic_level IS 'trophic_level - Trophic levels are the feeding position in a food chain. Microbes can be a range of producers (e.g. chemolithotroph).';


--
-- Name: COLUMN "molecular-protocol".propagation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".propagation IS 'propagation - This field is specific to different taxa. For phages: lytic/lysogenic, for plasmids: incompatibility group, for eukaryotes: sexual/asexual (Note: there is the strong opinion to name phage propagation obligately lytic or temperate, therefore we also give this choice.';


--
-- Name: COLUMN "molecular-protocol".encoded_traits; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".encoded_traits IS 'encoded_traits - Should include key traits like antibiotic resistance or xenobiotic degradation phenotypes for plasmids, converting genes for phage.';


--
-- Name: COLUMN "molecular-protocol".rel_to_oxygen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".rel_to_oxygen IS 'rel_to_oxygen - Is this organism an aerobe, anaerobe? Please note that aerobic and anaerobic are valid descriptors for microbial environments.';


--
-- Name: COLUMN "molecular-protocol".isol_growth_condt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".isol_growth_condt IS 'isol_growth_condt - Publication reference in the form of pubmed ID (pmid), digital object identifier (doi) or url for isolation and growth condition specifications of the organism/material.';


--
-- Name: COLUMN "molecular-protocol".samp_collec_device; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_collec_device IS 'samp_collec_device - The device used to collect an environmental sample. This field accepts terms listed under environmental sampling device (http://purl.obolibrary.org/obo/ENVO). This field also accepts terms listed under specimen collection device (http://purl.obolibrary.org/obo/GENEPIO_0002094).';


--
-- Name: COLUMN "molecular-protocol".samp_collec_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_collec_method IS 'samp_collec_method - The method employed for collecting the sample.';


--
-- Name: COLUMN "molecular-protocol".samp_mat_process; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_mat_process IS 'samp_mat_process - Any processing applied to the sample during or after retrieving the sample from environment. This field accepts OBI, for a browser of OBI (v 2018-02-12) terms please see http://purl.bioontology.org/ontology/OBI.';


--
-- Name: COLUMN "molecular-protocol".size_frac; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".size_frac IS 'size_frac - Filtering pore size used in sample preparation.';


--
-- Name: COLUMN "molecular-protocol".samp_size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_size IS 'samp_size - Amount or size of sample (volume, mass or area) that was collected.';


--
-- Name: COLUMN "molecular-protocol".samp_vol_we_dna_ext; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_vol_we_dna_ext IS 'samp_vol_we_dna_ext - Volume (ml) or mass (g) of total collected sample processed for DNA extraction. Note: total sample collected should be entered under the term Sample Size (MIXS:0000001).';


--
-- Name: COLUMN "molecular-protocol".source_uvig; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".source_uvig IS 'source_uvig - Type of dataset from which the UViG was obtained.';


--
-- Name: COLUMN "molecular-protocol".virus_enrich_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".virus_enrich_appr IS 'virus_enrich_appr - List of approaches used to enrich the sample for viruses, if any.';


--
-- Name: COLUMN "molecular-protocol".nucl_acid_ext; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".nucl_acid_ext IS 'nucl_acid_ext - A link to a literature reference, electronic resource or a standard operating procedure (SOP), that describes the material separation to recover the nucleic acid fraction from a sample.';


--
-- Name: COLUMN "molecular-protocol".nucl_acid_amp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".nucl_acid_amp IS 'nucl_acid_amp - A link to a literature reference, electronic resource or a standard operating procedure (SOP), that describes the enzymatic amplification (PCR, TMA, NASBA) of specific nucleic acids.';


--
-- Name: COLUMN "molecular-protocol".lib_size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".lib_size IS 'lib_size - Total number of clones in the library prepared for the project.';


--
-- Name: COLUMN "molecular-protocol".lib_reads_seqd; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".lib_reads_seqd IS 'lib_reads_seqd - Total number of clones sequenced from the library.';


--
-- Name: COLUMN "molecular-protocol".lib_layout; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".lib_layout IS 'lib_layout - Specify whether to expect single, paired, or other configuration of reads.';


--
-- Name: COLUMN "molecular-protocol".lib_vector; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".lib_vector IS 'lib_vector - Cloning vector type(s) used in construction of libraries.';


--
-- Name: COLUMN "molecular-protocol".lib_screen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".lib_screen IS 'lib_screen - Specific enrichment or screening methods applied before and/or after creating libraries.';


--
-- Name: COLUMN "molecular-protocol".target_gene; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".target_gene IS 'target_gene - Targeted gene or locus name for marker gene studies.';


--
-- Name: COLUMN "molecular-protocol".target_subfragment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".target_subfragment IS 'target_subfragment - Name of subfragment of a gene or locus. Important to e.g. identify special regions on marker genes like V6 on 16S rRNA.';


--
-- Name: COLUMN "molecular-protocol".pcr_primers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primers IS 'pcr_primers - PCR primers that were used to amplify the sequence of the targeted gene, locus or subfragment. This field should contain all the primers used for a single PCR reaction if multiple forward or reverse primers are present in a single PCR reaction. The primer sequence should be reported in uppercase letters.';


--
-- Name: COLUMN "molecular-protocol".mid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".mid IS 'mid - Molecular barcodes, called Multiplex Identifiers (MIDs), that are used to specifically tag unique samples in a sequencing run. Sequence should be reported in uppercase letters.';


--
-- Name: COLUMN "molecular-protocol".adapters; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".adapters IS 'adapters - Adapters provide priming sequences for both amplification and sequencing of the sample-library fragments. Both adapters should be reported; in uppercase letters.';


--
-- Name: COLUMN "molecular-protocol".pcr_cond; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_cond IS 'pcr_cond - Description of reaction conditions and components of PCR in the form of ´initial denaturation:94degC_1.5min; annealing=...´.';


--
-- Name: COLUMN "molecular-protocol".seq_meth; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".seq_meth IS 'seq_meth - Sequencing method used; e.g. Sanger, ABI-solid.';


--
-- Name: COLUMN "molecular-protocol".seq_quality_check; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".seq_quality_check IS 'seq_quality_check - Indicate if the sequence has been called by automatic systems (none) or undergone a manual editing procedure (e.g. by inspecting the raw data or chromatograms). Applied only for sequences that are not submitted to SRA,ENA or DRA.';


--
-- Name: COLUMN "molecular-protocol".chimera_check; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".chimera_check IS 'chimera_check - A chimeric sequence, or chimera for short, is a sequence comprised of two or more phylogenetically distinct parent sequences. Chimeras are usually PCR artifacts thought to occur when a prematurely terminated amplicon reanneals to a foreign DNA strand and is copied to completion in the following PCR cycles. The point at which the chimeric sequence changes from one parent to the next is called the breakpoint or conversion point.';


--
-- Name: COLUMN "molecular-protocol".tax_ident; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".tax_ident IS 'tax_ident - The phylogenetic marker(s) used to assign an organism name to the SAG or MAG.';


--
-- Name: COLUMN "molecular-protocol".assembly_qual; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".assembly_qual IS 'assembly_qual - The assembly quality category is based on sets of criteria outlined for each assembly quality category. For MISAG/MIMAG; Finished: Single, validated, contiguous sequence per replicon without gaps or ambiguities with a consensus error rate equivalent to Q50 or better. High Quality Draft:Multiple fragments where gaps span repetitive regions. Presence of the 23S, 16S and 5S rRNA genes and at least 18 tRNAs. Medium Quality Draft:Many fragments with little to no review of assembly other than reporting of standard assembly statistics. Low Quality Draft:Many fragments with little to no review of assembly other than reporting of standard assembly statistics. Assembly statistics include, but are not limited to total assembly size, number of contigs, contig N50/L50, and maximum contig length. For MIUVIG; Finished: Single, validated, contiguous sequence per replicon without gaps or ambiguities, with extensive manual review and editing to annotate putative gene functions and transcriptional units. High-quality draft genome: One or multiple fragments, totaling ≥ 90% of the expected genome or replicon sequence or predicted complete. Genome fragment(s): One or multiple fragments, totalling < 90% of the expected genome or replicon sequence, or for which no genome size could be estimated.';


--
-- Name: COLUMN "molecular-protocol".assembly_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".assembly_name IS 'assembly_name - Name/version of the assembly provided by the submitter that is used in the genome browsers and in the community.';


--
-- Name: COLUMN "molecular-protocol".assembly_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".assembly_software IS 'assembly_software - Tool(s) used for assembly, including version number and parameters.';


--
-- Name: COLUMN "molecular-protocol".annot; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".annot IS 'annot - Tool used for annotation, or for cases where annotation was provided by a community jamboree or model organism database rather than by a specific submitter.';


--
-- Name: COLUMN "molecular-protocol".number_contig; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".number_contig IS 'number_contig - Total number of contigs in the cleaned/submitted assembly that makes up a given genome, SAG, MAG, or UViG.';


--
-- Name: COLUMN "molecular-protocol".feat_pred; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".feat_pred IS 'feat_pred - Method used to predict UViGs features such as ORFs, integration site, etc.';


--
-- Name: COLUMN "molecular-protocol".ref_db; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".ref_db IS 'ref_db - List of database(s) used for ORF annotation, along with version number and reference to website or publication.';


--
-- Name: COLUMN "molecular-protocol".sim_search_meth; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".sim_search_meth IS 'sim_search_meth - Tool used to compare ORFs with database, along with version and cutoffs used.';


--
-- Name: COLUMN "molecular-protocol".tax_class; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".tax_class IS 'tax_class - Method used for taxonomic classification, along with reference database used, classification rank, and thresholds used to classify new genomes.';


--
-- Name: COLUMN "molecular-protocol"._16s_recover; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"._16s_recover IS '_16s_recover - Can a 16S gene be recovered from the submitted SAG or MAG?.';


--
-- Name: COLUMN "molecular-protocol"._16s_recover_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"._16s_recover_software IS '_16s_recover_software - Tools used for 16S rRNA gene extraction.';


--
-- Name: COLUMN "molecular-protocol".trnas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".trnas IS 'trnas - The total number of tRNAs identified from the SAG or MAG.';


--
-- Name: COLUMN "molecular-protocol".trna_ext_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".trna_ext_software IS 'trna_ext_software - Tools used for tRNA identification.';


--
-- Name: COLUMN "molecular-protocol".compl_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".compl_score IS 'compl_score - Completeness score is typically based on either the fraction of markers found as compared to a database or the percent of a genome found as compared to a closely related reference genome. High Quality Draft: >90%, Medium Quality Draft: >50%, and Low Quality Draft: < 50% should have the indicated completeness scores.';


--
-- Name: COLUMN "molecular-protocol".compl_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".compl_software IS 'compl_software - Tools used for completion estimate, i.e. checkm, anvi´o, busco.';


--
-- Name: COLUMN "molecular-protocol".compl_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".compl_appr IS 'compl_appr - The approach used to determine the completeness of a given SAG or MAG, which would typically make use of a set of conserved marker genes or a closely related reference genome. For UViG completeness, include reference genome or group used, and contig feature suggesting a complete genome.';


--
-- Name: COLUMN "molecular-protocol".contam_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".contam_score IS 'contam_score - The contamination score is based on the fraction of single-copy genes that are observed more than once in a query genome. The following scores are acceptable for; High Quality Draft: < 5%, Medium Quality Draft: < 10%, Low Quality Draft: < 10%. Contamination must be below 5% for a SAG or MAG to be deposited into any of the public databases.';


--
-- Name: COLUMN "molecular-protocol".contam_screen_input; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".contam_screen_input IS 'contam_screen_input - The type of sequence data used as input.';


--
-- Name: COLUMN "molecular-protocol".contam_screen_param; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".contam_screen_param IS 'contam_screen_param - Specific parameters used in the decontamination sofware, such as reference database, coverage, and kmers. Combinations of these parameters may also be used, i.e. kmer and coverage, or reference database and kmer.';


--
-- Name: COLUMN "molecular-protocol".decontam_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".decontam_software IS 'decontam_software - Tool(s) used in contamination screening.';


--
-- Name: COLUMN "molecular-protocol".sort_tech; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".sort_tech IS 'sort_tech - Method used to sort/isolate cells or particles of interest.';


--
-- Name: COLUMN "molecular-protocol".single_cell_lysis_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".single_cell_lysis_appr IS 'single_cell_lysis_appr - Method used to free DNA from interior of the cell(s) or particle(s).';


--
-- Name: COLUMN "molecular-protocol".single_cell_lysis_prot; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".single_cell_lysis_prot IS 'single_cell_lysis_prot - Name of the kit or standard protocol used for cell(s) or particle(s) lysis.';


--
-- Name: COLUMN "molecular-protocol".wga_amp_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".wga_amp_appr IS 'wga_amp_appr - Method used to amplify genomic DNA in preparation for sequencing.';


--
-- Name: COLUMN "molecular-protocol".wga_amp_kit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".wga_amp_kit IS 'wga_amp_kit - Kit used to amplify genomic DNA in preparation for sequencing.';


--
-- Name: COLUMN "molecular-protocol".bin_param; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".bin_param IS 'bin_param - The parameters that have been applied during the extraction of genomes from metagenomic datasets.';


--
-- Name: COLUMN "molecular-protocol".bin_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".bin_software IS 'bin_software - Tool(s) used for the extraction of genomes from metagenomic datasets.';


--
-- Name: COLUMN "molecular-protocol".reassembly_bin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".reassembly_bin IS 'reassembly_bin - Has an assembly been performed on a genome bin extracted from a metagenomic assembly?.';


--
-- Name: COLUMN "molecular-protocol".mag_cov_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".mag_cov_software IS 'mag_cov_software - Tool(s) used to determine the genome coverage if coverage is used as a binning parameter in the extraction of genomes from metagenomic datasets.';


--
-- Name: COLUMN "molecular-protocol".vir_ident_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".vir_ident_software IS 'vir_ident_software - Tool(s) used for the identification of UViG as a viral genome, software or protocol name including version number, parameters, and cutoffs used.';


--
-- Name: COLUMN "molecular-protocol".pred_genome_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pred_genome_type IS 'pred_genome_type - Type of genome predicted for the UViG.';


--
-- Name: COLUMN "molecular-protocol".pred_genome_struc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pred_genome_struc IS 'pred_genome_struc - Expected structure of the viral genome.';


--
-- Name: COLUMN "molecular-protocol".detec_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".detec_type IS 'detec_type - Type of UViG detection.';


--
-- Name: COLUMN "molecular-protocol".otu_class_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".otu_class_appr IS 'otu_class_appr - Cutoffs and approach used when clustering new UViGs in "species-level" OTUs. Note that results from standard 95% ANI / 85% AF clustering should be provided alongside OTUS defined from another set of thresholds, even if the latter are the ones primarily used during the analysis.';


--
-- Name: COLUMN "molecular-protocol".otu_seq_comp_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".otu_seq_comp_appr IS 'otu_seq_comp_appr - Tool and thresholds used to compare sequences when computing "species-level" OTUs.';


--
-- Name: COLUMN "molecular-protocol".otu_db; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".otu_db IS 'otu_db - Reference database (i.e. sequences not generated as part of the current study) used to cluster new genomes in "species-level" OTUs, if any.';


--
-- Name: COLUMN "molecular-protocol".host_pred_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".host_pred_appr IS 'host_pred_appr - Tool or approach used for host prediction.';


--
-- Name: COLUMN "molecular-protocol".host_pred_est_acc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".host_pred_est_acc IS 'host_pred_est_acc - For each tool or approach used for host prediction, estimated false discovery rates should be included, either computed de novo or from the literature.';


--
-- Name: COLUMN "molecular-protocol".associated_resource; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".associated_resource IS 'associated_resource - A related resource that is referenced, cited, or otherwise associated to the sequence.';


--
-- Name: COLUMN "molecular-protocol".sop; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".sop IS 'sop - Standard operating procedures used in assembly and/or annotation of genomes, metagenomes or environmental sequences.';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_forward; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_forward IS 'pcr_primer_forward - Forward PCR primer that were used to amplify the sequence of the targeted gene, locus or subfragment. If multiple multiple forward or reverse primers are present in a single PCR reaction, there should be a full row for each of these linked to the same dwc:Occurrence. The primer sequence should be reported in uppercase letters.';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_reverse; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_reverse IS 'pcr_primer_reverse - Reverse PCR primer that were used to amplify the sequence of the targeted gene, locus or subfragment. If multiple multiple forward or reverse primers are present in a single PCR reaction, there should be a full row for each of these linked to the same dwc:Occurrence. The primer sequence should be reported in uppercase letters.';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_name_forward; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_name_forward IS 'pcr_primer_name_forward - Name of the forward PCR primer that were used to amplify the sequence of the targeted gene, locus or subfragment. If multiple multiple forward or reverse primers are present in a single PCR reaction, there should be a full row for each of these linked to the same dwc:Occurrence.';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_name_reverse; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_name_reverse IS 'pcr_primer_name_reverse - Name of the reverse PCR primer that were used to amplify the sequence of the targeted gene, locus or subfragment. If multiple multiple forward or reverse primers are present in a single PCR reaction, there should be a full row for each of these linked to the same dwc:Occurrence.';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_reference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_reference IS 'pcr_primer_reference - Reference for the PCR primers that were used to amplify the sequence of the targeted gene, locus or subfragment.';


--
-- Name: COLUMN "molecular-protocol"."DNA_sequence"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."DNA_sequence" IS 'DNA_sequence - A DNA sequence.';


--
-- Name: COLUMN "molecular-protocol".concentration; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".concentration IS 'concentration - Concentration of DNA (weight ng/volume µl).';


--
-- Name: COLUMN "molecular-protocol"."concentrationUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."concentrationUnit" IS 'concentrationUnit - Unit used for concentration measurement.';


--
-- Name: COLUMN "molecular-protocol"."methodDeterminationConcentrationAndRatios"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."methodDeterminationConcentrationAndRatios" IS 'methodDeterminationConcentrationAndRatios - Description of method used for concentration measurement.';


--
-- Name: COLUMN "molecular-protocol"."ratioOfAbsorbance260_230"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."ratioOfAbsorbance260_230" IS 'ratioOfAbsorbance260_230 - Ratio of absorbance at 260 nm and 230 nm assessing DNA purity (mostly secondary measure, indicates mainly EDTA, carbohydrates, phenol), (DNA samples only).';


--
-- Name: COLUMN "molecular-protocol"."ratioOfAbsorbance260_280"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."ratioOfAbsorbance260_280" IS 'ratioOfAbsorbance260_280 - Ratio of absorbance at 280 nm and 230 nm assessing DNA purity (mostly secondary measure, indicates mainly EDTA, carbohydrates, phenol), (DNA samples only).';


--
-- Name: COLUMN "molecular-protocol"."annealingTemp"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."annealingTemp" IS 'annealingTemp - The reaction temperature during the annealing phase of PCR.';


--
-- Name: COLUMN "molecular-protocol"."annealingTempUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."annealingTempUnit" IS 'annealingTempUnit - Measurement unit of the reaction temperature during the annealing phase of PCR.';


--
-- Name: COLUMN "molecular-protocol"."probeReporter"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."probeReporter" IS 'probeReporter - Type of fluorophore (reporter) used. Probe anneals within amplified target DNA. Polymerase activity degrades the probe that has annealed to the template, and the probe releases the fluorophore from it and breaks the proximity to the quencher, thus allowing fluorescence of the fluorophore.';


--
-- Name: COLUMN "molecular-protocol"."probeQuencher"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."probeQuencher" IS 'probeQuencher - Type of quencher used. The quencher molecule quenches the fluorescence emitted by the fluorophore when excited by the cycler’s light source As long as fluorophore and the quencher are in proximity, quenching inhibits any fluorescence signals.';


--
-- Name: COLUMN "molecular-protocol"."ampliconSize"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."ampliconSize" IS 'ampliconSize - The length of the amplicon in basepairs.';


--
-- Name: COLUMN "molecular-protocol"."thresholdQuantificationCycle"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."thresholdQuantificationCycle" IS 'thresholdQuantificationCycle - Threshold for change in fluorescence signal between cycles.';


--
-- Name: COLUMN "molecular-protocol"."baselineValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."baselineValue" IS 'baselineValue - The number of cycles when fluorescence signal from the target amplification is below background fluorescence not originated from the real target amplification.';


--
-- Name: COLUMN "molecular-protocol"."quantificationCycle"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."quantificationCycle" IS 'quantificationCycle - The number of cycles required for the fluorescent signal to cross a given value threshold above the baseline. Quantification cycle (Cq), threshold cycle (Ct), crossing point (Cp), and take-off point (TOP) refer to the same value from the real-time instrument. Use of quantification cycle (Cq), is preferable according to the RDML (Real-Time PCR Data Markup Language) data standard (http://www.rdml.org).';


--
-- Name: COLUMN "molecular-protocol"."automaticThresholdQuantificationCycle"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."automaticThresholdQuantificationCycle" IS 'automaticThresholdQuantificationCycle - Whether the threshold was set by the instrument or manually.';


--
-- Name: COLUMN "molecular-protocol"."automaticBaselineValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."automaticBaselineValue" IS 'automaticBaselineValue - Whether the baseline value was set by the instrument or manually.';


--
-- Name: COLUMN "molecular-protocol"."contaminationAssessment"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."contaminationAssessment" IS 'contaminationAssessment - Whether DNA or RNA contamination assessment was done or not.';


--
-- Name: COLUMN "molecular-protocol"."partitionVolume"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."partitionVolume" IS 'partitionVolume - An accurate estimation of partition volume. The sum of the partitions multiplied by the partition volume will enable the total volume of the reaction to be calculated.';


--
-- Name: COLUMN "molecular-protocol"."partitionVolumeUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."partitionVolumeUnit" IS 'partitionVolumeUnit - Unit used for partition volume.';


--
-- Name: COLUMN "molecular-protocol"."estimatedNumberOfCopies"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."estimatedNumberOfCopies" IS 'estimatedNumberOfCopies - Number of target molecules per µl. Mean copies per partition (?) can be calculated using the number of partitions (n) and the estimated copy number in the total volume of all partitions (m) with a formula ?=m/n.';


--
-- Name: COLUMN "molecular-protocol"."amplificationReactionVolume"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."amplificationReactionVolume" IS 'amplificationReactionVolume - PCR reaction volume.';


--
-- Name: COLUMN "molecular-protocol"."amplificationReactionVolumeUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."amplificationReactionVolumeUnit" IS 'amplificationReactionVolumeUnit - Unit used for PCR reaction volume. Many of the instruments require preparation of a much larger initial sample volume than is actually analyzed.';


--
-- Name: COLUMN "molecular-protocol".pcr_analysis_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_analysis_software IS 'pcr_analysis_software - The program used to analyse the d(d)PCR runs.';


--
-- Name: COLUMN "molecular-protocol"."experimentalVariance"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."experimentalVariance" IS 'experimentalVariance - Multiple biological replicates are encouraged to assess total experimental variation. When single dPCR experiments are performed, a minimal estimate of variance due to counting error alone must be calculated from the binomial (or suitable equivalent) distribution.';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_lod; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_lod IS 'pcr_primer_lod - The assay’s ability to detect the target at low levels.';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_loq; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_loq IS 'pcr_primer_loq - The assay’s ability to quantify copy number at low levels.';


--
-- Name: molecular-protocol-agent-role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."molecular-protocol-agent-role" (
    "agentID" text NOT NULL,
    "molecularProtocolID" text NOT NULL,
    "agentRole" text,
    "agentRoleIRI" text,
    "agentRoleVocabulary" text,
    "agentRoleOrder" integer,
    "agentRoleDate" text,
    CONSTRAINT "molecular-protocol-agent-role_agentRoleOrder_check" CHECK (("agentRoleOrder" >= 1))
);


ALTER TABLE public."molecular-protocol-agent-role" OWNER TO postgres;

--
-- Name: TABLE "molecular-protocol-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."molecular-protocol-agent-role" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."molecularProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."molecularProtocolID" IS 'Molecular Protocol ID - An identifier for a MolecularProtocol.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."agentRole" IS 'Agent Role - A category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."agentRoleIRI" IS 'Agent Role IRI - An IRI of the controlled vocabulary value for a role of an Agent.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."agentRoleVocabulary" IS 'Agent Role Vocabulary - A reference to a controlled vocabulary in which the definition of a value in agentRole is given.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."agentRoleOrder" IS 'Agent Role Order - A numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."agentRoleDate" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: molecular-protocol-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."molecular-protocol-assertion" (
    "assertionID" text NOT NULL,
    "molecularProtocolID" text NOT NULL,
    "assertionType" text,
    "assertionTypeIRI" text,
    "assertionTypeVocabulary" text,
    "assertionMadeDate" text,
    "assertionEffectiveDate" text,
    "assertionValue" text,
    "assertionValueIRI" text,
    "assertionValueVocabulary" text,
    "assertionValueNumeric" numeric,
    "assertionUnit" text,
    "assertionUnitIRI" text,
    "assertionUnitVocabulary" text,
    "assertionBy" text,
    "assertionByID" text,
    "assertionProtocols" text,
    "assertionProtocolID" text,
    "assertionReferences" text,
    "assertionRemarks" text
);


ALTER TABLE public."molecular-protocol-assertion" OWNER TO postgres;

--
-- Name: TABLE "molecular-protocol-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."molecular-protocol-assertion" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionID" IS 'Assertion ID - An identifier for an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."molecularProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."molecularProtocolID" IS 'Molecular Protocol ID - An identifier for a MolecularProtocol.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionType" IS 'Assertion Type - A category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionTypeIRI" IS 'Assertion Type IRI - An IRI of a controlled vocabulary value for a type of Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionTypeVocabulary" IS 'Assertion Type Vocabulary - A reference to the controlled vocabulary in which the definition of a value in assertionType is given.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionMadeDate" IS 'Assertion Made Date - A date on which an Assertion was created.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionEffectiveDate" IS 'Assertion Effective Date - A date on which a state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionValue" IS 'Assertion Value - An asserted value, if it is not numeric.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionValueIRI" IS 'Assertion Value IRI - An IRI of the controlled vocabulary value for a value of an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionValueVocabulary" IS 'Assertion Value Vocabulary - A reference to a controlled vocabulary in which the definition of a value in assertionValue is given.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionValueNumeric" IS 'Assertion Value Numeric - An asserted value, if it is numeric.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionUnit" IS 'Assertion Unit - Units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionUnitIRI" IS 'Assertion Unit IRI - An IRI of a controlled vocabulary value for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionUnitVocabulary" IS 'Assertion Unit Vocabulary - A reference to a controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionBy" IS 'Assertion By - A list (concatenated and separated) of names of Agents responsible for making an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionByID" IS 'Assertion By ID - An identifier for an Agent responsible for making an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionProtocols" IS 'Assertion Protocols - Names of, references to, or descriptions of Protocols used in making an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionProtocolID" IS 'Assertion Protocol ID - An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionReferences" IS 'Assertion References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionRemarks" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: molecular-protocol-reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."molecular-protocol-reference" (
    "referenceID" text NOT NULL,
    "molecularProtocolID" text NOT NULL
);


ALTER TABLE public."molecular-protocol-reference" OWNER TO postgres;

--
-- Name: TABLE "molecular-protocol-reference"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."molecular-protocol-reference" IS 'Molecular Protocol ID - An identifier for a MolecularProtocol.';


--
-- Name: COLUMN "molecular-protocol-reference"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-reference"."referenceID" IS 'Reference ID - An identifier for a Reference.';


--
-- Name: COLUMN "molecular-protocol-reference"."molecularProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-reference"."molecularProtocolID" IS 'Molecular Protocol ID - An identifier for a MolecularProtocol.';


--
-- Name: nucleotide-analysis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."nucleotide-analysis" (
    "nucleotideAnalysisID" text NOT NULL,
    "eventID" text NOT NULL,
    "molecularProtocolID" text NOT NULL,
    "nucleotideSequenceID" text,
    "materialEntityID" text,
    "readCount" integer,
    "totalReadCount" integer
);


ALTER TABLE public."nucleotide-analysis" OWNER TO postgres;

--
-- Name: TABLE "nucleotide-analysis"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."nucleotide-analysis" IS 'Total Read Count - A total number of reads in a NucleotideAnalysis.';


--
-- Name: COLUMN "nucleotide-analysis"."nucleotideAnalysisID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."nucleotideAnalysisID" IS 'Nucleotide Analysis ID - An identifier for a NucleotideAnalysis.';


--
-- Name: COLUMN "nucleotide-analysis"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN "nucleotide-analysis"."molecularProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."molecularProtocolID" IS 'Molecular Protocol ID - An identifier for a MolecularProtocol.';


--
-- Name: COLUMN "nucleotide-analysis"."nucleotideSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."nucleotideSequenceID" IS 'Nucleotide Sequence ID - An identifier for a NucleotideSequence.';


--
-- Name: COLUMN "nucleotide-analysis"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."materialEntityID" IS 'Material Entity ID - An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "nucleotide-analysis"."readCount"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."readCount" IS 'Read Count - A number of reads for a NucleotideSequence in a NucleotideAnalysis.';


--
-- Name: COLUMN "nucleotide-analysis"."totalReadCount"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."totalReadCount" IS 'Total Read Count - A total number of reads in a NucleotideAnalysis.';


--
-- Name: nucleotide-analysis-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."nucleotide-analysis-assertion" (
    "assertionID" text NOT NULL,
    "nucleotideAnalysisID" text NOT NULL,
    "assertionType" text,
    "assertionTypeIRI" text,
    "assertionTypeVocabulary" text,
    "assertionMadeDate" text,
    "assertionEffectiveDate" text,
    "assertionValue" text,
    "assertionValueIRI" text,
    "assertionValueVocabulary" text,
    "assertionValueNumeric" numeric,
    "assertionUnit" text,
    "assertionUnitIRI" text,
    "assertionUnitVocabulary" text,
    "assertionBy" text,
    "assertionByID" text,
    "assertionProtocols" text,
    "assertionProtocolID" text,
    "assertionReferences" text,
    "assertionRemarks" text
);


ALTER TABLE public."nucleotide-analysis-assertion" OWNER TO postgres;

--
-- Name: TABLE "nucleotide-analysis-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."nucleotide-analysis-assertion" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionID" IS 'Assertion ID - An identifier for an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."nucleotideAnalysisID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."nucleotideAnalysisID" IS 'Nucleotide Analysis ID - An identifier for a NucleotideAnalysis.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionType" IS 'Assertion Type - A category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionTypeIRI" IS 'Assertion Type IRI - An IRI of a controlled vocabulary value for a type of Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionTypeVocabulary" IS 'Assertion Type Vocabulary - A reference to the controlled vocabulary in which the definition of a value in assertionType is given.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionMadeDate" IS 'Assertion Made Date - A date on which an Assertion was created.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionEffectiveDate" IS 'Assertion Effective Date - A date on which a state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionValue" IS 'Assertion Value - An asserted value, if it is not numeric.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionValueIRI" IS 'Assertion Value IRI - An IRI of the controlled vocabulary value for a value of an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionValueVocabulary" IS 'Assertion Value Vocabulary - A reference to a controlled vocabulary in which the definition of a value in assertionValue is given.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionValueNumeric" IS 'Assertion Value Numeric - An asserted value, if it is numeric.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionUnit" IS 'Assertion Unit - Units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionUnitIRI" IS 'Assertion Unit IRI - An IRI of a controlled vocabulary value for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionUnitVocabulary" IS 'Assertion Unit Vocabulary - A reference to a controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionBy" IS 'Assertion By - A list (concatenated and separated) of names of Agents responsible for making an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionByID" IS 'Assertion By ID - An identifier for an Agent responsible for making an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionProtocols" IS 'Assertion Protocols - Names of, references to, or descriptions of Protocols used in making an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionProtocolID" IS 'Assertion Protocol ID - An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionReferences" IS 'Assertion References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionRemarks" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: nucleotide-sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."nucleotide-sequence" (
    "nucleotideSequenceID" text NOT NULL,
    "nucleotideSequence" text,
    "nucleotideSequenceRemarks" text
);


ALTER TABLE public."nucleotide-sequence" OWNER TO postgres;

--
-- Name: TABLE "nucleotide-sequence"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."nucleotide-sequence" IS 'Nucleotide Sequence Remarks - Comments or notes about a NucleotideSequence.';


--
-- Name: COLUMN "nucleotide-sequence"."nucleotideSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-sequence"."nucleotideSequenceID" IS 'Nucleotide Sequence ID - An identifier for a NucleotideSequence.';


--
-- Name: COLUMN "nucleotide-sequence"."nucleotideSequence"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-sequence"."nucleotideSequence" IS 'Nucleotide Sequence - A string representing nucleotide base pairs.';


--
-- Name: COLUMN "nucleotide-sequence"."nucleotideSequenceRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-sequence"."nucleotideSequenceRemarks" IS 'Nucleotide Sequence Remarks - Comments or notes about a NucleotideSequence.';


--
-- Name: occurrence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.occurrence (
    "occurrenceID" text NOT NULL,
    "eventID" text NOT NULL,
    "surveyTargetID" text,
    "recordedBy" text,
    "recordedByID" text,
    "organismQuantity" text,
    "organismQuantityType" text,
    sex text,
    "lifeStage" text,
    "reproductiveCondition" text,
    caste text,
    behavior text,
    vitality text,
    "establishmentMeans" text,
    "degreeOfEstablishment" text,
    pathway text,
    "occurrenceStatus" text,
    "occurrenceReferences" text,
    "informationWithheld" text,
    "dataGeneralizations" text,
    "occurrenceRemarks" text,
    "organismID" text,
    "organismScope" text,
    "organismName" text,
    "organismRemarks" text,
    "verbatimIdentification" text,
    "taxonFormula" text,
    "identifiedBy" text,
    "identifiedByID" text,
    "dateIdentified" text,
    "identificationReferences" text,
    "identificationVerificationStatus" text,
    "identificationRemarks" text,
    "taxonID" text,
    "higherClassificationName" text,
    "higherClassificationRank" text,
    "scientificName" text,
    "taxonRank" text,
    "taxonRemarks" text
);


ALTER TABLE public.occurrence OWNER TO postgres;

--
-- Name: TABLE occurrence; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.occurrence IS 'Taxon Remarks - Comments or notes about a dwc:Taxon.';


--
-- Name: COLUMN occurrence."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."occurrenceID" IS 'Occurrence ID - An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN occurrence."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN occurrence."surveyTargetID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."surveyTargetID" IS 'Survey Target ID - An identifier for a SurveyTarget.';


--
-- Name: COLUMN occurrence."recordedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."recordedBy" IS 'Recorded By - A list (concatenated and separated) of names of Agents responsible for recording a dwc:Occurrence.';


--
-- Name: COLUMN occurrence."recordedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."recordedByID" IS 'Recorded By ID - An identifier for the Agent responsible for recording a dwc:Occurrence.';


--
-- Name: COLUMN occurrence."organismQuantity"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismQuantity" IS 'Organism Quantity - A number or enumeration value for the quantity of dwc:Organisms.';


--
-- Name: COLUMN occurrence."organismQuantityType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismQuantityType" IS 'Organism Quantity Type - A type of quantification system used for the quantity of dwc:Organisms.';


--
-- Name: COLUMN occurrence.sex; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.sex IS 'Sex - A sex of a dwc:Organism.';


--
-- Name: COLUMN occurrence."lifeStage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."lifeStage" IS 'Life Stage - An age class or life stage of a dwc:Organism.';


--
-- Name: COLUMN occurrence."reproductiveCondition"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."reproductiveCondition" IS 'Reproductive Condition - A reproductive condition of a dwc:Organism.';


--
-- Name: COLUMN occurrence.caste; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.caste IS 'Caste - A social caste of a dwc:Organism.';


--
-- Name: COLUMN occurrence.behavior; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.behavior IS 'Behavior - A behavior shown by a dwc:Organism.';


--
-- Name: COLUMN occurrence.vitality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.vitality IS 'Vitality - An indication of whether a dwc:Organism was alive or dead at the time of collection or observation.';


--
-- Name: COLUMN occurrence."establishmentMeans"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."establishmentMeans" IS 'Establishment Means - Statement about whether a dwc:Organism has been introduced to a given place and time through the direct or indirect activity of modern humans.';


--
-- Name: COLUMN occurrence."degreeOfEstablishment"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."degreeOfEstablishment" IS 'Degree Of Establishment - The degree to which a dwc:Organism survives, reproduces, and expands its range at a given place and time.';


--
-- Name: COLUMN occurrence.pathway; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.pathway IS 'Pathway - A process by which a dwc:Organism came to be in a given place at a given time.';


--
-- Name: COLUMN occurrence."occurrenceStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."occurrenceStatus" IS 'Occurrence Status - A statement about the detection or non-detection of a dwc:Organism.';


--
-- Name: COLUMN occurrence."occurrenceReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."occurrenceReferences" IS 'Occurrence References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a dwc:Occurrence.';


--
-- Name: COLUMN occurrence."informationWithheld"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."informationWithheld" IS 'Information Withheld - Additional information that exists, but that has not been shared in the given record.';


--
-- Name: COLUMN occurrence."dataGeneralizations"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."dataGeneralizations" IS 'Data Generalizations - Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- Name: COLUMN occurrence."occurrenceRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."occurrenceRemarks" IS 'Occurrence Remarks - Comments or notes about a dwc:Occurrence.';


--
-- Name: COLUMN occurrence."organismID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismID" IS 'Organism ID - An identifier for a dwc:Organism.';


--
-- Name: COLUMN occurrence."organismScope"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismScope" IS 'Organism Scope - A description of the type of dwc:Organism instance.';


--
-- Name: COLUMN occurrence."organismName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismName" IS 'Organism Name - A name or label assigned to a dwc:Organism.';


--
-- Name: COLUMN occurrence."organismRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismRemarks" IS 'Organism Remarks - Comments or notes about a dwc:Organism.';


--
-- Name: COLUMN occurrence."verbatimIdentification"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."verbatimIdentification" IS 'Verbatim Identification - A string representing a taxonomic identification as it appeared in the original record.';


--
-- Name: COLUMN occurrence."taxonFormula"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."taxonFormula" IS 'Taxon Formula - A string representing the pattern to use to construct a dwc:Identification from dwc:Taxon names and identification qualifiers.';


--
-- Name: COLUMN occurrence."identifiedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identifiedBy" IS 'Identified By - A list (concatenated and separated) of names of Agents responsible for making a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN occurrence."identifiedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identifiedByID" IS 'Identified By ID - An identifier for the Agent responsible for making a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN occurrence."dateIdentified"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."dateIdentified" IS 'Date Identified - A date on which the subject was determined as representing a dwc:Taxon.';


--
-- Name: COLUMN occurrence."identificationReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identificationReferences" IS 'Identification References - A list (concatenated and separated) of identifiers for References (publication, bibliographic reference, global unique identifier, URI, metabarcoding reference database) used in a dwc:Identification.';


--
-- Name: COLUMN occurrence."identificationVerificationStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identificationVerificationStatus" IS 'Identification Verification Status - A categorical indicator of the extent to which a taxonomic determination has been verified to be correct.';


--
-- Name: COLUMN occurrence."identificationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identificationRemarks" IS 'Identification Remarks - Comments or notes about a dwc:Identification.';


--
-- Name: COLUMN occurrence."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."taxonID" IS 'Taxon ID - An identifier for a dwc:Taxon.';


--
-- Name: COLUMN occurrence."higherClassificationName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."higherClassificationName" IS 'Higher Classification Name - A full scientific name at a higher rank than the taxonRank of a dwc:scientificName.';


--
-- Name: COLUMN occurrence."higherClassificationRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."higherClassificationRank" IS 'Higher Classification Rank - A taxonomic rank of a higherClassificationName.';


--
-- Name: COLUMN occurrence."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."scientificName" IS 'Scientific Name - A full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- Name: COLUMN occurrence."taxonRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."taxonRank" IS 'Taxon Rank - A taxonomic rank of the most specific name in a dwc:scientificName.';


--
-- Name: COLUMN occurrence."taxonRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."taxonRemarks" IS 'Taxon Remarks - Comments or notes about a dwc:Taxon.';


--
-- Name: occurrence-agent-role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."occurrence-agent-role" (
    "agentID" text NOT NULL,
    "occurrenceID" text NOT NULL,
    "agentRole" text,
    "agentRoleIRI" text,
    "agentRoleVocabulary" text,
    "agentRoleOrder" integer,
    "agentRoleDate" text,
    CONSTRAINT "occurrence-agent-role_agentRoleOrder_check" CHECK (("agentRoleOrder" >= 1))
);


ALTER TABLE public."occurrence-agent-role" OWNER TO postgres;

--
-- Name: TABLE "occurrence-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-agent-role" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "occurrence-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "occurrence-agent-role"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."occurrenceID" IS 'Occurrence ID - An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN "occurrence-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRole" IS 'Agent Role - A category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "occurrence-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRoleIRI" IS 'Agent Role IRI - An IRI of the controlled vocabulary value for a role of an Agent.';


--
-- Name: COLUMN "occurrence-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRoleVocabulary" IS 'Agent Role Vocabulary - A reference to a controlled vocabulary in which the definition of a value in agentRole is given.';


--
-- Name: COLUMN "occurrence-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRoleOrder" IS 'Agent Role Order - A numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "occurrence-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRoleDate" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: occurrence-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."occurrence-assertion" (
    "assertionID" text NOT NULL,
    "occurrenceID" text NOT NULL,
    "assertionType" text,
    "assertionTypeIRI" text,
    "assertionTypeVocabulary" text,
    "assertionMadeDate" text,
    "assertionEffectiveDate" text,
    "assertionValue" text,
    "assertionValueIRI" text,
    "assertionValueVocabulary" text,
    "assertionValueNumeric" numeric,
    "assertionUnit" text,
    "assertionUnitIRI" text,
    "assertionUnitVocabulary" text,
    "assertionBy" text,
    "assertionByID" text,
    "assertionProtocols" text,
    "assertionProtocolID" text,
    "assertionReferences" text,
    "assertionRemarks" text
);


ALTER TABLE public."occurrence-assertion" OWNER TO postgres;

--
-- Name: TABLE "occurrence-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-assertion" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionID" IS 'Assertion ID - An identifier for an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."occurrenceID" IS 'Occurrence ID - An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN "occurrence-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionType" IS 'Assertion Type - A category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionTypeIRI" IS 'Assertion Type IRI - An IRI of a controlled vocabulary value for a type of Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionTypeVocabulary" IS 'Assertion Type Vocabulary - A reference to the controlled vocabulary in which the definition of a value in assertionType is given.';


--
-- Name: COLUMN "occurrence-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionMadeDate" IS 'Assertion Made Date - A date on which an Assertion was created.';


--
-- Name: COLUMN "occurrence-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionEffectiveDate" IS 'Assertion Effective Date - A date on which a state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "occurrence-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionValue" IS 'Assertion Value - An asserted value, if it is not numeric.';


--
-- Name: COLUMN "occurrence-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionValueIRI" IS 'Assertion Value IRI - An IRI of the controlled vocabulary value for a value of an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionValueVocabulary" IS 'Assertion Value Vocabulary - A reference to a controlled vocabulary in which the definition of a value in assertionValue is given.';


--
-- Name: COLUMN "occurrence-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionValueNumeric" IS 'Assertion Value Numeric - An asserted value, if it is numeric.';


--
-- Name: COLUMN "occurrence-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionUnit" IS 'Assertion Unit - Units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "occurrence-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionUnitIRI" IS 'Assertion Unit IRI - An IRI of a controlled vocabulary value for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "occurrence-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionUnitVocabulary" IS 'Assertion Unit Vocabulary - A reference to a controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "occurrence-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionBy" IS 'Assertion By - A list (concatenated and separated) of names of Agents responsible for making an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionByID" IS 'Assertion By ID - An identifier for an Agent responsible for making an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionProtocols" IS 'Assertion Protocols - Names of, references to, or descriptions of Protocols used in making an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionProtocolID" IS 'Assertion Protocol ID - An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionReferences" IS 'Assertion References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionRemarks" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: occurrence-identifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."occurrence-identifier" (
    identifier text NOT NULL,
    "occurrenceID" text NOT NULL,
    "identifierType" text,
    "identifierTypeIRI" text,
    "identifierTypeVocabulary" text,
    "identifierLanguage" text
);


ALTER TABLE public."occurrence-identifier" OWNER TO postgres;

--
-- Name: TABLE "occurrence-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-identifier" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: COLUMN "occurrence-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier".identifier IS 'Identifier - An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "occurrence-identifier"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."occurrenceID" IS 'Occurrence ID - An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN "occurrence-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."identifierType" IS 'Identifier Type - A category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "occurrence-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."identifierTypeIRI" IS 'Identifier Type IRI - An IRI of a controlled vocabulary value for the type of Identifier.';


--
-- Name: COLUMN "occurrence-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."identifierTypeVocabulary" IS 'Identifier Type Vocabulary - A reference to a controlled vocabulary in which the definition of a value in identifierType is given.';


--
-- Name: COLUMN "occurrence-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."identifierLanguage" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: occurrence-media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."occurrence-media" (
    "mediaID" text NOT NULL,
    "occurrenceID" text NOT NULL,
    "mediaSubjectCategory" text,
    "mediaSubjectCategoryIRI" text,
    "mediaSubjectCategoryVocabulary" text
);


ALTER TABLE public."occurrence-media" OWNER TO postgres;

--
-- Name: TABLE "occurrence-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-media" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "occurrence-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN "occurrence-media"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."occurrenceID" IS 'Occurrence ID - An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN "occurrence-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."mediaSubjectCategory" IS 'Media Subject Category - A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "occurrence-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."mediaSubjectCategoryIRI" IS 'Media Subject Category IRI - An IRI of a controlled vocabulary value for the subject category of a Media instance.';


--
-- Name: COLUMN "occurrence-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."mediaSubjectCategoryVocabulary" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: occurrence-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."occurrence-protocol" (
    "protocolID" text NOT NULL,
    "occurrenceID" text NOT NULL
);


ALTER TABLE public."occurrence-protocol" OWNER TO postgres;

--
-- Name: TABLE "occurrence-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-protocol" IS 'Occurrence ID - An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN "occurrence-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-protocol"."protocolID" IS 'Protocol ID - An identifier for a Protocol.';


--
-- Name: COLUMN "occurrence-protocol"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-protocol"."occurrenceID" IS 'Occurrence ID - An identifier for a dwc:Occurrence.';


--
-- Name: occurrence-reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."occurrence-reference" (
    "referenceID" text NOT NULL,
    "occurrenceID" text NOT NULL
);


ALTER TABLE public."occurrence-reference" OWNER TO postgres;

--
-- Name: TABLE "occurrence-reference"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-reference" IS 'Occurrence ID - An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN "occurrence-reference"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-reference"."referenceID" IS 'Reference ID - An identifier for a Reference.';


--
-- Name: COLUMN "occurrence-reference"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-reference"."occurrenceID" IS 'Occurrence ID - An identifier for a dwc:Occurrence.';


--
-- Name: organism-interaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."organism-interaction" (
    "organismInteractionID" text NOT NULL,
    "eventID" text NOT NULL,
    "organismInteractionDescription" text,
    "subjectOccurrenceID" text NOT NULL,
    "subjectOrganismPart" text,
    "organismInteractionType" text,
    "relatedOccurrenceID" text NOT NULL,
    "relatedOrganismPart" text
);


ALTER TABLE public."organism-interaction" OWNER TO postgres;

--
-- Name: TABLE "organism-interaction"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."organism-interaction" IS 'Related Organism Part - A part of a object dwc:Organism involved in an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."organismInteractionID" IS 'Organism Interaction ID - An identifier for an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN "organism-interaction"."organismInteractionDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."organismInteractionDescription" IS 'Organism Interaction Description - A verbatim description of an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."subjectOccurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."subjectOccurrenceID" IS 'Subject Occurrence ID - An identifier for a subject dwc:Occurrence in an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."subjectOrganismPart"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."subjectOrganismPart" IS 'Subject Organism Part - A part of a subject dwc:Organism involved in an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."organismInteractionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."organismInteractionType" IS 'Organism Interaction Type - A category that best matches the nature of an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."relatedOccurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."relatedOccurrenceID" IS 'Related Occurrence ID - An identifier for a related dwc:Occurrence in an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."relatedOrganismPart"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."relatedOrganismPart" IS 'Related Organism Part - A part of a object dwc:Organism involved in an OrganismInteraction.';


--
-- Name: organism-interaction-agent-role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."organism-interaction-agent-role" (
    "agentID" text NOT NULL,
    "organismInteractionID" text NOT NULL,
    "agentRole" text,
    "agentRoleIRI" text,
    "agentRoleVocabulary" text,
    "agentRoleOrder" integer,
    "agentRoleDate" text,
    CONSTRAINT "organism-interaction-agent-role_agentRoleOrder_check" CHECK (("agentRoleOrder" >= 1))
);


ALTER TABLE public."organism-interaction-agent-role" OWNER TO postgres;

--
-- Name: TABLE "organism-interaction-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."organism-interaction-agent-role" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "organism-interaction-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "organism-interaction-agent-role"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."organismInteractionID" IS 'Organism Interaction ID - An identifier for an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRole" IS 'Agent Role - A category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "organism-interaction-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRoleIRI" IS 'Agent Role IRI - An IRI of the controlled vocabulary value for a role of an Agent.';


--
-- Name: COLUMN "organism-interaction-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRoleVocabulary" IS 'Agent Role Vocabulary - A reference to a controlled vocabulary in which the definition of a value in agentRole is given.';


--
-- Name: COLUMN "organism-interaction-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRoleOrder" IS 'Agent Role Order - A numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "organism-interaction-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRoleDate" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: organism-interaction-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."organism-interaction-assertion" (
    "assertionID" text NOT NULL,
    "organismInteractionID" text NOT NULL,
    "assertionType" text,
    "assertionTypeIRI" text,
    "assertionTypeVocabulary" text,
    "assertionMadeDate" text,
    "assertionEffectiveDate" text,
    "assertionValue" text,
    "assertionValueIRI" text,
    "assertionValueVocabulary" text,
    "assertionValueNumeric" numeric,
    "assertionUnit" text,
    "assertionUnitIRI" text,
    "assertionUnitVocabulary" text,
    "assertionBy" text,
    "assertionByID" text,
    "assertionProtocols" text,
    "assertionProtocolID" text,
    "assertionReferences" text,
    "assertionRemarks" text
);


ALTER TABLE public."organism-interaction-assertion" OWNER TO postgres;

--
-- Name: TABLE "organism-interaction-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."organism-interaction-assertion" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionID" IS 'Assertion ID - An identifier for an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."organismInteractionID" IS 'Organism Interaction ID - An identifier for an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionType" IS 'Assertion Type - A category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionTypeIRI" IS 'Assertion Type IRI - An IRI of a controlled vocabulary value for a type of Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionTypeVocabulary" IS 'Assertion Type Vocabulary - A reference to the controlled vocabulary in which the definition of a value in assertionType is given.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionMadeDate" IS 'Assertion Made Date - A date on which an Assertion was created.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionEffectiveDate" IS 'Assertion Effective Date - A date on which a state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionValue" IS 'Assertion Value - An asserted value, if it is not numeric.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionValueIRI" IS 'Assertion Value IRI - An IRI of the controlled vocabulary value for a value of an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionValueVocabulary" IS 'Assertion Value Vocabulary - A reference to a controlled vocabulary in which the definition of a value in assertionValue is given.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionValueNumeric" IS 'Assertion Value Numeric - An asserted value, if it is numeric.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionUnit" IS 'Assertion Unit - Units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionUnitIRI" IS 'Assertion Unit IRI - An IRI of a controlled vocabulary value for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionUnitVocabulary" IS 'Assertion Unit Vocabulary - A reference to a controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionBy" IS 'Assertion By - A list (concatenated and separated) of names of Agents responsible for making an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionByID" IS 'Assertion By ID - An identifier for an Agent responsible for making an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionProtocols" IS 'Assertion Protocols - Names of, references to, or descriptions of Protocols used in making an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionProtocolID" IS 'Assertion Protocol ID - An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionReferences" IS 'Assertion References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionRemarks" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: organism-interaction-media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."organism-interaction-media" (
    "mediaID" text NOT NULL,
    "organismInteractionID" text NOT NULL,
    "mediaSubjectCategory" text,
    "mediaSubjectCategoryIRI" text,
    "mediaSubjectCategoryVocabulary" text
);


ALTER TABLE public."organism-interaction-media" OWNER TO postgres;

--
-- Name: TABLE "organism-interaction-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."organism-interaction-media" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "organism-interaction-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN "organism-interaction-media"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."organismInteractionID" IS 'Organism Interaction ID - An identifier for an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."mediaSubjectCategory" IS 'Media Subject Category - A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "organism-interaction-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."mediaSubjectCategoryIRI" IS 'Media Subject Category IRI - An IRI of a controlled vocabulary value for the subject category of a Media instance.';


--
-- Name: COLUMN "organism-interaction-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."mediaSubjectCategoryVocabulary" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: organism-interaction-reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."organism-interaction-reference" (
    "referenceID" text NOT NULL,
    "organismInteractionID" text NOT NULL
);


ALTER TABLE public."organism-interaction-reference" OWNER TO postgres;

--
-- Name: TABLE "organism-interaction-reference"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."organism-interaction-reference" IS 'Organism Interaction ID - An identifier for an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction-reference"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-reference"."referenceID" IS 'Reference ID - An identifier for a Reference.';


--
-- Name: COLUMN "organism-interaction-reference"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-reference"."organismInteractionID" IS 'Organism Interaction ID - An identifier for an OrganismInteraction.';


--
-- Name: phylogenetic-tree; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."phylogenetic-tree" (
    "phylogeneticTreeID" text NOT NULL,
    "phylogeneticTreeProtocol" text,
    "phylogeneticTreeProtocolID" text,
    "phylogeneticTreeReference" text,
    "phylogeneticTreeRemarks" text
);


ALTER TABLE public."phylogenetic-tree" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree" IS 'Phylogenetic Tree Remarks - Comments or notes about a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeID" IS 'Phylogenetic Tree ID - An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeProtocol" IS 'Phylogenetic Tree Protocol - A description of or reference to the Protocol used to make a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeProtocolID" IS 'Phylogenetic Tree Protocol ID - An identifier for a Protocol used to make a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeReference"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeReference" IS 'Phylogenetic Tree Reference - A bibliographic reference in which a PhylogeneticTree is mentioned.';


--
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeRemarks" IS 'Phylogenetic Tree Remarks - Comments or notes about a PhylogeneticTree.';


--
-- Name: phylogenetic-tree-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."phylogenetic-tree-assertion" (
    "assertionID" text NOT NULL,
    "phylogeneticTreeID" text NOT NULL,
    "assertionType" text,
    "assertionTypeIRI" text,
    "assertionTypeVocabulary" text,
    "assertionMadeDate" text,
    "assertionEffectiveDate" text,
    "assertionValue" text,
    "assertionValueIRI" text,
    "assertionValueVocabulary" text,
    "assertionValueNumeric" numeric,
    "assertionUnit" text,
    "assertionUnitIRI" text,
    "assertionUnitVocabulary" text,
    "assertionBy" text,
    "assertionByID" text,
    "assertionProtocols" text,
    "assertionProtocolID" text,
    "assertionReferences" text,
    "assertionRemarks" text
);


ALTER TABLE public."phylogenetic-tree-assertion" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-assertion" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionID" IS 'Assertion ID - An identifier for an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."phylogeneticTreeID" IS 'Phylogenetic Tree ID - An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionType" IS 'Assertion Type - A category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionTypeIRI" IS 'Assertion Type IRI - An IRI of a controlled vocabulary value for a type of Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionTypeVocabulary" IS 'Assertion Type Vocabulary - A reference to the controlled vocabulary in which the definition of a value in assertionType is given.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionMadeDate" IS 'Assertion Made Date - A date on which an Assertion was created.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionEffectiveDate" IS 'Assertion Effective Date - A date on which a state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionValue" IS 'Assertion Value - An asserted value, if it is not numeric.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionValueIRI" IS 'Assertion Value IRI - An IRI of the controlled vocabulary value for a value of an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionValueVocabulary" IS 'Assertion Value Vocabulary - A reference to a controlled vocabulary in which the definition of a value in assertionValue is given.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionValueNumeric" IS 'Assertion Value Numeric - An asserted value, if it is numeric.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionUnit" IS 'Assertion Unit - Units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionUnitIRI" IS 'Assertion Unit IRI - An IRI of a controlled vocabulary value for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionUnitVocabulary" IS 'Assertion Unit Vocabulary - A reference to a controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionBy" IS 'Assertion By - A list (concatenated and separated) of names of Agents responsible for making an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionByID" IS 'Assertion By ID - An identifier for an Agent responsible for making an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionProtocols" IS 'Assertion Protocols - Names of, references to, or descriptions of Protocols used in making an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionProtocolID" IS 'Assertion Protocol ID - An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionReferences" IS 'Assertion References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionRemarks" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: phylogenetic-tree-identifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."phylogenetic-tree-identifier" (
    identifier text NOT NULL,
    "phylogeneticTreeID" text NOT NULL,
    "identifierType" text,
    "identifierTypeIRI" text,
    "identifierTypeVocabulary" text,
    "identifierLanguage" text
);


ALTER TABLE public."phylogenetic-tree-identifier" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-identifier" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: COLUMN "phylogenetic-tree-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier".identifier IS 'Identifier - An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "phylogenetic-tree-identifier"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."phylogeneticTreeID" IS 'Phylogenetic Tree ID - An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."identifierType" IS 'Identifier Type - A category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "phylogenetic-tree-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."identifierTypeIRI" IS 'Identifier Type IRI - An IRI of a controlled vocabulary value for the type of Identifier.';


--
-- Name: COLUMN "phylogenetic-tree-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."identifierTypeVocabulary" IS 'Identifier Type Vocabulary - A reference to a controlled vocabulary in which the definition of a value in identifierType is given.';


--
-- Name: COLUMN "phylogenetic-tree-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."identifierLanguage" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: phylogenetic-tree-media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."phylogenetic-tree-media" (
    "mediaID" text NOT NULL,
    "phylogeneticTreeID" text NOT NULL,
    "mediaSubjectCategory" text,
    "mediaSubjectCategoryIRI" text,
    "mediaSubjectCategoryVocabulary" text
);


ALTER TABLE public."phylogenetic-tree-media" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-media" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "phylogenetic-tree-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."mediaID" IS 'Media ID - An identifier for a Media instance.';


--
-- Name: COLUMN "phylogenetic-tree-media"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."phylogeneticTreeID" IS 'Phylogenetic Tree ID - An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."mediaSubjectCategory" IS 'Media Subject Category - A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "phylogenetic-tree-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."mediaSubjectCategoryIRI" IS 'Media Subject Category IRI - An IRI of a controlled vocabulary value for the subject category of a Media instance.';


--
-- Name: COLUMN "phylogenetic-tree-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."mediaSubjectCategoryVocabulary" IS 'Media Subject Category Vocabulary - Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: phylogenetic-tree-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."phylogenetic-tree-protocol" (
    "protocolID" text NOT NULL,
    "phylogeneticTreeID" text NOT NULL
);


ALTER TABLE public."phylogenetic-tree-protocol" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-protocol" IS 'Phylogenetic Tree ID - An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-protocol"."protocolID" IS 'Protocol ID - An identifier for a Protocol.';


--
-- Name: COLUMN "phylogenetic-tree-protocol"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-protocol"."phylogeneticTreeID" IS 'Phylogenetic Tree ID - An identifier for a PhylogeneticTree.';


--
-- Name: phylogenetic-tree-reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."phylogenetic-tree-reference" (
    "referenceID" text NOT NULL,
    "phylogeneticTreeID" text NOT NULL
);


ALTER TABLE public."phylogenetic-tree-reference" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree-reference"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-reference" IS 'Phylogenetic Tree ID - An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree-reference"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-reference"."referenceID" IS 'Reference ID - An identifier for a Reference.';


--
-- Name: COLUMN "phylogenetic-tree-reference"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-reference"."phylogeneticTreeID" IS 'Phylogenetic Tree ID - An identifier for a PhylogeneticTree.';


--
-- Name: phylogenetic-tree-tip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."phylogenetic-tree-tip" (
    "phylogeneticTreeTipID" text NOT NULL,
    "phylogeneticTreeID" text NOT NULL,
    "phylogeneticTreeTipLabel" text,
    "taxonID" text,
    "scientificName" text,
    "materialEntityID" text NOT NULL,
    "nucleotideSequenceID" text NOT NULL
);


ALTER TABLE public."phylogenetic-tree-tip" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree-tip"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-tip" IS 'Nucleotide Sequence ID - An identifier for a NucleotideSequence.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."phylogeneticTreeTipID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."phylogeneticTreeTipID" IS 'Phylogenetic Tree Tip ID - An identifier for a PhylogeneticTreeTip.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."phylogeneticTreeID" IS 'Phylogenetic Tree ID - An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."phylogeneticTreeTipLabel"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."phylogeneticTreeTipLabel" IS 'Phylogenetic Tree Tip Label - A label applied to a PhylogeneticTreeTip.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."taxonID" IS 'Taxon ID - An identifier for a dwc:Taxon.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."scientificName" IS 'Scientific Name - A full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."materialEntityID" IS 'Material Entity ID - An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."nucleotideSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."nucleotideSequenceID" IS 'Nucleotide Sequence ID - An identifier for a NucleotideSequence.';


--
-- Name: phylogenetic-tree-tip-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."phylogenetic-tree-tip-assertion" (
    "assertionID" text NOT NULL,
    "phylogeneticTreeTipID" text NOT NULL,
    "assertionType" text,
    "assertionTypeIRI" text,
    "assertionTypeVocabulary" text,
    "assertionMadeDate" text,
    "assertionEffectiveDate" text,
    "assertionValue" text,
    "assertionValueIRI" text,
    "assertionValueVocabulary" text,
    "assertionValueNumeric" numeric,
    "assertionUnit" text,
    "assertionUnitIRI" text,
    "assertionUnitVocabulary" text,
    "assertionBy" text,
    "assertionByID" text,
    "assertionProtocols" text,
    "assertionProtocolID" text,
    "assertionReferences" text,
    "assertionRemarks" text
);


ALTER TABLE public."phylogenetic-tree-tip-assertion" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree-tip-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-tip-assertion" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionID" IS 'Assertion ID - An identifier for an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."phylogeneticTreeTipID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."phylogeneticTreeTipID" IS 'Phylogenetic Tree Tip ID - An identifier for a PhylogeneticTreeTip.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionType" IS 'Assertion Type - A category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionTypeIRI" IS 'Assertion Type IRI - An IRI of a controlled vocabulary value for a type of Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionTypeVocabulary" IS 'Assertion Type Vocabulary - A reference to the controlled vocabulary in which the definition of a value in assertionType is given.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionMadeDate" IS 'Assertion Made Date - A date on which an Assertion was created.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionEffectiveDate" IS 'Assertion Effective Date - A date on which a state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionValue" IS 'Assertion Value - An asserted value, if it is not numeric.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionValueIRI" IS 'Assertion Value IRI - An IRI of the controlled vocabulary value for a value of an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionValueVocabulary" IS 'Assertion Value Vocabulary - A reference to a controlled vocabulary in which the definition of a value in assertionValue is given.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionValueNumeric" IS 'Assertion Value Numeric - An asserted value, if it is numeric.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionUnit" IS 'Assertion Unit - Units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionUnitIRI" IS 'Assertion Unit IRI - An IRI of a controlled vocabulary value for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionUnitVocabulary" IS 'Assertion Unit Vocabulary - A reference to a controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionBy" IS 'Assertion By - A list (concatenated and separated) of names of Agents responsible for making an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionByID" IS 'Assertion By ID - An identifier for an Agent responsible for making an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionProtocols" IS 'Assertion Protocols - Names of, references to, or descriptions of Protocols used in making an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionProtocolID" IS 'Assertion Protocol ID - An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionReferences" IS 'Assertion References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionRemarks" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol (
    "protocolID" text NOT NULL,
    "protocolType" text,
    "protocolTypeIRI" text,
    "protocolTypeVocabulary" text,
    "protocolName" text,
    "protocolDescription" text,
    "protocolReference" text,
    "protocolRemarks" text
);


ALTER TABLE public.protocol OWNER TO postgres;

--
-- Name: TABLE protocol; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.protocol IS 'Protocol Remarks - Comments or notes about a Protocol.';


--
-- Name: COLUMN protocol."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolID" IS 'Protocol ID - An identifier for a Protocol.';


--
-- Name: COLUMN protocol."protocolType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolType" IS 'Protocol Type - A category that best matches the nature of a Protocol.';


--
-- Name: COLUMN protocol."protocolTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolTypeIRI" IS 'Protocol Type IRI - An IRI of a controlled vocabulary value for the type of Protocol.';


--
-- Name: COLUMN protocol."protocolTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolTypeVocabulary" IS 'Protocol Type Vocabulary - A reference to a controlled vocabulary in which the definition of a value in protocolType is given.';


--
-- Name: COLUMN protocol."protocolName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolName" IS 'Protocol Name - A name of a Protocol.';


--
-- Name: COLUMN protocol."protocolDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolDescription" IS 'Protocol Description - A description of a Protocol.';


--
-- Name: COLUMN protocol."protocolReference"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolReference" IS 'Protocol Reference - A bibliographic reference in which a Protocol is mentioned.';


--
-- Name: COLUMN protocol."protocolRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolRemarks" IS 'Protocol Remarks - Comments or notes about a Protocol.';


--
-- Name: protocol-reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."protocol-reference" (
    "referenceID" text NOT NULL,
    "protocolID" text NOT NULL
);


ALTER TABLE public."protocol-reference" OWNER TO postgres;

--
-- Name: TABLE "protocol-reference"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."protocol-reference" IS 'Protocol ID - An identifier for a Protocol.';


--
-- Name: COLUMN "protocol-reference"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-reference"."referenceID" IS 'Reference ID - An identifier for a Reference.';


--
-- Name: COLUMN "protocol-reference"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-reference"."protocolID" IS 'Protocol ID - An identifier for a Protocol.';


--
-- Name: reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reference (
    "referenceID" text NOT NULL,
    "parentReferenceID" text,
    "referenceType" text,
    "bibliographicCitation" text,
    title text,
    issued text,
    identifier text,
    creator text,
    "creatorID" text,
    publisher text,
    "publisherID" text,
    pagination text,
    "isPeerReviewed" boolean,
    "referenceRemarks" text
);


ALTER TABLE public.reference OWNER TO postgres;

--
-- Name: TABLE reference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.reference IS 'Reference Remarks - Comments or notes about a Reference.';


--
-- Name: COLUMN reference."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference."referenceID" IS 'Reference ID - An identifier for a Reference.';


--
-- Name: COLUMN reference."parentReferenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference."parentReferenceID" IS 'Parent Reference ID - An identifier for a Reference that includes this Reference.';


--
-- Name: COLUMN reference."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference."referenceType" IS 'Reference Type - A category that best matches the nature of a Reference.';


--
-- Name: COLUMN reference."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference."bibliographicCitation" IS 'Bibliographic Citation - A bibliographic reference for the resource.';


--
-- Name: COLUMN reference.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference.title IS 'Title - A name given to the resource.';


--
-- Name: COLUMN reference.issued; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference.issued IS 'Issued - Date of formal issuance of the resource.';


--
-- Name: COLUMN reference.identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference.identifier IS 'Identifier - An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN reference.creator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference.creator IS 'Creator - An entity primarily responsible for making the resource.';


--
-- Name: COLUMN reference."creatorID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference."creatorID" IS 'Creator ID - An entity primarily responsible for making the resource.';


--
-- Name: COLUMN reference.publisher; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference.publisher IS 'Publisher - An entity responsible for making the resource available.';


--
-- Name: COLUMN reference."publisherID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference."publisherID" IS 'Publisher ID - An entity responsible for making the resource available.';


--
-- Name: COLUMN reference.pagination; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference.pagination IS 'Pagination - Any description of pages that is not separated into pageStart and pageEnd.';


--
-- Name: COLUMN reference."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference."isPeerReviewed" IS 'Is Peer Reviewed - An indication of whether a Reference was peer reviewed.';


--
-- Name: COLUMN reference."referenceRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.reference."referenceRemarks" IS 'Reference Remarks - Comments or notes about a Reference.';


--
-- Name: relationship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relationship (
    "relationshipID" text NOT NULL,
    "subjectResourceID" text NOT NULL,
    "subjectResourceType" text,
    "subjectResourceTypeIRI" text,
    "subjectResourceTypeVocabulary" text,
    "relationshipType" text,
    "relationshipTypeIRI" text,
    "relationshipTypeVocabulary" text,
    "relatedResourceID" text NOT NULL,
    "relatedResourceType" text,
    "relatedResourceTypeIRI" text,
    "relatedResourceTypeVocabulary" text,
    "relationshipOrder" integer,
    "relationshipAccordingTo" text,
    "relationshipAccordingToID" text,
    "relationshipEffectiveDate" text,
    "relationshipRemarks" text,
    CONSTRAINT "relationship_relationshipOrder_check" CHECK (("relationshipOrder" >= 1))
);


ALTER TABLE public.relationship OWNER TO postgres;

--
-- Name: TABLE relationship; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.relationship IS 'Relationship Remarks - Comments or notes about a Relationship.';


--
-- Name: COLUMN relationship."relationshipID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipID" IS 'Relationship ID - An identifier for a Relationship.';


--
-- Name: COLUMN relationship."subjectResourceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."subjectResourceID" IS 'Subject Resource ID - An identifier for the resource that is the subject of a Relationship.';


--
-- Name: COLUMN relationship."subjectResourceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."subjectResourceType" IS 'Subject Resource Type - A category that best matches the nature of a subject resource.';


--
-- Name: COLUMN relationship."subjectResourceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."subjectResourceTypeIRI" IS 'Subject Resource Type IRI - An IRI of a controlled vocabulary value for the type of a subject resource.';


--
-- Name: COLUMN relationship."subjectResourceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."subjectResourceTypeVocabulary" IS 'Subject Resource Type Vocabulary - A reference to a controlled vocabulary in which the definition of a value in subjectResourceType is given.';


--
-- Name: COLUMN relationship."relationshipType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipType" IS 'Relationship Type - A relationship of a subject resource (identified by subjectResourceID) to a related resource (identified by relatedResourceID).';


--
-- Name: COLUMN relationship."relationshipTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipTypeIRI" IS 'Relationship Type IRI - An IRI of a controlled vocabulary value for the type of a Relationship.';


--
-- Name: COLUMN relationship."relationshipTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipTypeVocabulary" IS 'Relationship Type Vocabulary - A reference to a controlled vocabulary in which the definition of a value in relationshipType is given.';


--
-- Name: COLUMN relationship."relatedResourceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relatedResourceID" IS 'Related Resource ID - An identifier for the related resource (the object) of a Relationship.';


--
-- Name: COLUMN relationship."relatedResourceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relatedResourceType" IS 'Related Resource Type - A category that best matches the nature of a related resource.';


--
-- Name: COLUMN relationship."relatedResourceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relatedResourceTypeIRI" IS 'Related Resource Type IRI - An IRI of a controlled vocabulary value for a type of related resource.';


--
-- Name: COLUMN relationship."relatedResourceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relatedResourceTypeVocabulary" IS 'Related Resource Type Vocabulary - A reference to a controlled vocabulary in which the definition of a value in relatedResourceType is given.';


--
-- Name: COLUMN relationship."relationshipOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipOrder" IS 'Relationship Order - A numerical position of a Relationship in a set of Relationships that have the same combination of subjectResourceID, relatedResourceID, relationshipType, relationshipType, and relationshipTypeVocabulary.';


--
-- Name: COLUMN relationship."relationshipAccordingTo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipAccordingTo" IS 'Relationship According To - A name of an Agent responsible for asserting a Relationship.';


--
-- Name: COLUMN relationship."relationshipAccordingToID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipAccordingToID" IS 'Relationship According To ID - An identifier for an Agent responsible for asserting a Relationship.';


--
-- Name: COLUMN relationship."relationshipEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipEffectiveDate" IS 'Relationship Effective Date - A date on which a Relationship was established.';


--
-- Name: COLUMN relationship."relationshipRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipRemarks" IS 'Relationship Remarks - Comments or notes about a Relationship.';


--
-- Name: survey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.survey (
    "surveyID" text NOT NULL,
    "eventID" text NOT NULL,
    "siteCount" integer,
    "siteNestingDescription" text,
    "verbatimSiteDescriptions" text,
    "verbatimSiteNames" text,
    "geospatialScopeAreaValue" numeric,
    "geospatialScopeAreaUnit" text,
    "totalAreaSampledValue" numeric,
    "totalAreaSampledUnit" text,
    "reportedWeather" text,
    "reportedExtremeConditions" text,
    "eventDurationValue" numeric,
    "eventDurationUnit" text,
    "taxonCompletenessReported" text,
    "taxonCompletenessProtocols" text,
    "isAbsenceReported" boolean,
    "absentTaxa" text,
    "hasNonTargetTaxa" boolean,
    "nonTargetTaxa" text,
    "areNonTargetTaxaFullyReported" boolean,
    "hasNonTargetOrganisms" boolean,
    "verbatimTargetScope" text,
    "identifiedBy" text,
    "identifiedByID" text,
    "identificationReferences" text,
    "compilationTypes" text,
    "compilationSourceTypes" text,
    "inventoryTypes" text,
    "protocolNames" text,
    "protocolDescriptions" text,
    "protocolReferences" text,
    "isAbundanceReported" boolean,
    "isAbundanceCapReported" boolean,
    "abundanceCap" integer,
    "isVegetationCoverReported" boolean,
    "isLeastSpecificTargetCategoryQuantityInclusive" boolean,
    "hasVouchers" boolean,
    "voucherInstitutions" text,
    "hasMaterialSamples" boolean,
    "materialSampleTypes" text,
    "sampleSizeValue" text,
    "sampleSizeUnit" text,
    "samplingPerformedBy" text,
    "samplingPerformedByID" text,
    "isSamplingEffortReported" boolean,
    "samplingEffortProtocol" text,
    "samplingEffortProtocolID" text,
    "samplingEffortValue" numeric,
    "samplingEffortUnit" text,
    "informationWithheld" text,
    "dataGeneralizations" text,
    CONSTRAINT "survey_abundanceCap_check" CHECK (("abundanceCap" >= 0)),
    CONSTRAINT "survey_eventDurationValue_check" CHECK (("eventDurationValue" >= (0)::numeric)),
    CONSTRAINT "survey_geospatialScopeAreaValue_check" CHECK (("geospatialScopeAreaValue" >= (0)::numeric)),
    CONSTRAINT "survey_samplingEffortValue_check" CHECK (("samplingEffortValue" >= (0)::numeric)),
    CONSTRAINT "survey_siteCount_check" CHECK (("siteCount" >= 1)),
    CONSTRAINT "survey_totalAreaSampledValue_check" CHECK (("totalAreaSampledValue" >= (0)::numeric))
);


ALTER TABLE public.survey OWNER TO postgres;

--
-- Name: TABLE survey; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.survey IS 'Data Generalizations - Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- Name: COLUMN survey."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."surveyID" IS 'Survey ID - An identifier for a Survey.';


--
-- Name: COLUMN survey."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."eventID" IS 'Event ID - An identifier for a dwc:Event.';


--
-- Name: COLUMN survey."siteCount"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."siteCount" IS 'Site Count - Total number of individual sites surveyed during a dwc:Event.';


--
-- Name: COLUMN survey."siteNestingDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."siteNestingDescription" IS 'Site Nesting Description - Textual description of a hierarchical sampling design.';


--
-- Name: COLUMN survey."verbatimSiteDescriptions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."verbatimSiteDescriptions" IS 'Verbatim Site Descriptions - Original textual description of site(s).';


--
-- Name: COLUMN survey."verbatimSiteNames"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."verbatimSiteNames" IS 'Verbatim Site Names - A list (concatenated and separated) of original site names.';


--
-- Name: COLUMN survey."geospatialScopeAreaValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."geospatialScopeAreaValue" IS 'Geospatial Scope Area Value - The numeric value for the total area of a geospatial scope of a dwc:Event.';


--
-- Name: COLUMN survey."geospatialScopeAreaUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."geospatialScopeAreaUnit" IS 'Geospatial Scope Area Unit - Units associated with a value in eco:geospatialScopeAreaValue.';


--
-- Name: COLUMN survey."totalAreaSampledValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."totalAreaSampledValue" IS 'Total Area Sampled Value - The numeric value for the total area surveyed during a dwc:Event.';


--
-- Name: COLUMN survey."totalAreaSampledUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."totalAreaSampledUnit" IS 'Total Area Sampled Unit - Units associated with a value in eco:totalAreaSampledValue.';


--
-- Name: COLUMN survey."reportedWeather"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."reportedWeather" IS 'Reported Weather - A list of weather or climatic conditions present during a dwc:Event.';


--
-- Name: COLUMN survey."reportedExtremeConditions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."reportedExtremeConditions" IS 'Reported Extreme Conditions - A description of any extreme weather or environmental conditions that may have affected a dwc:Event.';


--
-- Name: COLUMN survey."eventDurationValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."eventDurationValue" IS 'Event Duration Value - The numeric value for the duration of a dwc:Event.';


--
-- Name: COLUMN survey."eventDurationUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."eventDurationUnit" IS 'Event Duration Unit - Units associated with a value in eco:eventDurationValue.';


--
-- Name: COLUMN survey."taxonCompletenessReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."taxonCompletenessReported" IS 'Taxon Completeness Reported - Statement about whether the taxonomic completeness of a dwc:Event was assessed.';


--
-- Name: COLUMN survey."taxonCompletenessProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."taxonCompletenessProtocols" IS 'Taxon Completeness Protocols - A description of or reference to the Protocols used to determine eco:taxonCompletenessReported.';


--
-- Name: COLUMN survey."isAbsenceReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isAbsenceReported" IS 'Is Absence Reported - Taxonomic absences were reported.';


--
-- Name: COLUMN survey."absentTaxa"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."absentTaxa" IS 'Absent Taxa - A list (concatenated and separated) of taxa reported absent during a dwc:Event.';


--
-- Name: COLUMN survey."hasNonTargetTaxa"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."hasNonTargetTaxa" IS 'Has Non Target Taxa - One or more dwc:Organisms of taxa outside the target taxonomic scope (the combination of eco:targetTaxonomicScope and eco:excludedTaxonomicScope) were detected and reported for this dwc:Event.';


--
-- Name: COLUMN survey."nonTargetTaxa"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."nonTargetTaxa" IS 'Non Target Taxa - A list (concatenated and separated) of taxa reported during a dwc:Event that are outside of the target taxonomic scope (the combination of eco:targetTaxonomicScope and eco:excludedTaxonomicScope).';


--
-- Name: COLUMN survey."areNonTargetTaxaFullyReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."areNonTargetTaxaFullyReported" IS 'Are Non Target Taxa Fully Reported - Every dwc:Organism that was outside of the target taxonomic scope (the combination of eco:targetTaxonomicScope and eco:excludedTaxonomicScope) and detected during a dwc:Event, and that was detectable using the given protocol (given in eco:protocolDescriptions and dwc:samplingProtocol), was reported.';


--
-- Name: COLUMN survey."hasNonTargetOrganisms"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."hasNonTargetOrganisms" IS 'Has Non Target Organisms - One or more dwc:Organisms outside the target organismal scopes (eco:targetDegreeOfEstablishmentScope, eco:targetGrowthFormScope, and eco:targetLifeStageScope) were detected and reported for this dwc:Event.';


--
-- Name: COLUMN survey."verbatimTargetScope"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."verbatimTargetScope" IS 'Verbatim Target Scope - A verbatim original description of a dwc:Event scope.';


--
-- Name: COLUMN survey."identifiedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."identifiedBy" IS 'Identified By - A list (concatenated and separated) of names of Agents responsible for making a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN survey."identifiedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."identifiedByID" IS 'Identified By ID - An identifier for an Agent responsible for making a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN survey."identificationReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."identificationReferences" IS 'Identification References - A list (concatenated and separated) of identifiers for References (publication, bibliographic reference, global unique identifier, URI, metabarcoding reference database) used in a dwc:Identification.';


--
-- Name: COLUMN survey."compilationTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."compilationTypes" IS 'Compilation Types - A statement specifying whether data reported are derived from sampling events, ancillary data compiled from other sources, or a combination of both.';


--
-- Name: COLUMN survey."compilationSourceTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."compilationSourceTypes" IS 'Compilation Source Types - The types of data sources contributing to the compilation reported.';


--
-- Name: COLUMN survey."inventoryTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."inventoryTypes" IS 'Inventory Types - The types of search processes used to conduct the inventory.';


--
-- Name: COLUMN survey."protocolNames"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."protocolNames" IS 'Protocol Names - Categorical descriptive names for the Protocols used during a dwc:Event.';


--
-- Name: COLUMN survey."protocolDescriptions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."protocolDescriptions" IS 'Protocol Descriptions - A detailed description of the Protocols used during a dwc:Event.';


--
-- Name: COLUMN survey."protocolReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."protocolReferences" IS 'Protocol References - A list (concatenated and separated) of identifiers for References (publication, bibliographic reference, global unique identifier, URI, metabarcoding reference database) used during a dwc:Event.';


--
-- Name: COLUMN survey."isAbundanceReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isAbundanceReported" IS 'Is Abundance Reported - The number of dwc:Organisms collected or observed was reported.';


--
-- Name: COLUMN survey."isAbundanceCapReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isAbundanceCapReported" IS 'Is Abundance Cap Reported - A maximum number of dwc:Organisms was reported, as specified or restricted by the protocol used.';


--
-- Name: COLUMN survey."abundanceCap"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."abundanceCap" IS 'Abundance Cap - The reported maximum number of dwc:Organisms.';


--
-- Name: COLUMN survey."isVegetationCoverReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isVegetationCoverReported" IS 'Is Vegetation Cover Reported - A vegetation cover metric was reported.';


--
-- Name: COLUMN survey."isLeastSpecificTargetCategoryQuantityInclusive"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isLeastSpecificTargetCategoryQuantityInclusive" IS 'Is Least Specific Target Category Quantity Inclusive - The total detected quantity for a dwc:Taxon (including subcategories thereof) in a dwc:Event is given explicitly in a single record (dwc:organismQuantity value) for that dwc:Taxon.';


--
-- Name: COLUMN survey."hasVouchers"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."hasVouchers" IS 'Has Vouchers - Specimen vouchers were collected during a dwc:Event.';


--
-- Name: COLUMN survey."voucherInstitutions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."voucherInstitutions" IS 'Voucher Institutions - A list (concatenated and separated) of the names or acronyms of the institutions where vouchers collected during a dwc:Event were deposited.';


--
-- Name: COLUMN survey."hasMaterialSamples"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."hasMaterialSamples" IS 'Has Material Samples - Material samples were collected during a dwc:Event.';


--
-- Name: COLUMN survey."materialSampleTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."materialSampleTypes" IS 'Material Sample Types - A list (concatenated and separated) of material sample types collected during a dwc:Event.';


--
-- Name: COLUMN survey."sampleSizeValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."sampleSizeValue" IS 'Sample Size Value - A numeric value for a measurement of the size (time duration, length, area, or volume) of a sample in a sampling dwc:Event.';


--
-- Name: COLUMN survey."sampleSizeUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."sampleSizeUnit" IS 'Sample Size Unit - A unit of measurement of the size (time duration, length, area, or volume) of a sample in a sampling dwc:Event.';


--
-- Name: COLUMN survey."samplingPerformedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingPerformedBy" IS 'Sampling Performed By - An Agent responsible for sampling.';


--
-- Name: COLUMN survey."samplingPerformedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingPerformedByID" IS 'Sampling Performed By ID - An identifier for an Agent responsible for sampling.';


--
-- Name: COLUMN survey."isSamplingEffortReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isSamplingEffortReported" IS 'Is Sampling Effort Reported - The sampling effort associated with a dwc:Event was reported.';


--
-- Name: COLUMN survey."samplingEffortProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingEffortProtocol" IS 'Sampling Effort Protocol - A description of or reference to a Protocol used to determine a eco:samplingEffortValue.';


--
-- Name: COLUMN survey."samplingEffortProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingEffortProtocolID" IS 'Sampling Effort Protocol ID - An identifier for a Protocol used to determine a eco:samplingEffortValue.';


--
-- Name: COLUMN survey."samplingEffortValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingEffortValue" IS 'Sampling Effort Value - The numeric value for the sampling effort expended during a dwc:Event.';


--
-- Name: COLUMN survey."samplingEffortUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingEffortUnit" IS 'Sampling Effort Unit - Units associated with a value in eco:samplingEffortValue.';


--
-- Name: COLUMN survey."informationWithheld"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."informationWithheld" IS 'Information Withheld - Additional information that exists, but that has not been shared in the given record.';


--
-- Name: COLUMN survey."dataGeneralizations"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."dataGeneralizations" IS 'Data Generalizations - Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- Name: survey-agent-role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."survey-agent-role" (
    "agentID" text NOT NULL,
    "surveyID" text NOT NULL,
    "agentRole" text,
    "agentRoleIRI" text,
    "agentRoleVocabulary" text,
    "agentRoleOrder" integer,
    "agentRoleDate" text,
    CONSTRAINT "survey-agent-role_agentRoleOrder_check" CHECK (("agentRoleOrder" >= 1))
);


ALTER TABLE public."survey-agent-role" OWNER TO postgres;

--
-- Name: TABLE "survey-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-agent-role" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "survey-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentID" IS 'Agent ID - An identifier for an Agent.';


--
-- Name: COLUMN "survey-agent-role"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."surveyID" IS 'Survey ID - An identifier for a Survey.';


--
-- Name: COLUMN "survey-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRole" IS 'Agent Role - A category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "survey-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRoleIRI" IS 'Agent Role IRI - An IRI of the controlled vocabulary value for a role of an Agent.';


--
-- Name: COLUMN "survey-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRoleVocabulary" IS 'Agent Role Vocabulary - A reference to a controlled vocabulary in which the definition of a value in agentRole is given.';


--
-- Name: COLUMN "survey-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRoleOrder" IS 'Agent Role Order - A numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "survey-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRoleDate" IS 'Agent Role Date - An interval during which an AgentRole was in effect.';


--
-- Name: survey-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."survey-assertion" (
    "assertionID" text NOT NULL,
    "surveyID" text NOT NULL,
    "assertionType" text,
    "assertionTypeIRI" text,
    "assertionTypeVocabulary" text,
    "assertionMadeDate" text,
    "assertionEffectiveDate" text,
    "assertionValue" text,
    "assertionValueIRI" text,
    "assertionValueVocabulary" text,
    "assertionValueNumeric" numeric,
    "assertionUnit" text,
    "assertionUnitIRI" text,
    "assertionUnitVocabulary" text,
    "assertionBy" text,
    "assertionByID" text,
    "assertionProtocols" text,
    "assertionProtocolID" text,
    "assertionReferences" text,
    "assertionRemarks" text
);


ALTER TABLE public."survey-assertion" OWNER TO postgres;

--
-- Name: TABLE "survey-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-assertion" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionID" IS 'Assertion ID - An identifier for an Assertion.';


--
-- Name: COLUMN "survey-assertion"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."surveyID" IS 'Survey ID - An identifier for a Survey.';


--
-- Name: COLUMN "survey-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionType" IS 'Assertion Type - A category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionTypeIRI" IS 'Assertion Type IRI - An IRI of a controlled vocabulary value for a type of Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionTypeVocabulary" IS 'Assertion Type Vocabulary - A reference to the controlled vocabulary in which the definition of a value in assertionType is given.';


--
-- Name: COLUMN "survey-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionMadeDate" IS 'Assertion Made Date - A date on which an Assertion was created.';


--
-- Name: COLUMN "survey-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionEffectiveDate" IS 'Assertion Effective Date - A date on which a state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "survey-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionValue" IS 'Assertion Value - An asserted value, if it is not numeric.';


--
-- Name: COLUMN "survey-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionValueIRI" IS 'Assertion Value IRI - An IRI of the controlled vocabulary value for a value of an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionValueVocabulary" IS 'Assertion Value Vocabulary - A reference to a controlled vocabulary in which the definition of a value in assertionValue is given.';


--
-- Name: COLUMN "survey-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionValueNumeric" IS 'Assertion Value Numeric - An asserted value, if it is numeric.';


--
-- Name: COLUMN "survey-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionUnit" IS 'Assertion Unit - Units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "survey-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionUnitIRI" IS 'Assertion Unit IRI - An IRI of a controlled vocabulary value for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "survey-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionUnitVocabulary" IS 'Assertion Unit Vocabulary - A reference to a controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "survey-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionBy" IS 'Assertion By - A list (concatenated and separated) of names of Agents responsible for making an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionByID" IS 'Assertion By ID - An identifier for an Agent responsible for making an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionProtocols" IS 'Assertion Protocols - Names of, references to, or descriptions of Protocols used in making an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionProtocolID" IS 'Assertion Protocol ID - An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionReferences" IS 'Assertion References - A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionRemarks" IS 'Assertion Remarks - Comments or notes about an Assertion.';


--
-- Name: survey-identifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."survey-identifier" (
    identifier text NOT NULL,
    "surveyID" text NOT NULL,
    "identifierType" text,
    "identifierTypeIRI" text,
    "identifierTypeVocabulary" text,
    "identifierLanguage" text
);


ALTER TABLE public."survey-identifier" OWNER TO postgres;

--
-- Name: TABLE "survey-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-identifier" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: COLUMN "survey-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier".identifier IS 'Identifier - An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "survey-identifier"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."surveyID" IS 'Survey ID - An identifier for a Survey.';


--
-- Name: COLUMN "survey-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."identifierType" IS 'Identifier Type - A category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "survey-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."identifierTypeIRI" IS 'Identifier Type IRI - An IRI of a controlled vocabulary value for a type of Identifier.';


--
-- Name: COLUMN "survey-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."identifierTypeVocabulary" IS 'Identifier Type Vocabulary - A reference to a controlled vocabulary in which the definition of a value in identifierType is given.';


--
-- Name: COLUMN "survey-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."identifierLanguage" IS 'Identifier Language - A language in which an Identifier is presented.';


--
-- Name: survey-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."survey-protocol" (
    "protocolID" text NOT NULL,
    "surveyID" text NOT NULL
);


ALTER TABLE public."survey-protocol" OWNER TO postgres;

--
-- Name: TABLE "survey-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-protocol" IS 'Survey ID - An identifier for a Survey.';


--
-- Name: COLUMN "survey-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-protocol"."protocolID" IS 'Protocol ID - An identifier for a Protocol.';


--
-- Name: COLUMN "survey-protocol"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-protocol"."surveyID" IS 'Survey ID - An identifier for a Survey.';


--
-- Name: survey-reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."survey-reference" (
    "referenceID" text NOT NULL,
    "surveyID" text NOT NULL
);


ALTER TABLE public."survey-reference" OWNER TO postgres;

--
-- Name: TABLE "survey-reference"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-reference" IS 'Survey ID - An identifier for a Survey.';


--
-- Name: COLUMN "survey-reference"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-reference"."referenceID" IS 'Reference ID - An identifier for a Reference.';


--
-- Name: COLUMN "survey-reference"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-reference"."surveyID" IS 'Survey ID - An identifier for a Survey.';


--
-- Name: survey-target; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."survey-target" (
    "surveyTargetID" text NOT NULL,
    "surveyID" text NOT NULL,
    "surveyTargetType" text,
    "surveyTargetValue" text,
    "surveyTargetUnit" text,
    "includeOrExclude" text NOT NULL,
    "isSurveyTargetFullyReported" boolean NOT NULL
);


ALTER TABLE public."survey-target" OWNER TO postgres;

--
-- Name: TABLE "survey-target"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-target" IS 'Is Survey Target Fully Reported - A declaration of whether the counts for an instance of the SurveyTarget report everything that matches the declared SurveyTarget. If they do, this enables inference of absence of detection for everything in that SurveyTarget that is included but that does not appear in the count.';


--
-- Name: COLUMN "survey-target"."surveyTargetID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetID" IS 'Survey Target ID - An identifier for a SurveyTarget.';


--
-- Name: COLUMN "survey-target"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyID" IS 'Survey ID - An identifier for a Survey.';


--
-- Name: COLUMN "survey-target"."surveyTargetType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetType" IS 'Survey Target Type - A scope a SurveyTarget describes.';


--
-- Name: COLUMN "survey-target"."surveyTargetValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetValue" IS 'Survey Target Value - A value of a characteristic sought for the SurveyTarget for a given surveyTargetType.';


--
-- Name: COLUMN "survey-target"."surveyTargetUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetUnit" IS 'Survey Target Unit - Units associated with a value in surveyTargetValue.';


--
-- Name: COLUMN "survey-target"."includeOrExclude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."includeOrExclude" IS 'Include Or Exclude - A term to declare whether an instance of the SurveyTarget is an included scope or an excluded scope. Combinations of SurveyTarget records of inclusions and exclusions can define complex scopes such as all flying adult Aves except Passeriformes.';


--
-- Name: COLUMN "survey-target"."isSurveyTargetFullyReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."isSurveyTargetFullyReported" IS 'Is Survey Target Fully Reported - A declaration of whether the counts for an instance of the SurveyTarget report everything that matches the declared SurveyTarget. If they do, this enables inference of absence of detection for everything in that SurveyTarget that is included but that does not appear in the count.';


--
-- Data for Name: agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agent ("agentID", "agentType", "agentTypeIRI", "agentTypeVocabulary", "preferredAgentName") FROM stdin;
\.


--
-- Data for Name: agent-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."agent-agent-role" ("agentID", "relatedAgentID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: agent-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."agent-identifier" (identifier, "agentID", "identifierType", "identifierTypeIRI", "identifierTypeVocabulary", "identifierLanguage") FROM stdin;
\.


--
-- Data for Name: agent-media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."agent-media" ("mediaID", "agentID", "mediaSubjectCategory", "mediaSubjectCategoryIRI", "mediaSubjectCategoryVocabulary") FROM stdin;
\.


--
-- Data for Name: chronometric-age; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."chronometric-age" ("chronometricAgeID", "eventID", "verbatimChronometricAge", "chronometricAgeProtocol", "chronometricAgeProtocolID", "uncalibratedChronometricAge", "chronometricAgeConversionProtocol", "chronometricAgeConversionProtocolID", "earliestChronometricAge", "earliestChronometricAgeReferenceSystem", "latestChronometricAge", "latestChronometricAgeReferenceSystem", "chronometricAgeUncertaintyInYears", "chronometricAgeUncertaintyMethod", "materialDated", "materialDatedID", "materialDatedRelationship", "chronometricAgeDeterminedBy", "chronometricAgeDeterminedByID", "chronometricAgeDeterminedDate", "chronometricAgeReferences", "chronometricAgeRemarks") FROM stdin;
\.


--
-- Data for Name: chronometric-age-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."chronometric-age-agent-role" ("agentID", "chronometricAgeID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: chronometric-age-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."chronometric-age-assertion" ("assertionID", "chronometricAgeID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocols", "assertionProtocolID", "assertionReferences", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: chronometric-age-media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."chronometric-age-media" ("mediaID", "chronometricAgeID", "mediaSubjectCategory", "mediaSubjectCategoryIRI", "mediaSubjectCategoryVocabulary") FROM stdin;
\.


--
-- Data for Name: chronometric-age-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."chronometric-age-protocol" ("protocolID", "chronometricAgeID") FROM stdin;
\.


--
-- Data for Name: chronometric-age-reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."chronometric-age-reference" ("referenceID", "chronometricAgeID") FROM stdin;
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection ("collectionID", "collectionType", "collectionName", "collectionCode", "institutionID", "institutionName", "institutionCode") FROM stdin;
\.


--
-- Data for Name: collection-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."collection-agent-role" ("agentID", "collectionID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: collection-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."collection-assertion" ("assertionID", "collectionID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocols", "assertionProtocolID", "assertionReferences", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: collection-media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."collection-media" ("mediaID", "collectionID", "mediaSubjectCategory", "mediaSubjectCategoryIRI", "mediaSubjectCategoryVocabulary") FROM stdin;
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event ("eventID", "parentEventID", "preferredEventName", "eventCategory", "eventType", "datasetName", "datasetID", "fieldNumber", "eventConductedBy", "eventConductedByID", "eventDate", "eventTime", "startDayOfYear", "endDayOfYear", year, month, day, "verbatimEventDate", "verbatimLocality", "verbatimElevation", "verbatimDepth", "verbatimCoordinates", "verbatimLatitude", "verbatimLongitude", "verbatimCoordinateSystem", "verbatimSRS", "georeferenceVerificationStatus", habitat, "eventEffort", "fieldNotes", "eventReferences", "eventRemarks", "locationID", "higherGeographyID", "higherGeography", continent, "waterBody", "islandGroup", island, country, "countryCode", "stateProvince", county, municipality, locality, "minimumElevationInMeters", "maximumElevationInMeters", "verticalDatum", "minimumDepthInMeters", "maximumDepthInMeters", "minimumDistanceAboveSurfaceInMeters", "maximumDistanceAboveSurfaceInMeters", "locationRemarks", "decimalLatitude", "decimalLongitude", "geodeticDatum", "coordinateUncertaintyInMeters", "coordinatePrecision", "pointRadiusSpatialFit", "footprintWKT", "footprintSRS", "footprintSpatialFit", "georeferencedBy", "georeferencedByID", "georeferencedDate", "georeferenceProtocol", "georeferenceProtocolID", "georeferenceSources", "georeferenceRemarks", "informationWithheld", "dataGeneralizations", "preferredSpatialRepresentation") FROM stdin;
\.


--
-- Data for Name: event-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."event-agent-role" ("agentID", "eventID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: event-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."event-assertion" ("assertionID", "eventID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocols", "assertionProtocolID", "assertionReferences", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: event-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."event-identifier" (identifier, "eventID", "identifierType", "identifierTypeIRI", "identifierTypeVocabulary", "identifierLanguage") FROM stdin;
\.


--
-- Data for Name: event-media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."event-media" ("mediaID", "eventID", "mediaSubjectCategory", "mediaSubjectCategoryIRI", "mediaSubjectCategoryVocabulary") FROM stdin;
\.


--
-- Data for Name: event-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."event-protocol" ("protocolID", "eventID") FROM stdin;
\.


--
-- Data for Name: event-reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."event-reference" ("referenceID", "eventID") FROM stdin;
\.


--
-- Data for Name: geological-context; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."geological-context" ("geologicalContextID", "eventID", "earliestEonOrLowestEonothem", "latestEonOrHighestEonothem", "earliestEraOrLowestErathem", "latestEraOrHighestErathem", "earliestPeriodOrLowestSystem", "latestPeriodOrHighestSystem", "earliestEpochOrLowestSeries", "latestEpochOrHighestSeries", "earliestAgeOrLowestStage", "latestAgeOrHighestStage", "lowestBiostratigraphicZone", "highestBiostratigraphicZone", "lithostratigraphicTerms", "group", formation, member, bed) FROM stdin;
\.


--
-- Data for Name: geological-context-media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."geological-context-media" ("mediaID", "geologicalContextID", "mediaSubjectCategory", "mediaSubjectCategoryIRI", "mediaSubjectCategoryVocabulary") FROM stdin;
\.


--
-- Data for Name: identification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identification ("identificationID", "basedOnOccurrenceID", "basedOnMaterialEntityID", "basedOnNucleotideSequenceID", "basedOnNucleotideAnalysisID", "basedOnMediaID", "identificationType", "verbatimIdentification", "isAcceptedIdentification", "taxonFormula", "typeStatus", "typeDesignationType", "typifiedName", "identifiedBy", "identifiedByID", "dateIdentified", "identificationReferences", "taxonAssignmentMethod", "identificationVerificationStatus", "identificationRemarks", "taxonID", "higherClassificationName", "higherClassificationRank", "scientificName", "taxonRank", "taxonRemarks") FROM stdin;
\.


--
-- Data for Name: identification-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."identification-agent-role" ("agentID", "identificationID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: identification-taxon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."identification-taxon" ("identificationID", "taxonID", "taxonOrder", "higherClassificationName", "higherClassificationRank", "scientificName", "taxonRank", "taxonRemarks") FROM stdin;
\.


--
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.material ("materialEntityID", "eventID", "materialCategory", "materialEntityType", "institutionCode", "institutionID", "ownerInstitutionCode", "ownerInstitutionID", "collectionCode", "collectionID", "catalogNumber", "otherCatalogNumbers", "collectedBy", "collectedByID", "objectQuantity", "objectQuantityType", "recordNumber", preparations, disposition, "verbatimLabel", "associatedSequences", "materialReferences", "informationWithheld", "dataGeneralizations", "materialEntityRemarks", "evidenceForOccurrenceID", "derivedFromMaterialEntityID", "derivationEventID", "derivationType", "isPartOfMaterialEntityID", "verbatimIdentification", "taxonFormula", "typeStatus", "typeDesignationType", "typifiedName", "identifiedBy", "identifiedByID", "dateIdentified", "identificationReferences", "identificationVerificationStatus", "identificationRemarks", "taxonID", "higherClassificationName", "higherClassificationRank", "scientificName", "taxonRank", "taxonRemarks") FROM stdin;
\.


--
-- Data for Name: material-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."material-agent-role" ("agentID", "materialEntityID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: material-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."material-assertion" ("assertionID", "materialEntityID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocols", "assertionProtocolID", "assertionReferences", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: material-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."material-identifier" (identifier, "materialEntityID", "identifierType", "identifierTypeIRI", "identifierTypeVocabulary", "identifierLanguage") FROM stdin;
\.


--
-- Data for Name: material-media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."material-media" ("mediaID", "materialEntityID", "mediaSubjectCategory", "mediaSubjectCategoryIRI", "mediaSubjectCategoryVocabulary") FROM stdin;
\.


--
-- Data for Name: material-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."material-protocol" ("protocolID", "materialEntityID") FROM stdin;
\.


--
-- Data for Name: material-reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."material-reference" ("referenceID", "materialEntityID") FROM stdin;
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media ("mediaID", "mediaType", "accessURI", "WebStatement", format, rights, "Owner", source, creator, "creatorID", "CreateDate", modified, "mediaLanguage", "mediaDescription") FROM stdin;
\.


--
-- Data for Name: media-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."media-agent-role" ("agentID", "mediaID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: media-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."media-assertion" ("assertionID", "mediaID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocols", "assertionProtocolID", "assertionReferences", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: media-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."media-identifier" (identifier, "mediaID", "identifierType", "identifierTypeIRI", "identifierTypeVocabulary", "identifierLanguage") FROM stdin;
\.


--
-- Data for Name: molecular-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."molecular-protocol" ("molecularProtocolID", "assayType", samp_name, project_name, experimental_factor, samp_taxon_id, neg_cont_type, pos_cont_type, env_broad_scale, env_local_scale, env_medium, subspecf_gen_lin, ploidy, num_replicons, extrachrom_elements, estimated_size, ref_biomaterial, source_mat_id, pathogenicity, biotic_relationship, specific_host, host_spec_range, host_disease_stat, trophic_level, propagation, encoded_traits, rel_to_oxygen, isol_growth_condt, samp_collec_device, samp_collec_method, samp_mat_process, size_frac, samp_size, samp_vol_we_dna_ext, source_uvig, virus_enrich_appr, nucl_acid_ext, nucl_acid_amp, lib_size, lib_reads_seqd, lib_layout, lib_vector, lib_screen, target_gene, target_subfragment, pcr_primers, mid, adapters, pcr_cond, seq_meth, seq_quality_check, chimera_check, tax_ident, assembly_qual, assembly_name, assembly_software, annot, number_contig, feat_pred, ref_db, sim_search_meth, tax_class, _16s_recover, _16s_recover_software, trnas, trna_ext_software, compl_score, compl_software, compl_appr, contam_score, contam_screen_input, contam_screen_param, decontam_software, sort_tech, single_cell_lysis_appr, single_cell_lysis_prot, wga_amp_appr, wga_amp_kit, bin_param, bin_software, reassembly_bin, mag_cov_software, vir_ident_software, pred_genome_type, pred_genome_struc, detec_type, otu_class_appr, otu_seq_comp_appr, otu_db, host_pred_appr, host_pred_est_acc, associated_resource, sop, pcr_primer_forward, pcr_primer_reverse, pcr_primer_name_forward, pcr_primer_name_reverse, pcr_primer_reference, "DNA_sequence", concentration, "concentrationUnit", "methodDeterminationConcentrationAndRatios", "ratioOfAbsorbance260_230", "ratioOfAbsorbance260_280", "annealingTemp", "annealingTempUnit", "probeReporter", "probeQuencher", "ampliconSize", "thresholdQuantificationCycle", "baselineValue", "quantificationCycle", "automaticThresholdQuantificationCycle", "automaticBaselineValue", "contaminationAssessment", "partitionVolume", "partitionVolumeUnit", "estimatedNumberOfCopies", "amplificationReactionVolume", "amplificationReactionVolumeUnit", pcr_analysis_software, "experimentalVariance", pcr_primer_lod, pcr_primer_loq) FROM stdin;
\.


--
-- Data for Name: molecular-protocol-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."molecular-protocol-agent-role" ("agentID", "molecularProtocolID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: molecular-protocol-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."molecular-protocol-assertion" ("assertionID", "molecularProtocolID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocols", "assertionProtocolID", "assertionReferences", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: molecular-protocol-reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."molecular-protocol-reference" ("referenceID", "molecularProtocolID") FROM stdin;
\.


--
-- Data for Name: nucleotide-analysis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."nucleotide-analysis" ("nucleotideAnalysisID", "eventID", "molecularProtocolID", "nucleotideSequenceID", "materialEntityID", "readCount", "totalReadCount") FROM stdin;
\.


--
-- Data for Name: nucleotide-analysis-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."nucleotide-analysis-assertion" ("assertionID", "nucleotideAnalysisID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocols", "assertionProtocolID", "assertionReferences", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: nucleotide-sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."nucleotide-sequence" ("nucleotideSequenceID", "nucleotideSequence", "nucleotideSequenceRemarks") FROM stdin;
\.


--
-- Data for Name: occurrence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.occurrence ("occurrenceID", "eventID", "surveyTargetID", "recordedBy", "recordedByID", "organismQuantity", "organismQuantityType", sex, "lifeStage", "reproductiveCondition", caste, behavior, vitality, "establishmentMeans", "degreeOfEstablishment", pathway, "occurrenceStatus", "occurrenceReferences", "informationWithheld", "dataGeneralizations", "occurrenceRemarks", "organismID", "organismScope", "organismName", "organismRemarks", "verbatimIdentification", "taxonFormula", "identifiedBy", "identifiedByID", "dateIdentified", "identificationReferences", "identificationVerificationStatus", "identificationRemarks", "taxonID", "higherClassificationName", "higherClassificationRank", "scientificName", "taxonRank", "taxonRemarks") FROM stdin;
\.


--
-- Data for Name: occurrence-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."occurrence-agent-role" ("agentID", "occurrenceID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: occurrence-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."occurrence-assertion" ("assertionID", "occurrenceID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocols", "assertionProtocolID", "assertionReferences", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: occurrence-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."occurrence-identifier" (identifier, "occurrenceID", "identifierType", "identifierTypeIRI", "identifierTypeVocabulary", "identifierLanguage") FROM stdin;
\.


--
-- Data for Name: occurrence-media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."occurrence-media" ("mediaID", "occurrenceID", "mediaSubjectCategory", "mediaSubjectCategoryIRI", "mediaSubjectCategoryVocabulary") FROM stdin;
\.


--
-- Data for Name: occurrence-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."occurrence-protocol" ("protocolID", "occurrenceID") FROM stdin;
\.


--
-- Data for Name: occurrence-reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."occurrence-reference" ("referenceID", "occurrenceID") FROM stdin;
\.


--
-- Data for Name: organism-interaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."organism-interaction" ("organismInteractionID", "eventID", "organismInteractionDescription", "subjectOccurrenceID", "subjectOrganismPart", "organismInteractionType", "relatedOccurrenceID", "relatedOrganismPart") FROM stdin;
\.


--
-- Data for Name: organism-interaction-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."organism-interaction-agent-role" ("agentID", "organismInteractionID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: organism-interaction-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."organism-interaction-assertion" ("assertionID", "organismInteractionID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocols", "assertionProtocolID", "assertionReferences", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: organism-interaction-media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."organism-interaction-media" ("mediaID", "organismInteractionID", "mediaSubjectCategory", "mediaSubjectCategoryIRI", "mediaSubjectCategoryVocabulary") FROM stdin;
\.


--
-- Data for Name: organism-interaction-reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."organism-interaction-reference" ("referenceID", "organismInteractionID") FROM stdin;
\.


--
-- Data for Name: phylogenetic-tree; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree" ("phylogeneticTreeID", "phylogeneticTreeProtocol", "phylogeneticTreeProtocolID", "phylogeneticTreeReference", "phylogeneticTreeRemarks") FROM stdin;
\.


--
-- Data for Name: phylogenetic-tree-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree-assertion" ("assertionID", "phylogeneticTreeID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocols", "assertionProtocolID", "assertionReferences", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: phylogenetic-tree-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree-identifier" (identifier, "phylogeneticTreeID", "identifierType", "identifierTypeIRI", "identifierTypeVocabulary", "identifierLanguage") FROM stdin;
\.


--
-- Data for Name: phylogenetic-tree-media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree-media" ("mediaID", "phylogeneticTreeID", "mediaSubjectCategory", "mediaSubjectCategoryIRI", "mediaSubjectCategoryVocabulary") FROM stdin;
\.


--
-- Data for Name: phylogenetic-tree-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree-protocol" ("protocolID", "phylogeneticTreeID") FROM stdin;
\.


--
-- Data for Name: phylogenetic-tree-reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree-reference" ("referenceID", "phylogeneticTreeID") FROM stdin;
\.


--
-- Data for Name: phylogenetic-tree-tip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree-tip" ("phylogeneticTreeTipID", "phylogeneticTreeID", "phylogeneticTreeTipLabel", "taxonID", "scientificName", "materialEntityID", "nucleotideSequenceID") FROM stdin;
\.


--
-- Data for Name: phylogenetic-tree-tip-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree-tip-assertion" ("assertionID", "phylogeneticTreeTipID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocols", "assertionProtocolID", "assertionReferences", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol ("protocolID", "protocolType", "protocolTypeIRI", "protocolTypeVocabulary", "protocolName", "protocolDescription", "protocolReference", "protocolRemarks") FROM stdin;
\.


--
-- Data for Name: protocol-reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."protocol-reference" ("referenceID", "protocolID") FROM stdin;
\.


--
-- Data for Name: reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reference ("referenceID", "parentReferenceID", "referenceType", "bibliographicCitation", title, issued, identifier, creator, "creatorID", publisher, "publisherID", pagination, "isPeerReviewed", "referenceRemarks") FROM stdin;
\.


--
-- Data for Name: relationship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.relationship ("relationshipID", "subjectResourceID", "subjectResourceType", "subjectResourceTypeIRI", "subjectResourceTypeVocabulary", "relationshipType", "relationshipTypeIRI", "relationshipTypeVocabulary", "relatedResourceID", "relatedResourceType", "relatedResourceTypeIRI", "relatedResourceTypeVocabulary", "relationshipOrder", "relationshipAccordingTo", "relationshipAccordingToID", "relationshipEffectiveDate", "relationshipRemarks") FROM stdin;
\.


--
-- Data for Name: survey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.survey ("surveyID", "eventID", "siteCount", "siteNestingDescription", "verbatimSiteDescriptions", "verbatimSiteNames", "geospatialScopeAreaValue", "geospatialScopeAreaUnit", "totalAreaSampledValue", "totalAreaSampledUnit", "reportedWeather", "reportedExtremeConditions", "eventDurationValue", "eventDurationUnit", "taxonCompletenessReported", "taxonCompletenessProtocols", "isAbsenceReported", "absentTaxa", "hasNonTargetTaxa", "nonTargetTaxa", "areNonTargetTaxaFullyReported", "hasNonTargetOrganisms", "verbatimTargetScope", "identifiedBy", "identifiedByID", "identificationReferences", "compilationTypes", "compilationSourceTypes", "inventoryTypes", "protocolNames", "protocolDescriptions", "protocolReferences", "isAbundanceReported", "isAbundanceCapReported", "abundanceCap", "isVegetationCoverReported", "isLeastSpecificTargetCategoryQuantityInclusive", "hasVouchers", "voucherInstitutions", "hasMaterialSamples", "materialSampleTypes", "sampleSizeValue", "sampleSizeUnit", "samplingPerformedBy", "samplingPerformedByID", "isSamplingEffortReported", "samplingEffortProtocol", "samplingEffortProtocolID", "samplingEffortValue", "samplingEffortUnit", "informationWithheld", "dataGeneralizations") FROM stdin;
\.


--
-- Data for Name: survey-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."survey-agent-role" ("agentID", "surveyID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: survey-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."survey-assertion" ("assertionID", "surveyID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocols", "assertionProtocolID", "assertionReferences", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: survey-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."survey-identifier" (identifier, "surveyID", "identifierType", "identifierTypeIRI", "identifierTypeVocabulary", "identifierLanguage") FROM stdin;
\.


--
-- Data for Name: survey-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."survey-protocol" ("protocolID", "surveyID") FROM stdin;
\.


--
-- Data for Name: survey-reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."survey-reference" ("referenceID", "surveyID") FROM stdin;
\.


--
-- Data for Name: survey-target; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."survey-target" ("surveyTargetID", "surveyID", "surveyTargetType", "surveyTargetValue", "surveyTargetUnit", "includeOrExclude", "isSurveyTargetFullyReported") FROM stdin;
\.


--
-- Name: agent agent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent
    ADD CONSTRAINT agent_pkey PRIMARY KEY ("agentID");


--
-- Name: chronometric-age-assertion chronometric-age-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-assertion"
    ADD CONSTRAINT "chronometric-age-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: chronometric-age-reference chronometric-age-reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-reference"
    ADD CONSTRAINT "chronometric-age-reference_pkey" PRIMARY KEY ("referenceID");


--
-- Name: chronometric-age chronometric-age_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age"
    ADD CONSTRAINT "chronometric-age_pkey" PRIMARY KEY ("chronometricAgeID");


--
-- Name: collection-assertion collection-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-assertion"
    ADD CONSTRAINT "collection-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY ("collectionID");


--
-- Name: event-assertion event-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-assertion"
    ADD CONSTRAINT "event-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: event-reference event-reference_eventID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-reference"
    ADD CONSTRAINT "event-reference_eventID_key" UNIQUE ("eventID");


--
-- Name: event-reference event-reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-reference"
    ADD CONSTRAINT "event-reference_pkey" PRIMARY KEY ("referenceID");


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY ("eventID");


--
-- Name: geological-context-media geological-context-media_geologicalContextID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."geological-context-media"
    ADD CONSTRAINT "geological-context-media_geologicalContextID_key" UNIQUE ("geologicalContextID");


--
-- Name: geological-context geological-context_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."geological-context"
    ADD CONSTRAINT "geological-context_pkey" PRIMARY KEY ("geologicalContextID");


--
-- Name: identification identification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT identification_pkey PRIMARY KEY ("identificationID");


--
-- Name: material-assertion material-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-assertion"
    ADD CONSTRAINT "material-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: material-reference material-reference_materialEntityID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-reference"
    ADD CONSTRAINT "material-reference_materialEntityID_key" UNIQUE ("materialEntityID");


--
-- Name: material-reference material-reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-reference"
    ADD CONSTRAINT "material-reference_pkey" PRIMARY KEY ("referenceID");


--
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY ("materialEntityID");


--
-- Name: media-assertion media-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."media-assertion"
    ADD CONSTRAINT "media-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY ("mediaID");


--
-- Name: molecular-protocol-assertion molecular-protocol-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."molecular-protocol-assertion"
    ADD CONSTRAINT "molecular-protocol-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: molecular-protocol-reference molecular-protocol-reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."molecular-protocol-reference"
    ADD CONSTRAINT "molecular-protocol-reference_pkey" PRIMARY KEY ("referenceID");


--
-- Name: molecular-protocol molecular-protocol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."molecular-protocol"
    ADD CONSTRAINT "molecular-protocol_pkey" PRIMARY KEY ("molecularProtocolID");


--
-- Name: nucleotide-analysis-assertion nucleotide-analysis-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."nucleotide-analysis-assertion"
    ADD CONSTRAINT "nucleotide-analysis-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: nucleotide-analysis nucleotide-analysis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."nucleotide-analysis"
    ADD CONSTRAINT "nucleotide-analysis_pkey" PRIMARY KEY ("nucleotideAnalysisID");


--
-- Name: nucleotide-sequence nucleotide-sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."nucleotide-sequence"
    ADD CONSTRAINT "nucleotide-sequence_pkey" PRIMARY KEY ("nucleotideSequenceID");


--
-- Name: occurrence-assertion occurrence-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-assertion"
    ADD CONSTRAINT "occurrence-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: occurrence-reference occurrence-reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-reference"
    ADD CONSTRAINT "occurrence-reference_pkey" PRIMARY KEY ("referenceID");


--
-- Name: occurrence occurrence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.occurrence
    ADD CONSTRAINT occurrence_pkey PRIMARY KEY ("occurrenceID");


--
-- Name: organism-interaction-assertion organism-interaction-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-assertion"
    ADD CONSTRAINT "organism-interaction-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: organism-interaction-reference organism-interaction-reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-reference"
    ADD CONSTRAINT "organism-interaction-reference_pkey" PRIMARY KEY ("referenceID");


--
-- Name: organism-interaction organism-interaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction"
    ADD CONSTRAINT "organism-interaction_pkey" PRIMARY KEY ("organismInteractionID");


--
-- Name: phylogenetic-tree-assertion phylogenetic-tree-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-assertion"
    ADD CONSTRAINT "phylogenetic-tree-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: phylogenetic-tree-reference phylogenetic-tree-reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-reference"
    ADD CONSTRAINT "phylogenetic-tree-reference_pkey" PRIMARY KEY ("referenceID");


--
-- Name: phylogenetic-tree-tip-assertion phylogenetic-tree-tip-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip-assertion"
    ADD CONSTRAINT "phylogenetic-tree-tip-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: phylogenetic-tree-tip phylogenetic-tree-tip_nucleotideSequenceID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip"
    ADD CONSTRAINT "phylogenetic-tree-tip_nucleotideSequenceID_key" UNIQUE ("nucleotideSequenceID");


--
-- Name: phylogenetic-tree-tip phylogenetic-tree-tip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip"
    ADD CONSTRAINT "phylogenetic-tree-tip_pkey" PRIMARY KEY ("phylogeneticTreeTipID");


--
-- Name: phylogenetic-tree phylogenetic-tree_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree"
    ADD CONSTRAINT "phylogenetic-tree_pkey" PRIMARY KEY ("phylogeneticTreeID");


--
-- Name: protocol-reference protocol-reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."protocol-reference"
    ADD CONSTRAINT "protocol-reference_pkey" PRIMARY KEY ("referenceID");


--
-- Name: protocol protocol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol
    ADD CONSTRAINT protocol_pkey PRIMARY KEY ("protocolID");


--
-- Name: reference reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reference
    ADD CONSTRAINT reference_pkey PRIMARY KEY ("referenceID");


--
-- Name: relationship relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT relationship_pkey PRIMARY KEY ("relationshipID");


--
-- Name: survey-assertion survey-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-assertion"
    ADD CONSTRAINT "survey-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: survey-reference survey-reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-reference"
    ADD CONSTRAINT "survey-reference_pkey" PRIMARY KEY ("referenceID");


--
-- Name: survey-target survey-target_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-target"
    ADD CONSTRAINT "survey-target_pkey" PRIMARY KEY ("surveyTargetID");


--
-- Name: survey survey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey
    ADD CONSTRAINT survey_pkey PRIMARY KEY ("surveyID");


--
-- Name: agent-agent-role agent-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."agent-agent-role"
    ADD CONSTRAINT "agent-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: agent-agent-role agent-agent-role_relatedAgentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."agent-agent-role"
    ADD CONSTRAINT "agent-agent-role_relatedAgentID_fkey" FOREIGN KEY ("relatedAgentID") REFERENCES public.agent("agentID");


--
-- Name: agent-identifier agent-identifier_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."agent-identifier"
    ADD CONSTRAINT "agent-identifier_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: agent-media agent-media_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."agent-media"
    ADD CONSTRAINT "agent-media_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: agent-media agent-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."agent-media"
    ADD CONSTRAINT "agent-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- Name: chronometric-age-agent-role chronometric-age-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-agent-role"
    ADD CONSTRAINT "chronometric-age-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: chronometric-age-agent-role chronometric-age-agent-role_chronometricAgeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-agent-role"
    ADD CONSTRAINT "chronometric-age-agent-role_chronometricAgeID_fkey" FOREIGN KEY ("chronometricAgeID") REFERENCES public."chronometric-age"("chronometricAgeID");


--
-- Name: chronometric-age-assertion chronometric-age-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-assertion"
    ADD CONSTRAINT "chronometric-age-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: chronometric-age-assertion chronometric-age-assertion_chronometricAgeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-assertion"
    ADD CONSTRAINT "chronometric-age-assertion_chronometricAgeID_fkey" FOREIGN KEY ("chronometricAgeID") REFERENCES public."chronometric-age"("chronometricAgeID");


--
-- Name: chronometric-age-media chronometric-age-media_chronometricAgeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-media"
    ADD CONSTRAINT "chronometric-age-media_chronometricAgeID_fkey" FOREIGN KEY ("chronometricAgeID") REFERENCES public."chronometric-age"("chronometricAgeID");


--
-- Name: chronometric-age-media chronometric-age-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-media"
    ADD CONSTRAINT "chronometric-age-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- Name: chronometric-age-protocol chronometric-age-protocol_chronometricAgeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-protocol"
    ADD CONSTRAINT "chronometric-age-protocol_chronometricAgeID_fkey" FOREIGN KEY ("chronometricAgeID") REFERENCES public."chronometric-age"("chronometricAgeID");


--
-- Name: chronometric-age-protocol chronometric-age-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-protocol"
    ADD CONSTRAINT "chronometric-age-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- Name: chronometric-age-reference chronometric-age-reference_chronometricAgeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-reference"
    ADD CONSTRAINT "chronometric-age-reference_chronometricAgeID_fkey" FOREIGN KEY ("chronometricAgeID") REFERENCES public."chronometric-age"("chronometricAgeID");


--
-- Name: chronometric-age chronometric-age_chronometricAgeConversionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age"
    ADD CONSTRAINT "chronometric-age_chronometricAgeConversionProtocolID_fkey" FOREIGN KEY ("chronometricAgeConversionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: chronometric-age chronometric-age_chronometricAgeProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age"
    ADD CONSTRAINT "chronometric-age_chronometricAgeProtocolID_fkey" FOREIGN KEY ("chronometricAgeProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: chronometric-age chronometric-age_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age"
    ADD CONSTRAINT "chronometric-age_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: chronometric-age chronometric-age_materialDatedID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age"
    ADD CONSTRAINT "chronometric-age_materialDatedID_fkey" FOREIGN KEY ("materialDatedID") REFERENCES public.material("materialEntityID");


--
-- Name: collection-agent-role collection-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-agent-role"
    ADD CONSTRAINT "collection-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: collection-agent-role collection-agent-role_collectionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-agent-role"
    ADD CONSTRAINT "collection-agent-role_collectionID_fkey" FOREIGN KEY ("collectionID") REFERENCES public.collection("collectionID");


--
-- Name: collection-assertion collection-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-assertion"
    ADD CONSTRAINT "collection-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: collection-assertion collection-assertion_collectionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-assertion"
    ADD CONSTRAINT "collection-assertion_collectionID_fkey" FOREIGN KEY ("collectionID") REFERENCES public.collection("collectionID");


--
-- Name: collection-media collection-media_collectionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-media"
    ADD CONSTRAINT "collection-media_collectionID_fkey" FOREIGN KEY ("collectionID") REFERENCES public.collection("collectionID");


--
-- Name: collection-media collection-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-media"
    ADD CONSTRAINT "collection-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- Name: event-agent-role event-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-agent-role"
    ADD CONSTRAINT "event-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: event-agent-role event-agent-role_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-agent-role"
    ADD CONSTRAINT "event-agent-role_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: event-assertion event-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-assertion"
    ADD CONSTRAINT "event-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: event-assertion event-assertion_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-assertion"
    ADD CONSTRAINT "event-assertion_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: event-identifier event-identifier_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-identifier"
    ADD CONSTRAINT "event-identifier_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: event-media event-media_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-media"
    ADD CONSTRAINT "event-media_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: event-media event-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-media"
    ADD CONSTRAINT "event-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- Name: event-protocol event-protocol_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-protocol"
    ADD CONSTRAINT "event-protocol_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: event-protocol event-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-protocol"
    ADD CONSTRAINT "event-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- Name: event-reference event-reference_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-reference"
    ADD CONSTRAINT "event-reference_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: event event_georeferenceProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT "event_georeferenceProtocolID_fkey" FOREIGN KEY ("georeferenceProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: event event_parentEventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT "event_parentEventID_fkey" FOREIGN KEY ("parentEventID") REFERENCES public.event("eventID");


--
-- Name: geological-context-media geological-context-media_geologicalContextID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."geological-context-media"
    ADD CONSTRAINT "geological-context-media_geologicalContextID_fkey" FOREIGN KEY ("geologicalContextID") REFERENCES public."geological-context"("geologicalContextID");


--
-- Name: geological-context-media geological-context-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."geological-context-media"
    ADD CONSTRAINT "geological-context-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- Name: geological-context geological-context_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."geological-context"
    ADD CONSTRAINT "geological-context_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: identification-agent-role identification-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."identification-agent-role"
    ADD CONSTRAINT "identification-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: identification-agent-role identification-agent-role_identificationID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."identification-agent-role"
    ADD CONSTRAINT "identification-agent-role_identificationID_fkey" FOREIGN KEY ("identificationID") REFERENCES public.identification("identificationID");


--
-- Name: identification-taxon identification-taxon_identificationID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."identification-taxon"
    ADD CONSTRAINT "identification-taxon_identificationID_fkey" FOREIGN KEY ("identificationID") REFERENCES public.identification("identificationID");


--
-- Name: identification identification_basedOnMaterialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT "identification_basedOnMaterialEntityID_fkey" FOREIGN KEY ("basedOnMaterialEntityID") REFERENCES public.material("materialEntityID");


--
-- Name: identification identification_basedOnMediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT "identification_basedOnMediaID_fkey" FOREIGN KEY ("basedOnMediaID") REFERENCES public.media("mediaID");


--
-- Name: identification identification_basedOnNucleotideAnalysisID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT "identification_basedOnNucleotideAnalysisID_fkey" FOREIGN KEY ("basedOnNucleotideAnalysisID") REFERENCES public."nucleotide-analysis"("nucleotideAnalysisID");


--
-- Name: identification identification_basedOnNucleotideSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT "identification_basedOnNucleotideSequenceID_fkey" FOREIGN KEY ("basedOnNucleotideSequenceID") REFERENCES public."nucleotide-sequence"("nucleotideSequenceID");


--
-- Name: identification identification_basedOnOccurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT "identification_basedOnOccurrenceID_fkey" FOREIGN KEY ("basedOnOccurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- Name: material-agent-role material-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-agent-role"
    ADD CONSTRAINT "material-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: material-agent-role material-agent-role_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-agent-role"
    ADD CONSTRAINT "material-agent-role_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- Name: material-assertion material-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-assertion"
    ADD CONSTRAINT "material-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: material-assertion material-assertion_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-assertion"
    ADD CONSTRAINT "material-assertion_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- Name: material-identifier material-identifier_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-identifier"
    ADD CONSTRAINT "material-identifier_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- Name: material-media material-media_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-media"
    ADD CONSTRAINT "material-media_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- Name: material-media material-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-media"
    ADD CONSTRAINT "material-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- Name: material-protocol material-protocol_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-protocol"
    ADD CONSTRAINT "material-protocol_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- Name: material-protocol material-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-protocol"
    ADD CONSTRAINT "material-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- Name: material-reference material-reference_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-reference"
    ADD CONSTRAINT "material-reference_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- Name: material material_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT "material_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: material material_isPartOfMaterialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT "material_isPartOfMaterialEntityID_fkey" FOREIGN KEY ("isPartOfMaterialEntityID") REFERENCES public.material("materialEntityID");


--
-- Name: media-agent-role media-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."media-agent-role"
    ADD CONSTRAINT "media-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: media-agent-role media-agent-role_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."media-agent-role"
    ADD CONSTRAINT "media-agent-role_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- Name: media-assertion media-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."media-assertion"
    ADD CONSTRAINT "media-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: media-assertion media-assertion_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."media-assertion"
    ADD CONSTRAINT "media-assertion_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- Name: media-identifier media-identifier_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."media-identifier"
    ADD CONSTRAINT "media-identifier_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- Name: molecular-protocol-agent-role molecular-protocol-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."molecular-protocol-agent-role"
    ADD CONSTRAINT "molecular-protocol-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: molecular-protocol-agent-role molecular-protocol-agent-role_molecularProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."molecular-protocol-agent-role"
    ADD CONSTRAINT "molecular-protocol-agent-role_molecularProtocolID_fkey" FOREIGN KEY ("molecularProtocolID") REFERENCES public."molecular-protocol"("molecularProtocolID");


--
-- Name: molecular-protocol-assertion molecular-protocol-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."molecular-protocol-assertion"
    ADD CONSTRAINT "molecular-protocol-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: molecular-protocol-assertion molecular-protocol-assertion_molecularProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."molecular-protocol-assertion"
    ADD CONSTRAINT "molecular-protocol-assertion_molecularProtocolID_fkey" FOREIGN KEY ("molecularProtocolID") REFERENCES public."molecular-protocol"("molecularProtocolID");


--
-- Name: molecular-protocol-reference molecular-protocol-reference_molecularProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."molecular-protocol-reference"
    ADD CONSTRAINT "molecular-protocol-reference_molecularProtocolID_fkey" FOREIGN KEY ("molecularProtocolID") REFERENCES public."molecular-protocol"("molecularProtocolID");


--
-- Name: nucleotide-analysis-assertion nucleotide-analysis-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."nucleotide-analysis-assertion"
    ADD CONSTRAINT "nucleotide-analysis-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: nucleotide-analysis-assertion nucleotide-analysis-assertion_nucleotideAnalysisID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."nucleotide-analysis-assertion"
    ADD CONSTRAINT "nucleotide-analysis-assertion_nucleotideAnalysisID_fkey" FOREIGN KEY ("nucleotideAnalysisID") REFERENCES public."nucleotide-analysis"("nucleotideAnalysisID");


--
-- Name: nucleotide-analysis nucleotide-analysis_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."nucleotide-analysis"
    ADD CONSTRAINT "nucleotide-analysis_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: nucleotide-analysis nucleotide-analysis_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."nucleotide-analysis"
    ADD CONSTRAINT "nucleotide-analysis_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- Name: nucleotide-analysis nucleotide-analysis_molecularProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."nucleotide-analysis"
    ADD CONSTRAINT "nucleotide-analysis_molecularProtocolID_fkey" FOREIGN KEY ("molecularProtocolID") REFERENCES public."molecular-protocol"("molecularProtocolID");


--
-- Name: nucleotide-analysis nucleotide-analysis_nucleotideSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."nucleotide-analysis"
    ADD CONSTRAINT "nucleotide-analysis_nucleotideSequenceID_fkey" FOREIGN KEY ("nucleotideSequenceID") REFERENCES public."nucleotide-sequence"("nucleotideSequenceID");


--
-- Name: occurrence-agent-role occurrence-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-agent-role"
    ADD CONSTRAINT "occurrence-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: occurrence-agent-role occurrence-agent-role_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-agent-role"
    ADD CONSTRAINT "occurrence-agent-role_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- Name: occurrence-assertion occurrence-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-assertion"
    ADD CONSTRAINT "occurrence-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: occurrence-assertion occurrence-assertion_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-assertion"
    ADD CONSTRAINT "occurrence-assertion_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- Name: occurrence-identifier occurrence-identifier_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-identifier"
    ADD CONSTRAINT "occurrence-identifier_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- Name: occurrence-media occurrence-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-media"
    ADD CONSTRAINT "occurrence-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- Name: occurrence-media occurrence-media_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-media"
    ADD CONSTRAINT "occurrence-media_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- Name: occurrence-protocol occurrence-protocol_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-protocol"
    ADD CONSTRAINT "occurrence-protocol_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- Name: occurrence-protocol occurrence-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-protocol"
    ADD CONSTRAINT "occurrence-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- Name: occurrence-reference occurrence-reference_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-reference"
    ADD CONSTRAINT "occurrence-reference_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- Name: organism-interaction-agent-role organism-interaction-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-agent-role"
    ADD CONSTRAINT "organism-interaction-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: organism-interaction-agent-role organism-interaction-agent-role_organismInteractionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-agent-role"
    ADD CONSTRAINT "organism-interaction-agent-role_organismInteractionID_fkey" FOREIGN KEY ("organismInteractionID") REFERENCES public."organism-interaction"("organismInteractionID");


--
-- Name: organism-interaction-assertion organism-interaction-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-assertion"
    ADD CONSTRAINT "organism-interaction-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: organism-interaction-assertion organism-interaction-assertion_organismInteractionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-assertion"
    ADD CONSTRAINT "organism-interaction-assertion_organismInteractionID_fkey" FOREIGN KEY ("organismInteractionID") REFERENCES public."organism-interaction"("organismInteractionID");


--
-- Name: organism-interaction-media organism-interaction-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-media"
    ADD CONSTRAINT "organism-interaction-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- Name: organism-interaction-media organism-interaction-media_organismInteractionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-media"
    ADD CONSTRAINT "organism-interaction-media_organismInteractionID_fkey" FOREIGN KEY ("organismInteractionID") REFERENCES public."organism-interaction"("organismInteractionID");


--
-- Name: organism-interaction-reference organism-interaction-reference_organismInteractionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-reference"
    ADD CONSTRAINT "organism-interaction-reference_organismInteractionID_fkey" FOREIGN KEY ("organismInteractionID") REFERENCES public."organism-interaction"("organismInteractionID");


--
-- Name: organism-interaction organism-interaction_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction"
    ADD CONSTRAINT "organism-interaction_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: organism-interaction organism-interaction_relatedOccurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction"
    ADD CONSTRAINT "organism-interaction_relatedOccurrenceID_fkey" FOREIGN KEY ("relatedOccurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- Name: organism-interaction organism-interaction_subjectOccurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction"
    ADD CONSTRAINT "organism-interaction_subjectOccurrenceID_fkey" FOREIGN KEY ("subjectOccurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- Name: phylogenetic-tree-assertion phylogenetic-tree-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-assertion"
    ADD CONSTRAINT "phylogenetic-tree-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: phylogenetic-tree-assertion phylogenetic-tree-assertion_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-assertion"
    ADD CONSTRAINT "phylogenetic-tree-assertion_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


--
-- Name: phylogenetic-tree-identifier phylogenetic-tree-identifier_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-identifier"
    ADD CONSTRAINT "phylogenetic-tree-identifier_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


--
-- Name: phylogenetic-tree-media phylogenetic-tree-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-media"
    ADD CONSTRAINT "phylogenetic-tree-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- Name: phylogenetic-tree-media phylogenetic-tree-media_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-media"
    ADD CONSTRAINT "phylogenetic-tree-media_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


--
-- Name: phylogenetic-tree-protocol phylogenetic-tree-protocol_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-protocol"
    ADD CONSTRAINT "phylogenetic-tree-protocol_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


--
-- Name: phylogenetic-tree-protocol phylogenetic-tree-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-protocol"
    ADD CONSTRAINT "phylogenetic-tree-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- Name: phylogenetic-tree-reference phylogenetic-tree-reference_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-reference"
    ADD CONSTRAINT "phylogenetic-tree-reference_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


--
-- Name: phylogenetic-tree-tip-assertion phylogenetic-tree-tip-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip-assertion"
    ADD CONSTRAINT "phylogenetic-tree-tip-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: phylogenetic-tree-tip-assertion phylogenetic-tree-tip-assertion_phylogeneticTreeTipID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip-assertion"
    ADD CONSTRAINT "phylogenetic-tree-tip-assertion_phylogeneticTreeTipID_fkey" FOREIGN KEY ("phylogeneticTreeTipID") REFERENCES public."phylogenetic-tree-tip"("phylogeneticTreeTipID");


--
-- Name: phylogenetic-tree-tip phylogenetic-tree-tip_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip"
    ADD CONSTRAINT "phylogenetic-tree-tip_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


--
-- Name: protocol-reference protocol-reference_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."protocol-reference"
    ADD CONSTRAINT "protocol-reference_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- Name: survey-agent-role survey-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-agent-role"
    ADD CONSTRAINT "survey-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: survey-agent-role survey-agent-role_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-agent-role"
    ADD CONSTRAINT "survey-agent-role_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


--
-- Name: survey-assertion survey-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-assertion"
    ADD CONSTRAINT "survey-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: survey-assertion survey-assertion_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-assertion"
    ADD CONSTRAINT "survey-assertion_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


--
-- Name: survey-identifier survey-identifier_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-identifier"
    ADD CONSTRAINT "survey-identifier_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


--
-- Name: survey-protocol survey-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-protocol"
    ADD CONSTRAINT "survey-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- Name: survey-protocol survey-protocol_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-protocol"
    ADD CONSTRAINT "survey-protocol_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


--
-- Name: survey-reference survey-reference_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-reference"
    ADD CONSTRAINT "survey-reference_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


--
-- Name: survey-target survey-target_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-target"
    ADD CONSTRAINT "survey-target_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


--
-- Name: survey survey_samplingEffortProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey
    ADD CONSTRAINT "survey_samplingEffortProtocolID_fkey" FOREIGN KEY ("samplingEffortProtocolID") REFERENCES public.protocol("protocolID");


--
-- PostgreSQL database dump complete
--

