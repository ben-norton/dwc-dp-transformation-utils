--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 17.0

-- Started on 2025-03-26 14:23:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE dwc_dp;
--
-- TOC entry 5431 (class 1262 OID 173086)
-- Name: dwc_dp; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dwc_dp WITH TEMPLATE = template0 ENCODING = 'UTF8'


ALTER DATABASE dwc_dp OWNER TO postgres;

\connect dwc_dp

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5432 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 176400)
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
-- TOC entry 5433 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE agent; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.agent IS 'The name of an Agent preferred in searches and results.';


--
-- TOC entry 5434 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN agent."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 5435 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN agent."agentType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."agentType" IS 'The category that best matches the type of an Agent.';


--
-- TOC entry 5436 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN agent."agentTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."agentTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Agent.';


--
-- TOC entry 5437 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN agent."agentTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."agentTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in agentType is given.';


--
-- TOC entry 5438 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN agent."preferredAgentName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.agent."preferredAgentName" IS 'The name of an Agent preferred in searches and results.';


--
-- TOC entry 232 (class 1259 OID 176669)
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
-- TOC entry 5439 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE "agent-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."agent-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 5440 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN "agent-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 5441 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN "agent-agent-role"."relatedAgentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."relatedAgentID" IS 'An identifier for a related Agent.';


--
-- TOC entry 5442 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN "agent-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- TOC entry 5443 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN "agent-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- TOC entry 5444 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN "agent-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- TOC entry 5445 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN "agent-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- TOC entry 5446 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN "agent-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 233 (class 1259 OID 176685)
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
-- TOC entry 5447 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE "agent-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."agent-identifier" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 5448 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "agent-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- TOC entry 5449 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "agent-identifier"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 5450 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "agent-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- TOC entry 5451 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "agent-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- TOC entry 5452 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "agent-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in identifierType is given.';


--
-- TOC entry 5453 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "agent-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 234 (class 1259 OID 176695)
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
-- TOC entry 5454 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE "agent-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."agent-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 5455 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN "agent-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 5456 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN "agent-media"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 5457 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN "agent-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- TOC entry 5458 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN "agent-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- TOC entry 5459 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN "agent-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."agent-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 223 (class 1259 OID 176507)
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
-- TOC entry 5460 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE "chronometric-age"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age" IS 'Comments or notes about a chrono:ChronometricAge.';


--
-- TOC entry 5461 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeID" IS 'An identifier for a chrono:ChronometricAge.';


--
-- TOC entry 5462 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 5463 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."verbatimChronometricAge"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."verbatimChronometricAge" IS 'The verbatim age for a dwc:Event, whether reported by a dating assay, associated references, or legacy information.';


--
-- TOC entry 5464 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."chronometricAgeProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeProtocol" IS 'A description of or reference to the methods used to determine a chrono:ChronometricAge.';


--
-- TOC entry 5465 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."chronometricAgeProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeProtocolID" IS 'An identifier for the Protocol used to determine a ChronometricAge.';


--
-- TOC entry 5466 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."uncalibratedChronometricAge"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."uncalibratedChronometricAge" IS 'The output of a dating assay before it is calibrated into an age using a specific conversion protocol.';


--
-- TOC entry 5467 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."chronometricAgeConversionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeConversionProtocol" IS 'The method used for converting the chrono:uncalibratedChronometricAge into a chronometric age in years, as captured in the chrono:earliestChronometricAge, chrono:earliestChronometricAgeReferenceSystem, chrono:latestChronometricAge, and chrono:latestChronometricAgeReferenceSystem fields.';


--
-- TOC entry 5468 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."chronometricAgeConversionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeConversionProtocolID" IS 'An identifier for the Protocol used to convert a chrono:uncalibratedChronometricAge into a chronometric age in years, as captured in the chrono:earliestChronometricAge, chrono:earliestChronometricAgeReferenceSystem, chrono:latestChronometricAge, and chrono:latestChronometricAgeReferenceSystem fields.';


--
-- TOC entry 5469 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."earliestChronometricAge"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."earliestChronometricAge" IS 'The maximum/earliest/oldest possible age of a specimen as determined by a dating method.';


--
-- TOC entry 5470 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."earliestChronometricAgeReferenceSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."earliestChronometricAgeReferenceSystem" IS 'The reference system associated with the chrono:earliestChronometricAge.';


--
-- TOC entry 5471 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."latestChronometricAge"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."latestChronometricAge" IS 'The minimum/latest/youngest possible age of a specimen as determined by a dating method.';


--
-- TOC entry 5472 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."latestChronometricAgeReferenceSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."latestChronometricAgeReferenceSystem" IS 'The reference system associated with the chrono:latestChronometricAge.';


--
-- TOC entry 5473 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."chronometricAgeUncertaintyInYears"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeUncertaintyInYears" IS 'The temporal uncertainty of the chrono:earliestChronometricAge and chrono:latestChronometicAge in years.';


--
-- TOC entry 5474 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."chronometricAgeUncertaintyMethod"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeUncertaintyMethod" IS 'The method used to generate the value of chrono:ChronometricAgeUncertaintyInYears.';


--
-- TOC entry 5475 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."materialDated"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."materialDated" IS 'A description of the material on which the chrono:ChronometricAgeProtocol was actually performed, if known.';


--
-- TOC entry 5476 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."materialDatedID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."materialDatedID" IS 'An identifier for the MaterialEntity on which the chrono:ChronometricAgeProtocol was performed, if applicable.';


--
-- TOC entry 5477 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."materialDatedRelationship"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."materialDatedRelationship" IS 'The relationship of the chrono:materialDated to a dwc:MaterialEntity, from which the chrono:ChronometricAge of the related dwc:MaterialEntity and any related dwc:Occurrence is inferred.';


--
-- TOC entry 5478 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."chronometricAgeDeterminedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeDeterminedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who determined the chrono:ChronometricAge.';


--
-- TOC entry 5479 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."chronometricAgeDeterminedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeDeterminedByID" IS 'The identifier for the Agent who determined the chrono:ChronometricAge.';


--
-- TOC entry 5480 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."chronometricAgeDeterminedDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeDeterminedDate" IS 'The date on which the chrono:ChronometricAge was determined.';


--
-- TOC entry 5481 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."chronometricAgeReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeReferences" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with the chrono:ChronometricAge.';


--
-- TOC entry 5482 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN "chronometric-age"."chronometricAgeRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age"."chronometricAgeRemarks" IS 'Comments or notes about a chrono:ChronometricAge.';


--
-- TOC entry 235 (class 1259 OID 176710)
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
-- TOC entry 5483 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE "chronometric-age-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 5484 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN "chronometric-age-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 5485 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN "chronometric-age-agent-role"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."chronometricAgeID" IS 'An identifier a chrono:ChronometricAge.';


--
-- TOC entry 5486 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN "chronometric-age-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- TOC entry 5487 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN "chronometric-age-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- TOC entry 5488 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN "chronometric-age-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- TOC entry 5489 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN "chronometric-age-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- TOC entry 5490 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN "chronometric-age-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 236 (class 1259 OID 176726)
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
-- TOC entry 5491 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE "chronometric-age-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age-assertion" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 5492 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- TOC entry 5493 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."chronometricAgeID" IS 'An identifier a chrono:ChronometricAge.';


--
-- TOC entry 5494 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- TOC entry 5495 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- TOC entry 5496 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- TOC entry 5497 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- TOC entry 5498 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- TOC entry 5499 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- TOC entry 5500 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- TOC entry 5501 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- TOC entry 5502 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- TOC entry 5503 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- TOC entry 5504 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- TOC entry 5505 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- TOC entry 5506 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- TOC entry 5507 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- TOC entry 5508 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- TOC entry 5509 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- TOC entry 5510 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- TOC entry 5511 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "chronometric-age-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 237 (class 1259 OID 176743)
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
-- TOC entry 5512 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE "chronometric-age-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age-citation" IS 'Comments or notes about a Citation.';


--
-- TOC entry 5513 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."citationID" IS 'An identifier for a Citation.';


--
-- TOC entry 5514 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."chronometricAgeID" IS 'An identifier a chrono:ChronometricAge.';


--
-- TOC entry 5515 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- TOC entry 5516 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- TOC entry 5517 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in citationType is given.';


--
-- TOC entry 5518 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- TOC entry 5519 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- TOC entry 5520 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- TOC entry 5521 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- TOC entry 5522 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- TOC entry 5523 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in referenceType is given.';


--
-- TOC entry 5524 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- TOC entry 5525 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- TOC entry 5526 (class 0 OID 0)
-- Dependencies: 237
-- Name: COLUMN "chronometric-age-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


--
-- TOC entry 238 (class 1259 OID 176755)
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
-- TOC entry 5527 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE "chronometric-age-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 5528 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN "chronometric-age-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 5529 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN "chronometric-age-media"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."chronometricAgeID" IS 'An identifier a chrono:ChronometricAge.';


--
-- TOC entry 5530 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN "chronometric-age-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- TOC entry 5531 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN "chronometric-age-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- TOC entry 5532 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN "chronometric-age-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 239 (class 1259 OID 176770)
-- Name: chronometric-age-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."chronometric-age-protocol" (
    "protocolID" text NOT NULL,
    "chronometricAgeID" text NOT NULL
);


ALTER TABLE public."chronometric-age-protocol" OWNER TO postgres;

--
-- TOC entry 5533 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE "chronometric-age-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."chronometric-age-protocol" IS 'An identifier a chrono:ChronometricAge.';


--
-- TOC entry 5534 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN "chronometric-age-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- TOC entry 5535 (class 0 OID 0)
-- Dependencies: 239
-- Name: COLUMN "chronometric-age-protocol"."chronometricAgeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."chronometric-age-protocol"."chronometricAgeID" IS 'An identifier a chrono:ChronometricAge.';


--
-- TOC entry 216 (class 1259 OID 176407)
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
-- TOC entry 5536 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE collection; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.collection IS 'The name (or acronym) in use by an institution.';


--
-- TOC entry 5537 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN collection."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."collectionID" IS 'An identifier for a Collection.';


--
-- TOC entry 5538 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN collection."collectionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."collectionType" IS 'The category that best matches the nature of a Collection.';


--
-- TOC entry 5539 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN collection."collectionName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."collectionName" IS 'The name of a Collection.';


--
-- TOC entry 5540 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN collection."collectionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."collectionCode" IS 'The name, acronym, coden, or initialism identifying a Collection.';


--
-- TOC entry 5541 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN collection."institutionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."institutionID" IS 'The identifier for an institution.';


--
-- TOC entry 5542 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN collection."institutionName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."institutionName" IS 'The name of an institution or organization.';


--
-- TOC entry 5543 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN collection."institutionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection."institutionCode" IS 'The name (or acronym) in use by an institution.';


--
-- TOC entry 240 (class 1259 OID 176785)
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
-- TOC entry 5544 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE "collection-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."collection-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 5545 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN "collection-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 5546 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN "collection-agent-role"."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."collectionID" IS 'An identifier for a Collection.';


--
-- TOC entry 5547 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN "collection-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- TOC entry 5548 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN "collection-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- TOC entry 5549 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN "collection-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- TOC entry 5550 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN "collection-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRoleTargetID and agentRoleTargetType.';


--
-- TOC entry 5551 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN "collection-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 241 (class 1259 OID 176801)
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
-- TOC entry 5552 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE "collection-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."collection-assertion" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 5553 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- TOC entry 5554 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."collectionID" IS 'An identifier for a Collection.';


--
-- TOC entry 5555 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- TOC entry 5556 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- TOC entry 5557 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- TOC entry 5558 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- TOC entry 5559 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- TOC entry 5560 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- TOC entry 5561 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- TOC entry 5562 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- TOC entry 5563 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- TOC entry 5564 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- TOC entry 5565 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- TOC entry 5566 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- TOC entry 5567 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- TOC entry 5568 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- TOC entry 5569 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- TOC entry 5570 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- TOC entry 5571 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- TOC entry 5572 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "collection-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 242 (class 1259 OID 176818)
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
-- TOC entry 5573 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE "collection-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."collection-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 5574 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN "collection-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 5575 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN "collection-media"."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."collectionID" IS 'An identifier for a Collection.';


--
-- TOC entry 5576 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN "collection-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- TOC entry 5577 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN "collection-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- TOC entry 5578 (class 0 OID 0)
-- Dependencies: 242
-- Name: COLUMN "collection-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."collection-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 221 (class 1259 OID 176450)
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
    CONSTRAINT "event_minimumDepthInMeters_check" CHECK (("minimumDepthInMeters" <= (11000)::numeric)),
    CONSTRAINT "event_minimumDepthInMeters_check1" CHECK (("minimumDepthInMeters" >= (0)::numeric)),
    CONSTRAINT "event_minimumElevationInMeters_check" CHECK (("minimumElevationInMeters" <= (8850)::numeric)),
    CONSTRAINT "event_minimumElevationInMeters_check1" CHECK (("minimumElevationInMeters" >= ('-430'::integer)::numeric)),
    CONSTRAINT event_month_check CHECK ((month >= 1)),
    CONSTRAINT event_month_check1 CHECK ((month <= 12)),
    CONSTRAINT "event_pointRadiusSpatialFit_check" CHECK (("pointRadiusSpatialFit" >= (0)::numeric)),
    CONSTRAINT "event_startDayOfYear_check" CHECK (("startDayOfYear" >= 1)),
    CONSTRAINT "event_startDayOfYear_check1" CHECK (("startDayOfYear" <= 366))
);


ALTER TABLE public.event OWNER TO postgres;

--
-- TOC entry 5579 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE event; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.event IS 'An indication of which spatial representation best represents the dcterms:Location.';


--
-- TOC entry 5580 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 5581 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."parentEventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."parentEventID" IS 'An identifier for a broader dwc:Event that groups this and potentially other dwc:Events.';


--
-- TOC entry 5582 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."preferredEventName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."preferredEventName" IS 'The name of a dwc:Event preferred in searches and results.';


--
-- TOC entry 5583 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."eventType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventType" IS 'The category that best matches the nature of a dwc:Event.';


--
-- TOC entry 5584 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."datasetName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."datasetName" IS 'A name for a dataset from which data originated.';


--
-- TOC entry 5585 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."datasetID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."datasetID" IS 'An identifier for a dataset from which data originated.';


--
-- TOC entry 5586 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."fieldNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."fieldNumber" IS 'An identifier given to a dwc:Event in the field.';


--
-- TOC entry 5587 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."eventConductedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventConductedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations responsible for conducting or recording a dwc:Event.';


--
-- TOC entry 5588 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."eventConductedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventConductedByID" IS 'An identifier for the Agent responsible for conducting or recording a dwc:Event.';


--
-- TOC entry 5589 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."eventDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventDate" IS 'The date or time interval during which a dwc:Event occurred.';


--
-- TOC entry 5590 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."eventTime"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventTime" IS 'The time or interval during which a dwc:Event occurred.';


--
-- TOC entry 5591 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."startDayOfYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."startDayOfYear" IS 'The earliest integer day of the year on which a dwc:Event occurred (1 for January 1, 365 for December 31, except in a leap year, in which case it is 366).';


--
-- TOC entry 5592 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."endDayOfYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."endDayOfYear" IS 'The latest integer day of the year on which a dwc:Event occurred (1 for January 1, 365 for December 31, except in a leap year, in which case it is 366).';


--
-- TOC entry 5593 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event.year; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.year IS 'The four-digit year in which a dwc:Event occurred, according to the Common Era Calendar.';


--
-- TOC entry 5594 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event.month; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.month IS 'The integer month in which a dwc:Event occurred.';


--
-- TOC entry 5595 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event.day; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.day IS 'The integer day of the month on which a dwc:Event occurred.';


--
-- TOC entry 5596 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."verbatimEventDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimEventDate" IS 'The verbatim original representation of the date and time information for a dwc:Event.';


--
-- TOC entry 5597 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."verbatimLocality"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimLocality" IS 'The original textual description of a dcterms:Location of a dwc:Event.';


--
-- TOC entry 5598 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."verbatimElevation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimElevation" IS 'The original description of the elevation (altitude, usually above sea level) of a dcterms:Location.';


--
-- TOC entry 5599 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."verbatimDepth"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimDepth" IS 'The original description of the depth below a local surface.';


--
-- TOC entry 5600 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."verbatimCoordinates"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimCoordinates" IS 'The verbatim original spatial coordinates of a dcterms:Location.';


--
-- TOC entry 5601 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."verbatimLatitude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimLatitude" IS 'The verbatim original latitude of a dcterms:Location.';


--
-- TOC entry 5602 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."verbatimLongitude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimLongitude" IS 'The verbatim original longitude of a dcterms:Location.';


--
-- TOC entry 5603 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."verbatimCoordinateSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimCoordinateSystem" IS 'The coordinate format for dwc:verbatimLatitude and dwc:verbatimLongitude or dwc:verbatimCoordinates.';


--
-- TOC entry 5604 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."verbatimSRS"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verbatimSRS" IS 'The ellipsoid, geodetic datum, or spatial reference system (SRS) upon which coordinates given in dwc:verbatimLatitude and dwc:verbatimLongitude, or dwc:verbatimCoordinates are based.';


