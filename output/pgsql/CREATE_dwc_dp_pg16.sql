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

COMMENT ON TABLE public.agent IS 'The name of an Agent preferred in searches and results.';


--
-- Name: COLUMN agent."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN agent."agentType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."agentType" IS 'The category that best matches the type of an Agent.';


--
-- Name: COLUMN agent."agentTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."agentTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Agent.';


--
-- Name: COLUMN agent."agentTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."agentTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in agentType is given.';


--
-- Name: COLUMN agent."preferredAgentName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."preferredAgentName" IS 'The name of an Agent preferred in searches and results.';


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

COMMENT ON TABLE public."agent-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "agent-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "agent-agent-role"."relatedAgentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."relatedAgentID" IS 'An identifier for a related Agent.';


--
-- Name: COLUMN "agent-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "agent-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- Name: COLUMN "agent-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- Name: COLUMN "agent-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "agent-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


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

COMMENT ON TABLE public."agent-identifier" IS 'A language in which an Identifier is presented.';


--
-- Name: COLUMN "agent-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "agent-identifier"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "agent-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "agent-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- Name: COLUMN "agent-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in identifierType is given.';


--
-- Name: COLUMN "agent-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


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

COMMENT ON TABLE public."agent-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "agent-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "agent-media"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "agent-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "agent-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- Name: COLUMN "agent-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


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

COMMENT ON TABLE public."chronometric-age" IS 'Comments or notes about a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeID" IS 'An identifier for a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN "chronometric-age"."verbatimChronometricAge"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."verbatimChronometricAge" IS 'The verbatim age for a dwc:Event, whether reported by a dating assay, associated references, or legacy information.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeProtocol" IS 'A description of or reference to the methods used to determine a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeProtocolID" IS 'An identifier for the Protocol used to determine a ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."uncalibratedChronometricAge"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."uncalibratedChronometricAge" IS 'The output of a dating assay before it is calibrated into an age using a specific conversion protocol.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeConversionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeConversionProtocol" IS 'The method used for converting the chrono:uncalibratedChronometricAge into a chronometric age in years, as captured in the chrono:earliestChronometricAge, chrono:earliestChronometricAgeReferenceSystem, chrono:latestChronometricAge, and chrono:latestChronometricAgeReferenceSystem fields.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeConversionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeConversionProtocolID" IS 'An identifier for the Protocol used to convert a chrono:uncalibratedChronometricAge into a chronometric age in years, as captured in the chrono:earliestChronometricAge, chrono:earliestChronometricAgeReferenceSystem, chrono:latestChronometricAge, and chrono:latestChronometricAgeReferenceSystem fields.';


--
-- Name: COLUMN "chronometric-age"."earliestChronometricAge"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."earliestChronometricAge" IS 'The maximum/earliest/oldest possible age of a specimen as determined by a dating method.';


--
-- Name: COLUMN "chronometric-age"."earliestChronometricAgeReferenceSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."earliestChronometricAgeReferenceSystem" IS 'The reference system associated with the chrono:earliestChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."latestChronometricAge"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."latestChronometricAge" IS 'The minimum/latest/youngest possible age of a specimen as determined by a dating method.';


--
-- Name: COLUMN "chronometric-age"."latestChronometricAgeReferenceSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."latestChronometricAgeReferenceSystem" IS 'The reference system associated with the chrono:latestChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeUncertaintyInYears"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeUncertaintyInYears" IS 'The temporal uncertainty of the chrono:earliestChronometricAge and chrono:latestChronometicAge in years.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeUncertaintyMethod"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeUncertaintyMethod" IS 'The method used to generate the value of chrono:ChronometricAgeUncertaintyInYears.';


--
-- Name: COLUMN "chronometric-age"."materialDated"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."materialDated" IS 'A description of the material on which the chrono:ChronometricAgeProtocol was actually performed, if known.';


--
-- Name: COLUMN "chronometric-age"."materialDatedID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."materialDatedID" IS 'An identifier for the MaterialEntity on which the chrono:ChronometricAgeProtocol was performed, if applicable.';


--
-- Name: COLUMN "chronometric-age"."materialDatedRelationship"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."materialDatedRelationship" IS 'The relationship of the chrono:materialDated to a dwc:MaterialEntity, from which the chrono:ChronometricAge of the related dwc:MaterialEntity and any related dwc:Occurrence is inferred.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeDeterminedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeDeterminedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who determined the chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeDeterminedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeDeterminedByID" IS 'The identifier for the Agent who determined the chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeDeterminedDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeDeterminedDate" IS 'The date on which the chrono:ChronometricAge was determined.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeReferences" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with the chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age"."chronometricAgeRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeRemarks" IS 'Comments or notes about a chrono:ChronometricAge.';


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

COMMENT ON TABLE public."chronometric-age-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "chronometric-age-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "chronometric-age-agent-role"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."chronometricAgeID" IS 'An identifier a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "chronometric-age-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- Name: COLUMN "chronometric-age-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- Name: COLUMN "chronometric-age-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "chronometric-age-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."chronometric-age-assertion" OWNER TO postgres;

--
-- Name: TABLE "chronometric-age-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."chronometricAgeID" IS 'An identifier a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "chronometric-age-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- Name: chronometric-age-citation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."chronometric-age-citation" (
    "citationID" text NOT NULL,
    "chronometricAgeID" text NOT NULL,
    "citationType" text,
    "citationTypeIRI" text,
    "citationTypeVocabulary" text,
    "bibliographicCitation" text,
    "pageNumber" text,
    "referenceID" text,
    "referenceType" text,
    "referenceTypeIRI" text,
    "referenceTypeVocabulary" text,
    "referenceYear" integer,
    "isPeerReviewed" boolean,
    "citationRemarks" text
);


ALTER TABLE public."chronometric-age-citation" OWNER TO postgres;

--
-- Name: TABLE "chronometric-age-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age-citation" IS 'Comments or notes about a Citation.';


--
-- Name: COLUMN "chronometric-age-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."citationID" IS 'An identifier for a Citation.';


--
-- Name: COLUMN "chronometric-age-citation"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."chronometricAgeID" IS 'An identifier a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- Name: COLUMN "chronometric-age-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- Name: COLUMN "chronometric-age-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in citationType is given.';


--
-- Name: COLUMN "chronometric-age-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- Name: COLUMN "chronometric-age-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- Name: COLUMN "chronometric-age-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- Name: COLUMN "chronometric-age-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- Name: COLUMN "chronometric-age-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- Name: COLUMN "chronometric-age-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in referenceType is given.';


--
-- Name: COLUMN "chronometric-age-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- Name: COLUMN "chronometric-age-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- Name: COLUMN "chronometric-age-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


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

COMMENT ON TABLE public."chronometric-age-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "chronometric-age-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "chronometric-age-media"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."chronometricAgeID" IS 'An identifier a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "chronometric-age-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- Name: COLUMN "chronometric-age-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


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

COMMENT ON TABLE public."chronometric-age-protocol" IS 'An identifier a chrono:ChronometricAge.';


--
-- Name: COLUMN "chronometric-age-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- Name: COLUMN "chronometric-age-protocol"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-protocol"."chronometricAgeID" IS 'An identifier a chrono:ChronometricAge.';


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

COMMENT ON TABLE public.collection IS 'The name (or acronym) in use by an institution.';


--
-- Name: COLUMN collection."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."collectionID" IS 'An identifier for a Collection.';


--
-- Name: COLUMN collection."collectionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."collectionType" IS 'The category that best matches the nature of a Collection.';


--
-- Name: COLUMN collection."collectionName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."collectionName" IS 'The name of a Collection.';


--
-- Name: COLUMN collection."collectionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."collectionCode" IS 'The name, acronym, coden, or initialism identifying a Collection.';


--
-- Name: COLUMN collection."institutionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."institutionID" IS 'The identifier for an institution.';


--
-- Name: COLUMN collection."institutionName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."institutionName" IS 'The name of an institution or organization.';


--
-- Name: COLUMN collection."institutionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."institutionCode" IS 'The name (or acronym) in use by an institution.';


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

COMMENT ON TABLE public."collection-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "collection-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "collection-agent-role"."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."collectionID" IS 'An identifier for a Collection.';


--
-- Name: COLUMN "collection-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "collection-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- Name: COLUMN "collection-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- Name: COLUMN "collection-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRoleTargetID and agentRoleTargetType.';


--
-- Name: COLUMN "collection-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."collection-assertion" OWNER TO postgres;

--
-- Name: TABLE "collection-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."collection-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "collection-assertion"."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."collectionID" IS 'An identifier for a Collection.';


--
-- Name: COLUMN "collection-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- Name: COLUMN "collection-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "collection-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "collection-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "collection-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- Name: COLUMN "collection-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "collection-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "collection-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "collection-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "collection-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "collection-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


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

COMMENT ON TABLE public."collection-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "collection-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "collection-media"."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."collectionID" IS 'An identifier for a Collection.';


--
-- Name: COLUMN "collection-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "collection-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- Name: COLUMN "collection-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    "eventID" text NOT NULL,
    "parentEventID" text,
    "preferredEventName" text,
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
    "sampleSizeValue" text,
    "sampleSizeUnit" text,
    "eventEffort" text,
    "fieldNotes" text,
    "eventCitation" text,
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
    CONSTRAINT "event_coordinateUncertaintyInMeters_check" CHECK (("coordinateUncertaintyInMeters" <= 20037509)),
    CONSTRAINT "event_coordinateUncertaintyInMeters_check1" CHECK (("coordinateUncertaintyInMeters" >= 1)),
    CONSTRAINT event_day_check CHECK ((day >= 1)),
    CONSTRAINT event_day_check1 CHECK ((day <= 31)),
    CONSTRAINT "event_decimalLatitude_check" CHECK (("decimalLatitude" >= ('-90'::integer)::numeric)),
    CONSTRAINT "event_decimalLatitude_check1" CHECK (("decimalLatitude" <= (90)::numeric)),
    CONSTRAINT "event_decimalLongitude_check" CHECK (("decimalLongitude" <= (180)::numeric)),
    CONSTRAINT "event_decimalLongitude_check1" CHECK (("decimalLongitude" >= ('-180'::integer)::numeric)),
    CONSTRAINT "event_endDayOfYear_check" CHECK (("endDayOfYear" <= 366)),
    CONSTRAINT "event_endDayOfYear_check1" CHECK (("endDayOfYear" >= 1)),
    CONSTRAINT "event_maximumDepthInMeters_check" CHECK (("maximumDepthInMeters" <= (11000)::numeric)),
    CONSTRAINT "event_maximumDepthInMeters_check1" CHECK (("maximumDepthInMeters" >= (0)::numeric)),
    CONSTRAINT "event_maximumElevationInMeters_check" CHECK (("maximumElevationInMeters" <= (8850)::numeric)),
    CONSTRAINT "event_maximumElevationInMeters_check1" CHECK (("maximumElevationInMeters" >= ('-430'::integer)::numeric)),
    CONSTRAINT "event_minimumDepthInMeters_check" CHECK (("minimumDepthInMeters" >= (0)::numeric)),
    CONSTRAINT "event_minimumDepthInMeters_check1" CHECK (("minimumDepthInMeters" <= (11000)::numeric)),
    CONSTRAINT "event_minimumElevationInMeters_check" CHECK (("minimumElevationInMeters" >= ('-430'::integer)::numeric)),
    CONSTRAINT "event_minimumElevationInMeters_check1" CHECK (("minimumElevationInMeters" <= (8850)::numeric)),
    CONSTRAINT event_month_check CHECK ((month <= 12)),
    CONSTRAINT event_month_check1 CHECK ((month >= 1)),
    CONSTRAINT "event_pointRadiusSpatialFit_check" CHECK (("pointRadiusSpatialFit" >= (0)::numeric)),
    CONSTRAINT "event_startDayOfYear_check" CHECK (("startDayOfYear" >= 1)),
    CONSTRAINT "event_startDayOfYear_check1" CHECK (("startDayOfYear" <= 366))
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: TABLE event; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.event IS 'An indication of which spatial representation best represents the dcterms:Location.';


--
-- Name: COLUMN event."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN event."parentEventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."parentEventID" IS 'An identifier for a broader dwc:Event that groups this and potentially other dwc:Events.';


--
-- Name: COLUMN event."preferredEventName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."preferredEventName" IS 'The name of a dwc:Event preferred in searches and results.';


--
-- Name: COLUMN event."eventType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventType" IS 'The category that best matches the nature of a dwc:Event.';


--
-- Name: COLUMN event."datasetName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."datasetName" IS 'A name for a dataset from which data originated.';


--
-- Name: COLUMN event."datasetID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."datasetID" IS 'An identifier for a dataset from which data originated.';


--
-- Name: COLUMN event."fieldNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."fieldNumber" IS 'An identifier given to a dwc:Event in the field.';


--
-- Name: COLUMN event."eventConductedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventConductedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations responsible for conducting or recording a dwc:Event.';


--
-- Name: COLUMN event."eventConductedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventConductedByID" IS 'An identifier for the Agent responsible for conducting or recording a dwc:Event.';


--
-- Name: COLUMN event."eventDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventDate" IS 'The date or time interval during which a dwc:Event occurred.';


--
-- Name: COLUMN event."eventTime"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventTime" IS 'The time or interval during which a dwc:Event occurred.';


--
-- Name: COLUMN event."startDayOfYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."startDayOfYear" IS 'The earliest integer day of the year on which a dwc:Event occurred (1 for January 1, 365 for December 31, except in a leap year, in which case it is 366).';


--
-- Name: COLUMN event."endDayOfYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."endDayOfYear" IS 'The latest integer day of the year on which a dwc:Event occurred (1 for January 1, 365 for December 31, except in a leap year, in which case it is 366).';


--
-- Name: COLUMN event.year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.year IS 'The four-digit year in which a dwc:Event occurred, according to the Common Era Calendar.';


--
-- Name: COLUMN event.month; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.month IS 'The integer month in which a dwc:Event occurred.';


--
-- Name: COLUMN event.day; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.day IS 'The integer day of the month on which a dwc:Event occurred.';


--
-- Name: COLUMN event."verbatimEventDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimEventDate" IS 'The verbatim original representation of the date and time information for a dwc:Event.';


--
-- Name: COLUMN event."verbatimLocality"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimLocality" IS 'The original textual description of a dcterms:Location of a dwc:Event.';


--
-- Name: COLUMN event."verbatimElevation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimElevation" IS 'The original description of the elevation (altitude, usually above sea level) of a dcterms:Location.';


--
-- Name: COLUMN event."verbatimDepth"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimDepth" IS 'The original description of the depth below a local surface.';


--
-- Name: COLUMN event."verbatimCoordinates"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimCoordinates" IS 'The verbatim original spatial coordinates of a dcterms:Location.';


--
-- Name: COLUMN event."verbatimLatitude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimLatitude" IS 'The verbatim original latitude of a dcterms:Location.';


--
-- Name: COLUMN event."verbatimLongitude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimLongitude" IS 'The verbatim original longitude of a dcterms:Location.';


--
-- Name: COLUMN event."verbatimCoordinateSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimCoordinateSystem" IS 'The coordinate format for dwc:verbatimLatitude and dwc:verbatimLongitude or dwc:verbatimCoordinates.';


--
-- Name: COLUMN event."verbatimSRS"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimSRS" IS 'The ellipsoid, geodetic datum, or spatial reference system (SRS) upon which coordinates given in dwc:verbatimLatitude and dwc:verbatimLongitude, or dwc:verbatimCoordinates are based.';


--
-- Name: COLUMN event."georeferenceVerificationStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceVerificationStatus" IS 'A categorical description of the extent to which the georeference has been verified to represent the best possible spatial description for the dcterms:Location of a dwc:Occurrence.';


--
-- Name: COLUMN event.habitat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.habitat IS 'A category or description of the habitat in which a dwc:Event occurred.';


--
-- Name: COLUMN event."sampleSizeValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."sampleSizeValue" IS 'A numeric value for a measurement of the size (time duration, length, area, or volume) of a sample in a sampling dwc:Event.';


--
-- Name: COLUMN event."sampleSizeUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."sampleSizeUnit" IS 'The unit of measurement of the size (time duration, length, area, or volume) of a sample in a sampling dwc:Event.';


--
-- Name: COLUMN event."eventEffort"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventEffort" IS 'The amount of effort expended during a dwc:Event.';


--
-- Name: COLUMN event."fieldNotes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."fieldNotes" IS 'One of a) an indicator of the existence of, b) a reference to (publication, URI), or c) the text of notes taken in the field about a dwc:Event.';


--
-- Name: COLUMN event."eventCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a dwc:Event.';


--
-- Name: COLUMN event."eventRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventRemarks" IS 'Comments or notes about a dwc:Event.';


--
-- Name: COLUMN event."locationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."locationID" IS 'An identifier a dcterms:Location.';


--
-- Name: COLUMN event."higherGeographyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."higherGeographyID" IS 'An identifier for the geographic region within which the dcterms:Location occurred.';


--
-- Name: COLUMN event."higherGeography"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."higherGeography" IS 'A list (concatenated and separated) of geographic names less specific than the information captured in dwc:locality.';


--
-- Name: COLUMN event.continent; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.continent IS 'The name of the continent in which the dcterms:Location occurs.';


--
-- Name: COLUMN event."waterBody"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."waterBody" IS 'The name of the water body in which a dcterms:Location occurs.';


--
-- Name: COLUMN event."islandGroup"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."islandGroup" IS 'The name of the island group in which a dcterms:Location occurs.';


--
-- Name: COLUMN event.island; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.island IS 'The name of the island on or near which a dcterms:Location occurs.';


--
-- Name: COLUMN event.country; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.country IS 'The name of the country or major administrative unit in which the dcterms:Location occurs.';


--
-- Name: COLUMN event."countryCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."countryCode" IS 'The standard code for the country in which the dcterms:Location occurs.';


--
-- Name: COLUMN event."stateProvince"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."stateProvince" IS 'The name of the next smaller administrative region than country (state, province, canton, department, region, etc.) in which a dcterms:Location occurs.';


--
-- Name: COLUMN event.county; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.county IS 'The full, unabbreviated name of the next smaller administrative region than dwc:stateProvince (county, shire, department, etc.) in which the dcterms:Location occurs.';


--
-- Name: COLUMN event.municipality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.municipality IS 'The full, unabbreviated name of the next smaller administrative region than county (city, municipality, etc.) in which a dcterms:Location occurs. Do not use this term for a nearby named place that does not contain the actual location.';


--
-- Name: COLUMN event.locality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.locality IS 'The specific description of the place.';


--
-- Name: COLUMN event."minimumElevationInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."minimumElevationInMeters" IS 'The lower limit of the range of elevation (altitude, usually above sea level), in meters.';


--
-- Name: COLUMN event."maximumElevationInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."maximumElevationInMeters" IS 'The upper limit of the range of elevation (altitude, usually above sea level), in meters.';


--
-- Name: COLUMN event."verticalDatum"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verticalDatum" IS 'The vertical datum used as the reference upon which the values in the elevation terms are based.';


--
-- Name: COLUMN event."minimumDepthInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."minimumDepthInMeters" IS 'The lesser depth of a range of depth below the local surface, in meters.';


--
-- Name: COLUMN event."maximumDepthInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."maximumDepthInMeters" IS 'The greater depth of a range of depth below the local surface, in meters.';


--
-- Name: COLUMN event."minimumDistanceAboveSurfaceInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."minimumDistanceAboveSurfaceInMeters" IS 'The lesser distance in a range of distance from a reference surface in the vertical direction, in meters. Use positive values for locations above the surface, negative values for locations below. If depth measures are given, the reference surface is the location given by the depth, otherwise the reference surface is the location given by the elevation.';


--
-- Name: COLUMN event."maximumDistanceAboveSurfaceInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."maximumDistanceAboveSurfaceInMeters" IS 'The greater distance in a range of distance from a reference surface in the vertical direction, in meters. Use positive values for locations above the surface, negative values for locations below. If depth measures are given, the reference surface is the location given by the depth, otherwise the reference surface is the location given by the elevation.';


--
-- Name: COLUMN event."locationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."locationRemarks" IS 'Comments or notes about a dcterms:Location.';


--
-- Name: COLUMN event."decimalLatitude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."decimalLatitude" IS 'The geographic latitude (in decimal degrees, using the spatial reference system given in dwc:geodeticDatum) of the geographic center of a dcterms:Location.';


--
-- Name: COLUMN event."decimalLongitude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."decimalLongitude" IS 'The geographic longitude (in decimal degrees, using the spatial reference system given in dwc:geodeticDatum) of the geographic center of a dcterms:Location.';


--
-- Name: COLUMN event."geodeticDatum"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."geodeticDatum" IS 'The ellipsoid, geodetic datum, or spatial reference system (SRS) upon which the geographic coordinates given in dwc:decimalLatitude and dwc:decimalLongitude as based.';


--
-- Name: COLUMN event."coordinateUncertaintyInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."coordinateUncertaintyInMeters" IS 'The horizontal distance (in meters) from the given dwc:decimalLatitude and dwc:decimalLongitude describing the smallest circle containing the whole of the dcterms:Location.';


--
-- Name: COLUMN event."coordinatePrecision"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."coordinatePrecision" IS 'A decimal representation of the precision of the coordinates given in a dwc:decimalLatitude and dwc:decimalLongitude.';


--
-- Name: COLUMN event."pointRadiusSpatialFit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."pointRadiusSpatialFit" IS 'The ratio of the area of the point-radius (dwc:decimalLatitude, dwc:decimalLongitude, dwc:coordinateUncertaintyInMeters) to the area of the true (original, or most specific) spatial representation of a dcterms:Location.';


--
-- Name: COLUMN event."footprintWKT"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."footprintWKT" IS 'A Well-Known Text (WKT) representation of the shape (footprint, geometry) that defines a dcterms:Location.';


