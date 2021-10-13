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

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: action_mailbox_inbound_emails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.action_mailbox_inbound_emails (
    id bigint NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    message_id character varying NOT NULL,
    message_checksum character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: action_mailbox_inbound_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.action_mailbox_inbound_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: action_mailbox_inbound_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.action_mailbox_inbound_emails_id_seq OWNED BY public.action_mailbox_inbound_emails.id;


--
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    service_name character varying
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint,
    variation_digest character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: agential_agencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agential_agencies (
    id bigint NOT NULL,
    relation character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    client_id bigint,
    agent_id bigint,
    commission_ratio numeric(4,2),
    note character varying
);


--
-- Name: COLUMN agential_agencies.commission_ratio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.agential_agencies.commission_ratio IS '交易时抽成比例';


--
-- Name: COLUMN agential_agencies.note; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.agential_agencies.note IS '备注';


--
-- Name: agential_agencies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.agential_agencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: agential_agencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.agential_agencies_id_seq OWNED BY public.agential_agencies.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attend_absence_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attend_absence_stats (
    id bigint NOT NULL,
    year character varying,
    annual_days double precision,
    annual_add double precision,
    left_annual_days double precision,
    vacation_days double precision,
    details character varying(1024),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    member_id bigint
);


--
-- Name: attend_absence_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attend_absence_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attend_absence_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attend_absence_stats_id_seq OWNED BY public.attend_absence_stats.id;


--
-- Name: attend_absences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attend_absences (
    id bigint NOT NULL,
    member_id bigint,
    merged_id bigint,
    type character varying,
    state character varying DEFAULT 'init'::character varying,
    hours double precision DEFAULT 0.0,
    kind character varying,
    start_at timestamp without time zone,
    finish_at timestamp without time zone,
    note character varying(2048),
    comment character varying(2048),
    redeeming boolean,
    redeeming_days character varying[],
    processed boolean,
    divided boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: attend_absences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attend_absences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attend_absences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attend_absences_id_seq OWNED BY public.attend_absences.id;


--
-- Name: attend_attendance_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attend_attendance_logs (
    id bigint NOT NULL,
    member_id bigint,
    attendance_id bigint,
    source character varying DEFAULT 'machine'::character varying,
    state character varying DEFAULT 'init'::character varying,
    name character varying,
    record_at timestamp without time zone,
    processed boolean,
    kind character varying,
    note character varying,
    record_at_str character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    number character varying
);


--
-- Name: attend_attendance_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attend_attendance_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attend_attendance_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attend_attendance_logs_id_seq OWNED BY public.attend_attendance_logs.id;


--
-- Name: attend_attendance_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attend_attendance_settings (
    id bigint NOT NULL,
    member_id bigint,
    state character varying DEFAULT 'init'::character varying,
    on_time character varying DEFAULT '08:30'::character varying,
    off_time character varying,
    note character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    effect_on date,
    expire_on date
);


--
-- Name: attend_attendance_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attend_attendance_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attend_attendance_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attend_attendance_settings_id_seq OWNED BY public.attend_attendance_settings.id;


--
-- Name: attend_attendance_stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attend_attendance_stats (
    id bigint NOT NULL,
    member_id bigint,
    financial_month_id bigint,
    costed_absence character varying(1024),
    redeeming_absence character varying(1024),
    free_absence character varying(1024),
    allowance_days integer,
    late_days integer,
    absence_redeeming_hours double precision,
    cost_absence_hours double precision,
    holiday_redeeming_hours double precision,
    processed boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: attend_attendance_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attend_attendance_stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attend_attendance_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attend_attendance_stats_id_seq OWNED BY public.attend_attendance_stats.id;


--
-- Name: attend_attendances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attend_attendances (
    id bigint NOT NULL,
    member_id bigint,
    interval_absence_id bigint,
    late_absence_id bigint,
    leave_absence_id bigint,
    late_minutes integer,
    leave_minutes integer,
    overtime_hours double precision,
    attend_hours double precision,
    interval_hours double precision,
    total_hours double precision,
    attend_on date,
    start_at timestamp without time zone,
    finish_at timestamp without time zone,
    interval_start_at timestamp without time zone,
    interval_finish_at timestamp without time zone,
    kind character varying,
    absence_minutes integer,
    absence_redeeming boolean,
    lost_logs character varying[],
    workday boolean DEFAULT true,
    processed boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: attend_attendances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attend_attendances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attend_attendances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attend_attendances_id_seq OWNED BY public.attend_attendances.id;


--
-- Name: attend_extra_days; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attend_extra_days (
    id bigint NOT NULL,
    organ_id bigint,
    the_day date,
    name character varying,
    kind character varying,
    scope character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: COLUMN attend_extra_days.kind; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.attend_extra_days.kind IS 'holiday, workday';


--
-- Name: attend_extra_days_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attend_extra_days_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attend_extra_days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attend_extra_days_id_seq OWNED BY public.attend_extra_days.id;


--
-- Name: attend_financial_months; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attend_financial_months (
    id bigint NOT NULL,
    organ_id bigint,
    begin_date date,
    end_date date,
    working_days character varying,
    color character varying DEFAULT '#8fdf82'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: attend_financial_months_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attend_financial_months_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attend_financial_months_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attend_financial_months_id_seq OWNED BY public.attend_financial_months.id;


--
-- Name: attend_overtimes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attend_overtimes (
    id bigint NOT NULL,
    member_id bigint,
    start_at timestamp without time zone,
    finish_at timestamp without time zone,
    note character varying(1024),
    comment character varying(1024),
    hours double precision,
    state character varying DEFAULT 'init'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: attend_overtimes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attend_overtimes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attend_overtimes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attend_overtimes_id_seq OWNED BY public.attend_overtimes.id;


--
-- Name: auditor_approvals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auditor_approvals (
    id bigint NOT NULL,
    approving_type character varying,
    approving_id bigint,
    operator_type character varying,
    operator_id bigint,
    state character varying DEFAULT 'init'::character varying,
    approved boolean,
    pending_changes json DEFAULT '{}'::json,
    related_changes json DEFAULT '{}'::json,
    comment character varying,
    approved_at timestamp without time zone,
    unapproved_approvals_count integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: auditor_approvals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auditor_approvals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auditor_approvals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auditor_approvals_id_seq OWNED BY public.auditor_approvals.id;


--
-- Name: auditor_audits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auditor_audits (
    id bigint NOT NULL,
    audited_type character varying,
    audited_id bigint,
    operator_type character varying,
    operator_id bigint,
    action character varying DEFAULT 'update'::character varying,
    audited_changes json DEFAULT '{}'::json,
    related_changes json DEFAULT '{}'::json,
    extra json DEFAULT '{}'::json,
    note character varying(1024),
    remote_ip character varying,
    controller_path character varying,
    action_name character varying,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: auditor_audits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auditor_audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auditor_audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auditor_audits_id_seq OWNED BY public.auditor_audits.id;


--
-- Name: auditor_verifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auditor_verifications (
    id bigint NOT NULL,
    verified_type character varying,
    verified_id bigint,
    verifier_id bigint,
    member_id bigint,
    job_title_id bigint,
    state character varying,
    note character varying,
    "position" integer,
    confirmed boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: auditor_verifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auditor_verifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auditor_verifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auditor_verifications_id_seq OWNED BY public.auditor_verifications.id;


--
-- Name: auditor_verifiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auditor_verifiers (
    id bigint NOT NULL,
    verifiable_type character varying,
    verifiable_id bigint,
    member_id bigint,
    job_title_id bigint,
    name character varying,
    "position" integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: auditor_verifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auditor_verifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auditor_verifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auditor_verifiers_id_seq OWNED BY public.auditor_verifiers.id;


--
-- Name: auth_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_accounts (
    id bigint NOT NULL,
    user_id bigint,
    type character varying,
    identity character varying,
    confirmed boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    source character varying
);


--
-- Name: auth_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_accounts_id_seq OWNED BY public.auth_accounts.id;


--
-- Name: auth_apps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_apps (
    id bigint NOT NULL,
    appid character varying,
    jwt_key character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: auth_apps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_apps_id_seq OWNED BY public.auth_apps.id;


--
-- Name: auth_authorized_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_authorized_tokens (
    id bigint NOT NULL,
    token character varying,
    expire_at timestamp without time zone,
    session_key character varying,
    access_counter integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    mock_member boolean,
    mock_user boolean,
    identity character varying,
    business character varying,
    appid character varying,
    uid character varying
);


--
-- Name: auth_authorized_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_authorized_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_authorized_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_authorized_tokens_id_seq OWNED BY public.auth_authorized_tokens.id;


--
-- Name: auth_oauth_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_oauth_users (
    id bigint NOT NULL,
    provider character varying,
    uid character varying,
    name character varying,
    avatar_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying,
    access_token character varying,
    refresh_token character varying,
    unionid character varying,
    appid character varying,
    expires_at timestamp without time zone,
    state character varying,
    extra json DEFAULT '{}'::json,
    identity character varying,
    user_inviter_id bigint,
    member_inviter_id bigint,
    remark character varying
);


--
-- Name: auth_oauth_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_oauth_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_oauth_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_oauth_users_id_seq OWNED BY public.auth_oauth_users.id;


--
-- Name: auth_user_taggeds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_taggeds (
    id bigint NOT NULL,
    user_tag_id bigint,
    user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: auth_user_taggeds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_taggeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_taggeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_taggeds_id_seq OWNED BY public.auth_user_taggeds.id;


--
-- Name: auth_user_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_tags (
    id bigint NOT NULL,
    organ_id bigint,
    name character varying,
    user_taggeds_count integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_tagging_type character varying,
    user_tagging_id bigint
);


--
-- Name: auth_user_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_tags_id_seq OWNED BY public.auth_user_tags.id;


--
-- Name: auth_verify_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_verify_tokens (
    id bigint NOT NULL,
    type character varying(100),
    token character varying,
    expire_at timestamp without time zone,
    identity character varying,
    access_counter integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: auth_verify_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_verify_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_verify_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_verify_tokens_id_seq OWNED BY public.auth_verify_tokens.id;


--
-- Name: bench_facilitate_indicators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_facilitate_indicators (
    id bigint NOT NULL,
    facilitate_id bigint,
    facilitate_taxon_id bigint,
    indicator_id bigint,
    note character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bench_facilitate_indicators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_facilitate_indicators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_facilitate_indicators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_facilitate_indicators_id_seq OWNED BY public.bench_facilitate_indicators.id;


--
-- Name: bench_facilitate_providers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_facilitate_providers (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    facilitate_id bigint,
    provider_id bigint,
    selected boolean,
    note character varying,
    export_price numeric
);


--
-- Name: bench_facilitate_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_facilitate_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_facilitate_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_facilitate_providers_id_seq OWNED BY public.bench_facilitate_providers.id;


--
-- Name: bench_facilitate_taxon_hierarchies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_facilitate_taxon_hierarchies (
    id bigint NOT NULL,
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bench_facilitate_taxon_hierarchies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_facilitate_taxon_hierarchies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_facilitate_taxon_hierarchies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_facilitate_taxon_hierarchies_id_seq OWNED BY public.bench_facilitate_taxon_hierarchies.id;


--
-- Name: bench_facilitate_taxons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_facilitate_taxons (
    id bigint NOT NULL,
    name character varying,
    "position" integer DEFAULT 0,
    facilitates_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    parent_id bigint,
    parent_ancestors json,
    organ_id bigint,
    project_taxon_id bigint,
    color character varying,
    description character varying,
    indicators_count integer DEFAULT 0
);


--
-- Name: bench_facilitate_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_facilitate_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_facilitate_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_facilitate_taxons_id_seq OWNED BY public.bench_facilitate_taxons.id;


--
-- Name: bench_facilitates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_facilitates (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    facilitate_taxon_id bigint,
    price numeric(10,2),
    sku character varying,
    qr_prefix character varying,
    quantity numeric,
    unit character varying,
    published boolean DEFAULT true,
    advance_price numeric DEFAULT 0.0,
    extra json DEFAULT '{}'::json,
    unified_quantity numeric DEFAULT 1,
    organ_id bigint,
    import_price numeric DEFAULT 0.0,
    profit_price numeric DEFAULT 0.0
);


--
-- Name: bench_facilitates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_facilitates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_facilitates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_facilitates_id_seq OWNED BY public.bench_facilitates.id;


--
-- Name: bench_indicators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_indicators (
    id bigint NOT NULL,
    organ_id bigint,
    name character varying,
    description character varying,
    unit character varying,
    reference_min numeric,
    reference_max numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    taxon_id bigint,
    facilitate_taxon_id bigint,
    target_source character varying,
    project_taxon_id bigint
);


--
-- Name: bench_indicators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_indicators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_indicators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_indicators_id_seq OWNED BY public.bench_indicators.id;


--
-- Name: bench_mileposts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_mileposts (
    id bigint NOT NULL,
    organ_id bigint,
    name character varying,
    "position" integer,
    project_mileposts_count integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bench_mileposts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_mileposts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_mileposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_mileposts_id_seq OWNED BY public.bench_mileposts.id;


--
-- Name: bench_project_facilitates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_project_facilitates (
    id bigint NOT NULL,
    project_id bigint,
    facilitate_taxon_id bigint,
    facilitate_id bigint,
    provider_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bench_project_facilitates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_project_facilitates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_project_facilitates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_project_facilitates_id_seq OWNED BY public.bench_project_facilitates.id;


--
-- Name: bench_project_indicators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_project_indicators (
    id bigint NOT NULL,
    project_id bigint,
    indicator_id bigint,
    recorded_on date,
    recorded_at timestamp without time zone,
    value character varying,
    source character varying,
    comment character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    state character varying
);


--
-- Name: bench_project_indicators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_project_indicators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_project_indicators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_project_indicators_id_seq OWNED BY public.bench_project_indicators.id;


--
-- Name: bench_project_mileposts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_project_mileposts (
    id bigint NOT NULL,
    project_id bigint,
    milepost_id bigint,
    recorded_on date,
    current boolean,
    milepost_name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bench_project_mileposts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_project_mileposts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_project_mileposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_project_mileposts_id_seq OWNED BY public.bench_project_mileposts.id;


--
-- Name: bench_project_stages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_project_stages (
    id bigint NOT NULL,
    name character varying,
    begin_on date,
    end_on date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    note character varying,
    fund_budget numeric,
    fund_expense numeric,
    budget_amount numeric,
    expense_amount numeric,
    projects_count integer
);


--
-- Name: bench_project_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_project_stages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_project_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_project_stages_id_seq OWNED BY public.bench_project_stages.id;


--
-- Name: bench_project_webhooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_project_webhooks (
    id bigint NOT NULL,
    project_id bigint,
    origin_data json,
    valuable_data json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bench_project_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_project_webhooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_project_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_project_webhooks_id_seq OWNED BY public.bench_project_webhooks.id;


--
-- Name: bench_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_projects (
    id integer NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organ_id bigint,
    taxon_id bigint,
    state character varying,
    extra jsonb,
    fund_expense numeric,
    fund_budget numeric,
    expense_amount numeric,
    budget_amount numeric
);


--
-- Name: bench_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_projects_id_seq OWNED BY public.bench_projects.id;


--
-- Name: bench_schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_schedules (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bench_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_schedules_id_seq OWNED BY public.bench_schedules.id;


--
-- Name: bench_task_hierarchies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_task_hierarchies (
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bench_task_template_hierarchies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_task_template_hierarchies (
    id bigint NOT NULL,
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: bench_task_template_hierarchies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_task_template_hierarchies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_task_template_hierarchies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_task_template_hierarchies_id_seq OWNED BY public.bench_task_template_hierarchies.id;


--
-- Name: bench_task_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_task_templates (
    id bigint NOT NULL,
    title character varying,
    parent_id integer,
    "position" integer DEFAULT 1,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    taxon_id bigint,
    organ_id bigint,
    job_title_id bigint,
    member_id bigint,
    parent_ancestors jsonb,
    color character varying,
    department_id bigint,
    project_taxon_id bigint,
    repeat_type character varying DEFAULT 'once'::character varying,
    repeat_days integer[]
);


--
-- Name: bench_task_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_task_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_task_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_task_templates_id_seq OWNED BY public.bench_task_templates.id;


--
-- Name: bench_task_timers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_task_timers (
    id integer NOT NULL,
    task_id integer,
    duration integer,
    finish_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bench_task_timers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_task_timers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_task_timers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_task_timers_id_seq OWNED BY public.bench_task_timers.id;


--
-- Name: bench_tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bench_tasks (
    id integer NOT NULL,
    title character varying,
    parent_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying DEFAULT 0,
    focus character varying DEFAULT 0,
    "position" integer DEFAULT 1,
    estimated_time integer,
    actual_time integer,
    done_at timestamp without time zone,
    children_count integer DEFAULT 0,
    member_id bigint,
    user_id bigint,
    start_at timestamp without time zone,
    parent_ancestors json,
    organ_id bigint,
    job_title_id bigint,
    project_id bigint,
    task_template_id bigint,
    note character varying,
    department_id bigint,
    serial_number character varying,
    cost_fund numeric,
    cost_stock integer
);


--
-- Name: COLUMN bench_tasks.serial_number; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.bench_tasks.serial_number IS 'Task Template test repeat';


--
-- Name: bench_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bench_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bench_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bench_tasks_id_seq OWNED BY public.bench_tasks.id;


--
-- Name: com_acme_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_acme_accounts (
    id bigint NOT NULL,
    email character varying,
    kid character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: com_acme_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_acme_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_acme_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_acme_accounts_id_seq OWNED BY public.com_acme_accounts.id;


--
-- Name: com_acme_identifiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_acme_identifiers (
    id bigint NOT NULL,
    acme_order_id bigint,
    identifier character varying,
    file_name character varying,
    file_content character varying,
    record_name character varying,
    record_content character varying,
    domain character varying,
    wildcard boolean,
    url character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    dns_valid boolean,
    token character varying,
    file_valid boolean,
    status character varying
);


--
-- Name: com_acme_identifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_acme_identifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_acme_identifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_acme_identifiers_id_seq OWNED BY public.com_acme_identifiers.id;


--
-- Name: com_acme_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_acme_orders (
    id bigint NOT NULL,
    acme_account_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    orderid character varying,
    url character varying,
    status character varying,
    issued_at timestamp without time zone,
    expire_at timestamp(6) without time zone
);


--
-- Name: COLUMN com_acme_orders.expire_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.com_acme_orders.expire_at IS '过期时间';


--
-- Name: com_acme_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_acme_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_acme_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_acme_orders_id_seq OWNED BY public.com_acme_orders.id;


--
-- Name: com_blob_defaults; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_blob_defaults (
    id bigint NOT NULL,
    record_class character varying,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: COLUMN com_blob_defaults.record_class; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.com_blob_defaults.record_class IS 'AR 类名，如 User';


--
-- Name: COLUMN com_blob_defaults.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.com_blob_defaults.name IS '名称, attach 名称，如：avatar';


--
-- Name: com_blob_defaults_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_blob_defaults_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_blob_defaults_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_blob_defaults_id_seq OWNED BY public.com_blob_defaults.id;


--
-- Name: com_cache_lists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_cache_lists (
    id bigint NOT NULL,
    path character varying,
    key character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: com_cache_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_cache_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_cache_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_cache_lists_id_seq OWNED BY public.com_cache_lists.id;


--
-- Name: com_csps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_csps (
    id bigint NOT NULL,
    document_uri character varying,
    referrer character varying,
    violated_directive character varying,
    effective_directive character varying,
    original_policy character varying(1024),
    disposition character varying,
    blocked_uri character varying,
    line_number character varying,
    column_number character varying,
    source_file character varying,
    status_code character varying,
    script_sample character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: com_csps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_csps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_csps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_csps_id_seq OWNED BY public.com_csps.id;


--
-- Name: com_errs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_errs (
    id integer NOT NULL,
    path character varying,
    controller_name character varying,
    action_name character varying,
    exception character varying(10240),
    exception_object character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    exception_backtrace character varying[],
    ip character varying,
    headers jsonb,
    params jsonb,
    cookie jsonb,
    session jsonb
);


--
-- Name: com_errs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_errs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_errs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_errs_id_seq OWNED BY public.com_errs.id;


--
-- Name: com_infos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_infos (
    id bigint NOT NULL,
    code character varying,
    value character varying,
    version character varying,
    platform character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: com_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_infos_id_seq OWNED BY public.com_infos.id;


--
-- Name: com_meta_actions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_meta_actions (
    id bigint NOT NULL,
    namespace_identifier character varying DEFAULT ''::character varying NOT NULL,
    business_identifier character varying DEFAULT ''::character varying NOT NULL,
    controller_path character varying NOT NULL,
    controller_name character varying NOT NULL,
    action_name character varying,
    path character varying,
    verb character varying,
    required_parts character varying[],
    "position" integer,
    landmark boolean,
    operation character varying DEFAULT 'read'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: com_meta_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_meta_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_meta_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_meta_actions_id_seq OWNED BY public.com_meta_actions.id;


--
-- Name: com_meta_businesses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_meta_businesses (
    id bigint NOT NULL,
    name character varying,
    identifier character varying DEFAULT ''::character varying NOT NULL,
    "position" integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: com_meta_businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_meta_businesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_meta_businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_meta_businesses_id_seq OWNED BY public.com_meta_businesses.id;


--
-- Name: com_meta_columns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_meta_columns (
    id bigint NOT NULL,
    record_name character varying,
    column_name character varying,
    sql_type character varying,
    column_type character varying,
    column_limit integer,
    comment character varying,
    defined_db boolean,
    defined_model boolean,
    belongs_enable boolean,
    belongs_table character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: com_meta_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_meta_columns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_meta_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_meta_columns_id_seq OWNED BY public.com_meta_columns.id;


--
-- Name: com_meta_controllers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_meta_controllers (
    id bigint NOT NULL,
    namespace_identifier character varying DEFAULT ''::character varying NOT NULL,
    business_identifier character varying DEFAULT ''::character varying NOT NULL,
    controller_path character varying NOT NULL,
    controller_name character varying NOT NULL,
    "position" integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: com_meta_controllers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_meta_controllers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_meta_controllers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_meta_controllers_id_seq OWNED BY public.com_meta_controllers.id;


--
-- Name: com_meta_models; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_meta_models (
    id bigint NOT NULL,
    name character varying,
    record_name character varying,
    description character varying,
    defined_db boolean,
    customizable boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: COLUMN com_meta_models.customizable; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.com_meta_models.customizable IS '是否允许用户定制';


--
-- Name: com_meta_models_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_meta_models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_meta_models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_meta_models_id_seq OWNED BY public.com_meta_models.id;


--
-- Name: com_meta_namespaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_meta_namespaces (
    id bigint NOT NULL,
    name character varying,
    identifier character varying DEFAULT ''::character varying NOT NULL,
    verify_organ boolean,
    verify_member boolean,
    verify_user boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: com_meta_namespaces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_meta_namespaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_meta_namespaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_meta_namespaces_id_seq OWNED BY public.com_meta_namespaces.id;


--
-- Name: com_meta_operations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.com_meta_operations (
    id bigint NOT NULL,
    action_name character varying,
    operation character varying DEFAULT 'read'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: com_meta_operations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_meta_operations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: com_meta_operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.com_meta_operations_id_seq OWNED BY public.com_meta_operations.id;


--
-- Name: datum_data_lists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.datum_data_lists (
    id integer NOT NULL,
    title character varying,
    comment character varying(4096),
    type character varying,
    data_table character varying,
    export_excel character varying,
    export_pdf character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    parameters jsonb,
    columns jsonb,
    x_position integer
);


--
-- Name: datum_data_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.datum_data_lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: datum_data_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.datum_data_lists_id_seq OWNED BY public.datum_data_lists.id;


--
-- Name: datum_record_lists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.datum_record_lists (
    id integer NOT NULL,
    data_list_id integer,
    done boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    parameters jsonb,
    columns jsonb
);


--
-- Name: datum_record_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.datum_record_lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: datum_record_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.datum_record_lists_id_seq OWNED BY public.datum_record_lists.id;


--
-- Name: datum_table_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.datum_table_items (
    id integer NOT NULL,
    table_list_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    fields character varying[]
);


--
-- Name: datum_table_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.datum_table_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: datum_table_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.datum_table_items_id_seq OWNED BY public.datum_table_items.id;


--
-- Name: datum_table_lists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.datum_table_lists (
    id integer NOT NULL,
    data_list_id integer,
    table_items_count integer DEFAULT 0,
    "timestamp" character varying,
    done boolean,
    published boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    headers character varying[],
    footers character varying[],
    parameters jsonb
);


--
-- Name: datum_table_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.datum_table_lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: datum_table_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.datum_table_lists_id_seq OWNED BY public.datum_table_lists.id;


--
-- Name: detail_contents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detail_contents (
    id bigint NOT NULL,
    type character varying,
    title character varying,
    body text,
    "position" integer DEFAULT 0,
    list character varying(50),
    detail_id bigint,
    author_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    detail_type character varying
);


--
-- Name: detail_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detail_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detail_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detail_contents_id_seq OWNED BY public.detail_contents.id;


--
-- Name: detail_entity_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detail_entity_items (
    id bigint NOT NULL,
    list_id bigint,
    item_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    value character varying,
    entity_type character varying,
    entity_id bigint,
    taxon_item_id bigint
);


--
-- Name: detail_entity_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detail_entity_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detail_entity_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detail_entity_items_id_seq OWNED BY public.detail_entity_items.id;


--
-- Name: detail_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detail_items (
    id bigint NOT NULL,
    name character varying,
    type character varying,
    key character varying,
    description character varying(1024),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    list_id bigint
);


--
-- Name: detail_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detail_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detail_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detail_items_id_seq OWNED BY public.detail_items.id;


--
-- Name: detail_knowings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detail_knowings (
    id bigint NOT NULL,
    knowable_type character varying,
    knowable_id bigint,
    knowledge_id bigint,
    "primary" boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: detail_knowings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detail_knowings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detail_knowings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detail_knowings_id_seq OWNED BY public.detail_knowings.id;


--
-- Name: detail_knowledge_hierarchies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detail_knowledge_hierarchies (
    id bigint NOT NULL,
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: detail_knowledge_hierarchies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detail_knowledge_hierarchies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detail_knowledge_hierarchies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detail_knowledge_hierarchies_id_seq OWNED BY public.detail_knowledge_hierarchies.id;


--
-- Name: detail_knowledges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detail_knowledges (
    id bigint NOT NULL,
    parent_id bigint,
    title character varying,
    body text,
    "position" integer,
    parent_ancestors json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: detail_knowledges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detail_knowledges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detail_knowledges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detail_knowledges_id_seq OWNED BY public.detail_knowledges.id;


--
-- Name: detail_lists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detail_lists (
    id bigint NOT NULL,
    name character varying,
    "position" integer,
    items_count integer DEFAULT 0,
    status integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organ_id bigint
);


--
-- Name: detail_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detail_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detail_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detail_lists_id_seq OWNED BY public.detail_lists.id;


--
-- Name: detail_post_syncs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detail_post_syncs (
    id bigint NOT NULL,
    post_id bigint,
    synced_type character varying,
    synced_id bigint,
    synced_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    source_id character varying
);


--
-- Name: detail_post_syncs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detail_post_syncs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detail_post_syncs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detail_post_syncs_id_seq OWNED BY public.detail_post_syncs.id;


--
-- Name: detail_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detail_posts (
    id bigint NOT NULL,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying,
    content character varying,
    link character varying,
    html character varying,
    organ_id bigint,
    thumb_media_id character varying
);


--
-- Name: detail_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detail_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detail_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detail_posts_id_seq OWNED BY public.detail_posts.id;


--
-- Name: detail_taxon_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detail_taxon_items (
    id bigint NOT NULL,
    taxon_type character varying,
    taxon_id bigint,
    list_id bigint,
    item_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    default_value character varying
);


--
-- Name: detail_taxon_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detail_taxon_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: detail_taxon_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detail_taxon_items_id_seq OWNED BY public.detail_taxon_items.id;


--
-- Name: doc_maps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.doc_maps (
    id bigint NOT NULL,
    name character varying,
    mappings jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: doc_maps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.doc_maps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: doc_maps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.doc_maps_id_seq OWNED BY public.doc_maps.id;


--
-- Name: doc_subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.doc_subjects (
    id bigint NOT NULL,
    rule_id bigint,
    name character varying,
    path_params jsonb,
    request_params jsonb,
    request_headers jsonb,
    request_type character varying,
    request_body jsonb,
    response_status character varying,
    response_headers jsonb,
    response_type character varying,
    response_body character varying,
    note character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: doc_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.doc_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: doc_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.doc_subjects_id_seq OWNED BY public.doc_subjects.id;


--
-- Name: email_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_logs (
    id bigint NOT NULL,
    message_object_id character varying,
    mailer character varying,
    action_name character varying,
    params character varying,
    subject character varying,
    mail_to character varying,
    cc_to character varying,
    sent_status character varying,
    sent_string character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    template_id bigint,
    mail_from character varying
);


--
-- Name: email_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_logs_id_seq OWNED BY public.email_logs.id;


--
-- Name: email_reasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_reasons (
    id bigint NOT NULL,
    body character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: email_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_reasons_id_seq OWNED BY public.email_reasons.id;


--
-- Name: email_smtp_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_smtp_accounts (
    id bigint NOT NULL,
    smtp_id bigint,
    user_name character varying,
    password character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "position" integer
);


--
-- Name: email_smtp_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_smtp_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_smtp_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_smtp_accounts_id_seq OWNED BY public.email_smtp_accounts.id;


--
-- Name: email_smtps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_smtps (
    id bigint NOT NULL,
    address character varying,
    port character varying,
    enable_starttls_auto boolean,
    ssl boolean,
    authentication character varying,
    openssl_verify_mode character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: email_smtps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_smtps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_smtps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_smtps_id_seq OWNED BY public.email_smtps.id;


--
-- Name: email_subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_subscriptions (
    id bigint NOT NULL,
    smtp_id bigint,
    smtp_account_id bigint,
    address character varying,
    state character varying,
    subscribe_at timestamp without time zone,
    unsubscribe_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    reason_id bigint
);


--
-- Name: email_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_subscriptions_id_seq OWNED BY public.email_subscriptions.id;


--
-- Name: email_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_templates (
    id bigint NOT NULL,
    honorific character varying,
    body character varying,
    order_prefix character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "position" integer,
    contact character varying,
    subject character varying,
    organ_id bigint
);


--
-- Name: email_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_templates_id_seq OWNED BY public.email_templates.id;


--
-- Name: event_participants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_participants (
    id bigint NOT NULL,
    event_id bigint,
    participant_type character varying,
    participant_id bigint,
    state character varying,
    score integer,
    comment character varying(4096),
    quit_note character varying,
    assigned_status character varying,
    job_id character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    event_crowd_id bigint,
    crowd_member_id integer
);


--
-- Name: event_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.event_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: event_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.event_participants_id_seq OWNED BY public.event_participants.id;


--
-- Name: eventual_bookings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_bookings (
    id integer NOT NULL,
    booker_type character varying,
    booker_id integer,
    booked_type character varying,
    booked_id integer,
    plan_item_id integer,
    time_item_id integer,
    place_id integer,
    booking_on date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    seat_id bigint
);


--
-- Name: eventual_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_bookings_id_seq OWNED BY public.eventual_bookings.id;


--
-- Name: eventual_crowd_members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_crowd_members (
    id bigint NOT NULL,
    crowd_id bigint,
    member_type character varying,
    member_id bigint,
    agency_id bigint,
    state character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: eventual_crowd_members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_crowd_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_crowd_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_crowd_members_id_seq OWNED BY public.eventual_crowd_members.id;


--
-- Name: eventual_crowds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_crowds (
    id bigint NOT NULL,
    organ_id bigint,
    name character varying,
    member_type character varying,
    crowd_members_count integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: eventual_crowds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_crowds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_crowds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_crowds_id_seq OWNED BY public.eventual_crowds.id;


--
-- Name: eventual_event_crowds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_event_crowds (
    id bigint NOT NULL,
    event_id bigint,
    crowd_id bigint,
    present_number integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: eventual_event_crowds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_event_crowds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_event_crowds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_event_crowds_id_seq OWNED BY public.eventual_event_crowds.id;


--
-- Name: eventual_event_grants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_event_grants (
    id bigint NOT NULL,
    event_id bigint,
    grant_kind character varying,
    grant_column character varying,
    filter jsonb DEFAULT '{}'::jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: eventual_event_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_event_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_event_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_event_grants_id_seq OWNED BY public.eventual_event_grants.id;


--
-- Name: eventual_event_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_event_items (
    id bigint NOT NULL,
    event_id bigint,
    name character varying,
    author_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: eventual_event_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_event_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_event_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_event_items_id_seq OWNED BY public.eventual_event_items.id;


--
-- Name: eventual_event_participants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_event_participants (
    id bigint NOT NULL,
    event_crowd_id bigint,
    event_id bigint,
    crowd_member_id bigint,
    participant_type character varying,
    participant_id bigint,
    score integer,
    comment character varying,
    quit_note character varying,
    assigned_status character varying,
    job_id character varying,
    state character varying DEFAULT 'in_studying'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: eventual_event_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_event_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_event_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_event_participants_id_seq OWNED BY public.eventual_event_participants.id;


--
-- Name: eventual_event_taxons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_event_taxons (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    organ_id bigint
);


--
-- Name: eventual_event_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_event_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_event_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_event_taxons_id_seq OWNED BY public.eventual_event_taxons.id;


--
-- Name: eventual_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_events (
    id bigint NOT NULL,
    event_taxon_id bigint,
    name character varying,
    description character varying(4096),
    "position" integer,
    event_items_count integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    organ_id bigint,
    price numeric(10,2),
    event_participants_count integer DEFAULT 0,
    members_count integer DEFAULT 0
);


--
-- Name: eventual_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_events_id_seq OWNED BY public.eventual_events.id;


--
-- Name: eventual_place_taxon_hierarchies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_place_taxon_hierarchies (
    id bigint NOT NULL,
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: eventual_place_taxon_hierarchies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_place_taxon_hierarchies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_place_taxon_hierarchies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_place_taxon_hierarchies_id_seq OWNED BY public.eventual_place_taxon_hierarchies.id;


--
-- Name: eventual_place_taxons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_place_taxons (
    id bigint NOT NULL,
    organ_id bigint,
    parent_id bigint,
    name character varying,
    "position" integer,
    profit_margin numeric(4,2),
    parent_ancestors jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    places_count integer
);


--
-- Name: eventual_place_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_place_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_place_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_place_taxons_id_seq OWNED BY public.eventual_place_taxons.id;


--
-- Name: eventual_places; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_places (
    id bigint NOT NULL,
    organ_id bigint,
    name character varying,
    color character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    place_taxon_id bigint,
    description character varying,
    area_id bigint,
    seats_count integer DEFAULT 0,
    plans_count integer DEFAULT 0,
    place_taxon_ancestors jsonb
);


--
-- Name: eventual_places_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_places_id_seq OWNED BY public.eventual_places.id;


--
-- Name: eventual_plan_attenders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_plan_attenders (
    id integer NOT NULL,
    plan_item_id integer,
    attender_type character varying,
    attender_id integer,
    place_id integer,
    attended boolean,
    state character varying,
    extra jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    plan_participant_id bigint,
    plan_id bigint
);


--
-- Name: eventual_plan_attenders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_plan_attenders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_plan_attenders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_plan_attenders_id_seq OWNED BY public.eventual_plan_attenders.id;


--
-- Name: eventual_plan_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_plan_items (
    id integer NOT NULL,
    plan_id integer,
    time_item_id integer,
    place_id integer,
    plan_on date,
    repeat_index character varying,
    bookings_count integer DEFAULT 0,
    extra jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    time_list_id bigint,
    planned_type character varying,
    planned_id bigint,
    event_id bigint,
    event_item_id bigint,
    plan_participants_count integer DEFAULT 0
);


--
-- Name: eventual_plan_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_plan_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_plan_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_plan_items_id_seq OWNED BY public.eventual_plan_items.id;


--
-- Name: eventual_plan_participants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_plan_participants (
    id bigint NOT NULL,
    planning_type character varying,
    planning_id bigint,
    event_participant_id bigint,
    participant_type character varying,
    participant_id bigint,
    type character varying,
    status character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: COLUMN eventual_plan_participants.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.eventual_plan_participants.status IS '默认 event_participant 有效';


--
-- Name: eventual_plan_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_plan_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_plan_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_plan_participants_id_seq OWNED BY public.eventual_plan_participants.id;


--
-- Name: eventual_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_plans (
    id integer NOT NULL,
    time_list_id integer,
    planned_type character varying,
    planned_id integer,
    place_id integer,
    begin_on date,
    end_on date,
    repeat_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    repeat_count integer,
    repeat_days jsonb,
    title character varying,
    produced_begin_on date,
    produced_end_on date,
    produce_done boolean
);


--
-- Name: eventual_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_plans_id_seq OWNED BY public.eventual_plans.id;


--
-- Name: eventual_seats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_seats (
    id bigint NOT NULL,
    place_id bigint,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    min_members integer DEFAULT 1,
    max_members integer
);


--
-- Name: eventual_seats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_seats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_seats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_seats_id_seq OWNED BY public.eventual_seats.id;


--
-- Name: eventual_time_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_time_items (
    id integer NOT NULL,
    time_list_id integer,
    start_at time without time zone,
    finish_at time without time zone,
    "position" integer DEFAULT 1,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: eventual_time_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_time_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_time_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_time_items_id_seq OWNED BY public.eventual_time_items.id;


--
-- Name: eventual_time_lists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eventual_time_lists (
    id integer NOT NULL,
    name character varying,
    code character varying,
    interval_minutes integer DEFAULT 0,
    item_minutes integer DEFAULT 45,
    "default" boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organ_id bigint,
    kind character varying
);


--
-- Name: eventual_time_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eventual_time_lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eventual_time_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.eventual_time_lists_id_seq OWNED BY public.eventual_time_lists.id;


--
-- Name: factory_factory_providers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_factory_providers (
    id bigint NOT NULL,
    factory_taxon_id bigint,
    provider_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: factory_factory_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_factory_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_factory_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_factory_providers_id_seq OWNED BY public.factory_factory_providers.id;


--
-- Name: factory_factory_taxons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_factory_taxons (
    id bigint NOT NULL,
    name character varying,
    "position" integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: factory_factory_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_factory_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_factory_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_factory_taxons_id_seq OWNED BY public.factory_factory_taxons.id;


--
-- Name: factory_part_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_part_items (
    id bigint NOT NULL,
    part_id bigint,
    product_item_id bigint,
    qr_code character varying,
    state character varying,
    received_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: factory_part_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_part_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_part_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_part_items_id_seq OWNED BY public.factory_part_items.id;


--
-- Name: factory_part_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_part_plans (
    id bigint NOT NULL,
    part_id bigint,
    start_at timestamp without time zone,
    finish_at timestamp without time zone,
    state character varying,
    purchased_count integer DEFAULT 0,
    received_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    product_id bigint,
    production_id bigint
);


--
-- Name: factory_part_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_part_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_part_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_part_plans_id_seq OWNED BY public.factory_part_plans.id;


--
-- Name: factory_part_providers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_part_providers (
    id bigint NOT NULL,
    part_id bigint,
    product_id bigint,
    production_id bigint,
    provider_id bigint,
    organ_id bigint,
    export_price numeric,
    verified boolean,
    selected boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: factory_part_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_part_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_part_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_part_providers_id_seq OWNED BY public.factory_part_providers.id;


--
-- Name: factory_part_taxon_hierarchies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_part_taxon_hierarchies (
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: factory_part_taxons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_part_taxons (
    id bigint NOT NULL,
    name character varying,
    "position" integer DEFAULT 1,
    parent_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organ_id bigint,
    parent_ancestors jsonb,
    take_stock boolean,
    factory_taxon_id bigint,
    parts_count integer DEFAULT 0
);


--
-- Name: COLUMN factory_part_taxons.take_stock; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.factory_part_taxons.take_stock IS '可盘点';


--
-- Name: factory_part_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_part_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_part_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_part_taxons_id_seq OWNED BY public.factory_part_taxons.id;


--
-- Name: factory_parts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_parts (
    id bigint NOT NULL,
    part_taxon_id bigint,
    name character varying,
    description character varying,
    qr_prefix character varying,
    sku character varying,
    type character varying,
    order_items_count integer DEFAULT 0,
    published boolean DEFAULT true,
    price numeric(10,2),
    import_price numeric(10,2),
    profit_price numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organ_id bigint,
    part_taxon_ancestors jsonb,
    part_providers_count integer DEFAULT 0
);


--
-- Name: factory_parts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_parts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_parts_id_seq OWNED BY public.factory_parts.id;


--
-- Name: factory_produce_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_produce_plans (
    id bigint NOT NULL,
    title character varying,
    start_at timestamp without time zone,
    finish_at timestamp without time zone,
    state character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    organ_id bigint
);


--
-- Name: factory_produce_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_produce_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_produce_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_produce_plans_id_seq OWNED BY public.factory_produce_plans.id;


--
-- Name: factory_produces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_produces (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: factory_produces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_produces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_produces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_produces_id_seq OWNED BY public.factory_produces.id;


--
-- Name: factory_product_part_taxons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_product_part_taxons (
    id bigint NOT NULL,
    product_id bigint,
    part_taxon_id bigint,
    name character varying,
    min_select integer DEFAULT 1,
    max_select integer DEFAULT 1,
    part_taxon_ancestors json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: COLUMN factory_product_part_taxons.max_select; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.factory_product_part_taxons.max_select IS '最大同时选择，1则为单选';


--
-- Name: factory_product_part_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_product_part_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_product_part_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_product_part_taxons_id_seq OWNED BY public.factory_product_part_taxons.id;


--
-- Name: factory_product_parts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_product_parts (
    id bigint NOT NULL,
    product_id bigint,
    part_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    part_taxon_id bigint,
    "default" boolean
);


--
-- Name: factory_product_parts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_product_parts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_product_parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_product_parts_id_seq OWNED BY public.factory_product_parts.id;


--
-- Name: factory_product_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_product_plans (
    id bigint NOT NULL,
    product_id bigint,
    start_at timestamp without time zone,
    finish_at timestamp without time zone,
    state character varying,
    planned_count integer DEFAULT 0,
    produced_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    produce_plan_id bigint
);


--
-- Name: factory_product_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_product_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_product_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_product_plans_id_seq OWNED BY public.factory_product_plans.id;


--
-- Name: factory_product_produces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_product_produces (
    id bigint NOT NULL,
    product_id bigint,
    produce_id bigint,
    "position" integer,
    start_at timestamp without time zone,
    finish_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: factory_product_produces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_product_produces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_product_produces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_product_produces_id_seq OWNED BY public.factory_product_produces.id;


--
-- Name: factory_product_taxon_hierarchies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_product_taxon_hierarchies (
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: factory_product_taxons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_product_taxons (
    id bigint NOT NULL,
    name character varying,
    "position" integer DEFAULT 1,
    parent_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organ_id bigint,
    parent_ancestors json,
    factory_taxon_id bigint,
    products_count integer DEFAULT 0
);


--
-- Name: factory_product_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_product_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_product_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_product_taxons_id_seq OWNED BY public.factory_product_taxons.id;


--
-- Name: factory_production_carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_production_carts (
    id bigint NOT NULL,
    cart_id bigint,
    user_id bigint,
    product_id bigint,
    production_id bigint,
    state character varying DEFAULT 'init'::character varying,
    customized_at timestamp without time zone,
    original_price numeric DEFAULT 0.0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: factory_production_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_production_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_production_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_production_carts_id_seq OWNED BY public.factory_production_carts.id;


--
-- Name: factory_production_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_production_items (
    id bigint NOT NULL,
    production_id bigint,
    product_plan_id bigint,
    state character varying DEFAULT 'producing'::character varying,
    qr_code character varying,
    produced_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: factory_production_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_production_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_production_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_production_items_id_seq OWNED BY public.factory_production_items.id;


--
-- Name: factory_production_parts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_production_parts (
    id bigint NOT NULL,
    production_id bigint,
    part_id bigint,
    price numeric DEFAULT 0.0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: factory_production_parts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_production_parts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_production_parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_production_parts_id_seq OWNED BY public.factory_production_parts.id;


--
-- Name: factory_productions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_productions (
    id bigint NOT NULL,
    product_id bigint,
    name character varying,
    qr_code character varying,
    price numeric(10,2) DEFAULT 0.0,
    cost_price numeric DEFAULT 0.0,
    profit_price numeric DEFAULT 0.0,
    str_part_ids character varying,
    "default" boolean,
    state character varying DEFAULT 'init'::character varying,
    sku character varying,
    advance_price numeric DEFAULT 0.0,
    extra json DEFAULT '{}'::json,
    unit character varying,
    quantity numeric DEFAULT 0.0,
    unified_quantity numeric DEFAULT 0.0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: factory_productions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_productions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_productions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_productions_id_seq OWNED BY public.factory_productions.id;


--
-- Name: factory_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.factory_products (
    id bigint NOT NULL,
    product_taxon_id bigint,
    name character varying,
    description character varying,
    qr_prefix character varying,
    sku character varying,
    order_items_count integer DEFAULT 0,
    published boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organ_id bigint,
    product_taxon_ancestors json,
    str_part_ids character varying,
    profit_margin numeric(4,2),
    min_price numeric,
    max_price numeric,
    productions_count integer DEFAULT 0
);


--
-- Name: factory_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.factory_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: factory_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.factory_products_id_seq OWNED BY public.factory_products.id;


--
-- Name: finance_assessments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_assessments (
    id bigint NOT NULL,
    organ_id bigint,
    amount numeric DEFAULT 0.0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    trustee_amount numeric
);


--
-- Name: finance_assessments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_assessments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_assessments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_assessments_id_seq OWNED BY public.finance_assessments.id;


--
-- Name: finance_budgets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_budgets (
    id bigint NOT NULL,
    organ_id bigint,
    member_id bigint,
    financial_type character varying,
    financial_id bigint,
    financial_taxon_id bigint,
    state character varying DEFAULT 'init'::character varying,
    subject character varying,
    amount numeric,
    note character varying(4096),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    task_id bigint,
    type character varying,
    fund_id bigint,
    stock_id bigint
);


--
-- Name: finance_budgets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_budgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_budgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_budgets_id_seq OWNED BY public.finance_budgets.id;


--
-- Name: finance_expense_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_expense_items (
    id bigint NOT NULL,
    expense_id bigint,
    financial_taxon_id bigint,
    amount numeric(10,2),
    note character varying,
    state character varying,
    quantity integer DEFAULT 1,
    price numeric(10,2),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    budget_id bigint,
    budget_amount numeric
);


--
-- Name: finance_expense_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_expense_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_expense_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_expense_items_id_seq OWNED BY public.finance_expense_items.id;


--
-- Name: finance_expense_members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_expense_members (
    id bigint NOT NULL,
    expense_id bigint,
    member_id bigint,
    payment_method_id bigint,
    amount numeric(10,2),
    advance boolean,
    state character varying DEFAULT 'pending'::character varying,
    note character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    cash_id bigint,
    operator_id bigint,
    payable_type character varying,
    payable_id bigint,
    type character varying,
    payout_uuid character varying,
    requested_amount numeric,
    actual_amount numeric,
    paid_at timestamp without time zone,
    account_bank character varying,
    account_name character varying,
    account_num character varying
);


--
-- Name: finance_expense_members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_expense_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_expense_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_expense_members_id_seq OWNED BY public.finance_expense_members.id;


--
-- Name: finance_expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_expenses (
    id bigint NOT NULL,
    payout_id bigint,
    creator_id bigint,
    financial_taxon_id bigint,
    payment_method_id bigint,
    type character varying,
    state character varying DEFAULT 'init'::character varying,
    subject character varying,
    amount numeric(10,2),
    note character varying(4096),
    invoices_count integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    organ_id bigint,
    budget_id bigint,
    financial_type character varying,
    financial_id bigint,
    fund_id bigint,
    stock_id bigint
);


--
-- Name: finance_expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_expenses_id_seq OWNED BY public.finance_expenses.id;


--
-- Name: finance_financial_taxon_hierarchies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_financial_taxon_hierarchies (
    id bigint NOT NULL,
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: finance_financial_taxon_hierarchies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_financial_taxon_hierarchies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_financial_taxon_hierarchies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_financial_taxon_hierarchies_id_seq OWNED BY public.finance_financial_taxon_hierarchies.id;


--
-- Name: finance_financial_taxons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_financial_taxons (
    id bigint NOT NULL,
    parent_id bigint,
    parent_ancestors jsonb,
    name character varying,
    "position" integer,
    take_stock boolean,
    individual boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    organ_id bigint
);


--
-- Name: COLUMN finance_financial_taxons.take_stock; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.finance_financial_taxons.take_stock IS '是否有库存';


--
-- Name: COLUMN finance_financial_taxons.individual; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.finance_financial_taxons.individual IS '是否可盘点';


--
-- Name: finance_financial_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_financial_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_financial_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_financial_taxons_id_seq OWNED BY public.finance_financial_taxons.id;


--
-- Name: finance_fund_incomes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_fund_incomes (
    id bigint NOT NULL,
    fund_id bigint,
    user_id bigint,
    financial_type character varying,
    financial_id bigint,
    visible boolean,
    amount numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    note character varying,
    state character varying DEFAULT 'init'::character varying
);


--
-- Name: finance_fund_incomes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_fund_incomes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_fund_incomes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_fund_incomes_id_seq OWNED BY public.finance_fund_incomes.id;


--
-- Name: finance_funds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_funds (
    id bigint NOT NULL,
    name character varying,
    budget_amount numeric,
    amount numeric DEFAULT 0.0,
    note character varying,
    sku character varying,
    price numeric(10,2) DEFAULT 0.0,
    advance_price numeric DEFAULT 0.0,
    extra json DEFAULT '{}'::json,
    unit character varying,
    quantity numeric DEFAULT 0.0,
    unified_quantity numeric DEFAULT 0.0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    budget_detail jsonb DEFAULT '{}'::jsonb,
    expense_amount numeric DEFAULT 0.0,
    expense_detail jsonb DEFAULT '{}'::jsonb,
    buyer_id bigint,
    organ_id bigint
);


--
-- Name: finance_funds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_funds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_funds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_funds_id_seq OWNED BY public.finance_funds.id;


--
-- Name: finance_stocks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_stocks (
    id bigint NOT NULL,
    assessment_id bigint,
    ratio numeric(4,2),
    amount integer DEFAULT 0.0,
    expense_amount integer DEFAULT 0.0,
    expense_detail json DEFAULT '{}'::json,
    note character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    assess_amount numeric,
    member_id bigint,
    organ_id bigint
);


--
-- Name: COLUMN finance_stocks.amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.finance_stocks.amount IS '发行量';


--
-- Name: finance_stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_stocks_id_seq OWNED BY public.finance_stocks.id;


--
-- Name: growth_aim_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_aim_codes (
    id bigint NOT NULL,
    aim_id bigint,
    controller_path character varying,
    action_name character varying,
    code character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: growth_aim_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_aim_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_aim_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_aim_codes_id_seq OWNED BY public.growth_aim_codes.id;


--
-- Name: growth_aim_entities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_aim_entities (
    id bigint NOT NULL,
    aim_id bigint,
    user_id bigint,
    entity_type character varying,
    entity_id bigint,
    reward_expense_id bigint,
    present_point integer,
    state character varying,
    serial_number character varying,
    last_access_at timestamp without time zone,
    ip character varying,
    reward_amount numeric(10,2),
    aim_logs_count integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: growth_aim_entities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_aim_entities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_aim_entities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_aim_entities_id_seq OWNED BY public.growth_aim_entities.id;


--
-- Name: growth_aim_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_aim_logs (
    id bigint NOT NULL,
    aim_id bigint,
    user_id bigint,
    entity_type character varying,
    entity_id bigint,
    serial_number character varying,
    ip character varying,
    code character varying,
    rewarded boolean,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: growth_aim_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_aim_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_aim_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_aim_logs_id_seq OWNED BY public.growth_aim_logs.id;


--
-- Name: growth_aim_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_aim_users (
    id bigint NOT NULL,
    aim_id bigint,
    user_id bigint,
    serial_number character varying,
    state character varying DEFAULT 'task_doing'::character varying,
    reward_amount integer DEFAULT 0,
    aim_entities_count integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: growth_aim_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_aim_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_aim_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_aim_users_id_seq OWNED BY public.growth_aim_users.id;


--
-- Name: growth_aims; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_aims (
    id bigint NOT NULL,
    name character varying,
    unit character varying,
    repeat_type character varying,
    rate numeric(10,2) DEFAULT 1.0,
    task_point integer DEFAULT 0,
    reward_point integer DEFAULT 0,
    reward_amount integer DEFAULT 0,
    "verbose" boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: growth_aims_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_aims_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_aims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_aims_id_seq OWNED BY public.growth_aims.id;


--
-- Name: growth_praise_incomes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_praise_incomes (
    id bigint NOT NULL,
    reward_id bigint,
    user_id bigint,
    earner_id bigint,
    source_type character varying,
    source_id bigint,
    amount numeric(10,2) DEFAULT 0.0,
    profit_amount numeric(10,2) DEFAULT 0.0,
    royalty_amount numeric(10,2) DEFAULT 0.0,
    reward_amount numeric(10,2) DEFAULT 0.0,
    state character varying DEFAULT 'init'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: COLUMN growth_praise_incomes.amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.growth_praise_incomes.amount IS '用户打赏';


--
-- Name: COLUMN growth_praise_incomes.profit_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.growth_praise_incomes.profit_amount IS '平台收入';


--
-- Name: COLUMN growth_praise_incomes.royalty_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.growth_praise_incomes.royalty_amount IS '作者分成';


--
-- Name: COLUMN growth_praise_incomes.reward_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.growth_praise_incomes.reward_amount IS '赏金池';


--
-- Name: growth_praise_incomes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_praise_incomes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_praise_incomes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_praise_incomes_id_seq OWNED BY public.growth_praise_incomes.id;


--
-- Name: growth_praise_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_praise_users (
    id bigint NOT NULL,
    user_id bigint,
    reward_id bigint,
    entity_type character varying,
    entity_id bigint,
    amount numeric(10,2) DEFAULT 0.0,
    "position" integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: growth_praise_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_praise_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_praise_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_praise_users_id_seq OWNED BY public.growth_praise_users.id;


--
-- Name: growth_reward_expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_reward_expenses (
    id bigint NOT NULL,
    reward_id bigint,
    user_id bigint,
    aim_id bigint,
    amount numeric(10,2) DEFAULT 0.0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: growth_reward_expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_reward_expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_reward_expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_reward_expenses_id_seq OWNED BY public.growth_reward_expenses.id;


--
-- Name: growth_reward_incomes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_reward_incomes (
    id bigint NOT NULL,
    reward_id bigint,
    user_id bigint,
    reward_amount numeric(10,2) DEFAULT 0.0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: growth_reward_incomes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_reward_incomes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_reward_incomes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_reward_incomes_id_seq OWNED BY public.growth_reward_incomes.id;


--
-- Name: growth_rewards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_rewards (
    id bigint NOT NULL,
    entity_type character varying,
    entity_id bigint,
    min_piece numeric(10,2) DEFAULT 1.0,
    max_piece numeric(10,2) DEFAULT 10.0,
    amount numeric(10,2),
    income_amount numeric(10,2),
    expense_amount numeric(10,2),
    start_at timestamp without time zone,
    finish_at timestamp without time zone,
    enabled boolean DEFAULT true,
    lock_version integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: growth_rewards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_rewards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_rewards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_rewards_id_seq OWNED BY public.growth_rewards.id;


--
-- Name: interact_abuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interact_abuses (
    id bigint NOT NULL,
    user_id bigint,
    abusement_type character varying,
    abusement_id bigint,
    note character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: interact_abuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.interact_abuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interact_abuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.interact_abuses_id_seq OWNED BY public.interact_abuses.id;


--
-- Name: interact_attitudes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interact_attitudes (
    id bigint NOT NULL,
    user_id bigint,
    attitudinal_type character varying,
    attitudinal_id bigint,
    opinion character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: interact_attitudes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.interact_attitudes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interact_attitudes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.interact_attitudes_id_seq OWNED BY public.interact_attitudes.id;


--
-- Name: interact_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interact_comments (
    id bigint NOT NULL,
    user_id bigint,
    parent_id bigint,
    commentable_type character varying,
    commentable_id bigint,
    title character varying,
    content character varying,
    state character varying,
    score double precision DEFAULT 0.0,
    liked_count integer DEFAULT 0,
    star_count integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: interact_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.interact_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interact_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.interact_comments_id_seq OWNED BY public.interact_comments.id;


--
-- Name: interact_stars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interact_stars (
    id bigint NOT NULL,
    starred_type character varying,
    starred_id bigint,
    user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: interact_stars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.interact_stars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interact_stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.interact_stars_id_seq OWNED BY public.interact_stars.id;


--
-- Name: markdown_catalogs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.markdown_catalogs (
    id bigint NOT NULL,
    name character varying,
    path character varying,
    parent_path character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: markdown_catalogs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.markdown_catalogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: markdown_catalogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.markdown_catalogs_id_seq OWNED BY public.markdown_catalogs.id;


--
-- Name: markdown_gits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.markdown_gits (
    id bigint NOT NULL,
    working_directory character varying,
    remote_url character varying,
    last_commit_message character varying,
    last_commit_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    organ_id bigint
);


--
-- Name: markdown_gits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.markdown_gits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: markdown_gits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.markdown_gits_id_seq OWNED BY public.markdown_gits.id;


--
-- Name: markdown_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.markdown_posts (
    id bigint NOT NULL,
    markdown character varying,
    html character varying,
    layout character varying,
    path character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    git_id bigint,
    oid character varying,
    title character varying,
    published boolean DEFAULT true,
    catalog_path character varying DEFAULT ''::character varying,
    ppt boolean DEFAULT false
);


--
-- Name: markdown_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.markdown_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: markdown_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.markdown_posts_id_seq OWNED BY public.markdown_posts.id;


--
-- Name: notice_annunciations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notice_annunciations (
    id bigint NOT NULL,
    organ_id bigint,
    publisher_type character varying,
    publisher_id bigint,
    title character varying,
    body character varying,
    link character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    notifications_count integer,
    readed_count integer,
    type character varying
);


--
-- Name: notice_annunciations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notice_annunciations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notice_annunciations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notice_annunciations_id_seq OWNED BY public.notice_annunciations.id;


--
-- Name: notice_member_annunciates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notice_member_annunciates (
    id bigint NOT NULL,
    annunciation_id bigint,
    job_title_id bigint,
    department_id bigint,
    notifications_count integer DEFAULT 0,
    state character varying,
    annunciated_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: notice_member_annunciates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notice_member_annunciates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notice_member_annunciates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notice_member_annunciates_id_seq OWNED BY public.notice_member_annunciates.id;


--
-- Name: notice_notification_sendings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notice_notification_sendings (
    id bigint NOT NULL,
    way character varying,
    sent_to character varying,
    sent_at timestamp without time zone,
    sent_result character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    notification_id bigint
);


--
-- Name: notice_notification_sendings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notice_notification_sendings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notice_notification_sendings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notice_notification_sendings_id_seq OWNED BY public.notice_notification_sendings.id;


--
-- Name: notice_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notice_notifications (
    id integer NOT NULL,
    notifiable_type character varying,
    notifiable_id integer,
    code character varying,
    state character varying DEFAULT 0,
    title character varying,
    body character varying(5000),
    link character varying,
    sending_at timestamp without time zone,
    read_at timestamp without time zone,
    "verbose" boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    archived boolean,
    official boolean,
    organ_id bigint,
    sender_type character varying,
    sender_id bigint,
    linked_type character varying,
    linked_id bigint,
    user_id bigint,
    member_id bigint
);


--
-- Name: notice_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notice_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notice_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notice_notifications_id_seq OWNED BY public.notice_notifications.id;


--
-- Name: notice_user_annunciates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notice_user_annunciates (
    id bigint NOT NULL,
    annunciation_id bigint,
    user_tag_id bigint,
    notifications_count integer DEFAULT 0,
    state character varying,
    annunciated_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: notice_user_annunciates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notice_user_annunciates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notice_user_annunciates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notice_user_annunciates_id_seq OWNED BY public.notice_user_annunciates.id;


--
-- Name: org_department_grants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_department_grants (
    id bigint NOT NULL,
    organ_id bigint,
    organ_handle_id bigint,
    department_id bigint,
    job_title_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: org_department_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_department_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_department_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_department_grants_id_seq OWNED BY public.org_department_grants.id;


--
-- Name: org_department_hierarchies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_department_hierarchies (
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: org_departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_departments (
    id bigint NOT NULL,
    organ_id bigint,
    parent_id bigint,
    name character varying,
    member_departments_count integer DEFAULT 0,
    needed_number integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    all_member_departments_count integer,
    superior_id bigint,
    superior_ancestors jsonb,
    parent_ancestors jsonb
);


--
-- Name: org_departments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_departments_id_seq OWNED BY public.org_departments.id;


--
-- Name: org_job_descriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_job_descriptions (
    id bigint NOT NULL,
    department_id bigint,
    requirements text,
    advanced_requirements text,
    english_requirement character varying,
    degree_requirement character varying,
    duties text,
    salary_min integer,
    salary_max integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: org_job_descriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_job_descriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_job_descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_job_descriptions_id_seq OWNED BY public.org_job_descriptions.id;


--
-- Name: org_job_titles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_job_titles (
    id bigint NOT NULL,
    department_id bigint,
    department_root_id bigint,
    name character varying,
    grade integer,
    limit_member integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    description character varying,
    cached_role_ids integer[],
    super_job_title_id bigint,
    super_grade integer
);


--
-- Name: org_job_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_job_titles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_job_titles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_job_titles_id_seq OWNED BY public.org_job_titles.id;


--
-- Name: org_job_transfers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_job_transfers (
    id bigint NOT NULL,
    member_id bigint,
    to_office_id bigint,
    to_department_id bigint,
    to_job_title_id bigint,
    from_office_id bigint,
    from_department_id bigint,
    from_job_title_id bigint,
    state character varying DEFAULT 'init'::character varying,
    transfer_on date,
    reason_note character varying(4096),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: org_job_transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_job_transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_job_transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_job_transfers_id_seq OWNED BY public.org_job_transfers.id;


--
-- Name: org_member_departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_member_departments (
    id bigint NOT NULL,
    member_id bigint,
    job_title_id bigint,
    department_root_id bigint,
    department_id bigint,
    grade integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    department_ancestors jsonb,
    superior_id bigint
);


--
-- Name: org_member_departments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_member_departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_member_departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_member_departments_id_seq OWNED BY public.org_member_departments.id;


--
-- Name: org_members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_members (
    id bigint NOT NULL,
    organ_id bigint,
    name character varying,
    identity character varying,
    number character varying,
    join_on date,
    enabled boolean DEFAULT true,
    state character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    pomodoro integer,
    organ_root_id bigint,
    owned boolean,
    department_ancestors jsonb,
    experience character varying,
    attendance_number character varying,
    cached_role_ids integer[],
    notifiable_types character varying[] DEFAULT '{}'::character varying[],
    counters jsonb DEFAULT '{}'::jsonb,
    showtime integer DEFAULT 0,
    accept_email boolean DEFAULT true,
    inviter boolean DEFAULT false
);


--
-- Name: org_members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_members_id_seq OWNED BY public.org_members.id;


--
-- Name: org_organ_domains; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_organ_domains (
    id bigint NOT NULL,
    organ_id bigint,
    subdomain character varying,
    domain character varying DEFAULT 'lvh.me'::character varying,
    port character varying DEFAULT '3000'::character varying,
    host character varying,
    identifier character varying,
    appid character varying,
    "default" boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: org_organ_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_organ_domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_organ_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_organ_domains_id_seq OWNED BY public.org_organ_domains.id;


--
-- Name: org_organ_handles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_organ_handles (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    record_class character varying,
    record_column character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: org_organ_handles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_organ_handles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_organ_handles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_organ_handles_id_seq OWNED BY public.org_organ_handles.id;


--
-- Name: org_organ_hierarchies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_organ_hierarchies (
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: org_organs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_organs (
    id bigint NOT NULL,
    name character varying,
    limit_wechat integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    area_id bigint,
    parent_id bigint,
    address character varying,
    members_count integer,
    name_short character varying,
    area_ancestors jsonb,
    limit_wechat_menu integer DEFAULT 1,
    parent_ancestors jsonb,
    cached_role_ids integer[],
    official boolean,
    joinable boolean,
    domain character varying
);


--
-- Name: COLUMN org_organs.official; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.org_organs.official IS '是否官方';


--
-- Name: COLUMN org_organs.joinable; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.org_organs.joinable IS '是否可搜索并加入';


--
-- Name: org_organs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_organs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_organs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_organs_id_seq OWNED BY public.org_organs.id;


--
-- Name: org_resign_reasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_resign_reasons (
    id bigint NOT NULL,
    name character varying,
    "position" integer,
    resigns_count integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: org_resign_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_resign_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_resign_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_resign_reasons_id_seq OWNED BY public.org_resign_reasons.id;


--
-- Name: org_resign_references; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_resign_references (
    id bigint NOT NULL,
    resign_id bigint,
    resign_reason_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: org_resign_references_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_resign_references_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_resign_references_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_resign_references_id_seq OWNED BY public.org_resign_references.id;


--
-- Name: org_resigns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_resigns (
    id bigint NOT NULL,
    member_id bigint,
    state character varying DEFAULT 'init'::character varying,
    leave_on date,
    reason_note character varying(4096),
    handover_note character varying(4096),
    comment character varying(4096),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: org_resigns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_resigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_resigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_resigns_id_seq OWNED BY public.org_resigns.id;


--
-- Name: org_super_job_titles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_super_job_titles (
    id bigint NOT NULL,
    organ_id bigint,
    name character varying,
    description character varying,
    grade integer,
    cached_role_ids integer[],
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: org_super_job_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_super_job_titles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_super_job_titles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_super_job_titles_id_seq OWNED BY public.org_super_job_titles.id;


--
-- Name: org_supports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_supports (
    id bigint NOT NULL,
    department_id bigint,
    organ_id bigint,
    member_id bigint,
    name character varying,
    grade integer,
    code character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    supporter_id bigint,
    department_ancestors json
);


--
-- Name: org_supports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_supports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_supports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_supports_id_seq OWNED BY public.org_supports.id;


--
-- Name: org_tutorials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.org_tutorials (
    id bigint NOT NULL,
    member_id bigint,
    tutor_id bigint,
    kind character varying,
    state character varying,
    accepted_status character varying,
    verified character varying,
    start_on date,
    finish_on date,
    performance character varying,
    allowance integer,
    note character varying(4096),
    comment character varying(4096),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: org_tutorials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.org_tutorials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: org_tutorials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.org_tutorials_id_seq OWNED BY public.org_tutorials.id;


--
-- Name: plan_participants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plan_participants (
    id bigint NOT NULL,
    event_participant_id bigint,
    participant_type character varying,
    participant_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    planning_type character varying,
    planning_id bigint,
    type character varying,
    status character varying
);


--
-- Name: COLUMN plan_participants.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.plan_participants.status IS '默认 event_participant 有效';


--
-- Name: plan_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plan_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plan_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plan_participants_id_seq OWNED BY public.plan_participants.id;


--
-- Name: profiled_address_organs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiled_address_organs (
    id bigint NOT NULL,
    organ_id bigint,
    address_id bigint,
    kind character varying,
    "default" boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: profiled_address_organs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profiled_address_organs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiled_address_organs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profiled_address_organs_id_seq OWNED BY public.profiled_address_organs.id;


--
-- Name: profiled_address_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiled_address_users (
    id bigint NOT NULL,
    address_id bigint,
    user_id bigint,
    inviter_id bigint,
    commission_ratio numeric(4,2) DEFAULT 0.0,
    kind character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    role character varying DEFAULT 'ordinary'::character varying
);


--
-- Name: COLUMN profiled_address_users.commission_ratio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.profiled_address_users.commission_ratio IS '佣金比例';


--
-- Name: profiled_address_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profiled_address_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiled_address_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profiled_address_users_id_seq OWNED BY public.profiled_address_users.id;


--
-- Name: profiled_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiled_addresses (
    id bigint NOT NULL,
    area_id bigint,
    detail character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    contact character varying,
    tel character varying,
    post_code character varying,
    source character varying,
    cached_key character varying,
    area_ancestors json
);


--
-- Name: profiled_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profiled_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiled_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profiled_addresses_id_seq OWNED BY public.profiled_addresses.id;


--
-- Name: profiled_area_hierarchies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiled_area_hierarchies (
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: profiled_areas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiled_areas (
    id bigint NOT NULL,
    name character varying,
    names character varying[],
    parent_id bigint,
    published boolean DEFAULT true,
    popular boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    parent_ancestors json,
    timezone character varying,
    locale character varying,
    "full" character varying,
    code character varying
);


--
-- Name: profiled_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profiled_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiled_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profiled_areas_id_seq OWNED BY public.profiled_areas.id;


--
-- Name: profiled_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiled_profiles (
    id bigint NOT NULL,
    gender character varying,
    birthday_type character varying,
    birthday date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organ_id bigint,
    real_name character varying,
    nick_name character varying,
    identity character varying,
    extra jsonb DEFAULT '{}'::jsonb
);


--
-- Name: profiled_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profiled_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiled_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profiled_profiles_id_seq OWNED BY public.profiled_profiles.id;


--
-- Name: project_taxon_facilitates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_taxon_facilitates (
    id bigint NOT NULL,
    taxon_id bigint,
    facilitate_taxon_id bigint,
    facilitate_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: project_taxon_facilitates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.project_taxon_facilitates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_taxon_facilitates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.project_taxon_facilitates_id_seq OWNED BY public.project_taxon_facilitates.id;


--
-- Name: project_taxon_indicators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_taxon_indicators (
    id bigint NOT NULL,
    taxon_id bigint,
    facilitate_taxon_id bigint,
    indicator_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: project_taxon_indicators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.project_taxon_indicators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_taxon_indicators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.project_taxon_indicators_id_seq OWNED BY public.project_taxon_indicators.id;


--
-- Name: project_taxons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.project_taxons (
    id bigint NOT NULL,
    name character varying,
    record_name character varying DEFAULT 'ProjectTaxon'::character varying,
    parameters jsonb DEFAULT '{}'::jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    fund_budget numeric,
    fund_expense numeric,
    budget_amount numeric,
    expense_amount numeric,
    projects_count integer,
    organ_id bigint
);


--
-- Name: project_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.project_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.project_taxons_id_seq OWNED BY public.project_taxons.id;


--
-- Name: quip_apps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quip_apps (
    id bigint NOT NULL,
    organ_id bigint,
    user_id bigint,
    access_token character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    private_folder_id character varying,
    name character varying,
    profile_picture_url character varying
);


--
-- Name: quip_apps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.quip_apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quip_apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.quip_apps_id_seq OWNED BY public.quip_apps.id;


--
-- Name: requirements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.requirements (
    id bigint NOT NULL,
    name character varying,
    "from" character varying,
    "to" character varying,
    pick_on date,
    pick_at time without time zone,
    note character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint,
    volunteer_id bigint,
    state character varying DEFAULT 'init'::character varying,
    from_area_id bigint,
    to_area_id bigint
);


--
-- Name: requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.requirements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.requirements_id_seq OWNED BY public.requirements.id;


--
-- Name: roled_busynesses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roled_busynesses (
    id bigint NOT NULL,
    identifier character varying,
    "position" integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying
);


--
-- Name: roled_busynesses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roled_busynesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roled_busynesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roled_busynesses_id_seq OWNED BY public.roled_busynesses.id;


--
-- Name: roled_governs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roled_governs (
    id integer NOT NULL,
    "position" integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    namespace_identifier character varying,
    business_identifier character varying,
    controller_path character varying,
    controller_name character varying
);


--
-- Name: roled_governs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roled_governs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roled_governs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roled_governs_id_seq OWNED BY public.roled_governs.id;


--
-- Name: roled_name_spaces; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roled_name_spaces (
    id bigint NOT NULL,
    name character varying,
    identifier character varying,
    verify_organ boolean,
    verify_member boolean,
    verify_user boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: roled_name_spaces_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roled_name_spaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roled_name_spaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roled_name_spaces_id_seq OWNED BY public.roled_name_spaces.id;


--
-- Name: roled_role_rules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roled_role_rules (
    id integer NOT NULL,
    role_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    params_name character varying,
    params_identifier character varying,
    business_identifier character varying,
    namespace_identifier character varying,
    action_name character varying,
    controller_path character varying,
    meta_action_id bigint
);


--
-- Name: roled_role_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roled_role_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roled_role_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roled_role_rules_id_seq OWNED BY public.roled_role_rules.id;


--
-- Name: roled_role_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roled_role_types (
    id bigint NOT NULL,
    role_id bigint,
    who_type character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: roled_role_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roled_role_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roled_role_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roled_role_types_id_seq OWNED BY public.roled_role_types.id;


--
-- Name: roled_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roled_roles (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    visible boolean,
    who_types character varying[],
    role_hash jsonb DEFAULT '{}'::jsonb,
    "default" boolean
);


--
-- Name: roled_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roled_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roled_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roled_roles_id_seq OWNED BY public.roled_roles.id;


--
-- Name: roled_rule_operations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roled_rule_operations (
    id bigint NOT NULL,
    action_name character varying,
    operation character varying DEFAULT 'read'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: roled_rule_operations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roled_rule_operations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roled_rule_operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roled_rule_operations_id_seq OWNED BY public.roled_rule_operations.id;


--
-- Name: roled_rules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roled_rules (
    id integer NOT NULL,
    "position" integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    namespace_identifier character varying,
    business_identifier character varying,
    action_name character varying,
    operation character varying DEFAULT 'read'::character varying,
    controller_path character varying,
    controller_name character varying,
    path character varying,
    verb character varying,
    required_parts character varying[],
    landmark boolean
);


--
-- Name: roled_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roled_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roled_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roled_rules_id_seq OWNED BY public.roled_rules.id;


--
-- Name: roled_who_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roled_who_roles (
    id bigint NOT NULL,
    who_type character varying,
    who_id bigint,
    role_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: roled_who_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roled_who_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roled_who_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roled_who_roles_id_seq OWNED BY public.roled_who_roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: ship_cars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ship_cars (
    id bigint NOT NULL,
    location character varying,
    number character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint,
    detail jsonb
);


--
-- Name: ship_cars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ship_cars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ship_cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ship_cars_id_seq OWNED BY public.ship_cars.id;


--
-- Name: ship_drivers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ship_drivers (
    id bigint NOT NULL,
    user_id bigint,
    name character varying,
    number character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    detail jsonb
);


--
-- Name: ship_drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ship_drivers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ship_drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ship_drivers_id_seq OWNED BY public.ship_drivers.id;


--
-- Name: ship_favorites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ship_favorites (
    id bigint NOT NULL,
    user_id bigint,
    driver_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    remark character varying
);


--
-- Name: ship_favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ship_favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ship_favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ship_favorites_id_seq OWNED BY public.ship_favorites.id;


--
-- Name: ship_line_similars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ship_line_similars (
    id bigint NOT NULL,
    line_id bigint,
    similar_id bigint,
    "position" integer,
    score numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: ship_line_similars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ship_line_similars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ship_line_similars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ship_line_similars_id_seq OWNED BY public.ship_line_similars.id;


--
-- Name: ship_lines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ship_lines (
    id bigint NOT NULL,
    start_name character varying,
    finish_name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    locations_count integer DEFAULT 0,
    user_id bigint,
    path path,
    pathway polygon,
    name character varying
);


--
-- Name: ship_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ship_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ship_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ship_lines_id_seq OWNED BY public.ship_lines.id;


--
-- Name: ship_locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ship_locations (
    id bigint NOT NULL,
    area_id bigint,
    line_id bigint,
    poiname character varying,
    poiaddress character varying,
    cityname character varying,
    lat numeric(10,8),
    lng numeric(11,8),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "position" integer,
    coordinate point
);


--
-- Name: ship_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ship_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ship_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ship_locations_id_seq OWNED BY public.ship_locations.id;


--
-- Name: ship_packageds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ship_packageds (
    id bigint NOT NULL,
    package_id bigint,
    trade_item_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    trade_item_status character varying
);


--
-- Name: ship_packageds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ship_packageds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ship_packageds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ship_packageds_id_seq OWNED BY public.ship_packageds.id;


--
-- Name: ship_packages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ship_packages (
    id bigint NOT NULL,
    state character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    expected_on date,
    pick_mode character varying,
    address_id bigint,
    wait_item_id bigint,
    user_id bigint,
    produce_plan_id bigint
);


--
-- Name: ship_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ship_packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ship_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ship_packages_id_seq OWNED BY public.ship_packages.id;


--
-- Name: ship_shipments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ship_shipments (
    id bigint NOT NULL,
    package_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    shipping_type character varying,
    shipping_id bigint,
    address_id bigint,
    state character varying
);


--
-- Name: ship_shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ship_shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ship_shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ship_shipments_id_seq OWNED BY public.ship_shipments.id;


--
-- Name: stats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stats (
    id bigint NOT NULL,
    subscribed_requests_count integer,
    oauth_users_count integer,
    users_count integer,
    requirements_count integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    date date
);


--
-- Name: stats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stats_id_seq OWNED BY public.stats.id;


--
-- Name: trade_advances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_advances (
    id bigint NOT NULL,
    price numeric(10,2),
    apple_product_id character varying,
    amount numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    card_template_id bigint,
    name character varying,
    sku character varying,
    advance_price numeric DEFAULT 0.0,
    extra json DEFAULT '{}'::json,
    unit character varying,
    quantity numeric DEFAULT 0.0,
    unified_quantity numeric DEFAULT 0.0
);


--
-- Name: trade_advances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_advances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_advances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_advances_id_seq OWNED BY public.trade_advances.id;


--
-- Name: trade_card_advances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_card_advances (
    id bigint NOT NULL,
    card_id bigint,
    advance_id bigint,
    trade_item_id bigint,
    price numeric(10,2),
    amount numeric(10,2),
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    note character varying,
    kind character varying,
    card_prepayment_id bigint
);


--
-- Name: trade_card_advances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_card_advances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_card_advances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_card_advances_id_seq OWNED BY public.trade_card_advances.id;


--
-- Name: trade_card_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_card_logs (
    id bigint NOT NULL,
    card_id bigint,
    source_type character varying,
    source_id bigint,
    amount numeric(10,2),
    title character varying,
    tag_str character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: trade_card_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_card_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_card_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_card_logs_id_seq OWNED BY public.trade_card_logs.id;


--
-- Name: trade_card_prepayments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_card_prepayments (
    id bigint NOT NULL,
    card_template_id bigint,
    token character varying,
    amount numeric,
    expire_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: trade_card_prepayments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_card_prepayments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_card_prepayments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_card_prepayments_id_seq OWNED BY public.trade_card_prepayments.id;


--
-- Name: trade_card_promotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_card_promotes (
    id bigint NOT NULL,
    card_template_id bigint,
    promote_id bigint,
    income_min numeric(10,2) DEFAULT 0.0,
    income_max numeric(10,2) DEFAULT 99999999.98999999,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: trade_card_promotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_card_promotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_card_promotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_card_promotes_id_seq OWNED BY public.trade_card_promotes.id;


--
-- Name: trade_card_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_card_templates (
    id bigint NOT NULL,
    organ_id bigint,
    name character varying,
    valid_days integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description character varying,
    valid_years integer DEFAULT 0,
    valid_months integer DEFAULT 0,
    currency character varying,
    "default" boolean,
    text_color character varying
);


--
-- Name: trade_card_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_card_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_card_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_card_templates_id_seq OWNED BY public.trade_card_templates.id;


--
-- Name: trade_cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_cards (
    id bigint NOT NULL,
    organ_id bigint,
    card_template_id bigint,
    trade_item_id bigint,
    client_id bigint,
    card_uuid character varying,
    amount numeric(10,2),
    expense_amount numeric(10,2),
    income_amount numeric(10,2),
    lock_version integer,
    effect_at timestamp without time zone,
    expire_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    agency_id bigint,
    user_id bigint,
    member_id bigint,
    currency character varying
);


--
-- Name: trade_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_cards_id_seq OWNED BY public.trade_cards.id;


--
-- Name: trade_carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_carts (
    id bigint NOT NULL,
    amount numeric(10,2),
    user_id bigint,
    payment_strategy_id bigint,
    deposit_ratio integer,
    organ_id bigint,
    trade_items_count integer DEFAULT 0,
    retail_price numeric DEFAULT 0.0,
    discount_price numeric DEFAULT 0.0,
    bulk_price numeric DEFAULT 0.0,
    total_quantity numeric DEFAULT 0.0,
    item_amount numeric DEFAULT 0.0,
    overall_additional_amount numeric DEFAULT 0.0,
    overall_reduced_amount numeric DEFAULT 0.0,
    address_id bigint,
    lock_version integer,
    original_amount numeric DEFAULT 0.0,
    member_id bigint,
    current boolean DEFAULT false
);


--
-- Name: COLUMN trade_carts.retail_price; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.trade_carts.retail_price IS '商品汇总的原价';


--
-- Name: COLUMN trade_carts.original_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.trade_carts.original_amount IS '原价，应用优惠之前的价格';


--
-- Name: trade_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_carts_id_seq OWNED BY public.trade_carts.id;


--
-- Name: trade_cash_givens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_cash_givens (
    id bigint NOT NULL,
    cash_id bigint,
    organ_id bigint,
    title character varying,
    amount numeric DEFAULT 0.0,
    note character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: trade_cash_givens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_cash_givens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_cash_givens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_cash_givens_id_seq OWNED BY public.trade_cash_givens.id;


--
-- Name: trade_cash_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_cash_logs (
    id bigint NOT NULL,
    cash_id bigint,
    user_id bigint,
    source_type character varying,
    source_id bigint,
    amount numeric(10,2),
    title character varying,
    tag_str character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: trade_cash_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_cash_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_cash_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_cash_logs_id_seq OWNED BY public.trade_cash_logs.id;


--
-- Name: trade_cashes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_cashes (
    id bigint NOT NULL,
    user_id bigint,
    amount numeric(10,2) DEFAULT 0.0,
    income_amount numeric(10,2) DEFAULT 0.0,
    expense_amount numeric(10,2) DEFAULT 0.0,
    lock_version integer,
    account_bank character varying,
    account_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    account_number character varying
);


--
-- Name: trade_cashes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_cashes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_cashes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_cashes_id_seq OWNED BY public.trade_cashes.id;


--
-- Name: trade_exchange_rates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_exchange_rates (
    id bigint NOT NULL,
    "from" character varying,
    "to" character varying,
    rate numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: trade_exchange_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_exchange_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_exchange_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_exchange_rates_id_seq OWNED BY public.trade_exchange_rates.id;


--
-- Name: trade_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_orders (
    id bigint NOT NULL,
    uuid character varying NOT NULL,
    state character varying DEFAULT 0,
    amount numeric(10,2),
    received_amount numeric(10,2),
    item_amount numeric(10,2),
    currency character varying,
    payment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    payment_strategy_id bigint,
    myself boolean,
    overall_reduced_amount numeric(10,2),
    overall_additional_amount numeric(10,2),
    payment_status character varying,
    user_id bigint,
    cart_id bigint,
    organ_id bigint,
    lock_version integer,
    note character varying(4096),
    expire_at timestamp without time zone,
    extra json DEFAULT '{}'::json,
    trade_items_count integer DEFAULT 0,
    address_id bigint,
    produce_plan_id bigint,
    original_amount numeric DEFAULT 0.0
);


--
-- Name: COLUMN trade_orders.original_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.trade_orders.original_amount IS '原价，应用优惠之前的价格';


--
-- Name: trade_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_orders_id_seq OWNED BY public.trade_orders.id;


--
-- Name: trade_payment_methods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_payment_methods (
    id bigint NOT NULL,
    type character varying,
    account_name character varying,
    account_num character varying,
    bank character varying,
    extra text,
    verified boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    creator_id bigint,
    myself boolean DEFAULT true
);


--
-- Name: trade_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_payment_methods_id_seq OWNED BY public.trade_payment_methods.id;


--
-- Name: trade_payment_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_payment_orders (
    id bigint NOT NULL,
    payment_id bigint,
    order_id bigint,
    check_amount numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying
);


--
-- Name: trade_payment_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_payment_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_payment_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_payment_orders_id_seq OWNED BY public.trade_payment_orders.id;


--
-- Name: trade_payment_references; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_payment_references (
    id bigint NOT NULL,
    payment_method_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying,
    cart_id bigint
);


--
-- Name: trade_payment_references_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_payment_references_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_payment_references_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_payment_references_id_seq OWNED BY public.trade_payment_references.id;


--
-- Name: trade_payment_strategies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_payment_strategies (
    id bigint NOT NULL,
    name character varying,
    strategy character varying,
    period integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: trade_payment_strategies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_payment_strategies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_payment_strategies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_payment_strategies_id_seq OWNED BY public.trade_payment_strategies.id;


--
-- Name: trade_payments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_payments (
    id bigint NOT NULL,
    type character varying(255),
    total_amount numeric(10,2),
    fee_amount numeric(10,2),
    income_amount numeric(10,2),
    checked_amount numeric(10,2),
    adjust_amount numeric(10,2) DEFAULT 0,
    payment_uuid character varying(255),
    notify_type character varying(255),
    notified_at timestamp without time zone,
    pay_status character varying(255),
    seller_identifier character varying(255),
    buyer_name character varying(255),
    buyer_identifier character varying(255),
    buyer_bank character varying,
    user_id integer,
    currency character varying(255),
    comment character varying,
    payment_method_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying,
    organ_id bigint,
    verified boolean DEFAULT true,
    lock_version integer,
    refunded_amount numeric DEFAULT 0.0,
    card_id bigint
);


--
-- Name: trade_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_payments_id_seq OWNED BY public.trade_payments.id;


--
-- Name: trade_payouts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_payouts (
    id bigint NOT NULL,
    type character varying,
    payable_type character varying,
    payable_id bigint,
    operator_id bigint,
    cash_id bigint,
    payout_uuid character varying,
    requested_amount numeric(10,2),
    actual_amount numeric(10,2),
    state character varying,
    paid_at timestamp without time zone,
    advance boolean DEFAULT false,
    account_bank character varying,
    account_name character varying,
    account_num character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: trade_payouts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_payouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_payouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_payouts_id_seq OWNED BY public.trade_payouts.id;


--
-- Name: trade_promote_carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_promote_carts (
    id bigint NOT NULL,
    promote_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying,
    status character varying,
    trade_promotes_count integer DEFAULT 0,
    promote_good_id bigint,
    effect_at timestamp without time zone,
    expire_at timestamp without time zone,
    cart_id bigint
);


--
-- Name: trade_promote_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_promote_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_promote_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_promote_carts_id_seq OWNED BY public.trade_promote_carts.id;


--
-- Name: trade_promote_charges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_promote_charges (
    id bigint NOT NULL,
    promote_id bigint,
    min numeric(10,2) DEFAULT 0,
    max numeric(10,2) DEFAULT 99999999.99,
    parameter numeric(10,2),
    type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    contain_max boolean,
    contain_min boolean,
    base_price numeric(10,2),
    unit character varying,
    filter_min numeric(10,2),
    filter_max numeric(10,2)
);


--
-- Name: trade_promote_charges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_promote_charges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_promote_charges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_promote_charges_id_seq OWNED BY public.trade_promote_charges.id;


--
-- Name: trade_promote_extras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_promote_extras (
    id bigint NOT NULL,
    promote_id bigint,
    extra_name character varying,
    column_name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: trade_promote_extras_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_promote_extras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_promote_extras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_promote_extras_id_seq OWNED BY public.trade_promote_extras.id;


--
-- Name: trade_promote_goods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_promote_goods (
    id bigint NOT NULL,
    good_type character varying,
    good_id bigint,
    promote_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status character varying,
    effect_at timestamp without time zone,
    expire_at timestamp without time zone
);


--
-- Name: trade_promote_goods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_promote_goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_promote_goods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_promote_goods_id_seq OWNED BY public.trade_promote_goods.id;


--
-- Name: trade_promotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_promotes (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    verified boolean DEFAULT false,
    sequence integer DEFAULT 1,
    scope character varying,
    extra character varying[],
    short_name character varying,
    description character varying,
    code character varying,
    deal_type character varying,
    deal_id bigint,
    metering character varying,
    editable boolean,
    organ_id bigint
);


--
-- Name: trade_promotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_promotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_promotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_promotes_id_seq OWNED BY public.trade_promotes.id;


--
-- Name: trade_refunds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_refunds (
    id bigint NOT NULL,
    order_id bigint,
    payment_id bigint,
    operator_id bigint,
    type character varying,
    total_amount numeric(10,2),
    buyer_identifier character varying,
    comment character varying(512),
    state character varying DEFAULT 0,
    refunded_at timestamp without time zone,
    reason character varying(512),
    currency character varying,
    refund_uuid character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    response json,
    organ_id bigint
);


--
-- Name: trade_refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_refunds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_refunds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_refunds_id_seq OWNED BY public.trade_refunds.id;


--
-- Name: trade_trade_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_trade_items (
    id bigint NOT NULL,
    good_type character varying,
    good_id bigint,
    amount numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number integer,
    reduced_amount numeric(10,2),
    additional_amount numeric(10,2),
    single_price numeric(10,2),
    myself boolean,
    starred boolean,
    original_amount numeric(10,2),
    retail_price numeric(10,2),
    wholesale_price numeric(10,2),
    status character varying,
    good_name character varying,
    weight numeric DEFAULT 0.0,
    unit character varying,
    note character varying,
    advance_amount numeric DEFAULT 0.0,
    extra json DEFAULT '{}'::json,
    address_id bigint,
    user_id bigint,
    produce_plan_id bigint,
    cart_id bigint,
    order_id bigint,
    member_id bigint
);


--
-- Name: COLUMN trade_trade_items.weight; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.trade_trade_items.weight IS '重量';


--
-- Name: COLUMN trade_trade_items.unit; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.trade_trade_items.unit IS '单位';


--
-- Name: trade_trade_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_trade_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_trade_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_trade_items_id_seq OWNED BY public.trade_trade_items.id;


--
-- Name: trade_trade_promotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trade_trade_promotes (
    id bigint NOT NULL,
    promote_id bigint,
    promote_charge_id bigint,
    amount numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    trade_item_id bigint,
    promote_good_id bigint,
    sequence integer,
    based_amount numeric(10,2),
    original_amount numeric(10,2),
    computed_amount numeric(10,2),
    note character varying,
    promote_cart_id bigint,
    edited boolean,
    cart_id bigint,
    order_id bigint,
    status character varying DEFAULT 'init'::character varying,
    promote_name character varying
);


--
-- Name: COLUMN trade_trade_promotes.edited; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.trade_trade_promotes.edited IS '是否被客服改过价';


--
-- Name: trade_trade_promotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trade_trade_promotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trade_trade_promotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trade_trade_promotes_id_seq OWNED BY public.trade_trade_promotes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    password_digest character varying,
    last_login_at timestamp without time zone,
    last_login_ip inet,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    disabled boolean DEFAULT false,
    pomodoro integer DEFAULT 25,
    timezone character varying,
    locale character varying,
    source character varying,
    cached_role_ids integer[],
    invited_code character varying,
    notifiable_types character varying[] DEFAULT '{}'::character varying[],
    counters jsonb DEFAULT '{}'::jsonb,
    showtime integer DEFAULT 0,
    accept_email boolean DEFAULT true
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wechat_agencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_agencies (
    id bigint NOT NULL,
    platform_id bigint,
    appid character varying,
    access_token character varying,
    access_token_expires_at timestamp without time zone,
    refresh_token character varying,
    func_infos character varying[],
    nick_name character varying,
    head_img character varying,
    user_name character varying,
    principal_name character varying,
    alias_name character varying,
    qrcode_url character varying,
    business_info json,
    service_type character varying,
    verify_type character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wechat_agencies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_agencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_agencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_agencies_id_seq OWNED BY public.wechat_agencies.id;


--
-- Name: wechat_apps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_apps (
    id bigint NOT NULL,
    name character varying NOT NULL,
    enabled boolean DEFAULT true,
    appid character varying,
    secret character varying,
    agentid character varying,
    encrypt_mode boolean,
    encoding_aes_key character varying,
    token character varying NOT NULL,
    access_token character varying,
    jsapi_ticket character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    organ_id bigint,
    type character varying,
    access_token_expires_at timestamp without time zone,
    jsapi_ticket_expires_at timestamp without time zone,
    mch_id character varying,
    key character varying,
    shared boolean,
    oauth2_state character varying,
    user_name character varying,
    oauth_enable boolean DEFAULT true,
    apiclient_cert character varying,
    apiclient_key character varying,
    key_v3 character varying,
    serial_no character varying,
    inviting boolean DEFAULT false,
    domain character varying,
    url_link character varying
);


--
-- Name: COLUMN wechat_apps.key_v3; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wechat_apps.key_v3 IS '支付通知解密';


--
-- Name: COLUMN wechat_apps.inviting; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wechat_apps.inviting IS '可邀请加入';


--
-- Name: wechat_apps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_apps_id_seq OWNED BY public.wechat_apps.id;


--
-- Name: wechat_auths; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_auths (
    id bigint NOT NULL,
    platform_id bigint,
    auth_code character varying,
    auth_code_expires_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    request_id bigint,
    testcase boolean
);


--
-- Name: wechat_auths_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_auths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_auths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_auths_id_seq OWNED BY public.wechat_auths.id;


--
-- Name: wechat_extractions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_extractions (
    id bigint NOT NULL,
    extractor_id bigint,
    name character varying,
    matched character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    request_id bigint,
    serial_number integer
);


--
-- Name: wechat_extractions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_extractions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_extractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_extractions_id_seq OWNED BY public.wechat_extractions.id;


--
-- Name: wechat_extractors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_extractors (
    id bigint NOT NULL,
    name character varying,
    prefix character varying,
    suffix character varying,
    more boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    serial boolean,
    serial_start integer,
    start_at time without time zone,
    finish_at time without time zone,
    valid_response character varying,
    invalid_response character varying,
    response_id bigint
);


--
-- Name: wechat_extractors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_extractors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_extractors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_extractors_id_seq OWNED BY public.wechat_extractors.id;


--
-- Name: wechat_hooks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_hooks (
    id bigint NOT NULL,
    response_id bigint,
    hooked_type character varying,
    hooked_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wechat_hooks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_hooks_id_seq OWNED BY public.wechat_hooks.id;


--
-- Name: wechat_medias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_medias (
    id bigint NOT NULL,
    user_id bigint,
    source_type character varying,
    source_id bigint,
    attachment_name character varying,
    media_id character varying,
    appid character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wechat_medias_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_medias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_medias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_medias_id_seq OWNED BY public.wechat_medias.id;


--
-- Name: wechat_menus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_menus (
    id bigint NOT NULL,
    parent_id bigint,
    type character varying,
    name character varying,
    value character varying,
    appid character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "position" integer,
    mp_appid character varying,
    mp_pagepath character varying
);


--
-- Name: wechat_menus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_menus_id_seq OWNED BY public.wechat_menus.id;


--
-- Name: wechat_news_reply_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_news_reply_items (
    id bigint NOT NULL,
    news_reply_id bigint,
    title character varying,
    description character varying,
    url character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wechat_news_reply_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_news_reply_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_news_reply_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_news_reply_items_id_seq OWNED BY public.wechat_news_reply_items.id;


--
-- Name: wechat_notices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_notices (
    id bigint NOT NULL,
    template_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    notification_id bigint,
    subscribe_id bigint,
    link character varying DEFAULT 'index'::character varying,
    msg_id character varying,
    status character varying,
    type character varying,
    appid character varying,
    open_id character varying
);


--
-- Name: wechat_notices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_notices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_notices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_notices_id_seq OWNED BY public.wechat_notices.id;


--
-- Name: wechat_platforms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_platforms (
    id bigint NOT NULL,
    name character varying,
    appid character varying,
    secret character varying,
    token character varying,
    encoding_aes_key character varying,
    verify_ticket character varying,
    access_token character varying,
    access_token_expires_at timestamp without time zone,
    pre_auth_code character varying,
    pre_auth_code_expires_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wechat_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_platforms_id_seq OWNED BY public.wechat_platforms.id;


--
-- Name: wechat_receives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_receives (
    id bigint NOT NULL,
    platform_id bigint,
    appid character varying,
    open_id character varying,
    msg_id character varying,
    msg_type character varying,
    content character varying,
    encrypt_data character varying,
    message_hash json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wechat_receives_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_receives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_receives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_receives_id_seq OWNED BY public.wechat_receives.id;


--
-- Name: wechat_registers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_registers (
    id bigint NOT NULL,
    id_name character varying,
    id_number character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    state character varying DEFAULT 'init'::character varying,
    appid character varying,
    user_id bigint,
    organ_id bigint,
    email_code character varying,
    password character varying,
    mobile character varying,
    mobile_code character varying
);


--
-- Name: wechat_registers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_registers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_registers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_registers_id_seq OWNED BY public.wechat_registers.id;


--
-- Name: wechat_replies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_replies (
    id bigint NOT NULL,
    messaging_type character varying,
    messaging_id bigint,
    type character varying,
    value character varying,
    body json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    title character varying,
    description character varying,
    appid character varying,
    msg_type character varying DEFAULT 'news'::character varying
);


--
-- Name: wechat_replies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_replies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_replies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_replies_id_seq OWNED BY public.wechat_replies.id;


--
-- Name: wechat_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_requests (
    id bigint NOT NULL,
    body text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    type character varying,
    msg_type character varying,
    event character varying,
    event_key character varying,
    raw_body jsonb,
    appid character varying,
    open_id character varying,
    receive_id bigint,
    init_wechat_user boolean,
    init_user_tag boolean,
    reply_body jsonb,
    reply_encrypt jsonb
);


--
-- Name: wechat_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_requests_id_seq OWNED BY public.wechat_requests.id;


--
-- Name: wechat_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_responses (
    id bigint NOT NULL,
    match_value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    expire_at timestamp without time zone,
    contain boolean DEFAULT true,
    request_types character varying[],
    appid character varying,
    enabled boolean DEFAULT true,
    reply_id bigint
);


--
-- Name: wechat_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_responses_id_seq OWNED BY public.wechat_responses.id;


--
-- Name: wechat_scene_menus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_scene_menus (
    id bigint NOT NULL,
    scene_id bigint,
    menu_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    tag_id bigint
);


--
-- Name: wechat_scene_menus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_scene_menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_scene_menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_scene_menus_id_seq OWNED BY public.wechat_scene_menus.id;


--
-- Name: wechat_scenes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_scenes (
    id bigint NOT NULL,
    organ_id bigint,
    match_value character varying,
    expire_seconds integer,
    expire_at timestamp without time zone,
    qrcode_ticket character varying,
    qrcode_url character varying,
    appid character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    menu_id character varying
);


--
-- Name: wechat_scenes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_scenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_scenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_scenes_id_seq OWNED BY public.wechat_scenes.id;


--
-- Name: wechat_services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_services (
    id bigint NOT NULL,
    request_id bigint,
    type character varying,
    msgtype character varying,
    value character varying,
    appid character varying,
    open_id character varying,
    body json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wechat_services_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_services_id_seq OWNED BY public.wechat_services.id;


--
-- Name: wechat_subscribes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_subscribes (
    id bigint NOT NULL,
    wechat_user_id bigint,
    template_id bigint,
    sending_at timestamp without time zone,
    status character varying DEFAULT 'accept'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wechat_subscribes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_subscribes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_subscribes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_subscribes_id_seq OWNED BY public.wechat_subscribes.id;


--
-- Name: wechat_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_tags (
    id bigint NOT NULL,
    name character varying,
    tag_id character varying,
    count integer,
    user_tags_count integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_tag_id bigint,
    tagging_type character varying,
    tagging_id bigint,
    appid character varying
);


--
-- Name: wechat_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_tags_id_seq OWNED BY public.wechat_tags.id;


--
-- Name: wechat_template_configs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_template_configs (
    id bigint NOT NULL,
    type character varying,
    title character varying,
    tid character varying,
    description character varying,
    notifiable_type character varying,
    code character varying DEFAULT 'default'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    content character varying,
    appid character varying
);


--
-- Name: wechat_template_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_template_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_template_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_template_configs_id_seq OWNED BY public.wechat_template_configs.id;


--
-- Name: wechat_template_key_words; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_template_key_words (
    id bigint NOT NULL,
    template_config_id bigint,
    "position" integer,
    kid integer,
    name character varying,
    example character varying,
    rule character varying,
    mapping character varying,
    color character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wechat_template_key_words_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_template_key_words_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_template_key_words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_template_key_words_id_seq OWNED BY public.wechat_template_key_words.id;


--
-- Name: wechat_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_templates (
    id bigint NOT NULL,
    appid character varying,
    template_id character varying,
    title character varying,
    content character varying,
    example character varying,
    template_type integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    template_config_id bigint
);


--
-- Name: wechat_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_templates_id_seq OWNED BY public.wechat_templates.id;


--
-- Name: wechat_tickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_tickets (
    id bigint NOT NULL,
    signature character varying,
    "timestamp" integer,
    nonce character varying,
    msg_signature character varying,
    appid character varying,
    ticket_data character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wechat_tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_tickets_id_seq OWNED BY public.wechat_tickets.id;


--
-- Name: wechat_user_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wechat_user_tags (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_tagged_id bigint,
    appid character varying,
    tag_name character varying,
    open_id character varying
);


--
-- Name: wechat_user_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wechat_user_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wechat_user_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wechat_user_tags_id_seq OWNED BY public.wechat_user_tags.id;


--
-- Name: action_mailbox_inbound_emails id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_mailbox_inbound_emails ALTER COLUMN id SET DEFAULT nextval('public.action_mailbox_inbound_emails_id_seq'::regclass);


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: agential_agencies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agential_agencies ALTER COLUMN id SET DEFAULT nextval('public.agential_agencies_id_seq'::regclass);


--
-- Name: attend_absence_stats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_absence_stats ALTER COLUMN id SET DEFAULT nextval('public.attend_absence_stats_id_seq'::regclass);


--
-- Name: attend_absences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_absences ALTER COLUMN id SET DEFAULT nextval('public.attend_absences_id_seq'::regclass);


--
-- Name: attend_attendance_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_attendance_logs ALTER COLUMN id SET DEFAULT nextval('public.attend_attendance_logs_id_seq'::regclass);


--
-- Name: attend_attendance_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_attendance_settings ALTER COLUMN id SET DEFAULT nextval('public.attend_attendance_settings_id_seq'::regclass);


--
-- Name: attend_attendance_stats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_attendance_stats ALTER COLUMN id SET DEFAULT nextval('public.attend_attendance_stats_id_seq'::regclass);


--
-- Name: attend_attendances id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_attendances ALTER COLUMN id SET DEFAULT nextval('public.attend_attendances_id_seq'::regclass);


--
-- Name: attend_extra_days id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_extra_days ALTER COLUMN id SET DEFAULT nextval('public.attend_extra_days_id_seq'::regclass);


--
-- Name: attend_financial_months id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_financial_months ALTER COLUMN id SET DEFAULT nextval('public.attend_financial_months_id_seq'::regclass);


--
-- Name: attend_overtimes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_overtimes ALTER COLUMN id SET DEFAULT nextval('public.attend_overtimes_id_seq'::regclass);


--
-- Name: auditor_approvals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditor_approvals ALTER COLUMN id SET DEFAULT nextval('public.auditor_approvals_id_seq'::regclass);


--
-- Name: auditor_audits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditor_audits ALTER COLUMN id SET DEFAULT nextval('public.auditor_audits_id_seq'::regclass);


--
-- Name: auditor_verifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditor_verifications ALTER COLUMN id SET DEFAULT nextval('public.auditor_verifications_id_seq'::regclass);


--
-- Name: auditor_verifiers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditor_verifiers ALTER COLUMN id SET DEFAULT nextval('public.auditor_verifiers_id_seq'::regclass);


--
-- Name: auth_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_accounts ALTER COLUMN id SET DEFAULT nextval('public.auth_accounts_id_seq'::regclass);


--
-- Name: auth_apps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_apps ALTER COLUMN id SET DEFAULT nextval('public.auth_apps_id_seq'::regclass);


--
-- Name: auth_authorized_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_authorized_tokens ALTER COLUMN id SET DEFAULT nextval('public.auth_authorized_tokens_id_seq'::regclass);


--
-- Name: auth_oauth_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_oauth_users ALTER COLUMN id SET DEFAULT nextval('public.auth_oauth_users_id_seq'::regclass);


--
-- Name: auth_user_taggeds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_taggeds ALTER COLUMN id SET DEFAULT nextval('public.auth_user_taggeds_id_seq'::regclass);


--
-- Name: auth_user_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_tags ALTER COLUMN id SET DEFAULT nextval('public.auth_user_tags_id_seq'::regclass);


--
-- Name: auth_verify_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_verify_tokens ALTER COLUMN id SET DEFAULT nextval('public.auth_verify_tokens_id_seq'::regclass);


--
-- Name: bench_facilitate_indicators id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_facilitate_indicators ALTER COLUMN id SET DEFAULT nextval('public.bench_facilitate_indicators_id_seq'::regclass);


--
-- Name: bench_facilitate_providers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_facilitate_providers ALTER COLUMN id SET DEFAULT nextval('public.bench_facilitate_providers_id_seq'::regclass);


--
-- Name: bench_facilitate_taxon_hierarchies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_facilitate_taxon_hierarchies ALTER COLUMN id SET DEFAULT nextval('public.bench_facilitate_taxon_hierarchies_id_seq'::regclass);


--
-- Name: bench_facilitate_taxons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_facilitate_taxons ALTER COLUMN id SET DEFAULT nextval('public.bench_facilitate_taxons_id_seq'::regclass);


--
-- Name: bench_facilitates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_facilitates ALTER COLUMN id SET DEFAULT nextval('public.bench_facilitates_id_seq'::regclass);


--
-- Name: bench_indicators id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_indicators ALTER COLUMN id SET DEFAULT nextval('public.bench_indicators_id_seq'::regclass);


--
-- Name: bench_mileposts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_mileposts ALTER COLUMN id SET DEFAULT nextval('public.bench_mileposts_id_seq'::regclass);


--
-- Name: bench_project_facilitates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_project_facilitates ALTER COLUMN id SET DEFAULT nextval('public.bench_project_facilitates_id_seq'::regclass);


--
-- Name: bench_project_indicators id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_project_indicators ALTER COLUMN id SET DEFAULT nextval('public.bench_project_indicators_id_seq'::regclass);


--
-- Name: bench_project_mileposts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_project_mileposts ALTER COLUMN id SET DEFAULT nextval('public.bench_project_mileposts_id_seq'::regclass);


--
-- Name: bench_project_stages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_project_stages ALTER COLUMN id SET DEFAULT nextval('public.bench_project_stages_id_seq'::regclass);


--
-- Name: bench_project_webhooks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_project_webhooks ALTER COLUMN id SET DEFAULT nextval('public.bench_project_webhooks_id_seq'::regclass);


--
-- Name: bench_projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_projects ALTER COLUMN id SET DEFAULT nextval('public.bench_projects_id_seq'::regclass);


--
-- Name: bench_schedules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_schedules ALTER COLUMN id SET DEFAULT nextval('public.bench_schedules_id_seq'::regclass);


--
-- Name: bench_task_template_hierarchies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_task_template_hierarchies ALTER COLUMN id SET DEFAULT nextval('public.bench_task_template_hierarchies_id_seq'::regclass);


--
-- Name: bench_task_templates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_task_templates ALTER COLUMN id SET DEFAULT nextval('public.bench_task_templates_id_seq'::regclass);


--
-- Name: bench_task_timers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_task_timers ALTER COLUMN id SET DEFAULT nextval('public.bench_task_timers_id_seq'::regclass);


--
-- Name: bench_tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_tasks ALTER COLUMN id SET DEFAULT nextval('public.bench_tasks_id_seq'::regclass);


--
-- Name: com_acme_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_acme_accounts ALTER COLUMN id SET DEFAULT nextval('public.com_acme_accounts_id_seq'::regclass);


--
-- Name: com_acme_identifiers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_acme_identifiers ALTER COLUMN id SET DEFAULT nextval('public.com_acme_identifiers_id_seq'::regclass);


--
-- Name: com_acme_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_acme_orders ALTER COLUMN id SET DEFAULT nextval('public.com_acme_orders_id_seq'::regclass);


--
-- Name: com_blob_defaults id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_blob_defaults ALTER COLUMN id SET DEFAULT nextval('public.com_blob_defaults_id_seq'::regclass);


--
-- Name: com_cache_lists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_cache_lists ALTER COLUMN id SET DEFAULT nextval('public.com_cache_lists_id_seq'::regclass);


--
-- Name: com_csps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_csps ALTER COLUMN id SET DEFAULT nextval('public.com_csps_id_seq'::regclass);


--
-- Name: com_errs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_errs ALTER COLUMN id SET DEFAULT nextval('public.com_errs_id_seq'::regclass);


--
-- Name: com_infos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_infos ALTER COLUMN id SET DEFAULT nextval('public.com_infos_id_seq'::regclass);


--
-- Name: com_meta_actions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_actions ALTER COLUMN id SET DEFAULT nextval('public.com_meta_actions_id_seq'::regclass);


--
-- Name: com_meta_businesses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_businesses ALTER COLUMN id SET DEFAULT nextval('public.com_meta_businesses_id_seq'::regclass);


--
-- Name: com_meta_columns id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_columns ALTER COLUMN id SET DEFAULT nextval('public.com_meta_columns_id_seq'::regclass);


--
-- Name: com_meta_controllers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_controllers ALTER COLUMN id SET DEFAULT nextval('public.com_meta_controllers_id_seq'::regclass);


--
-- Name: com_meta_models id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_models ALTER COLUMN id SET DEFAULT nextval('public.com_meta_models_id_seq'::regclass);


--
-- Name: com_meta_namespaces id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_namespaces ALTER COLUMN id SET DEFAULT nextval('public.com_meta_namespaces_id_seq'::regclass);


--
-- Name: com_meta_operations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_operations ALTER COLUMN id SET DEFAULT nextval('public.com_meta_operations_id_seq'::regclass);


--
-- Name: datum_data_lists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.datum_data_lists ALTER COLUMN id SET DEFAULT nextval('public.datum_data_lists_id_seq'::regclass);


--
-- Name: datum_record_lists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.datum_record_lists ALTER COLUMN id SET DEFAULT nextval('public.datum_record_lists_id_seq'::regclass);


--
-- Name: datum_table_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.datum_table_items ALTER COLUMN id SET DEFAULT nextval('public.datum_table_items_id_seq'::regclass);


--
-- Name: datum_table_lists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.datum_table_lists ALTER COLUMN id SET DEFAULT nextval('public.datum_table_lists_id_seq'::regclass);


--
-- Name: detail_contents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_contents ALTER COLUMN id SET DEFAULT nextval('public.detail_contents_id_seq'::regclass);


--
-- Name: detail_entity_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_entity_items ALTER COLUMN id SET DEFAULT nextval('public.detail_entity_items_id_seq'::regclass);


--
-- Name: detail_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_items ALTER COLUMN id SET DEFAULT nextval('public.detail_items_id_seq'::regclass);


--
-- Name: detail_knowings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_knowings ALTER COLUMN id SET DEFAULT nextval('public.detail_knowings_id_seq'::regclass);


--
-- Name: detail_knowledge_hierarchies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_knowledge_hierarchies ALTER COLUMN id SET DEFAULT nextval('public.detail_knowledge_hierarchies_id_seq'::regclass);


--
-- Name: detail_knowledges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_knowledges ALTER COLUMN id SET DEFAULT nextval('public.detail_knowledges_id_seq'::regclass);


--
-- Name: detail_lists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_lists ALTER COLUMN id SET DEFAULT nextval('public.detail_lists_id_seq'::regclass);


--
-- Name: detail_post_syncs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_post_syncs ALTER COLUMN id SET DEFAULT nextval('public.detail_post_syncs_id_seq'::regclass);


--
-- Name: detail_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_posts ALTER COLUMN id SET DEFAULT nextval('public.detail_posts_id_seq'::regclass);


--
-- Name: detail_taxon_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_taxon_items ALTER COLUMN id SET DEFAULT nextval('public.detail_taxon_items_id_seq'::regclass);


--
-- Name: doc_maps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doc_maps ALTER COLUMN id SET DEFAULT nextval('public.doc_maps_id_seq'::regclass);


--
-- Name: doc_subjects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doc_subjects ALTER COLUMN id SET DEFAULT nextval('public.doc_subjects_id_seq'::regclass);


--
-- Name: email_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_logs ALTER COLUMN id SET DEFAULT nextval('public.email_logs_id_seq'::regclass);


--
-- Name: email_reasons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_reasons ALTER COLUMN id SET DEFAULT nextval('public.email_reasons_id_seq'::regclass);


--
-- Name: email_smtp_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_smtp_accounts ALTER COLUMN id SET DEFAULT nextval('public.email_smtp_accounts_id_seq'::regclass);


--
-- Name: email_smtps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_smtps ALTER COLUMN id SET DEFAULT nextval('public.email_smtps_id_seq'::regclass);


--
-- Name: email_subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.email_subscriptions_id_seq'::regclass);


--
-- Name: email_templates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_templates ALTER COLUMN id SET DEFAULT nextval('public.email_templates_id_seq'::regclass);


--
-- Name: event_participants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_participants ALTER COLUMN id SET DEFAULT nextval('public.event_participants_id_seq'::regclass);


--
-- Name: eventual_bookings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_bookings ALTER COLUMN id SET DEFAULT nextval('public.eventual_bookings_id_seq'::regclass);


--
-- Name: eventual_crowd_members id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_crowd_members ALTER COLUMN id SET DEFAULT nextval('public.eventual_crowd_members_id_seq'::regclass);


--
-- Name: eventual_crowds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_crowds ALTER COLUMN id SET DEFAULT nextval('public.eventual_crowds_id_seq'::regclass);


--
-- Name: eventual_event_crowds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_event_crowds ALTER COLUMN id SET DEFAULT nextval('public.eventual_event_crowds_id_seq'::regclass);


--
-- Name: eventual_event_grants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_event_grants ALTER COLUMN id SET DEFAULT nextval('public.eventual_event_grants_id_seq'::regclass);


--
-- Name: eventual_event_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_event_items ALTER COLUMN id SET DEFAULT nextval('public.eventual_event_items_id_seq'::regclass);


--
-- Name: eventual_event_participants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_event_participants ALTER COLUMN id SET DEFAULT nextval('public.eventual_event_participants_id_seq'::regclass);


--
-- Name: eventual_event_taxons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_event_taxons ALTER COLUMN id SET DEFAULT nextval('public.eventual_event_taxons_id_seq'::regclass);


--
-- Name: eventual_events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_events ALTER COLUMN id SET DEFAULT nextval('public.eventual_events_id_seq'::regclass);


--
-- Name: eventual_place_taxon_hierarchies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_place_taxon_hierarchies ALTER COLUMN id SET DEFAULT nextval('public.eventual_place_taxon_hierarchies_id_seq'::regclass);


--
-- Name: eventual_place_taxons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_place_taxons ALTER COLUMN id SET DEFAULT nextval('public.eventual_place_taxons_id_seq'::regclass);


--
-- Name: eventual_places id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_places ALTER COLUMN id SET DEFAULT nextval('public.eventual_places_id_seq'::regclass);


--
-- Name: eventual_plan_attenders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_plan_attenders ALTER COLUMN id SET DEFAULT nextval('public.eventual_plan_attenders_id_seq'::regclass);


--
-- Name: eventual_plan_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_plan_items ALTER COLUMN id SET DEFAULT nextval('public.eventual_plan_items_id_seq'::regclass);


--
-- Name: eventual_plan_participants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_plan_participants ALTER COLUMN id SET DEFAULT nextval('public.eventual_plan_participants_id_seq'::regclass);


--
-- Name: eventual_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_plans ALTER COLUMN id SET DEFAULT nextval('public.eventual_plans_id_seq'::regclass);


--
-- Name: eventual_seats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_seats ALTER COLUMN id SET DEFAULT nextval('public.eventual_seats_id_seq'::regclass);


--
-- Name: eventual_time_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_time_items ALTER COLUMN id SET DEFAULT nextval('public.eventual_time_items_id_seq'::regclass);


--
-- Name: eventual_time_lists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_time_lists ALTER COLUMN id SET DEFAULT nextval('public.eventual_time_lists_id_seq'::regclass);


--
-- Name: factory_factory_providers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_factory_providers ALTER COLUMN id SET DEFAULT nextval('public.factory_factory_providers_id_seq'::regclass);


--
-- Name: factory_factory_taxons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_factory_taxons ALTER COLUMN id SET DEFAULT nextval('public.factory_factory_taxons_id_seq'::regclass);


--
-- Name: factory_part_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_part_items ALTER COLUMN id SET DEFAULT nextval('public.factory_part_items_id_seq'::regclass);


--
-- Name: factory_part_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_part_plans ALTER COLUMN id SET DEFAULT nextval('public.factory_part_plans_id_seq'::regclass);


--
-- Name: factory_part_providers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_part_providers ALTER COLUMN id SET DEFAULT nextval('public.factory_part_providers_id_seq'::regclass);


--
-- Name: factory_part_taxons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_part_taxons ALTER COLUMN id SET DEFAULT nextval('public.factory_part_taxons_id_seq'::regclass);


--
-- Name: factory_parts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_parts ALTER COLUMN id SET DEFAULT nextval('public.factory_parts_id_seq'::regclass);


--
-- Name: factory_produce_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_produce_plans ALTER COLUMN id SET DEFAULT nextval('public.factory_produce_plans_id_seq'::regclass);


--
-- Name: factory_produces id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_produces ALTER COLUMN id SET DEFAULT nextval('public.factory_produces_id_seq'::regclass);


--
-- Name: factory_product_part_taxons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_product_part_taxons ALTER COLUMN id SET DEFAULT nextval('public.factory_product_part_taxons_id_seq'::regclass);


--
-- Name: factory_product_parts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_product_parts ALTER COLUMN id SET DEFAULT nextval('public.factory_product_parts_id_seq'::regclass);


--
-- Name: factory_product_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_product_plans ALTER COLUMN id SET DEFAULT nextval('public.factory_product_plans_id_seq'::regclass);


--
-- Name: factory_product_produces id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_product_produces ALTER COLUMN id SET DEFAULT nextval('public.factory_product_produces_id_seq'::regclass);


--
-- Name: factory_product_taxons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_product_taxons ALTER COLUMN id SET DEFAULT nextval('public.factory_product_taxons_id_seq'::regclass);


--
-- Name: factory_production_carts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_production_carts ALTER COLUMN id SET DEFAULT nextval('public.factory_production_carts_id_seq'::regclass);


--
-- Name: factory_production_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_production_items ALTER COLUMN id SET DEFAULT nextval('public.factory_production_items_id_seq'::regclass);


--
-- Name: factory_production_parts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_production_parts ALTER COLUMN id SET DEFAULT nextval('public.factory_production_parts_id_seq'::regclass);


--
-- Name: factory_productions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_productions ALTER COLUMN id SET DEFAULT nextval('public.factory_productions_id_seq'::regclass);


--
-- Name: factory_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_products ALTER COLUMN id SET DEFAULT nextval('public.factory_products_id_seq'::regclass);


--
-- Name: finance_assessments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_assessments ALTER COLUMN id SET DEFAULT nextval('public.finance_assessments_id_seq'::regclass);


--
-- Name: finance_budgets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_budgets ALTER COLUMN id SET DEFAULT nextval('public.finance_budgets_id_seq'::regclass);


--
-- Name: finance_expense_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_expense_items ALTER COLUMN id SET DEFAULT nextval('public.finance_expense_items_id_seq'::regclass);


--
-- Name: finance_expense_members id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_expense_members ALTER COLUMN id SET DEFAULT nextval('public.finance_expense_members_id_seq'::regclass);


--
-- Name: finance_expenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_expenses ALTER COLUMN id SET DEFAULT nextval('public.finance_expenses_id_seq'::regclass);


--
-- Name: finance_financial_taxon_hierarchies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_financial_taxon_hierarchies ALTER COLUMN id SET DEFAULT nextval('public.finance_financial_taxon_hierarchies_id_seq'::regclass);


--
-- Name: finance_financial_taxons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_financial_taxons ALTER COLUMN id SET DEFAULT nextval('public.finance_financial_taxons_id_seq'::regclass);


--
-- Name: finance_fund_incomes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_fund_incomes ALTER COLUMN id SET DEFAULT nextval('public.finance_fund_incomes_id_seq'::regclass);


--
-- Name: finance_funds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_funds ALTER COLUMN id SET DEFAULT nextval('public.finance_funds_id_seq'::regclass);


--
-- Name: finance_stocks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_stocks ALTER COLUMN id SET DEFAULT nextval('public.finance_stocks_id_seq'::regclass);


--
-- Name: growth_aim_codes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_aim_codes ALTER COLUMN id SET DEFAULT nextval('public.growth_aim_codes_id_seq'::regclass);


--
-- Name: growth_aim_entities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_aim_entities ALTER COLUMN id SET DEFAULT nextval('public.growth_aim_entities_id_seq'::regclass);


--
-- Name: growth_aim_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_aim_logs ALTER COLUMN id SET DEFAULT nextval('public.growth_aim_logs_id_seq'::regclass);


--
-- Name: growth_aim_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_aim_users ALTER COLUMN id SET DEFAULT nextval('public.growth_aim_users_id_seq'::regclass);


--
-- Name: growth_aims id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_aims ALTER COLUMN id SET DEFAULT nextval('public.growth_aims_id_seq'::regclass);


--
-- Name: growth_praise_incomes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_praise_incomes ALTER COLUMN id SET DEFAULT nextval('public.growth_praise_incomes_id_seq'::regclass);


--
-- Name: growth_praise_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_praise_users ALTER COLUMN id SET DEFAULT nextval('public.growth_praise_users_id_seq'::regclass);


--
-- Name: growth_reward_expenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_reward_expenses ALTER COLUMN id SET DEFAULT nextval('public.growth_reward_expenses_id_seq'::regclass);


--
-- Name: growth_reward_incomes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_reward_incomes ALTER COLUMN id SET DEFAULT nextval('public.growth_reward_incomes_id_seq'::regclass);


--
-- Name: growth_rewards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_rewards ALTER COLUMN id SET DEFAULT nextval('public.growth_rewards_id_seq'::regclass);


--
-- Name: interact_abuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interact_abuses ALTER COLUMN id SET DEFAULT nextval('public.interact_abuses_id_seq'::regclass);


--
-- Name: interact_attitudes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interact_attitudes ALTER COLUMN id SET DEFAULT nextval('public.interact_attitudes_id_seq'::regclass);


--
-- Name: interact_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interact_comments ALTER COLUMN id SET DEFAULT nextval('public.interact_comments_id_seq'::regclass);


--
-- Name: interact_stars id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interact_stars ALTER COLUMN id SET DEFAULT nextval('public.interact_stars_id_seq'::regclass);


--
-- Name: markdown_catalogs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.markdown_catalogs ALTER COLUMN id SET DEFAULT nextval('public.markdown_catalogs_id_seq'::regclass);


--
-- Name: markdown_gits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.markdown_gits ALTER COLUMN id SET DEFAULT nextval('public.markdown_gits_id_seq'::regclass);


--
-- Name: markdown_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.markdown_posts ALTER COLUMN id SET DEFAULT nextval('public.markdown_posts_id_seq'::regclass);


--
-- Name: notice_annunciations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notice_annunciations ALTER COLUMN id SET DEFAULT nextval('public.notice_annunciations_id_seq'::regclass);


--
-- Name: notice_member_annunciates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notice_member_annunciates ALTER COLUMN id SET DEFAULT nextval('public.notice_member_annunciates_id_seq'::regclass);


--
-- Name: notice_notification_sendings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notice_notification_sendings ALTER COLUMN id SET DEFAULT nextval('public.notice_notification_sendings_id_seq'::regclass);


--
-- Name: notice_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notice_notifications ALTER COLUMN id SET DEFAULT nextval('public.notice_notifications_id_seq'::regclass);


--
-- Name: notice_user_annunciates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notice_user_annunciates ALTER COLUMN id SET DEFAULT nextval('public.notice_user_annunciates_id_seq'::regclass);


--
-- Name: org_department_grants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_department_grants ALTER COLUMN id SET DEFAULT nextval('public.org_department_grants_id_seq'::regclass);


--
-- Name: org_departments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_departments ALTER COLUMN id SET DEFAULT nextval('public.org_departments_id_seq'::regclass);


--
-- Name: org_job_descriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_job_descriptions ALTER COLUMN id SET DEFAULT nextval('public.org_job_descriptions_id_seq'::regclass);


--
-- Name: org_job_titles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_job_titles ALTER COLUMN id SET DEFAULT nextval('public.org_job_titles_id_seq'::regclass);


--
-- Name: org_job_transfers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_job_transfers ALTER COLUMN id SET DEFAULT nextval('public.org_job_transfers_id_seq'::regclass);


--
-- Name: org_member_departments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_member_departments ALTER COLUMN id SET DEFAULT nextval('public.org_member_departments_id_seq'::regclass);


--
-- Name: org_members id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_members ALTER COLUMN id SET DEFAULT nextval('public.org_members_id_seq'::regclass);


--
-- Name: org_organ_domains id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_organ_domains ALTER COLUMN id SET DEFAULT nextval('public.org_organ_domains_id_seq'::regclass);


--
-- Name: org_organ_handles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_organ_handles ALTER COLUMN id SET DEFAULT nextval('public.org_organ_handles_id_seq'::regclass);


--
-- Name: org_organs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_organs ALTER COLUMN id SET DEFAULT nextval('public.org_organs_id_seq'::regclass);


--
-- Name: org_resign_reasons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_resign_reasons ALTER COLUMN id SET DEFAULT nextval('public.org_resign_reasons_id_seq'::regclass);


--
-- Name: org_resign_references id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_resign_references ALTER COLUMN id SET DEFAULT nextval('public.org_resign_references_id_seq'::regclass);


--
-- Name: org_resigns id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_resigns ALTER COLUMN id SET DEFAULT nextval('public.org_resigns_id_seq'::regclass);


--
-- Name: org_super_job_titles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_super_job_titles ALTER COLUMN id SET DEFAULT nextval('public.org_super_job_titles_id_seq'::regclass);


--
-- Name: org_supports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_supports ALTER COLUMN id SET DEFAULT nextval('public.org_supports_id_seq'::regclass);


--
-- Name: org_tutorials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_tutorials ALTER COLUMN id SET DEFAULT nextval('public.org_tutorials_id_seq'::regclass);


--
-- Name: plan_participants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_participants ALTER COLUMN id SET DEFAULT nextval('public.plan_participants_id_seq'::regclass);


--
-- Name: profiled_address_organs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiled_address_organs ALTER COLUMN id SET DEFAULT nextval('public.profiled_address_organs_id_seq'::regclass);


--
-- Name: profiled_address_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiled_address_users ALTER COLUMN id SET DEFAULT nextval('public.profiled_address_users_id_seq'::regclass);


--
-- Name: profiled_addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiled_addresses ALTER COLUMN id SET DEFAULT nextval('public.profiled_addresses_id_seq'::regclass);


--
-- Name: profiled_areas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiled_areas ALTER COLUMN id SET DEFAULT nextval('public.profiled_areas_id_seq'::regclass);


--
-- Name: profiled_profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiled_profiles ALTER COLUMN id SET DEFAULT nextval('public.profiled_profiles_id_seq'::regclass);


--
-- Name: project_taxon_facilitates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_taxon_facilitates ALTER COLUMN id SET DEFAULT nextval('public.project_taxon_facilitates_id_seq'::regclass);


--
-- Name: project_taxon_indicators id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_taxon_indicators ALTER COLUMN id SET DEFAULT nextval('public.project_taxon_indicators_id_seq'::regclass);


--
-- Name: project_taxons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_taxons ALTER COLUMN id SET DEFAULT nextval('public.project_taxons_id_seq'::regclass);


--
-- Name: quip_apps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quip_apps ALTER COLUMN id SET DEFAULT nextval('public.quip_apps_id_seq'::regclass);


--
-- Name: requirements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requirements ALTER COLUMN id SET DEFAULT nextval('public.requirements_id_seq'::regclass);


--
-- Name: roled_busynesses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_busynesses ALTER COLUMN id SET DEFAULT nextval('public.roled_busynesses_id_seq'::regclass);


--
-- Name: roled_governs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_governs ALTER COLUMN id SET DEFAULT nextval('public.roled_governs_id_seq'::regclass);


--
-- Name: roled_name_spaces id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_name_spaces ALTER COLUMN id SET DEFAULT nextval('public.roled_name_spaces_id_seq'::regclass);


--
-- Name: roled_role_rules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_role_rules ALTER COLUMN id SET DEFAULT nextval('public.roled_role_rules_id_seq'::regclass);


--
-- Name: roled_role_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_role_types ALTER COLUMN id SET DEFAULT nextval('public.roled_role_types_id_seq'::regclass);


--
-- Name: roled_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_roles ALTER COLUMN id SET DEFAULT nextval('public.roled_roles_id_seq'::regclass);


--
-- Name: roled_rule_operations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_rule_operations ALTER COLUMN id SET DEFAULT nextval('public.roled_rule_operations_id_seq'::regclass);


--
-- Name: roled_rules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_rules ALTER COLUMN id SET DEFAULT nextval('public.roled_rules_id_seq'::regclass);


--
-- Name: roled_who_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_who_roles ALTER COLUMN id SET DEFAULT nextval('public.roled_who_roles_id_seq'::regclass);


--
-- Name: ship_cars id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_cars ALTER COLUMN id SET DEFAULT nextval('public.ship_cars_id_seq'::regclass);


--
-- Name: ship_drivers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_drivers ALTER COLUMN id SET DEFAULT nextval('public.ship_drivers_id_seq'::regclass);


--
-- Name: ship_favorites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_favorites ALTER COLUMN id SET DEFAULT nextval('public.ship_favorites_id_seq'::regclass);


--
-- Name: ship_line_similars id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_line_similars ALTER COLUMN id SET DEFAULT nextval('public.ship_line_similars_id_seq'::regclass);


--
-- Name: ship_lines id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_lines ALTER COLUMN id SET DEFAULT nextval('public.ship_lines_id_seq'::regclass);


--
-- Name: ship_locations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_locations ALTER COLUMN id SET DEFAULT nextval('public.ship_locations_id_seq'::regclass);


--
-- Name: ship_packageds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_packageds ALTER COLUMN id SET DEFAULT nextval('public.ship_packageds_id_seq'::regclass);


--
-- Name: ship_packages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_packages ALTER COLUMN id SET DEFAULT nextval('public.ship_packages_id_seq'::regclass);


--
-- Name: ship_shipments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_shipments ALTER COLUMN id SET DEFAULT nextval('public.ship_shipments_id_seq'::regclass);


--
-- Name: stats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats ALTER COLUMN id SET DEFAULT nextval('public.stats_id_seq'::regclass);


--
-- Name: trade_advances id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_advances ALTER COLUMN id SET DEFAULT nextval('public.trade_advances_id_seq'::regclass);


--
-- Name: trade_card_advances id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_card_advances ALTER COLUMN id SET DEFAULT nextval('public.trade_card_advances_id_seq'::regclass);


--
-- Name: trade_card_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_card_logs ALTER COLUMN id SET DEFAULT nextval('public.trade_card_logs_id_seq'::regclass);


--
-- Name: trade_card_prepayments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_card_prepayments ALTER COLUMN id SET DEFAULT nextval('public.trade_card_prepayments_id_seq'::regclass);


--
-- Name: trade_card_promotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_card_promotes ALTER COLUMN id SET DEFAULT nextval('public.trade_card_promotes_id_seq'::regclass);


--
-- Name: trade_card_templates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_card_templates ALTER COLUMN id SET DEFAULT nextval('public.trade_card_templates_id_seq'::regclass);


--
-- Name: trade_cards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_cards ALTER COLUMN id SET DEFAULT nextval('public.trade_cards_id_seq'::regclass);


--
-- Name: trade_carts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_carts ALTER COLUMN id SET DEFAULT nextval('public.trade_carts_id_seq'::regclass);


--
-- Name: trade_cash_givens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_cash_givens ALTER COLUMN id SET DEFAULT nextval('public.trade_cash_givens_id_seq'::regclass);


--
-- Name: trade_cash_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_cash_logs ALTER COLUMN id SET DEFAULT nextval('public.trade_cash_logs_id_seq'::regclass);


--
-- Name: trade_cashes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_cashes ALTER COLUMN id SET DEFAULT nextval('public.trade_cashes_id_seq'::regclass);


--
-- Name: trade_exchange_rates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_exchange_rates ALTER COLUMN id SET DEFAULT nextval('public.trade_exchange_rates_id_seq'::regclass);


--
-- Name: trade_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_orders ALTER COLUMN id SET DEFAULT nextval('public.trade_orders_id_seq'::regclass);


--
-- Name: trade_payment_methods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_payment_methods ALTER COLUMN id SET DEFAULT nextval('public.trade_payment_methods_id_seq'::regclass);


--
-- Name: trade_payment_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_payment_orders ALTER COLUMN id SET DEFAULT nextval('public.trade_payment_orders_id_seq'::regclass);


--
-- Name: trade_payment_references id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_payment_references ALTER COLUMN id SET DEFAULT nextval('public.trade_payment_references_id_seq'::regclass);


--
-- Name: trade_payment_strategies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_payment_strategies ALTER COLUMN id SET DEFAULT nextval('public.trade_payment_strategies_id_seq'::regclass);


--
-- Name: trade_payments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_payments ALTER COLUMN id SET DEFAULT nextval('public.trade_payments_id_seq'::regclass);


--
-- Name: trade_payouts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_payouts ALTER COLUMN id SET DEFAULT nextval('public.trade_payouts_id_seq'::regclass);


--
-- Name: trade_promote_carts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_promote_carts ALTER COLUMN id SET DEFAULT nextval('public.trade_promote_carts_id_seq'::regclass);


--
-- Name: trade_promote_charges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_promote_charges ALTER COLUMN id SET DEFAULT nextval('public.trade_promote_charges_id_seq'::regclass);


--
-- Name: trade_promote_extras id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_promote_extras ALTER COLUMN id SET DEFAULT nextval('public.trade_promote_extras_id_seq'::regclass);


--
-- Name: trade_promote_goods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_promote_goods ALTER COLUMN id SET DEFAULT nextval('public.trade_promote_goods_id_seq'::regclass);


--
-- Name: trade_promotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_promotes ALTER COLUMN id SET DEFAULT nextval('public.trade_promotes_id_seq'::regclass);


--
-- Name: trade_refunds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_refunds ALTER COLUMN id SET DEFAULT nextval('public.trade_refunds_id_seq'::regclass);


--
-- Name: trade_trade_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_trade_items ALTER COLUMN id SET DEFAULT nextval('public.trade_trade_items_id_seq'::regclass);


--
-- Name: trade_trade_promotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_trade_promotes ALTER COLUMN id SET DEFAULT nextval('public.trade_trade_promotes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wechat_agencies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_agencies ALTER COLUMN id SET DEFAULT nextval('public.wechat_agencies_id_seq'::regclass);


--
-- Name: wechat_apps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_apps ALTER COLUMN id SET DEFAULT nextval('public.wechat_apps_id_seq'::regclass);


--
-- Name: wechat_auths id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_auths ALTER COLUMN id SET DEFAULT nextval('public.wechat_auths_id_seq'::regclass);


--
-- Name: wechat_extractions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_extractions ALTER COLUMN id SET DEFAULT nextval('public.wechat_extractions_id_seq'::regclass);


--
-- Name: wechat_extractors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_extractors ALTER COLUMN id SET DEFAULT nextval('public.wechat_extractors_id_seq'::regclass);


--
-- Name: wechat_hooks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_hooks ALTER COLUMN id SET DEFAULT nextval('public.wechat_hooks_id_seq'::regclass);


--
-- Name: wechat_medias id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_medias ALTER COLUMN id SET DEFAULT nextval('public.wechat_medias_id_seq'::regclass);


--
-- Name: wechat_menus id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_menus ALTER COLUMN id SET DEFAULT nextval('public.wechat_menus_id_seq'::regclass);


--
-- Name: wechat_news_reply_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_news_reply_items ALTER COLUMN id SET DEFAULT nextval('public.wechat_news_reply_items_id_seq'::regclass);


--
-- Name: wechat_notices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_notices ALTER COLUMN id SET DEFAULT nextval('public.wechat_notices_id_seq'::regclass);


--
-- Name: wechat_platforms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_platforms ALTER COLUMN id SET DEFAULT nextval('public.wechat_platforms_id_seq'::regclass);


--
-- Name: wechat_receives id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_receives ALTER COLUMN id SET DEFAULT nextval('public.wechat_receives_id_seq'::regclass);


--
-- Name: wechat_registers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_registers ALTER COLUMN id SET DEFAULT nextval('public.wechat_registers_id_seq'::regclass);


--
-- Name: wechat_replies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_replies ALTER COLUMN id SET DEFAULT nextval('public.wechat_replies_id_seq'::regclass);


--
-- Name: wechat_requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_requests ALTER COLUMN id SET DEFAULT nextval('public.wechat_requests_id_seq'::regclass);


--
-- Name: wechat_responses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_responses ALTER COLUMN id SET DEFAULT nextval('public.wechat_responses_id_seq'::regclass);


--
-- Name: wechat_scene_menus id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_scene_menus ALTER COLUMN id SET DEFAULT nextval('public.wechat_scene_menus_id_seq'::regclass);


--
-- Name: wechat_scenes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_scenes ALTER COLUMN id SET DEFAULT nextval('public.wechat_scenes_id_seq'::regclass);


--
-- Name: wechat_services id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_services ALTER COLUMN id SET DEFAULT nextval('public.wechat_services_id_seq'::regclass);


--
-- Name: wechat_subscribes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_subscribes ALTER COLUMN id SET DEFAULT nextval('public.wechat_subscribes_id_seq'::regclass);


--
-- Name: wechat_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_tags ALTER COLUMN id SET DEFAULT nextval('public.wechat_tags_id_seq'::regclass);


--
-- Name: wechat_template_configs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_template_configs ALTER COLUMN id SET DEFAULT nextval('public.wechat_template_configs_id_seq'::regclass);


--
-- Name: wechat_template_key_words id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_template_key_words ALTER COLUMN id SET DEFAULT nextval('public.wechat_template_key_words_id_seq'::regclass);


--
-- Name: wechat_templates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_templates ALTER COLUMN id SET DEFAULT nextval('public.wechat_templates_id_seq'::regclass);


--
-- Name: wechat_tickets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_tickets ALTER COLUMN id SET DEFAULT nextval('public.wechat_tickets_id_seq'::regclass);


--
-- Name: wechat_user_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_user_tags ALTER COLUMN id SET DEFAULT nextval('public.wechat_user_tags_id_seq'::regclass);


--
-- Name: action_mailbox_inbound_emails action_mailbox_inbound_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_mailbox_inbound_emails
    ADD CONSTRAINT action_mailbox_inbound_emails_pkey PRIMARY KEY (id);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: agential_agencies agential_agencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agential_agencies
    ADD CONSTRAINT agential_agencies_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attend_absence_stats attend_absence_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_absence_stats
    ADD CONSTRAINT attend_absence_stats_pkey PRIMARY KEY (id);


--
-- Name: attend_absences attend_absences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_absences
    ADD CONSTRAINT attend_absences_pkey PRIMARY KEY (id);


--
-- Name: attend_attendance_logs attend_attendance_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_attendance_logs
    ADD CONSTRAINT attend_attendance_logs_pkey PRIMARY KEY (id);


--
-- Name: attend_attendance_settings attend_attendance_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_attendance_settings
    ADD CONSTRAINT attend_attendance_settings_pkey PRIMARY KEY (id);


--
-- Name: attend_attendance_stats attend_attendance_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_attendance_stats
    ADD CONSTRAINT attend_attendance_stats_pkey PRIMARY KEY (id);


--
-- Name: attend_attendances attend_attendances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_attendances
    ADD CONSTRAINT attend_attendances_pkey PRIMARY KEY (id);


--
-- Name: attend_extra_days attend_extra_days_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_extra_days
    ADD CONSTRAINT attend_extra_days_pkey PRIMARY KEY (id);


--
-- Name: attend_financial_months attend_financial_months_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_financial_months
    ADD CONSTRAINT attend_financial_months_pkey PRIMARY KEY (id);


--
-- Name: attend_overtimes attend_overtimes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attend_overtimes
    ADD CONSTRAINT attend_overtimes_pkey PRIMARY KEY (id);


--
-- Name: auditor_approvals auditor_approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditor_approvals
    ADD CONSTRAINT auditor_approvals_pkey PRIMARY KEY (id);


--
-- Name: auditor_audits auditor_audits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditor_audits
    ADD CONSTRAINT auditor_audits_pkey PRIMARY KEY (id);


--
-- Name: auditor_verifications auditor_verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditor_verifications
    ADD CONSTRAINT auditor_verifications_pkey PRIMARY KEY (id);


--
-- Name: auditor_verifiers auditor_verifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auditor_verifiers
    ADD CONSTRAINT auditor_verifiers_pkey PRIMARY KEY (id);


--
-- Name: auth_accounts auth_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_accounts
    ADD CONSTRAINT auth_accounts_pkey PRIMARY KEY (id);


--
-- Name: auth_apps auth_apps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_apps
    ADD CONSTRAINT auth_apps_pkey PRIMARY KEY (id);


--
-- Name: auth_authorized_tokens auth_authorized_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_authorized_tokens
    ADD CONSTRAINT auth_authorized_tokens_pkey PRIMARY KEY (id);


--
-- Name: auth_oauth_users auth_oauth_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_oauth_users
    ADD CONSTRAINT auth_oauth_users_pkey PRIMARY KEY (id);


--
-- Name: auth_user_taggeds auth_user_taggeds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_taggeds
    ADD CONSTRAINT auth_user_taggeds_pkey PRIMARY KEY (id);


--
-- Name: auth_user_tags auth_user_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_tags
    ADD CONSTRAINT auth_user_tags_pkey PRIMARY KEY (id);


--
-- Name: auth_verify_tokens auth_verify_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_verify_tokens
    ADD CONSTRAINT auth_verify_tokens_pkey PRIMARY KEY (id);


--
-- Name: bench_facilitate_indicators bench_facilitate_indicators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_facilitate_indicators
    ADD CONSTRAINT bench_facilitate_indicators_pkey PRIMARY KEY (id);


--
-- Name: bench_facilitate_providers bench_facilitate_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_facilitate_providers
    ADD CONSTRAINT bench_facilitate_providers_pkey PRIMARY KEY (id);


--
-- Name: bench_facilitate_taxon_hierarchies bench_facilitate_taxon_hierarchies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_facilitate_taxon_hierarchies
    ADD CONSTRAINT bench_facilitate_taxon_hierarchies_pkey PRIMARY KEY (id);


--
-- Name: bench_facilitate_taxons bench_facilitate_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_facilitate_taxons
    ADD CONSTRAINT bench_facilitate_taxons_pkey PRIMARY KEY (id);


--
-- Name: bench_facilitates bench_facilitates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_facilitates
    ADD CONSTRAINT bench_facilitates_pkey PRIMARY KEY (id);


--
-- Name: bench_indicators bench_indicators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_indicators
    ADD CONSTRAINT bench_indicators_pkey PRIMARY KEY (id);


--
-- Name: bench_mileposts bench_mileposts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_mileposts
    ADD CONSTRAINT bench_mileposts_pkey PRIMARY KEY (id);


--
-- Name: bench_project_facilitates bench_project_facilitates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_project_facilitates
    ADD CONSTRAINT bench_project_facilitates_pkey PRIMARY KEY (id);


--
-- Name: bench_project_indicators bench_project_indicators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_project_indicators
    ADD CONSTRAINT bench_project_indicators_pkey PRIMARY KEY (id);


--
-- Name: bench_project_mileposts bench_project_mileposts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_project_mileposts
    ADD CONSTRAINT bench_project_mileposts_pkey PRIMARY KEY (id);


--
-- Name: bench_project_stages bench_project_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_project_stages
    ADD CONSTRAINT bench_project_stages_pkey PRIMARY KEY (id);


--
-- Name: bench_project_webhooks bench_project_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_project_webhooks
    ADD CONSTRAINT bench_project_webhooks_pkey PRIMARY KEY (id);


--
-- Name: bench_projects bench_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_projects
    ADD CONSTRAINT bench_projects_pkey PRIMARY KEY (id);


--
-- Name: bench_schedules bench_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_schedules
    ADD CONSTRAINT bench_schedules_pkey PRIMARY KEY (id);


--
-- Name: bench_task_template_hierarchies bench_task_template_hierarchies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_task_template_hierarchies
    ADD CONSTRAINT bench_task_template_hierarchies_pkey PRIMARY KEY (id);


--
-- Name: bench_task_templates bench_task_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_task_templates
    ADD CONSTRAINT bench_task_templates_pkey PRIMARY KEY (id);


--
-- Name: bench_task_timers bench_task_timers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_task_timers
    ADD CONSTRAINT bench_task_timers_pkey PRIMARY KEY (id);


--
-- Name: bench_tasks bench_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bench_tasks
    ADD CONSTRAINT bench_tasks_pkey PRIMARY KEY (id);


--
-- Name: com_acme_accounts com_acme_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_acme_accounts
    ADD CONSTRAINT com_acme_accounts_pkey PRIMARY KEY (id);


--
-- Name: com_acme_identifiers com_acme_identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_acme_identifiers
    ADD CONSTRAINT com_acme_identifiers_pkey PRIMARY KEY (id);


--
-- Name: com_acme_orders com_acme_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_acme_orders
    ADD CONSTRAINT com_acme_orders_pkey PRIMARY KEY (id);


--
-- Name: com_blob_defaults com_blob_defaults_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_blob_defaults
    ADD CONSTRAINT com_blob_defaults_pkey PRIMARY KEY (id);


--
-- Name: com_cache_lists com_cache_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_cache_lists
    ADD CONSTRAINT com_cache_lists_pkey PRIMARY KEY (id);


--
-- Name: com_csps com_csps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_csps
    ADD CONSTRAINT com_csps_pkey PRIMARY KEY (id);


--
-- Name: com_errs com_errs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_errs
    ADD CONSTRAINT com_errs_pkey PRIMARY KEY (id);


--
-- Name: com_infos com_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_infos
    ADD CONSTRAINT com_infos_pkey PRIMARY KEY (id);


--
-- Name: com_meta_actions com_meta_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_actions
    ADD CONSTRAINT com_meta_actions_pkey PRIMARY KEY (id);


--
-- Name: com_meta_businesses com_meta_businesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_businesses
    ADD CONSTRAINT com_meta_businesses_pkey PRIMARY KEY (id);


--
-- Name: com_meta_columns com_meta_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_columns
    ADD CONSTRAINT com_meta_columns_pkey PRIMARY KEY (id);


--
-- Name: com_meta_controllers com_meta_controllers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_controllers
    ADD CONSTRAINT com_meta_controllers_pkey PRIMARY KEY (id);


--
-- Name: com_meta_models com_meta_models_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_models
    ADD CONSTRAINT com_meta_models_pkey PRIMARY KEY (id);


--
-- Name: com_meta_namespaces com_meta_namespaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_namespaces
    ADD CONSTRAINT com_meta_namespaces_pkey PRIMARY KEY (id);


--
-- Name: com_meta_operations com_meta_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.com_meta_operations
    ADD CONSTRAINT com_meta_operations_pkey PRIMARY KEY (id);


--
-- Name: datum_data_lists datum_data_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.datum_data_lists
    ADD CONSTRAINT datum_data_lists_pkey PRIMARY KEY (id);


--
-- Name: datum_record_lists datum_record_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.datum_record_lists
    ADD CONSTRAINT datum_record_lists_pkey PRIMARY KEY (id);


--
-- Name: datum_table_items datum_table_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.datum_table_items
    ADD CONSTRAINT datum_table_items_pkey PRIMARY KEY (id);


--
-- Name: datum_table_lists datum_table_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.datum_table_lists
    ADD CONSTRAINT datum_table_lists_pkey PRIMARY KEY (id);


--
-- Name: detail_contents detail_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_contents
    ADD CONSTRAINT detail_contents_pkey PRIMARY KEY (id);


--
-- Name: detail_entity_items detail_entity_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_entity_items
    ADD CONSTRAINT detail_entity_items_pkey PRIMARY KEY (id);


--
-- Name: detail_items detail_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_items
    ADD CONSTRAINT detail_items_pkey PRIMARY KEY (id);


--
-- Name: detail_knowings detail_knowings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_knowings
    ADD CONSTRAINT detail_knowings_pkey PRIMARY KEY (id);


--
-- Name: detail_knowledge_hierarchies detail_knowledge_hierarchies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_knowledge_hierarchies
    ADD CONSTRAINT detail_knowledge_hierarchies_pkey PRIMARY KEY (id);


--
-- Name: detail_knowledges detail_knowledges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_knowledges
    ADD CONSTRAINT detail_knowledges_pkey PRIMARY KEY (id);


--
-- Name: detail_lists detail_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_lists
    ADD CONSTRAINT detail_lists_pkey PRIMARY KEY (id);


--
-- Name: detail_post_syncs detail_post_syncs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_post_syncs
    ADD CONSTRAINT detail_post_syncs_pkey PRIMARY KEY (id);


--
-- Name: detail_posts detail_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_posts
    ADD CONSTRAINT detail_posts_pkey PRIMARY KEY (id);


--
-- Name: detail_taxon_items detail_taxon_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detail_taxon_items
    ADD CONSTRAINT detail_taxon_items_pkey PRIMARY KEY (id);


--
-- Name: doc_maps doc_maps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doc_maps
    ADD CONSTRAINT doc_maps_pkey PRIMARY KEY (id);


--
-- Name: doc_subjects doc_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doc_subjects
    ADD CONSTRAINT doc_subjects_pkey PRIMARY KEY (id);


--
-- Name: email_logs email_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_logs
    ADD CONSTRAINT email_logs_pkey PRIMARY KEY (id);


--
-- Name: email_reasons email_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_reasons
    ADD CONSTRAINT email_reasons_pkey PRIMARY KEY (id);


--
-- Name: email_smtp_accounts email_smtp_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_smtp_accounts
    ADD CONSTRAINT email_smtp_accounts_pkey PRIMARY KEY (id);


--
-- Name: email_smtps email_smtps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_smtps
    ADD CONSTRAINT email_smtps_pkey PRIMARY KEY (id);


--
-- Name: email_subscriptions email_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_subscriptions
    ADD CONSTRAINT email_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: email_templates email_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_templates
    ADD CONSTRAINT email_templates_pkey PRIMARY KEY (id);


--
-- Name: event_participants event_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_participants
    ADD CONSTRAINT event_participants_pkey PRIMARY KEY (id);


--
-- Name: eventual_bookings eventual_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_bookings
    ADD CONSTRAINT eventual_bookings_pkey PRIMARY KEY (id);


--
-- Name: eventual_crowd_members eventual_crowd_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_crowd_members
    ADD CONSTRAINT eventual_crowd_members_pkey PRIMARY KEY (id);


--
-- Name: eventual_crowds eventual_crowds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_crowds
    ADD CONSTRAINT eventual_crowds_pkey PRIMARY KEY (id);


--
-- Name: eventual_event_crowds eventual_event_crowds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_event_crowds
    ADD CONSTRAINT eventual_event_crowds_pkey PRIMARY KEY (id);


--
-- Name: eventual_event_grants eventual_event_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_event_grants
    ADD CONSTRAINT eventual_event_grants_pkey PRIMARY KEY (id);


--
-- Name: eventual_event_items eventual_event_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_event_items
    ADD CONSTRAINT eventual_event_items_pkey PRIMARY KEY (id);


--
-- Name: eventual_event_participants eventual_event_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_event_participants
    ADD CONSTRAINT eventual_event_participants_pkey PRIMARY KEY (id);


--
-- Name: eventual_event_taxons eventual_event_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_event_taxons
    ADD CONSTRAINT eventual_event_taxons_pkey PRIMARY KEY (id);


--
-- Name: eventual_events eventual_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_events
    ADD CONSTRAINT eventual_events_pkey PRIMARY KEY (id);


--
-- Name: eventual_place_taxon_hierarchies eventual_place_taxon_hierarchies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_place_taxon_hierarchies
    ADD CONSTRAINT eventual_place_taxon_hierarchies_pkey PRIMARY KEY (id);


--
-- Name: eventual_place_taxons eventual_place_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_place_taxons
    ADD CONSTRAINT eventual_place_taxons_pkey PRIMARY KEY (id);


--
-- Name: eventual_places eventual_places_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_places
    ADD CONSTRAINT eventual_places_pkey PRIMARY KEY (id);


--
-- Name: eventual_plan_attenders eventual_plan_attenders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_plan_attenders
    ADD CONSTRAINT eventual_plan_attenders_pkey PRIMARY KEY (id);


--
-- Name: eventual_plan_items eventual_plan_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_plan_items
    ADD CONSTRAINT eventual_plan_items_pkey PRIMARY KEY (id);


--
-- Name: eventual_plan_participants eventual_plan_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_plan_participants
    ADD CONSTRAINT eventual_plan_participants_pkey PRIMARY KEY (id);


--
-- Name: eventual_plans eventual_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_plans
    ADD CONSTRAINT eventual_plans_pkey PRIMARY KEY (id);


--
-- Name: eventual_seats eventual_seats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_seats
    ADD CONSTRAINT eventual_seats_pkey PRIMARY KEY (id);


--
-- Name: eventual_time_items eventual_time_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_time_items
    ADD CONSTRAINT eventual_time_items_pkey PRIMARY KEY (id);


--
-- Name: eventual_time_lists eventual_time_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.eventual_time_lists
    ADD CONSTRAINT eventual_time_lists_pkey PRIMARY KEY (id);


--
-- Name: factory_factory_providers factory_factory_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_factory_providers
    ADD CONSTRAINT factory_factory_providers_pkey PRIMARY KEY (id);


--
-- Name: factory_factory_taxons factory_factory_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_factory_taxons
    ADD CONSTRAINT factory_factory_taxons_pkey PRIMARY KEY (id);


--
-- Name: factory_part_items factory_part_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_part_items
    ADD CONSTRAINT factory_part_items_pkey PRIMARY KEY (id);


--
-- Name: factory_part_plans factory_part_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_part_plans
    ADD CONSTRAINT factory_part_plans_pkey PRIMARY KEY (id);


--
-- Name: factory_part_providers factory_part_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_part_providers
    ADD CONSTRAINT factory_part_providers_pkey PRIMARY KEY (id);


--
-- Name: factory_part_taxons factory_part_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_part_taxons
    ADD CONSTRAINT factory_part_taxons_pkey PRIMARY KEY (id);


--
-- Name: factory_parts factory_parts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_parts
    ADD CONSTRAINT factory_parts_pkey PRIMARY KEY (id);


--
-- Name: factory_produce_plans factory_produce_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_produce_plans
    ADD CONSTRAINT factory_produce_plans_pkey PRIMARY KEY (id);


--
-- Name: factory_produces factory_produces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_produces
    ADD CONSTRAINT factory_produces_pkey PRIMARY KEY (id);


--
-- Name: factory_product_part_taxons factory_product_part_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_product_part_taxons
    ADD CONSTRAINT factory_product_part_taxons_pkey PRIMARY KEY (id);


--
-- Name: factory_product_parts factory_product_parts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_product_parts
    ADD CONSTRAINT factory_product_parts_pkey PRIMARY KEY (id);


--
-- Name: factory_product_plans factory_product_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_product_plans
    ADD CONSTRAINT factory_product_plans_pkey PRIMARY KEY (id);


--
-- Name: factory_product_produces factory_product_produces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_product_produces
    ADD CONSTRAINT factory_product_produces_pkey PRIMARY KEY (id);


--
-- Name: factory_product_taxons factory_product_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_product_taxons
    ADD CONSTRAINT factory_product_taxons_pkey PRIMARY KEY (id);


--
-- Name: factory_production_carts factory_production_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_production_carts
    ADD CONSTRAINT factory_production_carts_pkey PRIMARY KEY (id);


--
-- Name: factory_production_items factory_production_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_production_items
    ADD CONSTRAINT factory_production_items_pkey PRIMARY KEY (id);


--
-- Name: factory_production_parts factory_production_parts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_production_parts
    ADD CONSTRAINT factory_production_parts_pkey PRIMARY KEY (id);


--
-- Name: factory_productions factory_productions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_productions
    ADD CONSTRAINT factory_productions_pkey PRIMARY KEY (id);


--
-- Name: factory_products factory_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.factory_products
    ADD CONSTRAINT factory_products_pkey PRIMARY KEY (id);


--
-- Name: finance_assessments finance_assessments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_assessments
    ADD CONSTRAINT finance_assessments_pkey PRIMARY KEY (id);


--
-- Name: finance_budgets finance_budgets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_budgets
    ADD CONSTRAINT finance_budgets_pkey PRIMARY KEY (id);


--
-- Name: finance_expense_items finance_expense_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_expense_items
    ADD CONSTRAINT finance_expense_items_pkey PRIMARY KEY (id);


--
-- Name: finance_expense_members finance_expense_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_expense_members
    ADD CONSTRAINT finance_expense_members_pkey PRIMARY KEY (id);


--
-- Name: finance_expenses finance_expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_expenses
    ADD CONSTRAINT finance_expenses_pkey PRIMARY KEY (id);


--
-- Name: finance_financial_taxon_hierarchies finance_financial_taxon_hierarchies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_financial_taxon_hierarchies
    ADD CONSTRAINT finance_financial_taxon_hierarchies_pkey PRIMARY KEY (id);


--
-- Name: finance_financial_taxons finance_financial_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_financial_taxons
    ADD CONSTRAINT finance_financial_taxons_pkey PRIMARY KEY (id);


--
-- Name: finance_fund_incomes finance_fund_incomes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_fund_incomes
    ADD CONSTRAINT finance_fund_incomes_pkey PRIMARY KEY (id);


--
-- Name: finance_funds finance_funds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_funds
    ADD CONSTRAINT finance_funds_pkey PRIMARY KEY (id);


--
-- Name: finance_stocks finance_stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_stocks
    ADD CONSTRAINT finance_stocks_pkey PRIMARY KEY (id);


--
-- Name: growth_aim_codes growth_aim_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_aim_codes
    ADD CONSTRAINT growth_aim_codes_pkey PRIMARY KEY (id);


--
-- Name: growth_aim_entities growth_aim_entities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_aim_entities
    ADD CONSTRAINT growth_aim_entities_pkey PRIMARY KEY (id);


--
-- Name: growth_aim_logs growth_aim_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_aim_logs
    ADD CONSTRAINT growth_aim_logs_pkey PRIMARY KEY (id);


--
-- Name: growth_aim_users growth_aim_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_aim_users
    ADD CONSTRAINT growth_aim_users_pkey PRIMARY KEY (id);


--
-- Name: growth_aims growth_aims_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_aims
    ADD CONSTRAINT growth_aims_pkey PRIMARY KEY (id);


--
-- Name: growth_praise_incomes growth_praise_incomes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_praise_incomes
    ADD CONSTRAINT growth_praise_incomes_pkey PRIMARY KEY (id);


--
-- Name: growth_praise_users growth_praise_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_praise_users
    ADD CONSTRAINT growth_praise_users_pkey PRIMARY KEY (id);


--
-- Name: growth_reward_expenses growth_reward_expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_reward_expenses
    ADD CONSTRAINT growth_reward_expenses_pkey PRIMARY KEY (id);


--
-- Name: growth_reward_incomes growth_reward_incomes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_reward_incomes
    ADD CONSTRAINT growth_reward_incomes_pkey PRIMARY KEY (id);


--
-- Name: growth_rewards growth_rewards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_rewards
    ADD CONSTRAINT growth_rewards_pkey PRIMARY KEY (id);


--
-- Name: interact_abuses interact_abuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interact_abuses
    ADD CONSTRAINT interact_abuses_pkey PRIMARY KEY (id);


--
-- Name: interact_attitudes interact_attitudes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interact_attitudes
    ADD CONSTRAINT interact_attitudes_pkey PRIMARY KEY (id);


--
-- Name: interact_comments interact_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interact_comments
    ADD CONSTRAINT interact_comments_pkey PRIMARY KEY (id);


--
-- Name: interact_stars interact_stars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interact_stars
    ADD CONSTRAINT interact_stars_pkey PRIMARY KEY (id);


--
-- Name: markdown_catalogs markdown_catalogs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.markdown_catalogs
    ADD CONSTRAINT markdown_catalogs_pkey PRIMARY KEY (id);


--
-- Name: markdown_gits markdown_gits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.markdown_gits
    ADD CONSTRAINT markdown_gits_pkey PRIMARY KEY (id);


--
-- Name: markdown_posts markdown_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.markdown_posts
    ADD CONSTRAINT markdown_posts_pkey PRIMARY KEY (id);


--
-- Name: notice_annunciations notice_annunciations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notice_annunciations
    ADD CONSTRAINT notice_annunciations_pkey PRIMARY KEY (id);


--
-- Name: notice_member_annunciates notice_member_annunciates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notice_member_annunciates
    ADD CONSTRAINT notice_member_annunciates_pkey PRIMARY KEY (id);


--
-- Name: notice_notification_sendings notice_notification_sendings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notice_notification_sendings
    ADD CONSTRAINT notice_notification_sendings_pkey PRIMARY KEY (id);


--
-- Name: notice_notifications notice_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notice_notifications
    ADD CONSTRAINT notice_notifications_pkey PRIMARY KEY (id);


--
-- Name: notice_user_annunciates notice_user_annunciates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notice_user_annunciates
    ADD CONSTRAINT notice_user_annunciates_pkey PRIMARY KEY (id);


--
-- Name: org_department_grants org_department_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_department_grants
    ADD CONSTRAINT org_department_grants_pkey PRIMARY KEY (id);


--
-- Name: org_departments org_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_departments
    ADD CONSTRAINT org_departments_pkey PRIMARY KEY (id);


--
-- Name: org_job_descriptions org_job_descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_job_descriptions
    ADD CONSTRAINT org_job_descriptions_pkey PRIMARY KEY (id);


--
-- Name: org_job_titles org_job_titles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_job_titles
    ADD CONSTRAINT org_job_titles_pkey PRIMARY KEY (id);


--
-- Name: org_job_transfers org_job_transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_job_transfers
    ADD CONSTRAINT org_job_transfers_pkey PRIMARY KEY (id);


--
-- Name: org_member_departments org_member_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_member_departments
    ADD CONSTRAINT org_member_departments_pkey PRIMARY KEY (id);


--
-- Name: org_members org_members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_members
    ADD CONSTRAINT org_members_pkey PRIMARY KEY (id);


--
-- Name: org_organ_domains org_organ_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_organ_domains
    ADD CONSTRAINT org_organ_domains_pkey PRIMARY KEY (id);


--
-- Name: org_organ_handles org_organ_handles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_organ_handles
    ADD CONSTRAINT org_organ_handles_pkey PRIMARY KEY (id);


--
-- Name: org_organs org_organs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_organs
    ADD CONSTRAINT org_organs_pkey PRIMARY KEY (id);


--
-- Name: org_resign_reasons org_resign_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_resign_reasons
    ADD CONSTRAINT org_resign_reasons_pkey PRIMARY KEY (id);


--
-- Name: org_resign_references org_resign_references_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_resign_references
    ADD CONSTRAINT org_resign_references_pkey PRIMARY KEY (id);


--
-- Name: org_resigns org_resigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_resigns
    ADD CONSTRAINT org_resigns_pkey PRIMARY KEY (id);


--
-- Name: org_super_job_titles org_super_job_titles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_super_job_titles
    ADD CONSTRAINT org_super_job_titles_pkey PRIMARY KEY (id);


--
-- Name: org_supports org_supports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_supports
    ADD CONSTRAINT org_supports_pkey PRIMARY KEY (id);


--
-- Name: org_tutorials org_tutorials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.org_tutorials
    ADD CONSTRAINT org_tutorials_pkey PRIMARY KEY (id);


--
-- Name: plan_participants plan_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_participants
    ADD CONSTRAINT plan_participants_pkey PRIMARY KEY (id);


--
-- Name: profiled_address_organs profiled_address_organs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiled_address_organs
    ADD CONSTRAINT profiled_address_organs_pkey PRIMARY KEY (id);


--
-- Name: profiled_address_users profiled_address_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiled_address_users
    ADD CONSTRAINT profiled_address_users_pkey PRIMARY KEY (id);


--
-- Name: profiled_addresses profiled_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiled_addresses
    ADD CONSTRAINT profiled_addresses_pkey PRIMARY KEY (id);


--
-- Name: profiled_areas profiled_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiled_areas
    ADD CONSTRAINT profiled_areas_pkey PRIMARY KEY (id);


--
-- Name: profiled_profiles profiled_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiled_profiles
    ADD CONSTRAINT profiled_profiles_pkey PRIMARY KEY (id);


--
-- Name: project_taxon_facilitates project_taxon_facilitates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_taxon_facilitates
    ADD CONSTRAINT project_taxon_facilitates_pkey PRIMARY KEY (id);


--
-- Name: project_taxon_indicators project_taxon_indicators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_taxon_indicators
    ADD CONSTRAINT project_taxon_indicators_pkey PRIMARY KEY (id);


--
-- Name: project_taxons project_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.project_taxons
    ADD CONSTRAINT project_taxons_pkey PRIMARY KEY (id);


--
-- Name: quip_apps quip_apps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quip_apps
    ADD CONSTRAINT quip_apps_pkey PRIMARY KEY (id);


--
-- Name: requirements requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_pkey PRIMARY KEY (id);


--
-- Name: roled_busynesses roled_busynesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_busynesses
    ADD CONSTRAINT roled_busynesses_pkey PRIMARY KEY (id);


--
-- Name: roled_governs roled_governs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_governs
    ADD CONSTRAINT roled_governs_pkey PRIMARY KEY (id);


--
-- Name: roled_name_spaces roled_name_spaces_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_name_spaces
    ADD CONSTRAINT roled_name_spaces_pkey PRIMARY KEY (id);


--
-- Name: roled_role_rules roled_role_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_role_rules
    ADD CONSTRAINT roled_role_rules_pkey PRIMARY KEY (id);


--
-- Name: roled_role_types roled_role_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_role_types
    ADD CONSTRAINT roled_role_types_pkey PRIMARY KEY (id);


--
-- Name: roled_roles roled_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_roles
    ADD CONSTRAINT roled_roles_pkey PRIMARY KEY (id);


--
-- Name: roled_rule_operations roled_rule_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_rule_operations
    ADD CONSTRAINT roled_rule_operations_pkey PRIMARY KEY (id);


--
-- Name: roled_rules roled_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_rules
    ADD CONSTRAINT roled_rules_pkey PRIMARY KEY (id);


--
-- Name: roled_who_roles roled_who_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roled_who_roles
    ADD CONSTRAINT roled_who_roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: ship_cars ship_cars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_cars
    ADD CONSTRAINT ship_cars_pkey PRIMARY KEY (id);


--
-- Name: ship_drivers ship_drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_drivers
    ADD CONSTRAINT ship_drivers_pkey PRIMARY KEY (id);


--
-- Name: ship_favorites ship_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_favorites
    ADD CONSTRAINT ship_favorites_pkey PRIMARY KEY (id);


--
-- Name: ship_line_similars ship_line_similars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_line_similars
    ADD CONSTRAINT ship_line_similars_pkey PRIMARY KEY (id);


--
-- Name: ship_lines ship_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_lines
    ADD CONSTRAINT ship_lines_pkey PRIMARY KEY (id);


--
-- Name: ship_locations ship_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_locations
    ADD CONSTRAINT ship_locations_pkey PRIMARY KEY (id);


--
-- Name: ship_packageds ship_packageds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_packageds
    ADD CONSTRAINT ship_packageds_pkey PRIMARY KEY (id);


--
-- Name: ship_packages ship_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_packages
    ADD CONSTRAINT ship_packages_pkey PRIMARY KEY (id);


--
-- Name: ship_shipments ship_shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ship_shipments
    ADD CONSTRAINT ship_shipments_pkey PRIMARY KEY (id);


--
-- Name: stats stats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (id);


--
-- Name: trade_advances trade_advances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_advances
    ADD CONSTRAINT trade_advances_pkey PRIMARY KEY (id);


--
-- Name: trade_card_advances trade_card_advances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_card_advances
    ADD CONSTRAINT trade_card_advances_pkey PRIMARY KEY (id);


--
-- Name: trade_card_logs trade_card_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_card_logs
    ADD CONSTRAINT trade_card_logs_pkey PRIMARY KEY (id);


--
-- Name: trade_card_prepayments trade_card_prepayments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_card_prepayments
    ADD CONSTRAINT trade_card_prepayments_pkey PRIMARY KEY (id);


--
-- Name: trade_card_promotes trade_card_promotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_card_promotes
    ADD CONSTRAINT trade_card_promotes_pkey PRIMARY KEY (id);


--
-- Name: trade_card_templates trade_card_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_card_templates
    ADD CONSTRAINT trade_card_templates_pkey PRIMARY KEY (id);


--
-- Name: trade_cards trade_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_cards
    ADD CONSTRAINT trade_cards_pkey PRIMARY KEY (id);


--
-- Name: trade_carts trade_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_carts
    ADD CONSTRAINT trade_carts_pkey PRIMARY KEY (id);


--
-- Name: trade_cash_givens trade_cash_givens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_cash_givens
    ADD CONSTRAINT trade_cash_givens_pkey PRIMARY KEY (id);


--
-- Name: trade_cash_logs trade_cash_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_cash_logs
    ADD CONSTRAINT trade_cash_logs_pkey PRIMARY KEY (id);


--
-- Name: trade_cashes trade_cashes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_cashes
    ADD CONSTRAINT trade_cashes_pkey PRIMARY KEY (id);


--
-- Name: trade_exchange_rates trade_exchange_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_exchange_rates
    ADD CONSTRAINT trade_exchange_rates_pkey PRIMARY KEY (id);


--
-- Name: trade_orders trade_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_orders
    ADD CONSTRAINT trade_orders_pkey PRIMARY KEY (id);


--
-- Name: trade_payment_methods trade_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_payment_methods
    ADD CONSTRAINT trade_payment_methods_pkey PRIMARY KEY (id);


--
-- Name: trade_payment_orders trade_payment_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_payment_orders
    ADD CONSTRAINT trade_payment_orders_pkey PRIMARY KEY (id);


--
-- Name: trade_payment_references trade_payment_references_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_payment_references
    ADD CONSTRAINT trade_payment_references_pkey PRIMARY KEY (id);


--
-- Name: trade_payment_strategies trade_payment_strategies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_payment_strategies
    ADD CONSTRAINT trade_payment_strategies_pkey PRIMARY KEY (id);


--
-- Name: trade_payments trade_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_payments
    ADD CONSTRAINT trade_payments_pkey PRIMARY KEY (id);


--
-- Name: trade_payouts trade_payouts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_payouts
    ADD CONSTRAINT trade_payouts_pkey PRIMARY KEY (id);


--
-- Name: trade_promote_carts trade_promote_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_promote_carts
    ADD CONSTRAINT trade_promote_carts_pkey PRIMARY KEY (id);


--
-- Name: trade_promote_charges trade_promote_charges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_promote_charges
    ADD CONSTRAINT trade_promote_charges_pkey PRIMARY KEY (id);


--
-- Name: trade_promote_extras trade_promote_extras_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_promote_extras
    ADD CONSTRAINT trade_promote_extras_pkey PRIMARY KEY (id);


--
-- Name: trade_promote_goods trade_promote_goods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_promote_goods
    ADD CONSTRAINT trade_promote_goods_pkey PRIMARY KEY (id);


--
-- Name: trade_promotes trade_promotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_promotes
    ADD CONSTRAINT trade_promotes_pkey PRIMARY KEY (id);


--
-- Name: trade_refunds trade_refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_refunds
    ADD CONSTRAINT trade_refunds_pkey PRIMARY KEY (id);


--
-- Name: trade_trade_items trade_trade_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_trade_items
    ADD CONSTRAINT trade_trade_items_pkey PRIMARY KEY (id);


--
-- Name: trade_trade_promotes trade_trade_promotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trade_trade_promotes
    ADD CONSTRAINT trade_trade_promotes_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wechat_agencies wechat_agencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_agencies
    ADD CONSTRAINT wechat_agencies_pkey PRIMARY KEY (id);


--
-- Name: wechat_apps wechat_apps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_apps
    ADD CONSTRAINT wechat_apps_pkey PRIMARY KEY (id);


--
-- Name: wechat_auths wechat_auths_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_auths
    ADD CONSTRAINT wechat_auths_pkey PRIMARY KEY (id);


--
-- Name: wechat_extractions wechat_extractions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_extractions
    ADD CONSTRAINT wechat_extractions_pkey PRIMARY KEY (id);


--
-- Name: wechat_extractors wechat_extractors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_extractors
    ADD CONSTRAINT wechat_extractors_pkey PRIMARY KEY (id);


--
-- Name: wechat_hooks wechat_hooks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_hooks
    ADD CONSTRAINT wechat_hooks_pkey PRIMARY KEY (id);


--
-- Name: wechat_medias wechat_medias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_medias
    ADD CONSTRAINT wechat_medias_pkey PRIMARY KEY (id);


--
-- Name: wechat_menus wechat_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_menus
    ADD CONSTRAINT wechat_menus_pkey PRIMARY KEY (id);


--
-- Name: wechat_news_reply_items wechat_news_reply_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_news_reply_items
    ADD CONSTRAINT wechat_news_reply_items_pkey PRIMARY KEY (id);


--
-- Name: wechat_notices wechat_notices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_notices
    ADD CONSTRAINT wechat_notices_pkey PRIMARY KEY (id);


--
-- Name: wechat_platforms wechat_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_platforms
    ADD CONSTRAINT wechat_platforms_pkey PRIMARY KEY (id);


--
-- Name: wechat_receives wechat_receives_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_receives
    ADD CONSTRAINT wechat_receives_pkey PRIMARY KEY (id);


--
-- Name: wechat_registers wechat_registers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_registers
    ADD CONSTRAINT wechat_registers_pkey PRIMARY KEY (id);


--
-- Name: wechat_replies wechat_replies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_replies
    ADD CONSTRAINT wechat_replies_pkey PRIMARY KEY (id);


--
-- Name: wechat_requests wechat_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_requests
    ADD CONSTRAINT wechat_requests_pkey PRIMARY KEY (id);


--
-- Name: wechat_responses wechat_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_responses
    ADD CONSTRAINT wechat_responses_pkey PRIMARY KEY (id);


--
-- Name: wechat_scene_menus wechat_scene_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_scene_menus
    ADD CONSTRAINT wechat_scene_menus_pkey PRIMARY KEY (id);


--
-- Name: wechat_scenes wechat_scenes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_scenes
    ADD CONSTRAINT wechat_scenes_pkey PRIMARY KEY (id);


--
-- Name: wechat_services wechat_services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_services
    ADD CONSTRAINT wechat_services_pkey PRIMARY KEY (id);


--
-- Name: wechat_subscribes wechat_subscribes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_subscribes
    ADD CONSTRAINT wechat_subscribes_pkey PRIMARY KEY (id);


--
-- Name: wechat_tags wechat_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_tags
    ADD CONSTRAINT wechat_tags_pkey PRIMARY KEY (id);


--
-- Name: wechat_template_configs wechat_template_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_template_configs
    ADD CONSTRAINT wechat_template_configs_pkey PRIMARY KEY (id);


--
-- Name: wechat_template_key_words wechat_template_key_words_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_template_key_words
    ADD CONSTRAINT wechat_template_key_words_pkey PRIMARY KEY (id);


--
-- Name: wechat_templates wechat_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_templates
    ADD CONSTRAINT wechat_templates_pkey PRIMARY KEY (id);


--
-- Name: wechat_tickets wechat_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_tickets
    ADD CONSTRAINT wechat_tickets_pkey PRIMARY KEY (id);


--
-- Name: wechat_user_tags wechat_user_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wechat_user_tags
    ADD CONSTRAINT wechat_user_tags_pkey PRIMARY KEY (id);


--
-- Name: area_anc_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX area_anc_desc_idx ON public.profiled_area_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: area_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX area_desc_idx ON public.profiled_area_hierarchies USING btree (descendant_id);


--
-- Name: department_anc_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX department_anc_desc_idx ON public.org_department_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: department_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX department_desc_idx ON public.org_department_hierarchies USING btree (descendant_id);


--
-- Name: facilitate_taxon_anc_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX facilitate_taxon_anc_desc_idx ON public.bench_facilitate_taxon_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: facilitate_taxon_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX facilitate_taxon_desc_idx ON public.bench_facilitate_taxon_hierarchies USING btree (descendant_id);


--
-- Name: financial_taxon_anc_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX financial_taxon_anc_desc_idx ON public.finance_financial_taxon_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: financial_taxon_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX financial_taxon_desc_idx ON public.finance_financial_taxon_hierarchies USING btree (descendant_id);


--
-- Name: index_action_mailbox_inbound_emails_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_action_mailbox_inbound_emails_uniqueness ON public.action_mailbox_inbound_emails USING btree (message_id, message_checksum);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_variant_records_on_blob_id ON public.active_storage_variant_records USING btree (blob_id);


--
-- Name: index_attend_absence_stats_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_absence_stats_on_member_id ON public.attend_absence_stats USING btree (member_id);


--
-- Name: index_attend_absences_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_absences_on_member_id ON public.attend_absences USING btree (member_id);


--
-- Name: index_attend_absences_on_merged_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_absences_on_merged_id ON public.attend_absences USING btree (merged_id);


--
-- Name: index_attend_attendance_logs_on_attendance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_attendance_logs_on_attendance_id ON public.attend_attendance_logs USING btree (attendance_id);


--
-- Name: index_attend_attendance_logs_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_attendance_logs_on_member_id ON public.attend_attendance_logs USING btree (member_id);


--
-- Name: index_attend_attendance_settings_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_attendance_settings_on_member_id ON public.attend_attendance_settings USING btree (member_id);


--
-- Name: index_attend_attendance_stats_on_financial_month_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_attendance_stats_on_financial_month_id ON public.attend_attendance_stats USING btree (financial_month_id);


--
-- Name: index_attend_attendance_stats_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_attendance_stats_on_member_id ON public.attend_attendance_stats USING btree (member_id);


--
-- Name: index_attend_attendances_on_interval_absence_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_attendances_on_interval_absence_id ON public.attend_attendances USING btree (interval_absence_id);


--
-- Name: index_attend_attendances_on_late_absence_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_attendances_on_late_absence_id ON public.attend_attendances USING btree (late_absence_id);


--
-- Name: index_attend_attendances_on_leave_absence_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_attendances_on_leave_absence_id ON public.attend_attendances USING btree (leave_absence_id);


--
-- Name: index_attend_attendances_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_attendances_on_member_id ON public.attend_attendances USING btree (member_id);


--
-- Name: index_attend_extra_days_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_extra_days_on_organ_id ON public.attend_extra_days USING btree (organ_id);


--
-- Name: index_attend_financial_months_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_financial_months_on_organ_id ON public.attend_financial_months USING btree (organ_id);


--
-- Name: index_attend_overtimes_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attend_overtimes_on_member_id ON public.attend_overtimes USING btree (member_id);


--
-- Name: index_auditor_approvals_on_approving_type_and_approving_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auditor_approvals_on_approving_type_and_approving_id ON public.auditor_approvals USING btree (approving_type, approving_id);


--
-- Name: index_auditor_approvals_on_operator_type_and_operator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auditor_approvals_on_operator_type_and_operator_id ON public.auditor_approvals USING btree (operator_type, operator_id);


--
-- Name: index_auditor_audits_on_audited_type_and_audited_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auditor_audits_on_audited_type_and_audited_id ON public.auditor_audits USING btree (audited_type, audited_id);


--
-- Name: index_auditor_audits_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auditor_audits_on_created_at ON public.auditor_audits USING btree (created_at);


--
-- Name: index_auditor_audits_on_operator_type_and_operator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auditor_audits_on_operator_type_and_operator_id ON public.auditor_audits USING btree (operator_type, operator_id);


--
-- Name: index_auditor_verifications_on_job_title_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auditor_verifications_on_job_title_id ON public.auditor_verifications USING btree (job_title_id);


--
-- Name: index_auditor_verifications_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auditor_verifications_on_member_id ON public.auditor_verifications USING btree (member_id);


--
-- Name: index_auditor_verifications_on_verifier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auditor_verifications_on_verifier_id ON public.auditor_verifications USING btree (verifier_id);


--
-- Name: index_auditor_verifiers_on_job_title_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auditor_verifiers_on_job_title_id ON public.auditor_verifiers USING btree (job_title_id);


--
-- Name: index_auditor_verifiers_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auditor_verifiers_on_member_id ON public.auditor_verifiers USING btree (member_id);


--
-- Name: index_auth_accounts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auth_accounts_on_user_id ON public.auth_accounts USING btree (user_id);


--
-- Name: index_auth_apps_on_appid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auth_apps_on_appid ON public.auth_apps USING btree (appid);


--
-- Name: index_auth_oauth_users_on_member_inviter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auth_oauth_users_on_member_inviter_id ON public.auth_oauth_users USING btree (member_inviter_id);


--
-- Name: index_auth_oauth_users_on_user_inviter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auth_oauth_users_on_user_inviter_id ON public.auth_oauth_users USING btree (user_inviter_id);


--
-- Name: index_auth_user_taggeds_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auth_user_taggeds_on_user_id ON public.auth_user_taggeds USING btree (user_id);


--
-- Name: index_auth_user_taggeds_on_user_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auth_user_taggeds_on_user_tag_id ON public.auth_user_taggeds USING btree (user_tag_id);


--
-- Name: index_auth_user_tags_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_auth_user_tags_on_organ_id ON public.auth_user_tags USING btree (organ_id);


--
-- Name: index_bench_facilitate_indicators_on_facilitate_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_facilitate_indicators_on_facilitate_id ON public.bench_facilitate_indicators USING btree (facilitate_id);


--
-- Name: index_bench_facilitate_indicators_on_facilitate_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_facilitate_indicators_on_facilitate_taxon_id ON public.bench_facilitate_indicators USING btree (facilitate_taxon_id);


--
-- Name: index_bench_facilitate_indicators_on_indicator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_facilitate_indicators_on_indicator_id ON public.bench_facilitate_indicators USING btree (indicator_id);


--
-- Name: index_bench_facilitate_providers_on_facilitate_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_facilitate_providers_on_facilitate_id ON public.bench_facilitate_providers USING btree (facilitate_id);


--
-- Name: index_bench_facilitate_providers_on_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_facilitate_providers_on_provider_id ON public.bench_facilitate_providers USING btree (provider_id);


--
-- Name: index_bench_facilitate_taxons_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_facilitate_taxons_on_organ_id ON public.bench_facilitate_taxons USING btree (organ_id);


--
-- Name: index_bench_facilitate_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_facilitate_taxons_on_parent_id ON public.bench_facilitate_taxons USING btree (parent_id);


--
-- Name: index_bench_facilitate_taxons_on_project_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_facilitate_taxons_on_project_taxon_id ON public.bench_facilitate_taxons USING btree (project_taxon_id);


--
-- Name: index_bench_facilitates_on_facilitate_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_facilitates_on_facilitate_taxon_id ON public.bench_facilitates USING btree (facilitate_taxon_id);


--
-- Name: index_bench_facilitates_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_facilitates_on_organ_id ON public.bench_facilitates USING btree (organ_id);


--
-- Name: index_bench_indicators_on_facilitate_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_indicators_on_facilitate_taxon_id ON public.bench_indicators USING btree (facilitate_taxon_id);


--
-- Name: index_bench_indicators_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_indicators_on_organ_id ON public.bench_indicators USING btree (organ_id);


--
-- Name: index_bench_indicators_on_project_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_indicators_on_project_taxon_id ON public.bench_indicators USING btree (project_taxon_id);


--
-- Name: index_bench_indicators_on_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_indicators_on_taxon_id ON public.bench_indicators USING btree (taxon_id);


--
-- Name: index_bench_mileposts_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_mileposts_on_organ_id ON public.bench_mileposts USING btree (organ_id);


--
-- Name: index_bench_project_facilitates_on_facilitate_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_project_facilitates_on_facilitate_id ON public.bench_project_facilitates USING btree (facilitate_id);


--
-- Name: index_bench_project_facilitates_on_facilitate_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_project_facilitates_on_facilitate_taxon_id ON public.bench_project_facilitates USING btree (facilitate_taxon_id);


--
-- Name: index_bench_project_facilitates_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_project_facilitates_on_project_id ON public.bench_project_facilitates USING btree (project_id);


--
-- Name: index_bench_project_facilitates_on_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_project_facilitates_on_provider_id ON public.bench_project_facilitates USING btree (provider_id);


--
-- Name: index_bench_project_indicators_on_indicator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_project_indicators_on_indicator_id ON public.bench_project_indicators USING btree (indicator_id);


--
-- Name: index_bench_project_indicators_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_project_indicators_on_project_id ON public.bench_project_indicators USING btree (project_id);


--
-- Name: index_bench_project_mileposts_on_milepost_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_project_mileposts_on_milepost_id ON public.bench_project_mileposts USING btree (milepost_id);


--
-- Name: index_bench_project_mileposts_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_project_mileposts_on_project_id ON public.bench_project_mileposts USING btree (project_id);


--
-- Name: index_bench_project_webhooks_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_project_webhooks_on_project_id ON public.bench_project_webhooks USING btree (project_id);


--
-- Name: index_bench_projects_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_projects_on_organ_id ON public.bench_projects USING btree (organ_id);


--
-- Name: index_bench_projects_on_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_projects_on_taxon_id ON public.bench_projects USING btree (taxon_id);


--
-- Name: index_bench_task_templates_on_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_task_templates_on_department_id ON public.bench_task_templates USING btree (department_id);


--
-- Name: index_bench_task_templates_on_job_title_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_task_templates_on_job_title_id ON public.bench_task_templates USING btree (job_title_id);


--
-- Name: index_bench_task_templates_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_task_templates_on_member_id ON public.bench_task_templates USING btree (member_id);


--
-- Name: index_bench_task_templates_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_task_templates_on_organ_id ON public.bench_task_templates USING btree (organ_id);


--
-- Name: index_bench_task_templates_on_project_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_task_templates_on_project_taxon_id ON public.bench_task_templates USING btree (project_taxon_id);


--
-- Name: index_bench_task_timers_on_task_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_task_timers_on_task_id ON public.bench_task_timers USING btree (task_id);


--
-- Name: index_bench_tasks_on_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_tasks_on_department_id ON public.bench_tasks USING btree (department_id);


--
-- Name: index_bench_tasks_on_job_title_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_tasks_on_job_title_id ON public.bench_tasks USING btree (job_title_id);


--
-- Name: index_bench_tasks_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_tasks_on_member_id ON public.bench_tasks USING btree (member_id);


--
-- Name: index_bench_tasks_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_tasks_on_organ_id ON public.bench_tasks USING btree (organ_id);


--
-- Name: index_bench_tasks_on_task_template_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_tasks_on_task_template_id ON public.bench_tasks USING btree (task_template_id);


--
-- Name: index_bench_tasks_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bench_tasks_on_user_id ON public.bench_tasks USING btree (user_id);


--
-- Name: index_budgets_on_budgeting; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_budgets_on_budgeting ON public.finance_budgets USING btree (financial_type, financial_id);


--
-- Name: index_com_acme_identifiers_on_acme_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_com_acme_identifiers_on_acme_order_id ON public.com_acme_identifiers USING btree (acme_order_id);


--
-- Name: index_com_acme_orders_on_acme_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_com_acme_orders_on_acme_account_id ON public.com_acme_orders USING btree (acme_account_id);


--
-- Name: index_com_meta_actions_on_business_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_com_meta_actions_on_business_identifier ON public.com_meta_actions USING btree (business_identifier);


--
-- Name: index_com_meta_actions_on_controller_path; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_com_meta_actions_on_controller_path ON public.com_meta_actions USING btree (controller_path);


--
-- Name: index_com_meta_actions_on_namespace_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_com_meta_actions_on_namespace_identifier ON public.com_meta_actions USING btree (namespace_identifier);


--
-- Name: index_com_meta_businesses_on_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_com_meta_businesses_on_identifier ON public.com_meta_businesses USING btree (identifier);


--
-- Name: index_com_meta_columns_on_record_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_com_meta_columns_on_record_name ON public.com_meta_columns USING btree (record_name);


--
-- Name: index_com_meta_controllers_on_business_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_com_meta_controllers_on_business_identifier ON public.com_meta_controllers USING btree (business_identifier);


--
-- Name: index_com_meta_controllers_on_controller_path; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_com_meta_controllers_on_controller_path ON public.com_meta_controllers USING btree (controller_path);


--
-- Name: index_com_meta_controllers_on_namespace_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_com_meta_controllers_on_namespace_identifier ON public.com_meta_controllers USING btree (namespace_identifier);


--
-- Name: index_com_meta_models_on_record_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_com_meta_models_on_record_name ON public.com_meta_models USING btree (record_name);


--
-- Name: index_com_meta_namespaces_on_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_com_meta_namespaces_on_identifier ON public.com_meta_namespaces USING btree (identifier);


--
-- Name: index_datum_record_lists_on_data_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_datum_record_lists_on_data_list_id ON public.datum_record_lists USING btree (data_list_id);


--
-- Name: index_datum_table_items_on_table_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_datum_table_items_on_table_list_id ON public.datum_table_items USING btree (table_list_id);


--
-- Name: index_datum_table_lists_on_data_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_datum_table_lists_on_data_list_id ON public.datum_table_lists USING btree (data_list_id);


--
-- Name: index_detail_contents_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_contents_on_author_id ON public.detail_contents USING btree (author_id);


--
-- Name: index_detail_contents_on_detail_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_contents_on_detail_id ON public.detail_contents USING btree (detail_id);


--
-- Name: index_detail_entity_items_on_entity_type_and_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_entity_items_on_entity_type_and_entity_id ON public.detail_entity_items USING btree (entity_type, entity_id);


--
-- Name: index_detail_entity_items_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_entity_items_on_item_id ON public.detail_entity_items USING btree (item_id);


--
-- Name: index_detail_entity_items_on_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_entity_items_on_list_id ON public.detail_entity_items USING btree (list_id);


--
-- Name: index_detail_entity_items_on_taxon_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_entity_items_on_taxon_item_id ON public.detail_entity_items USING btree (taxon_item_id);


--
-- Name: index_detail_items_on_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_items_on_list_id ON public.detail_items USING btree (list_id);


--
-- Name: index_detail_knowings_on_knowable_type_and_knowable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_knowings_on_knowable_type_and_knowable_id ON public.detail_knowings USING btree (knowable_type, knowable_id);


--
-- Name: index_detail_knowings_on_knowledge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_knowings_on_knowledge_id ON public.detail_knowings USING btree (knowledge_id);


--
-- Name: index_detail_knowledges_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_knowledges_on_parent_id ON public.detail_knowledges USING btree (parent_id);


--
-- Name: index_detail_lists_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_lists_on_organ_id ON public.detail_lists USING btree (organ_id);


--
-- Name: index_detail_post_syncs_on_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_post_syncs_on_post_id ON public.detail_post_syncs USING btree (post_id);


--
-- Name: index_detail_post_syncs_on_synced_type_and_synced_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_post_syncs_on_synced_type_and_synced_id ON public.detail_post_syncs USING btree (synced_type, synced_id);


--
-- Name: index_detail_posts_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_posts_on_organ_id ON public.detail_posts USING btree (organ_id);


--
-- Name: index_detail_taxon_items_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_taxon_items_on_item_id ON public.detail_taxon_items USING btree (item_id);


--
-- Name: index_detail_taxon_items_on_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_taxon_items_on_list_id ON public.detail_taxon_items USING btree (list_id);


--
-- Name: index_detail_taxon_items_on_taxon_type_and_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_detail_taxon_items_on_taxon_type_and_taxon_id ON public.detail_taxon_items USING btree (taxon_type, taxon_id);


--
-- Name: index_doc_subjects_on_rule_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_doc_subjects_on_rule_id ON public.doc_subjects USING btree (rule_id);


--
-- Name: index_email_logs_on_template_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_logs_on_template_id ON public.email_logs USING btree (template_id);


--
-- Name: index_email_smtp_accounts_on_smtp_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_smtp_accounts_on_smtp_id ON public.email_smtp_accounts USING btree (smtp_id);


--
-- Name: index_email_subscriptions_on_reason_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_subscriptions_on_reason_id ON public.email_subscriptions USING btree (reason_id);


--
-- Name: index_email_subscriptions_on_smtp_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_subscriptions_on_smtp_account_id ON public.email_subscriptions USING btree (smtp_account_id);


--
-- Name: index_email_subscriptions_on_smtp_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_subscriptions_on_smtp_id ON public.email_subscriptions USING btree (smtp_id);


--
-- Name: index_email_templates_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_templates_on_organ_id ON public.email_templates USING btree (organ_id);


--
-- Name: index_event_participants_on_event_crowd_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_participants_on_event_crowd_id ON public.event_participants USING btree (event_crowd_id);


--
-- Name: index_event_participants_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_participants_on_event_id ON public.event_participants USING btree (event_id);


--
-- Name: index_event_participants_on_participant_type_and_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_event_participants_on_participant_type_and_participant_id ON public.event_participants USING btree (participant_type, participant_id);


--
-- Name: index_eventual_bookings_on_booked_type_and_booked_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_bookings_on_booked_type_and_booked_id ON public.eventual_bookings USING btree (booked_type, booked_id);


--
-- Name: index_eventual_bookings_on_booker_type_and_booker_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_bookings_on_booker_type_and_booker_id ON public.eventual_bookings USING btree (booker_type, booker_id);


--
-- Name: index_eventual_bookings_on_place_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_bookings_on_place_id ON public.eventual_bookings USING btree (place_id);


--
-- Name: index_eventual_bookings_on_plan_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_bookings_on_plan_item_id ON public.eventual_bookings USING btree (plan_item_id);


--
-- Name: index_eventual_bookings_on_seat_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_bookings_on_seat_id ON public.eventual_bookings USING btree (seat_id);


--
-- Name: index_eventual_bookings_on_time_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_bookings_on_time_item_id ON public.eventual_bookings USING btree (time_item_id);


--
-- Name: index_eventual_crowd_members_on_agency_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_crowd_members_on_agency_id ON public.eventual_crowd_members USING btree (agency_id);


--
-- Name: index_eventual_crowd_members_on_crowd_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_crowd_members_on_crowd_id ON public.eventual_crowd_members USING btree (crowd_id);


--
-- Name: index_eventual_crowd_members_on_member_type_and_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_crowd_members_on_member_type_and_member_id ON public.eventual_crowd_members USING btree (member_type, member_id);


--
-- Name: index_eventual_crowds_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_crowds_on_organ_id ON public.eventual_crowds USING btree (organ_id);


--
-- Name: index_eventual_event_crowds_on_crowd_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_event_crowds_on_crowd_id ON public.eventual_event_crowds USING btree (crowd_id);


--
-- Name: index_eventual_event_crowds_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_event_crowds_on_event_id ON public.eventual_event_crowds USING btree (event_id);


--
-- Name: index_eventual_event_grants_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_event_grants_on_event_id ON public.eventual_event_grants USING btree (event_id);


--
-- Name: index_eventual_event_items_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_event_items_on_author_id ON public.eventual_event_items USING btree (author_id);


--
-- Name: index_eventual_event_items_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_event_items_on_event_id ON public.eventual_event_items USING btree (event_id);


--
-- Name: index_eventual_event_participants_on_crowd_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_event_participants_on_crowd_member_id ON public.eventual_event_participants USING btree (crowd_member_id);


--
-- Name: index_eventual_event_participants_on_event_crowd_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_event_participants_on_event_crowd_id ON public.eventual_event_participants USING btree (event_crowd_id);


--
-- Name: index_eventual_event_participants_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_event_participants_on_event_id ON public.eventual_event_participants USING btree (event_id);


--
-- Name: index_eventual_event_participants_on_participant; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_event_participants_on_participant ON public.eventual_event_participants USING btree (participant_type, participant_id);


--
-- Name: index_eventual_event_taxons_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_event_taxons_on_organ_id ON public.eventual_event_taxons USING btree (organ_id);


--
-- Name: index_eventual_events_on_event_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_events_on_event_taxon_id ON public.eventual_events USING btree (event_taxon_id);


--
-- Name: index_eventual_events_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_events_on_organ_id ON public.eventual_events USING btree (organ_id);


--
-- Name: index_eventual_place_taxons_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_place_taxons_on_organ_id ON public.eventual_place_taxons USING btree (organ_id);


--
-- Name: index_eventual_place_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_place_taxons_on_parent_id ON public.eventual_place_taxons USING btree (parent_id);


--
-- Name: index_eventual_places_on_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_places_on_area_id ON public.eventual_places USING btree (area_id);


--
-- Name: index_eventual_places_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_places_on_organ_id ON public.eventual_places USING btree (organ_id);


--
-- Name: index_eventual_places_on_place_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_places_on_place_taxon_id ON public.eventual_places USING btree (place_taxon_id);


--
-- Name: index_eventual_plan_attenders_on_attender_type_and_attender_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_attenders_on_attender_type_and_attender_id ON public.eventual_plan_attenders USING btree (attender_type, attender_id);


--
-- Name: index_eventual_plan_attenders_on_place_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_attenders_on_place_id ON public.eventual_plan_attenders USING btree (place_id);


--
-- Name: index_eventual_plan_attenders_on_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_attenders_on_plan_id ON public.eventual_plan_attenders USING btree (plan_id);


--
-- Name: index_eventual_plan_attenders_on_plan_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_attenders_on_plan_item_id ON public.eventual_plan_attenders USING btree (plan_item_id);


--
-- Name: index_eventual_plan_attenders_on_plan_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_attenders_on_plan_participant_id ON public.eventual_plan_attenders USING btree (plan_participant_id);


--
-- Name: index_eventual_plan_items_on_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_items_on_event_id ON public.eventual_plan_items USING btree (event_id);


--
-- Name: index_eventual_plan_items_on_event_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_items_on_event_item_id ON public.eventual_plan_items USING btree (event_item_id);


--
-- Name: index_eventual_plan_items_on_place_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_items_on_place_id ON public.eventual_plan_items USING btree (place_id);


--
-- Name: index_eventual_plan_items_on_planned_type_and_planned_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_items_on_planned_type_and_planned_id ON public.eventual_plan_items USING btree (planned_type, planned_id);


--
-- Name: index_eventual_plan_items_on_time_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_items_on_time_item_id ON public.eventual_plan_items USING btree (time_item_id);


--
-- Name: index_eventual_plan_items_on_time_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_items_on_time_list_id ON public.eventual_plan_items USING btree (time_list_id);


--
-- Name: index_eventual_plan_participants_on_event_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_participants_on_event_participant_id ON public.eventual_plan_participants USING btree (event_participant_id);


--
-- Name: index_eventual_plan_participants_on_participant; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_participants_on_participant ON public.eventual_plan_participants USING btree (participant_type, participant_id);


--
-- Name: index_eventual_plan_participants_on_planning; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plan_participants_on_planning ON public.eventual_plan_participants USING btree (planning_type, planning_id);


--
-- Name: index_eventual_plans_on_place_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plans_on_place_id ON public.eventual_plans USING btree (place_id);


--
-- Name: index_eventual_plans_on_planned_type_and_planned_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plans_on_planned_type_and_planned_id ON public.eventual_plans USING btree (planned_type, planned_id);


--
-- Name: index_eventual_plans_on_time_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_plans_on_time_list_id ON public.eventual_plans USING btree (time_list_id);


--
-- Name: index_eventual_seats_on_place_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_seats_on_place_id ON public.eventual_seats USING btree (place_id);


--
-- Name: index_eventual_time_items_on_time_list_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_time_items_on_time_list_id ON public.eventual_time_items USING btree (time_list_id);


--
-- Name: index_eventual_time_lists_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_eventual_time_lists_on_organ_id ON public.eventual_time_lists USING btree (organ_id);


--
-- Name: index_expenses_on_financial; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_expenses_on_financial ON public.finance_expenses USING btree (financial_type, financial_id);


--
-- Name: index_factory_factory_providers_on_factory_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_factory_providers_on_factory_taxon_id ON public.factory_factory_providers USING btree (factory_taxon_id);


--
-- Name: index_factory_factory_providers_on_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_factory_providers_on_provider_id ON public.factory_factory_providers USING btree (provider_id);


--
-- Name: index_factory_part_items_on_part_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_items_on_part_id ON public.factory_part_items USING btree (part_id);


--
-- Name: index_factory_part_items_on_product_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_items_on_product_item_id ON public.factory_part_items USING btree (product_item_id);


--
-- Name: index_factory_part_plans_on_part_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_plans_on_part_id ON public.factory_part_plans USING btree (part_id);


--
-- Name: index_factory_part_plans_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_plans_on_product_id ON public.factory_part_plans USING btree (product_id);


--
-- Name: index_factory_part_plans_on_production_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_plans_on_production_id ON public.factory_part_plans USING btree (production_id);


--
-- Name: index_factory_part_providers_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_providers_on_organ_id ON public.factory_part_providers USING btree (organ_id);


--
-- Name: index_factory_part_providers_on_part_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_providers_on_part_id ON public.factory_part_providers USING btree (part_id);


--
-- Name: index_factory_part_providers_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_providers_on_product_id ON public.factory_part_providers USING btree (product_id);


--
-- Name: index_factory_part_providers_on_production_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_providers_on_production_id ON public.factory_part_providers USING btree (production_id);


--
-- Name: index_factory_part_providers_on_provider_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_providers_on_provider_id ON public.factory_part_providers USING btree (provider_id);


--
-- Name: index_factory_part_taxons_on_factory_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_taxons_on_factory_taxon_id ON public.factory_part_taxons USING btree (factory_taxon_id);


--
-- Name: index_factory_part_taxons_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_taxons_on_organ_id ON public.factory_part_taxons USING btree (organ_id);


--
-- Name: index_factory_part_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_part_taxons_on_parent_id ON public.factory_part_taxons USING btree (parent_id);


--
-- Name: index_factory_parts_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_parts_on_organ_id ON public.factory_parts USING btree (organ_id);


--
-- Name: index_factory_parts_on_part_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_parts_on_part_taxon_id ON public.factory_parts USING btree (part_taxon_id);


--
-- Name: index_factory_parts_on_sku; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_parts_on_sku ON public.factory_parts USING btree (sku);


--
-- Name: index_factory_produce_plans_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_produce_plans_on_organ_id ON public.factory_produce_plans USING btree (organ_id);


--
-- Name: index_factory_product_part_taxons_on_part_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_product_part_taxons_on_part_taxon_id ON public.factory_product_part_taxons USING btree (part_taxon_id);


--
-- Name: index_factory_product_part_taxons_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_product_part_taxons_on_product_id ON public.factory_product_part_taxons USING btree (product_id);


--
-- Name: index_factory_product_parts_on_part_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_product_parts_on_part_id ON public.factory_product_parts USING btree (part_id);


--
-- Name: index_factory_product_parts_on_part_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_product_parts_on_part_taxon_id ON public.factory_product_parts USING btree (part_taxon_id);


--
-- Name: index_factory_product_parts_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_product_parts_on_product_id ON public.factory_product_parts USING btree (product_id);


--
-- Name: index_factory_product_plans_on_produce_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_product_plans_on_produce_plan_id ON public.factory_product_plans USING btree (produce_plan_id);


--
-- Name: index_factory_product_plans_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_product_plans_on_product_id ON public.factory_product_plans USING btree (product_id);


--
-- Name: index_factory_product_produces_on_produce_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_product_produces_on_produce_id ON public.factory_product_produces USING btree (produce_id);


--
-- Name: index_factory_product_produces_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_product_produces_on_product_id ON public.factory_product_produces USING btree (product_id);


--
-- Name: index_factory_product_taxons_on_factory_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_product_taxons_on_factory_taxon_id ON public.factory_product_taxons USING btree (factory_taxon_id);


--
-- Name: index_factory_product_taxons_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_product_taxons_on_organ_id ON public.factory_product_taxons USING btree (organ_id);


--
-- Name: index_factory_product_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_product_taxons_on_parent_id ON public.factory_product_taxons USING btree (parent_id);


--
-- Name: index_factory_production_carts_on_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_production_carts_on_cart_id ON public.factory_production_carts USING btree (cart_id);


--
-- Name: index_factory_production_carts_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_production_carts_on_product_id ON public.factory_production_carts USING btree (product_id);


--
-- Name: index_factory_production_carts_on_production_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_production_carts_on_production_id ON public.factory_production_carts USING btree (production_id);


--
-- Name: index_factory_production_carts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_production_carts_on_user_id ON public.factory_production_carts USING btree (user_id);


--
-- Name: index_factory_production_items_on_product_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_production_items_on_product_plan_id ON public.factory_production_items USING btree (product_plan_id);


--
-- Name: index_factory_production_items_on_production_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_production_items_on_production_id ON public.factory_production_items USING btree (production_id);


--
-- Name: index_factory_production_parts_on_part_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_production_parts_on_part_id ON public.factory_production_parts USING btree (part_id);


--
-- Name: index_factory_production_parts_on_production_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_production_parts_on_production_id ON public.factory_production_parts USING btree (production_id);


--
-- Name: index_factory_productions_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_productions_on_product_id ON public.factory_productions USING btree (product_id);


--
-- Name: index_factory_products_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_products_on_organ_id ON public.factory_products USING btree (organ_id);


--
-- Name: index_factory_products_on_product_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_products_on_product_taxon_id ON public.factory_products USING btree (product_taxon_id);


--
-- Name: index_factory_products_on_sku; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_factory_products_on_sku ON public.factory_products USING btree (sku);


--
-- Name: index_finance_assessments_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_assessments_on_organ_id ON public.finance_assessments USING btree (organ_id);


--
-- Name: index_finance_budgets_on_financial_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_budgets_on_financial_taxon_id ON public.finance_budgets USING btree (financial_taxon_id);


--
-- Name: index_finance_budgets_on_fund_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_budgets_on_fund_id ON public.finance_budgets USING btree (fund_id);


--
-- Name: index_finance_budgets_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_budgets_on_member_id ON public.finance_budgets USING btree (member_id);


--
-- Name: index_finance_budgets_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_budgets_on_organ_id ON public.finance_budgets USING btree (organ_id);


--
-- Name: index_finance_budgets_on_stock_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_budgets_on_stock_id ON public.finance_budgets USING btree (stock_id);


--
-- Name: index_finance_budgets_on_task_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_budgets_on_task_id ON public.finance_budgets USING btree (task_id);


--
-- Name: index_finance_expense_items_on_budget_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expense_items_on_budget_id ON public.finance_expense_items USING btree (budget_id);


--
-- Name: index_finance_expense_items_on_expense_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expense_items_on_expense_id ON public.finance_expense_items USING btree (expense_id);


--
-- Name: index_finance_expense_items_on_financial_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expense_items_on_financial_taxon_id ON public.finance_expense_items USING btree (financial_taxon_id);


--
-- Name: index_finance_expense_members_on_cash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expense_members_on_cash_id ON public.finance_expense_members USING btree (cash_id);


--
-- Name: index_finance_expense_members_on_expense_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expense_members_on_expense_id ON public.finance_expense_members USING btree (expense_id);


--
-- Name: index_finance_expense_members_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expense_members_on_member_id ON public.finance_expense_members USING btree (member_id);


--
-- Name: index_finance_expense_members_on_operator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expense_members_on_operator_id ON public.finance_expense_members USING btree (operator_id);


--
-- Name: index_finance_expense_members_on_payable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expense_members_on_payable ON public.finance_expense_members USING btree (payable_type, payable_id);


--
-- Name: index_finance_expense_members_on_payment_method_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expense_members_on_payment_method_id ON public.finance_expense_members USING btree (payment_method_id);


--
-- Name: index_finance_expenses_on_budget_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expenses_on_budget_id ON public.finance_expenses USING btree (budget_id);


--
-- Name: index_finance_expenses_on_creator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expenses_on_creator_id ON public.finance_expenses USING btree (creator_id);


--
-- Name: index_finance_expenses_on_financial_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expenses_on_financial_taxon_id ON public.finance_expenses USING btree (financial_taxon_id);


--
-- Name: index_finance_expenses_on_fund_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expenses_on_fund_id ON public.finance_expenses USING btree (fund_id);


--
-- Name: index_finance_expenses_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expenses_on_organ_id ON public.finance_expenses USING btree (organ_id);


--
-- Name: index_finance_expenses_on_payment_method_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expenses_on_payment_method_id ON public.finance_expenses USING btree (payment_method_id);


--
-- Name: index_finance_expenses_on_payout_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expenses_on_payout_id ON public.finance_expenses USING btree (payout_id);


--
-- Name: index_finance_expenses_on_stock_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_expenses_on_stock_id ON public.finance_expenses USING btree (stock_id);


--
-- Name: index_finance_financial_taxons_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_financial_taxons_on_organ_id ON public.finance_financial_taxons USING btree (organ_id);


--
-- Name: index_finance_financial_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_financial_taxons_on_parent_id ON public.finance_financial_taxons USING btree (parent_id);


--
-- Name: index_finance_fund_incomes_on_fund_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_fund_incomes_on_fund_id ON public.finance_fund_incomes USING btree (fund_id);


--
-- Name: index_finance_fund_incomes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_fund_incomes_on_user_id ON public.finance_fund_incomes USING btree (user_id);


--
-- Name: index_finance_funds_on_buyer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_funds_on_buyer_id ON public.finance_funds USING btree (buyer_id);


--
-- Name: index_finance_funds_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_funds_on_organ_id ON public.finance_funds USING btree (organ_id);


--
-- Name: index_finance_stocks_on_assessment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_stocks_on_assessment_id ON public.finance_stocks USING btree (assessment_id);


--
-- Name: index_finance_stocks_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_stocks_on_member_id ON public.finance_stocks USING btree (member_id);


--
-- Name: index_finance_stocks_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_stocks_on_organ_id ON public.finance_stocks USING btree (organ_id);


--
-- Name: index_fund_incomes_on_financial; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_fund_incomes_on_financial ON public.finance_fund_incomes USING btree (financial_type, financial_id);


--
-- Name: index_growth_aim_codes_on_aim_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_aim_codes_on_aim_id ON public.growth_aim_codes USING btree (aim_id);


--
-- Name: index_growth_aim_entities_on_aim_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_aim_entities_on_aim_id ON public.growth_aim_entities USING btree (aim_id);


--
-- Name: index_growth_aim_entities_on_entity_type_and_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_aim_entities_on_entity_type_and_entity_id ON public.growth_aim_entities USING btree (entity_type, entity_id);


--
-- Name: index_growth_aim_entities_on_reward_expense_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_aim_entities_on_reward_expense_id ON public.growth_aim_entities USING btree (reward_expense_id);


--
-- Name: index_growth_aim_entities_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_aim_entities_on_user_id ON public.growth_aim_entities USING btree (user_id);


--
-- Name: index_growth_aim_logs_on_aim_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_aim_logs_on_aim_id ON public.growth_aim_logs USING btree (aim_id);


--
-- Name: index_growth_aim_logs_on_entity_type_and_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_aim_logs_on_entity_type_and_entity_id ON public.growth_aim_logs USING btree (entity_type, entity_id);


--
-- Name: index_growth_aim_logs_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_aim_logs_on_user_id ON public.growth_aim_logs USING btree (user_id);


--
-- Name: index_growth_aim_users_on_aim_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_aim_users_on_aim_id ON public.growth_aim_users USING btree (aim_id);


--
-- Name: index_growth_aim_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_aim_users_on_user_id ON public.growth_aim_users USING btree (user_id);


--
-- Name: index_growth_praise_incomes_on_earner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_praise_incomes_on_earner_id ON public.growth_praise_incomes USING btree (earner_id);


--
-- Name: index_growth_praise_incomes_on_reward_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_praise_incomes_on_reward_id ON public.growth_praise_incomes USING btree (reward_id);


--
-- Name: index_growth_praise_incomes_on_source_type_and_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_praise_incomes_on_source_type_and_source_id ON public.growth_praise_incomes USING btree (source_type, source_id);


--
-- Name: index_growth_praise_incomes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_praise_incomes_on_user_id ON public.growth_praise_incomes USING btree (user_id);


--
-- Name: index_growth_praise_users_on_entity_type_and_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_praise_users_on_entity_type_and_entity_id ON public.growth_praise_users USING btree (entity_type, entity_id);


--
-- Name: index_growth_praise_users_on_reward_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_praise_users_on_reward_id ON public.growth_praise_users USING btree (reward_id);


--
-- Name: index_growth_praise_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_praise_users_on_user_id ON public.growth_praise_users USING btree (user_id);


--
-- Name: index_growth_reward_expenses_on_aim_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_reward_expenses_on_aim_id ON public.growth_reward_expenses USING btree (aim_id);


--
-- Name: index_growth_reward_expenses_on_reward_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_reward_expenses_on_reward_id ON public.growth_reward_expenses USING btree (reward_id);


--
-- Name: index_growth_reward_expenses_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_reward_expenses_on_user_id ON public.growth_reward_expenses USING btree (user_id);


--
-- Name: index_growth_reward_incomes_on_reward_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_reward_incomes_on_reward_id ON public.growth_reward_incomes USING btree (reward_id);


--
-- Name: index_growth_reward_incomes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_reward_incomes_on_user_id ON public.growth_reward_incomes USING btree (user_id);


--
-- Name: index_growth_rewards_on_entity_type_and_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_growth_rewards_on_entity_type_and_entity_id ON public.growth_rewards USING btree (entity_type, entity_id);


--
-- Name: index_interact_abuses_on_abusement_type_and_abusement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interact_abuses_on_abusement_type_and_abusement_id ON public.interact_abuses USING btree (abusement_type, abusement_id);


--
-- Name: index_interact_abuses_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interact_abuses_on_user_id ON public.interact_abuses USING btree (user_id);


--
-- Name: index_interact_attitudes_on_attitudinal_type_and_attitudinal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interact_attitudes_on_attitudinal_type_and_attitudinal_id ON public.interact_attitudes USING btree (attitudinal_type, attitudinal_id);


--
-- Name: index_interact_attitudes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interact_attitudes_on_user_id ON public.interact_attitudes USING btree (user_id);


--
-- Name: index_interact_comments_on_commentable_type_and_commentable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interact_comments_on_commentable_type_and_commentable_id ON public.interact_comments USING btree (commentable_type, commentable_id);


--
-- Name: index_interact_comments_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interact_comments_on_parent_id ON public.interact_comments USING btree (parent_id);


--
-- Name: index_interact_comments_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interact_comments_on_user_id ON public.interact_comments USING btree (user_id);


--
-- Name: index_interact_stars_on_starred_type_and_starred_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interact_stars_on_starred_type_and_starred_id ON public.interact_stars USING btree (starred_type, starred_id);


--
-- Name: index_interact_stars_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_interact_stars_on_user_id ON public.interact_stars USING btree (user_id);


--
-- Name: index_markdown_gits_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_markdown_gits_on_organ_id ON public.markdown_gits USING btree (organ_id);


--
-- Name: index_markdown_posts_on_git_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_markdown_posts_on_git_id ON public.markdown_posts USING btree (git_id);


--
-- Name: index_notice_annunciations_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_annunciations_on_organ_id ON public.notice_annunciations USING btree (organ_id);


--
-- Name: index_notice_annunciations_on_publisher_type_and_publisher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_annunciations_on_publisher_type_and_publisher_id ON public.notice_annunciations USING btree (publisher_type, publisher_id);


--
-- Name: index_notice_member_annunciates_on_annunciation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_member_annunciates_on_annunciation_id ON public.notice_member_annunciates USING btree (annunciation_id);


--
-- Name: index_notice_member_annunciates_on_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_member_annunciates_on_department_id ON public.notice_member_annunciates USING btree (department_id);


--
-- Name: index_notice_member_annunciates_on_job_title_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_member_annunciates_on_job_title_id ON public.notice_member_annunciates USING btree (job_title_id);


--
-- Name: index_notice_notification_sendings_on_notification_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_notification_sendings_on_notification_id ON public.notice_notification_sendings USING btree (notification_id);


--
-- Name: index_notice_notifications_on_linked_type_and_linked_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_notifications_on_linked_type_and_linked_id ON public.notice_notifications USING btree (linked_type, linked_id);


--
-- Name: index_notice_notifications_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_notifications_on_member_id ON public.notice_notifications USING btree (member_id);


--
-- Name: index_notice_notifications_on_notifiable_type_and_notifiable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_notifications_on_notifiable_type_and_notifiable_id ON public.notice_notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: index_notice_notifications_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_notifications_on_organ_id ON public.notice_notifications USING btree (organ_id);


--
-- Name: index_notice_notifications_on_read_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_notifications_on_read_at ON public.notice_notifications USING btree (read_at);


--
-- Name: index_notice_notifications_on_sender_type_and_sender_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_notifications_on_sender_type_and_sender_id ON public.notice_notifications USING btree (sender_type, sender_id);


--
-- Name: index_notice_notifications_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_notifications_on_user_id ON public.notice_notifications USING btree (user_id);


--
-- Name: index_notice_user_annunciates_on_annunciation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_user_annunciates_on_annunciation_id ON public.notice_user_annunciates USING btree (annunciation_id);


--
-- Name: index_notice_user_annunciates_on_user_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notice_user_annunciates_on_user_tag_id ON public.notice_user_annunciates USING btree (user_tag_id);


--
-- Name: index_org_department_grants_on_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_department_grants_on_department_id ON public.org_department_grants USING btree (department_id);


--
-- Name: index_org_department_grants_on_job_title_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_department_grants_on_job_title_id ON public.org_department_grants USING btree (job_title_id);


--
-- Name: index_org_department_grants_on_organ_handle_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_department_grants_on_organ_handle_id ON public.org_department_grants USING btree (organ_handle_id);


--
-- Name: index_org_department_grants_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_department_grants_on_organ_id ON public.org_department_grants USING btree (organ_id);


--
-- Name: index_org_departments_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_departments_on_organ_id ON public.org_departments USING btree (organ_id);


--
-- Name: index_org_departments_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_departments_on_parent_id ON public.org_departments USING btree (parent_id);


--
-- Name: index_org_departments_on_superior_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_departments_on_superior_id ON public.org_departments USING btree (superior_id);


--
-- Name: index_org_job_descriptions_on_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_job_descriptions_on_department_id ON public.org_job_descriptions USING btree (department_id);


--
-- Name: index_org_job_titles_on_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_job_titles_on_department_id ON public.org_job_titles USING btree (department_id);


--
-- Name: index_org_job_titles_on_department_root_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_job_titles_on_department_root_id ON public.org_job_titles USING btree (department_root_id);


--
-- Name: index_org_job_titles_on_super_job_title_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_job_titles_on_super_job_title_id ON public.org_job_titles USING btree (super_job_title_id);


--
-- Name: index_org_job_transfers_on_from_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_job_transfers_on_from_department_id ON public.org_job_transfers USING btree (from_department_id);


--
-- Name: index_org_job_transfers_on_from_job_title_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_job_transfers_on_from_job_title_id ON public.org_job_transfers USING btree (from_job_title_id);


--
-- Name: index_org_job_transfers_on_from_office_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_job_transfers_on_from_office_id ON public.org_job_transfers USING btree (from_office_id);


--
-- Name: index_org_job_transfers_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_job_transfers_on_member_id ON public.org_job_transfers USING btree (member_id);


--
-- Name: index_org_job_transfers_on_to_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_job_transfers_on_to_department_id ON public.org_job_transfers USING btree (to_department_id);


--
-- Name: index_org_job_transfers_on_to_job_title_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_job_transfers_on_to_job_title_id ON public.org_job_transfers USING btree (to_job_title_id);


--
-- Name: index_org_job_transfers_on_to_office_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_job_transfers_on_to_office_id ON public.org_job_transfers USING btree (to_office_id);


--
-- Name: index_org_member_departments_on_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_member_departments_on_department_id ON public.org_member_departments USING btree (department_id);


--
-- Name: index_org_member_departments_on_department_root_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_member_departments_on_department_root_id ON public.org_member_departments USING btree (department_root_id);


--
-- Name: index_org_member_departments_on_job_title_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_member_departments_on_job_title_id ON public.org_member_departments USING btree (job_title_id);


--
-- Name: index_org_member_departments_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_member_departments_on_member_id ON public.org_member_departments USING btree (member_id);


--
-- Name: index_org_member_departments_on_superior_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_member_departments_on_superior_id ON public.org_member_departments USING btree (superior_id);


--
-- Name: index_org_members_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_members_on_organ_id ON public.org_members USING btree (organ_id);


--
-- Name: index_org_members_on_organ_root_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_members_on_organ_root_id ON public.org_members USING btree (organ_root_id);


--
-- Name: index_org_organ_domains_on_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_organ_domains_on_identifier ON public.org_organ_domains USING btree (identifier);


--
-- Name: index_org_organ_domains_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_organ_domains_on_organ_id ON public.org_organ_domains USING btree (organ_id);


--
-- Name: index_org_organs_on_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_organs_on_area_id ON public.org_organs USING btree (area_id);


--
-- Name: index_org_organs_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_organs_on_parent_id ON public.org_organs USING btree (parent_id);


--
-- Name: index_org_resign_references_on_resign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_resign_references_on_resign_id ON public.org_resign_references USING btree (resign_id);


--
-- Name: index_org_resign_references_on_resign_reason_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_resign_references_on_resign_reason_id ON public.org_resign_references USING btree (resign_reason_id);


--
-- Name: index_org_resigns_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_resigns_on_member_id ON public.org_resigns USING btree (member_id);


--
-- Name: index_org_super_job_titles_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_super_job_titles_on_organ_id ON public.org_super_job_titles USING btree (organ_id);


--
-- Name: index_org_supports_on_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_supports_on_department_id ON public.org_supports USING btree (department_id);


--
-- Name: index_org_supports_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_supports_on_member_id ON public.org_supports USING btree (member_id);


--
-- Name: index_org_supports_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_supports_on_organ_id ON public.org_supports USING btree (organ_id);


--
-- Name: index_org_supports_on_supporter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_supports_on_supporter_id ON public.org_supports USING btree (supporter_id);


--
-- Name: index_org_tutorials_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_tutorials_on_member_id ON public.org_tutorials USING btree (member_id);


--
-- Name: index_org_tutorials_on_tutor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_org_tutorials_on_tutor_id ON public.org_tutorials USING btree (tutor_id);


--
-- Name: index_plan_participants_on_event_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_plan_participants_on_event_participant_id ON public.plan_participants USING btree (event_participant_id);


--
-- Name: index_plan_participants_on_participant_type_and_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_plan_participants_on_participant_type_and_participant_id ON public.plan_participants USING btree (participant_type, participant_id);


--
-- Name: index_plan_participants_on_planning_type_and_planning_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_plan_participants_on_planning_type_and_planning_id ON public.plan_participants USING btree (planning_type, planning_id);


--
-- Name: index_profiled_address_organs_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiled_address_organs_on_address_id ON public.profiled_address_organs USING btree (address_id);


--
-- Name: index_profiled_address_organs_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiled_address_organs_on_organ_id ON public.profiled_address_organs USING btree (organ_id);


--
-- Name: index_profiled_address_users_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiled_address_users_on_address_id ON public.profiled_address_users USING btree (address_id);


--
-- Name: index_profiled_address_users_on_inviter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiled_address_users_on_inviter_id ON public.profiled_address_users USING btree (inviter_id);


--
-- Name: index_profiled_address_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiled_address_users_on_user_id ON public.profiled_address_users USING btree (user_id);


--
-- Name: index_profiled_addresses_on_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiled_addresses_on_area_id ON public.profiled_addresses USING btree (area_id);


--
-- Name: index_profiled_areas_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiled_areas_on_parent_id ON public.profiled_areas USING btree (parent_id);


--
-- Name: index_profiled_profiles_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiled_profiles_on_organ_id ON public.profiled_profiles USING btree (organ_id);


--
-- Name: index_project_taxon_facilitates_on_facilitate_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_project_taxon_facilitates_on_facilitate_id ON public.project_taxon_facilitates USING btree (facilitate_id);


--
-- Name: index_project_taxon_facilitates_on_facilitate_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_project_taxon_facilitates_on_facilitate_taxon_id ON public.project_taxon_facilitates USING btree (facilitate_taxon_id);


--
-- Name: index_project_taxon_facilitates_on_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_project_taxon_facilitates_on_taxon_id ON public.project_taxon_facilitates USING btree (taxon_id);


--
-- Name: index_project_taxon_indicators_on_facilitate_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_project_taxon_indicators_on_facilitate_taxon_id ON public.project_taxon_indicators USING btree (facilitate_taxon_id);


--
-- Name: index_project_taxon_indicators_on_indicator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_project_taxon_indicators_on_indicator_id ON public.project_taxon_indicators USING btree (indicator_id);


--
-- Name: index_project_taxon_indicators_on_taxon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_project_taxon_indicators_on_taxon_id ON public.project_taxon_indicators USING btree (taxon_id);


--
-- Name: index_project_taxons_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_project_taxons_on_organ_id ON public.project_taxons USING btree (organ_id);


--
-- Name: index_quip_apps_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_quip_apps_on_organ_id ON public.quip_apps USING btree (organ_id);


--
-- Name: index_quip_apps_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_quip_apps_on_user_id ON public.quip_apps USING btree (user_id);


--
-- Name: index_requirements_on_from_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_requirements_on_from_area_id ON public.requirements USING btree (from_area_id);


--
-- Name: index_requirements_on_to_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_requirements_on_to_area_id ON public.requirements USING btree (to_area_id);


--
-- Name: index_requirements_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_requirements_on_user_id ON public.requirements USING btree (user_id);


--
-- Name: index_requirements_on_volunteer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_requirements_on_volunteer_id ON public.requirements USING btree (volunteer_id);


--
-- Name: index_roled_role_rules_on_meta_action_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_roled_role_rules_on_meta_action_id ON public.roled_role_rules USING btree (meta_action_id);


--
-- Name: index_roled_role_types_on_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_roled_role_types_on_role_id ON public.roled_role_types USING btree (role_id);


--
-- Name: index_roled_who_roles_on_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_roled_who_roles_on_role_id ON public.roled_who_roles USING btree (role_id);


--
-- Name: index_roled_who_roles_on_who_type_and_who_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_roled_who_roles_on_who_type_and_who_id ON public.roled_who_roles USING btree (who_type, who_id);


--
-- Name: index_ship_cars_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_cars_on_user_id ON public.ship_cars USING btree (user_id);


--
-- Name: index_ship_drivers_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_drivers_on_user_id ON public.ship_drivers USING btree (user_id);


--
-- Name: index_ship_favorites_on_driver_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_favorites_on_driver_id ON public.ship_favorites USING btree (driver_id);


--
-- Name: index_ship_favorites_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_favorites_on_user_id ON public.ship_favorites USING btree (user_id);


--
-- Name: index_ship_line_similars_on_line_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_line_similars_on_line_id ON public.ship_line_similars USING btree (line_id);


--
-- Name: index_ship_line_similars_on_similar_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_line_similars_on_similar_id ON public.ship_line_similars USING btree (similar_id);


--
-- Name: index_ship_lines_on_pathway; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_lines_on_pathway ON public.ship_lines USING gist (pathway);


--
-- Name: index_ship_lines_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_lines_on_user_id ON public.ship_lines USING btree (user_id);


--
-- Name: index_ship_locations_on_area_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_locations_on_area_id ON public.ship_locations USING btree (area_id);


--
-- Name: index_ship_locations_on_line_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_locations_on_line_id ON public.ship_locations USING btree (line_id);


--
-- Name: index_ship_packageds_on_package_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_packageds_on_package_id ON public.ship_packageds USING btree (package_id);


--
-- Name: index_ship_packageds_on_trade_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_packageds_on_trade_item_id ON public.ship_packageds USING btree (trade_item_id);


--
-- Name: index_ship_packages_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_packages_on_address_id ON public.ship_packages USING btree (address_id);


--
-- Name: index_ship_packages_on_produce_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_packages_on_produce_plan_id ON public.ship_packages USING btree (produce_plan_id);


--
-- Name: index_ship_packages_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_packages_on_user_id ON public.ship_packages USING btree (user_id);


--
-- Name: index_ship_packages_on_wait_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_packages_on_wait_item_id ON public.ship_packages USING btree (wait_item_id);


--
-- Name: index_ship_shipments_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_shipments_on_address_id ON public.ship_shipments USING btree (address_id);


--
-- Name: index_ship_shipments_on_package_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_shipments_on_package_id ON public.ship_shipments USING btree (package_id);


--
-- Name: index_ship_shipments_on_shipping_type_and_shipping_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ship_shipments_on_shipping_type_and_shipping_id ON public.ship_shipments USING btree (shipping_type, shipping_id);


--
-- Name: index_trade_advances_on_card_template_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_advances_on_card_template_id ON public.trade_advances USING btree (card_template_id);


--
-- Name: index_trade_card_advances_on_advance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_card_advances_on_advance_id ON public.trade_card_advances USING btree (advance_id);


--
-- Name: index_trade_card_advances_on_card_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_card_advances_on_card_id ON public.trade_card_advances USING btree (card_id);


--
-- Name: index_trade_card_advances_on_card_prepayment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_card_advances_on_card_prepayment_id ON public.trade_card_advances USING btree (card_prepayment_id);


--
-- Name: index_trade_card_advances_on_trade_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_card_advances_on_trade_item_id ON public.trade_card_advances USING btree (trade_item_id);


--
-- Name: index_trade_card_logs_on_card_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_card_logs_on_card_id ON public.trade_card_logs USING btree (card_id);


--
-- Name: index_trade_card_logs_on_source_type_and_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_card_logs_on_source_type_and_source_id ON public.trade_card_logs USING btree (source_type, source_id);


--
-- Name: index_trade_card_prepayments_on_card_template_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_card_prepayments_on_card_template_id ON public.trade_card_prepayments USING btree (card_template_id);


--
-- Name: index_trade_card_promotes_on_card_template_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_card_promotes_on_card_template_id ON public.trade_card_promotes USING btree (card_template_id);


--
-- Name: index_trade_card_promotes_on_promote_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_card_promotes_on_promote_id ON public.trade_card_promotes USING btree (promote_id);


--
-- Name: index_trade_card_templates_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_card_templates_on_organ_id ON public.trade_card_templates USING btree (organ_id);


--
-- Name: index_trade_cards_on_agency_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_cards_on_agency_id ON public.trade_cards USING btree (agency_id);


--
-- Name: index_trade_cards_on_card_template_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_cards_on_card_template_id ON public.trade_cards USING btree (card_template_id);


--
-- Name: index_trade_cards_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_cards_on_member_id ON public.trade_cards USING btree (member_id);


--
-- Name: index_trade_cards_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_cards_on_organ_id ON public.trade_cards USING btree (organ_id);


--
-- Name: index_trade_cards_on_trade_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_cards_on_trade_item_id ON public.trade_cards USING btree (trade_item_id);


--
-- Name: index_trade_cards_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_cards_on_user_id ON public.trade_cards USING btree (user_id);


--
-- Name: index_trade_carts_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_carts_on_address_id ON public.trade_carts USING btree (address_id);


--
-- Name: index_trade_carts_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_carts_on_member_id ON public.trade_carts USING btree (member_id);


--
-- Name: index_trade_carts_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_carts_on_organ_id ON public.trade_carts USING btree (organ_id);


--
-- Name: index_trade_carts_on_payment_strategy_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_carts_on_payment_strategy_id ON public.trade_carts USING btree (payment_strategy_id);


--
-- Name: index_trade_carts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_carts_on_user_id ON public.trade_carts USING btree (user_id);


--
-- Name: index_trade_cash_givens_on_cash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_cash_givens_on_cash_id ON public.trade_cash_givens USING btree (cash_id);


--
-- Name: index_trade_cash_givens_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_cash_givens_on_organ_id ON public.trade_cash_givens USING btree (organ_id);


--
-- Name: index_trade_cash_logs_on_cash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_cash_logs_on_cash_id ON public.trade_cash_logs USING btree (cash_id);


--
-- Name: index_trade_cash_logs_on_source_type_and_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_cash_logs_on_source_type_and_source_id ON public.trade_cash_logs USING btree (source_type, source_id);


--
-- Name: index_trade_cash_logs_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_cash_logs_on_user_id ON public.trade_cash_logs USING btree (user_id);


--
-- Name: index_trade_cashes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_cashes_on_user_id ON public.trade_cashes USING btree (user_id);


--
-- Name: index_trade_orders_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_orders_on_address_id ON public.trade_orders USING btree (address_id);


--
-- Name: index_trade_orders_on_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_orders_on_cart_id ON public.trade_orders USING btree (cart_id);


--
-- Name: index_trade_orders_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_orders_on_organ_id ON public.trade_orders USING btree (organ_id);


--
-- Name: index_trade_orders_on_payment_strategy_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_orders_on_payment_strategy_id ON public.trade_orders USING btree (payment_strategy_id);


--
-- Name: index_trade_orders_on_produce_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_orders_on_produce_plan_id ON public.trade_orders USING btree (produce_plan_id);


--
-- Name: index_trade_orders_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_orders_on_user_id ON public.trade_orders USING btree (user_id);


--
-- Name: index_trade_payment_methods_on_creator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_payment_methods_on_creator_id ON public.trade_payment_methods USING btree (creator_id);


--
-- Name: index_trade_payment_orders_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_payment_orders_on_order_id ON public.trade_payment_orders USING btree (order_id);


--
-- Name: index_trade_payment_orders_on_payment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_payment_orders_on_payment_id ON public.trade_payment_orders USING btree (payment_id);


--
-- Name: index_trade_payment_references_on_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_payment_references_on_cart_id ON public.trade_payment_references USING btree (cart_id);


--
-- Name: index_trade_payment_references_on_payment_method_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_payment_references_on_payment_method_id ON public.trade_payment_references USING btree (payment_method_id);


--
-- Name: index_trade_payments_on_card_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_payments_on_card_id ON public.trade_payments USING btree (card_id);


--
-- Name: index_trade_payments_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_payments_on_organ_id ON public.trade_payments USING btree (organ_id);


--
-- Name: index_trade_payments_on_payment_method_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_payments_on_payment_method_id ON public.trade_payments USING btree (payment_method_id);


--
-- Name: index_trade_payouts_on_cash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_payouts_on_cash_id ON public.trade_payouts USING btree (cash_id);


--
-- Name: index_trade_payouts_on_operator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_payouts_on_operator_id ON public.trade_payouts USING btree (operator_id);


--
-- Name: index_trade_payouts_on_payable_type_and_payable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_payouts_on_payable_type_and_payable_id ON public.trade_payouts USING btree (payable_type, payable_id);


--
-- Name: index_trade_promote_carts_on_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_promote_carts_on_cart_id ON public.trade_promote_carts USING btree (cart_id);


--
-- Name: index_trade_promote_carts_on_promote_good_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_promote_carts_on_promote_good_id ON public.trade_promote_carts USING btree (promote_good_id);


--
-- Name: index_trade_promote_carts_on_promote_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_promote_carts_on_promote_id ON public.trade_promote_carts USING btree (promote_id);


--
-- Name: index_trade_promote_charges_on_promote_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_promote_charges_on_promote_id ON public.trade_promote_charges USING btree (promote_id);


--
-- Name: index_trade_promote_extras_on_promote_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_promote_extras_on_promote_id ON public.trade_promote_extras USING btree (promote_id);


--
-- Name: index_trade_promote_goods_on_good_type_and_good_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_promote_goods_on_good_type_and_good_id ON public.trade_promote_goods USING btree (good_type, good_id);


--
-- Name: index_trade_promote_goods_on_promote_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_promote_goods_on_promote_id ON public.trade_promote_goods USING btree (promote_id);


--
-- Name: index_trade_promotes_on_deal_type_and_deal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_promotes_on_deal_type_and_deal_id ON public.trade_promotes USING btree (deal_type, deal_id);


--
-- Name: index_trade_promotes_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_promotes_on_organ_id ON public.trade_promotes USING btree (organ_id);


--
-- Name: index_trade_refunds_on_operator_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_refunds_on_operator_id ON public.trade_refunds USING btree (operator_id);


--
-- Name: index_trade_refunds_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_refunds_on_order_id ON public.trade_refunds USING btree (order_id);


--
-- Name: index_trade_refunds_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_refunds_on_organ_id ON public.trade_refunds USING btree (organ_id);


--
-- Name: index_trade_refunds_on_payment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_refunds_on_payment_id ON public.trade_refunds USING btree (payment_id);


--
-- Name: index_trade_trade_items_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_items_on_address_id ON public.trade_trade_items USING btree (address_id);


--
-- Name: index_trade_trade_items_on_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_items_on_cart_id ON public.trade_trade_items USING btree (cart_id);


--
-- Name: index_trade_trade_items_on_good_type_and_good_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_items_on_good_type_and_good_id ON public.trade_trade_items USING btree (good_type, good_id);


--
-- Name: index_trade_trade_items_on_member_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_items_on_member_id ON public.trade_trade_items USING btree (member_id);


--
-- Name: index_trade_trade_items_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_items_on_order_id ON public.trade_trade_items USING btree (order_id);


--
-- Name: index_trade_trade_items_on_produce_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_items_on_produce_plan_id ON public.trade_trade_items USING btree (produce_plan_id);


--
-- Name: index_trade_trade_items_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_items_on_user_id ON public.trade_trade_items USING btree (user_id);


--
-- Name: index_trade_trade_promotes_on_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_promotes_on_cart_id ON public.trade_trade_promotes USING btree (cart_id);


--
-- Name: index_trade_trade_promotes_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_promotes_on_order_id ON public.trade_trade_promotes USING btree (order_id);


--
-- Name: index_trade_trade_promotes_on_promote_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_promotes_on_promote_cart_id ON public.trade_trade_promotes USING btree (promote_cart_id);


--
-- Name: index_trade_trade_promotes_on_promote_charge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_promotes_on_promote_charge_id ON public.trade_trade_promotes USING btree (promote_charge_id);


--
-- Name: index_trade_trade_promotes_on_promote_good_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_promotes_on_promote_good_id ON public.trade_trade_promotes USING btree (promote_good_id);


--
-- Name: index_trade_trade_promotes_on_promote_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_promotes_on_promote_id ON public.trade_trade_promotes USING btree (promote_id);


--
-- Name: index_trade_trade_promotes_on_trade_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trade_trade_promotes_on_trade_item_id ON public.trade_trade_promotes USING btree (trade_item_id);


--
-- Name: index_user_tags_on_user_tagging; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_tags_on_user_tagging ON public.auth_user_tags USING btree (user_tagging_type, user_tagging_id);


--
-- Name: index_verifications_on_verified; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_verifications_on_verified ON public.auditor_verifications USING btree (verified_type, verified_id);


--
-- Name: index_verifiers_on_verifiable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_verifiers_on_verifiable ON public.auditor_verifiers USING btree (verifiable_type, verifiable_id);


--
-- Name: index_wechat_agencies_on_platform_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_agencies_on_platform_id ON public.wechat_agencies USING btree (platform_id);


--
-- Name: index_wechat_apps_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_apps_on_organ_id ON public.wechat_apps USING btree (organ_id);


--
-- Name: index_wechat_auths_on_platform_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_auths_on_platform_id ON public.wechat_auths USING btree (platform_id);


--
-- Name: index_wechat_auths_on_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_auths_on_request_id ON public.wechat_auths USING btree (request_id);


--
-- Name: index_wechat_extractions_on_extractor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_extractions_on_extractor_id ON public.wechat_extractions USING btree (extractor_id);


--
-- Name: index_wechat_extractions_on_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_extractions_on_request_id ON public.wechat_extractions USING btree (request_id);


--
-- Name: index_wechat_extractors_on_response_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_extractors_on_response_id ON public.wechat_extractors USING btree (response_id);


--
-- Name: index_wechat_hooks_on_hooked; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_hooks_on_hooked ON public.wechat_hooks USING btree (hooked_type, hooked_id);


--
-- Name: index_wechat_hooks_on_response_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_hooks_on_response_id ON public.wechat_hooks USING btree (response_id);


--
-- Name: index_wechat_medias_on_source; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_medias_on_source ON public.wechat_medias USING btree (source_type, source_id);


--
-- Name: index_wechat_medias_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_medias_on_user_id ON public.wechat_medias USING btree (user_id);


--
-- Name: index_wechat_menus_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_menus_on_parent_id ON public.wechat_menus USING btree (parent_id);


--
-- Name: index_wechat_news_reply_items_on_news_reply_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_news_reply_items_on_news_reply_id ON public.wechat_news_reply_items USING btree (news_reply_id);


--
-- Name: index_wechat_notices_on_notification_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_notices_on_notification_id ON public.wechat_notices USING btree (notification_id);


--
-- Name: index_wechat_notices_on_subscribe_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_notices_on_subscribe_id ON public.wechat_notices USING btree (subscribe_id);


--
-- Name: index_wechat_notices_on_template_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_notices_on_template_id ON public.wechat_notices USING btree (template_id);


--
-- Name: index_wechat_receives_on_appid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_receives_on_appid ON public.wechat_receives USING btree (appid);


--
-- Name: index_wechat_receives_on_open_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_receives_on_open_id ON public.wechat_receives USING btree (open_id);


--
-- Name: index_wechat_receives_on_platform_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_receives_on_platform_id ON public.wechat_receives USING btree (platform_id);


--
-- Name: index_wechat_registers_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_registers_on_organ_id ON public.wechat_registers USING btree (organ_id);


--
-- Name: index_wechat_registers_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_registers_on_user_id ON public.wechat_registers USING btree (user_id);


--
-- Name: index_wechat_replies_on_messaging_type_and_messaging_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_replies_on_messaging_type_and_messaging_id ON public.wechat_replies USING btree (messaging_type, messaging_id);


--
-- Name: index_wechat_requests_on_receive_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_requests_on_receive_id ON public.wechat_requests USING btree (receive_id);


--
-- Name: index_wechat_responses_on_reply_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_responses_on_reply_id ON public.wechat_responses USING btree (reply_id);


--
-- Name: index_wechat_scene_menus_on_menu_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_scene_menus_on_menu_id ON public.wechat_scene_menus USING btree (menu_id);


--
-- Name: index_wechat_scene_menus_on_scene_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_scene_menus_on_scene_id ON public.wechat_scene_menus USING btree (scene_id);


--
-- Name: index_wechat_scene_menus_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_scene_menus_on_tag_id ON public.wechat_scene_menus USING btree (tag_id);


--
-- Name: index_wechat_scenes_on_appid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_scenes_on_appid ON public.wechat_scenes USING btree (appid);


--
-- Name: index_wechat_scenes_on_organ_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_scenes_on_organ_id ON public.wechat_scenes USING btree (organ_id);


--
-- Name: index_wechat_services_on_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_services_on_request_id ON public.wechat_services USING btree (request_id);


--
-- Name: index_wechat_subscribes_on_template_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_subscribes_on_template_id ON public.wechat_subscribes USING btree (template_id);


--
-- Name: index_wechat_subscribes_on_wechat_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_subscribes_on_wechat_user_id ON public.wechat_subscribes USING btree (wechat_user_id);


--
-- Name: index_wechat_tags_on_tagging_type_and_tagging_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_tags_on_tagging_type_and_tagging_id ON public.wechat_tags USING btree (tagging_type, tagging_id);


--
-- Name: index_wechat_tags_on_user_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_tags_on_user_tag_id ON public.wechat_tags USING btree (user_tag_id);


--
-- Name: index_wechat_template_key_words_on_template_config_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_template_key_words_on_template_config_id ON public.wechat_template_key_words USING btree (template_config_id);


--
-- Name: index_wechat_templates_on_appid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_templates_on_appid ON public.wechat_templates USING btree (appid);


--
-- Name: index_wechat_templates_on_template_config_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_templates_on_template_config_id ON public.wechat_templates USING btree (template_config_id);


--
-- Name: index_wechat_user_tags_on_user_tagged_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wechat_user_tags_on_user_tagged_id ON public.wechat_user_tags USING btree (user_tagged_id);


--
-- Name: knowledge_anc_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX knowledge_anc_desc_idx ON public.detail_knowledge_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: knowledge_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX knowledge_desc_idx ON public.detail_knowledge_hierarchies USING btree (descendant_id);


--
-- Name: organ_anc_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX organ_anc_desc_idx ON public.org_organ_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: organ_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX organ_desc_idx ON public.org_organ_hierarchies USING btree (descendant_id);


--
-- Name: part_taxon_anc_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX part_taxon_anc_desc_idx ON public.factory_part_taxon_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: part_taxon_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX part_taxon_desc_idx ON public.factory_part_taxon_hierarchies USING btree (descendant_id);


--
-- Name: place_taxon_anc_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX place_taxon_anc_desc_idx ON public.eventual_place_taxon_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: place_taxon_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX place_taxon_desc_idx ON public.eventual_place_taxon_hierarchies USING btree (descendant_id);


--
-- Name: product_taxon_anc_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX product_taxon_anc_desc_idx ON public.factory_product_taxon_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: product_taxon_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX product_taxon_desc_idx ON public.factory_product_taxon_hierarchies USING btree (descendant_id);


--
-- Name: task_anc_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX task_anc_desc_idx ON public.bench_task_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: task_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX task_desc_idx ON public.bench_task_hierarchies USING btree (descendant_id);


--
-- Name: task_template_anc_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX task_template_anc_desc_idx ON public.bench_task_template_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: task_template_desc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX task_template_desc_idx ON public.bench_task_template_hierarchies USING btree (descendant_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20160224154100'),
('20160224154626'),
('20160224155804'),
('20160224160530'),
('20160224161000'),
('20160228160247'),
('20160229014723'),
('20160901065523'),
('20160919093503'),
('20161005064001'),
('20161005065037'),
('20161005070538'),
('20161005071936'),
('20161029153921'),
('20161030034305'),
('20161030092654'),
('20161031070735'),
('20161103102216'),
('20161103104205'),
('20161104025258'),
('20161104062659'),
('20161104064603'),
('20161104082941'),
('20161104091029'),
('20161108025453'),
('20161108054558'),
('20161108153159'),
('20161109100054'),
('20161111161429'),
('20161126072307'),
('20161218071956'),
('20161219132145'),
('20161219134529'),
('20170321123234'),
('20170428035214'),
('20170510081735'),
('20170510084912'),
('20170512081745'),
('20170519101752'),
('20170531115128'),
('20170615140930'),
('20170707074433'),
('20170815112100'),
('20170922121002'),
('20171017104458'),
('20171017104459'),
('20171017104460'),
('20171017104723'),
('20171017105828'),
('20171019124701'),
('20171019133122'),
('20171019135425'),
('20171021161307'),
('20171022041353'),
('20171022115007'),
('20171022115910'),
('20171024100815'),
('20171024121919'),
('20171024134516'),
('20171027123032'),
('20171027123815'),
('20171027131623'),
('20171030121434'),
('20171030134828'),
('20171030141232'),
('20171031115321'),
('20171101103805'),
('20171101112746'),
('20171101114008'),
('20171101121627'),
('20171102123651'),
('20171102132459'),
('20171102141655'),
('20171103115836'),
('20171103140519'),
('20171103141751'),
('20171107105950'),
('20171107114108'),
('20171107120033'),
('20171107131933'),
('20171109134100'),
('20171109152148'),
('20171110131207'),
('20171114111906'),
('20171114115228'),
('20171115114755'),
('20171115120040'),
('20171115144054'),
('20171115144429'),
('20171116115023'),
('20171122113000'),
('20171127130016'),
('20171128105745'),
('20171128110426'),
('20171129105235'),
('20171211233401'),
('20180104112415'),
('20180105115717'),
('20180106082040'),
('20180118113142'),
('20180202091035'),
('20180219115055'),
('20180219120418'),
('20180309151417'),
('20180309155025'),
('20180309155839'),
('20180501082148'),
('20180517070155'),
('20180519084217'),
('20180702141840'),
('20180722081122'),
('20180722084014'),
('20180722084904'),
('20180722142435'),
('20180816163830'),
('20181013164836'),
('20181013165052'),
('20181013173312'),
('20181014131918'),
('20181015141314'),
('20181015145147'),
('20181016143231'),
('20181017155048'),
('20181017155729'),
('20181020011819'),
('20181027033152'),
('20181027152111'),
('20181030151847'),
('20181030155003'),
('20181104122835'),
('20181105142958'),
('20181107154700'),
('20181123161706'),
('20181211152327'),
('20181215054113'),
('20190101092607'),
('20190105152729'),
('20190105160641'),
('20190107153256'),
('20190107154837'),
('20190107163231'),
('20190108150932'),
('20190108163345'),
('20190108171107'),
('20190108171737'),
('20190125160017'),
('20190307063031'),
('20190430044748'),
('20190501085930'),
('20190502095439'),
('20190502131723'),
('20190503014020'),
('20190503093137'),
('20190503101634'),
('20190504023556'),
('20190504030714'),
('20190504070844'),
('20190504074427'),
('20190504141936'),
('20190505074733'),
('20190505115112'),
('20190506010633'),
('20190506010654'),
('20190506012643'),
('20190506013017'),
('20190506103221'),
('20190506111246'),
('20190506133859'),
('20190506135229'),
('20190506144020'),
('20190506154720'),
('20190508115507'),
('20190508150537'),
('20190508154646'),
('20190514112009'),
('20190514114705'),
('20190609014356'),
('20190609024222'),
('20190613152020'),
('20190624121644'),
('20190625045051'),
('20190629043844'),
('20190629073934'),
('20190629075319'),
('20190709142604'),
('20190713061412'),
('20190713130950'),
('20190716115108'),
('20190716153724'),
('20190716154347'),
('20190717155858'),
('20190720110245'),
('20190720130308'),
('20190722142526'),
('20190724153018'),
('20190725165116'),
('20190726141539'),
('20190727140023'),
('20190730115517'),
('20190731070025'),
('20190731134239'),
('20190731153344'),
('20190731154831'),
('20190801021345'),
('20190801021714'),
('20190801062152'),
('20190801085956'),
('20190803145500'),
('20190807123911'),
('20190812141745'),
('20190812153458'),
('20190813084942'),
('20190816034219'),
('20190816152937'),
('20190821024936'),
('20190821034841'),
('20190831060520'),
('20190903131610'),
('20190903133240'),
('20190904031022'),
('20190906132907'),
('20190906150758'),
('20190906153214'),
('20190907015107'),
('20190908091413'),
('20190912140611'),
('20190926102326'),
('20191022134058'),
('20191105131050'),
('20191114110605'),
('20191121124023'),
('20191121133529'),
('20191121133949'),
('20191123154043'),
('20191218142344'),
('20191231125902'),
('20200122121829'),
('20200122171813'),
('20200122172409'),
('20200123062023'),
('20200123112649'),
('20200126085340'),
('20200126095438'),
('20200126101148'),
('20200126122103'),
('20200126131633'),
('20200127082341'),
('20200128045900'),
('20200128064809'),
('20200128103401'),
('20200128120804'),
('20200129121819'),
('20200130033257'),
('20200201045719'),
('20200201134536'),
('20200202054627'),
('20200203162210'),
('20200203162442'),
('20200204153800'),
('20200205200412'),
('20200209035059'),
('20200209050258'),
('20200209172922'),
('20200214173926'),
('20200215045001'),
('20200216165911'),
('20200216170638'),
('20200217021109'),
('20200218162131'),
('20200220140939'),
('20200220163012'),
('20200221162642'),
('20200221164134'),
('20200221170828'),
('20200222131434'),
('20200222160920'),
('20200222175559'),
('20200223145106'),
('20200223164844'),
('20200223172649'),
('20200223173320'),
('20200223181308'),
('20200225091019'),
('20200226043900'),
('20200226051042'),
('20200227135130'),
('20200229154435'),
('20200307171022'),
('20200307173606'),
('20200307174209'),
('20200307180111'),
('20200307182133'),
('20200307192935'),
('20200307194452'),
('20200308165958'),
('20200317173122'),
('20200323083041'),
('20200323091528'),
('20200323101558'),
('20200323112137'),
('20200326081919'),
('20200401152216'),
('20200412140950'),
('20200412151809'),
('20200417123945'),
('20200421162026'),
('20200421170158'),
('20200424150905'),
('20200429164232'),
('20200429165153'),
('20200506155749'),
('20200512132316'),
('20200512142841'),
('20200513125251'),
('20200513160745'),
('20200514082726'),
('20200515104938'),
('20200527044735'),
('20200610054146'),
('20200612150826'),
('20200615111021'),
('20200617025254'),
('20200619162526'),
('20200619164402'),
('20200620084728'),
('20200622154628'),
('20200628105344'),
('20200701075716'),
('20200708094302'),
('20200720065905'),
('20200728100250'),
('20200808090014'),
('20200811104227'),
('20201004124710'),
('20201011144827'),
('20201013141457'),
('20201018125822'),
('20201018142602'),
('20201025035502'),
('20201029124211'),
('20201102123202'),
('20201103121639'),
('20201104123548'),
('20201108045656'),
('20201109182626'),
('20201113104845'),
('20201114064934'),
('20201114080009'),
('20201120074818'),
('20201230093927'),
('20210101032006'),
('20210106084813'),
('20210220142155'),
('20210223094925'),
('20210225140912'),
('20210304135018'),
('20210307121113'),
('20210308022656'),
('20210309051845'),
('20210309160508'),
('20210310145051'),
('20210310145907'),
('20210311005753'),
('20210311010804'),
('20210311012903'),
('20210311023239'),
('20210311034118'),
('20210312044012'),
('20210312055315'),
('20210312060220'),
('20210313111216'),
('20210317103539'),
('20210317131357'),
('20210319082110'),
('20210319103119'),
('20210319123802'),
('20210319134749'),
('20210321133718'),
('20210321135835'),
('20210322055528'),
('20210322061057'),
('20210322121450'),
('20210326011335'),
('20210326075756'),
('20210327022917'),
('20210327030826'),
('20210329102913'),
('20210329152550'),
('20210330152751'),
('20210330155005'),
('20210330155849'),
('20210331003020'),
('20210331015004'),
('20210331124900'),
('20210406133832'),
('20210407054753'),
('20210407091025'),
('20210408030043'),
('20210408030932'),
('20210408091354'),
('20210409012812'),
('20210409014323'),
('20210409074713'),
('20210409171442'),
('20210409180602'),
('20210410042256'),
('20210410105804'),
('20210410130534'),
('20210410165110'),
('20210412123315'),
('20210412130620'),
('20210412162526'),
('20210413114211'),
('20210424054731'),
('20210430041623'),
('20210501062552'),
('20210501135506'),
('20210501151357'),
('20210502011851'),
('20210502091146'),
('20210507072511'),
('20210507074459'),
('20210522120915'),
('20210524153620'),
('20210524153931'),
('20210524155014'),
('20210524155842'),
('20210525153149'),
('20210526122746'),
('20210626030529'),
('20210626030837'),
('20210626051210'),
('20210626083910'),
('20210627035342'),
('20210627153350'),
('20210826170010'),
('20210827170719'),
('20211013031311'),
('20211013120109');