--
-- TOC entry 5605 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."georeferenceVerificationStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceVerificationStatus" IS 'A categorical description of the extent to which the georeference has been verified to represent the best possible spatial description for the dcterms:Location of a dwc:Occurrence.';


--
-- TOC entry 5606 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event.habitat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.habitat IS 'A category or description of the habitat in which a dwc:Event occurred.';


--
-- TOC entry 5607 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."sampleSizeValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."sampleSizeValue" IS 'A numeric value for a measurement of the size (time duration, length, area, or volume) of a sample in a sampling dwc:Event.';


--
-- TOC entry 5608 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."sampleSizeUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."sampleSizeUnit" IS 'The unit of measurement of the size (time duration, length, area, or volume) of a sample in a sampling dwc:Event.';


--
-- TOC entry 5609 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."eventEffort"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventEffort" IS 'The amount of effort expended during a dwc:Event.';


--
-- TOC entry 5610 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."fieldNotes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."fieldNotes" IS 'One of a) an indicator of the existence of, b) a reference to (publication, URI), or c) the text of notes taken in the field about a dwc:Event.';


--
-- TOC entry 5611 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."eventCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a dwc:Event.';


--
-- TOC entry 5612 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."eventRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."eventRemarks" IS 'Comments or notes about a dwc:Event.';


--
-- TOC entry 5613 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."locationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."locationID" IS 'An identifier a dcterms:Location.';


--
-- TOC entry 5614 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."higherGeographyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."higherGeographyID" IS 'An identifier for the geographic region within which the dcterms:Location occurred.';


--
-- TOC entry 5615 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."higherGeography"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."higherGeography" IS 'A list (concatenated and separated) of geographic names less specific than the information captured in dwc:locality.';


--
-- TOC entry 5616 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event.continent; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.continent IS 'The name of the continent in which the dcterms:Location occurs.';


--
-- TOC entry 5617 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."waterBody"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."waterBody" IS 'The name of the water body in which a dcterms:Location occurs.';


--
-- TOC entry 5618 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."islandGroup"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."islandGroup" IS 'The name of the island group in which a dcterms:Location occurs.';


--
-- TOC entry 5619 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event.island; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.island IS 'The name of the island on or near which a dcterms:Location occurs.';


--
-- TOC entry 5620 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event.country; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.country IS 'The name of the country or major administrative unit in which the dcterms:Location occurs.';


--
-- TOC entry 5621 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."countryCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."countryCode" IS 'The standard code for the country in which the dcterms:Location occurs.';


--
-- TOC entry 5622 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."stateProvince"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."stateProvince" IS 'The name of the next smaller administrative region than country (state, province, canton, department, region, etc.) in which a dcterms:Location occurs.';


--
-- TOC entry 5623 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event.county; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.county IS 'The full, unabbreviated name of the next smaller administrative region than dwc:stateProvince (county, shire, department, etc.) in which the dcterms:Location occurs.';


--
-- TOC entry 5624 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event.municipality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.municipality IS 'The full, unabbreviated name of the next smaller administrative region than county (city, municipality, etc.) in which a dcterms:Location occurs. Do not use this term for a nearby named place that does not contain the actual location.';


--
-- TOC entry 5625 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event.locality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.locality IS 'The specific description of the place.';


--
-- TOC entry 5626 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."minimumElevationInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."minimumElevationInMeters" IS 'The lower limit of the range of elevation (altitude, usually above sea level), in meters.';


--
-- TOC entry 5627 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."maximumElevationInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."maximumElevationInMeters" IS 'The upper limit of the range of elevation (altitude, usually above sea level), in meters.';


--
-- TOC entry 5628 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."verticalDatum"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."verticalDatum" IS 'The vertical datum used as the reference upon which the values in the elevation terms are based.';


--
-- TOC entry 5629 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."minimumDepthInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."minimumDepthInMeters" IS 'The lesser depth of a range of depth below the local surface, in meters.';


--
-- TOC entry 5630 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."maximumDepthInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."maximumDepthInMeters" IS 'The greater depth of a range of depth below the local surface, in meters.';


--
-- TOC entry 5631 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."minimumDistanceAboveSurfaceInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."minimumDistanceAboveSurfaceInMeters" IS 'The lesser distance in a range of distance from a reference surface in the vertical direction, in meters. Use positive values for locations above the surface, negative values for locations below. If depth measures are given, the reference surface is the location given by the depth, otherwise the reference surface is the location given by the elevation.';


--
-- TOC entry 5632 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."maximumDistanceAboveSurfaceInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."maximumDistanceAboveSurfaceInMeters" IS 'The greater distance in a range of distance from a reference surface in the vertical direction, in meters. Use positive values for locations above the surface, negative values for locations below. If depth measures are given, the reference surface is the location given by the depth, otherwise the reference surface is the location given by the elevation.';


--
-- TOC entry 5633 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."locationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."locationRemarks" IS 'Comments or notes about a dcterms:Location.';


--
-- TOC entry 5634 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."decimalLatitude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."decimalLatitude" IS 'The geographic latitude (in decimal degrees, using the spatial reference system given in dwc:geodeticDatum) of the geographic center of a dcterms:Location.';


--
-- TOC entry 5635 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."decimalLongitude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."decimalLongitude" IS 'The geographic longitude (in decimal degrees, using the spatial reference system given in dwc:geodeticDatum) of the geographic center of a dcterms:Location.';


--
-- TOC entry 5636 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."geodeticDatum"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."geodeticDatum" IS 'The ellipsoid, geodetic datum, or spatial reference system (SRS) upon which the geographic coordinates given in dwc:decimalLatitude and dwc:decimalLongitude as based.';


--
-- TOC entry 5637 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."coordinateUncertaintyInMeters"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."coordinateUncertaintyInMeters" IS 'The horizontal distance (in meters) from the given dwc:decimalLatitude and dwc:decimalLongitude describing the smallest circle containing the whole of the dcterms:Location.';


--
-- TOC entry 5638 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."coordinatePrecision"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."coordinatePrecision" IS 'A decimal representation of the precision of the coordinates given in a dwc:decimalLatitude and dwc:decimalLongitude.';


--
-- TOC entry 5639 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."pointRadiusSpatialFit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."pointRadiusSpatialFit" IS 'The ratio of the area of the point-radius (dwc:decimalLatitude, dwc:decimalLongitude, dwc:coordinateUncertaintyInMeters) to the area of the true (original, or most specific) spatial representation of a dcterms:Location.';


--
-- TOC entry 5640 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."footprintWKT"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."footprintWKT" IS 'A Well-Known Text (WKT) representation of the shape (footprint, geometry) that defines a dcterms:Location.';


--
-- TOC entry 5641 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."footprintSRS"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."footprintSRS" IS 'The ellipsoid, geodetic datum, or spatial reference system (SRS) upon which the geometry given in dwc:footprintWKT is based.';


--
-- TOC entry 5642 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."footprintSpatialFit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."footprintSpatialFit" IS 'The ratio of the area of the footprint (footprintWKT) to the area of the true (original, or most specific) spatial representation of a dcterms:Location.';


--
-- TOC entry 5643 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."georeferencedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferencedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who determined a georeference (spatial representation) for a dcterms:Location.';


--
-- TOC entry 5644 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."georeferencedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferencedByID" IS 'An identifier for the Agent who georeferenced a dwc:Event.';


--
-- TOC entry 5645 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."georeferencedDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferencedDate" IS 'The date on which a dcterms:Location was georeferenced.';


--
-- TOC entry 5646 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."georeferenceProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceProtocol" IS 'A description or reference to the methods used to determine the spatial footprint, coordinates, and uncertainties.';


--
-- TOC entry 5647 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."georeferenceProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceProtocolID" IS 'An identifier for a Protocol used to georeference a dwc:Event.';


--
-- TOC entry 5648 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."georeferenceSources"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceSources" IS 'A list (concatenated and separated) of maps, gazetteers, or other resources used to georeference a dcterms:Location, described specifically enough to allow anyone in the future to use the same resources.';


--
-- TOC entry 5649 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."georeferenceRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."georeferenceRemarks" IS 'Comments or notes about a spatial description determination, explaining assumptions made in addition or opposition to the those formalized in the method referred to in dwc:georeferenceProtocol.';


--
-- TOC entry 5650 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."informationWithheld"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."informationWithheld" IS 'Additional information that exists, but that has not been shared in the given record.';


--
-- TOC entry 5651 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."dataGeneralizations"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."dataGeneralizations" IS 'Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- TOC entry 5652 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN event."preferredSpatialRepresentation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event."preferredSpatialRepresentation" IS 'An indication of which spatial representation best represents the dcterms:Location.';


--
-- TOC entry 243 (class 1259 OID 176833)
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
-- TOC entry 5653 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE "event-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 5654 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN "event-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 5655 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN "event-agent-role"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 5656 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN "event-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- TOC entry 5657 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN "event-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- TOC entry 5658 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN "event-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- TOC entry 5659 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN "event-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRoleTargetID and agentRoleTargetType.';


--
-- TOC entry 5660 (class 0 OID 0)
-- Dependencies: 243
-- Name: COLUMN "event-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 244 (class 1259 OID 176849)
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
-- TOC entry 5661 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE "event-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-assertion" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 5662 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- TOC entry 5663 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 5664 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- TOC entry 5665 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- TOC entry 5666 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- TOC entry 5667 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- TOC entry 5668 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- TOC entry 5669 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- TOC entry 5670 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- TOC entry 5671 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- TOC entry 5672 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- TOC entry 5673 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- TOC entry 5674 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- TOC entry 5675 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- TOC entry 5676 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- TOC entry 5677 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- TOC entry 5678 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- TOC entry 5679 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- TOC entry 5680 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- TOC entry 5681 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN "event-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 245 (class 1259 OID 176866)
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
-- TOC entry 5682 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE "event-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-citation" IS 'Comments or notes about a Citation.';


--
-- TOC entry 5683 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."citationID" IS 'An identifier for a Citation.';


--
-- TOC entry 5684 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 5685 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- TOC entry 5686 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- TOC entry 5687 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in citationType is given.';


--
-- TOC entry 5688 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- TOC entry 5689 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- TOC entry 5690 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- TOC entry 5691 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- TOC entry 5692 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- TOC entry 5693 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in referenceType is given.';


--
-- TOC entry 5694 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- TOC entry 5695 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- TOC entry 5696 (class 0 OID 0)
-- Dependencies: 245
-- Name: COLUMN "event-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


--
-- TOC entry 246 (class 1259 OID 176878)
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
-- TOC entry 5697 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE "event-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-identifier" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 5698 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN "event-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- TOC entry 5699 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN "event-identifier"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 5700 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN "event-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- TOC entry 5701 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN "event-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- TOC entry 5702 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN "event-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in identifierType is given.';


--
-- TOC entry 5703 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN "event-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 247 (class 1259 OID 176888)
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
-- TOC entry 5704 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE "event-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 5705 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN "event-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 5706 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN "event-media"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 5707 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN "event-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- TOC entry 5708 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN "event-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- TOC entry 5709 (class 0 OID 0)
-- Dependencies: 247
-- Name: COLUMN "event-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 248 (class 1259 OID 176903)
-- Name: event-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."event-protocol" (
    "protocolID" text NOT NULL,
    "eventID" text NOT NULL
);


ALTER TABLE public."event-protocol" OWNER TO postgres;

--
-- TOC entry 5710 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE "event-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."event-protocol" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 5711 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN "event-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- TOC entry 5712 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN "event-protocol"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."event-protocol"."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 224 (class 1259 OID 176534)
-- Name: genetic-sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."genetic-sequence" (
    "geneticSequenceID" text NOT NULL,
    "eventID" text NOT NULL,
    "derivedFromMaterialEntityID" text,
    "geneticSequenceType" text,
    "geneticSequence" text,
    "geneticSequenceCitation" text,
    "geneticSequenceRemarks" text
);


ALTER TABLE public."genetic-sequence" OWNER TO postgres;

--
-- TOC entry 5713 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE "genetic-sequence"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-sequence" IS 'Comments or notes about a GeneticSequence.';


--
-- TOC entry 5714 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "genetic-sequence"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- TOC entry 5715 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "genetic-sequence"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence"."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 5716 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "genetic-sequence"."derivedFromMaterialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence"."derivedFromMaterialEntityID" IS 'An identifier for a dwc:MaterialEntity from which this dwc:MaterialEntity was derived.';


--
-- TOC entry 5717 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "genetic-sequence"."geneticSequenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence"."geneticSequenceType" IS 'The category that best matches the nature of a GeneticSequence.';


--
-- TOC entry 5718 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "genetic-sequence"."geneticSequence"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence"."geneticSequence" IS 'A string representing nucleotide base pairs.';


--
-- TOC entry 5719 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "genetic-sequence"."geneticSequenceCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence"."geneticSequenceCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a GeneticSequence.';


--
-- TOC entry 5720 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "genetic-sequence"."geneticSequenceRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence"."geneticSequenceRemarks" IS 'Comments or notes about a GeneticSequence.';


--
-- TOC entry 249 (class 1259 OID 176918)
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
-- TOC entry 5721 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE "genetic-sequence-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-sequence-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 5722 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN "genetic-sequence-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 5723 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN "genetic-sequence-agent-role"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- TOC entry 5724 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN "genetic-sequence-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- TOC entry 5725 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN "genetic-sequence-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- TOC entry 5726 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN "genetic-sequence-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in agentRole is given.';


--
-- TOC entry 5727 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN "genetic-sequence-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- TOC entry 5728 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN "genetic-sequence-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 250 (class 1259 OID 176934)
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
-- TOC entry 5729 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE "genetic-sequence-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-sequence-assertion" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 5730 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- TOC entry 5731 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- TOC entry 5732 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- TOC entry 5733 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- TOC entry 5734 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionType is given.';


--
-- TOC entry 5735 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- TOC entry 5736 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- TOC entry 5737 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- TOC entry 5738 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- TOC entry 5739 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionValue is given.';


--
-- TOC entry 5740 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- TOC entry 5741 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- TOC entry 5742 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- TOC entry 5743 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- TOC entry 5744 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- TOC entry 5745 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- TOC entry 5746 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- TOC entry 5747 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- TOC entry 5748 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- TOC entry 5749 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN "genetic-sequence-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 251 (class 1259 OID 176951)
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
-- TOC entry 5750 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE "genetic-sequence-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-sequence-citation" IS 'Comments or notes about a Citation.';


--
-- TOC entry 5751 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."citationID" IS 'An identifier for a Citation.';


--
-- TOC entry 5752 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- TOC entry 5753 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- TOC entry 5754 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- TOC entry 5755 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in citationType is given.';


--
-- TOC entry 5756 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- TOC entry 5757 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- TOC entry 5758 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- TOC entry 5759 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- TOC entry 5760 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- TOC entry 5761 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in referenceType is given.';


--
-- TOC entry 5762 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- TOC entry 5763 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- TOC entry 5764 (class 0 OID 0)
-- Dependencies: 251
-- Name: COLUMN "genetic-sequence-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


--
-- TOC entry 252 (class 1259 OID 176963)
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
-- TOC entry 5765 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE "genetic-sequence-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-sequence-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 5766 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN "genetic-sequence-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 5767 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN "genetic-sequence-media"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-media"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- TOC entry 5768 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN "genetic-sequence-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- TOC entry 5769 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN "genetic-sequence-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- TOC entry 5770 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN "genetic-sequence-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 253 (class 1259 OID 176978)
-- Name: genetic-sequence-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."genetic-sequence-protocol" (
    "protocolID" text NOT NULL,
    "geneticSequenceID" text NOT NULL
);


ALTER TABLE public."genetic-sequence-protocol" OWNER TO postgres;

--
-- TOC entry 5771 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE "genetic-sequence-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."genetic-sequence-protocol" IS 'An identifier for a GeneticSequence.';


--
-- TOC entry 5772 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN "genetic-sequence-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- TOC entry 5773 (class 0 OID 0)
-- Dependencies: 253
-- Name: COLUMN "genetic-sequence-protocol"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."genetic-sequence-protocol"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- TOC entry 225 (class 1259 OID 176546)
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
-- TOC entry 5774 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE "geological-context"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."geological-context" IS 'The full name of the lithostratigraphic bed from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5775 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."geologicalContextID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."geologicalContextID" IS 'An identifier for a dwc:GeologicalContext.';