--
-- Name: COLUMN event."footprintSRS"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."footprintSRS" IS 'The ellipsoid, geodetic datum, or spatial reference system (SRS) upon which the geometry given in dwc:footprintWKT is based.';


--
-- Name: COLUMN event."footprintSpatialFit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."footprintSpatialFit" IS 'The ratio of the area of the footprint (footprintWKT) to the area of the true (original, or most specific) spatial representation of a dcterms:Location.';


--
-- Name: COLUMN event."georeferencedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferencedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who determined a georeference (spatial representation) for a dcterms:Location.';


--
-- Name: COLUMN event."georeferencedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferencedByID" IS 'An identifier for the Agent who georeferenced a dwc:Event.';


--
-- Name: COLUMN event."georeferencedDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferencedDate" IS 'The date on which a dcterms:Location was georeferenced.';


--
-- Name: COLUMN event."georeferenceProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceProtocol" IS 'A description or reference to the methods used to determine the spatial footprint, coordinates, and uncertainties.';


--
-- Name: COLUMN event."georeferenceProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceProtocolID" IS 'An identifier for a Protocol used to georeference a dwc:Event.';


--
-- Name: COLUMN event."georeferenceSources"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceSources" IS 'A list (concatenated and separated) of maps, gazetteers, or other resources used to georeference a dcterms:Location, described specifically enough to allow anyone in the future to use the same resources.';


--
-- Name: COLUMN event."georeferenceRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceRemarks" IS 'Comments or notes about a spatial description determination, explaining assumptions made in addition or opposition to the those formalized in the method referred to in dwc:georeferenceProtocol.';


--
-- Name: COLUMN event."informationWithheld"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."informationWithheld" IS 'Additional information that exists, but that has not been shared in the given record.';


--
-- Name: COLUMN event."dataGeneralizations"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."dataGeneralizations" IS 'Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- Name: COLUMN event."preferredSpatialRepresentation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."preferredSpatialRepresentation" IS 'An indication of which spatial representation best represents the dcterms:Location.';


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

COMMENT ON TABLE public."event-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "event-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "event-agent-role"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN "event-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "event-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- Name: COLUMN "event-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- Name: COLUMN "event-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRoleTargetID and agentRoleTargetType.';


--
-- Name: COLUMN "event-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."event-assertion" OWNER TO postgres;

--
-- Name: TABLE "event-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "event-assertion"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN "event-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- Name: COLUMN "event-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "event-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "event-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "event-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- Name: COLUMN "event-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "event-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "event-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "event-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "event-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "event-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- Name: event-citation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."event-citation" (
    "citationID" text NOT NULL,
    "eventID" text NOT NULL,
    "citationType" text,
    "citationTypeIRI" text,
    "citationTypeVocabulary" text,
    "bibliographicCitation" text,
    "pageNumber" text,
    "referenceID" text,
    "referenceType" text,
    "referenceTypeIRI" text,
    "referenceTypeVocabulary" text,
    "referenceYear" integer,
    "isPeerReviewed" boolean,
    "citationRemarks" text
);


ALTER TABLE public."event-citation" OWNER TO postgres;

--
-- Name: TABLE "event-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-citation" IS 'Comments or notes about a Citation.';


--
-- Name: COLUMN "event-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."citationID" IS 'An identifier for a Citation.';


--
-- Name: COLUMN "event-citation"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN "event-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- Name: COLUMN "event-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- Name: COLUMN "event-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in citationType is given.';


--
-- Name: COLUMN "event-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- Name: COLUMN "event-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- Name: COLUMN "event-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- Name: COLUMN "event-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- Name: COLUMN "event-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- Name: COLUMN "event-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in referenceType is given.';


--
-- Name: COLUMN "event-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- Name: COLUMN "event-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- Name: COLUMN "event-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


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

COMMENT ON TABLE public."event-identifier" IS 'A language in which an Identifier is presented.';


--
-- Name: COLUMN "event-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "event-identifier"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN "event-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "event-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- Name: COLUMN "event-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in identifierType is given.';


--
-- Name: COLUMN "event-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


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

COMMENT ON TABLE public."event-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "event-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "event-media"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN "event-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "event-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- Name: COLUMN "event-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


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

COMMENT ON TABLE public."event-protocol" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN "event-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- Name: COLUMN "event-protocol"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-protocol"."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: genetic-analysis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."genetic-analysis" (
    "geneticAnalysisID" text NOT NULL,
    "eventID" text NOT NULL,
    "geneticProtocolID" text NOT NULL,
    "geneticSequenceID" text,
    "materialEntityID" text,
    "readCount" integer,
    "totalReadCount" integer
);


ALTER TABLE public."genetic-analysis" OWNER TO postgres;

--
-- Name: TABLE "genetic-analysis"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-analysis" IS 'The total number of reads in the analysis.';


--
-- Name: COLUMN "genetic-analysis"."geneticAnalysisID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-analysis"."geneticAnalysisID" IS 'An identifier for a GeneticAnalysis.';


--
-- Name: COLUMN "genetic-analysis"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-analysis"."eventID" IS 'An identifier for an Event.';


--
-- Name: COLUMN "genetic-analysis"."geneticProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-analysis"."geneticProtocolID" IS 'An identifier for a GeneticProtocol.';


--
-- Name: COLUMN "genetic-analysis"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-analysis"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- Name: COLUMN "genetic-analysis"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-analysis"."materialEntityID" IS 'An identifier for a MaterialEntity.';


--
-- Name: COLUMN "genetic-analysis"."readCount"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-analysis"."readCount" IS 'The number of reads for the sequence in the analysis.';


--
-- Name: COLUMN "genetic-analysis"."totalReadCount"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-analysis"."totalReadCount" IS 'The total number of reads in the analysis.';


--
-- Name: genetic-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."genetic-protocol" (
    "geneticProtocolID" text NOT NULL,
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
    url text,
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


ALTER TABLE public."genetic-protocol" OWNER TO postgres;

--
-- Name: TABLE "genetic-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-protocol" IS 'The assay’s ability to quantify copy number at low levels.';


--
-- Name: COLUMN "genetic-protocol"."geneticProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."geneticProtocolID" IS 'An identifier for a GeneticProtocol.';


--
-- Name: COLUMN "genetic-protocol".samp_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".samp_name IS 'Sample Name is a name that you choose for the sample. It can have any format, but we suggest that you make it concise, unique and consistent within your lab, and as informative as possible. Every Sample Name from a single Submitter must be unique. ';


--
-- Name: COLUMN "genetic-protocol".project_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".project_name IS 'Name of the project within which the sequencing was organized';


--
-- Name: COLUMN "genetic-protocol".experimental_factor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".experimental_factor IS 'Experimental factors are essentially the variable aspects of an experiment design which can be used to describe an experiment, or set of experiments, in an increasingly detailed manner. This field accepts ontology terms from Experimental Factor Ontology (EFO) and/or Ontology for Biomedical Investigations (OBI). For a browser of EFO (v 2.95) terms, please see http://purl.bioontology.org/ontology/EFO; for a browser of OBI (v 2018-02-12) terms please see http://purl.bioontology.org/ontology/OBI';


--
-- Name: COLUMN "genetic-protocol".samp_taxon_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".samp_taxon_id IS 'NCBI taxon id of the sample. Maybe be a single taxon or mixed taxa sample. Use "synthetic metagenome" for mock community/positive controls, or "blank sample" for negative controls';


--
-- Name: COLUMN "genetic-protocol".neg_cont_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".neg_cont_type IS 'The substance or equipment used as a negative control in an investigation';


--
-- Name: COLUMN "genetic-protocol".pos_cont_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pos_cont_type IS 'The substance, mixture, product, or apparatus used to verify that a process which is part of an investigation delivers a true positive';


--
-- Name: COLUMN "genetic-protocol".env_broad_scale; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".env_broad_scale IS 'In this field, report which major environmental system your sample or specimen came from. The systems identified should have a coarse spatial grain, to provide the general environmental context of where the sampling was done (e.g. were you in the desert or a rainforest?). We recommend using subclasses of ENVO’s biome class: http://purl.obolibrary.org/obo/ENVO_00000428. Format (one term): termLabel [termID], Format (multiple terms): termLabel [termID]|termLabel [termID]|termLabel [termID]. Example: Annotating a water sample from the photic zone in middle of the Atlantic Ocean, consider: oceanic epipelagic zone biome [ENVO:01000033]. Example: Annotating a sample from the Amazon rainforest consider: tropical moist broadleaf forest biome [ENVO:01000228]. If needed, request new terms on the ENVO tracker, identified here: http://www.obofoundry.org/ontology/envo.html';


--
-- Name: COLUMN "genetic-protocol".env_local_scale; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".env_local_scale IS 'In this field, report the entity or entities which are in your sample or specimen’s local vicinity and which you believe have significant causal influences on your sample or specimen. Please use terms that are present in ENVO and which are of smaller spatial grain than your entry for env_broad_scale. Format (one term): termLabel [termID]; Format (multiple terms): termLabel [termID]|termLabel [termID]|termLabel [termID]. Example: Annotating a pooled sample taken from various vegetation layers in a forest consider: canopy [ENVO:00000047]|herb and fern layer [ENVO:01000337]|litter layer [ENVO:01000338]|understory [01000335]|shrub layer [ENVO:01000336]. If needed, request new terms on the ENVO tracker, identified here: http://www.obofoundry.org/ontology/envo.html';


--
-- Name: COLUMN "genetic-protocol".env_medium; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".env_medium IS 'In this field, report which environmental material or materials (pipe separated) immediately surrounded your sample or specimen prior to sampling, using one or more subclasses of ENVO’s environmental material class: http://purl.obolibrary.org/obo/ENVO_00010483. Format (one term): termLabel [termID]; Format (multiple terms): termLabel [termID]|termLabel [termID]|termLabel [termID]. Example: Annotating a fish swimming in the upper 100 m of the Atlantic Ocean, consider: ocean water [ENVO:00002151]. Example: Annotating a duck on a pond consider: pond water [ENVO:00002228]|air ENVO_00002005. If needed, request new terms on the ENVO tracker, identified here: http://www.obofoundry.org/ontology/envo.html';


--
-- Name: COLUMN "genetic-protocol".subspecf_gen_lin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".subspecf_gen_lin IS 'This should provide further information about the genetic distinctness of the sequenced organism by recording additional information e.g. serovar, serotype, biotype, ecotype, or any relevant genetic typing schemes like Group I plasmid. It can also contain alternative taxonomic information. It should contain both the lineage name, and the lineage rank, i.e. biovar:abc123';


--
-- Name: COLUMN "genetic-protocol".ploidy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".ploidy IS 'The ploidy level of the genome (e.g. allopolyploid, haploid, diploid, triploid, tetraploid). It has implications for the downstream study of duplicated gene and regions of the genomes (and perhaps for difficulties in assembly). For terms, please select terms listed under class ploidy (PATO:001374) of Phenotypic Quality Ontology (PATO), and for a browser of PATO (v 2018-03-27) please refer to http://purl.bioontology.org/ontology/PATO';


--
-- Name: COLUMN "genetic-protocol".num_replicons; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".num_replicons IS 'Reports the number of replicons in a nuclear genome of eukaryotes, in the genome of a bacterium or archaea or the number of segments in a segmented virus. Always applied to the haploid chromosome count of a eukaryote';


--
-- Name: COLUMN "genetic-protocol".extrachrom_elements; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".extrachrom_elements IS 'Do plasmids exist of significant phenotypic consequence (e.g. ones that determine virulence or antibiotic resistance). Megaplasmids? Other plasmids (borrelia has 15+ plasmids)';


--
-- Name: COLUMN "genetic-protocol".estimated_size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".estimated_size IS 'The estimated size of the genome prior to sequencing. Of particular importance in the sequencing of (eukaryotic) genome which could remain in draft form for a long or unspecified period.';


--
-- Name: COLUMN "genetic-protocol".ref_biomaterial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".ref_biomaterial IS 'Primary publication if isolated before genome publication; otherwise, primary genome report';


--
-- Name: COLUMN "genetic-protocol".source_mat_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".source_mat_id IS 'A unique identifier assigned to a material sample (as defined by http://rs.tdwg.org/dwc/terms/materialSampleID, and as opposed to a particular digital record of a material sample) used for extracting nucleic acids, and subsequent sequencing. The identifier can refer either to the original material collected or to any derived sub-samples. The INSDC qualifiers /specimen_voucher, /bio_material, or /culture_collection may or may not share the same value as the source_mat_id field. For instance, the /specimen_voucher qualifier and source_mat_id may both contain ´UAM:Herps:14´ , referring to both the specimen voucher and sampled tissue with the same identifier. However, the /culture_collection qualifier may refer to a value from an initial culture (e.g. ATCC:11775) while source_mat_id would refer to an identifier from some derived culture from which the nucleic acids were extracted (e.g. xatc123 or ark:/2154/R2).';


--
-- Name: COLUMN "genetic-protocol".pathogenicity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pathogenicity IS 'To what is the entity pathogenic';


--
-- Name: COLUMN "genetic-protocol".biotic_relationship; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".biotic_relationship IS 'Description of relationship(s) between the subject organism and other organism(s) it is associated with. E.g., parasite on species X; mutualist with species Y. The target organism is the subject of the relationship, and the other organism(s) is the object';


--
-- Name: COLUMN "genetic-protocol".specific_host; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".specific_host IS 'If there is a host involved, please provide its taxid (or environmental if not actually isolated from the dead or alive host - i.e. a pathogen could be isolated from a swipe of a bench etc) and report whether it is a laboratory or natural host)';


--
-- Name: COLUMN "genetic-protocol".host_spec_range; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".host_spec_range IS 'The NCBI taxonomy identifier of the specific host if it is known';


--
-- Name: COLUMN "genetic-protocol".host_disease_stat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".host_disease_stat IS 'List of diseases with which the host has been diagnosed; can include multiple diagnoses. The value of the field depends on host; for humans the terms should be chosen from the DO (Human Disease Ontology) at https://www.disease-ontology.org, non-human host diseases are free text';


--
-- Name: COLUMN "genetic-protocol".trophic_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".trophic_level IS 'Trophic levels are the feeding position in a food chain. Microbes can be a range of producers (e.g. chemolithotroph)';


--
-- Name: COLUMN "genetic-protocol".propagation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".propagation IS 'This field is specific to different taxa. For phages: lytic/lysogenic, for plasmids: incompatibility group, for eukaryotes: sexual/asexual (Note: there is the strong opinion to name phage propagation obligately lytic or temperate, therefore we also give this choice';


--
-- Name: COLUMN "genetic-protocol".encoded_traits; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".encoded_traits IS 'Should include key traits like antibiotic resistance or xenobiotic degradation phenotypes for plasmids, converting genes for phage';


--
-- Name: COLUMN "genetic-protocol".rel_to_oxygen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".rel_to_oxygen IS 'Is this organism an aerobe, anaerobe? Please note that aerobic and anaerobic are valid descriptors for microbial environments';


--
-- Name: COLUMN "genetic-protocol".isol_growth_condt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".isol_growth_condt IS 'Publication reference in the form of pubmed ID (pmid), digital object identifier (doi) or url for isolation and growth condition specifications of the organism/material';


--
-- Name: COLUMN "genetic-protocol".samp_collec_device; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".samp_collec_device IS 'The device used to collect an environmental sample. This field accepts terms listed under environmental sampling device (http://purl.obolibrary.org/obo/ENVO). This field also accepts terms listed under specimen collection device (http://purl.obolibrary.org/obo/GENEPIO_0002094).';


--
-- Name: COLUMN "genetic-protocol".samp_collec_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".samp_collec_method IS 'The method employed for collecting the sample';


--
-- Name: COLUMN "genetic-protocol".samp_mat_process; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".samp_mat_process IS 'Any processing applied to the sample during or after retrieving the sample from environment. This field accepts OBI, for a browser of OBI (v 2018-02-12) terms please see http://purl.bioontology.org/ontology/OBI';


--
-- Name: COLUMN "genetic-protocol".size_frac; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".size_frac IS 'Filtering pore size used in sample preparation';


--
-- Name: COLUMN "genetic-protocol".samp_size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".samp_size IS 'Amount or size of sample (volume, mass or area) that was collected';


--
-- Name: COLUMN "genetic-protocol".samp_vol_we_dna_ext; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".samp_vol_we_dna_ext IS 'Volume (ml) or mass (g) of total collected sample processed for DNA extraction. Note: total sample collected should be entered under the term Sample Size (MIXS:0000001).';


--
-- Name: COLUMN "genetic-protocol".source_uvig; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".source_uvig IS 'Type of dataset from which the UViG was obtained';


--
-- Name: COLUMN "genetic-protocol".virus_enrich_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".virus_enrich_appr IS 'List of approaches used to enrich the sample for viruses, if any';


--
-- Name: COLUMN "genetic-protocol".nucl_acid_ext; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".nucl_acid_ext IS 'A link to a literature reference, electronic resource or a standard operating procedure (SOP), that describes the material separation to recover the nucleic acid fraction from a sample';


--
-- Name: COLUMN "genetic-protocol".nucl_acid_amp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".nucl_acid_amp IS 'A link to a literature reference, electronic resource or a standard operating procedure (SOP), that describes the enzymatic amplification (PCR, TMA, NASBA) of specific nucleic acids';


--
-- Name: COLUMN "genetic-protocol".lib_size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".lib_size IS 'Total number of clones in the library prepared for the project';


--
-- Name: COLUMN "genetic-protocol".lib_reads_seqd; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".lib_reads_seqd IS 'Total number of clones sequenced from the library';


--
-- Name: COLUMN "genetic-protocol".lib_layout; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".lib_layout IS 'Specify whether to expect single, paired, or other configuration of reads';


--
-- Name: COLUMN "genetic-protocol".lib_vector; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".lib_vector IS 'Cloning vector type(s) used in construction of libraries';


--
-- Name: COLUMN "genetic-protocol".lib_screen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".lib_screen IS 'Specific enrichment or screening methods applied before and/or after creating libraries';


--
-- Name: COLUMN "genetic-protocol".target_gene; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".target_gene IS 'Targeted gene or locus name for marker gene studies';


--
-- Name: COLUMN "genetic-protocol".target_subfragment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".target_subfragment IS 'Name of subfragment of a gene or locus. Important to e.g. identify special regions on marker genes like V6 on 16S rRNA';


--
-- Name: COLUMN "genetic-protocol".pcr_primers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pcr_primers IS 'PCR primers that were used to amplify the sequence of the targeted gene, locus or subfragment. This field should contain all the primers used for a single PCR reaction if multiple forward or reverse primers are present in a single PCR reaction. The primer sequence should be reported in uppercase letters';


--
-- Name: COLUMN "genetic-protocol".mid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".mid IS 'Molecular barcodes, called Multiplex Identifiers (MIDs), that are used to specifically tag unique samples in a sequencing run. Sequence should be reported in uppercase letters';


--
-- Name: COLUMN "genetic-protocol".adapters; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".adapters IS 'Adapters provide priming sequences for both amplification and sequencing of the sample-library fragments. Both adapters should be reported; in uppercase letters';


--
-- Name: COLUMN "genetic-protocol".pcr_cond; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pcr_cond IS 'Description of reaction conditions and components of PCR in the form of ´initial denaturation:94degC_1.5min; annealing=...´';


--
-- Name: COLUMN "genetic-protocol".seq_meth; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".seq_meth IS 'Sequencing method used; e.g. Sanger, ABI-solid';


--
-- Name: COLUMN "genetic-protocol".seq_quality_check; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".seq_quality_check IS 'Indicate if the sequence has been called by automatic systems (none) or undergone a manual editing procedure (e.g. by inspecting the raw data or chromatograms). Applied only for sequences that are not submitted to SRA,ENA or DRA';


--
-- Name: COLUMN "genetic-protocol".chimera_check; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".chimera_check IS 'A chimeric sequence, or chimera for short, is a sequence comprised of two or more phylogenetically distinct parent sequences. Chimeras are usually PCR artifacts thought to occur when a prematurely terminated amplicon reanneals to a foreign DNA strand and is copied to completion in the following PCR cycles. The point at which the chimeric sequence changes from one parent to the next is called the breakpoint or conversion point';


--
-- Name: COLUMN "genetic-protocol".tax_ident; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".tax_ident IS 'The phylogenetic marker(s) used to assign an organism name to the SAG or MAG';


--
-- Name: COLUMN "genetic-protocol".assembly_qual; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".assembly_qual IS 'The assembly quality category is based on sets of criteria outlined for each assembly quality category. For MISAG/MIMAG; Finished: Single, validated, contiguous sequence per replicon without gaps or ambiguities with a consensus error rate equivalent to Q50 or better. High Quality Draft:Multiple fragments where gaps span repetitive regions. Presence of the 23S, 16S and 5S rRNA genes and at least 18 tRNAs. Medium Quality Draft:Many fragments with little to no review of assembly other than reporting of standard assembly statistics. Low Quality Draft:Many fragments with little to no review of assembly other than reporting of standard assembly statistics. Assembly statistics include, but are not limited to total assembly size, number of contigs, contig N50/L50, and maximum contig length. For MIUVIG; Finished: Single, validated, contiguous sequence per replicon without gaps or ambiguities, with extensive manual review and editing to annotate putative gene functions and transcriptional units. High-quality draft genome: One or multiple fragments, totaling ≥ 90% of the expected genome or replicon sequence or predicted complete. Genome fragment(s): One or multiple fragments, totalling < 90% of the expected genome or replicon sequence, or for which no genome size could be estimated';


--
-- Name: COLUMN "genetic-protocol".assembly_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".assembly_name IS 'Name/version of the assembly provided by the submitter that is used in the genome browsers and in the community';


--
-- Name: COLUMN "genetic-protocol".assembly_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".assembly_software IS 'Tool(s) used for assembly, including version number and parameters';


--
-- Name: COLUMN "genetic-protocol".annot; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".annot IS 'Tool used for annotation, or for cases where annotation was provided by a community jamboree or model organism database rather than by a specific submitter';


--
-- Name: COLUMN "genetic-protocol".number_contig; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".number_contig IS 'Total number of contigs in the cleaned/submitted assembly that makes up a given genome, SAG, MAG, or UViG';


--
-- Name: COLUMN "genetic-protocol".feat_pred; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".feat_pred IS 'Method used to predict UViGs features such as ORFs, integration site, etc.';


--
-- Name: COLUMN "genetic-protocol".ref_db; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".ref_db IS 'List of database(s) used for ORF annotation, along with version number and reference to website or publication';


--
-- Name: COLUMN "genetic-protocol".sim_search_meth; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".sim_search_meth IS 'Tool used to compare ORFs with database, along with version and cutoffs used';


--
-- Name: COLUMN "genetic-protocol".tax_class; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".tax_class IS 'Method used for taxonomic classification, along with reference database used, classification rank, and thresholds used to classify new genomes';


--
-- Name: COLUMN "genetic-protocol"._16s_recover; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"._16s_recover IS 'Can a 16S gene be recovered from the submitted SAG or MAG?';


--
-- Name: COLUMN "genetic-protocol"._16s_recover_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"._16s_recover_software IS 'Tools used for 16S rRNA gene extraction';


--
-- Name: COLUMN "genetic-protocol".trnas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".trnas IS 'The total number of tRNAs identified from the SAG or MAG';


--
-- Name: COLUMN "genetic-protocol".trna_ext_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".trna_ext_software IS 'Tools used for tRNA identification';


--
-- Name: COLUMN "genetic-protocol".compl_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".compl_score IS 'Completeness score is typically based on either the fraction of markers found as compared to a database or the percent of a genome found as compared to a closely related reference genome. High Quality Draft: >90%, Medium Quality Draft: >50%, and Low Quality Draft: < 50% should have the indicated completeness scores';


--
-- Name: COLUMN "genetic-protocol".compl_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".compl_software IS 'Tools used for completion estimate, i.e. checkm, anvi´o, busco';


--
-- Name: COLUMN "genetic-protocol".compl_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".compl_appr IS 'The approach used to determine the completeness of a given SAG or MAG, which would typically make use of a set of conserved marker genes or a closely related reference genome. For UViG completeness, include reference genome or group used, and contig feature suggesting a complete genome';


--
-- Name: COLUMN "genetic-protocol".contam_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".contam_score IS 'The contamination score is based on the fraction of single-copy genes that are observed more than once in a query genome. The following scores are acceptable for; High Quality Draft: < 5%, Medium Quality Draft: < 10%, Low Quality Draft: < 10%. Contamination must be below 5% for a SAG or MAG to be deposited into any of the public databases';


--
-- Name: COLUMN "genetic-protocol".contam_screen_input; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".contam_screen_input IS 'The type of sequence data used as input';


--
-- Name: COLUMN "genetic-protocol".contam_screen_param; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".contam_screen_param IS 'Specific parameters used in the decontamination sofware, such as reference database, coverage, and kmers. Combinations of these parameters may also be used, i.e. kmer and coverage, or reference database and kmer';


--
-- Name: COLUMN "genetic-protocol".decontam_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".decontam_software IS 'Tool(s) used in contamination screening';


--
-- Name: COLUMN "genetic-protocol".sort_tech; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".sort_tech IS 'Method used to sort/isolate cells or particles of interest';


--
-- Name: COLUMN "genetic-protocol".single_cell_lysis_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".single_cell_lysis_appr IS 'Method used to free DNA from interior of the cell(s) or particle(s)';


--
-- Name: COLUMN "genetic-protocol".single_cell_lysis_prot; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".single_cell_lysis_prot IS 'Name of the kit or standard protocol used for cell(s) or particle(s) lysis';


--
-- Name: COLUMN "genetic-protocol".wga_amp_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".wga_amp_appr IS 'Method used to amplify genomic DNA in preparation for sequencing';


--
-- Name: COLUMN "genetic-protocol".wga_amp_kit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".wga_amp_kit IS 'Kit used to amplify genomic DNA in preparation for sequencing';


--
-- Name: COLUMN "genetic-protocol".bin_param; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".bin_param IS 'The parameters that have been applied during the extraction of genomes from metagenomic datasets';


--
-- Name: COLUMN "genetic-protocol".bin_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".bin_software IS 'Tool(s) used for the extraction of genomes from metagenomic datasets';


--
-- Name: COLUMN "genetic-protocol".reassembly_bin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".reassembly_bin IS 'Has an assembly been performed on a genome bin extracted from a metagenomic assembly?';


--
-- Name: COLUMN "genetic-protocol".mag_cov_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".mag_cov_software IS 'Tool(s) used to determine the genome coverage if coverage is used as a binning parameter in the extraction of genomes from metagenomic datasets';


--
-- Name: COLUMN "genetic-protocol".vir_ident_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".vir_ident_software IS 'Tool(s) used for the identification of UViG as a viral genome, software or protocol name including version number, parameters, and cutoffs used';


--
-- Name: COLUMN "genetic-protocol".pred_genome_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pred_genome_type IS 'Type of genome predicted for the UViG';


--
-- Name: COLUMN "genetic-protocol".pred_genome_struc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pred_genome_struc IS 'Expected structure of the viral genome';


--
-- Name: COLUMN "genetic-protocol".detec_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".detec_type IS 'Type of UViG detection';


--
-- Name: COLUMN "genetic-protocol".otu_class_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".otu_class_appr IS 'Cutoffs and approach used when clustering new UViGs in "species-level" OTUs. Note that results from standard 95% ANI / 85% AF clustering should be provided alongside OTUS defined from another set of thresholds, even if the latter are the ones primarily used during the analysis';


--
-- Name: COLUMN "genetic-protocol".otu_seq_comp_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".otu_seq_comp_appr IS 'Tool and thresholds used to compare sequences when computing "species-level" OTUs';


--
-- Name: COLUMN "genetic-protocol".otu_db; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".otu_db IS 'Reference database (i.e. sequences not generated as part of the current study) used to cluster new genomes in "species-level" OTUs, if any';


--
-- Name: COLUMN "genetic-protocol".host_pred_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".host_pred_appr IS 'Tool or approach used for host prediction';


--
-- Name: COLUMN "genetic-protocol".host_pred_est_acc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".host_pred_est_acc IS 'For each tool or approach used for host prediction, estimated false discovery rates should be included, either computed de novo or from the literature';


--
-- Name: COLUMN "genetic-protocol".sop; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".sop IS 'Standard operating procedures used in assembly and/or annotation of genomes, metagenomes or environmental sequences';


--
-- Name: COLUMN "genetic-protocol".pcr_primer_forward; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pcr_primer_forward IS 'Forward PCR primer that were used to amplify the sequence of the targeted gene, locus or subfragment. If multiple multiple forward or reverse primers are present in a single PCR reaction, there should be a full row for each of these linked to the same DWC Occurrence. The primer sequence should be reported in uppercase letters';


--
-- Name: COLUMN "genetic-protocol".pcr_primer_reverse; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pcr_primer_reverse IS 'Reverse PCR primer that were used to amplify the sequence of the targeted gene, locus or subfragment. If multiple multiple forward or reverse primers are present in a single PCR reaction, there should be a full row for each of these linked to the same DWC Occurrence. The primer sequence should be reported in uppercase letters';


--
-- Name: COLUMN "genetic-protocol".pcr_primer_name_forward; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pcr_primer_name_forward IS 'Name of the forward PCR primer that were used to amplify the sequence of the targeted gene, locus or subfragment. If multiple multiple forward or reverse primers are present in a single PCR reaction, there should be a full row for each of these linked to the same DWC Occurrence.';


--
-- Name: COLUMN "genetic-protocol".pcr_primer_name_reverse; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pcr_primer_name_reverse IS 'Name of the reverse PCR primer that were used to amplify the sequence of the targeted gene, locus or subfragment. If multiple multiple forward or reverse primers are present in a single PCR reaction, there should be a full row for each of these linked to the same DWC Occurrence.';


--
-- Name: COLUMN "genetic-protocol".pcr_primer_reference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pcr_primer_reference IS 'Reference for the PCR primers that were used to amplify the sequence of the targeted gene, locus or subfragment.';


--
-- Name: COLUMN "genetic-protocol"."DNA_sequence"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."DNA_sequence" IS 'The DNA sequence';


--
-- Name: COLUMN "genetic-protocol".concentration; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".concentration IS 'Concentration of DNA (weight ng/volume µl)';


--
-- Name: COLUMN "genetic-protocol"."concentrationUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."concentrationUnit" IS 'Unit used for concentration measurement';


--
-- Name: COLUMN "genetic-protocol"."methodDeterminationConcentrationAndRatios"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."methodDeterminationConcentrationAndRatios" IS 'Description of method used for concentration measurement';


--
-- Name: COLUMN "genetic-protocol"."ratioOfAbsorbance260_230"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."ratioOfAbsorbance260_230" IS 'Ratio of absorbance at 260 nm and 230 nm assessing DNA purity (mostly secondary measure, indicates mainly EDTA, carbohydrates, phenol), (DNA samples only).';


--
-- Name: COLUMN "genetic-protocol"."ratioOfAbsorbance260_280"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."ratioOfAbsorbance260_280" IS 'Ratio of absorbance at 280 nm and 230 nm assessing DNA purity (mostly secondary measure, indicates mainly EDTA, carbohydrates, phenol), (DNA samples only).';


--
-- Name: COLUMN "genetic-protocol"."annealingTemp"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."annealingTemp" IS 'The reaction temperature during the annealing phase of PCR.';


--
-- Name: COLUMN "genetic-protocol"."annealingTempUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."annealingTempUnit" IS 'Measurement unit of the reaction temperature during the annealing phase of PCR.';


--
-- Name: COLUMN "genetic-protocol"."probeReporter"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."probeReporter" IS 'Type of fluorophore (reporter) used. Probe anneals within amplified target DNA. Polymerase activity degrades the probe that has annealed to the template, and the probe releases the fluorophore from it and breaks the proximity to the quencher, thus allowing fluorescence of the fluorophore.';


--
-- Name: COLUMN "genetic-protocol"."probeQuencher"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."probeQuencher" IS 'Type of quencher used. The quencher molecule quenches the fluorescence emitted by the fluorophore when excited by the cycler’s light source As long as fluorophore and the quencher are in proximity, quenching inhibits any fluorescence signals.';


--
-- Name: COLUMN "genetic-protocol"."ampliconSize"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."ampliconSize" IS 'The length of the amplicon in basepairs.';


--
-- Name: COLUMN "genetic-protocol"."thresholdQuantificationCycle"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."thresholdQuantificationCycle" IS 'Threshold for change in fluorescence signal between cycles';


--
-- Name: COLUMN "genetic-protocol"."baselineValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."baselineValue" IS 'The number of cycles when fluorescence signal from the target amplification is below background fluorescence not originated from the real target amplification.';


--
-- Name: COLUMN "genetic-protocol"."quantificationCycle"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."quantificationCycle" IS 'The number of cycles required for the fluorescent signal to cross a given value threshold above the baseline. Quantification cycle (Cq), threshold cycle (Ct), crossing point (Cp), and take-off point (TOP) refer to the same value from the real-time instrument. Use of quantification cycle (Cq), is preferable according to the RDML (Real-Time PCR Data Markup Language) data standard (http://www.rdml.org).';


--
-- Name: COLUMN "genetic-protocol"."automaticThresholdQuantificationCycle"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."automaticThresholdQuantificationCycle" IS 'Whether the threshold was set by the instrument or manually.';


--
-- Name: COLUMN "genetic-protocol"."automaticBaselineValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."automaticBaselineValue" IS 'Whether the baseline value was set by the instrument or manually.';


--
-- Name: COLUMN "genetic-protocol"."contaminationAssessment"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."contaminationAssessment" IS 'Whether DNA or RNA contamination assessment was done or not.';


--
-- Name: COLUMN "genetic-protocol"."partitionVolume"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."partitionVolume" IS 'An accurate estimation of partition volume. The sum of the partitions multiplied by the partition volume will enable the total volume of the reaction to be calculated.';


--
-- Name: COLUMN "genetic-protocol"."partitionVolumeUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."partitionVolumeUnit" IS 'Unit used for partition volume';


--
-- Name: COLUMN "genetic-protocol"."estimatedNumberOfCopies"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."estimatedNumberOfCopies" IS 'Number of target molecules per µl. Mean copies per partition (?) can be calculated using the number of partitions (n) and the estimated copy number in the total volume of all partitions (m) with a formula ?=m/n.';


--
-- Name: COLUMN "genetic-protocol"."amplificationReactionVolume"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."amplificationReactionVolume" IS 'PCR reaction volume';


--
-- Name: COLUMN "genetic-protocol"."amplificationReactionVolumeUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."amplificationReactionVolumeUnit" IS 'Unit used for PCR reaction volume. Many of the instruments require preparation of a much larger initial sample volume than is actually analyzed.';


--
-- Name: COLUMN "genetic-protocol".pcr_analysis_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pcr_analysis_software IS 'The program used to analyse the d(d)PCR runs.';


--
-- Name: COLUMN "genetic-protocol"."experimentalVariance"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol"."experimentalVariance" IS 'Multiple biological replicates are encouraged to assess total experimental variation. When single dPCR experiments are performed, a minimal estimate of variance due to counting error alone must be calculated from the binomial (or suitable equivalent) distribution.';


--
-- Name: COLUMN "genetic-protocol".pcr_primer_lod; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pcr_primer_lod IS 'The assay’s ability to detect the target at low levels.';


--
-- Name: COLUMN "genetic-protocol".pcr_primer_loq; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-protocol".pcr_primer_loq IS 'The assay’s ability to quantify copy number at low levels.';


--
-- Name: genetic-sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."genetic-sequence" (
    "geneticSequenceID" text NOT NULL,
    "geneticSequence" text,
    "geneticSequenceRemarks" text
);


ALTER TABLE public."genetic-sequence" OWNER TO postgres;

--
-- Name: TABLE "genetic-sequence"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-sequence" IS 'Comments or notes about a GeneticSequence.';


--
-- Name: COLUMN "genetic-sequence"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- Name: COLUMN "genetic-sequence"."geneticSequence"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence"."geneticSequence" IS 'A string representing nucleotide base pairs.';


--
-- Name: COLUMN "genetic-sequence"."geneticSequenceRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence"."geneticSequenceRemarks" IS 'Comments or notes about a GeneticSequence.';


--
-- Name: genetic-sequence-agent-role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."genetic-sequence-agent-role" (
    "agentID" text NOT NULL,
    "geneticSequenceID" text NOT NULL,
    "agentRole" text,
    "agentRoleIRI" text,
    "agentRoleVocabulary" text,
    "agentRoleOrder" integer,
    "agentRoleDate" text,
    CONSTRAINT "genetic-sequence-agent-role_agentRoleOrder_check" CHECK (("agentRoleOrder" >= 1))
);


ALTER TABLE public."genetic-sequence-agent-role" OWNER TO postgres;

--
-- Name: TABLE "genetic-sequence-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-sequence-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "genetic-sequence-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "genetic-sequence-agent-role"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- Name: COLUMN "genetic-sequence-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "genetic-sequence-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- Name: COLUMN "genetic-sequence-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in agentRole is given.';


--
-- Name: COLUMN "genetic-sequence-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "genetic-sequence-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: genetic-sequence-assertion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."genetic-sequence-assertion" (
    "assertionID" text NOT NULL,
    "geneticSequenceID" text NOT NULL,
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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."genetic-sequence-assertion" OWNER TO postgres;

--
-- Name: TABLE "genetic-sequence-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-sequence-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "genetic-sequence-assertion"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionType is given.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionValue is given.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "genetic-sequence-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- Name: genetic-sequence-citation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."genetic-sequence-citation" (
    "citationID" text NOT NULL,
    "geneticSequenceID" text NOT NULL,
    "citationType" text,
    "citationTypeIRI" text,
    "citationTypeVocabulary" text,
    "bibliographicCitation" text,
    "pageNumber" text,
    "referenceID" text,
    "referenceType" text,
    "referenceTypeIRI" text,
    "referenceTypeVocabulary" text,
    "referenceYear" integer,
    "isPeerReviewed" boolean,
    "citationRemarks" text
);


ALTER TABLE public."genetic-sequence-citation" OWNER TO postgres;

--
-- Name: TABLE "genetic-sequence-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-sequence-citation" IS 'Comments or notes about a Citation.';


--
-- Name: COLUMN "genetic-sequence-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."citationID" IS 'An identifier for a Citation.';


--
-- Name: COLUMN "genetic-sequence-citation"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- Name: COLUMN "genetic-sequence-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- Name: COLUMN "genetic-sequence-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- Name: COLUMN "genetic-sequence-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in citationType is given.';


--
-- Name: COLUMN "genetic-sequence-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- Name: COLUMN "genetic-sequence-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- Name: COLUMN "genetic-sequence-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- Name: COLUMN "genetic-sequence-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- Name: COLUMN "genetic-sequence-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- Name: COLUMN "genetic-sequence-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in referenceType is given.';


--
-- Name: COLUMN "genetic-sequence-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- Name: COLUMN "genetic-sequence-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- Name: COLUMN "genetic-sequence-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


--
-- Name: genetic-sequence-media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."genetic-sequence-media" (
    "mediaID" text NOT NULL,
    "geneticSequenceID" text NOT NULL,
    "mediaSubjectCategory" text,
    "mediaSubjectCategoryIRI" text,
    "mediaSubjectCategoryVocabulary" text
);


ALTER TABLE public."genetic-sequence-media" OWNER TO postgres;

--
-- Name: TABLE "genetic-sequence-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-sequence-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "genetic-sequence-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "genetic-sequence-media"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-media"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- Name: COLUMN "genetic-sequence-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "genetic-sequence-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- Name: COLUMN "genetic-sequence-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


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

COMMENT ON TABLE public."geological-context" IS 'The full name of the lithostratigraphic bed from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."geologicalContextID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."geologicalContextID" IS 'An identifier for a dwc:GeologicalContext.';


--
-- Name: COLUMN "geological-context"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN "geological-context"."earliestEonOrLowestEonothem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestEonOrLowestEonothem" IS 'The full name of the earliest possible geochronologic eon or lowest chrono-stratigraphic eonothem or the informal name (''Precambrian'') attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."latestEonOrHighestEonothem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestEonOrHighestEonothem" IS 'The full name of the latest possible geochronologic eon or highest chrono-stratigraphic eonothem or the informal name (''Precambrian'') attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."earliestEraOrLowestErathem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestEraOrLowestErathem" IS 'The full name of the earliest possible geochronologic era or lowest chronostratigraphic erathem attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."latestEraOrHighestErathem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestEraOrHighestErathem" IS 'The full name of the latest possible geochronologic era or highest chronostratigraphic erathem attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."earliestPeriodOrLowestSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestPeriodOrLowestSystem" IS 'The full name of the earliest possible geochronologic period or lowest chronostratigraphic system attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."latestPeriodOrHighestSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestPeriodOrHighestSystem" IS 'The full name of the latest possible geochronologic period or highest chronostratigraphic system attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."earliestEpochOrLowestSeries"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestEpochOrLowestSeries" IS 'The full name of the earliest possible geochronologic epoch or lowest chronostratigraphic series attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."latestEpochOrHighestSeries"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestEpochOrHighestSeries" IS 'The full name of the latest possible geochronologic epoch or highest chronostratigraphic series attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."earliestAgeOrLowestStage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestAgeOrLowestStage" IS 'The full name of the earliest possible geochronologic age or lowest chronostratigraphic stage attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."latestAgeOrHighestStage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestAgeOrHighestStage" IS 'The full name of the latest possible geochronologic age or highest chronostratigraphic stage attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."lowestBiostratigraphicZone"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."lowestBiostratigraphicZone" IS 'The full name of the lowest possible geological biostratigraphic zone of the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."highestBiostratigraphicZone"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."highestBiostratigraphicZone" IS 'The full name of the highest possible geological biostratigraphic zone of the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."lithostratigraphicTerms"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."lithostratigraphicTerms" IS 'The combination of all litho-stratigraphic names for the rock from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context"."group"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."group" IS 'The full name of the lithostratigraphic group from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context".formation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context".formation IS 'The full name of the lithostratigraphic formation from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context".member; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context".member IS 'The full name of the lithostratigraphic member from which a dwc:MaterialEntity was collected.';


--
-- Name: COLUMN "geological-context".bed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context".bed IS 'The full name of the lithostratigraphic bed from which a dwc:MaterialEntity was collected.';


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

COMMENT ON TABLE public."geological-context-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "geological-context-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "geological-context-media"."geologicalContextID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."geologicalContextID" IS 'An identifier for a dwc:GeologicalContext.';


--
-- Name: COLUMN "geological-context-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "geological-context-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- Name: COLUMN "geological-context-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


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
    "identifiedBy" text,
    "identifiedByID" text,
    "dateIdentified" text,
    "identificationReferences" text,
    "taxonAssignmentMethod" text,
    "identificationVerificationStatus" text,
    "identificationRemarks" text,
    "taxonID" text,
    kingdom text,
    "scientificName" text,
    "taxonRank" text,
    "taxonRemarks" text
);


ALTER TABLE public.identification OWNER TO postgres;

--
-- Name: TABLE identification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.identification IS 'Comments or notes about a dwc:Taxon.';


--
-- Name: COLUMN identification."identificationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationID" IS 'An identifier for a dwc:Identification.';


--
-- Name: COLUMN identification."basedOnOccurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."basedOnOccurrenceID" IS 'An identifier for a dwc:Occurrence based on which a dwc:Identification was made.';


--
-- Name: COLUMN identification."basedOnMaterialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."basedOnMaterialEntityID" IS 'An identifier for a dwc:MaterialEntity based on which a dwc:Identification was made.';


--
-- Name: COLUMN identification."basedOnNucleotideSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."basedOnNucleotideSequenceID" IS 'An identifier for a NucleotideSequence based on which a dwc:Identification was made.';


--
-- Name: COLUMN identification."basedOnNucleotideAnalysisID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."basedOnNucleotideAnalysisID" IS 'An identifier for a NucleotideAnalysis based on which a dwc:Identification was made.';


--
-- Name: COLUMN identification."basedOnMediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."basedOnMediaID" IS 'An identifier for a Media instance based on which a dwc:Identification was made.';


--
-- Name: COLUMN identification."identificationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationType" IS 'The category that best matches the nature of a dwc:Identification.';


--
-- Name: COLUMN identification."verbatimIdentification"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."verbatimIdentification" IS 'A string representing the taxonomic identification as it appeared in the original record.';


--
-- Name: COLUMN identification."isAcceptedIdentification"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."isAcceptedIdentification" IS 'The dwc:Identification of a dwc:Organism is a currently accepted one.';


--
-- Name: COLUMN identification."taxonFormula"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonFormula" IS 'A string representing the pattern to use to construct a dwc:Identification from dwc:Taxon names and identification qualifiers.';


--
-- Name: COLUMN identification."typeStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."typeStatus" IS 'A list (concatenated and separated) of nomenclatural types (type status, typified scientific name, publication) applied to the subject.';


--
-- Name: COLUMN identification."typeDesignationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."typeDesignationType" IS 'The category that best matches the nature of a type designation.';


--
-- Name: COLUMN identification."identifiedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identifiedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN identification."identifiedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identifiedByID" IS 'The identifier for the Agent who made a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN identification."dateIdentified"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."dateIdentified" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN identification."identificationReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationReferences" IS 'A list (concatenated and separated) of references (publication, global unique identifier, URI, metabarcoding reference database) used in a dwc:Identification.';


--
-- Name: COLUMN identification."taxonAssignmentMethod"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonAssignmentMethod" IS 'Tool and thresholds used to compare sequences when computing ''species-level'' OTUs';


--
-- Name: COLUMN identification."identificationVerificationStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationVerificationStatus" IS 'A categorical indicator of the extent to which the taxonomic identification has been verified to be correct.';


--
-- Name: COLUMN identification."identificationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationRemarks" IS 'Comments or notes about a dwc:Identification.';


--
-- Name: COLUMN identification."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonID" IS 'An identifier for a dwc:Taxon.';


--
-- Name: COLUMN identification.kingdom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification.kingdom IS 'The full scientific name of the kingdom in which a dwc:scientificName is classified.';


--
-- Name: COLUMN identification."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."scientificName" IS 'The full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- Name: COLUMN identification."taxonRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonRank" IS 'The taxonomic rank of the most specific name in a dwc:scientificName.';


--
-- Name: COLUMN identification."taxonRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonRemarks" IS 'Comments or notes about a dwc:Taxon.';


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

COMMENT ON TABLE public."identification-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "identification-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "identification-agent-role"."identificationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."identificationID" IS 'An identifier for a dwc:Identification.';


--
-- Name: COLUMN "identification-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "identification-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- Name: COLUMN "identification-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- Name: COLUMN "identification-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "identification-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: identification-taxon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."identification-taxon" (
    "identificationID" text NOT NULL,
    "taxonID" text,
    "taxonOrder" integer,
    kingdom text,
    "scientificName" text,
    "taxonRank" text,
    "taxonRemarks" text,
    CONSTRAINT "identification-taxon_taxonOrder_check" CHECK (("taxonOrder" >= 1))
);