--
-- TOC entry 5776 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 5777 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."earliestEonOrLowestEonothem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestEonOrLowestEonothem" IS 'The full name of the earliest possible geochronologic eon or lowest chrono-stratigraphic eonothem or the informal name (''Precambrian'') attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5778 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."latestEonOrHighestEonothem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestEonOrHighestEonothem" IS 'The full name of the latest possible geochronologic eon or highest chrono-stratigraphic eonothem or the informal name (''Precambrian'') attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5779 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."earliestEraOrLowestErathem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestEraOrLowestErathem" IS 'The full name of the earliest possible geochronologic era or lowest chronostratigraphic erathem attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5780 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."latestEraOrHighestErathem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestEraOrHighestErathem" IS 'The full name of the latest possible geochronologic era or highest chronostratigraphic erathem attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5781 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."earliestPeriodOrLowestSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestPeriodOrLowestSystem" IS 'The full name of the earliest possible geochronologic period or lowest chronostratigraphic system attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5782 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."latestPeriodOrHighestSystem"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestPeriodOrHighestSystem" IS 'The full name of the latest possible geochronologic period or highest chronostratigraphic system attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5783 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."earliestEpochOrLowestSeries"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestEpochOrLowestSeries" IS 'The full name of the earliest possible geochronologic epoch or lowest chronostratigraphic series attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5784 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."latestEpochOrHighestSeries"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestEpochOrHighestSeries" IS 'The full name of the latest possible geochronologic epoch or highest chronostratigraphic series attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5785 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."earliestAgeOrLowestStage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."earliestAgeOrLowestStage" IS 'The full name of the earliest possible geochronologic age or lowest chronostratigraphic stage attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5786 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."latestAgeOrHighestStage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."latestAgeOrHighestStage" IS 'The full name of the latest possible geochronologic age or highest chronostratigraphic stage attributable to the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5787 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."lowestBiostratigraphicZone"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."lowestBiostratigraphicZone" IS 'The full name of the lowest possible geological biostratigraphic zone of the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5788 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."highestBiostratigraphicZone"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."highestBiostratigraphicZone" IS 'The full name of the highest possible geological biostratigraphic zone of the stratigraphic horizon from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5789 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."lithostratigraphicTerms"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."lithostratigraphicTerms" IS 'The combination of all litho-stratigraphic names for the rock from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5790 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context"."group"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context"."group" IS 'The full name of the lithostratigraphic group from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5791 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context".formation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context".formation IS 'The full name of the lithostratigraphic formation from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5792 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context".member; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context".member IS 'The full name of the lithostratigraphic member from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 5793 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN "geological-context".bed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context".bed IS 'The full name of the lithostratigraphic bed from which a dwc:MaterialEntity was collected.';


--
-- TOC entry 254 (class 1259 OID 176993)
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
-- TOC entry 5794 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE "geological-context-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."geological-context-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 5795 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN "geological-context-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 5796 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN "geological-context-media"."geologicalContextID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."geologicalContextID" IS 'An identifier for a dwc:GeologicalContext.';