ALTER TABLE public."identification-taxon" OWNER TO postgres;

--
-- Name: TABLE "identification-taxon"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."identification-taxon" IS 'Comments or notes about a dwc:Taxon.';


--
-- Name: COLUMN "identification-taxon"."identificationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."identificationID" IS 'An identifier for a dwc:Identification.';


--
-- Name: COLUMN "identification-taxon"."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."taxonID" IS 'An identifier for a dwc:Taxon.';


--
-- Name: COLUMN "identification-taxon"."taxonOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."taxonOrder" IS 'The position of a dwc:Taxon in a taxonFormula.';


--
-- Name: COLUMN "identification-taxon".kingdom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon".kingdom IS 'The full scientific name of the kingdom in which a dwc:scientificName is classified.';


--
-- Name: COLUMN "identification-taxon"."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."scientificName" IS 'The full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- Name: COLUMN "identification-taxon"."taxonRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."taxonRank" IS 'The taxonomic rank of the most specific name in a dwc:scientificName.';


--
-- Name: COLUMN "identification-taxon"."taxonRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."taxonRemarks" IS 'Comments or notes about a dwc:Taxon.';


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
    "objectCount" text,
    "recordNumber" text,
    preparations text,
    disposition text,
    "verbatimLabel" text,
    "associatedSequences" text,
    "materialCitation" text,
    "informationWithheld" text,
    "dataGeneralizations" text,
    "materialEntityRemarks" text,
    "evidenceForOccurrenceID" text,
    "derivedFromMaterialEntityID" text,
    "derivationEventID" text,
    "derivationType" text,
    "partOfMaterialEntityID" text,
    "verbatimIdentification" text,
    "taxonFormula" text,
    "identifiedBy" text,
    "identifiedByID" text,
    "dateIdentified" text,
    "identificationReferences" text,
    "identificationVerificationStatus" text,
    "identificationRemarks" text,
    "taxonID" text,
    kingdom text,
    "scientificName" text,
    "taxonRank" text,
    "taxonRemarks" text
);


ALTER TABLE public.material OWNER TO postgres;

--
-- Name: TABLE material; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.material IS 'Comments or notes about a dwc:Taxon.';


--
-- Name: COLUMN material."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN material."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN material."materialCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialCategory" IS 'The broad category that best matches the nature of a dwc:MaterialEntity.';


--
-- Name: COLUMN material."materialEntityType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialEntityType" IS 'The narrow category that best matches the nature of a dwc:MaterialEntity.';


--
-- Name: COLUMN material."institutionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."institutionCode" IS 'The name (or acronym) in use by an institution.';


--
-- Name: COLUMN material."institutionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."institutionID" IS 'An identifier for an institution.';


--
-- Name: COLUMN material."ownerInstitutionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."ownerInstitutionCode" IS 'The name (or acronym) in use by the institution having ownership of a dwc:MaterialEntity.';


--
-- Name: COLUMN material."ownerInstitutionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."ownerInstitutionID" IS 'An identifier for an institution that owns a dwc:MaterialEntity.';


--
-- Name: COLUMN material."collectionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."collectionCode" IS 'The name, acronym, coden, or initialism identifying a Collection.';


--
-- Name: COLUMN material."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."collectionID" IS 'An identifier for a Collection.';


--
-- Name: COLUMN material."catalogNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."catalogNumber" IS 'An identifier (preferably unique) for a dwc:MaterialEntity within a Collection.';


--
-- Name: COLUMN material."otherCatalogNumbers"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."otherCatalogNumbers" IS 'A list (concatenated and separated) of previous or alternate fully qualified catalog numbers or other human-used identifiers for the same dwc:MaterialEntity, whether in the current or any other data set or collection.';


--
-- Name: COLUMN material."collectedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."collectedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations responsible for collecting a dwc:MaterialEntity.';


--
-- Name: COLUMN material."collectedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."collectedByID" IS 'An identifier for the Agent responsible for collecting a dwc:MaterialEntity.';


--
-- Name: COLUMN material."objectCount"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."objectCount" IS 'The number of distinct objects comprising a dwc:MaterialEntity.';


--
-- Name: COLUMN material."recordNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."recordNumber" IS 'An identifier given to a dwc:MaterialEntity at the time it was recorded. Often serves as a link between field notes and a dwc:MaterialEntity, such as a specimen collector''s number.';


--
-- Name: COLUMN material.preparations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material.preparations IS 'A list (concatenated and separated) of preparations and preservation methods for a dwc:MaterialEntity.';


--
-- Name: COLUMN material.disposition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material.disposition IS 'The current state of a dwc:MaterialEntity with respect to where it can be found.';


--
-- Name: COLUMN material."verbatimLabel"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."verbatimLabel" IS 'The content of this term should include no embellishments, prefixes, headers or other additions made to the text. Abbreviations must not be expanded and supposed misspellings must not be corrected. Lines or breakpoints between blocks of text that could be verified by seeing the original labels or images of them may be used. Examples of material entities include preserved specimens, fossil specimens, and material samples. Best practice is to use UTF-8 for all characters. Best practice is to add comment “verbatimLabel derived from human transcription” in dwc:occurrenceRemarks.';


--
-- Name: COLUMN material."associatedSequences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."associatedSequences" IS 'A list (concatenated and separated) of identifiers (publication, global unique identifier, URI) of genetic sequence information associated with a dwc:MaterialEntity.';


--
-- Name: COLUMN material."materialCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a dwc:MaterialEntity.';


--
-- Name: COLUMN material."informationWithheld"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."informationWithheld" IS 'Additional information that exists, but that has not been shared in the given record.';


--
-- Name: COLUMN material."dataGeneralizations"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."dataGeneralizations" IS 'Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- Name: COLUMN material."materialEntityRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialEntityRemarks" IS 'Comments or notes about a dwc:MaterialEntity.';


--
-- Name: COLUMN material."evidenceForOccurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."evidenceForOccurrenceID" IS 'An identifier for a dwc:Occurrence for which a dwc:MaterialEntity provides evidence.';


--
-- Name: COLUMN material."derivedFromMaterialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."derivedFromMaterialEntityID" IS 'An identifier for a dwc:MaterialEntity from which this dwc:MaterialEntity was derived.';


--
-- Name: COLUMN material."derivationEventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."derivationEventID" IS 'An identifier for a dwc:Event during which a dwc:MaterialEntity was derived from another dwc:MaterialEntity.';


--
-- Name: COLUMN material."derivationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."derivationType" IS 'The category that best matches the nature of the derivation of a dwc:MaterialEntity from a dwc:MaterialEntity pointed to by derivedFromMaterialEntityID.';


--
-- Name: COLUMN material."partOfMaterialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."partOfMaterialEntityID" IS 'An identifier for a dwc:MaterialEntity of which this dwc:MaterialEntity is a part.';


--
-- Name: COLUMN material."verbatimIdentification"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."verbatimIdentification" IS 'A string representing the taxonomic identification as it appeared in the original record.';


--
-- Name: COLUMN material."taxonFormula"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."taxonFormula" IS 'A string representing the pattern to use to construct a dwc:Identification from dwc:Taxon names and identification qualifiers.';


--
-- Name: COLUMN material."identifiedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identifiedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN material."identifiedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identifiedByID" IS 'The identifier for the Agent who made a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN material."dateIdentified"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."dateIdentified" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN material."identificationReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identificationReferences" IS 'A list (concatenated and separated) of references (publication, global unique identifier, URI) used in a dwc:Identification.';


--
-- Name: COLUMN material."identificationVerificationStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identificationVerificationStatus" IS 'A categorical indicator of the extent to which the taxonomic determination has been verified to be correct.';


--
-- Name: COLUMN material."identificationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identificationRemarks" IS 'Comments or notes about a dwc:Identification.';


--
-- Name: COLUMN material."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."taxonID" IS 'An identifier for a dwc:Taxon.';


--
-- Name: COLUMN material.kingdom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material.kingdom IS 'The full scientific name of the kingdom in which a dwc:scientificName is classified.';


--
-- Name: COLUMN material."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."scientificName" IS 'The full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- Name: COLUMN material."taxonRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."taxonRank" IS 'The taxonomic rank of the most specific name in a dwc:scientificName.';


--
-- Name: COLUMN material."taxonRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."taxonRemarks" IS 'Comments or notes about a dwc:Taxon.';


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

COMMENT ON TABLE public."material-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "material-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "material-agent-role"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "material-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "material-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- Name: COLUMN "material-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- Name: COLUMN "material-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "material-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."material-assertion" OWNER TO postgres;

--
-- Name: TABLE "material-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "material-assertion"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "material-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionType is given.';


--
-- Name: COLUMN "material-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "material-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "material-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "material-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionValue is given.';


--
-- Name: COLUMN "material-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "material-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "material-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "material-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "material-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "material-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- Name: material-citation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."material-citation" (
    "citationID" text NOT NULL,
    "materialEntityID" text NOT NULL,
    "citationType" text,
    "citationTypeIRI" text,
    "citationTypeVocabulary" text,
    "bibliographicCitation" text,
    "pageNumber" text,
    "referenceID" text,
    "referenceType" text,
    "referenceTypeIRI" text,
    "referenceTypeVocabulary" text,
    "referenceYear" integer,
    "isPeerReviewed" boolean,
    "citationRemarks" text
);


ALTER TABLE public."material-citation" OWNER TO postgres;

--
-- Name: TABLE "material-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-citation" IS 'Comments or notes about a Citation.';


--
-- Name: COLUMN "material-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."citationID" IS 'An identifier for a Citation.';


--
-- Name: COLUMN "material-citation"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "material-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- Name: COLUMN "material-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- Name: COLUMN "material-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in citationType is given.';


--
-- Name: COLUMN "material-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- Name: COLUMN "material-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- Name: COLUMN "material-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- Name: COLUMN "material-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- Name: COLUMN "material-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- Name: COLUMN "material-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in referenceType is given.';


--
-- Name: COLUMN "material-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- Name: COLUMN "material-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- Name: COLUMN "material-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


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

COMMENT ON TABLE public."material-identifier" IS 'A language in which an Identifier is presented.';


--
-- Name: COLUMN "material-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "material-identifier"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "material-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "material-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- Name: COLUMN "material-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in identifierType is given.';


--
-- Name: COLUMN "material-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


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

COMMENT ON TABLE public."material-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "material-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "material-media"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "material-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "material-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- Name: COLUMN "material-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


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

COMMENT ON TABLE public."material-protocol" IS 'An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "material-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- Name: COLUMN "material-protocol"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-protocol"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


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

COMMENT ON TABLE public.media IS 'An account of the Media subject matter.';


--
-- Name: COLUMN media."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN media."mediaType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."mediaType" IS 'The category that best matches the nature of an instance of Media.';


--
-- Name: COLUMN media."accessURI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."accessURI" IS 'A URI that uniquely identifies a service that provides a representation of the underlying resource.';


--
-- Name: COLUMN media."WebStatement"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."WebStatement" IS 'A Web URL for a statement of the ownership and usage rights for this resource.';


--
-- Name: COLUMN media.format; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.format IS 'The file format, physical medium, or dimensions of the resource.';


--
-- Name: COLUMN media.rights; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.rights IS 'Information about rights held in and over the resource.';


--
-- Name: COLUMN media."Owner"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."Owner" IS 'A list of legal owners of the resource.';


--
-- Name: COLUMN media.source; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.source IS 'A related resource from which the described resource is derived.';


--
-- Name: COLUMN media.creator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.creator IS 'An entity primarily responsible for making the resource.';


--
-- Name: COLUMN media."creatorID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."creatorID" IS 'An identifier for the entity primarily responsible for making the resource.';


--
-- Name: COLUMN media."CreateDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."CreateDate" IS 'The date and time the resource was created. For a digital file, this need not match a file-system creation time. For a freshly created resource, it should be close to that time, modulo the time taken to write the file. Later file transfer, copying, and so on, can make the file-system time arbitrarily different.';


--
-- Name: COLUMN media.modified; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.modified IS 'Date on which the resource was changed.';


--
-- Name: COLUMN media."mediaLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."mediaLanguage" IS 'A language of the content of Media.';


--
-- Name: COLUMN media."mediaDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."mediaDescription" IS 'An account of the Media subject matter.';


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

COMMENT ON TABLE public."media-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "media-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "media-agent-role"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "media-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "media-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- Name: COLUMN "media-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- Name: COLUMN "media-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "media-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."media-assertion" OWNER TO postgres;

--
-- Name: TABLE "media-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."media-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "media-assertion"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "media-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionType is given.';


--
-- Name: COLUMN "media-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "media-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "media-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "media-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionValue is given.';


--
-- Name: COLUMN "media-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "media-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "media-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "media-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "media-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "media-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


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

COMMENT ON TABLE public."media-identifier" IS 'A language in which an Identifier is presented.';


--
-- Name: COLUMN "media-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "media-identifier"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "media-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "media-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- Name: COLUMN "media-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in identifierType is given.';


--
-- Name: COLUMN "media-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


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
    url text,
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

COMMENT ON TABLE public."molecular-protocol" IS 'The assay’s ability to quantify copy number at low levels.';


--
-- Name: COLUMN "molecular-protocol"."molecularProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."molecularProtocolID" IS 'An identifier for a MolecularProtocol.';


--
-- Name: COLUMN "molecular-protocol"."assayType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."assayType" IS 'The method used in the study to detect taxon/taxa of interest in the sample.';


--
-- Name: COLUMN "molecular-protocol".samp_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_name IS 'Sample Name is a name that you choose for the sample. It can have any format, but we suggest that you make it concise, unique and consistent within your lab, and as informative as possible. Every Sample Name from a single Submitter must be unique. ';


--
-- Name: COLUMN "molecular-protocol".project_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".project_name IS 'Name of the project within which the sequencing was organized';


--
-- Name: COLUMN "molecular-protocol".experimental_factor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".experimental_factor IS 'Experimental factors are essentially the variable aspects of an experiment design which can be used to describe an experiment, or set of experiments, in an increasingly detailed manner. This field accepts ontology terms from Experimental Factor Ontology (EFO) and/or Ontology for Biomedical Investigations (OBI). For a browser of EFO (v 2.95) terms, please see http://purl.bioontology.org/ontology/EFO; for a browser of OBI (v 2018-02-12) terms please see http://purl.bioontology.org/ontology/OBI';


--
-- Name: COLUMN "molecular-protocol".samp_taxon_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_taxon_id IS 'NCBI taxon id of the sample. Maybe be a single taxon or mixed taxa sample. Use "synthetic metagenome" for mock community/positive controls, or "blank sample" for negative controls';


--
-- Name: COLUMN "molecular-protocol".neg_cont_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".neg_cont_type IS 'The substance or equipment used as a negative control in an investigation';


--
-- Name: COLUMN "molecular-protocol".pos_cont_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pos_cont_type IS 'The substance, mixture, product, or apparatus used to verify that a process which is part of an investigation delivers a true positive';


--
-- Name: COLUMN "molecular-protocol".env_broad_scale; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".env_broad_scale IS 'In this field, report which major environmental system your sample or specimen came from. The systems identified should have a coarse spatial grain, to provide the general environmental context of where the sampling was done (e.g. were you in the desert or a rainforest?). We recommend using subclasses of ENVO’s biome class: http://purl.obolibrary.org/obo/ENVO_00000428. Format (one term): termLabel [termID], Format (multiple terms): termLabel [termID]|termLabel [termID]|termLabel [termID]. Example: Annotating a water sample from the photic zone in middle of the Atlantic Ocean, consider: oceanic epipelagic zone biome [ENVO:01000033]. Example: Annotating a sample from the Amazon rainforest consider: tropical moist broadleaf forest biome [ENVO:01000228]. If needed, request new terms on the ENVO tracker, identified here: http://www.obofoundry.org/ontology/envo.html';


--
-- Name: COLUMN "molecular-protocol".env_local_scale; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".env_local_scale IS 'In this field, report the entity or entities which are in your sample or specimen’s local vicinity and which you believe have significant causal influences on your sample or specimen. Please use terms that are present in ENVO and which are of smaller spatial grain than your entry for env_broad_scale. Format (one term): termLabel [termID]; Format (multiple terms): termLabel [termID]|termLabel [termID]|termLabel [termID]. Example: Annotating a pooled sample taken from various vegetation layers in a forest consider: canopy [ENVO:00000047]|herb and fern layer [ENVO:01000337]|litter layer [ENVO:01000338]|understory [01000335]|shrub layer [ENVO:01000336]. If needed, request new terms on the ENVO tracker, identified here: http://www.obofoundry.org/ontology/envo.html';


--
-- Name: COLUMN "molecular-protocol".env_medium; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".env_medium IS 'In this field, report which environmental material or materials (pipe separated) immediately surrounded your sample or specimen prior to sampling, using one or more subclasses of ENVO’s environmental material class: http://purl.obolibrary.org/obo/ENVO_00010483. Format (one term): termLabel [termID]; Format (multiple terms): termLabel [termID]|termLabel [termID]|termLabel [termID]. Example: Annotating a fish swimming in the upper 100 m of the Atlantic Ocean, consider: ocean water [ENVO:00002151]. Example: Annotating a duck on a pond consider: pond water [ENVO:00002228]|air ENVO_00002005. If needed, request new terms on the ENVO tracker, identified here: http://www.obofoundry.org/ontology/envo.html';


--
-- Name: COLUMN "molecular-protocol".subspecf_gen_lin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".subspecf_gen_lin IS 'This should provide further information about the genetic distinctness of the sequenced organism by recording additional information e.g. serovar, serotype, biotype, ecotype, or any relevant genetic typing schemes like Group I plasmid. It can also contain alternative taxonomic information. It should contain both the lineage name, and the lineage rank, i.e. biovar:abc123';


--
-- Name: COLUMN "molecular-protocol".ploidy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".ploidy IS 'The ploidy level of the genome (e.g. allopolyploid, haploid, diploid, triploid, tetraploid). It has implications for the downstream study of duplicated gene and regions of the genomes (and perhaps for difficulties in assembly). For terms, please select terms listed under class ploidy (PATO:001374) of Phenotypic Quality Ontology (PATO), and for a browser of PATO (v 2018-03-27) please refer to http://purl.bioontology.org/ontology/PATO';


--
-- Name: COLUMN "molecular-protocol".num_replicons; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".num_replicons IS 'Reports the number of replicons in a nuclear genome of eukaryotes, in the genome of a bacterium or archaea or the number of segments in a segmented virus. Always applied to the haploid chromosome count of a eukaryote';


--
-- Name: COLUMN "molecular-protocol".extrachrom_elements; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".extrachrom_elements IS 'Do plasmids exist of significant phenotypic consequence (e.g. ones that determine virulence or antibiotic resistance). Megaplasmids? Other plasmids (borrelia has 15+ plasmids)';


--
-- Name: COLUMN "molecular-protocol".estimated_size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".estimated_size IS 'The estimated size of the genome prior to sequencing. Of particular importance in the sequencing of (eukaryotic) genome which could remain in draft form for a long or unspecified period.';


--
-- Name: COLUMN "molecular-protocol".ref_biomaterial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".ref_biomaterial IS 'Primary publication if isolated before genome publication; otherwise, primary genome report';


--
-- Name: COLUMN "molecular-protocol".source_mat_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".source_mat_id IS 'A unique identifier assigned to a material sample (as defined by http://rs.tdwg.org/dwc/terms/materialSampleID, and as opposed to a particular digital record of a material sample) used for extracting nucleic acids, and subsequent sequencing. The identifier can refer either to the original material collected or to any derived sub-samples. The INSDC qualifiers /specimen_voucher, /bio_material, or /culture_collection may or may not share the same value as the source_mat_id field. For instance, the /specimen_voucher qualifier and source_mat_id may both contain ´UAM:Herps:14´ , referring to both the specimen voucher and sampled tissue with the same identifier. However, the /culture_collection qualifier may refer to a value from an initial culture (e.g. ATCC:11775) while source_mat_id would refer to an identifier from some derived culture from which the nucleic acids were extracted (e.g. xatc123 or ark:/2154/R2).';


--
-- Name: COLUMN "molecular-protocol".pathogenicity; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pathogenicity IS 'To what is the entity pathogenic';


--
-- Name: COLUMN "molecular-protocol".biotic_relationship; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".biotic_relationship IS 'Description of relationship(s) between the subject organism and other organism(s) it is associated with. E.g., parasite on species X; mutualist with species Y. The target organism is the subject of the relationship, and the other organism(s) is the object';


--
-- Name: COLUMN "molecular-protocol".specific_host; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".specific_host IS 'If there is a host involved, please provide its taxid (or environmental if not actually isolated from the dead or alive host - i.e. a pathogen could be isolated from a swipe of a bench etc) and report whether it is a laboratory or natural host)';


--
-- Name: COLUMN "molecular-protocol".host_spec_range; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".host_spec_range IS 'The NCBI taxonomy identifier of the specific host if it is known';


--
-- Name: COLUMN "molecular-protocol".host_disease_stat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".host_disease_stat IS 'List of diseases with which the host has been diagnosed; can include multiple diagnoses. The value of the field depends on host; for humans the terms should be chosen from the DO (Human Disease Ontology) at https://www.disease-ontology.org, non-human host diseases are free text';


--
-- Name: COLUMN "molecular-protocol".trophic_level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".trophic_level IS 'Trophic levels are the feeding position in a food chain. Microbes can be a range of producers (e.g. chemolithotroph)';


--
-- Name: COLUMN "molecular-protocol".propagation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".propagation IS 'This field is specific to different taxa. For phages: lytic/lysogenic, for plasmids: incompatibility group, for eukaryotes: sexual/asexual (Note: there is the strong opinion to name phage propagation obligately lytic or temperate, therefore we also give this choice';


--
-- Name: COLUMN "molecular-protocol".encoded_traits; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".encoded_traits IS 'Should include key traits like antibiotic resistance or xenobiotic degradation phenotypes for plasmids, converting genes for phage';


--
-- Name: COLUMN "molecular-protocol".rel_to_oxygen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".rel_to_oxygen IS 'Is this organism an aerobe, anaerobe? Please note that aerobic and anaerobic are valid descriptors for microbial environments';


--
-- Name: COLUMN "molecular-protocol".isol_growth_condt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".isol_growth_condt IS 'Publication reference in the form of pubmed ID (pmid), digital object identifier (doi) or url for isolation and growth condition specifications of the organism/material';


--
-- Name: COLUMN "molecular-protocol".samp_collec_device; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_collec_device IS 'The device used to collect an environmental sample. This field accepts terms listed under environmental sampling device (http://purl.obolibrary.org/obo/ENVO). This field also accepts terms listed under specimen collection device (http://purl.obolibrary.org/obo/GENEPIO_0002094).';


--
-- Name: COLUMN "molecular-protocol".samp_collec_method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_collec_method IS 'The method employed for collecting the sample';


--
-- Name: COLUMN "molecular-protocol".samp_mat_process; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_mat_process IS 'Any processing applied to the sample during or after retrieving the sample from environment. This field accepts OBI, for a browser of OBI (v 2018-02-12) terms please see http://purl.bioontology.org/ontology/OBI';


--
-- Name: COLUMN "molecular-protocol".size_frac; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".size_frac IS 'Filtering pore size used in sample preparation';


--
-- Name: COLUMN "molecular-protocol".samp_size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_size IS 'Amount or size of sample (volume, mass or area) that was collected';


--
-- Name: COLUMN "molecular-protocol".samp_vol_we_dna_ext; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".samp_vol_we_dna_ext IS 'Volume (ml) or mass (g) of total collected sample processed for DNA extraction. Note: total sample collected should be entered under the term Sample Size (MIXS:0000001).';


--
-- Name: COLUMN "molecular-protocol".source_uvig; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".source_uvig IS 'Type of dataset from which the UViG was obtained';


--
-- Name: COLUMN "molecular-protocol".virus_enrich_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".virus_enrich_appr IS 'List of approaches used to enrich the sample for viruses, if any';


--
-- Name: COLUMN "molecular-protocol".nucl_acid_ext; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".nucl_acid_ext IS 'A link to a literature reference, electronic resource or a standard operating procedure (SOP), that describes the material separation to recover the nucleic acid fraction from a sample';


--
-- Name: COLUMN "molecular-protocol".nucl_acid_amp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".nucl_acid_amp IS 'A link to a literature reference, electronic resource or a standard operating procedure (SOP), that describes the enzymatic amplification (PCR, TMA, NASBA) of specific nucleic acids';


--
-- Name: COLUMN "molecular-protocol".lib_size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".lib_size IS 'Total number of clones in the library prepared for the project';


--
-- Name: COLUMN "molecular-protocol".lib_reads_seqd; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".lib_reads_seqd IS 'Total number of clones sequenced from the library';


--
-- Name: COLUMN "molecular-protocol".lib_layout; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".lib_layout IS 'Specify whether to expect single, paired, or other configuration of reads';


--
-- Name: COLUMN "molecular-protocol".lib_vector; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".lib_vector IS 'Cloning vector type(s) used in construction of libraries';


--
-- Name: COLUMN "molecular-protocol".lib_screen; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".lib_screen IS 'Specific enrichment or screening methods applied before and/or after creating libraries';


--
-- Name: COLUMN "molecular-protocol".target_gene; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".target_gene IS 'Targeted gene or locus name for marker gene studies';


--
-- Name: COLUMN "molecular-protocol".target_subfragment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".target_subfragment IS 'Name of subfragment of a gene or locus. Important to e.g. identify special regions on marker genes like V6 on 16S rRNA';


--
-- Name: COLUMN "molecular-protocol".pcr_primers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primers IS 'PCR primers that were used to amplify the sequence of the targeted gene, locus or subfragment. This field should contain all the primers used for a single PCR reaction if multiple forward or reverse primers are present in a single PCR reaction. The primer sequence should be reported in uppercase letters';


--
-- Name: COLUMN "molecular-protocol".mid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".mid IS 'Molecular barcodes, called Multiplex Identifiers (MIDs), that are used to specifically tag unique samples in a sequencing run. Sequence should be reported in uppercase letters';


--
-- Name: COLUMN "molecular-protocol".adapters; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".adapters IS 'Adapters provide priming sequences for both amplification and sequencing of the sample-library fragments. Both adapters should be reported; in uppercase letters';


--
-- Name: COLUMN "molecular-protocol".pcr_cond; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_cond IS 'Description of reaction conditions and components of PCR in the form of ´initial denaturation:94degC_1.5min; annealing=...´';


--
-- Name: COLUMN "molecular-protocol".seq_meth; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".seq_meth IS 'Sequencing method used; e.g. Sanger, ABI-solid';


--
-- Name: COLUMN "molecular-protocol".seq_quality_check; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".seq_quality_check IS 'Indicate if the sequence has been called by automatic systems (none) or undergone a manual editing procedure (e.g. by inspecting the raw data or chromatograms). Applied only for sequences that are not submitted to SRA,ENA or DRA';


--
-- Name: COLUMN "molecular-protocol".chimera_check; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".chimera_check IS 'A chimeric sequence, or chimera for short, is a sequence comprised of two or more phylogenetically distinct parent sequences. Chimeras are usually PCR artifacts thought to occur when a prematurely terminated amplicon reanneals to a foreign DNA strand and is copied to completion in the following PCR cycles. The point at which the chimeric sequence changes from one parent to the next is called the breakpoint or conversion point';


--
-- Name: COLUMN "molecular-protocol".tax_ident; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".tax_ident IS 'The phylogenetic marker(s) used to assign an organism name to the SAG or MAG';


--
-- Name: COLUMN "molecular-protocol".assembly_qual; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".assembly_qual IS 'The assembly quality category is based on sets of criteria outlined for each assembly quality category. For MISAG/MIMAG; Finished: Single, validated, contiguous sequence per replicon without gaps or ambiguities with a consensus error rate equivalent to Q50 or better. High Quality Draft:Multiple fragments where gaps span repetitive regions. Presence of the 23S, 16S and 5S rRNA genes and at least 18 tRNAs. Medium Quality Draft:Many fragments with little to no review of assembly other than reporting of standard assembly statistics. Low Quality Draft:Many fragments with little to no review of assembly other than reporting of standard assembly statistics. Assembly statistics include, but are not limited to total assembly size, number of contigs, contig N50/L50, and maximum contig length. For MIUVIG; Finished: Single, validated, contiguous sequence per replicon without gaps or ambiguities, with extensive manual review and editing to annotate putative gene functions and transcriptional units. High-quality draft genome: One or multiple fragments, totaling ≥ 90% of the expected genome or replicon sequence or predicted complete. Genome fragment(s): One or multiple fragments, totalling < 90% of the expected genome or replicon sequence, or for which no genome size could be estimated';


--
-- Name: COLUMN "molecular-protocol".assembly_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".assembly_name IS 'Name/version of the assembly provided by the submitter that is used in the genome browsers and in the community';


--
-- Name: COLUMN "molecular-protocol".assembly_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".assembly_software IS 'Tool(s) used for assembly, including version number and parameters';


--
-- Name: COLUMN "molecular-protocol".annot; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".annot IS 'Tool used for annotation, or for cases where annotation was provided by a community jamboree or model organism database rather than by a specific submitter';


--
-- Name: COLUMN "molecular-protocol".number_contig; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".number_contig IS 'Total number of contigs in the cleaned/submitted assembly that makes up a given genome, SAG, MAG, or UViG';


--
-- Name: COLUMN "molecular-protocol".feat_pred; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".feat_pred IS 'Method used to predict UViGs features such as ORFs, integration site, etc.';


--
-- Name: COLUMN "molecular-protocol".ref_db; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".ref_db IS 'List of database(s) used for ORF annotation, along with version number and reference to website or publication';


--
-- Name: COLUMN "molecular-protocol".sim_search_meth; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".sim_search_meth IS 'Tool used to compare ORFs with database, along with version and cutoffs used';


--
-- Name: COLUMN "molecular-protocol".tax_class; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".tax_class IS 'Method used for taxonomic classification, along with reference database used, classification rank, and thresholds used to classify new genomes';


--
-- Name: COLUMN "molecular-protocol"._16s_recover; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"._16s_recover IS 'Can a 16S gene be recovered from the submitted SAG or MAG?';


--
-- Name: COLUMN "molecular-protocol"._16s_recover_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"._16s_recover_software IS 'Tools used for 16S rRNA gene extraction';


--
-- Name: COLUMN "molecular-protocol".trnas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".trnas IS 'The total number of tRNAs identified from the SAG or MAG';


--
-- Name: COLUMN "molecular-protocol".trna_ext_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".trna_ext_software IS 'Tools used for tRNA identification';


--
-- Name: COLUMN "molecular-protocol".compl_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".compl_score IS 'Completeness score is typically based on either the fraction of markers found as compared to a database or the percent of a genome found as compared to a closely related reference genome. High Quality Draft: >90%, Medium Quality Draft: >50%, and Low Quality Draft: < 50% should have the indicated completeness scores';


--
-- Name: COLUMN "molecular-protocol".compl_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".compl_software IS 'Tools used for completion estimate, i.e. checkm, anvi´o, busco';


--
-- Name: COLUMN "molecular-protocol".compl_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".compl_appr IS 'The approach used to determine the completeness of a given SAG or MAG, which would typically make use of a set of conserved marker genes or a closely related reference genome. For UViG completeness, include reference genome or group used, and contig feature suggesting a complete genome';


--
-- Name: COLUMN "molecular-protocol".contam_score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".contam_score IS 'The contamination score is based on the fraction of single-copy genes that are observed more than once in a query genome. The following scores are acceptable for; High Quality Draft: < 5%, Medium Quality Draft: < 10%, Low Quality Draft: < 10%. Contamination must be below 5% for a SAG or MAG to be deposited into any of the public databases';


--
-- Name: COLUMN "molecular-protocol".contam_screen_input; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".contam_screen_input IS 'The type of sequence data used as input';


--
-- Name: COLUMN "molecular-protocol".contam_screen_param; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".contam_screen_param IS 'Specific parameters used in the decontamination sofware, such as reference database, coverage, and kmers. Combinations of these parameters may also be used, i.e. kmer and coverage, or reference database and kmer';


--
-- Name: COLUMN "molecular-protocol".decontam_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".decontam_software IS 'Tool(s) used in contamination screening';


--
-- Name: COLUMN "molecular-protocol".sort_tech; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".sort_tech IS 'Method used to sort/isolate cells or particles of interest';


--
-- Name: COLUMN "molecular-protocol".single_cell_lysis_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".single_cell_lysis_appr IS 'Method used to free DNA from interior of the cell(s) or particle(s)';


--
-- Name: COLUMN "molecular-protocol".single_cell_lysis_prot; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".single_cell_lysis_prot IS 'Name of the kit or standard protocol used for cell(s) or particle(s) lysis';


--
-- Name: COLUMN "molecular-protocol".wga_amp_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".wga_amp_appr IS 'Method used to amplify genomic DNA in preparation for sequencing';


--
-- Name: COLUMN "molecular-protocol".wga_amp_kit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".wga_amp_kit IS 'Kit used to amplify genomic DNA in preparation for sequencing';


--
-- Name: COLUMN "molecular-protocol".bin_param; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".bin_param IS 'The parameters that have been applied during the extraction of genomes from metagenomic datasets';


--
-- Name: COLUMN "molecular-protocol".bin_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".bin_software IS 'Tool(s) used for the extraction of genomes from metagenomic datasets';


--
-- Name: COLUMN "molecular-protocol".reassembly_bin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".reassembly_bin IS 'Has an assembly been performed on a genome bin extracted from a metagenomic assembly?';


--
-- Name: COLUMN "molecular-protocol".mag_cov_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".mag_cov_software IS 'Tool(s) used to determine the genome coverage if coverage is used as a binning parameter in the extraction of genomes from metagenomic datasets';


--
-- Name: COLUMN "molecular-protocol".vir_ident_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".vir_ident_software IS 'Tool(s) used for the identification of UViG as a viral genome, software or protocol name including version number, parameters, and cutoffs used';


--
-- Name: COLUMN "molecular-protocol".pred_genome_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pred_genome_type IS 'Type of genome predicted for the UViG';


--
-- Name: COLUMN "molecular-protocol".pred_genome_struc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pred_genome_struc IS 'Expected structure of the viral genome';


--
-- Name: COLUMN "molecular-protocol".detec_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".detec_type IS 'Type of UViG detection';


--
-- Name: COLUMN "molecular-protocol".otu_class_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".otu_class_appr IS 'Cutoffs and approach used when clustering new UViGs in "species-level" OTUs. Note that results from standard 95% ANI / 85% AF clustering should be provided alongside OTUS defined from another set of thresholds, even if the latter are the ones primarily used during the analysis';


--
-- Name: COLUMN "molecular-protocol".otu_seq_comp_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".otu_seq_comp_appr IS 'Tool and thresholds used to compare sequences when computing "species-level" OTUs';


--
-- Name: COLUMN "molecular-protocol".otu_db; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".otu_db IS 'Reference database (i.e. sequences not generated as part of the current study) used to cluster new genomes in "species-level" OTUs, if any';


--
-- Name: COLUMN "molecular-protocol".host_pred_appr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".host_pred_appr IS 'Tool or approach used for host prediction';


--
-- Name: COLUMN "molecular-protocol".host_pred_est_acc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".host_pred_est_acc IS 'For each tool or approach used for host prediction, estimated false discovery rates should be included, either computed de novo or from the literature';


--
-- Name: COLUMN "molecular-protocol".sop; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".sop IS 'Standard operating procedures used in assembly and/or annotation of genomes, metagenomes or environmental sequences';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_forward; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_forward IS 'Forward PCR primer that were used to amplify the sequence of the targeted gene, locus or subfragment. If multiple multiple forward or reverse primers are present in a single PCR reaction, there should be a full row for each of these linked to the same DWC Occurrence. The primer sequence should be reported in uppercase letters';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_reverse; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_reverse IS 'Reverse PCR primer that were used to amplify the sequence of the targeted gene, locus or subfragment. If multiple multiple forward or reverse primers are present in a single PCR reaction, there should be a full row for each of these linked to the same DWC Occurrence. The primer sequence should be reported in uppercase letters';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_name_forward; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_name_forward IS 'Name of the forward PCR primer that were used to amplify the sequence of the targeted gene, locus or subfragment. If multiple multiple forward or reverse primers are present in a single PCR reaction, there should be a full row for each of these linked to the same DWC Occurrence.';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_name_reverse; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_name_reverse IS 'Name of the reverse PCR primer that were used to amplify the sequence of the targeted gene, locus or subfragment. If multiple multiple forward or reverse primers are present in a single PCR reaction, there should be a full row for each of these linked to the same DWC Occurrence.';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_reference; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_reference IS 'Reference for the PCR primers that were used to amplify the sequence of the targeted gene, locus or subfragment.';


--
-- Name: COLUMN "molecular-protocol"."DNA_sequence"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."DNA_sequence" IS 'The DNA sequence';


--
-- Name: COLUMN "molecular-protocol".concentration; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".concentration IS 'Concentration of DNA (weight ng/volume µl)';


--
-- Name: COLUMN "molecular-protocol"."concentrationUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."concentrationUnit" IS 'Unit used for concentration measurement';


--
-- Name: COLUMN "molecular-protocol"."methodDeterminationConcentrationAndRatios"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."methodDeterminationConcentrationAndRatios" IS 'Description of method used for concentration measurement';


--
-- Name: COLUMN "molecular-protocol"."ratioOfAbsorbance260_230"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."ratioOfAbsorbance260_230" IS 'Ratio of absorbance at 260 nm and 230 nm assessing DNA purity (mostly secondary measure, indicates mainly EDTA, carbohydrates, phenol), (DNA samples only).';


--
-- Name: COLUMN "molecular-protocol"."ratioOfAbsorbance260_280"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."ratioOfAbsorbance260_280" IS 'Ratio of absorbance at 280 nm and 230 nm assessing DNA purity (mostly secondary measure, indicates mainly EDTA, carbohydrates, phenol), (DNA samples only).';


--
-- Name: COLUMN "molecular-protocol"."annealingTemp"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."annealingTemp" IS 'The reaction temperature during the annealing phase of PCR.';


--
-- Name: COLUMN "molecular-protocol"."annealingTempUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."annealingTempUnit" IS 'Measurement unit of the reaction temperature during the annealing phase of PCR.';


--
-- Name: COLUMN "molecular-protocol"."probeReporter"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."probeReporter" IS 'Type of fluorophore (reporter) used. Probe anneals within amplified target DNA. Polymerase activity degrades the probe that has annealed to the template, and the probe releases the fluorophore from it and breaks the proximity to the quencher, thus allowing fluorescence of the fluorophore.';


--
-- Name: COLUMN "molecular-protocol"."probeQuencher"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."probeQuencher" IS 'Type of quencher used. The quencher molecule quenches the fluorescence emitted by the fluorophore when excited by the cycler’s light source As long as fluorophore and the quencher are in proximity, quenching inhibits any fluorescence signals.';


--
-- Name: COLUMN "molecular-protocol"."ampliconSize"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."ampliconSize" IS 'The length of the amplicon in basepairs.';


--
-- Name: COLUMN "molecular-protocol"."thresholdQuantificationCycle"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."thresholdQuantificationCycle" IS 'Threshold for change in fluorescence signal between cycles';


--
-- Name: COLUMN "molecular-protocol"."baselineValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."baselineValue" IS 'The number of cycles when fluorescence signal from the target amplification is below background fluorescence not originated from the real target amplification.';


--
-- Name: COLUMN "molecular-protocol"."quantificationCycle"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."quantificationCycle" IS 'The number of cycles required for the fluorescent signal to cross a given value threshold above the baseline. Quantification cycle (Cq), threshold cycle (Ct), crossing point (Cp), and take-off point (TOP) refer to the same value from the real-time instrument. Use of quantification cycle (Cq), is preferable according to the RDML (Real-Time PCR Data Markup Language) data standard (http://www.rdml.org).';


--
-- Name: COLUMN "molecular-protocol"."automaticThresholdQuantificationCycle"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."automaticThresholdQuantificationCycle" IS 'Whether the threshold was set by the instrument or manually.';


--
-- Name: COLUMN "molecular-protocol"."automaticBaselineValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."automaticBaselineValue" IS 'Whether the baseline value was set by the instrument or manually.';


--
-- Name: COLUMN "molecular-protocol"."contaminationAssessment"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."contaminationAssessment" IS 'Whether DNA or RNA contamination assessment was done or not.';