--
-- TOC entry 5797 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN "geological-context-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- TOC entry 5798 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN "geological-context-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- TOC entry 5799 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN "geological-context-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."geological-context-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 226 (class 1259 OID 176558)
-- Name: identification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identification (
    "identificationID" text NOT NULL,
    "identificationBasedOnOccurrenceID" text,
    "identificationBasedOnMaterialEntityID" text,
    "identificationBasedOnGeneticSequenceID" text,
    "identificationBasedOnMediaID" text,
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
-- TOC entry 5800 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE identification; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.identification IS 'Comments or notes about a dwc:Taxon.';


--
-- TOC entry 5801 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."identificationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationID" IS 'An identifier for a dwc:Identification.';


--
-- TOC entry 5802 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."identificationBasedOnOccurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationBasedOnOccurrenceID" IS 'An identifier for a dwc:Occurrence based on which a dwc:Identification was made.';


--
-- TOC entry 5803 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."identificationBasedOnMaterialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationBasedOnMaterialEntityID" IS 'An identifier for a dwc:MaterialEntity based on which a dwc:Identification was made.';


--
-- TOC entry 5804 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."identificationBasedOnGeneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationBasedOnGeneticSequenceID" IS 'An identifier for a GeneticSequence based on which a dwc:Identification was made.';


--
-- TOC entry 5805 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."identificationBasedOnMediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationBasedOnMediaID" IS 'An identifier for a Media instance based on which a dwc:Identification was made.';


--
-- TOC entry 5806 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."identificationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationType" IS 'The category that best matches the nature of a dwc:Identification.';


--
-- TOC entry 5807 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."verbatimIdentification"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."verbatimIdentification" IS 'A string representing the taxonomic identification as it appeared in the original record.';


--
-- TOC entry 5808 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."isAcceptedIdentification"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."isAcceptedIdentification" IS 'The dwc:Identification of a dwc:Organism is a currently accepted one.';


--
-- TOC entry 5809 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."taxonFormula"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonFormula" IS 'A string representing the pattern to use to construct a dwc:Identification from dwc:Taxon names and identification qualifiers.';


--
-- TOC entry 5810 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."typeStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."typeStatus" IS 'A list (concatenated and separated) of nomenclatural types (type status, typified scientific name, publication) applied to the subject.';


--
-- TOC entry 5811 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."typeDesignationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."typeDesignationType" IS 'The category that best matches the nature of a type designation.';


--
-- TOC entry 5812 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."identifiedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identifiedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- TOC entry 5813 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."identifiedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identifiedByID" IS 'The identifier for the Agent who made a taxonomic determination of a dwc:Organism.';


--
-- TOC entry 5814 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."dateIdentified"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."dateIdentified" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- TOC entry 5815 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."identificationReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationReferences" IS 'A list (concatenated and separated) of references (publication, global unique identifier, URI) used in a dwc:Identification.';


--
-- TOC entry 5816 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."identificationVerificationStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationVerificationStatus" IS 'A categorical indicator of the extent to which the taxonomic identification has been verified to be correct.';


--
-- TOC entry 5817 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."identificationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."identificationRemarks" IS 'Comments or notes about a dwc:Identification.';


--
-- TOC entry 5818 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonID" IS 'An identifier for a dwc:Taxon.';


--
-- TOC entry 5819 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification.kingdom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification.kingdom IS 'The full scientific name of the kingdom in which a dwc:scientificName is classified.';


--
-- TOC entry 5820 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."scientificName" IS 'The full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- TOC entry 5821 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."taxonRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonRank" IS 'The taxonomic rank of the most specific name in a dwc:scientificName.';


--
-- TOC entry 5822 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN identification."taxonRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.identification."taxonRemarks" IS 'Comments or notes about a dwc:Taxon.';


--
-- TOC entry 255 (class 1259 OID 177010)
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
-- TOC entry 5823 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE "identification-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."identification-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 5824 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN "identification-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 5825 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN "identification-agent-role"."identificationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."identificationID" IS 'An identifier for a dwc:Identification.';


--
-- TOC entry 5826 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN "identification-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- TOC entry 5827 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN "identification-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- TOC entry 5828 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN "identification-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- TOC entry 5829 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN "identification-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- TOC entry 5830 (class 0 OID 0)
-- Dependencies: 255
-- Name: COLUMN "identification-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 256 (class 1259 OID 177026)
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
-- TOC entry 5831 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE "identification-taxon"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."identification-taxon" IS 'Comments or notes about a dwc:Taxon.';


--
-- TOC entry 5832 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN "identification-taxon"."identificationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."identificationID" IS 'An identifier for a dwc:Identification.';


--
-- TOC entry 5833 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN "identification-taxon"."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."taxonID" IS 'An identifier for a dwc:Taxon.';


--
-- TOC entry 5834 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN "identification-taxon"."taxonOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."taxonOrder" IS 'The position of a dwc:Taxon in a taxonFormula.';


--
-- TOC entry 5835 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN "identification-taxon".kingdom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon".kingdom IS 'The full scientific name of the kingdom in which a dwc:scientificName is classified.';


--
-- TOC entry 5836 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN "identification-taxon"."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."scientificName" IS 'The full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- TOC entry 5837 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN "identification-taxon"."taxonRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."taxonRank" IS 'The taxonomic rank of the most specific name in a dwc:scientificName.';


--
-- TOC entry 5838 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN "identification-taxon"."taxonRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."identification-taxon"."taxonRemarks" IS 'Comments or notes about a dwc:Taxon.';


--
-- TOC entry 222 (class 1259 OID 176490)
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
-- TOC entry 5839 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE material; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.material IS 'Comments or notes about a dwc:Taxon.';


--
-- TOC entry 5840 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- TOC entry 5841 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 5842 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."materialCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialCategory" IS 'The broad category that best matches the nature of a dwc:MaterialEntity.';


--
-- TOC entry 5843 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."materialEntityType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialEntityType" IS 'The narrow category that best matches the nature of a dwc:MaterialEntity.';


--
-- TOC entry 5844 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."institutionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."institutionCode" IS 'The name (or acronym) in use by an institution.';


--
-- TOC entry 5845 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."institutionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."institutionID" IS 'An identifier for an institution.';


--
-- TOC entry 5846 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."ownerInstitutionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."ownerInstitutionCode" IS 'The name (or acronym) in use by the institution having ownership of a dwc:MaterialEntity.';


--
-- TOC entry 5847 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."ownerInstitutionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."ownerInstitutionID" IS 'An identifier for an institution that owns a dwc:MaterialEntity.';


--
-- TOC entry 5848 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."collectionCode"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."collectionCode" IS 'The name, acronym, coden, or initialism identifying a Collection.';


--
-- TOC entry 5849 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."collectionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."collectionID" IS 'An identifier for a Collection.';


--
-- TOC entry 5850 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."catalogNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."catalogNumber" IS 'An identifier (preferably unique) for a dwc:MaterialEntity within a Collection.';


--
-- TOC entry 5851 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."otherCatalogNumbers"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."otherCatalogNumbers" IS 'A list (concatenated and separated) of previous or alternate fully qualified catalog numbers or other human-used identifiers for the same dwc:MaterialEntity, whether in the current or any other data set or collection.';


--
-- TOC entry 5852 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."collectedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."collectedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations responsible for collecting a dwc:MaterialEntity.';


--
-- TOC entry 5853 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."collectedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."collectedByID" IS 'An identifier for the Agent responsible for collecting a dwc:MaterialEntity.';


--
-- TOC entry 5854 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."objectCount"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."objectCount" IS 'The number of distinct objects comprising a dwc:MaterialEntity.';


--
-- TOC entry 5855 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."recordNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."recordNumber" IS 'An identifier given to a dwc:MaterialEntity at the time it was recorded. Often serves as a link between field notes and a dwc:MaterialEntity, such as a specimen collector''s number.';


--
-- TOC entry 5856 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material.preparations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material.preparations IS 'A list (concatenated and separated) of preparations and preservation methods for a dwc:MaterialEntity.';


--
-- TOC entry 5857 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material.disposition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material.disposition IS 'The current state of a dwc:MaterialEntity with respect to where it can be found.';


--
-- TOC entry 5858 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."verbatimLabel"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."verbatimLabel" IS 'The content of this term should include no embellishments, prefixes, headers or other additions made to the text. Abbreviations must not be expanded and supposed misspellings must not be corrected. Lines or breakpoints between blocks of text that could be verified by seeing the original labels or images of them may be used. Examples of material entities include preserved specimens, fossil specimens, and material samples. Best practice is to use UTF-8 for all characters. Best practice is to add comment “verbatimLabel derived from human transcription” in dwc:occurrenceRemarks.';


--
-- TOC entry 5859 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."associatedSequences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."associatedSequences" IS 'A list (concatenated and separated) of identifiers (publication, global unique identifier, URI) of genetic sequence information associated with a dwc:MaterialEntity.';


--
-- TOC entry 5860 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."materialCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a dwc:MaterialEntity.';


--
-- TOC entry 5861 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."informationWithheld"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."informationWithheld" IS 'Additional information that exists, but that has not been shared in the given record.';


--
-- TOC entry 5862 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."dataGeneralizations"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."dataGeneralizations" IS 'Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- TOC entry 5863 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."materialEntityRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."materialEntityRemarks" IS 'Comments or notes about a dwc:MaterialEntity.';


--
-- TOC entry 5864 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."evidenceForOccurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."evidenceForOccurrenceID" IS 'An identifier for a dwc:Occurrence for which a dwc:MaterialEntity provides evidence.';


--
-- TOC entry 5865 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."derivedFromMaterialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."derivedFromMaterialEntityID" IS 'An identifier for a dwc:MaterialEntity from which this dwc:MaterialEntity was derived.';


--
-- TOC entry 5866 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."derivationEventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."derivationEventID" IS 'An identifier for a dwc:Event during which a dwc:MaterialEntity was derived from another dwc:MaterialEntity.';


--
-- TOC entry 5867 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."derivationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."derivationType" IS 'The category that best matches the nature of the derivation of a dwc:MaterialEntity from a dwc:MaterialEntity pointed to by derivedFromMaterialEntityID.';


--
-- TOC entry 5868 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."partOfMaterialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."partOfMaterialEntityID" IS 'An identifier for a dwc:MaterialEntity of which this dwc:MaterialEntity is a part.';


--
-- TOC entry 5869 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."verbatimIdentification"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."verbatimIdentification" IS 'A string representing the taxonomic identification as it appeared in the original record.';


--
-- TOC entry 5870 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."taxonFormula"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."taxonFormula" IS 'A string representing the pattern to use to construct a dwc:Identification from dwc:Taxon names and identification qualifiers.';


--
-- TOC entry 5871 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."identifiedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identifiedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- TOC entry 5872 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."identifiedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identifiedByID" IS 'The identifier for the Agent who made a taxonomic determination of a dwc:Organism.';


--
-- TOC entry 5873 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."dateIdentified"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."dateIdentified" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- TOC entry 5874 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."identificationReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identificationReferences" IS 'A list (concatenated and separated) of references (publication, global unique identifier, URI) used in a dwc:Identification.';


--
-- TOC entry 5875 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."identificationVerificationStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identificationVerificationStatus" IS 'A categorical indicator of the extent to which the taxonomic determination has been verified to be correct.';


--
-- TOC entry 5876 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."identificationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."identificationRemarks" IS 'Comments or notes about a dwc:Identification.';


--
-- TOC entry 5877 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."taxonID" IS 'An identifier for a dwc:Taxon.';


--
-- TOC entry 5878 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material.kingdom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material.kingdom IS 'The full scientific name of the kingdom in which a dwc:scientificName is classified.';


--
-- TOC entry 5879 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."scientificName" IS 'The full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- TOC entry 5880 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."taxonRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."taxonRank" IS 'The taxonomic rank of the most specific name in a dwc:scientificName.';


--
-- TOC entry 5881 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN material."taxonRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.material."taxonRemarks" IS 'Comments or notes about a dwc:Taxon.';


--
-- TOC entry 257 (class 1259 OID 177037)
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
-- TOC entry 5882 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE "material-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 5883 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN "material-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 5884 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN "material-agent-role"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- TOC entry 5885 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN "material-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- TOC entry 5886 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN "material-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- TOC entry 5887 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN "material-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- TOC entry 5888 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN "material-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- TOC entry 5889 (class 0 OID 0)
-- Dependencies: 257
-- Name: COLUMN "material-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 258 (class 1259 OID 177053)
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
-- TOC entry 5890 (class 0 OID 0)
-- Dependencies: 258
-- Name: TABLE "material-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-assertion" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 5891 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- TOC entry 5892 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- TOC entry 5893 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- TOC entry 5894 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- TOC entry 5895 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionType is given.';


--
-- TOC entry 5896 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- TOC entry 5897 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- TOC entry 5898 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- TOC entry 5899 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- TOC entry 5900 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionValue is given.';


--
-- TOC entry 5901 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- TOC entry 5902 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- TOC entry 5903 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- TOC entry 5904 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- TOC entry 5905 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- TOC entry 5906 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- TOC entry 5907 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- TOC entry 5908 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- TOC entry 5909 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- TOC entry 5910 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN "material-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 259 (class 1259 OID 177070)
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
-- TOC entry 5911 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE "material-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-citation" IS 'Comments or notes about a Citation.';


--
-- TOC entry 5912 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."citationID" IS 'An identifier for a Citation.';


--
-- TOC entry 5913 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- TOC entry 5914 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- TOC entry 5915 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- TOC entry 5916 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in citationType is given.';


--
-- TOC entry 5917 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- TOC entry 5918 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- TOC entry 5919 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- TOC entry 5920 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- TOC entry 5921 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- TOC entry 5922 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in referenceType is given.';


--
-- TOC entry 5923 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- TOC entry 5924 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- TOC entry 5925 (class 0 OID 0)
-- Dependencies: 259
-- Name: COLUMN "material-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


--
-- TOC entry 260 (class 1259 OID 177082)
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
-- TOC entry 5926 (class 0 OID 0)
-- Dependencies: 260
-- Name: TABLE "material-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-identifier" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 5927 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN "material-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- TOC entry 5928 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN "material-identifier"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- TOC entry 5929 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN "material-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- TOC entry 5930 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN "material-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- TOC entry 5931 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN "material-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in identifierType is given.';


--
-- TOC entry 5932 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN "material-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 261 (class 1259 OID 177092)
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
-- TOC entry 5933 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE "material-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 5934 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN "material-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 5935 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN "material-media"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- TOC entry 5936 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN "material-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- TOC entry 5937 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN "material-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- TOC entry 5938 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN "material-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 262 (class 1259 OID 177107)
-- Name: material-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."material-protocol" (
    "protocolID" text NOT NULL,
    "materialEntityID" text NOT NULL
);


ALTER TABLE public."material-protocol" OWNER TO postgres;

--
-- TOC entry 5939 (class 0 OID 0)
-- Dependencies: 262
-- Name: TABLE "material-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."material-protocol" IS 'An identifier for a dwc:MaterialEntity.';


--
-- TOC entry 5940 (class 0 OID 0)
-- Dependencies: 262
-- Name: COLUMN "material-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- TOC entry 5941 (class 0 OID 0)
-- Dependencies: 262
-- Name: COLUMN "material-protocol"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."material-protocol"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- TOC entry 217 (class 1259 OID 176414)
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
-- TOC entry 5942 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE media; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.media IS 'An account of the Media subject matter.';


--
-- TOC entry 5943 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 5944 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media."mediaType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."mediaType" IS 'The category that best matches the nature of an instance of Media.';


--
-- TOC entry 5945 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media."accessURI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."accessURI" IS 'A URI that uniquely identifies a service that provides a representation of the underlying resource.';


--
-- TOC entry 5946 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media."WebStatement"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."WebStatement" IS 'A Web URL for a statement of the ownership and usage rights for this resource.';


--
-- TOC entry 5947 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media.format; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.format IS 'The file format, physical medium, or dimensions of the resource.';


--
-- TOC entry 5948 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media.rights; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.rights IS 'Information about rights held in and over the resource.';


--
-- TOC entry 5949 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media."Owner"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."Owner" IS 'A list of legal owners of the resource.';


--
-- TOC entry 5950 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media.source; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.source IS 'A related resource from which the described resource is derived.';


--
-- TOC entry 5951 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media.creator; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.creator IS 'An entity primarily responsible for making the resource.';


--
-- TOC entry 5952 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media."creatorID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."creatorID" IS 'An identifier for the entity primarily responsible for making the resource.';


--
-- TOC entry 5953 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media."CreateDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."CreateDate" IS 'The date and time the resource was created. For a digital file, this need not match a file-system creation time. For a freshly created resource, it should be close to that time, modulo the time taken to write the file. Later file transfer, copying, and so on, can make the file-system time arbitrarily different.';


--
-- TOC entry 5954 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media.modified; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media.modified IS 'Date on which the resource was changed.';


--
-- TOC entry 5955 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media."mediaLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."mediaLanguage" IS 'A language of the content of Media.';


--
-- TOC entry 5956 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN media."mediaDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.media."mediaDescription" IS 'An account of the Media subject matter.';


--
-- TOC entry 263 (class 1259 OID 177122)
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
-- TOC entry 5957 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE "media-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."media-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 5958 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN "media-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 5959 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN "media-agent-role"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 5960 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN "media-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- TOC entry 5961 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN "media-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- TOC entry 5962 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN "media-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- TOC entry 5963 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN "media-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- TOC entry 5964 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN "media-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 264 (class 1259 OID 177138)
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
-- TOC entry 5965 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE "media-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."media-assertion" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 5966 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- TOC entry 5967 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 5968 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- TOC entry 5969 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- TOC entry 5970 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionType is given.';


--
-- TOC entry 5971 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- TOC entry 5972 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- TOC entry 5973 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- TOC entry 5974 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- TOC entry 5975 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionValue is given.';


--
-- TOC entry 5976 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- TOC entry 5977 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- TOC entry 5978 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- TOC entry 5979 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- TOC entry 5980 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- TOC entry 5981 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- TOC entry 5982 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- TOC entry 5983 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- TOC entry 5984 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- TOC entry 5985 (class 0 OID 0)
-- Dependencies: 264
-- Name: COLUMN "media-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 265 (class 1259 OID 177155)
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
-- TOC entry 5986 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE "media-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."media-identifier" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 5987 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN "media-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- TOC entry 5988 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN "media-identifier"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 5989 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN "media-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- TOC entry 5990 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN "media-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- TOC entry 5991 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN "media-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in identifierType is given.';


--
-- TOC entry 5992 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN "media-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."media-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 218 (class 1259 OID 176421)
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
-- TOC entry 5993 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE occurrence; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.occurrence IS 'Comments or notes about a dwc:Taxon.';


--
-- TOC entry 5994 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- TOC entry 5995 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 5996 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."surveyTargetID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."surveyTargetID" IS 'An identifier for a SurveyTarget.';


--
-- TOC entry 5997 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."recordedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."recordedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations responsible for recording a dwc:Occurrence.';


--
-- TOC entry 5998 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."recordedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."recordedByID" IS 'An identifier for the Agent responsible for recording a dwc:Occurrence.';


--
-- TOC entry 5999 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."organismQuantity"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismQuantity" IS 'A number or enumeration value for the quantity of dwc:Organisms.';


--
-- TOC entry 6000 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."organismQuantityType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismQuantityType" IS 'A type of quantification system used for the quantity of dwc:Organisms.';


--
-- TOC entry 6001 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence.sex; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.sex IS 'The sex of a dwc:Organism.';


--
-- TOC entry 6002 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."lifeStage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."lifeStage" IS 'The age class or life stage of a dwc:Organism.';


--
-- TOC entry 6003 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."reproductiveCondition"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."reproductiveCondition" IS 'The reproductive condition a dwc:Organism.';


--
-- TOC entry 6004 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence.caste; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.caste IS 'The social caste of a dwc:Organism.';


--
-- TOC entry 6005 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence.behavior; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.behavior IS 'The behavior shown by a dwc:Organism.';


--
-- TOC entry 6006 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence.vitality; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.vitality IS 'An indication of whether a dwc:Organism was alive or dead at the time of collection or observation.';


--
-- TOC entry 6007 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."establishmentMeans"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."establishmentMeans" IS 'Statement about whether a dwc:Organism has been introduced to a given place and time through the direct or indirect activity of modern humans.';


--
-- TOC entry 6008 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."degreeOfEstablishment"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."degreeOfEstablishment" IS 'The degree to which a dwc:Organism survives, reproduces, and expands its range at a given place and time.';


--
-- TOC entry 6009 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence.pathway; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.pathway IS 'The process by which a dwc:Organism came to be in a given place at a given time.';


--
-- TOC entry 6010 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."occurrenceStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."occurrenceStatus" IS 'A statement about the detection or non-detection of a dwc:Organism.';


--
-- TOC entry 6011 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."occurrenceCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."occurrenceCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a dwc:Occurrence.';


--
-- TOC entry 6012 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."informationWithheld"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."informationWithheld" IS 'Additional information that exists, but that has not been shared in the given record.';


--
-- TOC entry 6013 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."dataGeneralizations"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."dataGeneralizations" IS 'Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- TOC entry 6014 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."occurrenceRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."occurrenceRemarks" IS 'Comments or notes about a dwc:Occurrence.';


--
-- TOC entry 6015 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."organismID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismID" IS 'An identifier for a dwc:Organism.';


--
-- TOC entry 6016 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."organismScope"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismScope" IS 'A description of the type of dwc:Organism instance.';


--
-- TOC entry 6017 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."organismName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismName" IS 'A name or label assigned to a dwc:Organism.';


--
-- TOC entry 6018 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."organismRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."organismRemarks" IS 'Comments or notes about a dwc:Organism.';


--
-- TOC entry 6019 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."verbatimIdentification"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."verbatimIdentification" IS 'A string representing the taxonomic identification as it appeared in the original record.';


--
-- TOC entry 6020 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."taxonFormula"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."taxonFormula" IS 'A string representing the pattern to use to construct a dwc:Identification from dwc:Taxon names and identification qualifiers.';


--
-- TOC entry 6021 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."identifiedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identifiedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- TOC entry 6022 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."identifiedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identifiedByID" IS 'The identifier for the Agent who made a taxonomic determination of a dwc:Organism.';


--
-- TOC entry 6023 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."dateIdentified"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."dateIdentified" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- TOC entry 6024 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."identificationReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identificationReferences" IS 'A list (concatenated and separated) of references (publication, global unique identifier, URI) used in a dwc:Identification.';


--
-- TOC entry 6025 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."identificationVerificationStatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identificationVerificationStatus" IS 'A categorical indicator of the extent to which the taxonomic determination has been verified to be correct.';


--
-- TOC entry 6026 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."identificationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."identificationRemarks" IS 'Comments or notes about a dwc:Identification.';


--
-- TOC entry 6027 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."taxonID" IS 'An identifier for a dwc:Taxon.';


--
-- TOC entry 6028 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence.kingdom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence.kingdom IS 'The full scientific name of the kingdom in which a dwc:scientificName is classified.';


--
-- TOC entry 6029 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."scientificName" IS 'The full scientific name, with authorship and date information if known. When forming part of a dwc:Identification, this should be the name in lowest level taxonomic rank that can be determined. This term should not contain identification qualifications, which should instead be supplied in dwc:verbatimIdentification.';


--
-- TOC entry 6030 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."taxonRank"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."taxonRank" IS 'The taxonomic rank of the most specific name in a dwc:scientificName.';


--
-- TOC entry 6031 (class 0 OID 0)
-- Dependencies: 218
-- Name: COLUMN occurrence."taxonRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.occurrence."taxonRemarks" IS 'Comments or notes about a dwc:Taxon.';


--
-- TOC entry 266 (class 1259 OID 177165)
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
-- TOC entry 6032 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE "occurrence-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 6033 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN "occurrence-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 6034 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN "occurrence-agent-role"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- TOC entry 6035 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN "occurrence-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- TOC entry 6036 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN "occurrence-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- TOC entry 6037 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN "occurrence-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- TOC entry 6038 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN "occurrence-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- TOC entry 6039 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN "occurrence-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 267 (class 1259 OID 177181)
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
-- TOC entry 6040 (class 0 OID 0)
-- Dependencies: 267
-- Name: TABLE "occurrence-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-assertion" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 6041 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- TOC entry 6042 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- TOC entry 6043 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- TOC entry 6044 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- TOC entry 6045 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- TOC entry 6046 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- TOC entry 6047 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- TOC entry 6048 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- TOC entry 6049 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- TOC entry 6050 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- TOC entry 6051 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- TOC entry 6052 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- TOC entry 6053 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- TOC entry 6054 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- TOC entry 6055 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- TOC entry 6056 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- TOC entry 6057 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- TOC entry 6058 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- TOC entry 6059 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- TOC entry 6060 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN "occurrence-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 268 (class 1259 OID 177198)
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
-- TOC entry 6061 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE "occurrence-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-citation" IS 'Comments or notes about a Citation.';


--
-- TOC entry 6062 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."citationID" IS 'An identifier for a Citation.';


--
-- TOC entry 6063 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- TOC entry 6064 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- TOC entry 6065 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- TOC entry 6066 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for citationType is given.';


--
-- TOC entry 6067 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- TOC entry 6068 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- TOC entry 6069 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- TOC entry 6070 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- TOC entry 6071 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- TOC entry 6072 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for referenceType is given.';


--
-- TOC entry 6073 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- TOC entry 6074 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- TOC entry 6075 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN "occurrence-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


--
-- TOC entry 269 (class 1259 OID 177210)
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
-- TOC entry 6076 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE "occurrence-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-identifier" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 6077 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN "occurrence-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- TOC entry 6078 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN "occurrence-identifier"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- TOC entry 6079 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN "occurrence-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- TOC entry 6080 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN "occurrence-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- TOC entry 6081 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN "occurrence-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for identifierType is given.';


--
-- TOC entry 6082 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN "occurrence-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 270 (class 1259 OID 177220)
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
-- TOC entry 6083 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE "occurrence-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 6084 (class 0 OID 0)
-- Dependencies: 270
-- Name: COLUMN "occurrence-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 6085 (class 0 OID 0)
-- Dependencies: 270
-- Name: COLUMN "occurrence-media"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- TOC entry 6086 (class 0 OID 0)
-- Dependencies: 270
-- Name: COLUMN "occurrence-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- TOC entry 6087 (class 0 OID 0)
-- Dependencies: 270
-- Name: COLUMN "occurrence-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- TOC entry 6088 (class 0 OID 0)
-- Dependencies: 270
-- Name: COLUMN "occurrence-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 271 (class 1259 OID 177235)
-- Name: occurrence-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."occurrence-protocol" (
    "protocolID" text NOT NULL,
    "occurrenceID" text NOT NULL
);


ALTER TABLE public."occurrence-protocol" OWNER TO postgres;

--
-- TOC entry 6089 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE "occurrence-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."occurrence-protocol" IS 'An identifier for a dwc:Occurrence.';


--
-- TOC entry 6090 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN "occurrence-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- TOC entry 6091 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN "occurrence-protocol"."occurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."occurrence-protocol"."occurrenceID" IS 'An identifier for a dwc:Occurrence.';


--
-- TOC entry 227 (class 1259 OID 176596)
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
-- TOC entry 6092 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE "organism-interaction"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."organism-interaction" IS 'A part of a object dwc:Organism involved in an OrganismInteraction.';


--
-- TOC entry 6093 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN "organism-interaction"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."organismInteractionID" IS 'An identifier for an OrganismInteraction.';


--
-- TOC entry 6094 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN "organism-interaction"."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 6095 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN "organism-interaction"."organismInteractionDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."organismInteractionDescription" IS 'A verbatim description of an OrganismInteraction.';


--
-- TOC entry 6096 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN "organism-interaction"."subjectOccurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."subjectOccurrenceID" IS 'A unique identifier for a subject dwc:Occurrence in an OrganismInteraction.';


--
-- TOC entry 6097 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN "organism-interaction"."subjectOrganismPart"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."subjectOrganismPart" IS 'A part of a subject dwc:Organism involved in an OrganismInteraction.';


--
-- TOC entry 6098 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN "organism-interaction"."organismInteractionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."organismInteractionType" IS 'The category that best matches the nature of an OrganismInteraction.';


--
-- TOC entry 6099 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN "organism-interaction"."relatedOccurrenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."relatedOccurrenceID" IS 'A unique identifier for an related dwc:Occurrence in an OrganismInteraction.';


--
-- TOC entry 6100 (class 0 OID 0)
-- Dependencies: 227
-- Name: COLUMN "organism-interaction"."relatedOrganismPart"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction"."relatedOrganismPart" IS 'A part of a object dwc:Organism involved in an OrganismInteraction.';


--
-- TOC entry 272 (class 1259 OID 177250)
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
-- TOC entry 6101 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE "organism-interaction-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."organism-interaction-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 6102 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN "organism-interaction-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 6103 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN "organism-interaction-agent-role"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."organismInteractionID" IS 'An identifier for an OrganismInteraction.';


--
-- TOC entry 6104 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN "organism-interaction-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- TOC entry 6105 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN "organism-interaction-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- TOC entry 6106 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN "organism-interaction-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- TOC entry 6107 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN "organism-interaction-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- TOC entry 6108 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN "organism-interaction-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 273 (class 1259 OID 177266)
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
-- TOC entry 6109 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE "organism-interaction-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."organism-interaction-assertion" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 6110 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- TOC entry 6111 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."organismInteractionID" IS 'An identifier for an OrganismInteraction.';


--
-- TOC entry 6112 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- TOC entry 6113 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- TOC entry 6114 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- TOC entry 6115 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- TOC entry 6116 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- TOC entry 6117 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- TOC entry 6118 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- TOC entry 6119 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- TOC entry 6120 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- TOC entry 6121 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- TOC entry 6122 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- TOC entry 6123 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- TOC entry 6124 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- TOC entry 6125 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- TOC entry 6126 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- TOC entry 6127 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- TOC entry 6128 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- TOC entry 6129 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN "organism-interaction-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 274 (class 1259 OID 177283)
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
-- TOC entry 6130 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE "organism-interaction-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."organism-interaction-citation" IS 'Comments or notes about a Citation.';


--
-- TOC entry 6131 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."citationID" IS 'An identifier for a Citation.';


--
-- TOC entry 6132 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."organismInteractionID" IS 'An identifier for an OrganismInteraction.';


--
-- TOC entry 6133 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- TOC entry 6134 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- TOC entry 6135 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for citationType is given.';


--
-- TOC entry 6136 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- TOC entry 6137 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- TOC entry 6138 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- TOC entry 6139 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- TOC entry 6140 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- TOC entry 6141 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for referenceType is given.';


--
-- TOC entry 6142 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- TOC entry 6143 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- TOC entry 6144 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN "organism-interaction-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


--
-- TOC entry 275 (class 1259 OID 177295)
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
-- TOC entry 6145 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE "organism-interaction-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."organism-interaction-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 6146 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN "organism-interaction-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 6147 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN "organism-interaction-media"."organismInteractionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."organismInteractionID" IS 'An identifier for an OrganismInteraction.';


--
-- TOC entry 6148 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN "organism-interaction-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- TOC entry 6149 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN "organism-interaction-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- TOC entry 6150 (class 0 OID 0)
-- Dependencies: 275
-- Name: COLUMN "organism-interaction-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."organism-interaction-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 228 (class 1259 OID 176618)
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
-- TOC entry 6151 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE "phylogenetic-tree"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a PhylogeneticTree.';


--
-- TOC entry 6152 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- TOC entry 6153 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making a PhylogeneticTree.';


--
-- TOC entry 6154 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeProtocolID" IS 'An identifier for the Protocol used to make an PhylogeneticTree.';


--
-- TOC entry 6155 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "phylogenetic-tree"."phylogeneticTreeCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree"."phylogeneticTreeCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with a PhylogeneticTree.';


--
-- TOC entry 276 (class 1259 OID 177310)
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
-- TOC entry 6156 (class 0 OID 0)
-- Dependencies: 276
-- Name: TABLE "phylogenetic-tree-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-assertion" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 6157 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- TOC entry 6158 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- TOC entry 6159 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- TOC entry 6160 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- TOC entry 6161 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- TOC entry 6162 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- TOC entry 6163 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- TOC entry 6164 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- TOC entry 6165 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- TOC entry 6166 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- TOC entry 6167 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- TOC entry 6168 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- TOC entry 6169 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- TOC entry 6170 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- TOC entry 6171 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- TOC entry 6172 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- TOC entry 6173 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- TOC entry 6174 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- TOC entry 6175 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- TOC entry 6176 (class 0 OID 0)
-- Dependencies: 276
-- Name: COLUMN "phylogenetic-tree-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 277 (class 1259 OID 177327)
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
-- TOC entry 6177 (class 0 OID 0)
-- Dependencies: 277
-- Name: TABLE "phylogenetic-tree-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-citation" IS 'Comments or notes about a Citation.';


--
-- TOC entry 6178 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."citationID" IS 'An identifier for a Citation.';


--
-- TOC entry 6179 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- TOC entry 6180 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- TOC entry 6181 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- TOC entry 6182 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for citationType is given.';


--
-- TOC entry 6183 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- TOC entry 6184 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- TOC entry 6185 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- TOC entry 6186 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- TOC entry 6187 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- TOC entry 6188 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for referenceType is given.';


--
-- TOC entry 6189 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- TOC entry 6190 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- TOC entry 6191 (class 0 OID 0)
-- Dependencies: 277
-- Name: COLUMN "phylogenetic-tree-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


--
-- TOC entry 278 (class 1259 OID 177339)
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
-- TOC entry 6192 (class 0 OID 0)
-- Dependencies: 278
-- Name: TABLE "phylogenetic-tree-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-identifier" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 6193 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN "phylogenetic-tree-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- TOC entry 6194 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN "phylogenetic-tree-identifier"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- TOC entry 6195 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN "phylogenetic-tree-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- TOC entry 6196 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN "phylogenetic-tree-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- TOC entry 6197 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN "phylogenetic-tree-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for identifierType is given.';


--
-- TOC entry 6198 (class 0 OID 0)
-- Dependencies: 278
-- Name: COLUMN "phylogenetic-tree-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 279 (class 1259 OID 177349)
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
-- TOC entry 6199 (class 0 OID 0)
-- Dependencies: 279
-- Name: TABLE "phylogenetic-tree-media"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-media" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 6200 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN "phylogenetic-tree-media"."mediaID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."mediaID" IS 'An identifier for a Media instance.';


--
-- TOC entry 6201 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN "phylogenetic-tree-media"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- TOC entry 6202 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN "phylogenetic-tree-media"."mediaSubjectCategory"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."mediaSubjectCategory" IS 'A term to describe the content of the image by a value from a controlled vocabulary.';


--
-- TOC entry 6203 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN "phylogenetic-tree-media"."mediaSubjectCategoryIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."mediaSubjectCategoryIRI" IS 'The IRI of the controlled vocabulary value for the subject category of the Media instance.';


--
-- TOC entry 6204 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN "phylogenetic-tree-media"."mediaSubjectCategoryVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-media"."mediaSubjectCategoryVocabulary" IS 'Any vocabulary or formal classification from which terms in the Subject Category have been drawn.';


--
-- TOC entry 280 (class 1259 OID 177364)
-- Name: phylogenetic-tree-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."phylogenetic-tree-protocol" (
    "protocolID" text NOT NULL,
    "phylogeneticTreeID" text NOT NULL
);


ALTER TABLE public."phylogenetic-tree-protocol" OWNER TO postgres;

--
-- TOC entry 6205 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE "phylogenetic-tree-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-protocol" IS 'An identifier for a PhylogeneticTree.';


--
-- TOC entry 6206 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN "phylogenetic-tree-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- TOC entry 6207 (class 0 OID 0)
-- Dependencies: 280
-- Name: COLUMN "phylogenetic-tree-protocol"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-protocol"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- TOC entry 229 (class 1259 OID 176625)
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
-- TOC entry 6208 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE "phylogenetic-tree-tip"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-tip" IS 'An identifier for a GeneticSequence.';


--
-- TOC entry 6209 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN "phylogenetic-tree-tip"."phylogeneticTreeTipID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."phylogeneticTreeTipID" IS 'An identifier for a PhylogeneticTreeTip.';


--
-- TOC entry 6210 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN "phylogenetic-tree-tip"."phylogeneticTreeID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."phylogeneticTreeID" IS 'An identifier for a PhylogeneticTree.';


--
-- TOC entry 6211 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN "phylogenetic-tree-tip"."phylogeneticTreeTipLabel"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."phylogeneticTreeTipLabel" IS 'A label applied to a PhylogeneticTreeTip.';


--
-- TOC entry 6212 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN "phylogenetic-tree-tip"."taxonID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."taxonID" IS 'An identifier for a dwc:Taxon.';


--
-- TOC entry 6213 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN "phylogenetic-tree-tip"."scientificName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."scientificName" IS 'The full scientific name, with authorship and date information if known.';


--
-- TOC entry 6214 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN "phylogenetic-tree-tip"."materialEntityID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."materialEntityID" IS 'An identifier for a dwc:MaterialEntity.';


--
-- TOC entry 6215 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN "phylogenetic-tree-tip"."geneticSequenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip"."geneticSequenceID" IS 'An identifier for a GeneticSequence.';


--
-- TOC entry 281 (class 1259 OID 177379)
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
-- TOC entry 6216 (class 0 OID 0)
-- Dependencies: 281
-- Name: TABLE "phylogenetic-tree-tip-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."phylogenetic-tree-tip-assertion" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 6217 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- TOC entry 6218 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."phylogeneticTreeTipID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."phylogeneticTreeTipID" IS 'An identifier for a PhylogeneticTreeTip.';


--
-- TOC entry 6219 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- TOC entry 6220 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- TOC entry 6221 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- TOC entry 6222 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- TOC entry 6223 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- TOC entry 6224 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- TOC entry 6225 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- TOC entry 6226 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- TOC entry 6227 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- TOC entry 6228 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- TOC entry 6229 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionUnitIRI" IS 'The IRI for the units of an assertionValueNumeric.';


--
-- TOC entry 6230 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- TOC entry 6231 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- TOC entry 6232 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- TOC entry 6233 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- TOC entry 6234 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- TOC entry 6235 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- TOC entry 6236 (class 0 OID 0)
-- Dependencies: 281
-- Name: COLUMN "phylogenetic-tree-tip-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."phylogenetic-tree-tip-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 219 (class 1259 OID 176435)
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
-- TOC entry 6237 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE protocol; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.protocol IS 'Comments or notes about a Protocol.';


--
-- TOC entry 6238 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN protocol."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolID" IS 'An identifier for a Protocol.';


--
-- TOC entry 6239 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN protocol."protocolType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolType" IS 'The category that best matches the nature of a Protocol.';


--
-- TOC entry 6240 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN protocol."protocolTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Protocol.';


--
-- TOC entry 6241 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN protocol."protocolTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for protocolType is given.';


--
-- TOC entry 6242 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN protocol."protocolName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolName" IS 'The name of a Protocol.';


--
-- TOC entry 6243 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN protocol."protocolDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolDescription" IS 'A description of a Protocol.';


--
-- TOC entry 6244 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN protocol."protocolCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolCitation" IS 'A bibliographic citation for a Protocol.';


--
-- TOC entry 6245 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN protocol."protocolRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.protocol."protocolRemarks" IS 'Comments or notes about a Protocol.';


--
-- TOC entry 282 (class 1259 OID 177396)
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
-- TOC entry 6246 (class 0 OID 0)
-- Dependencies: 282
-- Name: TABLE "protocol-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."protocol-citation" IS 'Comments or notes about a Citation.';


--
-- TOC entry 6247 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."citationID" IS 'An identifier for a Citation.';


--
-- TOC entry 6248 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."protocolID" IS 'An identifier for a Protocol.';


--
-- TOC entry 6249 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- TOC entry 6250 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- TOC entry 6251 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for citationType is given.';


--
-- TOC entry 6252 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- TOC entry 6253 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- TOC entry 6254 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- TOC entry 6255 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- TOC entry 6256 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- TOC entry 6257 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for referenceType is given.';


--
-- TOC entry 6258 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- TOC entry 6259 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- TOC entry 6260 (class 0 OID 0)
-- Dependencies: 282
-- Name: COLUMN "protocol-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."protocol-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


--
-- TOC entry 220 (class 1259 OID 176442)
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
-- TOC entry 6261 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE relationship; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.relationship IS 'Comments or notes about a Relationship.';


--
-- TOC entry 6262 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relationshipID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipID" IS 'An identifier for a Relationship.';


--
-- TOC entry 6263 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."subjectResourceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."subjectResourceID" IS 'An identifier for the resource that is the subject of a Relationship.';


--
-- TOC entry 6264 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."subjectResourceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."subjectResourceType" IS 'The category that best matches the nature of a subject resource.';


--
-- TOC entry 6265 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."subjectResourceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."subjectResourceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of subject resource.';


--
-- TOC entry 6266 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."subjectResourceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."subjectResourceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for subjectResourceType is given.';


--
-- TOC entry 6267 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relationshipType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipType" IS 'The relationship of the subject resource (identified by subjectresourceID) to the related resource (identified by relatedResourceID).';


--
-- TOC entry 6268 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relationshipTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Relationship.';


--
-- TOC entry 6269 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relationshipTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for relationshipType is given.';


--
-- TOC entry 6270 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relatedResourceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relatedResourceID" IS 'An identifier for the related resource (the object) of a Relationship.';


--
-- TOC entry 6271 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relatedResourceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relatedResourceType" IS 'The category that best matches the nature of a related resource.';


--
-- TOC entry 6272 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relatedResourceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relatedResourceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of related resource.';


--
-- TOC entry 6273 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relatedResourceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relatedResourceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for relatedResourceType is given.';


--
-- TOC entry 6274 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relationshipOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipOrder" IS 'The numerical position of a Relationship in a set of Relationships that have the same combination of subjectResourceID, relatedResourceID, relationshipType, relationshipType, and relationshipTypeVocabulary.';


--
-- TOC entry 6275 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relationshipAccordingTo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipAccordingTo" IS 'The name of an Agent responsible for asserting a Relationship.';


--
-- TOC entry 6276 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relationshipAccordingToID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipAccordingToID" IS 'An identifier for an Agent responsible for asserting a Relationship.';


--
-- TOC entry 6277 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relationshipEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipEffectiveDate" IS 'The date on which a Relationship was established.';


--
-- TOC entry 6278 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN relationship."relationshipRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.relationship."relationshipRemarks" IS 'Comments or notes about a Relationship.';


--
-- TOC entry 230 (class 1259 OID 176639)
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
-- TOC entry 6279 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE survey; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.survey IS 'Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- TOC entry 6280 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."surveyID" IS 'An identifier for a Survey.';


--
-- TOC entry 6281 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."eventID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."eventID" IS 'An identifier for a dwc:Event.';


--
-- TOC entry 6282 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."siteCount"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."siteCount" IS 'Total number of individual sites surveyed during a dwc:Event.';


--
-- TOC entry 6283 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."siteNestingDescription"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."siteNestingDescription" IS 'Textual description of a hierarchical sampling design.';


--
-- TOC entry 6284 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."verbatimSiteDescriptions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."verbatimSiteDescriptions" IS 'Original textual description of site(s).';


--
-- TOC entry 6285 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."verbatimSiteNames"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."verbatimSiteNames" IS 'A list (concatenated and separated) of original site names.';


--
-- TOC entry 6286 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."geospatialScopeAreaValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."geospatialScopeAreaValue" IS 'The numeric value for the total area of a geospatial scope of a dwc:Event.';


--
-- TOC entry 6287 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."geospatialScopeAreaUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."geospatialScopeAreaUnit" IS 'The units associated with eco:geospatialScopeAreaValue';


--
-- TOC entry 6288 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."totalAreaSampledValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."totalAreaSampledValue" IS 'The numeric value for the total area surveyed during a dwc:Event.';


--
-- TOC entry 6289 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."totalAreaSampledUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."totalAreaSampledUnit" IS 'The units associated with eco:totalAreaSampledValue';


--
-- TOC entry 6290 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."reportedWeather"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."reportedWeather" IS 'A list of weather or climatic conditions present during a dwc:Event.';


--
-- TOC entry 6291 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."reportedExtremeConditions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."reportedExtremeConditions" IS 'A description of any extreme weather or environmental conditions that may have affected a dwc:Event.';


--
-- TOC entry 6292 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."eventDurationValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."eventDurationValue" IS 'The numeric value for the duration of a dwc:Event.';


--
-- TOC entry 6293 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."eventDurationUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."eventDurationUnit" IS 'The units associated with the eco:eventDurationValue.';


--
-- TOC entry 6294 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."taxonCompletenessReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."taxonCompletenessReported" IS 'Statement about whether the taxonomic completeness of a dwc:Event was assessed.';


--
-- TOC entry 6295 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."taxonCompletenessProtocols"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."taxonCompletenessProtocols" IS 'A description of or reference (publication, URL) to the methods used to determine eco:taxonCompletenessReported.';


--
-- TOC entry 6296 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."isAbsenceReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isAbsenceReported" IS 'Taxonomic absences were reported.';


--
-- TOC entry 6297 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."absentTaxa"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."absentTaxa" IS 'A list (concatenated and separated) of taxa reported absent during a dwc:Event.';


--
-- TOC entry 6298 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."hasNonTargetTaxa"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."hasNonTargetTaxa" IS 'One or more dwc:Organisms of taxa outside the target taxonomic scope (the combination of eco:targetTaxonomicScope and eco:excludedTaxonomicScope) were detected and reported for this dwc:Event.';


--
-- TOC entry 6299 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."nonTargetTaxa"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."nonTargetTaxa" IS 'A list (concatenated and separated) of taxa reported during a dwc:Event that are outside of the target taxonomic scope (the combination of eco:targetTaxonomicScope and eco:excludedTaxonomicScope).';


--
-- TOC entry 6300 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."areNonTargetTaxaFullyReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."areNonTargetTaxaFullyReported" IS 'Every dwc:Organism that was outside of the target taxonomic scope (the combination of eco:targetTaxonomicScope and eco:excludedTaxonomicScope) and detected during a dwc:Event, and that was detectable using the given protocol (given in eco:protocolDescriptions and dwc:samplingProtocol), was reported.';


--
-- TOC entry 6301 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."hasNonTargetOrganisms"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."hasNonTargetOrganisms" IS 'One or more dwc:Organisms outside the target organismal scopes (eco:targetDegreeOfEstablishmentScope, eco:targetGrowthFormScope, and eco:targetLifeStageScope) were detected and reported for this dwc:Event.';


--
-- TOC entry 6302 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."verbatimTargetScope"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."verbatimTargetScope" IS 'The verbatim original description of a dwc:Event scope.';


--
-- TOC entry 6303 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."identifiedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."identifiedBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made a taxonomic determination of a dwc:Organism.';


--
-- TOC entry 6304 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."identifiedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."identifiedByID" IS 'The identifier for the Agent who made a taxonomic determination of a dwc:Organism.';


--
-- TOC entry 6305 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."identificationReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."identificationReferences" IS 'A list (concatenated and separated) of references (publication, global unique identifier, URI) used in a dwc:Identification.';


--
-- TOC entry 6306 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."compilationTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."compilationTypes" IS 'A statement specifying whether data reported are derived from sampling events, ancillary data compiled from other sources, or a combination of both.';


--
-- TOC entry 6307 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."compilationSourceTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."compilationSourceTypes" IS 'The types of data sources contributing to the compilation reported.';


--
-- TOC entry 6308 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."inventoryTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."inventoryTypes" IS 'The types of search processes used to conduct the inventory.';


--
-- TOC entry 6309 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."protocolNames"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."protocolNames" IS 'Categorical descriptive names for the methods used during a dwc:Event.';


--
-- TOC entry 6310 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."protocolDescriptions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."protocolDescriptions" IS 'A detailed description of the methods used during a dwc:Event.';


--
-- TOC entry 6311 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."protocolReferences"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."protocolReferences" IS 'The references to the methods used during a dwc:Event.';


--
-- TOC entry 6312 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."isAbundanceReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isAbundanceReported" IS 'The number of dwc:Organisms collected or observed was reported.';


--
-- TOC entry 6313 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."isAbundanceCapReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isAbundanceCapReported" IS 'A maximum number of dwc:Organisms was reported, as specified or restricted by the protocol used.';


--
-- TOC entry 6314 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."abundanceCap"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."abundanceCap" IS 'The reported maximum number of dwc:Organisms.';


--
-- TOC entry 6315 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."isVegetationCoverReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isVegetationCoverReported" IS 'A vegetation cover metric was reported.';


--
-- TOC entry 6316 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."isLeastSpecificTargetCategoryQuantityInclusive"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isLeastSpecificTargetCategoryQuantityInclusive" IS 'The total detected quantity for a dwc:Taxon (including subcategories thereof) in a dwc:Event is given explicitly in a single record (dwc:organismQuantity value) for that dwc:Taxon.';


--
-- TOC entry 6317 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."hasVouchers"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."hasVouchers" IS 'Specimen vouchers were collected during a dwc:Event.';


--
-- TOC entry 6318 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."voucherInstitutions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."voucherInstitutions" IS 'A list (concatenated and separated) of the names or acronyms of the institutions where vouchers collected during a dwc:Event were deposited.';


--
-- TOC entry 6319 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."hasMaterialSamples"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."hasMaterialSamples" IS 'Material samples were collected during a dwc:Event.';


--
-- TOC entry 6320 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."materialSampleTypes"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."materialSampleTypes" IS 'A list (concatenated and separated) of material sample types collected during a dwc:Event.';


--
-- TOC entry 6321 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."samplingPerformedBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingPerformedBy" IS 'A person, group, or organization that performed the sampling.';


--
-- TOC entry 6322 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."samplingPerformedByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingPerformedByID" IS 'The identifier for the Agent who performed the sampling.';


--
-- TOC entry 6323 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."isSamplingEffortReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."isSamplingEffortReported" IS 'The sampling effort associated with a dwc:Event was reported.';


--
-- TOC entry 6324 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."samplingEffortProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingEffortProtocol" IS 'A description of or reference (publication or URL) to the methods used to determine the sampling effort.';


--
-- TOC entry 6325 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."samplingEffortProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingEffortProtocolID" IS 'An identifier for a Protocol used to determine sampling effort.';


--
-- TOC entry 6326 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."samplingEffortValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingEffortValue" IS 'The numeric value for the sampling effort expended during a dwc:Event.';


--
-- TOC entry 6327 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."samplingEffortUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."samplingEffortUnit" IS 'The units associated with the eco:samplingEffortValue.';


--
-- TOC entry 6328 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."informationWithheld"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."informationWithheld" IS 'Additional information that exists, but that has not been shared in the given record.';


--
-- TOC entry 6329 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN survey."dataGeneralizations"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.survey."dataGeneralizations" IS 'Actions taken to make the shared data less specific or complete than in its original form. Suggests that alternative data of higher quality may be available on request.';


--
-- TOC entry 283 (class 1259 OID 177408)
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
-- TOC entry 6330 (class 0 OID 0)
-- Dependencies: 283
-- Name: TABLE "survey-agent-role"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-agent-role" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 6331 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN "survey-agent-role"."agentID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentID" IS 'An identifier for an Agent.';


--
-- TOC entry 6332 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN "survey-agent-role"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."surveyID" IS 'An identifier for a Survey.';


--
-- TOC entry 6333 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN "survey-agent-role"."agentRole"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRole" IS 'The category that best matches the nature of a role of an Agent.';


--
-- TOC entry 6334 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN "survey-agent-role"."agentRoleIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRoleIRI" IS 'The IRI of the controlled vocabulary value for the role of an Agent.';


--
-- TOC entry 6335 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN "survey-agent-role"."agentRoleVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRoleVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for agentRole is given.';


--
-- TOC entry 6336 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN "survey-agent-role"."agentRoleOrder"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRoleOrder" IS 'The numerical position of an AgentRole in a set of AgentRoles that have the same combination of agentRole, agentRoleIRI, agentRoleVocabulary and related target.';


--
-- TOC entry 6337 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN "survey-agent-role"."agentRoleDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-agent-role"."agentRoleDate" IS 'The interval during which an AgentRole was in effect.';


--
-- TOC entry 284 (class 1259 OID 177424)
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
-- TOC entry 6338 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE "survey-assertion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-assertion" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 6339 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionID" IS 'An identifier for an Assertion.';


--
-- TOC entry 6340 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."surveyID" IS 'An identifier for a Survey.';


--
-- TOC entry 6341 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionType" IS 'The category that best matches the nature of an Assertion.';


--
-- TOC entry 6342 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Assertion.';


--
-- TOC entry 6343 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionType is given.';


--
-- TOC entry 6344 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionMadeDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionMadeDate" IS 'The date on which an Assertion was created.';


--
-- TOC entry 6345 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionEffectiveDate"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionEffectiveDate" IS 'The date on which the state or measurement of an Assertion was deemed to first be in effect.';


--
-- TOC entry 6346 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionValue" IS 'An asserted value, if it is not numeric.';


--
-- TOC entry 6347 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionValueIRI" IS 'The IRI of the controlled vocabulary value for the value of an Assertion.';


--
-- TOC entry 6348 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for assertionValue is given.';


--
-- TOC entry 6349 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionValueNumeric"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionValueNumeric" IS 'An asserted value, if it is numeric.';


--
-- TOC entry 6350 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionUnit" IS 'The units associated with the value in assertionValueNumeric.';


--
-- TOC entry 6351 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionUnitIRI" IS 'The IRI for the units associated with the value in assertionValueNumeric.';


--
-- TOC entry 6352 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionUnitVocabulary" IS 'The reference to the controlled vocabulary in which the definition of the value in assertionUnit is given.';


--
-- TOC entry 6353 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionBy"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionBy" IS 'A list (concatenated and separated) of names of people, groups, or organizations who made an Assertion.';


--
-- TOC entry 6354 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionByID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionByID" IS 'An identifier for an Agent who made an Assertion.';


--
-- TOC entry 6355 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionProtocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionProtocol" IS 'The names of, references to, or descriptions of the methods or protocols used in making an Assertion.';


--
-- TOC entry 6356 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionProtocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionProtocolID" IS 'An identifier for a Protocol used to make an Assertion.';


--
-- TOC entry 6357 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionCitation" IS 'A list (concatenated and separated) of identifiers (publication, bibliographic reference, global unique identifier, URI) of literature associated with an Assertion.';


--
-- TOC entry 6358 (class 0 OID 0)
-- Dependencies: 284
-- Name: COLUMN "survey-assertion"."assertionRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-assertion"."assertionRemarks" IS 'Comments or notes about an Assertion.';


--
-- TOC entry 285 (class 1259 OID 177441)
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
-- TOC entry 6359 (class 0 OID 0)
-- Dependencies: 285
-- Name: TABLE "survey-citation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-citation" IS 'Comments or notes about a Citation.';


--
-- TOC entry 6360 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."citationID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."citationID" IS 'An identifier for a Citation.';


--
-- TOC entry 6361 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."surveyID" IS 'An identifier for a Survey.';


--
-- TOC entry 6362 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."citationType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."citationType" IS 'The category that best matches the nature of a Citation.';


--
-- TOC entry 6363 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."citationTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."citationTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Citation.';


--
-- TOC entry 6364 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."citationTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."citationTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for citationType is given.';


--
-- TOC entry 6365 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."bibliographicCitation"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."bibliographicCitation" IS 'A bibliographic reference for the resource.';


--
-- TOC entry 6366 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."pageNumber"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."pageNumber" IS 'The number of the page on which the citation occurs in the cited reference.';


--
-- TOC entry 6367 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."referenceID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."referenceID" IS 'An identifier for the reference in which a Citation occurs.';


--
-- TOC entry 6368 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."referenceType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."referenceType" IS 'The category that best matches the nature of a reference.';


--
-- TOC entry 6369 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."referenceTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."referenceTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of reference.';


--
-- TOC entry 6370 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."referenceTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."referenceTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for referenceType is given.';


--
-- TOC entry 6371 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."referenceYear"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."referenceYear" IS 'The year the reference in a Citation was published.';


--
-- TOC entry 6372 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."isPeerReviewed"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."isPeerReviewed" IS 'An indication of whether the reference for a Citation was peer reviewed.';


--
-- TOC entry 6373 (class 0 OID 0)
-- Dependencies: 285
-- Name: COLUMN "survey-citation"."citationRemarks"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-citation"."citationRemarks" IS 'Comments or notes about a Citation.';


--
-- TOC entry 286 (class 1259 OID 177453)
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
-- TOC entry 6374 (class 0 OID 0)
-- Dependencies: 286
-- Name: TABLE "survey-identifier"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-identifier" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 6375 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN "survey-identifier".identifier; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier".identifier IS 'An unambiguous reference to a resource within a given context.';


--
-- TOC entry 6376 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN "survey-identifier"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."surveyID" IS 'An identifier for a Survey.';


--
-- TOC entry 6377 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN "survey-identifier"."identifierType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."identifierType" IS 'The category or system that best matches the nature of an Identifier.';


--
-- TOC entry 6378 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN "survey-identifier"."identifierTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."identifierTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of Identifier.';


--
-- TOC entry 6379 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN "survey-identifier"."identifierTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."identifierTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for identifierType is given.';


--
-- TOC entry 6380 (class 0 OID 0)
-- Dependencies: 286
-- Name: COLUMN "survey-identifier"."identifierLanguage"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-identifier"."identifierLanguage" IS 'A language in which an Identifier is presented.';


--
-- TOC entry 287 (class 1259 OID 177463)
-- Name: survey-protocol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."survey-protocol" (
    "protocolID" text NOT NULL,
    "surveyID" text NOT NULL
);


ALTER TABLE public."survey-protocol" OWNER TO postgres;

--
-- TOC entry 6381 (class 0 OID 0)
-- Dependencies: 287
-- Name: TABLE "survey-protocol"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-protocol" IS 'An identifier for a Survey.';


--
-- TOC entry 6382 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN "survey-protocol"."protocolID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-protocol"."protocolID" IS 'An identifier for a Protocol.';


--
-- TOC entry 6383 (class 0 OID 0)
-- Dependencies: 287
-- Name: COLUMN "survey-protocol"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-protocol"."surveyID" IS 'An identifier for a Survey.';


--
-- TOC entry 231 (class 1259 OID 176657)
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
-- TOC entry 6384 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE "survey-target"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."survey-target" IS 'A declaration of whether the counts for an instance of the SurveyTarget report everything that matches the declared SurveyTarget. If they do, this enables inference of absence of detection for everything in that SurveyTarget that is included but that does not appear in the count.';


--
-- TOC entry 6385 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."surveyTargetID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetID" IS 'An identifier for a SurveyTarget.';


--
-- TOC entry 6386 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."surveyID"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyID" IS 'An identifier for a dwc:Event that is an biotic survey.';


--
-- TOC entry 6387 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."surveyTargetType"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetType" IS 'The type of scope a SurveyTarget describes.';


--
-- TOC entry 6388 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."surveyTargetTypeIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetTypeIRI" IS 'The IRI of the controlled vocabulary value for the type of survey target.';


--
-- TOC entry 6389 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."surveyTargetTypeVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetTypeVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for surveyTargetType is given.';


--
-- TOC entry 6390 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."surveyTargetValue"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetValue" IS 'The value of a characteristic sought for the surveyTarget for a given surveyTargetType.';


--
-- TOC entry 6391 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."surveyTargetValueIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetValueIRI" IS 'The IRI of the controlled vocabulary value for the type of survey target value.';


--
-- TOC entry 6392 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."surveyTargetValueVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetValueVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for surveyTargetValue is given.';


--
-- TOC entry 6393 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."surveyTargetUnit"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetUnit" IS 'The units associated with the surveyTargetValue.';


--
-- TOC entry 6394 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."surveyTargetUnitIRI"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetUnitIRI" IS 'The IRI of the controlled vocabulary value for the type of survey target unit.';


--
-- TOC entry 6395 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."surveyTargetUnitVocabulary"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."surveyTargetUnitVocabulary" IS 'The reference to the controlled vocabulary where the definition of the value for surveyTargetUnit is given.';


--
-- TOC entry 6396 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."includeOrExclude"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."includeOrExclude" IS 'A term to declare whether an instance of the SurveyTarget is an included scope or an excluded scope. Combinations of SurveyTarget records of inclusions and exclusions can define complex scopes such as all flying adult Aves except Passeriformes.';


--
-- TOC entry 6397 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN "survey-target"."isSurveyTargetFullyReported"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."survey-target"."isSurveyTargetFullyReported" IS 'A declaration of whether the counts for an instance of the SurveyTarget report everything that matches the declared SurveyTarget. If they do, this enables inference of absence of detection for everything in that SurveyTarget that is included but that does not appear in the count.';


--
-- TOC entry 5353 (class 0 OID 176400)
-- Dependencies: 215
-- Data for Name: agent; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5370 (class 0 OID 176669)
-- Dependencies: 232
-- Data for Name: agent-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5371 (class 0 OID 176685)
-- Dependencies: 233
-- Data for Name: agent-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5372 (class 0 OID 176695)
-- Dependencies: 234
-- Data for Name: agent-media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5361 (class 0 OID 176507)
-- Dependencies: 223
-- Data for Name: chronometric-age; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5373 (class 0 OID 176710)
-- Dependencies: 235
-- Data for Name: chronometric-age-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5374 (class 0 OID 176726)
-- Dependencies: 236
-- Data for Name: chronometric-age-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5375 (class 0 OID 176743)
-- Dependencies: 237
-- Data for Name: chronometric-age-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5376 (class 0 OID 176755)
-- Dependencies: 238
-- Data for Name: chronometric-age-media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5377 (class 0 OID 176770)
-- Dependencies: 239
-- Data for Name: chronometric-age-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5354 (class 0 OID 176407)
-- Dependencies: 216
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5378 (class 0 OID 176785)
-- Dependencies: 240
-- Data for Name: collection-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5379 (class 0 OID 176801)
-- Dependencies: 241
-- Data for Name: collection-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5380 (class 0 OID 176818)
-- Dependencies: 242
-- Data for Name: collection-media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5359 (class 0 OID 176450)
-- Dependencies: 221
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5381 (class 0 OID 176833)
-- Dependencies: 243
-- Data for Name: event-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5382 (class 0 OID 176849)
-- Dependencies: 244
-- Data for Name: event-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5383 (class 0 OID 176866)
-- Dependencies: 245
-- Data for Name: event-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5384 (class 0 OID 176878)
-- Dependencies: 246
-- Data for Name: event-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5385 (class 0 OID 176888)
-- Dependencies: 247
-- Data for Name: event-media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5386 (class 0 OID 176903)
-- Dependencies: 248
-- Data for Name: event-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5362 (class 0 OID 176534)
-- Dependencies: 224
-- Data for Name: genetic-sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5387 (class 0 OID 176918)
-- Dependencies: 249
-- Data for Name: genetic-sequence-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5388 (class 0 OID 176934)
-- Dependencies: 250
-- Data for Name: genetic-sequence-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5389 (class 0 OID 176951)
-- Dependencies: 251
-- Data for Name: genetic-sequence-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5390 (class 0 OID 176963)
-- Dependencies: 252
-- Data for Name: genetic-sequence-media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5391 (class 0 OID 176978)
-- Dependencies: 253
-- Data for Name: genetic-sequence-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5363 (class 0 OID 176546)
-- Dependencies: 225
-- Data for Name: geological-context; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5392 (class 0 OID 176993)
-- Dependencies: 254
-- Data for Name: geological-context-media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5364 (class 0 OID 176558)
-- Dependencies: 226
-- Data for Name: identification; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5393 (class 0 OID 177010)
-- Dependencies: 255
-- Data for Name: identification-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5394 (class 0 OID 177026)
-- Dependencies: 256
-- Data for Name: identification-taxon; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5360 (class 0 OID 176490)
-- Dependencies: 222
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5395 (class 0 OID 177037)
-- Dependencies: 257
-- Data for Name: material-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5396 (class 0 OID 177053)
-- Dependencies: 258
-- Data for Name: material-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5397 (class 0 OID 177070)
-- Dependencies: 259
-- Data for Name: material-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5398 (class 0 OID 177082)
-- Dependencies: 260
-- Data for Name: material-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5399 (class 0 OID 177092)
-- Dependencies: 261
-- Data for Name: material-media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5400 (class 0 OID 177107)
-- Dependencies: 262
-- Data for Name: material-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5355 (class 0 OID 176414)
-- Dependencies: 217
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5401 (class 0 OID 177122)
-- Dependencies: 263
-- Data for Name: media-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5402 (class 0 OID 177138)
-- Dependencies: 264
-- Data for Name: media-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5403 (class 0 OID 177155)
-- Dependencies: 265
-- Data for Name: media-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5356 (class 0 OID 176421)
-- Dependencies: 218
-- Data for Name: occurrence; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5404 (class 0 OID 177165)
-- Dependencies: 266
-- Data for Name: occurrence-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5405 (class 0 OID 177181)
-- Dependencies: 267
-- Data for Name: occurrence-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5406 (class 0 OID 177198)
-- Dependencies: 268
-- Data for Name: occurrence-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5407 (class 0 OID 177210)
-- Dependencies: 269
-- Data for Name: occurrence-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5408 (class 0 OID 177220)
-- Dependencies: 270
-- Data for Name: occurrence-media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5409 (class 0 OID 177235)
-- Dependencies: 271
-- Data for Name: occurrence-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5365 (class 0 OID 176596)
-- Dependencies: 227
-- Data for Name: organism-interaction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5410 (class 0 OID 177250)
-- Dependencies: 272
-- Data for Name: organism-interaction-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5411 (class 0 OID 177266)
-- Dependencies: 273
-- Data for Name: organism-interaction-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5412 (class 0 OID 177283)
-- Dependencies: 274
-- Data for Name: organism-interaction-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5413 (class 0 OID 177295)
-- Dependencies: 275
-- Data for Name: organism-interaction-media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5366 (class 0 OID 176618)
-- Dependencies: 228
-- Data for Name: phylogenetic-tree; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5414 (class 0 OID 177310)
-- Dependencies: 276
-- Data for Name: phylogenetic-tree-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5415 (class 0 OID 177327)
-- Dependencies: 277
-- Data for Name: phylogenetic-tree-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5416 (class 0 OID 177339)
-- Dependencies: 278
-- Data for Name: phylogenetic-tree-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5417 (class 0 OID 177349)
-- Dependencies: 279
-- Data for Name: phylogenetic-tree-media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5418 (class 0 OID 177364)
-- Dependencies: 280
-- Data for Name: phylogenetic-tree-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5367 (class 0 OID 176625)
-- Dependencies: 229
-- Data for Name: phylogenetic-tree-tip; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5419 (class 0 OID 177379)
-- Dependencies: 281
-- Data for Name: phylogenetic-tree-tip-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5357 (class 0 OID 176435)
-- Dependencies: 219
-- Data for Name: protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5420 (class 0 OID 177396)
-- Dependencies: 282
-- Data for Name: protocol-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5358 (class 0 OID 176442)
-- Dependencies: 220
-- Data for Name: relationship; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5368 (class 0 OID 176639)
-- Dependencies: 230
-- Data for Name: survey; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5421 (class 0 OID 177408)
-- Dependencies: 283
-- Data for Name: survey-agent-role; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5422 (class 0 OID 177424)
-- Dependencies: 284
-- Data for Name: survey-assertion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5423 (class 0 OID 177441)
-- Dependencies: 285
-- Data for Name: survey-citation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5424 (class 0 OID 177453)
-- Dependencies: 286
-- Data for Name: survey-identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5425 (class 0 OID 177463)
-- Dependencies: 287
-- Data for Name: survey-protocol; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5369 (class 0 OID 176657)
-- Dependencies: 231
-- Data for Name: survey-target; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5018 (class 2606 OID 176406)
-- Name: agent agent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agent
    ADD CONSTRAINT agent_pkey PRIMARY KEY ("agentID");


--
-- TOC entry 5054 (class 2606 OID 176732)
-- Name: chronometric-age-assertion chronometric-age-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-assertion"
    ADD CONSTRAINT "chronometric-age-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- TOC entry 5056 (class 2606 OID 176749)
-- Name: chronometric-age-citation chronometric-age-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-citation"
    ADD CONSTRAINT "chronometric-age-citation_pkey" PRIMARY KEY ("citationID");


--
-- TOC entry 5034 (class 2606 OID 176513)
-- Name: chronometric-age chronometric-age_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age"
    ADD CONSTRAINT "chronometric-age_pkey" PRIMARY KEY ("chronometricAgeID");


--
-- TOC entry 5058 (class 2606 OID 176807)
-- Name: collection-assertion collection-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-assertion"
    ADD CONSTRAINT "collection-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- TOC entry 5020 (class 2606 OID 176413)
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY ("collectionID");


--
-- TOC entry 5060 (class 2606 OID 176855)
-- Name: event-assertion event-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-assertion"
    ADD CONSTRAINT "event-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- TOC entry 5062 (class 2606 OID 176872)
-- Name: event-citation event-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-citation"
    ADD CONSTRAINT "event-citation_pkey" PRIMARY KEY ("citationID");


--
-- TOC entry 5030 (class 2606 OID 176479)
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY ("eventID");


--
-- TOC entry 5064 (class 2606 OID 176940)
-- Name: genetic-sequence-assertion genetic-sequence-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-assertion"
    ADD CONSTRAINT "genetic-sequence-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- TOC entry 5066 (class 2606 OID 176957)
-- Name: genetic-sequence-citation genetic-sequence-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-citation"
    ADD CONSTRAINT "genetic-sequence-citation_pkey" PRIMARY KEY ("citationID");


--
-- TOC entry 5036 (class 2606 OID 176540)
-- Name: genetic-sequence genetic-sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence"
    ADD CONSTRAINT "genetic-sequence_pkey" PRIMARY KEY ("geneticSequenceID");


--
-- TOC entry 5068 (class 2606 OID 176999)
-- Name: geological-context-media geological-context-media_geologicalContextID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."geological-context-media"
    ADD CONSTRAINT "geological-context-media_geologicalContextID_key" UNIQUE ("geologicalContextID");


--
-- TOC entry 5038 (class 2606 OID 176552)
-- Name: geological-context geological-context_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."geological-context"
    ADD CONSTRAINT "geological-context_pkey" PRIMARY KEY ("geologicalContextID");


--
-- TOC entry 5040 (class 2606 OID 176564)
-- Name: identification identification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT identification_pkey PRIMARY KEY ("identificationID");


--
-- TOC entry 5070 (class 2606 OID 177059)
-- Name: material-assertion material-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-assertion"
    ADD CONSTRAINT "material-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- TOC entry 5072 (class 2606 OID 177076)
-- Name: material-citation material-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-citation"
    ADD CONSTRAINT "material-citation_pkey" PRIMARY KEY ("citationID");


--
-- TOC entry 5032 (class 2606 OID 176496)
-- Name: material material_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY ("materialEntityID");


--
-- TOC entry 5074 (class 2606 OID 177144)
-- Name: media-assertion media-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."media-assertion"
    ADD CONSTRAINT "media-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- TOC entry 5022 (class 2606 OID 176420)
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY ("mediaID");


--
-- TOC entry 5076 (class 2606 OID 177187)
-- Name: occurrence-assertion occurrence-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-assertion"
    ADD CONSTRAINT "occurrence-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- TOC entry 5078 (class 2606 OID 177204)
-- Name: occurrence-citation occurrence-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-citation"
    ADD CONSTRAINT "occurrence-citation_pkey" PRIMARY KEY ("citationID");


--
-- TOC entry 5024 (class 2606 OID 176427)
-- Name: occurrence occurrence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.occurrence
    ADD CONSTRAINT occurrence_pkey PRIMARY KEY ("occurrenceID");


--
-- TOC entry 5080 (class 2606 OID 177272)
-- Name: organism-interaction-assertion organism-interaction-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-assertion"
    ADD CONSTRAINT "organism-interaction-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- TOC entry 5082 (class 2606 OID 177289)
-- Name: organism-interaction-citation organism-interaction-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-citation"
    ADD CONSTRAINT "organism-interaction-citation_pkey" PRIMARY KEY ("citationID");


--
-- TOC entry 5042 (class 2606 OID 176602)
-- Name: organism-interaction organism-interaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction"
    ADD CONSTRAINT "organism-interaction_pkey" PRIMARY KEY ("organismInteractionID");


--
-- TOC entry 5084 (class 2606 OID 177316)
-- Name: phylogenetic-tree-assertion phylogenetic-tree-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-assertion"
    ADD CONSTRAINT "phylogenetic-tree-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- TOC entry 5086 (class 2606 OID 177333)
-- Name: phylogenetic-tree-citation phylogenetic-tree-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-citation"
    ADD CONSTRAINT "phylogenetic-tree-citation_pkey" PRIMARY KEY ("citationID");


--
-- TOC entry 5088 (class 2606 OID 177385)
-- Name: phylogenetic-tree-tip-assertion phylogenetic-tree-tip-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip-assertion"
    ADD CONSTRAINT "phylogenetic-tree-tip-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- TOC entry 5046 (class 2606 OID 176633)
-- Name: phylogenetic-tree-tip phylogenetic-tree-tip_geneticSequenceID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip"
    ADD CONSTRAINT "phylogenetic-tree-tip_geneticSequenceID_key" UNIQUE ("geneticSequenceID");


--
-- TOC entry 5048 (class 2606 OID 176631)
-- Name: phylogenetic-tree-tip phylogenetic-tree-tip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip"
    ADD CONSTRAINT "phylogenetic-tree-tip_pkey" PRIMARY KEY ("phylogeneticTreeTipID");


--
-- TOC entry 5044 (class 2606 OID 176624)
-- Name: phylogenetic-tree phylogenetic-tree_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree"
    ADD CONSTRAINT "phylogenetic-tree_pkey" PRIMARY KEY ("phylogeneticTreeID");


--
-- TOC entry 5090 (class 2606 OID 177402)
-- Name: protocol-citation protocol-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."protocol-citation"
    ADD CONSTRAINT "protocol-citation_pkey" PRIMARY KEY ("citationID");


--
-- TOC entry 5026 (class 2606 OID 176441)
-- Name: protocol protocol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol
    ADD CONSTRAINT protocol_pkey PRIMARY KEY ("protocolID");


--
-- TOC entry 5028 (class 2606 OID 176449)
-- Name: relationship relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relationship
    ADD CONSTRAINT relationship_pkey PRIMARY KEY ("relationshipID");


--
-- TOC entry 5092 (class 2606 OID 177430)
-- Name: survey-assertion survey-assertion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-assertion"
    ADD CONSTRAINT "survey-assertion_pkey" PRIMARY KEY ("assertionID");


--
-- TOC entry 5094 (class 2606 OID 177447)
-- Name: survey-citation survey-citation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-citation"
    ADD CONSTRAINT "survey-citation_pkey" PRIMARY KEY ("citationID");


--
-- TOC entry 5052 (class 2606 OID 176663)
-- Name: survey-target survey-target_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-target"
    ADD CONSTRAINT "survey-target_pkey" PRIMARY KEY ("surveyTargetID");


--
-- TOC entry 5050 (class 2606 OID 176651)
-- Name: survey survey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey
    ADD CONSTRAINT survey_pkey PRIMARY KEY ("surveyID");


--
-- TOC entry 5115 (class 2606 OID 176675)
-- Name: agent-agent-role agent-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."agent-agent-role"
    ADD CONSTRAINT "agent-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5116 (class 2606 OID 176680)
-- Name: agent-agent-role agent-agent-role_relatedAgentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."agent-agent-role"
    ADD CONSTRAINT "agent-agent-role_relatedAgentID_fkey" FOREIGN KEY ("relatedAgentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5117 (class 2606 OID 176690)
-- Name: agent-identifier agent-identifier_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."agent-identifier"
    ADD CONSTRAINT "agent-identifier_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5118 (class 2606 OID 176705)
-- Name: agent-media agent-media_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."agent-media"
    ADD CONSTRAINT "agent-media_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5119 (class 2606 OID 176700)
-- Name: agent-media agent-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."agent-media"
    ADD CONSTRAINT "agent-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5120 (class 2606 OID 176716)
-- Name: chronometric-age-agent-role chronometric-age-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-agent-role"
    ADD CONSTRAINT "chronometric-age-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5121 (class 2606 OID 176721)
-- Name: chronometric-age-agent-role chronometric-age-agent-role_chronometricAgeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-agent-role"
    ADD CONSTRAINT "chronometric-age-agent-role_chronometricAgeID_fkey" FOREIGN KEY ("chronometricAgeID") REFERENCES public."chronometric-age"("chronometricAgeID");


--
-- TOC entry 5122 (class 2606 OID 176738)
-- Name: chronometric-age-assertion chronometric-age-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-assertion"
    ADD CONSTRAINT "chronometric-age-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5123 (class 2606 OID 176733)
-- Name: chronometric-age-assertion chronometric-age-assertion_chronometricAgeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-assertion"
    ADD CONSTRAINT "chronometric-age-assertion_chronometricAgeID_fkey" FOREIGN KEY ("chronometricAgeID") REFERENCES public."chronometric-age"("chronometricAgeID");


--
-- TOC entry 5124 (class 2606 OID 176750)
-- Name: chronometric-age-citation chronometric-age-citation_chronometricAgeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-citation"
    ADD CONSTRAINT "chronometric-age-citation_chronometricAgeID_fkey" FOREIGN KEY ("chronometricAgeID") REFERENCES public."chronometric-age"("chronometricAgeID");


--
-- TOC entry 5125 (class 2606 OID 176765)
-- Name: chronometric-age-media chronometric-age-media_chronometricAgeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-media"
    ADD CONSTRAINT "chronometric-age-media_chronometricAgeID_fkey" FOREIGN KEY ("chronometricAgeID") REFERENCES public."chronometric-age"("chronometricAgeID");


--
-- TOC entry 5126 (class 2606 OID 176760)
-- Name: chronometric-age-media chronometric-age-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-media"
    ADD CONSTRAINT "chronometric-age-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5127 (class 2606 OID 176780)
-- Name: chronometric-age-protocol chronometric-age-protocol_chronometricAgeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-protocol"
    ADD CONSTRAINT "chronometric-age-protocol_chronometricAgeID_fkey" FOREIGN KEY ("chronometricAgeID") REFERENCES public."chronometric-age"("chronometricAgeID");


--
-- TOC entry 5128 (class 2606 OID 176775)
-- Name: chronometric-age-protocol chronometric-age-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age-protocol"
    ADD CONSTRAINT "chronometric-age-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5099 (class 2606 OID 176529)
-- Name: chronometric-age chronometric-age_chronometricAgeConversionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age"
    ADD CONSTRAINT "chronometric-age_chronometricAgeConversionProtocolID_fkey" FOREIGN KEY ("chronometricAgeConversionProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5100 (class 2606 OID 176524)
-- Name: chronometric-age chronometric-age_chronometricAgeProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age"
    ADD CONSTRAINT "chronometric-age_chronometricAgeProtocolID_fkey" FOREIGN KEY ("chronometricAgeProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5101 (class 2606 OID 176514)
-- Name: chronometric-age chronometric-age_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age"
    ADD CONSTRAINT "chronometric-age_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- TOC entry 5102 (class 2606 OID 176519)
-- Name: chronometric-age chronometric-age_materialDatedID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."chronometric-age"
    ADD CONSTRAINT "chronometric-age_materialDatedID_fkey" FOREIGN KEY ("materialDatedID") REFERENCES public.material("materialEntityID");


--
-- TOC entry 5129 (class 2606 OID 176791)
-- Name: collection-agent-role collection-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-agent-role"
    ADD CONSTRAINT "collection-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5130 (class 2606 OID 176796)
-- Name: collection-agent-role collection-agent-role_collectionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-agent-role"
    ADD CONSTRAINT "collection-agent-role_collectionID_fkey" FOREIGN KEY ("collectionID") REFERENCES public.collection("collectionID");


--
-- TOC entry 5131 (class 2606 OID 176813)
-- Name: collection-assertion collection-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-assertion"
    ADD CONSTRAINT "collection-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5132 (class 2606 OID 176808)
-- Name: collection-assertion collection-assertion_collectionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-assertion"
    ADD CONSTRAINT "collection-assertion_collectionID_fkey" FOREIGN KEY ("collectionID") REFERENCES public.collection("collectionID");


--
-- TOC entry 5133 (class 2606 OID 176828)
-- Name: collection-media collection-media_collectionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-media"
    ADD CONSTRAINT "collection-media_collectionID_fkey" FOREIGN KEY ("collectionID") REFERENCES public.collection("collectionID");


--
-- TOC entry 5134 (class 2606 OID 176823)
-- Name: collection-media collection-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."collection-media"
    ADD CONSTRAINT "collection-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5135 (class 2606 OID 176839)
-- Name: event-agent-role event-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-agent-role"
    ADD CONSTRAINT "event-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5136 (class 2606 OID 176844)
-- Name: event-agent-role event-agent-role_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-agent-role"
    ADD CONSTRAINT "event-agent-role_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- TOC entry 5137 (class 2606 OID 176861)
-- Name: event-assertion event-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-assertion"
    ADD CONSTRAINT "event-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5138 (class 2606 OID 176856)
-- Name: event-assertion event-assertion_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-assertion"
    ADD CONSTRAINT "event-assertion_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- TOC entry 5139 (class 2606 OID 176873)
-- Name: event-citation event-citation_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-citation"
    ADD CONSTRAINT "event-citation_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- TOC entry 5140 (class 2606 OID 176883)
-- Name: event-identifier event-identifier_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-identifier"
    ADD CONSTRAINT "event-identifier_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- TOC entry 5141 (class 2606 OID 176898)
-- Name: event-media event-media_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-media"
    ADD CONSTRAINT "event-media_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- TOC entry 5142 (class 2606 OID 176893)
-- Name: event-media event-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-media"
    ADD CONSTRAINT "event-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5143 (class 2606 OID 176913)
-- Name: event-protocol event-protocol_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-protocol"
    ADD CONSTRAINT "event-protocol_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- TOC entry 5144 (class 2606 OID 176908)
-- Name: event-protocol event-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."event-protocol"
    ADD CONSTRAINT "event-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5095 (class 2606 OID 176485)
-- Name: event event_georeferenceProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT "event_georeferenceProtocolID_fkey" FOREIGN KEY ("georeferenceProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5096 (class 2606 OID 176480)
-- Name: event event_parentEventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT "event_parentEventID_fkey" FOREIGN KEY ("parentEventID") REFERENCES public.event("eventID");


--
-- TOC entry 5145 (class 2606 OID 176924)
-- Name: genetic-sequence-agent-role genetic-sequence-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-agent-role"
    ADD CONSTRAINT "genetic-sequence-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5146 (class 2606 OID 176929)
-- Name: genetic-sequence-agent-role genetic-sequence-agent-role_geneticSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-agent-role"
    ADD CONSTRAINT "genetic-sequence-agent-role_geneticSequenceID_fkey" FOREIGN KEY ("geneticSequenceID") REFERENCES public."genetic-sequence"("geneticSequenceID");


--
-- TOC entry 5147 (class 2606 OID 176946)
-- Name: genetic-sequence-assertion genetic-sequence-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-assertion"
    ADD CONSTRAINT "genetic-sequence-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5148 (class 2606 OID 176941)
-- Name: genetic-sequence-assertion genetic-sequence-assertion_geneticSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-assertion"
    ADD CONSTRAINT "genetic-sequence-assertion_geneticSequenceID_fkey" FOREIGN KEY ("geneticSequenceID") REFERENCES public."genetic-sequence"("geneticSequenceID");


--
-- TOC entry 5149 (class 2606 OID 176958)
-- Name: genetic-sequence-citation genetic-sequence-citation_geneticSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-citation"
    ADD CONSTRAINT "genetic-sequence-citation_geneticSequenceID_fkey" FOREIGN KEY ("geneticSequenceID") REFERENCES public."genetic-sequence"("geneticSequenceID");


--
-- TOC entry 5150 (class 2606 OID 176973)
-- Name: genetic-sequence-media genetic-sequence-media_geneticSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-media"
    ADD CONSTRAINT "genetic-sequence-media_geneticSequenceID_fkey" FOREIGN KEY ("geneticSequenceID") REFERENCES public."genetic-sequence"("geneticSequenceID");


--
-- TOC entry 5151 (class 2606 OID 176968)
-- Name: genetic-sequence-media genetic-sequence-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-media"
    ADD CONSTRAINT "genetic-sequence-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5152 (class 2606 OID 176988)
-- Name: genetic-sequence-protocol genetic-sequence-protocol_geneticSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-protocol"
    ADD CONSTRAINT "genetic-sequence-protocol_geneticSequenceID_fkey" FOREIGN KEY ("geneticSequenceID") REFERENCES public."genetic-sequence"("geneticSequenceID");


--
-- TOC entry 5153 (class 2606 OID 176983)
-- Name: genetic-sequence-protocol genetic-sequence-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence-protocol"
    ADD CONSTRAINT "genetic-sequence-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5103 (class 2606 OID 176541)
-- Name: genetic-sequence genetic-sequence_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."genetic-sequence"
    ADD CONSTRAINT "genetic-sequence_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- TOC entry 5154 (class 2606 OID 177005)
-- Name: geological-context-media geological-context-media_geologicalContextID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."geological-context-media"
    ADD CONSTRAINT "geological-context-media_geologicalContextID_fkey" FOREIGN KEY ("geologicalContextID") REFERENCES public."geological-context"("geologicalContextID");


--
-- TOC entry 5155 (class 2606 OID 177000)
-- Name: geological-context-media geological-context-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."geological-context-media"
    ADD CONSTRAINT "geological-context-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5104 (class 2606 OID 176553)
-- Name: geological-context geological-context_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."geological-context"
    ADD CONSTRAINT "geological-context_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- TOC entry 5156 (class 2606 OID 177016)
-- Name: identification-agent-role identification-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."identification-agent-role"
    ADD CONSTRAINT "identification-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5157 (class 2606 OID 177021)
-- Name: identification-agent-role identification-agent-role_identificationID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."identification-agent-role"
    ADD CONSTRAINT "identification-agent-role_identificationID_fkey" FOREIGN KEY ("identificationID") REFERENCES public.identification("identificationID");


--
-- TOC entry 5158 (class 2606 OID 177032)
-- Name: identification-taxon identification-taxon_identificationID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."identification-taxon"
    ADD CONSTRAINT "identification-taxon_identificationID_fkey" FOREIGN KEY ("identificationID") REFERENCES public.identification("identificationID");


--
-- TOC entry 5105 (class 2606 OID 176575)
-- Name: identification identification_identificationBasedOnGeneticSequenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT "identification_identificationBasedOnGeneticSequenceID_fkey" FOREIGN KEY ("identificationBasedOnGeneticSequenceID") REFERENCES public."genetic-sequence"("geneticSequenceID");


--
-- TOC entry 5106 (class 2606 OID 176570)
-- Name: identification identification_identificationBasedOnMaterialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT "identification_identificationBasedOnMaterialEntityID_fkey" FOREIGN KEY ("identificationBasedOnMaterialEntityID") REFERENCES public.material("materialEntityID");


--
-- TOC entry 5107 (class 2606 OID 176580)
-- Name: identification identification_identificationBasedOnMediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT "identification_identificationBasedOnMediaID_fkey" FOREIGN KEY ("identificationBasedOnMediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5108 (class 2606 OID 176565)
-- Name: identification identification_identificationBasedOnOccurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identification
    ADD CONSTRAINT "identification_identificationBasedOnOccurrenceID_fkey" FOREIGN KEY ("identificationBasedOnOccurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- TOC entry 5159 (class 2606 OID 177043)
-- Name: material-agent-role material-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-agent-role"
    ADD CONSTRAINT "material-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5160 (class 2606 OID 177048)
-- Name: material-agent-role material-agent-role_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-agent-role"
    ADD CONSTRAINT "material-agent-role_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- TOC entry 5161 (class 2606 OID 177065)
-- Name: material-assertion material-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-assertion"
    ADD CONSTRAINT "material-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5162 (class 2606 OID 177060)
-- Name: material-assertion material-assertion_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-assertion"
    ADD CONSTRAINT "material-assertion_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- TOC entry 5163 (class 2606 OID 177077)
-- Name: material-citation material-citation_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-citation"
    ADD CONSTRAINT "material-citation_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- TOC entry 5164 (class 2606 OID 177087)
-- Name: material-identifier material-identifier_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-identifier"
    ADD CONSTRAINT "material-identifier_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- TOC entry 5165 (class 2606 OID 177102)
-- Name: material-media material-media_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-media"
    ADD CONSTRAINT "material-media_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- TOC entry 5166 (class 2606 OID 177097)
-- Name: material-media material-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-media"
    ADD CONSTRAINT "material-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5167 (class 2606 OID 177117)
-- Name: material-protocol material-protocol_materialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-protocol"
    ADD CONSTRAINT "material-protocol_materialEntityID_fkey" FOREIGN KEY ("materialEntityID") REFERENCES public.material("materialEntityID");


--
-- TOC entry 5168 (class 2606 OID 177112)
-- Name: material-protocol material-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."material-protocol"
    ADD CONSTRAINT "material-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5097 (class 2606 OID 176497)
-- Name: material material_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT "material_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- TOC entry 5098 (class 2606 OID 176502)
-- Name: material material_partOfMaterialEntityID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.material
    ADD CONSTRAINT "material_partOfMaterialEntityID_fkey" FOREIGN KEY ("partOfMaterialEntityID") REFERENCES public.material("materialEntityID");


--
-- TOC entry 5169 (class 2606 OID 177128)
-- Name: media-agent-role media-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."media-agent-role"
    ADD CONSTRAINT "media-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5170 (class 2606 OID 177133)
-- Name: media-agent-role media-agent-role_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."media-agent-role"
    ADD CONSTRAINT "media-agent-role_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5171 (class 2606 OID 177150)
-- Name: media-assertion media-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."media-assertion"
    ADD CONSTRAINT "media-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5172 (class 2606 OID 177145)
-- Name: media-assertion media-assertion_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."media-assertion"
    ADD CONSTRAINT "media-assertion_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5173 (class 2606 OID 177160)
-- Name: media-identifier media-identifier_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."media-identifier"
    ADD CONSTRAINT "media-identifier_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5174 (class 2606 OID 177171)
-- Name: occurrence-agent-role occurrence-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-agent-role"
    ADD CONSTRAINT "occurrence-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5175 (class 2606 OID 177176)
-- Name: occurrence-agent-role occurrence-agent-role_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-agent-role"
    ADD CONSTRAINT "occurrence-agent-role_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- TOC entry 5176 (class 2606 OID 177193)
-- Name: occurrence-assertion occurrence-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-assertion"
    ADD CONSTRAINT "occurrence-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5177 (class 2606 OID 177188)
-- Name: occurrence-assertion occurrence-assertion_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-assertion"
    ADD CONSTRAINT "occurrence-assertion_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- TOC entry 5178 (class 2606 OID 177205)
-- Name: occurrence-citation occurrence-citation_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-citation"
    ADD CONSTRAINT "occurrence-citation_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- TOC entry 5179 (class 2606 OID 177215)
-- Name: occurrence-identifier occurrence-identifier_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-identifier"
    ADD CONSTRAINT "occurrence-identifier_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- TOC entry 5180 (class 2606 OID 177225)
-- Name: occurrence-media occurrence-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-media"
    ADD CONSTRAINT "occurrence-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5181 (class 2606 OID 177230)
-- Name: occurrence-media occurrence-media_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-media"
    ADD CONSTRAINT "occurrence-media_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- TOC entry 5182 (class 2606 OID 177245)
-- Name: occurrence-protocol occurrence-protocol_occurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-protocol"
    ADD CONSTRAINT "occurrence-protocol_occurrenceID_fkey" FOREIGN KEY ("occurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- TOC entry 5183 (class 2606 OID 177240)
-- Name: occurrence-protocol occurrence-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."occurrence-protocol"
    ADD CONSTRAINT "occurrence-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5184 (class 2606 OID 177256)
-- Name: organism-interaction-agent-role organism-interaction-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-agent-role"
    ADD CONSTRAINT "organism-interaction-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5185 (class 2606 OID 177261)
-- Name: organism-interaction-agent-role organism-interaction-agent-role_organismInteractionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-agent-role"
    ADD CONSTRAINT "organism-interaction-agent-role_organismInteractionID_fkey" FOREIGN KEY ("organismInteractionID") REFERENCES public."organism-interaction"("organismInteractionID");


--
-- TOC entry 5186 (class 2606 OID 177278)
-- Name: organism-interaction-assertion organism-interaction-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-assertion"
    ADD CONSTRAINT "organism-interaction-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5187 (class 2606 OID 177273)
-- Name: organism-interaction-assertion organism-interaction-assertion_organismInteractionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-assertion"
    ADD CONSTRAINT "organism-interaction-assertion_organismInteractionID_fkey" FOREIGN KEY ("organismInteractionID") REFERENCES public."organism-interaction"("organismInteractionID");


--
-- TOC entry 5188 (class 2606 OID 177290)
-- Name: organism-interaction-citation organism-interaction-citation_organismInteractionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-citation"
    ADD CONSTRAINT "organism-interaction-citation_organismInteractionID_fkey" FOREIGN KEY ("organismInteractionID") REFERENCES public."organism-interaction"("organismInteractionID");


--
-- TOC entry 5189 (class 2606 OID 177300)
-- Name: organism-interaction-media organism-interaction-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-media"
    ADD CONSTRAINT "organism-interaction-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5190 (class 2606 OID 177305)
-- Name: organism-interaction-media organism-interaction-media_organismInteractionID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction-media"
    ADD CONSTRAINT "organism-interaction-media_organismInteractionID_fkey" FOREIGN KEY ("organismInteractionID") REFERENCES public."organism-interaction"("organismInteractionID");


--
-- TOC entry 5109 (class 2606 OID 176603)
-- Name: organism-interaction organism-interaction_eventID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction"
    ADD CONSTRAINT "organism-interaction_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES public.event("eventID");


--
-- TOC entry 5110 (class 2606 OID 176613)
-- Name: organism-interaction organism-interaction_relatedOccurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction"
    ADD CONSTRAINT "organism-interaction_relatedOccurrenceID_fkey" FOREIGN KEY ("relatedOccurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- TOC entry 5111 (class 2606 OID 176608)
-- Name: organism-interaction organism-interaction_subjectOccurrenceID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."organism-interaction"
    ADD CONSTRAINT "organism-interaction_subjectOccurrenceID_fkey" FOREIGN KEY ("subjectOccurrenceID") REFERENCES public.occurrence("occurrenceID");


--
-- TOC entry 5191 (class 2606 OID 177322)
-- Name: phylogenetic-tree-assertion phylogenetic-tree-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-assertion"
    ADD CONSTRAINT "phylogenetic-tree-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5192 (class 2606 OID 177317)
-- Name: phylogenetic-tree-assertion phylogenetic-tree-assertion_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-assertion"
    ADD CONSTRAINT "phylogenetic-tree-assertion_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


--
-- TOC entry 5193 (class 2606 OID 177334)
-- Name: phylogenetic-tree-citation phylogenetic-tree-citation_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-citation"
    ADD CONSTRAINT "phylogenetic-tree-citation_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


--
-- TOC entry 5194 (class 2606 OID 177344)
-- Name: phylogenetic-tree-identifier phylogenetic-tree-identifier_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-identifier"
    ADD CONSTRAINT "phylogenetic-tree-identifier_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


--
-- TOC entry 5195 (class 2606 OID 177354)
-- Name: phylogenetic-tree-media phylogenetic-tree-media_mediaID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-media"
    ADD CONSTRAINT "phylogenetic-tree-media_mediaID_fkey" FOREIGN KEY ("mediaID") REFERENCES public.media("mediaID");


--
-- TOC entry 5196 (class 2606 OID 177359)
-- Name: phylogenetic-tree-media phylogenetic-tree-media_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-media"
    ADD CONSTRAINT "phylogenetic-tree-media_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


--
-- TOC entry 5197 (class 2606 OID 177374)
-- Name: phylogenetic-tree-protocol phylogenetic-tree-protocol_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-protocol"
    ADD CONSTRAINT "phylogenetic-tree-protocol_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


--
-- TOC entry 5198 (class 2606 OID 177369)
-- Name: phylogenetic-tree-protocol phylogenetic-tree-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-protocol"
    ADD CONSTRAINT "phylogenetic-tree-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5199 (class 2606 OID 177391)
-- Name: phylogenetic-tree-tip-assertion phylogenetic-tree-tip-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip-assertion"
    ADD CONSTRAINT "phylogenetic-tree-tip-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5200 (class 2606 OID 177386)
-- Name: phylogenetic-tree-tip-assertion phylogenetic-tree-tip-assertion_phylogeneticTreeTipID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip-assertion"
    ADD CONSTRAINT "phylogenetic-tree-tip-assertion_phylogeneticTreeTipID_fkey" FOREIGN KEY ("phylogeneticTreeTipID") REFERENCES public."phylogenetic-tree-tip"("phylogeneticTreeTipID");


--
-- TOC entry 5112 (class 2606 OID 176634)
-- Name: phylogenetic-tree-tip phylogenetic-tree-tip_phylogeneticTreeID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."phylogenetic-tree-tip"
    ADD CONSTRAINT "phylogenetic-tree-tip_phylogeneticTreeID_fkey" FOREIGN KEY ("phylogeneticTreeID") REFERENCES public."phylogenetic-tree"("phylogeneticTreeID");


--
-- TOC entry 5201 (class 2606 OID 177403)
-- Name: protocol-citation protocol-citation_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."protocol-citation"
    ADD CONSTRAINT "protocol-citation_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5202 (class 2606 OID 177414)
-- Name: survey-agent-role survey-agent-role_agentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-agent-role"
    ADD CONSTRAINT "survey-agent-role_agentID_fkey" FOREIGN KEY ("agentID") REFERENCES public.agent("agentID");


--
-- TOC entry 5203 (class 2606 OID 177419)
-- Name: survey-agent-role survey-agent-role_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-agent-role"
    ADD CONSTRAINT "survey-agent-role_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


--
-- TOC entry 5204 (class 2606 OID 177436)
-- Name: survey-assertion survey-assertion_assertionProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-assertion"
    ADD CONSTRAINT "survey-assertion_assertionProtocolID_fkey" FOREIGN KEY ("assertionProtocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5205 (class 2606 OID 177431)
-- Name: survey-assertion survey-assertion_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-assertion"
    ADD CONSTRAINT "survey-assertion_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


--
-- TOC entry 5206 (class 2606 OID 177448)
-- Name: survey-citation survey-citation_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-citation"
    ADD CONSTRAINT "survey-citation_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


--
-- TOC entry 5207 (class 2606 OID 177458)
-- Name: survey-identifier survey-identifier_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-identifier"
    ADD CONSTRAINT "survey-identifier_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


--
-- TOC entry 5208 (class 2606 OID 177468)
-- Name: survey-protocol survey-protocol_protocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-protocol"
    ADD CONSTRAINT "survey-protocol_protocolID_fkey" FOREIGN KEY ("protocolID") REFERENCES public.protocol("protocolID");


--
-- TOC entry 5209 (class 2606 OID 177473)
-- Name: survey-protocol survey-protocol_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-protocol"
    ADD CONSTRAINT "survey-protocol_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


--
-- TOC entry 5114 (class 2606 OID 176664)
-- Name: survey-target survey-target_surveyID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."survey-target"
    ADD CONSTRAINT "survey-target_surveyID_fkey" FOREIGN KEY ("surveyID") REFERENCES public.survey("surveyID");


--
-- TOC entry 5113 (class 2606 OID 176652)
-- Name: survey survey_samplingEffortProtocolID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey
    ADD CONSTRAINT "survey_samplingEffortProtocolID_fkey" FOREIGN KEY ("samplingEffortProtocolID") REFERENCES public.protocol("protocolID");


-- Completed on 2025-03-26 14:23:24

--
-- PostgreSQL database dump complete
--