--
-- Name: COLUMN "molecular-protocol"."partitionVolume"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."partitionVolume" IS 'An accurate estimation of partition volume. The sum of the partitions multiplied by the partition volume will enable the total volume of the reaction to be calculated.';


--
-- Name: COLUMN "molecular-protocol"."partitionVolumeUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."partitionVolumeUnit" IS 'Unit used for partition volume';


--
-- Name: COLUMN "molecular-protocol"."estimatedNumberOfCopies"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."estimatedNumberOfCopies" IS 'Number of target molecules per µl. Mean copies per partition (?) can be calculated using the number of partitions (n) and the estimated copy number in the total volume of all partitions (m) with a formula ?=m/n.';


--
-- Name: COLUMN "molecular-protocol"."amplificationReactionVolume"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."amplificationReactionVolume" IS 'PCR reaction volume';


--
-- Name: COLUMN "molecular-protocol"."amplificationReactionVolumeUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."amplificationReactionVolumeUnit" IS 'Unit used for PCR reaction volume. Many of the instruments require preparation of a much larger initial sample volume than is actually analyzed.';


--
-- Name: COLUMN "molecular-protocol".pcr_analysis_software; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_analysis_software IS 'The program used to analyse the d(d)PCR runs.';


--
-- Name: COLUMN "molecular-protocol"."experimentalVariance"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol"."experimentalVariance" IS 'Multiple biological replicates are encouraged to assess total experimental variation. When single dPCR experiments are performed, a minimal estimate of variance due to counting error alone must be calculated from the binomial (or suitable equivalent) distribution.';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_lod; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_lod IS 'The assay’s ability to detect the target at low levels.';


--
-- Name: COLUMN "molecular-protocol".pcr_primer_loq; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol".pcr_primer_loq IS 'The assay’s ability to quantify copy number at low levels.';


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

COMMENT ON TABLE public."molecular-protocol-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."molecularProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."molecularProtocolID" IS 'An identifier for a MolecularProtocol.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in agentRole is given.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "molecular-protocol-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."molecular-protocol-assertion" OWNER TO postgres;

--
-- Name: TABLE "molecular-protocol-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."molecular-protocol-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."molecularProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."molecularProtocolID" IS 'An identifier for a MolecularProtocol.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionType is given.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionValue is given.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "molecular-protocol-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- Name: molecular-protocol-citation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."molecular-protocol-citation" (
    "citationID" text NOT NULL,
    "molecularProtocolID" text NOT NULL,
    "citationType" text,
    "citationTypeIRI" text,
    "citationTypeVocabulary" text,
    "bibliographicCitation" text,
    "pageNumber" text,
    "referenceID" text,
    "referenceType" text,
    "referenceTypeIRI" text,
    "referenceTypeVocabulary" text,
    "referenceYear" integer,
    "isPeerReviewed" boolean,
    "citationRemarks" text
);


ALTER TABLE public."molecular-protocol-citation" OWNER TO postgres;

--
-- Name: TABLE "molecular-protocol-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."molecular-protocol-citation" IS 'Comments or notes about a Citation.';


--
-- Name: COLUMN "molecular-protocol-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."citationID" IS 'An identifier for a Citation.';


--
-- Name: COLUMN "molecular-protocol-citation"."molecularProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."molecularProtocolID" IS 'An identifier for a MolecularProtocol.';


--
-- Name: COLUMN "molecular-protocol-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- Name: COLUMN "molecular-protocol-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- Name: COLUMN "molecular-protocol-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in citationType is given.';


--
-- Name: COLUMN "molecular-protocol-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- Name: COLUMN "molecular-protocol-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- Name: COLUMN "molecular-protocol-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- Name: COLUMN "molecular-protocol-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- Name: COLUMN "molecular-protocol-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- Name: COLUMN "molecular-protocol-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in referenceType is given.';


--
-- Name: COLUMN "molecular-protocol-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- Name: COLUMN "molecular-protocol-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- Name: COLUMN "molecular-protocol-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."molecular-protocol-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


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

COMMENT ON TABLE public."nucleotide-analysis" IS 'The total number of reads in the analysis.';


--
-- Name: COLUMN "nucleotide-analysis"."nucleotideAnalysisID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."nucleotideAnalysisID" IS 'An identifier for a NucleotideAnalysis.';


--
-- Name: COLUMN "nucleotide-analysis"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."eventID" IS 'An identifier for an Event.';


--
-- Name: COLUMN "nucleotide-analysis"."molecularProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."molecularProtocolID" IS 'An identifier for a MolecularProtocol.';


--
-- Name: COLUMN "nucleotide-analysis"."nucleotideSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."nucleotideSequenceID" IS 'An identifier for a NucleotideSequence.';


--
-- Name: COLUMN "nucleotide-analysis"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."materialEntityID" IS 'An identifier for a MaterialEntity.';


--
-- Name: COLUMN "nucleotide-analysis"."readCount"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."readCount" IS 'The number of reads for the sequence in the analysis.';


--
-- Name: COLUMN "nucleotide-analysis"."totalReadCount"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis"."totalReadCount" IS 'The total number of reads in the analysis.';


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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."nucleotide-analysis-assertion" OWNER TO postgres;

--
-- Name: TABLE "nucleotide-analysis-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."nucleotide-analysis-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."nucleotideAnalysisID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."nucleotideAnalysisID" IS 'An identifier for a NucleotideAnalysis.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionType is given.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionValue is given.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "nucleotide-analysis-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-analysis-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


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

COMMENT ON TABLE public."nucleotide-sequence" IS 'Comments or notes about a NucleotideSequence.';


--
-- Name: COLUMN "nucleotide-sequence"."nucleotideSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-sequence"."nucleotideSequenceID" IS 'An identifier for a NucleotideSequence.';


--
-- Name: COLUMN "nucleotide-sequence"."nucleotideSequence"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-sequence"."nucleotideSequence" IS 'A string representing nucleotide base pairs.';


--
-- Name: COLUMN "nucleotide-sequence"."nucleotideSequenceRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."nucleotide-sequence"."nucleotideSequenceRemarks" IS 'Comments or notes about a NucleotideSequence.';


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
    "occurrenceCitation" text,
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
    kingdom text,
    "scientificName" text,
    "taxonRank" text,
    "taxonRemarks" text
);


ALTER TABLE public.occurrence OWNER TO postgres;

--
-- Name: TABLE occurrence; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.occurrence IS 'Comments or notes about a dwc:Taxon.';


--
-- Name: COLUMN occurrence."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN occurrence."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN occurrence."surveyTargetID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."surveyTargetID" IS 'An identifier for a SurveyTarget.';


--
-- Name: COLUMN occurrence."recordedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."recordedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations responsible for recording a dwc:Occurrence.';


--
-- Name: COLUMN occurrence."recordedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."recordedByID" IS 'An identifier for the Agent responsible for recording a dwc:Occurrence.';


--
-- Name: COLUMN occurrence."organismQuantity"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismQuantity" IS 'A number or enumeration value for the quantity of dwc:Organisms.';


--
-- Name: COLUMN occurrence."organismQuantityType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismQuantityType" IS 'A type of quantification system used for the quantity of dwc:Organisms.';


--
-- Name: COLUMN occurrence.sex; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.sex IS 'The sex of a dwc:Organism.';


--
-- Name: COLUMN occurrence."lifeStage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."lifeStage" IS 'The age class or life stage of a dwc:Organism.';


--
-- Name: COLUMN occurrence."reproductiveCondition"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."reproductiveCondition" IS 'The reproductive condition a dwc:Organism.';


--
-- Name: COLUMN occurrence.caste; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.caste IS 'The social caste of a dwc:Organism.';


--
-- Name: COLUMN occurrence.behavior; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.behavior IS 'The behavior shown by a dwc:Organism.';


--
-- Name: COLUMN occurrence.vitality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.vitality IS 'An indication of whether a dwc:Organism was alive or dead at the time of collection or observation.';


--
-- Name: COLUMN occurrence."establishmentMeans"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."establishmentMeans" IS 'Statement about whether a dwc:Organism has been introduced to a given place and time through the direct or indirect activity of modern humans.';


--
-- Name: COLUMN occurrence."degreeOfEstablishment"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."degreeOfEstablishment" IS 'The degree to which a dwc:Organism survives, reproduces, and expands its range at a given place and time.';


--
-- Name: COLUMN occurrence.pathway; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.pathway IS 'The process by which a dwc:Organism came to be in a given place at a given time.';


--
-- Name: COLUMN occurrence."occurrenceStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."occurrenceStatus" IS 'A statement about the detection or non-detection of a dwc:Organism.';


--
-- Name: COLUMN occurrence."occurrenceCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."occurrenceCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a dwc:Occurrence.';


--
-- Name: COLUMN occurrence."informationWithheld"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."informationWithheld" IS 'Additional information that exists, but that has not been shared in the given record.';


--
-- Name: COLUMN occurrence."dataGeneralizations"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."dataGeneralizations" IS 'Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- Name: COLUMN occurrence."occurrenceRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."occurrenceRemarks" IS 'Comments or notes about a dwc:Occurrence.';


--
-- Name: COLUMN occurrence."organismID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismID" IS 'An identifier for a dwc:Organism.';


--
-- Name: COLUMN occurrence."organismScope"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismScope" IS 'A description of the type of dwc:Organism instance.';


--
-- Name: COLUMN occurrence."organismName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismName" IS 'A name or label assigned to a dwc:Organism.';


--
-- Name: COLUMN occurrence."organismRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismRemarks" IS 'Comments or notes about a dwc:Organism.';


--
-- Name: COLUMN occurrence."verbatimIdentification"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."verbatimIdentification" IS 'A string representing the taxonomic identification as it appeared in the original record.';


--
-- Name: COLUMN occurrence."taxonFormula"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."taxonFormula" IS 'A string representing the pattern to use to construct a dwc:Identification from dwc:Taxon names and identification qualifiers.';


--
-- Name: COLUMN occurrence."identifiedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identifiedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN occurrence."identifiedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identifiedByID" IS 'The identifier for the Agent who made a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN occurrence."dateIdentified"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."dateIdentified" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN occurrence."identificationReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identificationReferences" IS 'A list (concatenated and separated) of references (publication, global unique identifier, URI) used in a dwc:Identification.';


--
-- Name: COLUMN occurrence."identificationVerificationStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identificationVerificationStatus" IS 'A categorical indicator of the extent to which the taxonomic determination has been verified to be correct.';


--
-- Name: COLUMN occurrence."identificationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identificationRemarks" IS 'Comments or notes about a dwc:Identification.';


--
-- Name: COLUMN occurrence."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."taxonID" IS 'An identifier for a dwc:Taxon.';


--
-- Name: COLUMN occurrence.kingdom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.kingdom IS 'The full scientific name of the kingdom in which a dwc:scientificName is classified.';


--
-- Name: COLUMN occurrence."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."scientificName" IS 'The full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- Name: COLUMN occurrence."taxonRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."taxonRank" IS 'The taxonomic rank of the most specific name in a dwc:scientificName.';


--
-- Name: COLUMN occurrence."taxonRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."taxonRemarks" IS 'Comments or notes about a dwc:Taxon.';


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

COMMENT ON TABLE public."occurrence-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "occurrence-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "occurrence-agent-role"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN "occurrence-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "occurrence-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- Name: COLUMN "occurrence-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- Name: COLUMN "occurrence-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "occurrence-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."occurrence-assertion" OWNER TO postgres;

--
-- Name: TABLE "occurrence-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN "occurrence-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- Name: COLUMN "occurrence-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "occurrence-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "occurrence-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "occurrence-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- Name: COLUMN "occurrence-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "occurrence-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "occurrence-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "occurrence-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "occurrence-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "occurrence-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- Name: occurrence-citation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."occurrence-citation" (
    "citationID" text NOT NULL,
    "occurrenceID" text NOT NULL,
    "citationType" text,
    "citationTypeIRI" text,
    "citationTypeVocabulary" text,
    "bibliographicCitation" text,
    "pageNumber" text,
    "referenceID" text,
    "referenceType" text,
    "referenceTypeIRI" text,
    "referenceTypeVocabulary" text,
    "referenceYear" integer,
    "isPeerReviewed" boolean,
    "citationRemarks" text
);


ALTER TABLE public."occurrence-citation" OWNER TO postgres;

--
-- Name: TABLE "occurrence-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-citation" IS 'Comments or notes about a Citation.';


--
-- Name: COLUMN "occurrence-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."citationID" IS 'An identifier for a Citation.';


--
-- Name: COLUMN "occurrence-citation"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN "occurrence-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- Name: COLUMN "occurrence-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- Name: COLUMN "occurrence-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for citationType is given.';


--
-- Name: COLUMN "occurrence-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- Name: COLUMN "occurrence-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- Name: COLUMN "occurrence-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- Name: COLUMN "occurrence-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- Name: COLUMN "occurrence-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- Name: COLUMN "occurrence-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for referenceType is given.';


--
-- Name: COLUMN "occurrence-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- Name: COLUMN "occurrence-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- Name: COLUMN "occurrence-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


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

COMMENT ON TABLE public."occurrence-identifier" IS 'A language in which an Identifier is presented.';


--
-- Name: COLUMN "occurrence-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "occurrence-identifier"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN "occurrence-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "occurrence-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- Name: COLUMN "occurrence-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for identifierType is given.';


--
-- Name: COLUMN "occurrence-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


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

COMMENT ON TABLE public."occurrence-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "occurrence-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "occurrence-media"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN "occurrence-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "occurrence-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- Name: COLUMN "occurrence-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


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

COMMENT ON TABLE public."occurrence-protocol" IS 'An identifier for a dwc:Occurrence.';


--
-- Name: COLUMN "occurrence-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- Name: COLUMN "occurrence-protocol"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-protocol"."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


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

COMMENT ON TABLE public."organism-interaction" IS 'A part of a object dwc:Organism involved in an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."organismInteractionID" IS 'An identifier for an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN "organism-interaction"."organismInteractionDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."organismInteractionDescription" IS 'A verbatim description of an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."subjectOccurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."subjectOccurrenceID" IS 'A unique identifier for a subject dwc:Occurrence in an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."subjectOrganismPart"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."subjectOrganismPart" IS 'A part of a subject dwc:Organism involved in an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."organismInteractionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."organismInteractionType" IS 'The category that best matches the nature of an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."relatedOccurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."relatedOccurrenceID" IS 'A unique identifier for an related dwc:Occurrence in an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction"."relatedOrganismPart"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."relatedOrganismPart" IS 'A part of a object dwc:Organism involved in an OrganismInteraction.';


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

COMMENT ON TABLE public."organism-interaction-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "organism-interaction-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "organism-interaction-agent-role"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."organismInteractionID" IS 'An identifier for an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "organism-interaction-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- Name: COLUMN "organism-interaction-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- Name: COLUMN "organism-interaction-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "organism-interaction-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."organism-interaction-assertion" OWNER TO postgres;

--
-- Name: TABLE "organism-interaction-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."organism-interaction-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."organismInteractionID" IS 'An identifier for an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "organism-interaction-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- Name: organism-interaction-citation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."organism-interaction-citation" (
    "citationID" text NOT NULL,
    "organismInteractionID" text NOT NULL,
    "citationType" text,
    "citationTypeIRI" text,
    "citationTypeVocabulary" text,
    "bibliographicCitation" text,
    "pageNumber" text,
    "referenceID" text,
    "referenceType" text,
    "referenceTypeIRI" text,
    "referenceTypeVocabulary" text,
    "referenceYear" integer,
    "isPeerReviewed" boolean,
    "citationRemarks" text
);


ALTER TABLE public."organism-interaction-citation" OWNER TO postgres;

--
-- Name: TABLE "organism-interaction-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."organism-interaction-citation" IS 'Comments or notes about a Citation.';


--
-- Name: COLUMN "organism-interaction-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."citationID" IS 'An identifier for a Citation.';


--
-- Name: COLUMN "organism-interaction-citation"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."organismInteractionID" IS 'An identifier for an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- Name: COLUMN "organism-interaction-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- Name: COLUMN "organism-interaction-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for citationType is given.';


--
-- Name: COLUMN "organism-interaction-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- Name: COLUMN "organism-interaction-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- Name: COLUMN "organism-interaction-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- Name: COLUMN "organism-interaction-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- Name: COLUMN "organism-interaction-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- Name: COLUMN "organism-interaction-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for referenceType is given.';


--
-- Name: COLUMN "organism-interaction-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- Name: COLUMN "organism-interaction-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- Name: COLUMN "organism-interaction-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


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

COMMENT ON TABLE public."organism-interaction-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "organism-interaction-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "organism-interaction-media"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."organismInteractionID" IS 'An identifier for an OrganismInteraction.';


--
-- Name: COLUMN "organism-interaction-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "organism-interaction-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- Name: COLUMN "organism-interaction-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: phylogenetic-tree; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."phylogenetic-tree" (
    "phylogeneticTreeID" text NOT NULL,
    "phylogeneticTreeProtocol" text,
    "phylogeneticTreeProtocolID" text,
    "phylogeneticTreeCitation" text
);


ALTER TABLE public."phylogenetic-tree" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeProtocolID" IS 'An identifier for the Protocol used to make an PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a PhylogeneticTree.';


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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."phylogenetic-tree-assertion" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- Name: phylogenetic-tree-citation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."phylogenetic-tree-citation" (
    "citationID" text NOT NULL,
    "phylogeneticTreeID" text NOT NULL,
    "citationType" text,
    "citationTypeIRI" text,
    "citationTypeVocabulary" text,
    "bibliographicCitation" text,
    "pageNumber" text,
    "referenceID" text,
    "referenceType" text,
    "referenceTypeIRI" text,
    "referenceTypeVocabulary" text,
    "referenceYear" integer,
    "isPeerReviewed" boolean,
    "citationRemarks" text
);


ALTER TABLE public."phylogenetic-tree-citation" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-citation" IS 'Comments or notes about a Citation.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."citationID" IS 'An identifier for a Citation.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for citationType is given.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for referenceType is given.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- Name: COLUMN "phylogenetic-tree-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


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

COMMENT ON TABLE public."phylogenetic-tree-identifier" IS 'A language in which an Identifier is presented.';


--
-- Name: COLUMN "phylogenetic-tree-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "phylogenetic-tree-identifier"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "phylogenetic-tree-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- Name: COLUMN "phylogenetic-tree-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for identifierType is given.';


--
-- Name: COLUMN "phylogenetic-tree-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


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

COMMENT ON TABLE public."phylogenetic-tree-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- Name: COLUMN "phylogenetic-tree-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- Name: COLUMN "phylogenetic-tree-media"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- Name: COLUMN "phylogenetic-tree-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- Name: COLUMN "phylogenetic-tree-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


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

COMMENT ON TABLE public."phylogenetic-tree-protocol" IS 'An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- Name: COLUMN "phylogenetic-tree-protocol"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-protocol"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


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
    "geneticSequenceID" text NOT NULL
);


ALTER TABLE public."phylogenetic-tree-tip" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree-tip"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-tip" IS 'An identifier for a GeneticSequence.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."phylogeneticTreeTipID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."phylogeneticTreeTipID" IS 'An identifier for a PhylogeneticTreeTip.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."phylogeneticTreeTipLabel"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."phylogeneticTreeTipLabel" IS 'A label applied to a PhylogeneticTreeTip.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."taxonID" IS 'An identifier for a dwc:Taxon.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."scientificName" IS 'The full scientific name, with authorship and date information if known.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- Name: COLUMN "phylogenetic-tree-tip"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."phylogenetic-tree-tip-assertion" OWNER TO postgres;

--
-- Name: TABLE "phylogenetic-tree-tip-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-tip-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."phylogeneticTreeTipID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."phylogeneticTreeTipID" IS 'An identifier for a PhylogeneticTreeTip.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


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
    "protocolCitation" text,
    "protocolRemarks" text
);


ALTER TABLE public.protocol OWNER TO postgres;

--
-- Name: TABLE protocol; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.protocol IS 'Comments or notes about a Protocol.';


--
-- Name: COLUMN protocol."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolID" IS 'An identifier for a Protocol.';


--
-- Name: COLUMN protocol."protocolType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolType" IS 'The category that best matches the nature of a Protocol.';


--
-- Name: COLUMN protocol."protocolTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Protocol.';


--
-- Name: COLUMN protocol."protocolTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for protocolType is given.';


--
-- Name: COLUMN protocol."protocolName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolName" IS 'The name of a Protocol.';


--
-- Name: COLUMN protocol."protocolDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolDescription" IS 'A description of a Protocol.';


--
-- Name: COLUMN protocol."protocolCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolCitation" IS 'A bibliographic citation for a Protocol.';


--
-- Name: COLUMN protocol."protocolRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolRemarks" IS 'Comments or notes about a Protocol.';


--
-- Name: protocol-citation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."protocol-citation" (
    "citationID" text NOT NULL,
    "protocolID" text NOT NULL,
    "citationType" text,
    "citationTypeIRI" text,
    "citationTypeVocabulary" text,
    "bibliographicCitation" text,
    "pageNumber" text,
    "referenceID" text,
    "referenceType" text,
    "referenceTypeIRI" text,
    "referenceTypeVocabulary" text,
    "referenceYear" integer,
    "isPeerReviewed" boolean,
    "citationRemarks" text
);


ALTER TABLE public."protocol-citation" OWNER TO postgres;

--
-- Name: TABLE "protocol-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."protocol-citation" IS 'Comments or notes about a Citation.';


--
-- Name: COLUMN "protocol-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."citationID" IS 'An identifier for a Citation.';


--
-- Name: COLUMN "protocol-citation"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."protocolID" IS 'An identifier for a Protocol.';


--
-- Name: COLUMN "protocol-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- Name: COLUMN "protocol-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- Name: COLUMN "protocol-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for citationType is given.';


--
-- Name: COLUMN "protocol-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- Name: COLUMN "protocol-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- Name: COLUMN "protocol-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- Name: COLUMN "protocol-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- Name: COLUMN "protocol-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- Name: COLUMN "protocol-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for referenceType is given.';


--
-- Name: COLUMN "protocol-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- Name: COLUMN "protocol-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- Name: COLUMN "protocol-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


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

COMMENT ON TABLE public.relationship IS 'Comments or notes about a Relationship.';


--
-- Name: COLUMN relationship."relationshipID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipID" IS 'An identifier for a Relationship.';


--
-- Name: COLUMN relationship."subjectResourceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."subjectResourceID" IS 'An identifier for the resource that is the subject of a Relationship.';


--
-- Name: COLUMN relationship."subjectResourceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."subjectResourceType" IS 'The category that best matches the nature of a subject resource.';


--
-- Name: COLUMN relationship."subjectResourceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."subjectResourceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of subject resource.';


--
-- Name: COLUMN relationship."subjectResourceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."subjectResourceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for subjectResourceType is given.';


--
-- Name: COLUMN relationship."relationshipType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipType" IS 'The relationship of the subject resource (identified by subjectresourceID) to the related resource (identified by relatedResourceID).';


--
-- Name: COLUMN relationship."relationshipTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Relationship.';


--
-- Name: COLUMN relationship."relationshipTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for relationshipType is given.';


--
-- Name: COLUMN relationship."relatedResourceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relatedResourceID" IS 'An identifier for the related resource (the object) of a Relationship.';


--
-- Name: COLUMN relationship."relatedResourceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relatedResourceType" IS 'The category that best matches the nature of a related resource.';


--
-- Name: COLUMN relationship."relatedResourceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relatedResourceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of related resource.';


--
-- Name: COLUMN relationship."relatedResourceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relatedResourceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for relatedResourceType is given.';


--
-- Name: COLUMN relationship."relationshipOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipOrder" IS 'The numerical position of a Relationship in a set of Relationships that have the same combination of subjectResourceID, relatedResourceID, relationshipType, relationshipType, and relationshipTypeVocabulary.';


--
-- Name: COLUMN relationship."relationshipAccordingTo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipAccordingTo" IS 'The name of an Agent responsible for asserting a Relationship.';


--
-- Name: COLUMN relationship."relationshipAccordingToID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipAccordingToID" IS 'An identifier for an Agent responsible for asserting a Relationship.';


--
-- Name: COLUMN relationship."relationshipEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipEffectiveDate" IS 'The date on which a Relationship was established.';


--
-- Name: COLUMN relationship."relationshipRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipRemarks" IS 'Comments or notes about a Relationship.';


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

COMMENT ON TABLE public.survey IS 'Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- Name: COLUMN survey."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."surveyID" IS 'An identifier for a Survey.';


--
-- Name: COLUMN survey."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."eventID" IS 'An identifier for a dwc:Event.';


--
-- Name: COLUMN survey."siteCount"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."siteCount" IS 'Total number of individual sites surveyed during a dwc:Event.';


--
-- Name: COLUMN survey."siteNestingDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."siteNestingDescription" IS 'Textual description of a hierarchical sampling design.';


--
-- Name: COLUMN survey."verbatimSiteDescriptions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."verbatimSiteDescriptions" IS 'Original textual description of site(s).';


--
-- Name: COLUMN survey."verbatimSiteNames"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."verbatimSiteNames" IS 'A list (concatenated and separated) of original site names.';


--
-- Name: COLUMN survey."geospatialScopeAreaValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."geospatialScopeAreaValue" IS 'The numeric value for the total area of a geospatial scope of a dwc:Event.';


--
-- Name: COLUMN survey."geospatialScopeAreaUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."geospatialScopeAreaUnit" IS 'The units associated with eco:geospatialScopeAreaValue';


--
-- Name: COLUMN survey."totalAreaSampledValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."totalAreaSampledValue" IS 'The numeric value for the total area surveyed during a dwc:Event.';


--
-- Name: COLUMN survey."totalAreaSampledUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."totalAreaSampledUnit" IS 'The units associated with eco:totalAreaSampledValue';


--
-- Name: COLUMN survey."reportedWeather"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."reportedWeather" IS 'A list of weather or climatic conditions present during a dwc:Event.';


--
-- Name: COLUMN survey."reportedExtremeConditions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."reportedExtremeConditions" IS 'A description of any extreme weather or environmental conditions that may have affected a dwc:Event.';


--
-- Name: COLUMN survey."eventDurationValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."eventDurationValue" IS 'The numeric value for the duration of a dwc:Event.';


--
-- Name: COLUMN survey."eventDurationUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."eventDurationUnit" IS 'The units associated with the eco:eventDurationValue.';


--
-- Name: COLUMN survey."taxonCompletenessReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."taxonCompletenessReported" IS 'Statement about whether the taxonomic completeness of a dwc:Event was assessed.';


--
-- Name: COLUMN survey."taxonCompletenessProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."taxonCompletenessProtocols" IS 'A description of or reference (publication, URL) to the methods used to determine eco:taxonCompletenessReported.';


--
-- Name: COLUMN survey."isAbsenceReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isAbsenceReported" IS 'Taxonomic absences were reported.';


--
-- Name: COLUMN survey."absentTaxa"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."absentTaxa" IS 'A list (concatenated and separated) of taxa reported absent during a dwc:Event.';


--
-- Name: COLUMN survey."hasNonTargetTaxa"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."hasNonTargetTaxa" IS 'One or more dwc:Organisms of taxa outside the target taxonomic scope (the combination of eco:targetTaxonomicScope and eco:excludedTaxonomicScope) were detected and reported for this dwc:Event.';


--
-- Name: COLUMN survey."nonTargetTaxa"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."nonTargetTaxa" IS 'A list (concatenated and separated) of taxa reported during a dwc:Event that are outside of the target taxonomic scope (the combination of eco:targetTaxonomicScope and eco:excludedTaxonomicScope).';


--
-- Name: COLUMN survey."areNonTargetTaxaFullyReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."areNonTargetTaxaFullyReported" IS 'Every dwc:Organism that was outside of the target taxonomic scope (the combination of eco:targetTaxonomicScope and eco:excludedTaxonomicScope) and detected during a dwc:Event, and that was detectable using the given protocol (given in eco:protocolDescriptions and dwc:samplingProtocol), was reported.';


--
-- Name: COLUMN survey."hasNonTargetOrganisms"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."hasNonTargetOrganisms" IS 'One or more dwc:Organisms outside the target organismal scopes (eco:targetDegreeOfEstablishmentScope, eco:targetGrowthFormScope, and eco:targetLifeStageScope) were detected and reported for this dwc:Event.';


--
-- Name: COLUMN survey."verbatimTargetScope"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."verbatimTargetScope" IS 'The verbatim original description of a dwc:Event scope.';


--
-- Name: COLUMN survey."identifiedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."identifiedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN survey."identifiedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."identifiedByID" IS 'The identifier for the Agent who made a taxonomic determination of a dwc:Organism.';


--
-- Name: COLUMN survey."identificationReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."identificationReferences" IS 'A list (concatenated and separated) of references (publication, global unique identifier, URI) used in a dwc:Identification.';


--
-- Name: COLUMN survey."compilationTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."compilationTypes" IS 'A statement specifying whether data reported are derived from sampling events, ancillary data compiled from other sources, or a combination of both.';


--
-- Name: COLUMN survey."compilationSourceTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."compilationSourceTypes" IS 'The types of data sources contributing to the compilation reported.';


--
-- Name: COLUMN survey."inventoryTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."inventoryTypes" IS 'The types of search processes used to conduct the inventory.';


--
-- Name: COLUMN survey."protocolNames"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."protocolNames" IS 'Categorical descriptive names for the methods used during a dwc:Event.';


--
-- Name: COLUMN survey."protocolDescriptions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."protocolDescriptions" IS 'A detailed description of the methods used during a dwc:Event.';


--
-- Name: COLUMN survey."protocolReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."protocolReferences" IS 'The references to the methods used during a dwc:Event.';


--
-- Name: COLUMN survey."isAbundanceReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isAbundanceReported" IS 'The number of dwc:Organisms collected or observed was reported.';


--
-- Name: COLUMN survey."isAbundanceCapReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isAbundanceCapReported" IS 'A maximum number of dwc:Organisms was reported, as specified or restricted by the protocol used.';


--
-- Name: COLUMN survey."abundanceCap"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."abundanceCap" IS 'The reported maximum number of dwc:Organisms.';


--
-- Name: COLUMN survey."isVegetationCoverReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isVegetationCoverReported" IS 'A vegetation cover metric was reported.';


--
-- Name: COLUMN survey."isLeastSpecificTargetCategoryQuantityInclusive"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isLeastSpecificTargetCategoryQuantityInclusive" IS 'The total detected quantity for a dwc:Taxon (including subcategories thereof) in a dwc:Event is given explicitly in a single record (dwc:organismQuantity value) for that dwc:Taxon.';


--
-- Name: COLUMN survey."hasVouchers"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."hasVouchers" IS 'Specimen vouchers were collected during a dwc:Event.';


--
-- Name: COLUMN survey."voucherInstitutions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."voucherInstitutions" IS 'A list (concatenated and separated) of the names or acronyms of the institutions where vouchers collected during a dwc:Event were deposited.';


--
-- Name: COLUMN survey."hasMaterialSamples"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."hasMaterialSamples" IS 'Material samples were collected during a dwc:Event.';


--
-- Name: COLUMN survey."materialSampleTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."materialSampleTypes" IS 'A list (concatenated and separated) of material sample types collected during a dwc:Event.';


--
-- Name: COLUMN survey."samplingPerformedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingPerformedBy" IS 'A person, group, or organization that performed the sampling.';


--
-- Name: COLUMN survey."samplingPerformedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingPerformedByID" IS 'The identifier for the Agent who performed the sampling.';


--
-- Name: COLUMN survey."isSamplingEffortReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isSamplingEffortReported" IS 'The sampling effort associated with a dwc:Event was reported.';


--
-- Name: COLUMN survey."samplingEffortProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingEffortProtocol" IS 'A description of or reference (publication or URL) to the methods used to determine the sampling effort.';


--
-- Name: COLUMN survey."samplingEffortProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingEffortProtocolID" IS 'An identifier for a Protocol used to determine sampling effort.';


--
-- Name: COLUMN survey."samplingEffortValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingEffortValue" IS 'The numeric value for the sampling effort expended during a dwc:Event.';


--
-- Name: COLUMN survey."samplingEffortUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingEffortUnit" IS 'The units associated with the eco:samplingEffortValue.';


--
-- Name: COLUMN survey."informationWithheld"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."informationWithheld" IS 'Additional information that exists, but that has not been shared in the given record.';


--
-- Name: COLUMN survey."dataGeneralizations"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."dataGeneralizations" IS 'Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


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

COMMENT ON TABLE public."survey-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- Name: COLUMN "survey-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- Name: COLUMN "survey-agent-role"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."surveyID" IS 'An identifier for a Survey.';


--
-- Name: COLUMN "survey-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- Name: COLUMN "survey-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- Name: COLUMN "survey-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- Name: COLUMN "survey-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- Name: COLUMN "survey-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


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
    "assertionProtocol" text,
    "assertionProtocolID" text,
    "assertionCitation" text,
    "assertionRemarks" text
);


ALTER TABLE public."survey-assertion" OWNER TO postgres;

--
-- Name: TABLE "survey-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-assertion" IS 'Comments or notes about an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- Name: COLUMN "survey-assertion"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."surveyID" IS 'An identifier for a Survey.';


--
-- Name: COLUMN "survey-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- Name: COLUMN "survey-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- Name: COLUMN "survey-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- Name: COLUMN "survey-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- Name: COLUMN "survey-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- Name: COLUMN "survey-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- Name: COLUMN "survey-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "survey-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionUnitIRI" IS 'The IRI for the units associated with the value in assertionValueNumeric.';


--
-- Name: COLUMN "survey-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- Name: COLUMN "survey-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- Name: COLUMN "survey-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- Name: survey-citation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."survey-citation" (
    "citationID" text NOT NULL,
    "surveyID" text NOT NULL,
    "citationType" text,
    "citationTypeIRI" text,
    "citationTypeVocabulary" text,
    "bibliographicCitation" text,
    "pageNumber" text,
    "referenceID" text,
    "referenceType" text,
    "referenceTypeIRI" text,
    "referenceTypeVocabulary" text,
    "referenceYear" integer,
    "isPeerReviewed" boolean,
    "citationRemarks" text
);


ALTER TABLE public."survey-citation" OWNER TO postgres;

--
-- Name: TABLE "survey-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-citation" IS 'Comments or notes about a Citation.';


--
-- Name: COLUMN "survey-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."citationID" IS 'An identifier for a Citation.';


--
-- Name: COLUMN "survey-citation"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."surveyID" IS 'An identifier for a Survey.';


--
-- Name: COLUMN "survey-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- Name: COLUMN "survey-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- Name: COLUMN "survey-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for citationType is given.';


--
-- Name: COLUMN "survey-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- Name: COLUMN "survey-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- Name: COLUMN "survey-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- Name: COLUMN "survey-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- Name: COLUMN "survey-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- Name: COLUMN "survey-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for referenceType is given.';


--
-- Name: COLUMN "survey-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- Name: COLUMN "survey-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- Name: COLUMN "survey-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


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

COMMENT ON TABLE public."survey-identifier" IS 'A language in which an Identifier is presented.';


--
-- Name: COLUMN "survey-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- Name: COLUMN "survey-identifier"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."surveyID" IS 'An identifier for a Survey.';


--
-- Name: COLUMN "survey-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- Name: COLUMN "survey-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- Name: COLUMN "survey-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for identifierType is given.';


--
-- Name: COLUMN "survey-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


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

COMMENT ON TABLE public."survey-protocol" IS 'An identifier for a Survey.';


--
-- Name: COLUMN "survey-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- Name: COLUMN "survey-protocol"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-protocol"."surveyID" IS 'An identifier for a Survey.';


--
-- Name: survey-target; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."survey-target" (
    "surveyTargetID" text NOT NULL,
    "surveyID" text NOT NULL,
    "surveyTargetType" text,
    "surveyTargetTypeIRI" text,
    "surveyTargetTypeVocabulary" text,
    "surveyTargetValue" text,
    "surveyTargetValueIRI" text,
    "surveyTargetValueVocabulary" text,
    "surveyTargetUnit" text,
    "surveyTargetUnitIRI" text,
    "surveyTargetUnitVocabulary" text,
    "includeOrExclude" text NOT NULL,
    "isSurveyTargetFullyReported" boolean NOT NULL
);


ALTER TABLE public."survey-target" OWNER TO postgres;

--
-- Name: TABLE "survey-target"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-target" IS 'A declaration of whether the counts for an instance of the SurveyTarget report everything that matches the declared SurveyTarget. If they do, this enables inference of absence of detection for everything in that SurveyTarget that is included but that does not appear in the count.';


--
-- Name: COLUMN "survey-target"."surveyTargetID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetID" IS 'An identifier for a SurveyTarget.';


--
-- Name: COLUMN "survey-target"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyID" IS 'An identifier for a dwc:Event that is an biotic survey.';


--
-- Name: COLUMN "survey-target"."surveyTargetType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetType" IS 'The type of scope a SurveyTarget describes.';


--
-- Name: COLUMN "survey-target"."surveyTargetTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of survey target.';


--
-- Name: COLUMN "survey-target"."surveyTargetTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for surveyTargetType is given.';


--
-- Name: COLUMN "survey-target"."surveyTargetValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetValue" IS 'The value of a characteristic sought for the surveyTarget for a given surveyTargetType.';


--
-- Name: COLUMN "survey-target"."surveyTargetValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetValueIRI" IS 'The IRI of the controlled vocabulary value for the type of survey target value.';


--
-- Name: COLUMN "survey-target"."surveyTargetValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for surveyTargetValue is given.';


--
-- Name: COLUMN "survey-target"."surveyTargetUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetUnit" IS 'The units associated with the surveyTargetValue.';


--
-- Name: COLUMN "survey-target"."surveyTargetUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetUnitIRI" IS 'The IRI of the controlled vocabulary value for the type of survey target unit.';


--
-- Name: COLUMN "survey-target"."surveyTargetUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetUnitVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for surveyTargetUnit is given.';


--
-- Name: COLUMN "survey-target"."includeOrExclude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."includeOrExclude" IS 'A term to declare whether an instance of the SurveyTarget is an included scope or an excluded scope. Combinations of SurveyTarget records of inclusions and exclusions can define complex scopes such as all flying adult Aves except Passeriformes.';


--
-- Name: COLUMN "survey-target"."isSurveyTargetFullyReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."isSurveyTargetFullyReported" IS 'A declaration of whether the counts for an instance of the SurveyTarget report everything that matches the declared SurveyTarget. If they do, this enables inference of absence of detection for everything in that SurveyTarget that is included but that does not appear in the count.';


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

COPY public."chronometric-age-assertion" ("assertionID", "chronometricAgeID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: chronometric-age-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."chronometric-age-citation" ("citationID", "chronometricAgeID", "citationType", "citationTypeIRI", "citationTypeVocabulary", "bibliographicCitation", "pageNumber", "referenceID", "referenceType", "referenceTypeIRI", "referenceTypeVocabulary", "referenceYear", "isPeerReviewed", "citationRemarks") FROM stdin;
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

COPY public."collection-assertion" ("assertionID", "collectionID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: collection-media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."collection-media" ("mediaID", "collectionID", "mediaSubjectCategory", "mediaSubjectCategoryIRI", "mediaSubjectCategoryVocabulary") FROM stdin;
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event ("eventID", "parentEventID", "preferredEventName", "eventType", "datasetName", "datasetID", "fieldNumber", "eventConductedBy", "eventConductedByID", "eventDate", "eventTime", "startDayOfYear", "endDayOfYear", year, month, day, "verbatimEventDate", "verbatimLocality", "verbatimElevation", "verbatimDepth", "verbatimCoordinates", "verbatimLatitude", "verbatimLongitude", "verbatimCoordinateSystem", "verbatimSRS", "georeferenceVerificationStatus", habitat, "sampleSizeValue", "sampleSizeUnit", "eventEffort", "fieldNotes", "eventCitation", "eventRemarks", "locationID", "higherGeographyID", "higherGeography", continent, "waterBody", "islandGroup", island, country, "countryCode", "stateProvince", county, municipality, locality, "minimumElevationInMeters", "maximumElevationInMeters", "verticalDatum", "minimumDepthInMeters", "maximumDepthInMeters", "minimumDistanceAboveSurfaceInMeters", "maximumDistanceAboveSurfaceInMeters", "locationRemarks", "decimalLatitude", "decimalLongitude", "geodeticDatum", "coordinateUncertaintyInMeters", "coordinatePrecision", "pointRadiusSpatialFit", "footprintWKT", "footprintSRS", "footprintSpatialFit", "georeferencedBy", "georeferencedByID", "georeferencedDate", "georeferenceProtocol", "georeferenceProtocolID", "georeferenceSources", "georeferenceRemarks", "informationWithheld", "dataGeneralizations", "preferredSpatialRepresentation") FROM stdin;
\.


--
-- Data for Name: event-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."event-agent-role" ("agentID", "eventID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: event-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."event-assertion" ("assertionID", "eventID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: event-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."event-citation" ("citationID", "eventID", "citationType", "citationTypeIRI", "citationTypeVocabulary", "bibliographicCitation", "pageNumber", "referenceID", "referenceType", "referenceTypeIRI", "referenceTypeVocabulary", "referenceYear", "isPeerReviewed", "citationRemarks") FROM stdin;
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
-- Data for Name: genetic-analysis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."genetic-analysis" ("geneticAnalysisID", "eventID", "geneticProtocolID", "geneticSequenceID", "materialEntityID", "readCount", "totalReadCount") FROM stdin;
\.


--
-- Data for Name: genetic-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."genetic-protocol" ("geneticProtocolID", samp_name, project_name, experimental_factor, samp_taxon_id, neg_cont_type, pos_cont_type, env_broad_scale, env_local_scale, env_medium, subspecf_gen_lin, ploidy, num_replicons, extrachrom_elements, estimated_size, ref_biomaterial, source_mat_id, pathogenicity, biotic_relationship, specific_host, host_spec_range, host_disease_stat, trophic_level, propagation, encoded_traits, rel_to_oxygen, isol_growth_condt, samp_collec_device, samp_collec_method, samp_mat_process, size_frac, samp_size, samp_vol_we_dna_ext, source_uvig, virus_enrich_appr, nucl_acid_ext, nucl_acid_amp, lib_size, lib_reads_seqd, lib_layout, lib_vector, lib_screen, target_gene, target_subfragment, pcr_primers, mid, adapters, pcr_cond, seq_meth, seq_quality_check, chimera_check, tax_ident, assembly_qual, assembly_name, assembly_software, annot, number_contig, feat_pred, ref_db, sim_search_meth, tax_class, _16s_recover, _16s_recover_software, trnas, trna_ext_software, compl_score, compl_software, compl_appr, contam_score, contam_screen_input, contam_screen_param, decontam_software, sort_tech, single_cell_lysis_appr, single_cell_lysis_prot, wga_amp_appr, wga_amp_kit, bin_param, bin_software, reassembly_bin, mag_cov_software, vir_ident_software, pred_genome_type, pred_genome_struc, detec_type, otu_class_appr, otu_seq_comp_appr, otu_db, host_pred_appr, host_pred_est_acc, url, sop, pcr_primer_forward, pcr_primer_reverse, pcr_primer_name_forward, pcr_primer_name_reverse, pcr_primer_reference, "DNA_sequence", concentration, "concentrationUnit", "methodDeterminationConcentrationAndRatios", "ratioOfAbsorbance260_230", "ratioOfAbsorbance260_280", "annealingTemp", "annealingTempUnit", "probeReporter", "probeQuencher", "ampliconSize", "thresholdQuantificationCycle", "baselineValue", "quantificationCycle", "automaticThresholdQuantificationCycle", "automaticBaselineValue", "contaminationAssessment", "partitionVolume", "partitionVolumeUnit", "estimatedNumberOfCopies", "amplificationReactionVolume", "amplificationReactionVolumeUnit", pcr_analysis_software, "experimentalVariance", pcr_primer_lod, pcr_primer_loq) FROM stdin;
\.


--
-- Data for Name: genetic-sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."genetic-sequence" ("geneticSequenceID", "geneticSequence", "geneticSequenceRemarks") FROM stdin;
\.


--
-- Data for Name: genetic-sequence-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."genetic-sequence-agent-role" ("agentID", "geneticSequenceID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: genetic-sequence-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."genetic-sequence-assertion" ("assertionID", "geneticSequenceID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: genetic-sequence-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."genetic-sequence-citation" ("citationID", "geneticSequenceID", "citationType", "citationTypeIRI", "citationTypeVocabulary", "bibliographicCitation", "pageNumber", "referenceID", "referenceType", "referenceTypeIRI", "referenceTypeVocabulary", "referenceYear", "isPeerReviewed", "citationRemarks") FROM stdin;
\.


--
-- Data for Name: genetic-sequence-media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."genetic-sequence-media" ("mediaID", "geneticSequenceID", "mediaSubjectCategory", "mediaSubjectCategoryIRI", "mediaSubjectCategoryVocabulary") FROM stdin;
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

COPY public.identification ("identificationID", "basedOnOccurrenceID", "basedOnMaterialEntityID", "basedOnNucleotideSequenceID", "basedOnNucleotideAnalysisID", "basedOnMediaID", "identificationType", "verbatimIdentification", "isAcceptedIdentification", "taxonFormula", "typeStatus", "typeDesignationType", "identifiedBy", "identifiedByID", "dateIdentified", "identificationReferences", "taxonAssignmentMethod", "identificationVerificationStatus", "identificationRemarks", "taxonID", kingdom, "scientificName", "taxonRank", "taxonRemarks") FROM stdin;
\.


--
-- Data for Name: identification-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."identification-agent-role" ("agentID", "identificationID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: identification-taxon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."identification-taxon" ("identificationID", "taxonID", "taxonOrder", kingdom, "scientificName", "taxonRank", "taxonRemarks") FROM stdin;
\.


--
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.material ("materialEntityID", "eventID", "materialCategory", "materialEntityType", "institutionCode", "institutionID", "ownerInstitutionCode", "ownerInstitutionID", "collectionCode", "collectionID", "catalogNumber", "otherCatalogNumbers", "collectedBy", "collectedByID", "objectCount", "recordNumber", preparations, disposition, "verbatimLabel", "associatedSequences", "materialCitation", "informationWithheld", "dataGeneralizations", "materialEntityRemarks", "evidenceForOccurrenceID", "derivedFromMaterialEntityID", "derivationEventID", "derivationType", "partOfMaterialEntityID", "verbatimIdentification", "taxonFormula", "identifiedBy", "identifiedByID", "dateIdentified", "identificationReferences", "identificationVerificationStatus", "identificationRemarks", "taxonID", kingdom, "scientificName", "taxonRank", "taxonRemarks") FROM stdin;
\.


--
-- Data for Name: material-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."material-agent-role" ("agentID", "materialEntityID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: material-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."material-assertion" ("assertionID", "materialEntityID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: material-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."material-citation" ("citationID", "materialEntityID", "citationType", "citationTypeIRI", "citationTypeVocabulary", "bibliographicCitation", "pageNumber", "referenceID", "referenceType", "referenceTypeIRI", "referenceTypeVocabulary", "referenceYear", "isPeerReviewed", "citationRemarks") FROM stdin;
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

COPY public."media-assertion" ("assertionID", "mediaID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: media-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."media-identifier" (identifier, "mediaID", "identifierType", "identifierTypeIRI", "identifierTypeVocabulary", "identifierLanguage") FROM stdin;
\.


--
-- Data for Name: molecular-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."molecular-protocol" ("molecularProtocolID", "assayType", samp_name, project_name, experimental_factor, samp_taxon_id, neg_cont_type, pos_cont_type, env_broad_scale, env_local_scale, env_medium, subspecf_gen_lin, ploidy, num_replicons, extrachrom_elements, estimated_size, ref_biomaterial, source_mat_id, pathogenicity, biotic_relationship, specific_host, host_spec_range, host_disease_stat, trophic_level, propagation, encoded_traits, rel_to_oxygen, isol_growth_condt, samp_collec_device, samp_collec_method, samp_mat_process, size_frac, samp_size, samp_vol_we_dna_ext, source_uvig, virus_enrich_appr, nucl_acid_ext, nucl_acid_amp, lib_size, lib_reads_seqd, lib_layout, lib_vector, lib_screen, target_gene, target_subfragment, pcr_primers, mid, adapters, pcr_cond, seq_meth, seq_quality_check, chimera_check, tax_ident, assembly_qual, assembly_name, assembly_software, annot, number_contig, feat_pred, ref_db, sim_search_meth, tax_class, _16s_recover, _16s_recover_software, trnas, trna_ext_software, compl_score, compl_software, compl_appr, contam_score, contam_screen_input, contam_screen_param, decontam_software, sort_tech, single_cell_lysis_appr, single_cell_lysis_prot, wga_amp_appr, wga_amp_kit, bin_param, bin_software, reassembly_bin, mag_cov_software, vir_ident_software, pred_genome_type, pred_genome_struc, detec_type, otu_class_appr, otu_seq_comp_appr, otu_db, host_pred_appr, host_pred_est_acc, url, sop, pcr_primer_forward, pcr_primer_reverse, pcr_primer_name_forward, pcr_primer_name_reverse, pcr_primer_reference, "DNA_sequence", concentration, "concentrationUnit", "methodDeterminationConcentrationAndRatios", "ratioOfAbsorbance260_230", "ratioOfAbsorbance260_280", "annealingTemp", "annealingTempUnit", "probeReporter", "probeQuencher", "ampliconSize", "thresholdQuantificationCycle", "baselineValue", "quantificationCycle", "automaticThresholdQuantificationCycle", "automaticBaselineValue", "contaminationAssessment", "partitionVolume", "partitionVolumeUnit", "estimatedNumberOfCopies", "amplificationReactionVolume", "amplificationReactionVolumeUnit", pcr_analysis_software, "experimentalVariance", pcr_primer_lod, pcr_primer_loq) FROM stdin;
\.


--
-- Data for Name: molecular-protocol-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."molecular-protocol-agent-role" ("agentID", "molecularProtocolID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: molecular-protocol-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."molecular-protocol-assertion" ("assertionID", "molecularProtocolID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: molecular-protocol-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."molecular-protocol-citation" ("citationID", "molecularProtocolID", "citationType", "citationTypeIRI", "citationTypeVocabulary", "bibliographicCitation", "pageNumber", "referenceID", "referenceType", "referenceTypeIRI", "referenceTypeVocabulary", "referenceYear", "isPeerReviewed", "citationRemarks") FROM stdin;
\.


--
-- Data for Name: nucleotide-analysis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."nucleotide-analysis" ("nucleotideAnalysisID", "eventID", "molecularProtocolID", "nucleotideSequenceID", "materialEntityID", "readCount", "totalReadCount") FROM stdin;
\.


--
-- Data for Name: nucleotide-analysis-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."nucleotide-analysis-assertion" ("assertionID", "nucleotideAnalysisID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: nucleotide-sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."nucleotide-sequence" ("nucleotideSequenceID", "nucleotideSequence", "nucleotideSequenceRemarks") FROM stdin;
\.


--
-- Data for Name: occurrence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.occurrence ("occurrenceID", "eventID", "surveyTargetID", "recordedBy", "recordedByID", "organismQuantity", "organismQuantityType", sex, "lifeStage", "reproductiveCondition", caste, behavior, vitality, "establishmentMeans", "degreeOfEstablishment", pathway, "occurrenceStatus", "occurrenceCitation", "informationWithheld", "dataGeneralizations", "occurrenceRemarks", "organismID", "organismScope", "organismName", "organismRemarks", "verbatimIdentification", "taxonFormula", "identifiedBy", "identifiedByID", "dateIdentified", "identificationReferences", "identificationVerificationStatus", "identificationRemarks", "taxonID", kingdom, "scientificName", "taxonRank", "taxonRemarks") FROM stdin;
\.


--
-- Data for Name: occurrence-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."occurrence-agent-role" ("agentID", "occurrenceID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: occurrence-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."occurrence-assertion" ("assertionID", "occurrenceID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: occurrence-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."occurrence-citation" ("citationID", "occurrenceID", "citationType", "citationTypeIRI", "citationTypeVocabulary", "bibliographicCitation", "pageNumber", "referenceID", "referenceType", "referenceTypeIRI", "referenceTypeVocabulary", "referenceYear", "isPeerReviewed", "citationRemarks") FROM stdin;
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

COPY public."organism-interaction-assertion" ("assertionID", "organismInteractionID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: organism-interaction-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."organism-interaction-citation" ("citationID", "organismInteractionID", "citationType", "citationTypeIRI", "citationTypeVocabulary", "bibliographicCitation", "pageNumber", "referenceID", "referenceType", "referenceTypeIRI", "referenceTypeVocabulary", "referenceYear", "isPeerReviewed", "citationRemarks") FROM stdin;
\.


--
-- Data for Name: organism-interaction-media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."organism-interaction-media" ("mediaID", "organismInteractionID", "mediaSubjectCategory", "mediaSubjectCategoryIRI", "mediaSubjectCategoryVocabulary") FROM stdin;
\.


--
-- Data for Name: phylogenetic-tree; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree" ("phylogeneticTreeID", "phylogeneticTreeProtocol", "phylogeneticTreeProtocolID", "phylogeneticTreeCitation") FROM stdin;
\.


--
-- Data for Name: phylogenetic-tree-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree-assertion" ("assertionID", "phylogeneticTreeID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: phylogenetic-tree-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree-citation" ("citationID", "phylogeneticTreeID", "citationType", "citationTypeIRI", "citationTypeVocabulary", "bibliographicCitation", "pageNumber", "referenceID", "referenceType", "referenceTypeIRI", "referenceTypeVocabulary", "referenceYear", "isPeerReviewed", "citationRemarks") FROM stdin;
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
-- Data for Name: phylogenetic-tree-tip; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree-tip" ("phylogeneticTreeTipID", "phylogeneticTreeID", "phylogeneticTreeTipLabel", "taxonID", "scientificName", "materialEntityID", "geneticSequenceID") FROM stdin;
\.


--
-- Data for Name: phylogenetic-tree-tip-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."phylogenetic-tree-tip-assertion" ("assertionID", "phylogeneticTreeTipID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol ("protocolID", "protocolType", "protocolTypeIRI", "protocolTypeVocabulary", "protocolName", "protocolDescription", "protocolCitation", "protocolRemarks") FROM stdin;
\.


--
-- Data for Name: protocol-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."protocol-citation" ("citationID", "protocolID", "citationType", "citationTypeIRI", "citationTypeVocabulary", "bibliographicCitation", "pageNumber", "referenceID", "referenceType", "referenceTypeIRI", "referenceTypeVocabulary", "referenceYear", "isPeerReviewed", "citationRemarks") FROM stdin;
\.


--
-- Data for Name: relationship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.relationship ("relationshipID", "subjectResourceID", "subjectResourceType", "subjectResourceTypeIRI", "subjectResourceTypeVocabulary", "relationshipType", "relationshipTypeIRI", "relationshipTypeVocabulary", "relatedResourceID", "relatedResourceType", "relatedResourceTypeIRI", "relatedResourceTypeVocabulary", "relationshipOrder", "relationshipAccordingTo", "relationshipAccordingToID", "relationshipEffectiveDate", "relationshipRemarks") FROM stdin;
\.


--
-- Data for Name: survey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.survey ("surveyID", "eventID", "siteCount", "siteNestingDescription", "verbatimSiteDescriptions", "verbatimSiteNames", "geospatialScopeAreaValue", "geospatialScopeAreaUnit", "totalAreaSampledValue", "totalAreaSampledUnit", "reportedWeather", "reportedExtremeConditions", "eventDurationValue", "eventDurationUnit", "taxonCompletenessReported", "taxonCompletenessProtocols", "isAbsenceReported", "absentTaxa", "hasNonTargetTaxa", "nonTargetTaxa", "areNonTargetTaxaFullyReported", "hasNonTargetOrganisms", "verbatimTargetScope", "identifiedBy", "identifiedByID", "identificationReferences", "compilationTypes", "compilationSourceTypes", "inventoryTypes", "protocolNames", "protocolDescriptions", "protocolReferences", "isAbundanceReported", "isAbundanceCapReported", "abundanceCap", "isVegetationCoverReported", "isLeastSpecificTargetCategoryQuantityInclusive", "hasVouchers", "voucherInstitutions", "hasMaterialSamples", "materialSampleTypes", "samplingPerformedBy", "samplingPerformedByID", "isSamplingEffortReported", "samplingEffortProtocol", "samplingEffortProtocolID", "samplingEffortValue", "samplingEffortUnit", "informationWithheld", "dataGeneralizations") FROM stdin;
\.


--
-- Data for Name: survey-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."survey-agent-role" ("agentID", "surveyID", "agentRole", "agentRoleIRI", "agentRoleVocabulary", "agentRoleOrder", "agentRoleDate") FROM stdin;
\.


--
-- Data for Name: survey-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."survey-assertion" ("assertionID", "surveyID", "assertionType", "assertionTypeIRI", "assertionTypeVocabulary", "assertionMadeDate", "assertionEffectiveDate", "assertionValue", "assertionValueIRI", "assertionValueVocabulary", "assertionValueNumeric", "assertionUnit", "assertionUnitIRI", "assertionUnitVocabulary", "assertionBy", "assertionByID", "assertionProtocol", "assertionProtocolID", "assertionCitation", "assertionRemarks") FROM stdin;
\.


--
-- Data for Name: survey-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."survey-citation" ("citationID", "surveyID", "citationType", "citationTypeIRI", "citationTypeVocabulary", "bibliographicCitation", "pageNumber", "referenceID", "referenceType", "referenceTypeIRI", "referenceTypeVocabulary", "referenceYear", "isPeerReviewed", "citationRemarks") FROM stdin;
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
-- Data for Name: survey-target; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."survey-target" ("surveyTargetID", "surveyID", "surveyTargetType", "surveyTargetTypeIRI", "surveyTargetTypeVocabulary", "surveyTargetValue", "surveyTargetValueIRI", "surveyTargetValueVocabulary", "surveyTargetUnit", "surveyTargetUnitIRI", "surveyTargetUnitVocabulary", "includeOrExclude", "isSurveyTargetFullyReported") FROM stdin;
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
-- Name: chronometric-age-citation chronometric-age-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-citation"
    ADD CONSTRAINT "chronometric-age-citation_pkey" PRIMARY KEY ("citationID");


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
-- Name: event-citation event-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-citation"
    ADD CONSTRAINT "event-citation_pkey" PRIMARY KEY ("citationID");


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY ("eventID");


--
-- Name: genetic-analysis genetic-analysis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-analysis"
    ADD CONSTRAINT "genetic-analysis_pkey" PRIMARY KEY ("geneticAnalysisID");


--
-- Name: genetic-protocol genetic-protocol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-protocol"
    ADD CONSTRAINT "genetic-protocol_pkey" PRIMARY KEY ("geneticProtocolID");


--
-- Name: genetic-sequence-assertion genetic-sequence-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-assertion"
    ADD CONSTRAINT "genetic-sequence-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: genetic-sequence-citation genetic-sequence-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-citation"
    ADD CONSTRAINT "genetic-sequence-citation_pkey" PRIMARY KEY ("citationID");


--
-- Name: genetic-sequence genetic-sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence"
    ADD CONSTRAINT "genetic-sequence_pkey" PRIMARY KEY ("geneticSequenceID");


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
-- Name: material-citation material-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-citation"
    ADD CONSTRAINT "material-citation_pkey" PRIMARY KEY ("citationID");


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
-- Name: molecular-protocol-citation molecular-protocol-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."molecular-protocol-citation"
    ADD CONSTRAINT "molecular-protocol-citation_pkey" PRIMARY KEY ("citationID");


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
-- Name: occurrence-citation occurrence-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-citation"
    ADD CONSTRAINT "occurrence-citation_pkey" PRIMARY KEY ("citationID");


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
-- Name: organism-interaction-citation organism-interaction-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-citation"
    ADD CONSTRAINT "organism-interaction-citation_pkey" PRIMARY KEY ("citationID");


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
-- Name: phylogenetic-tree-citation phylogenetic-tree-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-citation"
    ADD CONSTRAINT "phylogenetic-tree-citation_pkey" PRIMARY KEY ("citationID");


--
-- Name: phylogenetic-tree-tip-assertion phylogenetic-tree-tip-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip-assertion"
    ADD CONSTRAINT "phylogenetic-tree-tip-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- Name: phylogenetic-tree-tip phylogenetic-tree-tip_geneticSequenceID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip"
    ADD CONSTRAINT "phylogenetic-tree-tip_geneticSequenceID_key" UNIQUE ("geneticSequenceID");


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
-- Name: protocol-citation protocol-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."protocol-citation"
    ADD CONSTRAINT "protocol-citation_pkey" PRIMARY KEY ("citationID");


--
-- Name: protocol protocol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol
    ADD CONSTRAINT protocol_pkey PRIMARY KEY ("protocolID");


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
-- Name: survey-citation survey-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-citation"
    ADD CONSTRAINT "survey-citation_pkey" PRIMARY KEY ("citationID");


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
-- Name: chronometric-age-citation chronometric-age-citation_chronometricAgeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-citation"
    ADD CONSTRAINT "chronometric-age-citation_chronometricAgeID_fkey" FOREIGN KEY ("chronometricAgeID") REFERENCES public."chronometric-age"("chronometricAgeID");


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
-- Name: event-citation event-citation_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-citation"
    ADD CONSTRAINT "event-citation_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


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
-- Name: genetic-analysis genetic-analysis_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-analysis"
    ADD CONSTRAINT "genetic-analysis_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: genetic-analysis genetic-analysis_geneticProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-analysis"
    ADD CONSTRAINT "genetic-analysis_geneticProtocolID_fkey" FOREIGN KEY ("geneticProtocolID") REFERENCES public."genetic-protocol"("geneticProtocolID");


--
-- Name: genetic-analysis genetic-analysis_geneticSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-analysis"
    ADD CONSTRAINT "genetic-analysis_geneticSequenceID_fkey" FOREIGN KEY ("geneticSequenceID") REFERENCES public."genetic-sequence"("geneticSequenceID");


--
-- Name: genetic-analysis genetic-analysis_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-analysis"
    ADD CONSTRAINT "genetic-analysis_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- Name: genetic-sequence-agent-role genetic-sequence-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-agent-role"
    ADD CONSTRAINT "genetic-sequence-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- Name: genetic-sequence-agent-role genetic-sequence-agent-role_geneticSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-agent-role"
    ADD CONSTRAINT "genetic-sequence-agent-role_geneticSequenceID_fkey" FOREIGN KEY ("geneticSequenceID") REFERENCES public."genetic-sequence"("geneticSequenceID");


--
-- Name: genetic-sequence-assertion genetic-sequence-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-assertion"
    ADD CONSTRAINT "genetic-sequence-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- Name: genetic-sequence-assertion genetic-sequence-assertion_geneticSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-assertion"
    ADD CONSTRAINT "genetic-sequence-assertion_geneticSequenceID_fkey" FOREIGN KEY ("geneticSequenceID") REFERENCES public."genetic-sequence"("geneticSequenceID");


--
-- Name: genetic-sequence-citation genetic-sequence-citation_geneticSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-citation"
    ADD CONSTRAINT "genetic-sequence-citation_geneticSequenceID_fkey" FOREIGN KEY ("geneticSequenceID") REFERENCES public."genetic-sequence"("geneticSequenceID");


--
-- Name: genetic-sequence-media genetic-sequence-media_geneticSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-media"
    ADD CONSTRAINT "genetic-sequence-media_geneticSequenceID_fkey" FOREIGN KEY ("geneticSequenceID") REFERENCES public."genetic-sequence"("geneticSequenceID");


--
-- Name: genetic-sequence-media genetic-sequence-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-media"
    ADD CONSTRAINT "genetic-sequence-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


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
-- Name: material-citation material-citation_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-citation"
    ADD CONSTRAINT "material-citation_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


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
-- Name: material material_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT "material_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- Name: material material_partOfMaterialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT "material_partOfMaterialEntityID_fkey" FOREIGN KEY ("partOfMaterialEntityID") REFERENCES public.material("materialEntityID");


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
-- Name: molecular-protocol-citation molecular-protocol-citation_molecularProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."molecular-protocol-citation"
    ADD CONSTRAINT "molecular-protocol-citation_molecularProtocolID_fkey" FOREIGN KEY ("molecularProtocolID") REFERENCES public."molecular-protocol"("molecularProtocolID");


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
-- Name: occurrence-citation occurrence-citation_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-citation"
    ADD CONSTRAINT "occurrence-citation_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


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
-- Name: organism-interaction-citation organism-interaction-citation_organismInteractionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-citation"
    ADD CONSTRAINT "organism-interaction-citation_organismInteractionID_fkey" FOREIGN KEY ("organismInteractionID") REFERENCES public."organism-interaction"("organismInteractionID");


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
-- Name: phylogenetic-tree-citation phylogenetic-tree-citation_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-citation"
    ADD CONSTRAINT "phylogenetic-tree-citation_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


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
-- Name: protocol-citation protocol-citation_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."protocol-citation"
    ADD CONSTRAINT "protocol-citation_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


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
-- Name: survey-citation survey-citation_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-citation"
    ADD CONSTRAINT "survey-citation_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


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

