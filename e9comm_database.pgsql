--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO admin;

--
-- Name: connections; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE connections (
    id integer NOT NULL,
    "Sequence_Number" integer,
    "Client_Key" character varying,
    "Client_Secret" character varying,
    "Portal_Id" character varying,
    "Portal_Password" character varying,
    "Active_Field" character varying,
    "User_Field_String" character varying,
    "User_Field_Integer" integer,
    "User_Field_Datetime" timestamp without time zone,
    "Transaction_Originator" character varying,
    "Transaction_Datetime" timestamp without time zone,
    "Transaction_IP" character varying,
    "User_Updated" character varying,
    "Date_Updated" timestamp without time zone,
    "IP_Updated" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "Ecomm_instance_name" character varying,
    "Access_Token" character varying
);


ALTER TABLE connections OWNER TO admin;

--
-- Name: connections_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE connections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE connections_id_seq OWNER TO admin;

--
-- Name: connections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE connections_id_seq OWNED BY connections.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE friendly_id_slugs OWNER TO admin;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE friendly_id_slugs_id_seq OWNER TO admin;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO admin;

--
-- Name: spree_addresses; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_addresses (
    id integer NOT NULL,
    firstname character varying,
    lastname character varying,
    address1 character varying,
    address2 character varying,
    city character varying,
    zipcode character varying,
    phone character varying,
    state_name character varying,
    alternative_phone character varying,
    company character varying,
    state_id integer,
    country_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    braintree_id character varying
);


ALTER TABLE spree_addresses OWNER TO admin;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_addresses_id_seq OWNER TO admin;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_addresses_id_seq OWNED BY spree_addresses.id;


--
-- Name: spree_adjustments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_adjustments (
    id integer NOT NULL,
    source_type character varying,
    source_id integer,
    adjustable_type character varying,
    adjustable_id integer,
    amount numeric(10,2),
    label character varying,
    mandatory boolean,
    eligible boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying,
    order_id integer NOT NULL,
    included boolean DEFAULT false
);


ALTER TABLE spree_adjustments OWNER TO admin;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_adjustments_id_seq OWNER TO admin;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_adjustments_id_seq OWNED BY spree_adjustments.id;


--
-- Name: spree_assets; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_assets (
    id integer NOT NULL,
    viewable_type character varying,
    viewable_id integer,
    attachment_width integer,
    attachment_height integer,
    attachment_file_size integer,
    "position" integer,
    attachment_content_type character varying,
    attachment_file_name character varying,
    type character varying(75),
    attachment_updated_at timestamp without time zone,
    alt text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE spree_assets OWNER TO admin;

--
-- Name: spree_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_assets_id_seq OWNER TO admin;

--
-- Name: spree_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_assets_id_seq OWNED BY spree_assets.id;


--
-- Name: spree_braintree_checkouts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_braintree_checkouts (
    id integer NOT NULL,
    transaction_id character varying,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    paypal_email character varying,
    advanced_fraud_data character varying,
    risk_id character varying,
    risk_decision character varying,
    braintree_last_digits character varying(4),
    braintree_card_type character varying,
    admin_payment character varying
);


ALTER TABLE spree_braintree_checkouts OWNER TO admin;

--
-- Name: spree_braintree_checkouts_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_braintree_checkouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_braintree_checkouts_id_seq OWNER TO admin;

--
-- Name: spree_braintree_checkouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_braintree_checkouts_id_seq OWNED BY spree_braintree_checkouts.id;


--
-- Name: spree_calculators; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_calculators (
    id integer NOT NULL,
    type character varying,
    calculable_type character varying,
    calculable_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    preferences text,
    deleted_at timestamp without time zone
);


ALTER TABLE spree_calculators OWNER TO admin;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_calculators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_calculators_id_seq OWNER TO admin;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_calculators_id_seq OWNED BY spree_calculators.id;


--
-- Name: spree_cart_events; Type: TABLE; Schema: public; Owner: e9comm
--

CREATE TABLE spree_cart_events (
    id integer NOT NULL,
    actor_type character varying,
    actor_id integer,
    target_type character varying,
    target_id integer,
    activity character varying,
    referrer text,
    quantity integer,
    total numeric(16,4),
    session_id character varying,
    variant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_cart_events OWNER TO e9comm;

--
-- Name: spree_cart_events_id_seq; Type: SEQUENCE; Schema: public; Owner: e9comm
--

CREATE SEQUENCE spree_cart_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_cart_events_id_seq OWNER TO e9comm;

--
-- Name: spree_cart_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e9comm
--

ALTER SEQUENCE spree_cart_events_id_seq OWNED BY spree_cart_events.id;


--
-- Name: spree_checkout_events; Type: TABLE; Schema: public; Owner: e9comm
--

CREATE TABLE spree_checkout_events (
    id integer NOT NULL,
    actor_type character varying,
    actor_id integer,
    target_type character varying,
    target_id integer,
    activity character varying,
    referrer text,
    previous_state character varying,
    next_state character varying,
    session_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_checkout_events OWNER TO e9comm;

--
-- Name: spree_checkout_events_id_seq; Type: SEQUENCE; Schema: public; Owner: e9comm
--

CREATE SEQUENCE spree_checkout_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_checkout_events_id_seq OWNER TO e9comm;

--
-- Name: spree_checkout_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e9comm
--

ALTER SEQUENCE spree_checkout_events_id_seq OWNED BY spree_checkout_events.id;


--
-- Name: spree_countries; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_countries (
    id integer NOT NULL,
    iso_name character varying,
    iso character varying,
    iso3 character varying,
    name character varying,
    numcode integer,
    states_required boolean DEFAULT false,
    updated_at timestamp without time zone,
    zipcode_required boolean DEFAULT true
);


ALTER TABLE spree_countries OWNER TO admin;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_countries_id_seq OWNER TO admin;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_countries_id_seq OWNED BY spree_countries.id;


--
-- Name: spree_credit_cards; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_credit_cards (
    id integer NOT NULL,
    month character varying,
    year character varying,
    cc_type character varying,
    last_digits character varying,
    address_id integer,
    gateway_customer_profile_id character varying,
    gateway_payment_profile_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    user_id integer,
    payment_method_id integer,
    "default" boolean DEFAULT false NOT NULL
);


ALTER TABLE spree_credit_cards OWNER TO admin;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_credit_cards_id_seq OWNER TO admin;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_credit_cards_id_seq OWNED BY spree_credit_cards.id;


--
-- Name: spree_customer_returns; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_customer_returns (
    id integer NOT NULL,
    number character varying,
    stock_location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_customer_returns OWNER TO admin;

--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_customer_returns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_customer_returns_id_seq OWNER TO admin;

--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_customer_returns_id_seq OWNED BY spree_customer_returns.id;


--
-- Name: spree_delivery_slots; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_delivery_slots (
    id integer NOT NULL,
    shipping_method_id integer,
    start_time character varying,
    end_time character varying,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE spree_delivery_slots OWNER TO admin;

--
-- Name: spree_delivery_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_delivery_slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_delivery_slots_id_seq OWNER TO admin;

--
-- Name: spree_delivery_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_delivery_slots_id_seq OWNED BY spree_delivery_slots.id;


--
-- Name: spree_gateways; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_gateways (
    id integer NOT NULL,
    type character varying,
    name character varying,
    description text,
    active boolean DEFAULT true,
    environment character varying DEFAULT 'development'::character varying,
    server character varying DEFAULT 'test'::character varying,
    test_mode boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    preferences text
);


ALTER TABLE spree_gateways OWNER TO admin;

--
-- Name: spree_gateways_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_gateways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_gateways_id_seq OWNER TO admin;

--
-- Name: spree_gateways_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_gateways_id_seq OWNED BY spree_gateways.id;


--
-- Name: spree_inventory_units; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_inventory_units (
    id integer NOT NULL,
    state character varying,
    variant_id integer,
    order_id integer,
    shipment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pending boolean DEFAULT true,
    line_item_id integer
);


ALTER TABLE spree_inventory_units OWNER TO admin;

--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_inventory_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_inventory_units_id_seq OWNER TO admin;

--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_inventory_units_id_seq OWNED BY spree_inventory_units.id;


--
-- Name: spree_line_items; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_line_items (
    id integer NOT NULL,
    variant_id integer,
    order_id integer,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    currency character varying,
    cost_price numeric(10,2),
    tax_category_id integer,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL,
    taxable_adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    non_taxable_adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL
);


ALTER TABLE spree_line_items OWNER TO admin;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_line_items_id_seq OWNER TO admin;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_line_items_id_seq OWNED BY spree_line_items.id;


--
-- Name: spree_log_entries; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_log_entries (
    id integer NOT NULL,
    source_type character varying,
    source_id integer,
    details text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_log_entries OWNER TO admin;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_log_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_log_entries_id_seq OWNER TO admin;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_log_entries_id_seq OWNED BY spree_log_entries.id;


--
-- Name: spree_loyalty_points_transactions; Type: TABLE; Schema: public; Owner: e9comm
--

CREATE TABLE spree_loyalty_points_transactions (
    id integer NOT NULL,
    loyalty_points integer,
    type character varying,
    user_id integer NOT NULL,
    source_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    source_type character varying,
    balance integer DEFAULT 0 NOT NULL,
    comment character varying,
    transaction_id character varying
);


ALTER TABLE spree_loyalty_points_transactions OWNER TO e9comm;

--
-- Name: spree_loyalty_points_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: e9comm
--

CREATE SEQUENCE spree_loyalty_points_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_loyalty_points_transactions_id_seq OWNER TO e9comm;

--
-- Name: spree_loyalty_points_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e9comm
--

ALTER SEQUENCE spree_loyalty_points_transactions_id_seq OWNED BY spree_loyalty_points_transactions.id;


--
-- Name: spree_marketing_campaigns; Type: TABLE; Schema: public; Owner: e9comm
--

CREATE TABLE spree_marketing_campaigns (
    id integer NOT NULL,
    uid character varying NOT NULL,
    mailchimp_type character varying,
    name character varying,
    stats text,
    list_id integer,
    scheduled_at timestamp without time zone
);


ALTER TABLE spree_marketing_campaigns OWNER TO e9comm;

--
-- Name: spree_marketing_campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: e9comm
--

CREATE SEQUENCE spree_marketing_campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_marketing_campaigns_id_seq OWNER TO e9comm;

--
-- Name: spree_marketing_campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e9comm
--

ALTER SEQUENCE spree_marketing_campaigns_id_seq OWNED BY spree_marketing_campaigns.id;


--
-- Name: spree_marketing_contacts; Type: TABLE; Schema: public; Owner: e9comm
--

CREATE TABLE spree_marketing_contacts (
    id integer NOT NULL,
    mailchimp_id character varying,
    uid character varying NOT NULL,
    email character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer
);


ALTER TABLE spree_marketing_contacts OWNER TO e9comm;

--
-- Name: spree_marketing_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: e9comm
--

CREATE SEQUENCE spree_marketing_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_marketing_contacts_id_seq OWNER TO e9comm;

--
-- Name: spree_marketing_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e9comm
--

ALTER SEQUENCE spree_marketing_contacts_id_seq OWNED BY spree_marketing_contacts.id;


--
-- Name: spree_marketing_contacts_lists; Type: TABLE; Schema: public; Owner: e9comm
--

CREATE TABLE spree_marketing_contacts_lists (
    id integer NOT NULL,
    contact_id integer,
    list_id integer,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE spree_marketing_contacts_lists OWNER TO e9comm;

--
-- Name: spree_marketing_contacts_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: e9comm
--

CREATE SEQUENCE spree_marketing_contacts_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_marketing_contacts_lists_id_seq OWNER TO e9comm;

--
-- Name: spree_marketing_contacts_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e9comm
--

ALTER SEQUENCE spree_marketing_contacts_lists_id_seq OWNED BY spree_marketing_contacts_lists.id;


--
-- Name: spree_marketing_lists; Type: TABLE; Schema: public; Owner: e9comm
--

CREATE TABLE spree_marketing_lists (
    id integer NOT NULL,
    uid character varying NOT NULL,
    name character varying,
    active boolean DEFAULT true NOT NULL,
    type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    entity_type character varying,
    entity_id integer,
    searched_keyword character varying,
    deleted_at timestamp without time zone
);


ALTER TABLE spree_marketing_lists OWNER TO e9comm;

--
-- Name: spree_marketing_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: e9comm
--

CREATE SEQUENCE spree_marketing_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_marketing_lists_id_seq OWNER TO e9comm;

--
-- Name: spree_marketing_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e9comm
--

ALTER SEQUENCE spree_marketing_lists_id_seq OWNED BY spree_marketing_lists.id;


--
-- Name: spree_marketing_recipients; Type: TABLE; Schema: public; Owner: e9comm
--

CREATE TABLE spree_marketing_recipients (
    id integer NOT NULL,
    campaign_id integer,
    contact_id integer,
    email_opened_at timestamp without time zone
);


ALTER TABLE spree_marketing_recipients OWNER TO e9comm;

--
-- Name: spree_marketing_recipients_id_seq; Type: SEQUENCE; Schema: public; Owner: e9comm
--

CREATE SEQUENCE spree_marketing_recipients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_marketing_recipients_id_seq OWNER TO e9comm;

--
-- Name: spree_marketing_recipients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e9comm
--

ALTER SEQUENCE spree_marketing_recipients_id_seq OWNED BY spree_marketing_recipients.id;


--
-- Name: spree_option_type_prototypes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_option_type_prototypes (
    id integer NOT NULL,
    prototype_id integer,
    option_type_id integer
);


ALTER TABLE spree_option_type_prototypes OWNER TO admin;

--
-- Name: spree_option_type_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_option_type_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_option_type_prototypes_id_seq OWNER TO admin;

--
-- Name: spree_option_type_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_option_type_prototypes_id_seq OWNED BY spree_option_type_prototypes.id;


--
-- Name: spree_option_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_option_types (
    id integer NOT NULL,
    name character varying(100),
    presentation character varying(100),
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_option_types OWNER TO admin;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_option_types_id_seq OWNER TO admin;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_option_types_id_seq OWNED BY spree_option_types.id;


--
-- Name: spree_option_value_variants; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_option_value_variants (
    id integer NOT NULL,
    variant_id integer,
    option_value_id integer
);


ALTER TABLE spree_option_value_variants OWNER TO admin;

--
-- Name: spree_option_value_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_option_value_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_option_value_variants_id_seq OWNER TO admin;

--
-- Name: spree_option_value_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_option_value_variants_id_seq OWNED BY spree_option_value_variants.id;


--
-- Name: spree_option_values; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_option_values (
    id integer NOT NULL,
    "position" integer,
    name character varying,
    presentation character varying,
    option_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_option_values OWNER TO admin;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_option_values_id_seq OWNER TO admin;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_option_values_id_seq OWNED BY spree_option_values.id;


--
-- Name: spree_order_promotions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_order_promotions (
    id integer NOT NULL,
    order_id integer,
    promotion_id integer
);


ALTER TABLE spree_order_promotions OWNER TO admin;

--
-- Name: spree_order_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_order_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_order_promotions_id_seq OWNER TO admin;

--
-- Name: spree_order_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_order_promotions_id_seq OWNED BY spree_order_promotions.id;


--
-- Name: spree_orders; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_orders (
    id integer NOT NULL,
    number character varying(32),
    item_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    total numeric(10,2) DEFAULT 0.0 NOT NULL,
    state character varying,
    adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    user_id integer,
    completed_at timestamp without time zone,
    bill_address_id integer,
    ship_address_id integer,
    payment_total numeric(10,2) DEFAULT 0.0,
    shipment_state character varying,
    payment_state character varying,
    email character varying,
    special_instructions text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    currency character varying,
    last_ip_address character varying,
    created_by_id integer,
    shipment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    channel character varying DEFAULT 'spree'::character varying,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    item_count integer DEFAULT 0,
    approver_id integer,
    approved_at timestamp without time zone,
    confirmation_delivered boolean DEFAULT false,
    considered_risky boolean DEFAULT false,
    guest_token character varying,
    canceled_at timestamp without time zone,
    canceler_id integer,
    store_id integer,
    state_lock_version integer DEFAULT 0 NOT NULL,
    taxable_adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    non_taxable_adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    paid_at timestamp without time zone
);


ALTER TABLE spree_orders OWNER TO admin;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_orders_id_seq OWNER TO admin;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_orders_id_seq OWNED BY spree_orders.id;


--
-- Name: spree_page_events; Type: TABLE; Schema: public; Owner: e9comm
--

CREATE TABLE spree_page_events (
    id integer NOT NULL,
    actor_type character varying,
    actor_id integer,
    target_type character varying,
    target_id integer,
    activity character varying,
    referrer text,
    search_keywords character varying,
    session_id character varying,
    query_string text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_page_events OWNER TO e9comm;

--
-- Name: spree_page_events_id_seq; Type: SEQUENCE; Schema: public; Owner: e9comm
--

CREATE SEQUENCE spree_page_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_page_events_id_seq OWNER TO e9comm;

--
-- Name: spree_page_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: e9comm
--

ALTER SEQUENCE spree_page_events_id_seq OWNED BY spree_page_events.id;


--
-- Name: spree_payment_capture_events; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_payment_capture_events (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0,
    payment_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_payment_capture_events OWNER TO admin;

--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_payment_capture_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_payment_capture_events_id_seq OWNER TO admin;

--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_payment_capture_events_id_seq OWNED BY spree_payment_capture_events.id;


--
-- Name: spree_payment_methods; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_payment_methods (
    id integer NOT NULL,
    type character varying,
    name character varying,
    description text,
    active boolean DEFAULT true,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    display_on character varying DEFAULT 'both'::character varying,
    auto_capture boolean,
    preferences text,
    "position" integer DEFAULT 0
);


ALTER TABLE spree_payment_methods OWNER TO admin;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_payment_methods_id_seq OWNER TO admin;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_payment_methods_id_seq OWNED BY spree_payment_methods.id;


--
-- Name: spree_payments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_payments (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    order_id integer,
    source_type character varying,
    source_id integer,
    payment_method_id integer,
    state character varying,
    response_code character varying,
    avs_response character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number character varying,
    cvv_response_code character varying,
    cvv_response_message character varying,
    braintree_token character varying,
    braintree_nonce character varying
);


ALTER TABLE spree_payments OWNER TO admin;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_payments_id_seq OWNER TO admin;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_payments_id_seq OWNED BY spree_payments.id;


--
-- Name: spree_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_permissions (
    id integer NOT NULL,
    title character varying NOT NULL,
    priority integer DEFAULT 0,
    visible boolean DEFAULT true,
    "boolean" boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE spree_permissions OWNER TO admin;

--
-- Name: spree_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_permissions_id_seq OWNER TO admin;

--
-- Name: spree_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_permissions_id_seq OWNED BY spree_permissions.id;


--
-- Name: spree_preferences; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_preferences (
    id integer NOT NULL,
    value text,
    key character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_preferences OWNER TO admin;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_preferences_id_seq OWNER TO admin;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_preferences_id_seq OWNED BY spree_preferences.id;


--
-- Name: spree_prices; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_prices (
    id integer NOT NULL,
    variant_id integer NOT NULL,
    amount numeric(10,2),
    currency character varying,
    deleted_at timestamp without time zone
);


ALTER TABLE spree_prices OWNER TO admin;

--
-- Name: spree_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_prices_id_seq OWNER TO admin;

--
-- Name: spree_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_prices_id_seq OWNED BY spree_prices.id;


--
-- Name: spree_product_option_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_product_option_types (
    id integer NOT NULL,
    "position" integer,
    product_id integer,
    option_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_product_option_types OWNER TO admin;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_product_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_product_option_types_id_seq OWNER TO admin;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_product_option_types_id_seq OWNED BY spree_product_option_types.id;


--
-- Name: spree_product_packages; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_product_packages (
    id integer NOT NULL,
    product_id integer NOT NULL,
    length integer DEFAULT 0 NOT NULL,
    width integer DEFAULT 0 NOT NULL,
    height integer DEFAULT 0 NOT NULL,
    weight integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE spree_product_packages OWNER TO admin;

--
-- Name: spree_product_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_product_packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_product_packages_id_seq OWNER TO admin;

--
-- Name: spree_product_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_product_packages_id_seq OWNED BY spree_product_packages.id;


--
-- Name: spree_product_promotion_rules; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_product_promotion_rules (
    id integer NOT NULL,
    product_id integer,
    promotion_rule_id integer
);


ALTER TABLE spree_product_promotion_rules OWNER TO admin;

--
-- Name: spree_product_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_product_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_product_promotion_rules_id_seq OWNER TO admin;

--
-- Name: spree_product_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_product_promotion_rules_id_seq OWNED BY spree_product_promotion_rules.id;


--
-- Name: spree_product_properties; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_product_properties (
    id integer NOT NULL,
    value character varying,
    product_id integer,
    property_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0
);


ALTER TABLE spree_product_properties OWNER TO admin;

--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_product_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_product_properties_id_seq OWNER TO admin;

--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_product_properties_id_seq OWNED BY spree_product_properties.id;


--
-- Name: spree_products; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_products (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    available_on timestamp without time zone,
    deleted_at timestamp without time zone,
    slug character varying,
    meta_description text,
    meta_keywords character varying,
    tax_category_id integer,
    shipping_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    promotionable boolean DEFAULT true,
    meta_title character varying,
    discontinue_on timestamp without time zone
);


ALTER TABLE spree_products OWNER TO admin;

--
-- Name: spree_products_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_products_id_seq OWNER TO admin;

--
-- Name: spree_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_products_id_seq OWNED BY spree_products.id;


--
-- Name: spree_products_taxons; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_products_taxons (
    id integer NOT NULL,
    product_id integer,
    taxon_id integer,
    "position" integer
);


ALTER TABLE spree_products_taxons OWNER TO admin;

--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_products_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_products_taxons_id_seq OWNER TO admin;

--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_products_taxons_id_seq OWNED BY spree_products_taxons.id;


--
-- Name: spree_promotion_action_line_items; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_promotion_action_line_items (
    id integer NOT NULL,
    promotion_action_id integer,
    variant_id integer,
    quantity integer DEFAULT 1
);


ALTER TABLE spree_promotion_action_line_items OWNER TO admin;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_promotion_action_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotion_action_line_items_id_seq OWNER TO admin;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_promotion_action_line_items_id_seq OWNED BY spree_promotion_action_line_items.id;


--
-- Name: spree_promotion_actions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_promotion_actions (
    id integer NOT NULL,
    promotion_id integer,
    "position" integer,
    type character varying,
    deleted_at timestamp without time zone
);


ALTER TABLE spree_promotion_actions OWNER TO admin;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_promotion_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotion_actions_id_seq OWNER TO admin;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_promotion_actions_id_seq OWNED BY spree_promotion_actions.id;


--
-- Name: spree_promotion_categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_promotion_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying
);


ALTER TABLE spree_promotion_categories OWNER TO admin;

--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_promotion_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotion_categories_id_seq OWNER TO admin;

--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_promotion_categories_id_seq OWNED BY spree_promotion_categories.id;


--
-- Name: spree_promotion_rule_taxons; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_promotion_rule_taxons (
    id integer NOT NULL,
    taxon_id integer,
    promotion_rule_id integer
);


ALTER TABLE spree_promotion_rule_taxons OWNER TO admin;

--
-- Name: spree_promotion_rule_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_promotion_rule_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotion_rule_taxons_id_seq OWNER TO admin;

--
-- Name: spree_promotion_rule_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_promotion_rule_taxons_id_seq OWNED BY spree_promotion_rule_taxons.id;


--
-- Name: spree_promotion_rule_users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_promotion_rule_users (
    id integer NOT NULL,
    user_id integer,
    promotion_rule_id integer
);


ALTER TABLE spree_promotion_rule_users OWNER TO admin;

--
-- Name: spree_promotion_rule_users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_promotion_rule_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotion_rule_users_id_seq OWNER TO admin;

--
-- Name: spree_promotion_rule_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_promotion_rule_users_id_seq OWNED BY spree_promotion_rule_users.id;


--
-- Name: spree_promotion_rules; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_promotion_rules (
    id integer NOT NULL,
    promotion_id integer,
    user_id integer,
    product_group_id integer,
    type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying,
    preferences text
);


ALTER TABLE spree_promotion_rules OWNER TO admin;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotion_rules_id_seq OWNER TO admin;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_promotion_rules_id_seq OWNED BY spree_promotion_rules.id;


--
-- Name: spree_promotions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_promotions (
    id integer NOT NULL,
    description character varying,
    expires_at timestamp without time zone,
    starts_at timestamp without time zone,
    name character varying,
    type character varying,
    usage_limit integer,
    match_policy character varying DEFAULT 'all'::character varying,
    code character varying,
    advertise boolean DEFAULT false,
    path character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    promotion_category_id integer
);


ALTER TABLE spree_promotions OWNER TO admin;

--
-- Name: spree_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_promotions_id_seq OWNER TO admin;

--
-- Name: spree_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_promotions_id_seq OWNED BY spree_promotions.id;


--
-- Name: spree_properties; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_properties (
    id integer NOT NULL,
    name character varying,
    presentation character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_properties OWNER TO admin;

--
-- Name: spree_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_properties_id_seq OWNER TO admin;

--
-- Name: spree_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_properties_id_seq OWNED BY spree_properties.id;


--
-- Name: spree_property_prototypes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_property_prototypes (
    id integer NOT NULL,
    prototype_id integer,
    property_id integer
);


ALTER TABLE spree_property_prototypes OWNER TO admin;

--
-- Name: spree_property_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_property_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_property_prototypes_id_seq OWNER TO admin;

--
-- Name: spree_property_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_property_prototypes_id_seq OWNED BY spree_property_prototypes.id;


--
-- Name: spree_prototype_taxons; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_prototype_taxons (
    id integer NOT NULL,
    taxon_id integer,
    prototype_id integer
);


ALTER TABLE spree_prototype_taxons OWNER TO admin;

--
-- Name: spree_prototype_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_prototype_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_prototype_taxons_id_seq OWNER TO admin;

--
-- Name: spree_prototype_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_prototype_taxons_id_seq OWNED BY spree_prototype_taxons.id;


--
-- Name: spree_prototypes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_prototypes (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_prototypes OWNER TO admin;

--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_prototypes_id_seq OWNER TO admin;

--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_prototypes_id_seq OWNED BY spree_prototypes.id;


--
-- Name: spree_refund_reasons; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_refund_reasons (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_refund_reasons OWNER TO admin;

--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_refund_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_refund_reasons_id_seq OWNER TO admin;

--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_refund_reasons_id_seq OWNED BY spree_refund_reasons.id;


--
-- Name: spree_refunds; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_refunds (
    id integer NOT NULL,
    payment_id integer,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    transaction_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    refund_reason_id integer,
    reimbursement_id integer
);


ALTER TABLE spree_refunds OWNER TO admin;

--
-- Name: spree_refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_refunds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_refunds_id_seq OWNER TO admin;

--
-- Name: spree_refunds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_refunds_id_seq OWNED BY spree_refunds.id;


--
-- Name: spree_reimbursement_credits; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_reimbursement_credits (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    reimbursement_id integer,
    creditable_id integer,
    creditable_type character varying
);


ALTER TABLE spree_reimbursement_credits OWNER TO admin;

--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_reimbursement_credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_reimbursement_credits_id_seq OWNER TO admin;

--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_reimbursement_credits_id_seq OWNED BY spree_reimbursement_credits.id;


--
-- Name: spree_reimbursement_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_reimbursement_types (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying
);


ALTER TABLE spree_reimbursement_types OWNER TO admin;

--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_reimbursement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_reimbursement_types_id_seq OWNER TO admin;

--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_reimbursement_types_id_seq OWNED BY spree_reimbursement_types.id;


--
-- Name: spree_reimbursements; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_reimbursements (
    id integer NOT NULL,
    number character varying,
    reimbursement_status character varying,
    customer_return_id integer,
    order_id integer,
    total numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_reimbursements OWNER TO admin;

--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_reimbursements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_reimbursements_id_seq OWNER TO admin;

--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_reimbursements_id_seq OWNED BY spree_reimbursements.id;


--
-- Name: spree_return_authorization_reasons; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_return_authorization_reasons (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_return_authorization_reasons OWNER TO admin;

--
-- Name: spree_return_authorization_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_return_authorization_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_return_authorization_reasons_id_seq OWNER TO admin;

--
-- Name: spree_return_authorization_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_return_authorization_reasons_id_seq OWNED BY spree_return_authorization_reasons.id;


--
-- Name: spree_return_authorizations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_return_authorizations (
    id integer NOT NULL,
    number character varying,
    state character varying,
    order_id integer,
    memo text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    stock_location_id integer,
    return_authorization_reason_id integer,
    loyalty_points integer DEFAULT 0 NOT NULL,
    loyalty_points_transaction_type character varying
);


ALTER TABLE spree_return_authorizations OWNER TO admin;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_return_authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_return_authorizations_id_seq OWNER TO admin;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_return_authorizations_id_seq OWNED BY spree_return_authorizations.id;


--
-- Name: spree_return_items; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_return_items (
    id integer NOT NULL,
    return_authorization_id integer,
    inventory_unit_id integer,
    exchange_variant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL,
    included_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    additional_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    reception_status character varying,
    acceptance_status character varying,
    customer_return_id integer,
    reimbursement_id integer,
    exchange_inventory_unit_id integer,
    acceptance_status_errors text,
    preferred_reimbursement_type_id integer,
    override_reimbursement_type_id integer,
    resellable boolean DEFAULT true NOT NULL
);


ALTER TABLE spree_return_items OWNER TO admin;

--
-- Name: spree_return_items_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_return_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_return_items_id_seq OWNER TO admin;

--
-- Name: spree_return_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_return_items_id_seq OWNED BY spree_return_items.id;


--
-- Name: spree_roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_roles (
    id integer NOT NULL,
    name character varying,
    editable boolean DEFAULT true,
    is_default boolean DEFAULT false
);


ALTER TABLE spree_roles OWNER TO admin;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_roles_id_seq OWNER TO admin;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_roles_id_seq OWNED BY spree_roles.id;


--
-- Name: spree_roles_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_roles_permissions (
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE spree_roles_permissions OWNER TO admin;

--
-- Name: spree_roles_users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_roles_users (
    id integer NOT NULL,
    role_id integer,
    user_id integer
);


ALTER TABLE spree_roles_users OWNER TO admin;

--
-- Name: spree_roles_users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_roles_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_roles_users_id_seq OWNER TO admin;

--
-- Name: spree_roles_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_roles_users_id_seq OWNED BY spree_roles_users.id;


--
-- Name: spree_shipments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_shipments (
    id integer NOT NULL,
    tracking character varying,
    number character varying,
    cost numeric(10,2) DEFAULT 0.0,
    shipped_at timestamp without time zone,
    order_id integer,
    address_id integer,
    state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stock_location_id integer,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL,
    taxable_adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    non_taxable_adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    delivery_slot_id integer
);


ALTER TABLE spree_shipments OWNER TO admin;

--
-- Name: spree_shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_shipments_id_seq OWNER TO admin;

--
-- Name: spree_shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_shipments_id_seq OWNED BY spree_shipments.id;


--
-- Name: spree_shipping_categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_shipping_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_shipping_categories OWNER TO admin;

--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_shipping_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_shipping_categories_id_seq OWNER TO admin;

--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_shipping_categories_id_seq OWNED BY spree_shipping_categories.id;


--
-- Name: spree_shipping_method_categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_shipping_method_categories (
    id integer NOT NULL,
    shipping_method_id integer NOT NULL,
    shipping_category_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_shipping_method_categories OWNER TO admin;

--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_shipping_method_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_shipping_method_categories_id_seq OWNER TO admin;

--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_shipping_method_categories_id_seq OWNED BY spree_shipping_method_categories.id;


--
-- Name: spree_shipping_method_zones; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_shipping_method_zones (
    id integer NOT NULL,
    shipping_method_id integer,
    zone_id integer
);


ALTER TABLE spree_shipping_method_zones OWNER TO admin;

--
-- Name: spree_shipping_method_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_shipping_method_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_shipping_method_zones_id_seq OWNER TO admin;

--
-- Name: spree_shipping_method_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_shipping_method_zones_id_seq OWNED BY spree_shipping_method_zones.id;


--
-- Name: spree_shipping_methods; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_shipping_methods (
    id integer NOT NULL,
    name character varying,
    display_on character varying,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tracking_url character varying,
    admin_name character varying,
    tax_category_id integer,
    code character varying,
    is_delivery_slots_enabled boolean DEFAULT false NOT NULL
);


ALTER TABLE spree_shipping_methods OWNER TO admin;

--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_shipping_methods_id_seq OWNER TO admin;

--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_shipping_methods_id_seq OWNED BY spree_shipping_methods.id;


--
-- Name: spree_shipping_rates; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_shipping_rates (
    id integer NOT NULL,
    shipment_id integer,
    shipping_method_id integer,
    selected boolean DEFAULT false,
    cost numeric(8,2) DEFAULT 0.0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tax_rate_id integer
);


ALTER TABLE spree_shipping_rates OWNER TO admin;

--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_shipping_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_shipping_rates_id_seq OWNER TO admin;

--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_shipping_rates_id_seq OWNED BY spree_shipping_rates.id;


--
-- Name: spree_state_changes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_state_changes (
    id integer NOT NULL,
    name character varying,
    previous_state character varying,
    stateful_id integer,
    user_id integer,
    stateful_type character varying,
    next_state character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_state_changes OWNER TO admin;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_state_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_state_changes_id_seq OWNER TO admin;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_state_changes_id_seq OWNED BY spree_state_changes.id;


--
-- Name: spree_states; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_states (
    id integer NOT NULL,
    name character varying,
    abbr character varying,
    country_id integer,
    updated_at timestamp without time zone
);


ALTER TABLE spree_states OWNER TO admin;

--
-- Name: spree_states_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_states_id_seq OWNER TO admin;

--
-- Name: spree_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_states_id_seq OWNED BY spree_states.id;


--
-- Name: spree_stock_items; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_stock_items (
    id integer NOT NULL,
    stock_location_id integer,
    variant_id integer,
    count_on_hand integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    backorderable boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE spree_stock_items OWNER TO admin;

--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_stock_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_stock_items_id_seq OWNER TO admin;

--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_stock_items_id_seq OWNED BY spree_stock_items.id;


--
-- Name: spree_stock_locations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_stock_locations (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    address1 character varying,
    address2 character varying,
    city character varying,
    state_id integer,
    state_name character varying,
    country_id integer,
    zipcode character varying,
    phone character varying,
    active boolean DEFAULT true,
    backorderable_default boolean DEFAULT false,
    propagate_all_variants boolean DEFAULT true,
    admin_name character varying
);


ALTER TABLE spree_stock_locations OWNER TO admin;

--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_stock_locations_id_seq OWNER TO admin;

--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_stock_locations_id_seq OWNED BY spree_stock_locations.id;


--
-- Name: spree_stock_movements; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_stock_movements (
    id integer NOT NULL,
    stock_item_id integer,
    quantity integer DEFAULT 0,
    action character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    originator_type character varying,
    originator_id integer
);


ALTER TABLE spree_stock_movements OWNER TO admin;

--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_stock_movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_stock_movements_id_seq OWNER TO admin;

--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_stock_movements_id_seq OWNED BY spree_stock_movements.id;


--
-- Name: spree_stock_transfers; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_stock_transfers (
    id integer NOT NULL,
    type character varying,
    reference character varying,
    source_location_id integer,
    destination_location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    number character varying
);


ALTER TABLE spree_stock_transfers OWNER TO admin;

--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_stock_transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_stock_transfers_id_seq OWNER TO admin;

--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_stock_transfers_id_seq OWNED BY spree_stock_transfers.id;


--
-- Name: spree_store_credit_categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_store_credit_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_store_credit_categories OWNER TO admin;

--
-- Name: spree_store_credit_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_store_credit_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_store_credit_categories_id_seq OWNER TO admin;

--
-- Name: spree_store_credit_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_store_credit_categories_id_seq OWNED BY spree_store_credit_categories.id;


--
-- Name: spree_store_credit_events; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_store_credit_events (
    id integer NOT NULL,
    store_credit_id integer NOT NULL,
    action character varying NOT NULL,
    amount numeric(8,2),
    authorization_code character varying NOT NULL,
    user_total_amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    originator_id integer,
    originator_type character varying,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_store_credit_events OWNER TO admin;

--
-- Name: spree_store_credit_events_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_store_credit_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_store_credit_events_id_seq OWNER TO admin;

--
-- Name: spree_store_credit_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_store_credit_events_id_seq OWNED BY spree_store_credit_events.id;


--
-- Name: spree_store_credit_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_store_credit_types (
    id integer NOT NULL,
    name character varying,
    priority integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_store_credit_types OWNER TO admin;

--
-- Name: spree_store_credit_types_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_store_credit_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_store_credit_types_id_seq OWNER TO admin;

--
-- Name: spree_store_credit_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_store_credit_types_id_seq OWNED BY spree_store_credit_types.id;


--
-- Name: spree_store_credits; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_store_credits (
    id integer NOT NULL,
    user_id integer,
    category_id integer,
    created_by_id integer,
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    amount_used numeric(8,2) DEFAULT 0.0 NOT NULL,
    memo text,
    deleted_at timestamp without time zone,
    currency character varying,
    amount_authorized numeric(8,2) DEFAULT 0.0 NOT NULL,
    originator_id integer,
    originator_type character varying,
    type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_store_credits OWNER TO admin;

--
-- Name: spree_store_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_store_credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_store_credits_id_seq OWNER TO admin;

--
-- Name: spree_store_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_store_credits_id_seq OWNED BY spree_store_credits.id;


--
-- Name: spree_stores; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_stores (
    id integer NOT NULL,
    name character varying,
    url character varying,
    meta_description text,
    meta_keywords text,
    seo_title character varying,
    mail_from_address character varying,
    default_currency character varying,
    code character varying,
    "default" boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_stores OWNER TO admin;

--
-- Name: spree_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_stores_id_seq OWNER TO admin;

--
-- Name: spree_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_stores_id_seq OWNED BY spree_stores.id;


--
-- Name: spree_taggings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_type character varying,
    taggable_id integer,
    tagger_type character varying,
    tagger_id integer,
    context character varying(128),
    created_at timestamp without time zone
);


ALTER TABLE spree_taggings OWNER TO admin;

--
-- Name: spree_taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_taggings_id_seq OWNER TO admin;

--
-- Name: spree_taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_taggings_id_seq OWNED BY spree_taggings.id;


--
-- Name: spree_tags; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_tags (
    id integer NOT NULL,
    name character varying,
    taggings_count integer DEFAULT 0
);


ALTER TABLE spree_tags OWNER TO admin;

--
-- Name: spree_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_tags_id_seq OWNER TO admin;

--
-- Name: spree_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_tags_id_seq OWNED BY spree_tags.id;


--
-- Name: spree_tax_categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_tax_categories (
    id integer NOT NULL,
    name character varying,
    description character varying,
    is_default boolean DEFAULT false,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tax_code character varying
);


ALTER TABLE spree_tax_categories OWNER TO admin;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_tax_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_tax_categories_id_seq OWNER TO admin;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_tax_categories_id_seq OWNED BY spree_tax_categories.id;


--
-- Name: spree_tax_rates; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_tax_rates (
    id integer NOT NULL,
    amount numeric(8,5),
    zone_id integer,
    tax_category_id integer,
    included_in_price boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    show_rate_in_label boolean DEFAULT true,
    deleted_at timestamp without time zone
);


ALTER TABLE spree_tax_rates OWNER TO admin;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_tax_rates_id_seq OWNER TO admin;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_tax_rates_id_seq OWNED BY spree_tax_rates.id;


--
-- Name: spree_taxonomies; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_taxonomies (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0
);


ALTER TABLE spree_taxonomies OWNER TO admin;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_taxonomies_id_seq OWNER TO admin;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_taxonomies_id_seq OWNED BY spree_taxonomies.id;


--
-- Name: spree_taxons; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_taxons (
    id integer NOT NULL,
    parent_id integer,
    "position" integer DEFAULT 0,
    name character varying NOT NULL,
    permalink character varying,
    taxonomy_id integer,
    lft integer,
    rgt integer,
    icon_file_name character varying,
    icon_content_type character varying,
    icon_file_size integer,
    icon_updated_at timestamp without time zone,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    meta_title character varying,
    meta_description character varying,
    meta_keywords character varying,
    depth integer
);


ALTER TABLE spree_taxons OWNER TO admin;

--
-- Name: spree_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_taxons_id_seq OWNER TO admin;

--
-- Name: spree_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_taxons_id_seq OWNED BY spree_taxons.id;


--
-- Name: spree_themes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_themes (
    id integer NOT NULL,
    name character varying,
    state character varying,
    template_file_file_name character varying,
    template_file_content_type character varying,
    template_file_file_size integer,
    template_file_updated_at timestamp without time zone
);


ALTER TABLE spree_themes OWNER TO admin;

--
-- Name: spree_themes_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_themes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_themes_id_seq OWNER TO admin;

--
-- Name: spree_themes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_themes_id_seq OWNED BY spree_themes.id;


--
-- Name: spree_themes_templates; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_themes_templates (
    id integer NOT NULL,
    name character varying,
    body text,
    path character varying,
    format character varying,
    locale character varying,
    handler character varying,
    partial boolean DEFAULT false,
    theme_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_themes_templates OWNER TO admin;

--
-- Name: spree_themes_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_themes_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_themes_templates_id_seq OWNER TO admin;

--
-- Name: spree_themes_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_themes_templates_id_seq OWNED BY spree_themes_templates.id;


--
-- Name: spree_trackers; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_trackers (
    id integer NOT NULL,
    analytics_id character varying,
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_trackers OWNER TO admin;

--
-- Name: spree_trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_trackers_id_seq OWNER TO admin;

--
-- Name: spree_trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_trackers_id_seq OWNED BY spree_trackers.id;


--
-- Name: spree_users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_users (
    id integer NOT NULL,
    encrypted_password character varying(128),
    password_salt character varying(128),
    email character varying,
    remember_token character varying,
    persistence_token character varying,
    reset_password_token character varying,
    perishable_token character varying,
    sign_in_count integer DEFAULT 0 NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    login character varying,
    ship_address_id integer,
    bill_address_id integer,
    authentication_token character varying,
    unlock_token character varying,
    locked_at timestamp without time zone,
    reset_password_sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    spree_api_key character varying(48),
    remember_created_at timestamp without time zone,
    deleted_at timestamp without time zone,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    loyalty_points_balance integer DEFAULT 0 NOT NULL,
    lock_version integer DEFAULT 0 NOT NULL
);


ALTER TABLE spree_users OWNER TO admin;

--
-- Name: spree_users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_users_id_seq OWNER TO admin;

--
-- Name: spree_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_users_id_seq OWNED BY spree_users.id;


--
-- Name: spree_variants; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_variants (
    id integer NOT NULL,
    sku character varying DEFAULT ''::character varying NOT NULL,
    weight numeric(8,2) DEFAULT 0.0,
    height numeric(8,2),
    width numeric(8,2),
    depth numeric(8,2),
    deleted_at timestamp without time zone,
    is_master boolean DEFAULT false,
    product_id integer,
    cost_price numeric(10,2),
    "position" integer,
    cost_currency character varying,
    track_inventory boolean DEFAULT true,
    tax_category_id integer,
    updated_at timestamp without time zone NOT NULL,
    discontinue_on timestamp without time zone,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_variants OWNER TO admin;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_variants_id_seq OWNER TO admin;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_variants_id_seq OWNED BY spree_variants.id;


--
-- Name: spree_zone_members; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_zone_members (
    id integer NOT NULL,
    zoneable_type character varying,
    zoneable_id integer,
    zone_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE spree_zone_members OWNER TO admin;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_zone_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_zone_members_id_seq OWNER TO admin;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_zone_members_id_seq OWNED BY spree_zone_members.id;


--
-- Name: spree_zones; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE spree_zones (
    id integer NOT NULL,
    name character varying,
    description character varying,
    default_tax boolean DEFAULT false,
    zone_members_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    kind character varying
);


ALTER TABLE spree_zones OWNER TO admin;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE spree_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE spree_zones_id_seq OWNER TO admin;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE spree_zones_id_seq OWNED BY spree_zones.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY connections ALTER COLUMN id SET DEFAULT nextval('connections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_addresses ALTER COLUMN id SET DEFAULT nextval('spree_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_adjustments ALTER COLUMN id SET DEFAULT nextval('spree_adjustments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_assets ALTER COLUMN id SET DEFAULT nextval('spree_assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_braintree_checkouts ALTER COLUMN id SET DEFAULT nextval('spree_braintree_checkouts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_calculators ALTER COLUMN id SET DEFAULT nextval('spree_calculators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_cart_events ALTER COLUMN id SET DEFAULT nextval('spree_cart_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_checkout_events ALTER COLUMN id SET DEFAULT nextval('spree_checkout_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_countries ALTER COLUMN id SET DEFAULT nextval('spree_countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_credit_cards ALTER COLUMN id SET DEFAULT nextval('spree_credit_cards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_customer_returns ALTER COLUMN id SET DEFAULT nextval('spree_customer_returns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_delivery_slots ALTER COLUMN id SET DEFAULT nextval('spree_delivery_slots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_gateways ALTER COLUMN id SET DEFAULT nextval('spree_gateways_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_inventory_units ALTER COLUMN id SET DEFAULT nextval('spree_inventory_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_line_items ALTER COLUMN id SET DEFAULT nextval('spree_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_log_entries ALTER COLUMN id SET DEFAULT nextval('spree_log_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_loyalty_points_transactions ALTER COLUMN id SET DEFAULT nextval('spree_loyalty_points_transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_marketing_campaigns ALTER COLUMN id SET DEFAULT nextval('spree_marketing_campaigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_marketing_contacts ALTER COLUMN id SET DEFAULT nextval('spree_marketing_contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_marketing_contacts_lists ALTER COLUMN id SET DEFAULT nextval('spree_marketing_contacts_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_marketing_lists ALTER COLUMN id SET DEFAULT nextval('spree_marketing_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_marketing_recipients ALTER COLUMN id SET DEFAULT nextval('spree_marketing_recipients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_option_type_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_option_type_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_option_types ALTER COLUMN id SET DEFAULT nextval('spree_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_option_value_variants ALTER COLUMN id SET DEFAULT nextval('spree_option_value_variants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_option_values ALTER COLUMN id SET DEFAULT nextval('spree_option_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_order_promotions ALTER COLUMN id SET DEFAULT nextval('spree_order_promotions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_orders ALTER COLUMN id SET DEFAULT nextval('spree_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_page_events ALTER COLUMN id SET DEFAULT nextval('spree_page_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_payment_capture_events ALTER COLUMN id SET DEFAULT nextval('spree_payment_capture_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_payment_methods ALTER COLUMN id SET DEFAULT nextval('spree_payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_payments ALTER COLUMN id SET DEFAULT nextval('spree_payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_permissions ALTER COLUMN id SET DEFAULT nextval('spree_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_preferences ALTER COLUMN id SET DEFAULT nextval('spree_preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_prices ALTER COLUMN id SET DEFAULT nextval('spree_prices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_product_option_types ALTER COLUMN id SET DEFAULT nextval('spree_product_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_product_packages ALTER COLUMN id SET DEFAULT nextval('spree_product_packages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_product_promotion_rules ALTER COLUMN id SET DEFAULT nextval('spree_product_promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_product_properties ALTER COLUMN id SET DEFAULT nextval('spree_product_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_products ALTER COLUMN id SET DEFAULT nextval('spree_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_products_taxons ALTER COLUMN id SET DEFAULT nextval('spree_products_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotion_action_line_items ALTER COLUMN id SET DEFAULT nextval('spree_promotion_action_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotion_actions ALTER COLUMN id SET DEFAULT nextval('spree_promotion_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotion_categories ALTER COLUMN id SET DEFAULT nextval('spree_promotion_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotion_rule_taxons ALTER COLUMN id SET DEFAULT nextval('spree_promotion_rule_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotion_rule_users ALTER COLUMN id SET DEFAULT nextval('spree_promotion_rule_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotion_rules ALTER COLUMN id SET DEFAULT nextval('spree_promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotions ALTER COLUMN id SET DEFAULT nextval('spree_promotions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_properties ALTER COLUMN id SET DEFAULT nextval('spree_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_property_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_property_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_prototype_taxons ALTER COLUMN id SET DEFAULT nextval('spree_prototype_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_refund_reasons ALTER COLUMN id SET DEFAULT nextval('spree_refund_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_refunds ALTER COLUMN id SET DEFAULT nextval('spree_refunds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_reimbursement_credits ALTER COLUMN id SET DEFAULT nextval('spree_reimbursement_credits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_reimbursement_types ALTER COLUMN id SET DEFAULT nextval('spree_reimbursement_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_reimbursements ALTER COLUMN id SET DEFAULT nextval('spree_reimbursements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_return_authorization_reasons ALTER COLUMN id SET DEFAULT nextval('spree_return_authorization_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_return_authorizations ALTER COLUMN id SET DEFAULT nextval('spree_return_authorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_return_items ALTER COLUMN id SET DEFAULT nextval('spree_return_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_roles ALTER COLUMN id SET DEFAULT nextval('spree_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_roles_users ALTER COLUMN id SET DEFAULT nextval('spree_roles_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_shipments ALTER COLUMN id SET DEFAULT nextval('spree_shipments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_shipping_categories ALTER COLUMN id SET DEFAULT nextval('spree_shipping_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_shipping_method_categories ALTER COLUMN id SET DEFAULT nextval('spree_shipping_method_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_shipping_method_zones ALTER COLUMN id SET DEFAULT nextval('spree_shipping_method_zones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_shipping_methods ALTER COLUMN id SET DEFAULT nextval('spree_shipping_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_shipping_rates ALTER COLUMN id SET DEFAULT nextval('spree_shipping_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_state_changes ALTER COLUMN id SET DEFAULT nextval('spree_state_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_states ALTER COLUMN id SET DEFAULT nextval('spree_states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_stock_items ALTER COLUMN id SET DEFAULT nextval('spree_stock_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_stock_locations ALTER COLUMN id SET DEFAULT nextval('spree_stock_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_stock_movements ALTER COLUMN id SET DEFAULT nextval('spree_stock_movements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_stock_transfers ALTER COLUMN id SET DEFAULT nextval('spree_stock_transfers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_store_credit_categories ALTER COLUMN id SET DEFAULT nextval('spree_store_credit_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_store_credit_events ALTER COLUMN id SET DEFAULT nextval('spree_store_credit_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_store_credit_types ALTER COLUMN id SET DEFAULT nextval('spree_store_credit_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_store_credits ALTER COLUMN id SET DEFAULT nextval('spree_store_credits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_stores ALTER COLUMN id SET DEFAULT nextval('spree_stores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_taggings ALTER COLUMN id SET DEFAULT nextval('spree_taggings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_tags ALTER COLUMN id SET DEFAULT nextval('spree_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_tax_categories ALTER COLUMN id SET DEFAULT nextval('spree_tax_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_tax_rates ALTER COLUMN id SET DEFAULT nextval('spree_tax_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_taxonomies ALTER COLUMN id SET DEFAULT nextval('spree_taxonomies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_taxons ALTER COLUMN id SET DEFAULT nextval('spree_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_themes ALTER COLUMN id SET DEFAULT nextval('spree_themes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_themes_templates ALTER COLUMN id SET DEFAULT nextval('spree_themes_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_trackers ALTER COLUMN id SET DEFAULT nextval('spree_trackers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_users ALTER COLUMN id SET DEFAULT nextval('spree_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_variants ALTER COLUMN id SET DEFAULT nextval('spree_variants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_zone_members ALTER COLUMN id SET DEFAULT nextval('spree_zone_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_zones ALTER COLUMN id SET DEFAULT nextval('spree_zones_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-11-15 09:55:28.440507	2017-11-25 11:18:31.314448
\.


--
-- Data for Name: connections; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY connections (id, "Sequence_Number", "Client_Key", "Client_Secret", "Portal_Id", "Portal_Password", "Active_Field", "User_Field_String", "User_Field_Integer", "User_Field_Datetime", "Transaction_Originator", "Transaction_Datetime", "Transaction_IP", "User_Updated", "Date_Updated", "IP_Updated", created_at, updated_at, "Ecomm_instance_name", "Access_Token") FROM stdin;
\.


--
-- Name: connections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('connections_id_seq', 1, false);


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at, deleted_at) FROM stdin;
1	ruby-on-rails-tote	1	Spree::Product	\N	2017-11-15 10:04:17.135016	\N
2	ruby-on-rails-bag	2	Spree::Product	\N	2017-11-15 10:04:17.469577	\N
6	ruby-baseball-jersey	6	Spree::Product	\N	2017-11-15 10:04:18.408861	\N
7	apache-baseball-jersey	7	Spree::Product	\N	2017-11-15 10:04:18.619913	\N
8	spree-baseball-jersey	8	Spree::Product	\N	2017-11-15 10:04:18.847889	\N
12	spree-bag	12	Spree::Product	\N	2017-11-15 10:04:19.744454	\N
13	ruby-on-rails-mug	13	Spree::Product	\N	2017-11-15 10:04:19.971234	\N
14	ruby-on-rails-stein	14	Spree::Product	\N	2017-11-15 10:04:20.19198	\N
16	spree-mug	16	Spree::Product	\N	2017-11-15 10:04:20.638579	\N
18	brand	2	Spree::Taxon	\N	2017-11-15 10:04:23.225333	\N
28	brand/bags	12	Spree::Taxon	\N	2017-11-15 11:48:12.595039	\N
29	brand/mugs	13	Spree::Taxon	\N	2017-11-15 11:48:17.564689	\N
30	brand/clothing	14	Spree::Taxon	\N	2017-11-15 11:48:25.327731	\N
31	brand/clothing/shirt	15	Spree::Taxon	\N	2017-11-15 11:48:36.128561	\N
32	brand/clothing/t-shirt	16	Spree::Taxon	\N	2017-11-15 11:48:44.730025	\N
33	brand/new-node	17	Spree::Taxon	\N	2017-11-15 11:48:49.621084	\N
34	brand/apache	18	Spree::Taxon	\N	2017-11-15 11:49:07.902826	\N
35	brand/nike	19	Spree::Taxon	\N	2017-11-15 11:49:36.721488	\N
36	brand/bags/new-node	20	Spree::Taxon	\N	2017-11-15 11:49:46.163611	2017-11-15 11:49:51.504521
37	brand/puma	21	Spree::Taxon	\N	2017-11-15 11:50:00.122234	\N
38	adidas-baseball-jersey	6	Spree::Product	\N	2017-11-15 12:56:48.828043	\N
39	puma-bag	2	Spree::Product	\N	2017-11-15 13:09:46.208806	\N
42	puma-mug	13	Spree::Product	\N	2017-11-15 13:47:04.968358	\N
44	puma-hoodie	14	Spree::Product	\N	2017-11-15 13:55:55.379687	\N
45	puma-tote	1	Spree::Product	\N	2017-11-15 14:06:27.597641	\N
46	nike-bag	12	Spree::Product	\N	2017-11-15 14:12:07.607009	\N
47	nike-baseball-jersey	8	Spree::Product	\N	2017-11-15 14:13:55.323484	\N
49	nike-mug	16	Spree::Product	\N	2017-11-15 14:16:56.768637	\N
17	brands	1	Spree::Taxon	\N	2017-11-15 10:04:23.134	2017-11-15 14:42:42.275464
19	brands/bags	3	Spree::Taxon	\N	2017-11-15 10:04:23.411581	2017-11-15 14:42:42.284262
20	brands/mugs	4	Spree::Taxon	\N	2017-11-15 10:04:23.592204	2017-11-15 14:42:42.354411
21	brands/clothing	5	Spree::Taxon	\N	2017-11-15 10:04:23.700038	2017-11-15 14:42:42.367943
22	brands/clothing/shirts	6	Spree::Taxon	\N	2017-11-15 10:04:23.804178	2017-11-15 14:42:42.380076
23	brands/clothing/t-shirts	7	Spree::Taxon	\N	2017-11-15 10:04:24.026036	2017-11-15 14:42:42.389148
24	brands/ruby	8	Spree::Taxon	\N	2017-11-15 10:04:24.181936	2017-11-15 14:42:42.400845
25	brands/apache	9	Spree::Taxon	\N	2017-11-15 10:04:24.48179	2017-11-15 14:42:42.41267
26	brands/spree	10	Spree::Taxon	\N	2017-11-15 10:04:24.629738	2017-11-15 14:42:42.421656
27	brands/rails	11	Spree::Taxon	\N	2017-11-15 10:04:24.840036	2017-11-15 14:42:42.434823
51	nike-hoodie	15	Spree::Product	\N	2017-11-15 14:22:51.949417	2017-11-24 15:37:11.057967
15	spree-stein	15	Spree::Product	\N	2017-11-15 10:04:20.416387	2017-11-24 15:37:11.060027
48	nike-jr-spaghetti	9	Spree::Product	\N	2017-11-15 14:15:41.129576	2017-11-24 15:37:14.863379
9	spree-jr-spaghetti	9	Spree::Product	\N	2017-11-15 10:04:19.075278	2017-11-24 15:37:14.86463
50	nike-round-neck-t-shirt	10	Spree::Product	\N	2017-11-15 14:19:55.15126	2017-11-24 15:37:18.225444
10	spree-ringer-t-shirt	10	Spree::Product	\N	2017-11-15 10:04:19.309002	2017-11-24 15:37:18.227634
52	nike-tote	11	Spree::Product	\N	2017-11-15 14:24:05.204948	2017-11-24 15:37:21.323061
11	spree-tote	11	Spree::Product	\N	2017-11-15 10:04:19.530078	2017-11-24 15:37:21.324841
40	puma-baseball-jersey	3	Spree::Product	\N	2017-11-15 13:21:19.289257	2017-11-24 15:37:24.654407
3	ruby-on-rails-baseball-jersey	3	Spree::Product	\N	2017-11-15 10:04:17.69799	2017-11-24 15:37:24.657257
41	puma-jr-spaghetti	4	Spree::Product	\N	2017-11-15 13:41:19.434085	2017-11-24 15:37:28.128167
4	ruby-on-rails-jr-spaghetti	4	Spree::Product	\N	2017-11-15 10:04:17.930845	2017-11-24 15:37:28.130028
43	puma-t-shirt	5	Spree::Product	\N	2017-11-15 13:52:23.373018	2017-11-24 15:37:31.900975
5	ruby-on-rails-ringer-t-shirt	5	Spree::Product	\N	2017-11-15 10:04:18.183172	2017-11-24 15:37:31.902744
\.


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('friendly_id_slugs_id_seq', 52, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY schema_migrations (version) FROM stdin;
20170808141826
20170808141827
20170808141828
20170808141829
20170808141830
20170808141831
20170808141832
20170808141833
20170808141834
20170808141835
20170808141836
20170808141837
20170808141838
20170808141839
20170808141840
20170808141841
20170808141842
20170808141843
20170808141844
20170808141845
20170808141846
20170808141847
20170808141848
20170808141849
20170808141850
20170808141851
20170808141852
20170808141853
20170808141854
20170808141855
20170808141856
20170808141857
20170808141858
20170808141859
20170808141860
20170808141861
20170808141862
20170808141863
20170808141864
20170808141865
20170808141866
20170808141867
20170808141868
20170808141869
20170808141870
20170808141871
20170808141872
20170808141873
20170808141874
20170808141875
20170808141876
20170808141877
20170808141878
20170808141879
20170808141880
20170808141881
20170808141882
20170808141883
20170808141884
20170808141885
20170808141886
20170808141887
20170808141888
20170808141889
20170808141890
20170808141891
20170808141892
20170808141893
20170808141894
20170808141895
20170808141896
20170808141897
20170808141898
20170808141899
20170808141900
20170808141901
20170808141902
20170808141903
20170808141904
20170808141905
20170808141906
20170808141907
20170808141908
20170808141909
20170808141910
20170808141911
20170808141912
20170808141913
20170808141914
20170808141915
20170808141916
20170808141917
20170808141918
20170808141919
20170808141920
20170808141921
20170808141922
20170808141923
20170808141924
20170808141925
20170808141926
20170808141927
20170808141928
20170808141929
20170808141930
20170808141931
20170808141932
20170808141933
20170808141934
20170808141935
20170808141936
20170808141937
20170808141938
20170808141939
20170808141940
20170808141941
20170808141942
20170808141943
20170808141944
20170808141945
20170808141946
20170808141947
20170808141948
20170808141949
20170808141950
20170808141951
20170808141952
20170808141953
20170808141954
20170808141955
20170808141956
20170808141957
20170808141958
20170808141959
20170808141960
20170808141961
20170808141962
20170808141963
20170808141964
20170808141965
20170808141966
20170808141967
20170808141968
20170808141969
20170808141970
20170808141971
20170808141972
20170808141973
20170808141974
20170808141975
20170808141976
20170808141977
20170808141978
20170808141979
20170808141980
20170808141981
20170808141982
20170808141983
20170808141984
20170808141985
20170808141986
20170808141987
20170808141988
20170808141989
20170808141990
20170808141991
20170808141992
20170808141993
20170808141994
20170808141995
20170808141996
20170808141997
20170808141998
20170808141999
20170808142000
20170808142001
20170808142002
20170808142003
20170808142004
20170808142005
20170808142006
20170808142007
20170808142008
20170808142009
20170808142010
20170808142011
20170808142012
20170808142013
20170808142014
20170808142015
20170808142016
20170808142017
20170808142018
20170808142019
20170808142020
20170808142021
20170808142022
20170808142023
20170808142024
20170808142025
20170808142026
20170808142027
20170808142028
20170808142029
20170808142030
20170808142031
20170808142032
20170808142033
20170808142034
20170808142035
20170808142036
20170808142037
20170808142038
20170808142039
20170808142040
20170808142041
20170808142042
20170808142043
20170808142044
20170808142045
20170808142046
20170808142047
20170808142048
20170808142049
20170808142050
20170808142051
20170808142052
20170808142053
20170808142054
20170808142055
20170808142056
20170808142057
20170808142058
20170808142059
20170808142060
20170808142061
20170808142062
20170808142063
20170808142064
20170808142065
20170808142066
20170808142067
20170808142068
20170808142069
20170808142070
20170808142071
20170808142072
20170817125139
20170817125140
20170817125141
20170817125142
20170817125143
20170817125144
20170824144246
20170824144247
20170824144248
20170824144249
20170824144250
20170824144251
20170824144252
20170824144253
20170923094237
20171007152549
20171013154058
20171017100123
20171017100332
20171031100814
20171031100815
20171031100816
20171031101443
20171114135718
20171125111814
20171125111815
20171125111816
20171125111817
20171125111818
20171125111819
20171125111820
20171125111821
20171125111822
20171125111823
20171125111824
20171125111825
20171125111826
20171127154253
20171127154254
20171127154255
20171127154256
20171127154257
20171127154351
20171127154352
20171127154353
20171127154354
20171127154355
20171127154356
20171127154357
20171127154358
20171127154359
20171127154360
20171127154361
20171127154362
20171127154363
\.


--
-- Data for Name: spree_addresses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_addresses (id, firstname, lastname, address1, address2, city, zipcode, phone, state_name, alternative_phone, company, state_id, country_id, created_at, updated_at, braintree_id) FROM stdin;
1	Jaylan	Kihn	67005 Howell Skyway	Apt. 220	Gussiefort	16804	902.422.4191	\N	\N	\N	3045	232	2017-11-15 10:04:48.521345	2017-11-15 10:04:48.521345	\N
2	Manuel	Bailey	65188 Giuseppe Locks	Suite 291	Lake Jennietown	16804	262.645.1278	\N	\N	\N	3045	232	2017-11-15 10:04:48.553209	2017-11-15 10:04:48.553209	\N
3	Vishal	Biradar	21 street lokhandwala complex mumbai	Near By Raolicamp	Mumbai	400037	9867188352	\N	\N	\N	1140	105	2017-11-15 12:21:17.967015	2017-11-15 12:21:17.967015	\N
4	Vishal	Biradar	21 street lokhandwala complex mumbai	Near By Raolicamp	Mumbai	400037	9867188352	\N	\N	\N	1140	105	2017-11-15 12:21:17.96941	2017-11-15 12:21:17.96941	\N
5	Vishal	Biradar	21 street lokhandwala complex mumbai	Near By Raolicamp	Mumbai	400037	9867188352	\N	\N	\N	1140	105	2017-11-15 12:21:18.169764	2017-11-15 12:21:18.169764	\N
6	Vishal	Biradar	21 street lokhandwala complex mumbai	Near By Raolicamp	Mumbai	400037	9867188352	\N	\N	\N	1140	105	2017-11-15 12:21:18.239306	2017-11-15 12:21:18.239306	\N
7	sam	smith	150th street Westchester Avenue	1701 Airport Blvd	New York	10573	718-542-8828	\N	\N	\N	3045	232	2017-11-28 14:32:31.685795	2017-11-28 14:32:31.685795	\N
8	sam	smith	150th street Westchester Avenue	1701 Airport Blvd	New York	10573	718-542-8828	\N	\N	\N	3045	232	2017-11-28 14:32:31.688485	2017-11-28 14:32:31.688485	\N
9	sam	smith	150th street Westchester Avenue	1701 Airport Blvd	New York	10573	718-542-8828	\N	\N	\N	3045	232	2017-11-28 14:32:32.014776	2017-11-28 14:32:32.014776	\N
10	sam	smith	150th street Westchester Avenue	1701 Airport Blvd	New York	10573	718-542-8828	\N	\N	\N	3045	232	2017-11-28 14:32:32.079125	2017-11-28 14:32:32.079125	\N
\.


--
-- Name: spree_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_addresses_id_seq', 10, true);


--
-- Data for Name: spree_adjustments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_adjustments (id, source_type, source_id, adjustable_type, adjustable_id, amount, label, mandatory, eligible, created_at, updated_at, state, order_id, included) FROM stdin;
3	Spree::TaxRate	1	Spree::Order	1	0.80	Tax	t	t	2017-11-15 10:04:49.621825	2017-11-15 10:04:49.932226	open	1	f
2	Spree::TaxRate	1	Spree::LineItem	2	1.15	North America 5.0%	\N	t	2017-11-15 10:04:49.118938	2017-11-15 10:04:50.362711	open	2	f
4	Spree::TaxRate	1	Spree::Order	2	1.21	Tax	t	t	2017-11-15 10:04:49.687086	2017-11-15 10:04:50.397573	open	2	f
7	Spree::TaxRate	1	Spree::LineItem	3	1.00	North America 5.0%	\N	t	2017-11-15 12:27:25.471459	2017-11-15 12:27:34.280462	closed	3	f
12	Spree::TaxRate	1	Spree::LineItem	4	0.85	North America 5.0%	\N	t	2017-11-25 13:02:07.183454	2017-11-25 13:03:21.31808	closed	4	f
13	Spree::TaxRate	2	Spree::Shipment	5	0.70	VAT 7.0%	\N	t	2017-11-25 13:02:07.285325	2017-11-25 13:03:21.344768	closed	4	f
24	Spree::TaxRate	1	Spree::LineItem	6	1.00	North America 5.0%	\N	t	2017-11-25 14:30:58.026498	2017-11-25 14:31:16.724241	closed	6	f
25	Spree::TaxRate	2	Spree::Shipment	8	0.70	VAT 7.0%	\N	t	2017-11-25 14:30:58.150745	2017-11-25 14:31:16.767048	closed	6	f
18	Spree::TaxRate	2	Spree::LineItem	5	1.12	VAT 7.0%	\N	t	2017-11-25 13:35:06.17514	2017-11-25 13:36:10.888711	closed	5	f
19	Spree::TaxRate	2	Spree::Shipment	6	0.70	VAT 7.0%	\N	t	2017-11-25 13:35:06.273755	2017-11-25 13:36:10.923722	closed	5	f
31	Spree::TaxRate	2	Spree::LineItem	9	0.98	VAT 7.0%	\N	t	2017-11-28 14:32:50.137504	2017-11-28 14:32:50.563733	open	8	f
32	Spree::TaxRate	2	Spree::Shipment	10	0.70	VAT 7.0%	\N	t	2017-11-28 14:32:50.227967	2017-11-28 14:32:50.616334	open	8	f
38	Spree::TaxRate	2	Spree::LineItem	7	1.61	VAT 7.0%	\N	t	2017-12-06 10:48:51.793656	2017-12-06 10:48:52.224596	open	7	f
39	Spree::TaxRate	2	Spree::LineItem	11	0.98	VAT 7.0%	\N	t	2017-12-06 10:48:51.865456	2017-12-06 10:48:52.27985	open	7	f
40	Spree::TaxRate	2	Spree::Shipment	11	0.70	VAT 7.0%	\N	t	2017-12-06 10:48:51.970602	2017-12-06 10:48:52.334088	open	7	f
\.


--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_adjustments_id_seq', 40, true);


--
-- Data for Name: spree_assets; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_assets (id, viewable_type, viewable_id, attachment_width, attachment_height, attachment_file_size, "position", attachment_content_type, attachment_file_name, type, attachment_updated_at, alt, created_at, updated_at) FROM stdin;
28	Spree::Variant	13	360	360	10929	2	image/jpeg	ror_mug_back.jpeg	Spree::Image	2017-11-15 10:04:42.154641	\N	2017-11-15 10:04:42.354925	2017-11-15 10:04:42.354925
33	Spree::Variant	7	504	484	123779	1	image/png	apache_baseball.png	Spree::Image	2017-11-15 10:04:43.673098	\N	2017-11-15 10:04:44.029269	2017-11-15 10:04:44.029269
34	Spree::Variant	6	1111	1500	137367	1	image/jpeg	adidas-baseball-jersey.jpg	Spree::Image	2017-11-15 12:57:11.279173		2017-11-15 10:04:44.503588	2017-11-15 12:57:11.98271
23	Spree::Variant	2	645	500	177647	1	image/jpeg	puma-office-bag.jpg	Spree::Image	2017-11-15 13:11:00.643476		2017-11-15 10:04:40.892849	2017-11-15 13:11:01.460863
27	Spree::Variant	13	200	240	20025	1	image/jpeg	puma-mug.jpeg	Spree::Image	2017-11-15 13:47:33.778943		2017-11-15 10:04:42.082196	2017-11-15 13:47:33.969305
31	Spree::Variant	14	600	600	22557	1	image/jpeg	PUMA-HOODIE.jpg	Spree::Image	2017-11-15 13:56:12.752674		2017-11-15 10:04:43.2907	2017-11-15 13:56:12.981636
21	Spree::Variant	1	253	445	17866	1	image/jpeg	puma-tote.jpg	Spree::Image	2017-11-15 14:07:05.155511		2017-11-15 10:04:40.291253	2017-11-15 14:07:05.333811
35	Spree::Variant	12	312	312	17699	1	image/jpeg	nike-bag.jpg	Spree::Image	2017-11-15 14:12:22.446232		2017-11-15 10:04:44.859985	2017-11-15 14:12:22.628916
41	Spree::Variant	8	350	350	7001	1	image/jpeg	nike-baseball-jersey.jpeg	Spree::Image	2017-11-15 14:14:27.943108		2017-11-15 10:04:46.830113	2017-11-15 14:14:28.116388
45	Spree::Variant	16	1024	1024	493634	1	image/png	NIKE-MUG.png	Spree::Image	2017-11-15 14:17:12.661406		2017-11-15 10:04:47.994406	2017-11-15 14:17:13.282558
\.


--
-- Name: spree_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_assets_id_seq', 47, true);


--
-- Data for Name: spree_braintree_checkouts; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_braintree_checkouts (id, transaction_id, state, created_at, updated_at, paypal_email, advanced_fraud_data, risk_id, risk_decision, braintree_last_digits, braintree_card_type, admin_payment) FROM stdin;
\.


--
-- Name: spree_braintree_checkouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_braintree_checkouts_id_seq', 1, false);


--
-- Data for Name: spree_calculators; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_calculators (id, type, calculable_type, calculable_id, created_at, updated_at, preferences, deleted_at) FROM stdin;
1	Spree::Calculator::Shipping::FlatRate	Spree::ShippingMethod	1	2017-11-15 10:04:16.005383	2017-11-15 10:04:16.458752	---\n:amount: 5\n:currency: USD\n	\N
4	Spree::Calculator::Shipping::FlatRate	Spree::ShippingMethod	4	2017-11-15 10:04:16.326595	2017-11-15 10:04:16.498527	---\n:amount: 5\n:currency: USD\n	\N
3	Spree::Calculator::Shipping::FlatRate	Spree::ShippingMethod	3	2017-11-15 10:04:16.269069	2017-11-15 10:04:16.536118	---\n:amount: 15\n:currency: USD\n	\N
2	Spree::Calculator::Shipping::FlatRate	Spree::ShippingMethod	2	2017-11-15 10:04:16.209985	2017-11-15 10:04:16.562737	---\n:amount: 10\n:currency: USD\n	\N
5	Spree::Calculator::Shipping::FlatRate	Spree::ShippingMethod	5	2017-11-15 10:04:16.385367	2017-11-15 10:04:16.599957	---\n:amount: 8\n:currency: EUR\n	\N
6	Spree::Calculator::DefaultTax	Spree::TaxRate	1	2017-11-15 10:04:16.757038	2017-11-15 10:04:16.791001	\N	\N
7	Spree::Calculator::DefaultTax	Spree::TaxRate	2	2017-11-15 12:15:35.702204	2017-11-15 12:15:35.702204	\N	\N
8	Spree::Calculator::Shipping::FlatRate	Spree::ShippingMethod	6	2017-11-15 12:17:21.475315	2017-11-15 12:23:57.905008	---\n:currency: USD\n:amount: 0\n	2017-11-15 12:23:57.904967
9	Spree::Calculator::Shipping::FlatRate	Spree::ShippingMethod	7	2017-11-15 12:25:18.33615	2017-11-15 12:29:14.625812	---\n:currency: USD\n:amount: !ruby/object:BigDecimal 18:0.1e2\n	\N
\.


--
-- Name: spree_calculators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_calculators_id_seq', 9, true);


--
-- Data for Name: spree_cart_events; Type: TABLE DATA; Schema: public; Owner: e9comm
--

COPY spree_cart_events (id, actor_type, actor_id, target_type, target_id, activity, referrer, quantity, total, session_id, variant_id, created_at, updated_at) FROM stdin;
1	Spree::Order	7	Spree::LineItem	7	add	\N	1	24.6000	\N	2	2017-11-28 13:23:02.521012	2017-11-28 13:23:02.521012
2	Spree::Order	8	Spree::LineItem	8	add	\N	1	16.9900	\N	14	2017-11-28 13:37:18.432054	2017-11-28 13:37:18.432054
3	Spree::Order	8	Spree::LineItem	9	add	\N	1	30.9800	\N	13	2017-11-28 14:27:23.583984	2017-11-28 14:27:23.583984
4	Spree::Order	8	Spree::LineItem	8	remove	\N	-1	30.9800	\N	14	2017-11-28 14:27:27.057592	2017-11-28 14:27:27.057592
5	Spree::Order	9	Spree::LineItem	10	add	\N	1	13.9900	\N	16	2017-11-29 09:30:56.454738	2017-11-29 09:30:56.454738
6	Spree::Order	7	Spree::LineItem	11	add	\N	1	39.5700	\N	16	2017-12-06 10:48:38.997207	2017-12-06 10:48:38.997207
\.


--
-- Name: spree_cart_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e9comm
--

SELECT pg_catalog.setval('spree_cart_events_id_seq', 6, true);


--
-- Data for Name: spree_checkout_events; Type: TABLE DATA; Schema: public; Owner: e9comm
--

COPY spree_checkout_events (id, actor_type, actor_id, target_type, target_id, activity, referrer, previous_state, next_state, session_id, created_at, updated_at) FROM stdin;
1	Spree::User	1	Spree::Order	7	initialize_order	http://localhost:3000/products/puma-bag	\N	cart	df1faf423a8a31dc9f380f6523bfc535	2017-11-28 13:23:03.333021	2017-11-28 13:23:03.333021
2	Spree::User	1	Spree::Order	7	initialize_order	http://localhost:3000/	\N	cart	5b551d78f500942272cff3769b6e7e00	2017-11-28 13:35:06.573855	2017-11-28 13:35:06.573855
3	Spree::User	1	Spree::Order	7	change_order_state	http://localhost:3000/cart	cart	address	5b551d78f500942272cff3769b6e7e00	2017-11-28 13:35:10.660032	2017-11-28 13:35:10.660032
4	Spree::User	1	Spree::Order	7	change_order_state	http://localhost:3000/checkout/address	address	delivery	5b551d78f500942272cff3769b6e7e00	2017-11-28 13:35:19.723459	2017-11-28 13:35:19.723459
5	Spree::User	2	Spree::Order	8	initialize_order	http://localhost:3000/products/puma-hoodie	\N	cart	7b0b2041c86666341c2bf462ff92dd66	2017-11-28 13:37:19.071823	2017-11-28 13:37:19.071823
6	Spree::User	2	Spree::Order	8	change_order_state	http://localhost:3000/cart	cart	address	7b0b2041c86666341c2bf462ff92dd66	2017-11-28 13:37:22.290391	2017-11-28 13:37:22.290391
7	Spree::User	2	Spree::Order	8	initialize_order	http://localhost:3000/products/puma-mug	\N	cart	ef6ef8275b1d63f02ee2332c56dc9b20	2017-11-28 14:27:24.323589	2017-11-28 14:27:24.323589
8	Spree::User	2	Spree::Order	8	change_order_state	http://localhost:3000/cart	cart	address	ef6ef8275b1d63f02ee2332c56dc9b20	2017-11-28 14:27:31.139632	2017-11-28 14:27:31.139632
9	Spree::User	2	Spree::Order	8	change_order_state	http://localhost:3000/checkout/address	address	delivery	ef6ef8275b1d63f02ee2332c56dc9b20	2017-11-28 14:32:33.661805	2017-11-28 14:32:33.661805
10	Spree::User	2	Spree::Order	8	change_order_state	http://localhost:3000/checkout/delivery	delivery	payment	ef6ef8275b1d63f02ee2332c56dc9b20	2017-11-28 14:32:51.726021	2017-11-28 14:32:51.726021
11	Spree::User	2	Spree::Order	8	initialize_order	http://localhost:3000/	\N	cart	73a80ab3950b789ee25e5fc3b647a53a	2017-11-28 14:35:59.966461	2017-11-28 14:35:59.966461
12	Spree::User	1	Spree::Order	7	initialize_order	http://localhost:3000/	\N	cart	916015bd1ccae198d3aeb5f57de21e42	2017-11-28 16:23:38.939829	2017-11-28 16:23:38.939829
13	\N	\N	Spree::Order	9	initialize_order	http://localhost:3000/products/nike-mug	\N	cart	132bee1e9fb3729f552f8a69c60728c0	2017-11-29 09:30:57.541819	2017-11-29 09:30:57.541819
14	Spree::User	7	Spree::Order	9	change_order_state	http://localhost:3000/checkout/registration	registration	address	a4404625103c620acced7d107a028da4	2017-11-29 09:31:49.082023	2017-11-29 09:31:49.082023
15	Spree::User	1	Spree::Order	7	initialize_order	http://0.0.0.0:3000/products/nike-mug	\N	cart	a8ca6f33443a8040839110fb0005bfc4	2017-12-06 10:48:39.564898	2017-12-06 10:48:39.564898
16	Spree::User	1	Spree::Order	7	change_order_state	http://0.0.0.0:3000/cart	cart	address	a8ca6f33443a8040839110fb0005bfc4	2017-12-06 10:48:42.96403	2017-12-06 10:48:42.96403
17	Spree::User	1	Spree::Order	7	change_order_state	http://0.0.0.0:3000/checkout/address	address	delivery	a8ca6f33443a8040839110fb0005bfc4	2017-12-06 10:48:49.295028	2017-12-06 10:48:49.295028
18	Spree::User	1	Spree::Order	7	change_order_state	http://0.0.0.0:3000/checkout/delivery	delivery	payment	a8ca6f33443a8040839110fb0005bfc4	2017-12-06 10:48:52.80787	2017-12-06 10:48:52.80787
\.


--
-- Name: spree_checkout_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e9comm
--

SELECT pg_catalog.setval('spree_checkout_events_id_seq', 18, true);


--
-- Data for Name: spree_countries; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_countries (id, iso_name, iso, iso3, name, numcode, states_required, updated_at, zipcode_required) FROM stdin;
1	ANDORRA	AD	AND	Andorra	20	t	\N	t
3	AFGHANISTAN	AF	AFG	Afghanistan	4	t	\N	t
5	ANGUILLA	AI	AIA	Anguilla	660	f	\N	t
6	ALBANIA	AL	ALB	Albania	8	t	\N	t
7	ARMENIA	AM	ARM	Armenia	51	t	\N	t
9	ANTARCTICA	AQ	ATA	Antarctica	10	f	\N	t
10	ARGENTINA	AR	ARG	Argentina	32	t	\N	t
11	AMERICAN SAMOA	AS	ASM	American Samoa	16	f	\N	t
12	AUSTRIA	AT	AUT	Austria	40	t	\N	t
13	AUSTRALIA	AU	AUS	Australia	36	t	\N	t
15	ÅLAND ISLANDS	AX	ALA	Åland Islands	248	f	\N	t
16	AZERBAIJAN	AZ	AZE	Azerbaijan	31	t	\N	t
17	BOSNIA AND HERZEGOVINA	BA	BIH	Bosnia and Herzegovina	70	t	\N	t
18	BARBADOS	BB	BRB	Barbados	52	t	\N	t
19	BANGLADESH	BD	BGD	Bangladesh	50	t	\N	t
20	BELGIUM	BE	BEL	Belgium	56	t	\N	t
22	BULGARIA	BG	BGR	Bulgaria	100	t	\N	t
23	BAHRAIN	BH	BHR	Bahrain	48	t	\N	t
26	SAINT BARTHÉLEMY	BL	BLM	Saint Barthélemy	652	f	\N	t
28	BRUNEI DARUSSALAM	BN	BRN	Brunei Darussalam	96	t	\N	t
30	BONAIRE, SINT EUSTATIUS AND SABA	BQ	BES	Bonaire, Sint Eustatius and Saba	535	t	\N	t
31	BRAZIL	BR	BRA	Brazil	76	t	\N	t
33	BHUTAN	BT	BTN	Bhutan	64	t	\N	t
34	BOUVET ISLAND	BV	BVT	Bouvet Island	74	f	\N	t
36	BELARUS	BY	BLR	Belarus	112	t	\N	t
38	CANADA	CA	CAN	Canada	124	t	\N	t
39	COCOS (KEELING) ISLANDS	CC	CCK	Cocos (Keeling) Islands	166	f	\N	t
43	SWITZERLAND	CH	CHE	Switzerland	756	t	\N	t
46	CHILE	CL	CHL	Chile	152	t	\N	t
48	CHINA	CN	CHN	China	156	t	\N	t
49	COLOMBIA	CO	COL	Colombia	170	t	\N	t
50	COSTA RICA	CR	CRI	Costa Rica	188	t	\N	t
51	CUBA	CU	CUB	Cuba	192	t	\N	t
52	CAPE VERDE	CV	CPV	Cape Verde	132	t	\N	t
53	CURAÇAO	CW	CUW	Curaçao	531	f	\N	t
54	CHRISTMAS ISLAND	CX	CXR	Christmas Island	162	f	\N	t
55	CYPRUS	CY	CYP	Cyprus	196	t	\N	t
56	CZECH REPUBLIC	CZ	CZE	Czech Republic	203	t	\N	t
57	GERMANY	DE	DEU	Germany	276	t	\N	t
59	DENMARK	DK	DNK	Denmark	208	t	\N	t
61	DOMINICAN REPUBLIC	DO	DOM	Dominican Republic	214	t	\N	t
62	ALGERIA	DZ	DZA	Algeria	12	t	\N	t
63	ECUADOR	EC	ECU	Ecuador	218	t	\N	t
64	ESTONIA	EE	EST	Estonia	233	t	\N	t
65	EGYPT	EG	EGY	Egypt	818	t	\N	t
66	WESTERN SAHARA	EH	ESH	Western Sahara	732	f	\N	t
68	SPAIN	ES	ESP	Spain	724	t	\N	t
69	ETHIOPIA	ET	ETH	Ethiopia	231	t	\N	t
70	FINLAND	FI	FIN	Finland	246	t	\N	t
72	FALKLAND ISLANDS (MALVINAS)	FK	FLK	Falkland Islands (Malvinas)	238	f	\N	t
73	MICRONESIA, FEDERATED STATES OF	FM	FSM	Micronesia, Federated States of	583	t	\N	t
74	FAROE ISLANDS	FO	FRO	Faroe Islands	234	f	\N	t
75	FRANCE	FR	FRA	France	250	t	\N	t
76	GABON	GA	GAB	Gabon	266	t	\N	t
77	UNITED KINGDOM	GB	GBR	United Kingdom	826	t	\N	t
79	GEORGIA	GE	GEO	Georgia	268	t	\N	t
80	FRENCH GUIANA	GF	GUF	French Guiana	254	f	\N	t
81	GUERNSEY	GG	GGY	Guernsey	831	f	\N	t
83	GIBRALTAR	GI	GIB	Gibraltar	292	f	\N	t
84	GREENLAND	GL	GRL	Greenland	304	t	\N	t
87	GUADELOUPE	GP	GLP	Guadeloupe	312	f	\N	t
89	GREECE	GR	GRC	Greece	300	t	\N	t
90	SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS	GS	SGS	South Georgia and the South Sandwich Islands	239	f	\N	t
91	GUATEMALA	GT	GTM	Guatemala	320	t	\N	t
92	GUAM	GU	GUM	Guam	316	f	\N	t
93	GUINEA-BISSAU	GW	GNB	Guinea-Bissau	624	t	\N	t
96	HEARD ISLAND AND MCDONALD ISLANDS	HM	HMD	Heard Island and McDonald Islands	334	f	\N	t
97	HONDURAS	HN	HND	Honduras	340	t	\N	t
98	CROATIA	HR	HRV	Croatia	191	t	\N	t
99	HAITI	HT	HTI	Haiti	332	t	\N	t
100	HUNGARY	HU	HUN	Hungary	348	t	\N	t
101	INDONESIA	ID	IDN	Indonesia	360	t	\N	t
103	ISRAEL	IL	ISR	Israel	376	t	\N	t
104	ISLE OF MAN	IM	IMN	Isle of Man	833	f	\N	t
105	INDIA	IN	IND	India	356	t	\N	t
106	BRITISH INDIAN OCEAN TERRITORY	IO	IOT	British Indian Ocean Territory	86	f	\N	t
107	IRAQ	IQ	IRQ	Iraq	368	t	\N	t
108	IRAN, ISLAMIC REPUBLIC OF	IR	IRN	Iran, Islamic Republic of	364	t	\N	t
109	ICELAND	IS	ISL	Iceland	352	t	\N	t
110	ITALY	IT	ITA	Italy	380	t	\N	t
111	JERSEY	JE	JEY	Jersey	832	f	\N	t
112	JAMAICA	JM	JAM	Jamaica	388	t	\N	t
113	JORDAN	JO	JOR	Jordan	400	t	\N	t
114	JAPAN	JP	JPN	Japan	392	t	\N	t
115	KENYA	KE	KEN	Kenya	404	t	\N	t
116	KYRGYZSTAN	KG	KGZ	Kyrgyzstan	417	t	\N	t
117	CAMBODIA	KH	KHM	Cambodia	116	t	\N	t
122	KOREA, REPUBLIC OF	KR	KOR	Korea, Republic of	410	t	\N	t
123	KUWAIT	KW	KWT	Kuwait	414	t	\N	t
124	CAYMAN ISLANDS	KY	CYM	Cayman Islands	136	f	\N	t
125	KAZAKHSTAN	KZ	KAZ	Kazakhstan	398	t	\N	t
126	LAO PEOPLE'S DEMOCRATIC REPUBLIC	LA	LAO	Lao People's Democratic Republic	418	t	\N	t
127	LEBANON	LB	LBN	Lebanon	422	t	\N	t
129	LIECHTENSTEIN	LI	LIE	Liechtenstein	438	t	\N	t
130	SRI LANKA	LK	LKA	Sri Lanka	144	t	\N	t
131	LIBERIA	LR	LBR	Liberia	430	t	\N	t
132	LESOTHO	LS	LSO	Lesotho	426	t	\N	t
133	LITHUANIA	LT	LTU	Lithuania	440	t	\N	t
134	LUXEMBOURG	LU	LUX	Luxembourg	442	t	\N	t
135	LATVIA	LV	LVA	Latvia	428	t	\N	t
137	MOROCCO	MA	MAR	Morocco	504	t	\N	t
138	MONACO	MC	MCO	Monaco	492	t	\N	t
139	MOLDOVA, REPUBLIC OF	MD	MDA	Moldova, Republic of	498	t	\N	t
140	MONTENEGRO	ME	MNE	Montenegro	499	t	\N	t
141	SAINT MARTIN (FRENCH PART)	MF	MAF	Saint Martin (French part)	663	f	\N	t
142	MADAGASCAR	MG	MDG	Madagascar	450	t	\N	t
143	MARSHALL ISLANDS	MH	MHL	Marshall Islands	584	t	\N	t
144	MACEDONIA, REPUBLIC OF	MK	MKD	Macedonia, Republic of	807	t	\N	t
146	MYANMAR	MM	MMR	Myanmar	104	t	\N	t
147	MONGOLIA	MN	MNG	Mongolia	496	t	\N	t
149	NORTHERN MARIANA ISLANDS	MP	MNP	Northern Mariana Islands	580	f	\N	t
150	MARTINIQUE	MQ	MTQ	Martinique	474	f	\N	t
152	MONTSERRAT	MS	MSR	Montserrat	500	f	\N	t
153	MALTA	MT	MLT	Malta	470	t	\N	t
154	MAURITIUS	MU	MUS	Mauritius	480	t	\N	t
155	MALDIVES	MV	MDV	Maldives	462	t	\N	t
157	MEXICO	MX	MEX	Mexico	484	t	\N	t
158	MALAYSIA	MY	MYS	Malaysia	458	t	\N	t
159	MOZAMBIQUE	MZ	MOZ	Mozambique	508	t	\N	t
160	NAMIBIA	NA	NAM	Namibia	516	t	\N	t
161	NEW CALEDONIA	NC	NCL	New Caledonia	540	f	\N	t
162	NIGER	NE	NER	Niger	562	t	\N	t
163	NORFOLK ISLAND	NF	NFK	Norfolk Island	574	f	\N	t
164	NIGERIA	NG	NGA	Nigeria	566	t	\N	t
165	NICARAGUA	NI	NIC	Nicaragua	558	t	\N	t
166	NETHERLANDS	NL	NLD	Netherlands	528	t	\N	t
167	NORWAY	NO	NOR	Norway	578	t	\N	t
168	NEPAL	NP	NPL	Nepal	524	t	\N	t
171	NEW ZEALAND	NZ	NZL	New Zealand	554	t	\N	t
172	OMAN	OM	OMN	Oman	512	t	\N	t
174	PERU	PE	PER	Peru	604	t	\N	t
175	FRENCH POLYNESIA	PF	PYF	French Polynesia	258	f	\N	t
176	PAPUA NEW GUINEA	PG	PNG	Papua New Guinea	598	t	\N	t
177	PHILIPPINES	PH	PHL	Philippines	608	t	\N	t
178	PAKISTAN	PK	PAK	Pakistan	586	t	\N	t
179	POLAND	PL	POL	Poland	616	t	\N	t
180	SAINT PIERRE AND MIQUELON	PM	SPM	Saint Pierre and Miquelon	666	f	\N	t
181	PITCAIRN	PN	PCN	Pitcairn	612	f	\N	t
182	PALESTINE, STATE OF	PS	PSE	Palestine, State of	275	t	\N	t
183	PORTUGAL	PT	PRT	Portugal	620	t	\N	t
184	PALAU	PW	PLW	Palau	585	t	\N	t
185	PARAGUAY	PY	PRY	Paraguay	600	t	\N	t
187	RÉUNION	RE	REU	Réunion	638	f	\N	t
188	ROMANIA	RO	ROU	Romania	642	t	\N	t
189	SERBIA	RS	SRB	Serbia	688	t	\N	t
190	RUSSIAN FEDERATION	RU	RUS	Russian Federation	643	t	\N	t
192	SAUDI ARABIA	SA	SAU	Saudi Arabia	682	t	\N	t
195	SUDAN	SD	SDN	Sudan	729	t	\N	t
196	SWEDEN	SE	SWE	Sweden	752	t	\N	t
197	SINGAPORE	SG	SGP	Singapore	534	t	\N	t
102	IRELAND	IE	IRL	Ireland	372	t	\N	f
198	SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA	SH	SHN	Saint Helena, Ascension and Tristan da Cunha	654	t	\N	t
199	SLOVENIA	SI	SVN	Slovenia	705	t	\N	t
200	SVALBARD AND JAN MAYEN	SJ	SJM	Svalbard and Jan Mayen	744	f	\N	t
201	SLOVAKIA	SK	SVK	Slovakia	703	t	\N	t
203	SAN MARINO	SM	SMR	San Marino	674	t	\N	t
204	SENEGAL	SN	SEN	Senegal	686	t	\N	t
207	SOUTH SUDAN	SS	SSD	South Sudan	728	t	\N	t
209	EL SALVADOR	SV	SLV	El Salvador	222	t	\N	t
210	SINT MAARTEN (DUTCH PART)	SX	SXM	Sint Maarten (Dutch part)	534	f	\N	t
212	SWAZILAND	SZ	SWZ	Swaziland	748	t	\N	t
213	TURKS AND CAICOS ISLANDS	TC	TCA	Turks and Caicos Islands	796	f	\N	t
214	CHAD	TD	TCD	Chad	148	t	\N	t
217	THAILAND	TH	THA	Thailand	764	t	\N	t
218	TAJIKISTAN	TJ	TJK	Tajikistan	762	t	\N	t
221	TURKMENISTAN	TM	TKM	Turkmenistan	795	t	\N	t
222	TUNISIA	TN	TUN	Tunisia	788	t	\N	t
224	TURKEY	TR	TUR	Turkey	792	t	\N	t
225	TRINIDAD AND TOBAGO	TT	TTO	Trinidad and Tobago	780	t	\N	t
227	TAIWAN	TW	TWN	Taiwan	158	t	\N	t
229	UKRAINE	UA	UKR	Ukraine	804	t	\N	t
231	UNITED STATES MINOR OUTLYING ISLANDS	UM	UMI	United States Minor Outlying Islands	581	t	\N	t
232	UNITED STATES	US	USA	United States	840	t	\N	t
233	URUGUAY	UY	URY	Uruguay	858	t	\N	t
234	UZBEKISTAN	UZ	UZB	Uzbekistan	860	t	\N	t
235	HOLY SEE (VATICAN CITY STATE)	VA	VAT	Holy See (Vatican City State)	336	f	\N	t
236	SAINT VINCENT AND THE GRENADINES	VC	VCT	Saint Vincent and the Grenadines	670	t	\N	t
237	VENEZUELA, BOLIVARIAN REPUBLIC OF	VE	VEN	Venezuela, Bolivarian Republic of	862	t	\N	t
238	VIRGIN ISLANDS, BRITISH	VG	VGB	Virgin Islands, British	92	f	\N	t
239	VIRGIN ISLANDS, U.S.	VI	VIR	Virgin Islands, U.S.	850	f	\N	t
240	VIETNAM	VN	VNM	Vietnam	704	t	\N	t
242	WALLIS AND FUTUNA	WF	WLF	Wallis and Futuna	876	f	\N	t
243	SAMOA	WS	WSM	Samoa	882	t	\N	t
245	MAYOTTE	YT	MYT	Mayotte	175	f	\N	t
246	SOUTH AFRICA	ZA	ZAF	South Africa	710	t	\N	t
247	ZAMBIA	ZM	ZMB	Zambia	894	t	\N	t
2	UNITED ARAB EMIRATES	AE	ARE	United Arab Emirates	784	t	\N	f
4	ANTIGUA AND BARBUDA	AG	ATG	Antigua and Barbuda	28	t	\N	f
8	ANGOLA	AO	AGO	Angola	24	t	\N	f
14	ARUBA	AW	ABW	Aruba	533	f	\N	f
21	BURKINA FASO	BF	BFA	Burkina Faso	854	t	\N	f
24	BURUNDI	BI	BDI	Burundi	108	t	\N	f
25	BENIN	BJ	BEN	Benin	204	t	\N	f
27	BERMUDA	BM	BMU	Bermuda	60	f	\N	f
29	BOLIVIA, PLURINATIONAL STATE OF	BO	BOL	Bolivia, Plurinational State of	68	t	\N	f
32	BAHAMAS	BS	BHS	Bahamas	44	t	\N	f
35	BOTSWANA	BW	BWA	Botswana	72	t	\N	f
37	BELIZE	BZ	BLZ	Belize	84	t	\N	f
40	CONGO, THE DEMOCRATIC REPUBLIC OF THE	CD	COD	Congo, The Democratic Republic of the	180	t	\N	f
41	CENTRAL AFRICAN REPUBLIC	CF	CAF	Central African Republic	140	t	\N	f
42	CONGO	CG	COG	Congo	178	t	\N	f
44	CÔTE D'IVOIRE	CI	CIV	Côte d'Ivoire	384	t	\N	f
45	COOK ISLANDS	CK	COK	Cook Islands	184	f	\N	f
47	CAMEROON	CM	CMR	Cameroon	120	t	\N	f
58	DJIBOUTI	DJ	DJI	Djibouti	262	t	\N	f
60	DOMINICA	DM	DMA	Dominica	212	t	\N	f
67	ERITREA	ER	ERI	Eritrea	232	t	\N	f
71	FIJI	FJ	FJI	Fiji	242	t	\N	f
78	GRENADA	GD	GRD	Grenada	308	t	\N	f
82	GHANA	GH	GHA	Ghana	288	t	\N	f
85	GAMBIA	GM	GMB	Gambia	270	t	\N	f
86	GUINEA	GN	GIN	Guinea	324	t	\N	f
88	EQUATORIAL GUINEA	GQ	GNQ	Equatorial Guinea	226	t	\N	f
94	GUYANA	GY	GUY	Guyana	328	t	\N	f
95	HONG KONG	HK	HKG	Hong Kong	344	f	\N	f
118	KIRIBATI	KI	KIR	Kiribati	296	t	\N	f
119	COMOROS	KM	COM	Comoros	174	t	\N	f
120	SAINT KITTS AND NEVIS	KN	KNA	Saint Kitts and Nevis	659	t	\N	f
121	KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF	KP	PRK	Korea, Democratic People's Republic of	408	t	\N	f
128	SAINT LUCIA	LC	LCA	Saint Lucia	662	f	\N	f
136	LIBYA	LY	LBY	Libya	434	t	\N	f
145	MALI	ML	MLI	Mali	466	t	\N	f
148	MACAO	MO	MAC	Macao	446	f	\N	f
151	MAURITANIA	MR	MRT	Mauritania	478	t	\N	f
156	MALAWI	MW	MWI	Malawi	454	t	\N	f
169	NAURU	NR	NRU	Nauru	520	t	\N	f
170	NIUE	NU	NIU	Niue	570	f	\N	f
173	PANAMA	PA	PAN	Panama	591	t	\N	f
186	QATAR	QA	QAT	Qatar	634	t	\N	f
191	RWANDA	RW	RWA	Rwanda	646	t	\N	f
205	SOMALIA	SO	SOM	Somalia	706	t	\N	f
193	SOLOMON ISLANDS	SB	SLB	Solomon Islands	90	t	\N	f
194	SEYCHELLES	SC	SYC	Seychelles	690	t	\N	f
202	SIERRA LEONE	SL	SLE	Sierra Leone	694	t	\N	f
206	SURINAME	SR	SUR	Suriname	740	t	\N	f
208	SAO TOME AND PRINCIPE	ST	STP	Sao Tome and Principe	678	t	\N	f
211	SYRIAN ARAB REPUBLIC	SY	SYR	Syrian Arab Republic	760	t	\N	f
215	FRENCH SOUTHERN TERRITORIES	TF	ATF	French Southern Territories	260	f	\N	f
216	TOGO	TG	TGO	Togo	768	t	\N	f
219	TOKELAU	TK	TKL	Tokelau	772	f	\N	f
220	TIMOR-LESTE	TL	TLS	Timor-Leste	626	t	\N	f
223	TONGA	TO	TON	Tonga	776	t	\N	f
226	TUVALU	TV	TUV	Tuvalu	798	t	\N	f
228	TANZANIA, UNITED REPUBLIC OF	TZ	TZA	Tanzania, United Republic of	834	t	\N	f
230	UGANDA	UG	UGA	Uganda	800	t	\N	f
241	VANUATU	VU	VUT	Vanuatu	548	t	\N	f
244	YEMEN	YE	YEM	Yemen	887	t	\N	f
248	ZIMBABWE	ZW	ZWE	Zimbabwe	716	t	\N	f
\.


--
-- Name: spree_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_countries_id_seq', 248, true);


--
-- Data for Name: spree_credit_cards; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_credit_cards (id, month, year, cc_type, last_digits, address_id, gateway_customer_profile_id, gateway_payment_profile_id, created_at, updated_at, name, user_id, payment_method_id, "default") FROM stdin;
1	12	2019	visa	1111	\N	BGS-1234	\N	2017-11-15 10:04:49.794616	2017-11-15 10:04:49.794616	Sean Schofield	\N	\N	f
\.


--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_credit_cards_id_seq', 1, true);


--
-- Data for Name: spree_customer_returns; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_customer_returns (id, number, stock_location_id, created_at, updated_at) FROM stdin;
1	CR027908717	1	2017-11-25 13:52:38.786408	2017-11-25 13:54:34.752462
\.


--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_customer_returns_id_seq', 1, true);


--
-- Data for Name: spree_delivery_slots; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_delivery_slots (id, shipping_method_id, start_time, end_time, deleted_at, created_at, updated_at) FROM stdin;
1	6	8:00am	1:00pm	2017-11-15 12:23:57.913006	2017-11-15 12:17:21.482473	2017-11-15 12:23:57.913049
2	6	2:00pm	5:00pm	2017-11-15 12:23:57.914235	2017-11-15 12:17:21.535915	2017-11-15 12:23:57.91426
3	6	6:00pm	9:00pm	2017-11-15 12:23:57.915307	2017-11-15 12:17:21.537999	2017-11-15 12:23:57.915345
7	7	18:00:00.000	21:00:00.000	\N	2017-11-15 12:29:14.63075	2017-11-15 12:29:14.63075
4	7	6:00pm	9:00pm	2017-11-15 12:29:14.634655	2017-11-15 12:25:18.34201	2017-11-15 12:25:18.34201
8	7	13:00:00.000	17:00:00.000	\N	2017-11-15 12:29:14.63676	2017-11-15 12:29:14.63676
5	7	1:00pm	5:00pm	2017-11-15 12:29:14.639414	2017-11-15 12:25:18.344142	2017-11-15 12:25:18.344142
9	7	08:00:00.000	12:00:00.000	\N	2017-11-15 12:29:14.64162	2017-11-15 12:29:14.64162
6	7	8:00am	12:00 PM	2017-11-15 12:29:14.643816	2017-11-15 12:25:18.346204	2017-11-15 12:25:18.346204
\.


--
-- Name: spree_delivery_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_delivery_slots_id_seq', 9, true);


--
-- Data for Name: spree_gateways; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_gateways (id, type, name, description, active, environment, server, test_mode, created_at, updated_at, preferences) FROM stdin;
\.


--
-- Name: spree_gateways_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_gateways_id_seq', 1, false);


--
-- Data for Name: spree_inventory_units; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_inventory_units (id, state, variant_id, order_id, shipment_id, created_at, updated_at, pending, line_item_id) FROM stdin;
1	on_hand	1	1	1	2017-11-15 10:04:49.307506	2017-11-15 10:04:49.307506	t	1
2	on_hand	2	2	2	2017-11-15 10:04:49.470997	2017-11-15 10:04:49.470997	t	2
4	on_hand	7	3	4	2017-11-15 12:25:54.261214	2017-11-15 12:27:34.349526	f	3
5	on_hand	14	4	5	2017-11-25 13:01:58.608229	2017-11-25 13:03:21.451546	f	4
6	returned	1	5	6	2017-11-25 13:35:01.377668	2017-11-25 13:52:38.807879	f	5
7	on_hand	1	5	7	2017-11-25 13:54:34.579005	2017-11-25 13:54:34.65493	f	5
8	on_hand	6	6	8	2017-11-25 14:30:46.413785	2017-11-25 14:31:16.883539	f	6
10	on_hand	13	8	10	2017-11-28 14:32:32.525123	2017-11-28 14:32:32.525123	t	9
11	on_hand	2	7	11	2017-12-06 10:48:48.651049	2017-12-06 10:48:48.651049	t	7
12	on_hand	16	7	11	2017-12-06 10:48:48.658473	2017-12-06 10:48:48.658473	t	11
\.


--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_inventory_units_id_seq', 12, true);


--
-- Data for Name: spree_line_items; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_line_items (id, variant_id, order_id, quantity, price, created_at, updated_at, currency, cost_price, tax_category_id, adjustment_total, additional_tax_total, promo_total, included_tax_total, pre_tax_amount, taxable_adjustment_total, non_taxable_adjustment_total) FROM stdin;
1	1	1	1	15.99	2017-11-15 10:04:48.759303	2017-11-15 10:04:48.872744	USD	17.00	1	0.00	0.00	0.00	0.00	15.9900	0.00	0.00
2	2	2	1	22.99	2017-11-15 10:04:48.936603	2017-11-15 10:04:50.323827	USD	21.00	1	1.15	1.15	0.00	0.00	22.9900	0.00	0.00
3	7	3	1	19.99	2017-11-15 12:20:13.036789	2017-11-15 12:27:34.282732	USD	17.00	1	1.00	1.00	0.00	0.00	19.9900	0.00	0.00
5	1	5	1	15.99	2017-11-25 13:34:51.778262	2017-11-25 13:52:38.934688	USD	17.00	3	1.12	1.12	0.00	0.00	15.9900	0.00	0.00
4	14	4	1	16.99	2017-11-25 13:01:46.305043	2017-11-25 13:03:21.321051	USD	15.00	1	0.85	0.85	0.00	0.00	16.9900	0.00	0.00
6	6	6	1	19.99	2017-11-25 14:30:32.09906	2017-11-25 14:31:16.72701	USD	17.00	1	1.00	1.00	0.00	0.00	19.9900	0.00	0.00
9	13	8	1	13.99	2017-11-28 14:27:23.186875	2017-11-28 14:32:50.575944	USD	11.00	3	0.98	0.98	0.00	0.00	13.9900	0.00	0.00
10	16	9	1	13.99	2017-11-29 09:30:55.979349	2017-11-29 09:30:56.300367	USD	11.00	3	0.00	0.00	0.00	0.00	13.9900	0.00	0.00
7	2	7	1	22.99	2017-11-28 13:23:01.631087	2017-12-06 10:48:52.244099	USD	21.00	3	1.61	1.61	0.00	0.00	22.9900	0.00	0.00
11	16	7	1	13.99	2017-12-06 10:48:37.589937	2017-12-06 10:48:52.294272	USD	11.00	3	0.98	0.98	0.00	0.00	13.9900	0.00	0.00
\.


--
-- Name: spree_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_line_items_id_seq', 11, true);


--
-- Data for Name: spree_log_entries; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_log_entries (id, source_type, source_id, details, created_at, updated_at) FROM stdin;
1	Spree::Payment	3	--- !ruby/object:ActiveMerchant::Billing::Response\nparams: {}\nmessage: ''\nsuccess: true\ntest: false\nauthorization: \nfraud_review: \nerror_code: \nemv_authorization: \navs_result:\n  code: \n  message: \n  street_match: \n  postal_match: \ncvv_result:\n  code: \n  message: \n	2017-11-25 11:54:53.066998	2017-11-25 11:54:53.066998
2	Spree::Payment	4	--- !ruby/object:ActiveMerchant::Billing::Response\nparams: {}\nmessage: ''\nsuccess: true\ntest: false\nauthorization: \nfraud_review: \nerror_code: \nemv_authorization: \navs_result:\n  code: \n  message: \n  street_match: \n  postal_match: \ncvv_result:\n  code: \n  message: \n	2017-11-25 13:04:21.427852	2017-11-25 13:04:21.427852
\.


--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_log_entries_id_seq', 2, true);


--
-- Data for Name: spree_loyalty_points_transactions; Type: TABLE DATA; Schema: public; Owner: e9comm
--

COPY spree_loyalty_points_transactions (id, loyalty_points, type, user_id, source_id, created_at, updated_at, source_type, balance, comment, transaction_id) FROM stdin;
1	10	Spree::LoyaltyPointsCreditTransaction	1	3	2017-11-25 13:21:08.614643	2017-11-25 13:21:08.614643	Spree::Order	10	Diwali Gift	1511616068863249
2	450	Spree::LoyaltyPointsCreditTransaction	1	4	2017-11-25 13:28:50.304002	2017-11-25 13:28:50.304002	Spree::Order	460	For prime member\r\n	1511616530700926
3	6	Spree::LoyaltyPointsDebitTransaction	1	5	2017-11-25 13:36:11.627444	2017-11-25 13:36:11.627444	Spree::Order	454	\N	1511616971200703
4	7	Spree::LoyaltyPointsDebitTransaction	1	6	2017-11-25 14:31:18.253101	2017-11-25 14:31:18.253101	Spree::Order	447	\N	1511620278253508
\.


--
-- Name: spree_loyalty_points_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e9comm
--

SELECT pg_catalog.setval('spree_loyalty_points_transactions_id_seq', 4, true);


--
-- Data for Name: spree_marketing_campaigns; Type: TABLE DATA; Schema: public; Owner: e9comm
--

COPY spree_marketing_campaigns (id, uid, mailchimp_type, name, stats, list_id, scheduled_at) FROM stdin;
\.


--
-- Name: spree_marketing_campaigns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e9comm
--

SELECT pg_catalog.setval('spree_marketing_campaigns_id_seq', 1, false);


--
-- Data for Name: spree_marketing_contacts; Type: TABLE DATA; Schema: public; Owner: e9comm
--

COPY spree_marketing_contacts (id, mailchimp_id, uid, email, active, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Name: spree_marketing_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e9comm
--

SELECT pg_catalog.setval('spree_marketing_contacts_id_seq', 1, false);


--
-- Data for Name: spree_marketing_contacts_lists; Type: TABLE DATA; Schema: public; Owner: e9comm
--

COPY spree_marketing_contacts_lists (id, contact_id, list_id, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_marketing_contacts_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e9comm
--

SELECT pg_catalog.setval('spree_marketing_contacts_lists_id_seq', 1, false);


--
-- Data for Name: spree_marketing_lists; Type: TABLE DATA; Schema: public; Owner: e9comm
--

COPY spree_marketing_lists (id, uid, name, active, type, created_at, updated_at, entity_type, entity_id, searched_keyword, deleted_at) FROM stdin;
\.


--
-- Name: spree_marketing_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e9comm
--

SELECT pg_catalog.setval('spree_marketing_lists_id_seq', 1, false);


--
-- Data for Name: spree_marketing_recipients; Type: TABLE DATA; Schema: public; Owner: e9comm
--

COPY spree_marketing_recipients (id, campaign_id, contact_id, email_opened_at) FROM stdin;
\.


--
-- Name: spree_marketing_recipients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e9comm
--

SELECT pg_catalog.setval('spree_marketing_recipients_id_seq', 1, false);


--
-- Data for Name: spree_option_type_prototypes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_option_type_prototypes (id, prototype_id, option_type_id) FROM stdin;
\.


--
-- Name: spree_option_type_prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_option_type_prototypes_id_seq', 1, false);


--
-- Data for Name: spree_option_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_option_types (id, name, presentation, "position", created_at, updated_at) FROM stdin;
1	tshirt-size	Size	1	2017-11-15 10:04:24.995442	2017-11-15 10:04:25.211229
2	tshirt-color	Color	2	2017-11-15 10:04:25.028803	2017-11-15 13:28:41.974885
\.


--
-- Name: spree_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_option_types_id_seq', 2, true);


--
-- Data for Name: spree_option_value_variants; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_option_value_variants (id, variant_id, option_value_id) FROM stdin;
1	17	1
3	18	1
5	19	1
6	19	6
7	20	2
8	20	5
9	21	2
10	21	7
11	22	2
12	22	6
13	23	3
14	23	5
15	24	3
16	24	7
17	25	3
18	25	6
19	26	4
20	26	6
21	17	7
22	18	8
\.


--
-- Name: spree_option_value_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_option_value_variants_id_seq', 22, true);


--
-- Data for Name: spree_option_values; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_option_values (id, "position", name, presentation, option_type_id, created_at, updated_at) FROM stdin;
1	1	Small	S	1	2017-11-15 10:04:25.084995	2017-11-15 10:04:25.084995
2	2	Medium	M	1	2017-11-15 10:04:25.137939	2017-11-15 10:04:25.137939
3	3	Large	L	1	2017-11-15 10:04:25.168957	2017-11-15 10:04:25.168957
4	4	Extra Large	XL	1	2017-11-15 10:04:25.203996	2017-11-15 10:04:25.203996
5	1	Red	Red	2	2017-11-15 10:04:25.234812	2017-11-15 10:04:25.234812
6	2	Green	Green	2	2017-11-15 10:04:25.278386	2017-11-15 10:04:25.278386
7	3	Blue	Blue	2	2017-11-15 10:04:25.320866	2017-11-15 10:04:25.320866
8	4	Grey	Grey	2	2017-11-15 13:28:41.970516	2017-11-15 13:28:41.970516
\.


--
-- Name: spree_option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_option_values_id_seq', 8, true);


--
-- Data for Name: spree_order_promotions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_order_promotions (id, order_id, promotion_id) FROM stdin;
\.


--
-- Name: spree_order_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_order_promotions_id_seq', 1, false);


--
-- Data for Name: spree_orders; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_orders (id, number, item_total, total, state, adjustment_total, user_id, completed_at, bill_address_id, ship_address_id, payment_total, shipment_state, payment_state, email, special_instructions, created_at, updated_at, currency, last_ip_address, created_by_id, shipment_total, additional_tax_total, promo_total, channel, included_tax_total, item_count, approver_id, approved_at, confirmation_delivered, considered_risky, guest_token, canceled_at, canceler_id, store_id, state_lock_version, taxable_adjustment_total, non_taxable_adjustment_total, paid_at) FROM stdin;
1	R123456789	15.99	16.79	complete	0.80	\N	2017-11-14 10:04:49.500942	\N	\N	0.00	pending	balance_due	spree@example.com	\N	2017-11-15 10:04:48.62268	2017-11-15 10:04:50.24456	USD	\N	\N	0.00	0.00	0.00	spree	0.00	1	\N	\N	f	f	hLnQGAKA8VkdwRcNtpSVCA1510740288623	\N	\N	\N	0	0.00	0.00	\N
2	R987654321	22.99	30.35	complete	2.36	\N	2017-11-14 10:04:49.550626	2	1	0.00	pending	balance_due	spree@example.com	\N	2017-11-15 10:04:48.685907	2017-11-15 10:04:50.882906	USD	\N	\N	5.00	1.15	0.00	spree	0.00	1	\N	\N	f	f	qcEniC2eKPz2rbCOXetr3g1510740288686	\N	\N	\N	0	0.00	0.00	\N
3	R782247625	19.99	20.99	complete	1.00	1	2017-11-15 12:27:34.518202	3	4	20.99	ready	paid	admin@ecomm9.com	\N	2017-11-15 12:20:12.874363	2017-11-25 11:54:53.292663	USD	127.0.0.1	1	0.00	1.00	0.00	spree	0.00	1	\N	\N	t	f	vfpdOIdeR9p3_nAud1TP3Q1510409614881	\N	\N	1	4	0.00	0.00	2017-11-25 11:54:53.299671
6	R422947407	19.99	31.69	complete	1.70	1	2017-11-25 14:31:17.082483	5	6	31.69	ready	paid	admin@ecomm9.com	\N	2017-11-25 14:30:31.922398	2017-11-25 14:31:18.20114	USD	127.0.0.1	1	10.00	1.70	0.00	spree	0.00	1	\N	\N	t	f	WfFAUmSzUNSybvslqUjL-w1511446991950	\N	\N	1	3	0.00	0.00	2017-11-25 14:31:18.210145
5	R982909338	15.99	27.81	returned	1.82	1	2017-11-25 13:36:11.151232	5	6	27.81	shipped	paid	admin@ecomm9.com	\N	2017-11-25 13:34:51.609015	2017-11-25 13:54:34.601747	USD	127.0.0.1	1	10.00	1.82	0.00	spree	0.00	1	\N	\N	t	f	WfFAUmSzUNSybvslqUjL-w1511446991950	\N	\N	1	3	0.00	0.00	2017-11-25 13:36:11.608585
4	R576880873	16.99	28.54	complete	1.55	1	2017-11-25 13:03:21.615623	5	6	28.54	ready	paid	admin@ecomm9.com	\N	2017-11-25 13:01:46.094582	2017-11-25 13:04:21.623484	USD	127.0.0.1	1	10.00	1.55	0.00	spree	0.00	1	\N	\N	t	f	WfFAUmSzUNSybvslqUjL-w1511446991950	\N	\N	1	3	0.00	0.00	2017-11-25 13:04:21.630571
8	R505469464	13.99	25.67	payment	1.68	2	\N	7	8	0.00	\N	\N	customer@ecomm9.com	\N	2017-11-28 13:37:18.095028	2017-11-28 14:32:50.675895	USD	127.0.0.1	2	10.00	1.68	0.00	spree	0.00	1	\N	\N	f	f	ttiWboz4MDcmyt3DPmTl-Q1511876202100	\N	\N	1	2	0.00	0.00	\N
9	R686357479	13.99	13.99	address	0.00	7	\N	\N	\N	0.00	\N	\N	test@ecomm9.com	\N	2017-11-29 09:30:55.705364	2017-11-29 09:31:04.622257	USD	127.0.0.1	7	0.00	0.00	0.00	spree	0.00	1	\N	\N	f	f	W25U61odIU17JYQCJvo7xQ1511947845173	\N	\N	1	0	0.00	0.00	\N
7	R328857619	36.98	50.27	payment	3.29	1	\N	5	6	0.00	\N	\N	admin@ecomm9.com	\N	2017-11-28 13:23:01.466871	2017-12-06 10:48:52.388245	USD	127.0.0.1	1	10.00	3.29	0.00	spree	0.00	2	\N	\N	f	f	WfFAUmSzUNSybvslqUjL-w1511446991950	\N	\N	1	3	0.00	0.00	\N
\.


--
-- Name: spree_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_orders_id_seq', 9, true);


--
-- Data for Name: spree_page_events; Type: TABLE DATA; Schema: public; Owner: e9comm
--

COPY spree_page_events (id, actor_type, actor_id, target_type, target_id, activity, referrer, search_keywords, session_id, query_string, created_at, updated_at) FROM stdin;
1	\N	\N	\N	\N	index	\N		2c0adee2c29b30c1f566f5a43dd6ea77		2017-11-28 13:10:30.715865	2017-11-28 13:10:30.715865
2	\N	\N	\N	\N	index	\N		e74029baf240d0a52247ff81cc6ba2fe		2017-11-28 13:15:20.572338	2017-11-28 13:15:20.572338
3	\N	\N	\N	\N	index	\N		2c0adee2c29b30c1f566f5a43dd6ea77		2017-11-28 13:15:25.638449	2017-11-28 13:15:25.638449
4	Spree::User	1	\N	\N	index	\N		df1faf423a8a31dc9f380f6523bfc535		2017-11-28 13:22:01.598204	2017-11-28 13:22:01.598204
5	Spree::User	1	\N	\N	index	http://localhost:3000/		df1faf423a8a31dc9f380f6523bfc535		2017-11-28 13:22:04.937679	2017-11-28 13:22:04.937679
6	Spree::User	1	\N	\N	index	http://localhost:3000/admin/marketing/lists		df1faf423a8a31dc9f380f6523bfc535		2017-11-28 13:22:46.624497	2017-11-28 13:22:46.624497
7	Spree::User	1	Spree::Product	2	view	http://localhost:3000/	\N	df1faf423a8a31dc9f380f6523bfc535		2017-11-28 13:22:53.918021	2017-11-28 13:22:53.918021
8	\N	\N	\N	\N	index	http://localhost:3000/cart		10e9206615bd77d59b874feef7673d99		2017-11-28 13:23:29.269286	2017-11-28 13:23:29.269286
9	Spree::User	1	\N	\N	index	http://localhost:3000/admin/marketing/lists		5b551d78f500942272cff3769b6e7e00		2017-11-28 13:24:47.701542	2017-11-28 13:24:47.701542
10	Spree::User	1	\N	\N	index	http://localhost:3000/admin/marketing/lists		5b551d78f500942272cff3769b6e7e00		2017-11-28 13:34:37.93947	2017-11-28 13:34:37.93947
11	Spree::User	1	\N	\N	index	http://localhost:3000/admin/orders		5b551d78f500942272cff3769b6e7e00		2017-11-28 13:35:01.760132	2017-11-28 13:35:01.760132
12	\N	\N	\N	\N	index	http://localhost:3000/checkout/delivery		9caa618254ec01dea2fc086ee2975610		2017-11-28 13:35:30.362736	2017-11-28 13:35:30.362736
13	\N	\N	\N	\N	index	http://localhost:3000/admin/orders		ee34a3aaa3e84187993d07699c2d3923		2017-11-28 13:36:42.815728	2017-11-28 13:36:42.815728
14	Spree::User	2	\N	\N	index	http://localhost:3000/login		7b0b2041c86666341c2bf462ff92dd66		2017-11-28 13:37:10.932468	2017-11-28 13:37:10.932468
15	Spree::User	2	Spree::Product	14	view	http://localhost:3000/	\N	7b0b2041c86666341c2bf462ff92dd66		2017-11-28 13:37:16.184341	2017-11-28 13:37:16.184341
16	\N	\N	\N	\N	index	http://localhost:3000/checkout/address		2aa1768e2bd93dfa3f604c03850d0ecf		2017-11-28 13:37:25.555797	2017-11-28 13:37:25.555797
17	Spree::User	1	\N	\N	index	http://localhost:3000/checkout/delivery		5fdc618bdfceb9bc02bf7d9ae3381dd3		2017-11-28 13:39:50.642275	2017-11-28 13:39:50.642275
18	Spree::User	1	\N	\N	index	\N		5fdc618bdfceb9bc02bf7d9ae3381dd3		2017-11-28 13:41:04.045309	2017-11-28 13:41:04.045309
19	Spree::User	1	\N	\N	index	http://localhost:3000/admin/marketing/lists		5fdc618bdfceb9bc02bf7d9ae3381dd3		2017-11-28 14:10:38.719475	2017-11-28 14:10:38.719475
20	Spree::User	1	\N	\N	search	http://localhost:3000/	puma	5fdc618bdfceb9bc02bf7d9ae3381dd3	utf8=%E2%9C%93&taxon=&keywords=puma	2017-11-28 14:11:43.162251	2017-11-28 14:11:43.162251
21	Spree::User	1	\N	\N	search	http://localhost:3000/products?utf8=%E2%9C%93&taxon=&keywords=puma	puma	5fdc618bdfceb9bc02bf7d9ae3381dd3	utf8=%E2%9C%93&taxon=&keywords=puma	2017-11-28 14:11:49.535606	2017-11-28 14:11:49.535606
22	Spree::User	1	\N	\N	search	http://localhost:3000/products?utf8=%E2%9C%93&taxon=&keywords=puma	puma	5fdc618bdfceb9bc02bf7d9ae3381dd3	utf8=%E2%9C%93&taxon=&keywords=puma	2017-11-28 14:11:55.666344	2017-11-28 14:11:55.666344
23	\N	\N	\N	\N	index	http://localhost:3000/admin/marketing/lists		41f9b6e72065e96c7dff22572271095f		2017-11-28 14:26:52.566268	2017-11-28 14:26:52.566268
24	Spree::User	2	\N	\N	index	http://localhost:3000/login		ef6ef8275b1d63f02ee2332c56dc9b20		2017-11-28 14:27:15.093017	2017-11-28 14:27:15.093017
25	Spree::User	2	Spree::Product	13	view	http://localhost:3000/	\N	ef6ef8275b1d63f02ee2332c56dc9b20		2017-11-28 14:27:20.651722	2017-11-28 14:27:20.651722
26	Spree::User	2	\N	\N	index	http://localhost:3000/checkout/payment		ef6ef8275b1d63f02ee2332c56dc9b20		2017-11-28 14:32:59.471815	2017-11-28 14:32:59.471815
27	\N	\N	\N	\N	index	http://localhost:3000/		638970c29502a77c17e9993e787e96dd		2017-11-28 14:33:02.708674	2017-11-28 14:33:02.708674
28	\N	\N	\N	\N	index	http://localhost:3000/admin/marketing/lists		b8718ad5987287f0c1c5e3bd68186fce		2017-11-28 14:35:06.672517	2017-11-28 14:35:06.672517
29	Spree::User	2	\N	\N	index	http://localhost:3000/login		73a80ab3950b789ee25e5fc3b647a53a		2017-11-28 14:35:25.829459	2017-11-28 14:35:25.829459
30	Spree::User	2	\N	\N	index	http://localhost:3000/		73a80ab3950b789ee25e5fc3b647a53a		2017-11-28 14:35:57.768724	2017-11-28 14:35:57.768724
31	Spree::User	2	\N	\N	index	http://localhost:3000/cart		73a80ab3950b789ee25e5fc3b647a53a		2017-11-28 14:36:06.067735	2017-11-28 14:36:06.067735
32	\N	\N	\N	\N	index	http://localhost:3000/		0a464206cc3ddc46720d2911e92a29c9		2017-11-28 14:36:13.975484	2017-11-28 14:36:13.975484
33	\N	\N	\N	\N	search	http://localhost:3000/products?utf8=%E2%9C%93&taxon=&keywords=puma	puma	0a464206cc3ddc46720d2911e92a29c9	utf8=%E2%9C%93&taxon=&keywords=puma	2017-11-28 14:48:59.553914	2017-11-28 14:48:59.553914
34	\N	\N	\N	\N	index	http://localhost:3000/products?utf8=%E2%9C%93&taxon=&keywords=puma		0a464206cc3ddc46720d2911e92a29c9		2017-11-28 14:49:04.522663	2017-11-28 14:49:04.522663
35	\N	\N	\N	\N	index	http://localhost:3000/products?utf8=%E2%9C%93&taxon=&keywords=puma		0a464206cc3ddc46720d2911e92a29c9		2017-11-28 14:49:07.780148	2017-11-28 14:49:07.780148
36	Spree::User	1	\N	\N	index	http://localhost:3000/		916015bd1ccae198d3aeb5f57de21e42		2017-11-28 15:24:54.279699	2017-11-28 15:24:54.279699
37	Spree::User	1	\N	\N	index	http://localhost:3000/admin/marketing/lists		916015bd1ccae198d3aeb5f57de21e42		2017-11-28 16:23:34.688417	2017-11-28 16:23:34.688417
38	\N	\N	\N	\N	index	\N		61230bf89582e8363a32c1239f76277e		2017-11-29 09:24:02.361215	2017-11-29 09:24:02.361215
39	Spree::User	1	\N	\N	index	http://localhost:3000/admin/marketing/lists		f4702cdb225f2907e7dd7adb06733898		2017-11-29 09:30:29.854053	2017-11-29 09:30:29.854053
40	\N	\N	\N	\N	index	http://localhost:3000/		132bee1e9fb3729f552f8a69c60728c0		2017-11-29 09:30:45.818078	2017-11-29 09:30:45.818078
41	\N	\N	Spree::Product	16	view	http://localhost:3000/	\N	132bee1e9fb3729f552f8a69c60728c0		2017-11-29 09:30:51.901131	2017-11-29 09:30:51.901131
42	\N	\N	\N	\N	index	http://localhost:3000/checkout/address		fa7e005960415135727e31f42e6e62bc		2017-11-29 09:32:03.81992	2017-11-29 09:32:03.81992
43	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 12:12:12.507348	2017-11-29 12:12:12.507348
44	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 12:12:45.092923	2017-11-29 12:12:45.092923
45	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 12:14:59.304791	2017-11-29 12:14:59.304791
46	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 12:15:02.147033	2017-11-29 12:15:02.147033
47	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 12:19:18.159975	2017-11-29 12:19:18.159975
48	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 12:32:16.639768	2017-11-29 12:32:16.639768
49	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 13:00:00.491208	2017-11-29 13:00:00.491208
50	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 13:01:19.548279	2017-11-29 13:01:19.548279
51	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 13:04:01.171537	2017-11-29 13:04:01.171537
52	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 13:04:04.652903	2017-11-29 13:04:04.652903
53	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 13:23:32.045097	2017-11-29 13:23:32.045097
54	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 13:35:32.523035	2017-11-29 13:35:32.523035
55	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 13:45:26.960563	2017-11-29 13:45:26.960563
56	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 13:55:26.689587	2017-11-29 13:55:26.689587
57	Spree::User	1	\N	\N	index	\N		4e038df57c046bedf83563c815bae86b		2017-11-29 14:02:02.688315	2017-11-29 14:02:02.688315
58	\N	\N	\N	\N	index	\N		4a54b533301a4349ebc3fb7197ba158f		2017-11-29 15:53:48.894243	2017-11-29 15:53:48.894243
59	Spree::User	1	\N	\N	index	\N		3a62be2056158fca8b33d29fc218aa26		2017-11-29 15:56:02.862024	2017-11-29 15:56:02.862024
60	Spree::User	1	\N	\N	index	\N		3a62be2056158fca8b33d29fc218aa26		2017-11-29 15:56:59.11886	2017-11-29 15:56:59.11886
61	Spree::User	1	\N	\N	index	\N		3a62be2056158fca8b33d29fc218aa26		2017-11-29 15:58:11.125153	2017-11-29 15:58:11.125153
62	Spree::User	1	\N	\N	index	http://localhost:3000/		3a62be2056158fca8b33d29fc218aa26		2017-11-29 15:58:36.650267	2017-11-29 15:58:36.650267
63	\N	\N	\N	\N	index	\N		4df1c694a12569bbce6e5b17deae7826		2017-11-30 15:52:15.243498	2017-11-30 15:52:15.243498
64	\N	\N	\N	\N	index	http://localhost:3000/admin/marketing/lists		240a6fdc02ca7d0fce21116bd5a76e94		2017-11-30 16:15:06.196989	2017-11-30 16:15:06.196989
65	\N	\N	\N	\N	index	http://localhost:3000/		240a6fdc02ca7d0fce21116bd5a76e94		2017-11-30 16:15:09.822455	2017-11-30 16:15:09.822455
66	\N	\N	\N	\N	index	\N		ed8b6182687c3a08b1a05700c1af4fdf		2017-12-01 09:29:02.971809	2017-12-01 09:29:02.971809
67	Spree::User	1	\N	\N	index	\N		9d16102fccc334c5ac8242afe72a3b1d		2017-12-01 09:35:28.930905	2017-12-01 09:35:28.930905
68	Spree::User	1	\N	\N	index	\N		9d16102fccc334c5ac8242afe72a3b1d		2017-12-01 09:43:19.076148	2017-12-01 09:43:19.076148
69	\N	\N	\N	\N	index	http://0.0.0.0:3000/login		821cf178773652afb791f46e255b73ab		2017-12-01 13:32:49.784099	2017-12-01 13:32:49.784099
70	Spree::User	1	\N	\N	index	\N		9d16102fccc334c5ac8242afe72a3b1d		2017-12-01 13:35:23.402684	2017-12-01 13:35:23.402684
71	\N	\N	\N	\N	index	\N		04e7904694f879e9f86937e972e30857		2017-12-01 15:24:16.613295	2017-12-01 15:24:16.613295
72	\N	\N	\N	\N	index	\N		83d46f84266fb269eb3178cd0531efa5		2017-12-02 09:45:26.041233	2017-12-02 09:45:26.041233
73	Spree::User	1	\N	\N	index	\N		7ebd3f3afa4b1c2b9aa0662dd5293af3		2017-12-02 11:41:31.494207	2017-12-02 11:41:31.494207
74	\N	\N	\N	\N	index	\N		efbdd506557f7be3e6f8b401d09b0ed9		2017-12-04 14:22:02.769602	2017-12-04 14:22:02.769602
75	\N	\N	\N	\N	index	\N		6aff3177657b2ad3ec974d30ff5e4feb		2017-12-06 09:41:24.921984	2017-12-06 09:41:24.921984
76	\N	\N	\N	\N	index	http://0.0.0.0:3000/		6aff3177657b2ad3ec974d30ff5e4feb		2017-12-06 09:41:29.682396	2017-12-06 09:41:29.682396
77	Spree::User	1	\N	\N	index	\N		a8ca6f33443a8040839110fb0005bfc4		2017-12-06 10:24:15.400248	2017-12-06 10:24:15.400248
78	Spree::User	1	\N	\N	index	\N		a8ca6f33443a8040839110fb0005bfc4		2017-12-06 10:28:31.942019	2017-12-06 10:28:31.942019
79	Spree::User	1	\N	\N	index	http://0.0.0.0:3000/		a8ca6f33443a8040839110fb0005bfc4		2017-12-06 10:28:34.626816	2017-12-06 10:28:34.626816
80	\N	\N	\N	\N	index	\N		9d33c2730d65eba7b52266d3422013b4		2017-12-06 10:47:32.340542	2017-12-06 10:47:32.340542
81	Spree::User	1	\N	\N	index	\N		a8ca6f33443a8040839110fb0005bfc4		2017-12-06 10:48:15.524892	2017-12-06 10:48:15.524892
82	Spree::User	1	\N	\N	index	http://0.0.0.0:3000/		a8ca6f33443a8040839110fb0005bfc4		2017-12-06 10:48:17.46209	2017-12-06 10:48:17.46209
83	Spree::User	1	\N	\N	index	http://0.0.0.0:3000/admin/orders		a8ca6f33443a8040839110fb0005bfc4		2017-12-06 10:48:33.140026	2017-12-06 10:48:33.140026
84	Spree::User	1	Spree::Product	16	view	http://0.0.0.0:3000/	\N	a8ca6f33443a8040839110fb0005bfc4		2017-12-06 10:48:35.871774	2017-12-06 10:48:35.871774
85	Spree::User	1	\N	\N	index	http://0.0.0.0:3000/admin/orders		a8ca6f33443a8040839110fb0005bfc4		2017-12-06 10:49:06.873685	2017-12-06 10:49:06.873685
86	Spree::User	1	\N	\N	index	\N		a8ca6f33443a8040839110fb0005bfc4		2017-12-06 10:53:25.640652	2017-12-06 10:53:25.640652
87	Spree::User	1	\N	\N	index	http://0.0.0.0:3000/		a8ca6f33443a8040839110fb0005bfc4		2017-12-06 10:53:29.744065	2017-12-06 10:53:29.744065
\.


--
-- Name: spree_page_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: e9comm
--

SELECT pg_catalog.setval('spree_page_events_id_seq', 87, true);


--
-- Data for Name: spree_payment_capture_events; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_payment_capture_events (id, amount, payment_id, created_at, updated_at) FROM stdin;
1	20.99	3	2017-11-25 11:54:52.984602	2017-11-25 11:54:52.984602
2	28.54	4	2017-11-25 13:04:21.383882	2017-11-25 13:04:21.383882
\.


--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_payment_capture_events_id_seq', 2, true);


--
-- Data for Name: spree_payment_methods; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_payment_methods (id, type, name, description, active, deleted_at, created_at, updated_at, display_on, auto_capture, preferences, "position") FROM stdin;
1	Spree::Gateway::Bogus	Credit Card	Bogus payment gateway.	t	\N	2017-11-15 10:03:33.072921	2017-11-15 10:03:33.072921	both	\N	---\n:server: test\n:test_mode: true\n	1
2	Spree::PaymentMethod::Check	Check	Pay by check.	t	\N	2017-11-15 10:03:33.110323	2017-11-15 10:03:33.110323	both	\N	\N	2
3	Spree::PaymentMethod::LoyaltyPoints	Loyalty Points	Some info about payment method	t	\N	2017-11-25 11:52:38.816705	2017-11-25 11:52:38.816705	both	\N	\N	3
\.


--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_payment_methods_id_seq', 3, true);


--
-- Data for Name: spree_payments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_payments (id, amount, order_id, source_type, source_id, payment_method_id, state, response_code, avs_response, created_at, updated_at, number, cvv_response_code, cvv_response_message, braintree_token, braintree_nonce) FROM stdin;
1	16.79	1	Spree::CreditCard	1	1	pending	12345	\N	2017-11-15 10:04:50.211231	2017-11-15 10:04:50.211231	P5JX28DC	\N	\N	\N	\N
2	30.35	2	Spree::CreditCard	1	1	pending	12345	\N	2017-11-15 10:04:50.744568	2017-11-15 10:04:50.744568	PZTQVJYL	\N	\N	\N	\N
3	20.99	3	\N	\N	2	completed	\N	\N	2017-11-15 12:27:34.065251	2017-11-25 11:54:53.115933	PTL0BGFP	\N	\N	\N	\N
4	28.54	4	\N	\N	2	completed	\N	\N	2017-11-25 13:03:21.044609	2017-11-25 13:04:21.449019	P2IGJSOB	\N	\N	\N	\N
5	27.81	5	\N	\N	3	completed	\N	\N	2017-11-25 13:36:10.616041	2017-11-25 13:36:11.326599	PWR95RS7	\N	\N	\N	\N
6	31.69	6	\N	\N	3	completed	\N	\N	2017-11-25 14:31:16.446068	2017-11-25 14:31:17.325926	PK6JJGC0	\N	\N	\N	\N
\.


--
-- Name: spree_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_payments_id_seq', 6, true);


--
-- Data for Name: spree_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_permissions (id, title, priority, visible, "boolean", created_at, updated_at) FROM stdin;
1	can-manage-all	0	t	t	2017-11-15 10:01:46.191492	2017-11-15 10:01:46.191492
2	default-permissions	1	t	t	2017-11-15 10:01:46.221721	2017-11-15 10:01:46.221721
3	can-manage-spree/products	2	t	t	2017-11-15 10:02:26.768645	2017-11-15 10:02:26.768645
4	can-manage-spree/orders	2	t	t	2017-11-15 10:02:26.789155	2017-11-15 10:02:26.789155
5	can-manage-spree/users	2	t	t	2017-11-15 10:02:26.816159	2017-11-15 10:02:26.816159
6	can-manage-spree/stock_locations	2	t	t	2017-11-15 10:02:26.839859	2017-11-15 10:02:26.839859
7	can-read-spree/products	3	t	t	2017-11-15 10:02:26.864788	2017-11-15 10:02:26.864788
8	can-index-spree/products	3	t	t	2017-11-15 10:02:26.889785	2017-11-15 10:02:26.889785
9	can-update-spree/products	3	t	t	2017-11-15 10:02:26.915789	2017-11-15 10:02:26.915789
10	can-create-spree/products	3	t	t	2017-11-15 10:02:26.937042	2017-11-15 10:02:26.937042
11	can-read-spree/users	3	t	t	2017-11-15 10:02:26.96569	2017-11-15 10:02:26.96569
12	can-index-spree/users	3	t	t	2017-11-15 10:02:26.988036	2017-11-15 10:02:26.988036
13	can-update-spree/users	3	t	t	2017-11-15 10:02:27.016212	2017-11-15 10:02:27.016212
14	can-create-spree/users	3	t	t	2017-11-15 10:02:27.040215	2017-11-15 10:02:27.040215
15	can-read-spree/orders	3	t	t	2017-11-15 10:02:27.065023	2017-11-15 10:02:27.065023
16	can-index-spree/orders	3	t	t	2017-11-15 10:02:27.089164	2017-11-15 10:02:27.089164
17	can-update-spree/orders	3	t	t	2017-11-15 10:02:27.105266	2017-11-15 10:02:27.105266
18	can-create-spree/orders	3	t	t	2017-11-15 10:02:27.131663	2017-11-15 10:02:27.131663
19	can-read-spree/stock_locations	3	t	t	2017-11-15 10:02:27.15463	2017-11-15 10:02:27.15463
20	can-index-spree/stock_locations	3	t	t	2017-11-15 10:02:27.182768	2017-11-15 10:02:27.182768
21	can-update-spree/stock_locations	3	t	t	2017-11-15 10:02:27.207768	2017-11-15 10:02:27.207768
22	can-create-spree/stock_locations	3	t	t	2017-11-15 10:02:27.23182	2017-11-15 10:02:27.23182
23	can-manage-spree/taxons	2	t	t	2017-11-15 10:02:27.258454	2017-11-15 10:02:27.258454
24	can-manage-spree/option_types	2	t	t	2017-11-15 10:02:27.281863	2017-11-15 10:02:27.281863
25	can-manage-spree/taxonomies	2	t	t	2017-11-15 10:02:27.308454	2017-11-15 10:02:27.308454
26	can-manage-spree/images	2	t	t	2017-11-15 10:02:27.328567	2017-11-15 10:02:27.328567
27	can-manage-spree/product_properties	2	t	t	2017-11-15 10:02:27.357699	2017-11-15 10:02:27.357699
28	can-manage-spree/stocks	2	t	t	2017-11-15 10:02:27.378907	2017-11-15 10:02:27.378907
29	default-admin-permissions	1	t	t	2017-11-15 14:57:53.859429	2017-11-15 14:57:53.859429
\.


--
-- Name: spree_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_permissions_id_seq', 29, true);


--
-- Data for Name: spree_preferences; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_preferences (id, value, key, created_at, updated_at) FROM stdin;
1	--- ecommerce.png\n...\n	spree/app_configuration/logo	2017-11-28 13:10:50.316376	2017-11-28 13:10:50.316376
2	--- ecommerce.png\n...\n	spree/app_configuration/admin_interface_logo	2017-11-28 13:10:50.388184	2017-11-28 13:10:50.388184
\.


--
-- Name: spree_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_preferences_id_seq', 10, true);


--
-- Data for Name: spree_prices; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_prices (id, variant_id, amount, currency, deleted_at) FROM stdin;
1	1	15.99	USD	\N
2	1	14.00	EUR	\N
3	2	22.99	USD	\N
4	2	19.00	EUR	\N
11	6	19.99	USD	\N
12	6	16.00	EUR	\N
13	7	19.99	USD	\N
14	7	16.00	EUR	\N
15	8	19.99	USD	\N
16	8	16.00	EUR	\N
23	12	22.99	USD	\N
24	12	19.00	EUR	\N
25	13	13.99	USD	\N
26	13	12.00	EUR	\N
27	14	16.99	USD	\N
28	14	14.00	EUR	\N
31	16	13.99	USD	\N
32	16	12.00	EUR	\N
42	26	19.99	USD	2017-11-15 13:27:16.680084
41	25	19.99	USD	2017-11-15 13:27:19.14018
40	24	19.99	USD	2017-11-15 13:27:21.743853
39	23	19.99	USD	2017-11-15 13:27:24.182242
38	22	19.99	USD	2017-11-15 13:27:26.253688
37	21	19.99	USD	2017-11-15 13:27:28.615346
36	20	19.99	USD	2017-11-15 13:27:30.950022
35	19	19.99	USD	2017-11-15 13:27:32.875898
29	15	16.99	USD	2017-11-24 15:37:11.149772
30	15	14.00	EUR	2017-11-24 15:37:11.268672
17	9	19.99	USD	2017-11-24 15:37:14.908652
18	9	16.00	EUR	2017-11-24 15:37:14.949372
19	10	19.99	USD	2017-11-24 15:37:18.271101
20	10	16.00	EUR	2017-11-24 15:37:18.32427
21	11	15.99	USD	2017-11-24 15:37:21.356663
22	11	14.00	EUR	2017-11-24 15:37:21.422251
5	3	19.99	USD	2017-11-24 15:37:24.714807
6	3	16.00	EUR	2017-11-24 15:37:24.770394
33	17	19.99	USD	2017-11-24 15:37:24.777773
34	18	19.99	USD	2017-11-24 15:37:24.890304
7	4	19.99	USD	2017-11-24 15:37:28.168375
8	4	16.00	EUR	2017-11-24 15:37:28.210353
9	5	19.99	USD	2017-11-24 15:37:31.944423
10	5	16.00	EUR	2017-11-24 15:37:32.068845
\.


--
-- Name: spree_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_prices_id_seq', 42, true);


--
-- Data for Name: spree_product_option_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_product_option_types (id, "position", product_id, option_type_id, created_at, updated_at) FROM stdin;
3	1	8	1	2017-11-15 10:04:25.462358	2017-11-15 10:04:25.462358
4	2	8	2	2017-11-15 10:04:25.46824	2017-11-15 10:04:25.46824
\.


--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_product_option_types_id_seq', 4, true);


--
-- Data for Name: spree_product_packages; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_product_packages (id, product_id, length, width, height, weight, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_product_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_product_packages_id_seq', 1, false);


--
-- Data for Name: spree_product_promotion_rules; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_product_promotion_rules (id, product_id, promotion_rule_id) FROM stdin;
\.


--
-- Name: spree_product_promotion_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_product_promotion_rules_id_seq', 1, false);


--
-- Data for Name: spree_product_properties; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_product_properties (id, value, product_id, property_id, created_at, updated_at, "position") FROM stdin;
25	Tote	1	9	2017-11-15 10:04:26.715521	2017-11-15 10:04:26.715521	1
26	15" x 18" x 6"	1	10	2017-11-15 10:04:26.754659	2017-11-15 10:04:26.754659	2
27	Canvas	1	11	2017-11-15 10:04:26.798379	2017-11-15 10:04:26.798379	3
28	Messenger	2	9	2017-11-15 10:04:26.850805	2017-11-15 10:04:26.850805	1
29	14 1/2" x 12" x 5"	2	10	2017-11-15 10:04:26.896355	2017-11-15 10:04:26.896355	2
30	600 Denier Polyester	2	11	2017-11-15 10:04:26.941616	2017-11-15 10:04:26.941616	3
31	Mug	13	9	2017-11-15 10:04:26.991849	2017-11-15 10:04:26.991849	1
32	4.5" tall, 3.25" dia.	13	10	2017-11-15 10:04:27.040364	2017-11-15 10:04:27.040364	2
37	Mug	16	9	2017-11-15 10:04:27.283004	2017-11-15 10:04:27.283004	1
38	4.5" tall, 3.25" dia.	16	10	2017-11-15 10:04:27.321191	2017-11-15 10:04:27.321191	2
41	Messenger	12	9	2017-11-15 10:04:27.45706	2017-11-15 10:04:27.45706	1
42	14 1/2" x 12" x 5"	12	10	2017-11-15 10:04:27.49453	2017-11-15 10:04:27.49453	2
43	Wilson	8	1	2017-11-15 10:04:27.540325	2017-11-15 10:04:27.540325	1
44	Wannabe Sports	8	2	2017-11-15 10:04:27.586912	2017-11-15 10:04:27.586912	2
45	JK1002	8	3	2017-11-15 10:04:27.631495	2017-11-15 10:04:27.631495	3
46	Baseball Jersey	8	4	2017-11-15 10:04:27.681384	2017-11-15 10:04:27.681384	4
47	Long	8	5	2017-11-15 10:04:27.722228	2017-11-15 10:04:27.722228	5
48	100% cotton	8	6	2017-11-15 10:04:27.772063	2017-11-15 10:04:27.772063	6
49	Loose	8	7	2017-11-15 10:04:27.823501	2017-11-15 10:04:27.823501	7
50	Men's	8	8	2017-11-15 10:04:27.863438	2017-11-15 10:04:27.863438	8
67	T-shirt	7	9	2017-11-15 12:44:30.755787	2017-11-15 12:44:30.755787	1
33	Hoodie	14	9	2017-11-15 10:04:27.092074	2017-11-15 13:56:29.013718	1
\.


--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_product_properties_id_seq', 67, true);


--
-- Data for Name: spree_products; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_products (id, name, description, available_on, deleted_at, slug, meta_description, meta_keywords, tax_category_id, shipping_category_id, created_at, updated_at, promotionable, meta_title, discontinue_on) FROM stdin;
7	Apache Baseball Jersey	 3/4 sleeve baseball Tees are 100% cotton & are soft and durable for a comfortable feel. Collar & sleeves are contrasting for a great baseball look. Fit is standard	2017-11-15 00:00:00	\N	apache-baseball-jersey			1	1	2017-11-15 10:04:18.588423	2017-11-15 12:44:51.694601	t		\N
2	Puma Bag	Printed Puma Big Cat Shoulder Travel Bag	2017-11-15 00:00:00	\N	puma-bag			3	1	2017-11-15 10:04:17.440601	2017-11-15 13:11:01.492346	t		\N
8	Nike Baseball Jersey		2017-11-15 00:00:00	\N	nike-baseball-jersey			1	1	2017-11-15 10:04:18.821218	2017-11-15 14:14:32.163633	t		\N
13	Puma Mug	Puma Coffe Mug.	2017-11-15 00:00:00	\N	puma-mug			3	1	2017-11-15 10:04:19.949318	2017-11-15 13:48:24.271247	t		\N
12	Nike Bag		2017-11-15 00:00:00	\N	nike-bag			3	1	2017-11-15 10:04:19.719214	2017-11-15 14:12:22.646833	t		\N
16	Nike Mug		2017-11-15 00:00:00	\N	nike-mug			3	1	2017-11-15 10:04:20.614866	2017-11-15 14:18:07.960417	t		\N
15	Nike Hoodie		2017-11-15 00:00:00	2017-11-24 15:37:11.287665	1511537831_nike-hoodie			\N	1	2017-11-15 10:04:20.38951	2017-11-24 15:37:11.272656	t		\N
9	Nike Jr. Spaghetti		2017-11-15 00:00:00	2017-11-24 15:37:14.958899	1511537834_nike-jr-spaghetti			1	1	2017-11-15 10:04:19.047964	2017-11-24 15:37:14.953492	t		\N
10	Nike Round Neck T-shirt		2017-11-15 00:00:00	2017-11-24 15:37:18.334547	1511537838_nike-round-neck-t-shirt			1	1	2017-11-15 10:04:19.286657	2017-11-24 15:37:18.329001	t		\N
11	Nike Tote		2017-11-15 00:00:00	2017-11-24 15:37:21.433414	1511537841_nike-tote			3	1	2017-11-15 10:04:19.505242	2017-11-24 15:37:21.429065	t		\N
3	Puma Baseball Jersey	Printed puma baseball Jersey For men 	2017-11-15 00:00:00	2017-11-24 15:37:24.94565	1511537844_puma-baseball-jersey			1	1	2017-11-15 10:04:17.672036	2017-11-24 15:37:24.940679	t		\N
4	Puma Jr. Spaghetti	Puma Women Spaghetti strap top black small.	2017-11-15 00:00:00	2017-11-24 15:37:28.217511	1511537848_puma-jr-spaghetti			1	1	2017-11-15 10:04:17.905527	2017-11-24 15:37:28.214657	t		\N
5	Puma T-Shirt		2017-11-15 00:00:00	2017-11-24 15:37:32.081211	1511537852_puma-t-shirt			1	1	2017-11-15 10:04:18.161923	2017-11-24 15:37:32.075757	t		\N
14	Puma Hoodie		2017-11-15 00:00:00	\N	puma-hoodie			1	1	2017-11-15 10:04:20.16802	2017-11-25 13:03:21.530766	t		\N
1	Puma Tote		2017-11-15 00:00:00	\N	puma-tote			3	1	2017-11-15 10:04:17.054225	2017-11-25 13:54:34.708582	t		\N
6	Adidas Baseball Jersey	adidas Baseball Jersey short-sleeved shirts white	2017-11-15 00:00:00	\N	adidas-baseball-jersey			1	1	2017-11-15 10:04:18.382552	2017-11-25 14:31:16.980323	t		\N
\.


--
-- Name: spree_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_products_id_seq', 16, true);


--
-- Data for Name: spree_products_taxons; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_products_taxons (id, product_id, taxon_id, "position") FROM stdin;
49	1	21	7
50	1	12	2
51	12	12	3
52	12	19	1
53	8	19	2
54	8	16	5
57	16	19	4
58	16	13	2
33	7	18	1
34	7	16	1
35	6	17	1
36	6	16	2
37	2	12	1
38	2	21	1
65	14	14	2
43	13	21	4
44	13	13	1
48	14	21	6
\.


--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_products_taxons_id_seq', 65, true);


--
-- Data for Name: spree_promotion_action_line_items; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_promotion_action_line_items (id, promotion_action_id, variant_id, quantity) FROM stdin;
\.


--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_promotion_action_line_items_id_seq', 1, false);


--
-- Data for Name: spree_promotion_actions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_promotion_actions (id, promotion_id, "position", type, deleted_at) FROM stdin;
\.


--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_promotion_actions_id_seq', 1, false);


--
-- Data for Name: spree_promotion_categories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_promotion_categories (id, name, created_at, updated_at, code) FROM stdin;
\.


--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_promotion_categories_id_seq', 1, false);


--
-- Data for Name: spree_promotion_rule_taxons; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_promotion_rule_taxons (id, taxon_id, promotion_rule_id) FROM stdin;
\.


--
-- Name: spree_promotion_rule_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_promotion_rule_taxons_id_seq', 1, false);


--
-- Data for Name: spree_promotion_rule_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_promotion_rule_users (id, user_id, promotion_rule_id) FROM stdin;
\.


--
-- Name: spree_promotion_rule_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_promotion_rule_users_id_seq', 1, false);


--
-- Data for Name: spree_promotion_rules; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_promotion_rules (id, promotion_id, user_id, product_group_id, type, created_at, updated_at, code, preferences) FROM stdin;
\.


--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_promotion_rules_id_seq', 1, false);


--
-- Data for Name: spree_promotions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_promotions (id, description, expires_at, starts_at, name, type, usage_limit, match_policy, code, advertise, path, created_at, updated_at, promotion_category_id) FROM stdin;
\.


--
-- Name: spree_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_promotions_id_seq', 1, false);


--
-- Data for Name: spree_properties; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_properties (id, name, presentation, created_at, updated_at) FROM stdin;
1	Manufacturer	Manufacturer	2017-11-15 10:04:25.554174	2017-11-15 10:04:25.554174
2	Brand	Brand	2017-11-15 10:04:25.624703	2017-11-15 10:04:25.624703
3	Model	Model	2017-11-15 10:04:25.676573	2017-11-15 10:04:25.676573
4	Shirt Type	Shirt Type	2017-11-15 10:04:25.724798	2017-11-15 10:04:25.724798
5	Sleeve Type	Sleeve Type	2017-11-15 10:04:25.768099	2017-11-15 10:04:25.768099
6	Made from	Made from	2017-11-15 10:04:25.816262	2017-11-15 10:04:25.816262
7	Fit	Fit	2017-11-15 10:04:25.868572	2017-11-15 10:04:25.868572
8	Gender	Gender	2017-11-15 10:04:25.916267	2017-11-15 10:04:25.916267
9	Type	Type	2017-11-15 10:04:26.710474	2017-11-15 10:04:26.710474
10	Size	Size	2017-11-15 10:04:26.749316	2017-11-15 10:04:26.749316
11	Material	Material	2017-11-15 10:04:26.792425	2017-11-15 10:04:26.792425
\.


--
-- Name: spree_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_properties_id_seq', 11, true);


--
-- Data for Name: spree_property_prototypes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_property_prototypes (id, prototype_id, property_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	11
7	1	7
8	1	8
9	2	9
10	2	10
11	2	11
12	3	10
13	3	9
\.


--
-- Name: spree_property_prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_property_prototypes_id_seq', 13, true);


--
-- Data for Name: spree_prototype_taxons; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_prototype_taxons (id, taxon_id, prototype_id) FROM stdin;
\.


--
-- Name: spree_prototype_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_prototype_taxons_id_seq', 1, false);


--
-- Data for Name: spree_prototypes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_prototypes (id, name, created_at, updated_at) FROM stdin;
1	Shirt	2017-11-15 10:04:28.71985	2017-11-15 10:04:28.71985
2	Bag	2017-11-15 10:04:28.977045	2017-11-15 10:04:28.977045
3	Mugs	2017-11-15 10:04:29.077733	2017-11-15 10:04:29.077733
\.


--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_prototypes_id_seq', 3, true);


--
-- Data for Name: spree_refund_reasons; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_refund_reasons (id, name, active, mutable, created_at, updated_at) FROM stdin;
1	Return processing	t	f	2017-11-15 10:03:57.317441	2017-11-15 10:03:57.317441
\.


--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_refund_reasons_id_seq', 1, true);


--
-- Data for Name: spree_refunds; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_refunds (id, payment_id, amount, transaction_id, created_at, updated_at, refund_reason_id, reimbursement_id) FROM stdin;
\.


--
-- Name: spree_refunds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_refunds_id_seq', 1, false);


--
-- Data for Name: spree_reimbursement_credits; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_reimbursement_credits (id, amount, reimbursement_id, creditable_id, creditable_type) FROM stdin;
\.


--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_reimbursement_credits_id_seq', 1, false);


--
-- Data for Name: spree_reimbursement_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_reimbursement_types (id, name, active, mutable, created_at, updated_at, type) FROM stdin;
1	StoreCredit	t	t	2017-11-25 13:43:26.125768	2017-11-25 13:43:26.125768	Spree::ReimbursementType::StoreCredit
\.


--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_reimbursement_types_id_seq', 1, true);


--
-- Data for Name: spree_reimbursements; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_reimbursements (id, number, reimbursement_status, customer_return_id, order_id, total, created_at, updated_at) FROM stdin;
1	RI712402564	reimbursed	1	5	0.00	2017-11-25 13:52:43.496064	2017-11-25 13:54:34.748303
\.


--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_reimbursements_id_seq', 1, true);


--
-- Data for Name: spree_return_authorization_reasons; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_return_authorization_reasons (id, name, active, mutable, created_at, updated_at) FROM stdin;
1	Missed estimated delivery date	t	t	2017-11-25 13:50:46.975452	2017-11-25 13:50:46.975452
\.


--
-- Name: spree_return_authorization_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_return_authorization_reasons_id_seq', 1, true);


--
-- Data for Name: spree_return_authorizations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_return_authorizations (id, number, state, order_id, memo, created_at, updated_at, stock_location_id, return_authorization_reason_id, loyalty_points, loyalty_points_transaction_type) FROM stdin;
1	RA921653366	authorized	5		2017-11-25 13:51:21.524602	2017-11-25 13:51:21.524602	1	1	2	Credit
\.


--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_return_authorizations_id_seq', 1, true);


--
-- Data for Name: spree_return_items; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_return_items (id, return_authorization_id, inventory_unit_id, exchange_variant_id, created_at, updated_at, pre_tax_amount, included_tax_total, additional_tax_total, reception_status, acceptance_status, customer_return_id, reimbursement_id, exchange_inventory_unit_id, acceptance_status_errors, preferred_reimbursement_type_id, override_reimbursement_type_id, resellable) FROM stdin;
1	1	6	1	2017-11-25 13:51:21.528345	2017-11-25 13:54:34.592743	0.0000	0.0000	0.0000	received	accepted	1	1	7	--- {}\n	1	1	t
\.


--
-- Name: spree_return_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_return_items_id_seq', 1, true);


--
-- Data for Name: spree_roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_roles (id, name, editable, is_default) FROM stdin;
1	admin	t	f
2	user	t	t
3	manager	t	f
4	customer service	t	f
5	warehouse	t	f
6	users	t	f
7	products	t	f
8	orders	t	f
9	customer	t	f
\.


--
-- Name: spree_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_roles_id_seq', 9, true);


--
-- Data for Name: spree_roles_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_roles_permissions (role_id, permission_id) FROM stdin;
2	2
1	1
3	2
3	3
3	4
3	24
3	25
3	26
3	27
3	28
3	6
4	2
4	15
4	16
4	17
5	2
5	4
5	6
5	15
5	16
5	17
5	28
6	29
6	5
7	29
7	3
8	29
8	4
9	29
9	4
9	26
9	15
9	16
9	17
9	18
\.


--
-- Data for Name: spree_roles_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_roles_users (id, role_id, user_id) FROM stdin;
1	1	1
2	9	2
3	7	3
4	8	4
5	6	5
6	2	6
\.


--
-- Name: spree_roles_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_roles_users_id_seq', 6, true);


--
-- Data for Name: spree_shipments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_shipments (id, tracking, number, cost, shipped_at, order_id, address_id, state, created_at, updated_at, stock_location_id, adjustment_total, additional_tax_total, promo_total, included_tax_total, pre_tax_amount, taxable_adjustment_total, non_taxable_adjustment_total, delivery_slot_id) FROM stdin;
1	\N	H47469550829	0.00	\N	1	\N	pending	2017-11-15 10:04:49.3046	2017-11-15 10:04:50.23837	1	0.00	0.00	0.00	0.00	0.0000	0.00	0.00	\N
2	\N	H99770216838	5.00	\N	2	1	pending	2017-11-15 10:04:49.468912	2017-11-15 10:04:50.879349	1	0.00	0.00	0.00	0.00	0.0000	0.00	0.00	\N
4	\N	H04026283460	10.00	\N	3	4	ready	2017-11-15 12:25:54.258792	2017-11-25 11:54:53.285372	1	0.00	0.00	0.00	0.00	0.0000	0.00	0.00	0
8	\N	H20526680560	10.00	\N	6	6	ready	2017-11-25 14:30:46.411197	2017-11-25 14:31:18.193248	1	0.70	0.70	0.00	0.00	10.0000	0.00	0.00	0
5	\N	H46873356054	10.00	\N	4	6	ready	2017-11-25 13:01:58.547054	2017-11-25 13:04:21.61702	1	0.70	0.70	0.00	0.00	10.0000	0.00	0.00	9
6	\N	H00781226373	10.00	2017-11-25 13:39:21.778816	5	6	shipped	2017-11-25 13:35:01.375292	2017-11-25 13:52:38.814614	1	0.70	0.70	0.00	0.00	10.0000	0.00	0.00	0
7	\N	H32569329766	0.00	\N	5	6	ready	2017-11-25 13:54:34.574915	2017-11-25 13:54:34.642759	1	0.00	0.00	0.00	0.00	0.0000	0.00	0.00	\N
10	\N	H56608310211	10.00	\N	8	8	pending	2017-11-28 14:32:32.521414	2017-11-28 14:32:50.635569	1	0.70	0.70	0.00	0.00	10.0000	0.00	0.00	0
11	\N	H89872533355	10.00	\N	7	6	pending	2017-12-06 10:48:48.640663	2017-12-06 10:48:52.352418	1	0.70	0.70	0.00	0.00	10.0000	0.00	0.00	0
\.


--
-- Name: spree_shipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_shipments_id_seq', 11, true);


--
-- Data for Name: spree_shipping_categories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_shipping_categories (id, name, created_at, updated_at) FROM stdin;
1	Default	2017-11-15 10:03:33.176924	2017-11-15 10:03:33.176924
\.


--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_shipping_categories_id_seq', 1, true);


--
-- Data for Name: spree_shipping_method_categories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_shipping_method_categories (id, shipping_method_id, shipping_category_id, created_at, updated_at) FROM stdin;
1	1	1	2017-11-15 10:04:16.175856	2017-11-15 10:04:16.175856
2	2	1	2017-11-15 10:04:16.241817	2017-11-15 10:04:16.241817
3	3	1	2017-11-15 10:04:16.298814	2017-11-15 10:04:16.298814
4	4	1	2017-11-15 10:04:16.359416	2017-11-15 10:04:16.359416
5	5	1	2017-11-15 10:04:16.418889	2017-11-15 10:04:16.418889
7	7	1	2017-11-15 12:25:18.338776	2017-11-15 12:25:18.338776
\.


--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_shipping_method_categories_id_seq', 7, true);


--
-- Data for Name: spree_shipping_method_zones; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_shipping_method_zones (id, shipping_method_id, zone_id) FROM stdin;
1	1	2
2	2	2
3	3	2
4	4	1
5	5	1
6	6	3
7	7	3
\.


--
-- Name: spree_shipping_method_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_shipping_method_zones_id_seq', 7, true);


--
-- Data for Name: spree_shipping_methods; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_shipping_methods (id, name, display_on, deleted_at, created_at, updated_at, tracking_url, admin_name, tax_category_id, code, is_delivery_slots_enabled) FROM stdin;
1	UPS Ground (USD)	\N	\N	2017-11-15 10:04:16.170211	2017-11-15 10:04:16.170211	\N	\N	\N	\N	f
2	UPS Two Day (USD)	\N	\N	2017-11-15 10:04:16.236787	2017-11-15 10:04:16.236787	\N	\N	\N	\N	f
3	UPS One Day (USD)	\N	\N	2017-11-15 10:04:16.293602	2017-11-15 10:04:16.293602	\N	\N	\N	\N	f
4	UPS Ground (EU)	\N	\N	2017-11-15 10:04:16.353042	2017-11-15 10:04:16.353042	\N	\N	\N	\N	f
5	UPS Ground (EUR)	\N	\N	2017-11-15 10:04:16.413348	2017-11-15 10:04:16.413348	\N	\N	\N	\N	f
6	India Flat		2017-11-15 12:23:57.91716	2017-11-15 12:17:21.47132	2017-11-15 12:23:57.917225			3		t
7	India Flat		\N	2017-11-15 12:25:18.334335	2017-11-15 12:25:18.334335			3		t
\.


--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_shipping_methods_id_seq', 7, true);


--
-- Data for Name: spree_shipping_rates; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_shipping_rates (id, shipment_id, shipping_method_id, selected, cost, created_at, updated_at, tax_rate_id) FROM stdin;
8	2	2	f	10.00	2017-11-15 10:04:50.866086	2017-11-15 10:04:50.866086	\N
9	2	3	f	15.00	2017-11-15 10:04:50.867537	2017-11-15 10:04:50.867537	\N
7	2	1	t	5.00	2017-11-15 10:04:50.864375	2017-11-15 10:04:50.872312	\N
15	4	7	t	10.00	2017-11-25 11:54:53.266579	2017-11-25 11:54:53.273232	2
20	5	7	t	10.00	2017-11-25 13:12:40.962265	2017-11-25 13:12:41.0089	2
24	6	7	t	10.00	2017-11-25 13:39:18.471474	2017-11-25 13:39:18.638032	2
25	7	7	t	10.00	2017-11-25 13:54:34.597186	2017-11-25 13:54:34.597186	2
29	8	7	t	10.00	2017-11-25 14:33:13.117867	2017-11-25 14:33:13.372938	2
31	10	1	f	5.00	2017-11-28 14:32:32.529188	2017-11-28 14:32:32.529188	\N
32	10	2	f	10.00	2017-11-28 14:32:32.53214	2017-11-28 14:32:32.53214	\N
34	10	3	f	15.00	2017-11-28 14:32:32.535911	2017-11-28 14:32:32.535911	\N
33	10	7	t	10.00	2017-11-28 14:32:32.534289	2017-11-28 14:32:49.896892	2
35	11	7	t	10.00	2017-12-06 10:48:48.663045	2017-12-06 10:48:51.53182	2
\.


--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_shipping_rates_id_seq', 35, true);


--
-- Data for Name: spree_state_changes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_state_changes (id, name, previous_state, stateful_id, user_id, stateful_type, next_state, created_at, updated_at) FROM stdin;
1	payment	\N	1	\N	Spree::Order	balance_due	2017-11-15 10:04:50.052554	2017-11-15 10:04:50.052554
2	shipment	\N	1	\N	Spree::Order	pending	2017-11-15 10:04:50.143638	2017-11-15 10:04:50.143638
3	payment	\N	2	\N	Spree::Order	balance_due	2017-11-15 10:04:50.459108	2017-11-15 10:04:50.459108
4	shipment	\N	2	\N	Spree::Order	pending	2017-11-15 10:04:50.6929	2017-11-15 10:04:50.6929
5	order	cart	3	1	Spree::Order	address	2017-11-15 12:20:15.558673	2017-11-15 12:20:15.558673
6	order	address	3	1	Spree::Order	delivery	2017-11-15 12:21:18.604465	2017-11-15 12:21:18.604465
7	order	cart	3	1	Spree::Order	address	2017-11-15 12:25:45.140267	2017-11-15 12:25:45.140267
8	order	address	3	1	Spree::Order	delivery	2017-11-15 12:25:54.351416	2017-11-15 12:25:54.351416
9	order	delivery	3	1	Spree::Order	payment	2017-11-15 12:27:25.674252	2017-11-15 12:27:25.674252
10	order	payment	3	1	Spree::Order	complete	2017-11-15 12:27:34.237903	2017-11-15 12:27:34.237903
11	payment	\N	3	1	Spree::Order	balance_due	2017-11-15 12:27:34.313827	2017-11-15 12:27:34.313827
12	shipment	\N	3	1	Spree::Order	pending	2017-11-15 12:27:34.462958	2017-11-15 12:27:34.462958
13	payment	checkout	3	\N	Spree::Payment	processing	2017-11-25 11:54:52.898884	2017-11-25 11:54:52.898884
14	payment	balance_due	3	1	Spree::Order	paid	2017-11-25 11:54:53.142197	2017-11-25 11:54:53.142197
15	shipment	pending	3	1	Spree::Order	ready	2017-11-25 11:54:53.288348	2017-11-25 11:54:53.288348
16	payment	processing	3	\N	Spree::Payment	completed	2017-11-25 11:54:53.294414	2017-11-25 11:54:53.294414
17	order	cart	4	1	Spree::Order	address	2017-11-25 13:01:53.131867	2017-11-25 13:01:53.131867
18	order	address	4	1	Spree::Order	delivery	2017-11-25 13:01:58.738312	2017-11-25 13:01:58.738312
19	order	delivery	4	1	Spree::Order	payment	2017-11-25 13:02:07.486134	2017-11-25 13:02:07.486134
20	order	payment	4	1	Spree::Order	complete	2017-11-25 13:03:21.270254	2017-11-25 13:03:21.270254
21	payment	\N	4	1	Spree::Order	balance_due	2017-11-25 13:03:21.402663	2017-11-25 13:03:21.402663
22	shipment	\N	4	1	Spree::Order	pending	2017-11-25 13:03:21.569588	2017-11-25 13:03:21.569588
23	payment	checkout	4	\N	Spree::Payment	processing	2017-11-25 13:04:21.299883	2017-11-25 13:04:21.299883
24	payment	balance_due	4	1	Spree::Order	paid	2017-11-25 13:04:21.477414	2017-11-25 13:04:21.477414
25	shipment	pending	4	1	Spree::Order	ready	2017-11-25 13:04:21.6196	2017-11-25 13:04:21.6196
26	payment	processing	4	\N	Spree::Payment	completed	2017-11-25 13:04:21.625245	2017-11-25 13:04:21.625245
27	order	cart	5	1	Spree::Order	address	2017-11-25 13:34:56.643951	2017-11-25 13:34:56.643951
28	order	address	5	1	Spree::Order	delivery	2017-11-25 13:35:01.45004	2017-11-25 13:35:01.45004
29	order	delivery	5	1	Spree::Order	payment	2017-11-25 13:35:06.465874	2017-11-25 13:35:06.465874
30	order	payment	5	1	Spree::Order	complete	2017-11-25 13:36:10.846157	2017-11-25 13:36:10.846157
31	payment	\N	5	1	Spree::Order	balance_due	2017-11-25 13:36:10.964168	2017-11-25 13:36:10.964168
32	shipment	\N	5	1	Spree::Order	pending	2017-11-25 13:36:11.103472	2017-11-25 13:36:11.103472
33	payment	balance_due	5	1	Spree::Order	paid	2017-11-25 13:36:11.383631	2017-11-25 13:36:11.383631
34	shipment	pending	5	1	Spree::Order	ready	2017-11-25 13:36:11.598221	2017-11-25 13:36:11.598221
35	payment	checkout	5	\N	Spree::Payment	completed	2017-11-25 13:36:11.604137	2017-11-25 13:36:11.604137
36	shipment	ready	5	1	Spree::Order	shipped	2017-11-25 13:39:21.809937	2017-11-25 13:39:21.809937
37	shipment	ready	6	\N	Spree::Shipment	shipped	2017-11-25 13:39:21.923323	2017-11-25 13:39:21.923323
38	order	complete	5	1	Spree::Order	returned	2017-11-25 13:52:38.888732	2017-11-25 13:52:38.888732
39	order	cart	6	1	Spree::Order	address	2017-11-25 14:30:39.99952	2017-11-25 14:30:39.99952
40	order	address	6	1	Spree::Order	delivery	2017-11-25 14:30:46.492474	2017-11-25 14:30:46.492474
41	order	delivery	6	1	Spree::Order	payment	2017-11-25 14:30:58.339322	2017-11-25 14:30:58.339322
42	order	payment	6	1	Spree::Order	complete	2017-11-25 14:31:16.672542	2017-11-25 14:31:16.672542
43	payment	\N	6	1	Spree::Order	balance_due	2017-11-25 14:31:16.827621	2017-11-25 14:31:16.827621
44	shipment	\N	6	1	Spree::Order	pending	2017-11-25 14:31:17.026665	2017-11-25 14:31:17.026665
45	payment	balance_due	6	1	Spree::Order	paid	2017-11-25 14:31:17.404961	2017-11-25 14:31:17.404961
46	shipment	pending	6	1	Spree::Order	ready	2017-11-25 14:31:18.195956	2017-11-25 14:31:18.195956
47	payment	checkout	6	\N	Spree::Payment	completed	2017-11-25 14:31:18.205613	2017-11-25 14:31:18.205613
48	order	cart	7	1	Spree::Order	address	2017-11-28 13:35:09.474485	2017-11-28 13:35:09.474485
49	order	address	7	1	Spree::Order	delivery	2017-11-28 13:35:17.163374	2017-11-28 13:35:17.163374
50	order	cart	8	2	Spree::Order	address	2017-11-28 13:37:21.211409	2017-11-28 13:37:21.211409
51	order	address	8	2	Spree::Order	delivery	2017-11-28 14:32:32.645352	2017-11-28 14:32:32.645352
52	order	delivery	8	2	Spree::Order	payment	2017-11-28 14:32:50.503217	2017-11-28 14:32:50.503217
53	order	cart	9	\N	Spree::Order	address	2017-11-29 09:31:04.68345	2017-11-29 09:31:04.68345
54	order	cart	7	1	Spree::Order	address	2017-12-06 10:48:38.536184	2017-12-06 10:48:38.536184
55	order	address	7	1	Spree::Order	delivery	2017-12-06 10:48:48.752157	2017-12-06 10:48:48.752157
56	order	delivery	7	1	Spree::Order	payment	2017-12-06 10:48:52.145907	2017-12-06 10:48:52.145907
\.


--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_state_changes_id_seq', 56, true);


--
-- Data for Name: spree_states; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_states (id, name, abbr, country_id, updated_at) FROM stdin;
1	Canillo	02	1	\N
2	Encamp	03	1	\N
3	La Massana	04	1	\N
4	Ordino	05	1	\N
5	Sant Julià de Lòria	06	1	\N
6	Andorra la Vella	07	1	\N
7	Escaldes-Engordany	08	1	\N
8	Balkh	BAL	3	\N
9	Bāmyān	BAM	3	\N
10	Bādghīs	BDG	3	\N
11	Badakhshān	BDS	3	\N
12	Baghlān	BGL	3	\N
13	Dāykundī	DAY	3	\N
14	Farāh	FRA	3	\N
15	Fāryāb	FYB	3	\N
16	Ghaznī	GHA	3	\N
17	Ghōr	GHO	3	\N
18	Helmand	HEL	3	\N
19	Herāt	HER	3	\N
20	Jowzjān	JOW	3	\N
21	Kābul	KAB	3	\N
22	Kandahār	KAN	3	\N
23	Kāpīsā	KAP	3	\N
24	Kunduz	KDZ	3	\N
25	Khōst	KHO	3	\N
26	Kunar	KNR	3	\N
27	Laghmān	LAG	3	\N
28	Lōgar	LOG	3	\N
29	Nangarhār	NAN	3	\N
30	Nīmrōz	NIM	3	\N
31	Nūristān	NUR	3	\N
32	Panjshayr	PAN	3	\N
33	Parwān	PAR	3	\N
34	Paktiyā	PIA	3	\N
35	Paktīkā	PKA	3	\N
36	Samangān	SAM	3	\N
37	Sar-e Pul	SAR	3	\N
38	Takhār	TAK	3	\N
39	Uruzgān	URU	3	\N
40	Wardak	WAR	3	\N
41	Zābul	ZAB	3	\N
42	Berat	01	6	\N
43	Durrës	02	6	\N
44	Elbasan	03	6	\N
45	Fier	04	6	\N
46	Gjirokastër	05	6	\N
47	Korçë	06	6	\N
48	Kukës	07	6	\N
49	Lezhë	08	6	\N
50	Dibër	09	6	\N
51	Shkodër	10	6	\N
52	Tiranë	11	6	\N
53	Vlorë	12	6	\N
54	Aragacotn	AG	7	\N
55	Ararat	AR	7	\N
56	Armavir	AV	7	\N
57	Erevan	ER	7	\N
58	Gegarkunik'	GR	7	\N
59	Kotayk'	KT	7	\N
60	Lory	LO	7	\N
61	Sirak	SH	7	\N
62	Syunik'	SU	7	\N
63	Tavus	TV	7	\N
64	Vayoc Jor	VD	7	\N
65	Salta	A	10	\N
66	Buenos Aires	B	10	\N
67	Ciudad Autónoma de Buenos Aires	C	10	\N
68	San Luis	D	10	\N
69	Entre Rios	E	10	\N
70	Santiago del Estero	G	10	\N
71	Chaco	H	10	\N
72	San Juan	J	10	\N
73	Catamarca	K	10	\N
74	La Pampa	L	10	\N
75	Mendoza	M	10	\N
76	Misiones	N	10	\N
77	Formosa	P	10	\N
78	Neuquen	Q	10	\N
79	Rio Negro	R	10	\N
80	Santa Fe	S	10	\N
81	Tucuman	T	10	\N
82	Chubut	U	10	\N
83	Tierra del Fuego	V	10	\N
84	Corrientes	W	10	\N
85	Cordoba	X	10	\N
86	Jujuy	Y	10	\N
87	Santa Cruz	Z	10	\N
88	La Rioja	F	10	\N
89	Burgenland	1	12	\N
90	Kärnten	2	12	\N
91	Niederösterreich	3	12	\N
92	Oberösterreich	4	12	\N
93	Salzburg	5	12	\N
94	Steiermark	6	12	\N
95	Tirol	7	12	\N
96	Vorarlberg	8	12	\N
97	Wien	9	12	\N
98	Australian Capital Territory	ACT	13	\N
99	New South Wales	NSW	13	\N
100	Northern Territory	NT	13	\N
101	Queensland	QLD	13	\N
102	South Australia	SA	13	\N
103	Tasmania	TAS	13	\N
104	Victoria	VIC	13	\N
105	Western Australia	WA	13	\N
106	Abşeron	ABS	16	\N
107	Ağstafa	AGA	16	\N
108	Ağcabədi	AGC	16	\N
109	Ağdam	AGM	16	\N
110	Ağdaş	AGS	16	\N
111	Ağsu	AGU	16	\N
112	Astara	AST	16	\N
113	Bakı	BA	16	\N
114	Balakən	BAL	16	\N
115	Bərdə	BAR	16	\N
116	Beyləqan	BEY	16	\N
117	Biləsuvar	BIL	16	\N
118	Cəbrayıl	CAB	16	\N
119	Cəlilabab	CAL	16	\N
120	Daşkəsən	DAS	16	\N
121	Füzuli	FUZ	16	\N
122	Gəncə	GA	16	\N
123	Gədəbəy	GAD	16	\N
124	Goranboy	GOR	16	\N
125	Göyçay	GOY	16	\N
126	Göygöl	GYG	16	\N
127	Hacıqabul	HAC	16	\N
128	İmişli	IMI	16	\N
129	İsmayıllı	ISM	16	\N
130	Kəlbəcər	KAL	16	\N
131	Kürdəmir	KUR	16	\N
132	Lənkəran	LA	16	\N
133	Laçın	LAC	16	\N
134	Lənkəran	LAN	16	\N
135	Lerik	LER	16	\N
136	Masallı	MAS	16	\N
137	Mingəçevir	MI	16	\N
138	Naftalan	NA	16	\N
139	Neftçala	NEF	16	\N
140	Naxçıvan	NX	16	\N
141	Oğuz	OGU	16	\N
142	Qəbələ	QAB	16	\N
143	Qax	QAX	16	\N
144	Qazax	QAZ	16	\N
145	Quba	QBA	16	\N
146	Qubadlı	QBI	16	\N
147	Qobustan	QOB	16	\N
148	Qusar	QUS	16	\N
149	Şəki	SA	16	\N
150	Sabirabad	SAB	16	\N
151	Şəki	SAK	16	\N
152	Salyan	SAL	16	\N
153	Saatlı	SAT	16	\N
154	Şabran	SBN	16	\N
155	Siyəzən	SIY	16	\N
156	Şəmkir	SKR	16	\N
157	Sumqayıt	SM	16	\N
158	Şamaxı	SMI	16	\N
159	Samux	SMX	16	\N
160	Şirvan	SR	16	\N
161	Şuşa	SUS	16	\N
162	Tərtər	TAR	16	\N
163	Tovuz	TOV	16	\N
164	Ucar	UCA	16	\N
165	Xankəndi	XA	16	\N
166	Xaçmaz	XAC	16	\N
167	Xocalı	XCI	16	\N
168	Xızı	XIZ	16	\N
169	Xocavənd	XVD	16	\N
170	Yardımlı	YAR	16	\N
171	Yevlax	YE	16	\N
172	Yevlax	YEV	16	\N
173	Zəngilan	ZAN	16	\N
174	Zaqatala	ZAQ	16	\N
175	Zərdab	ZAR	16	\N
176	Federacija Bosne i Hercegovine	BIH	17	\N
177	Brčko distrikt	BRC	17	\N
178	Republika Srpska	SRP	17	\N
179	Christ Church	01	18	\N
180	Saint Andrew	02	18	\N
181	Saint George	03	18	\N
182	Saint James	04	18	\N
183	Saint John	05	18	\N
184	Saint Joseph	06	18	\N
185	Saint Lucy	07	18	\N
186	Saint Michael	08	18	\N
187	Saint Peter	09	18	\N
188	Saint Philip	10	18	\N
189	Saint Thomas	11	18	\N
190	Barisal	A	19	\N
191	Chittagong	B	19	\N
192	Dhaka	C	19	\N
193	Khulna	D	19	\N
194	Rajshahi	E	19	\N
195	Rangpur	F	19	\N
196	Sylhet	G	19	\N
197	Bruxelles-Capitale, Région de;Brussels Hoofdstedelijk Gewest	BRU	20	\N
198	Vlaams Gewest	VLG	20	\N
199	wallonne, Région	WAL	20	\N
200	Blagoevgrad	01	22	\N
201	Burgas	02	22	\N
202	Varna	03	22	\N
203	Veliko Tarnovo	04	22	\N
204	Vidin	05	22	\N
205	Vratsa	06	22	\N
206	Gabrovo	07	22	\N
207	Dobrich	08	22	\N
208	Kardzhali	09	22	\N
209	Kyustendil	10	22	\N
210	Lovech	11	22	\N
211	Montana	12	22	\N
212	Pazardzhik	13	22	\N
213	Pernik	14	22	\N
214	Pleven	15	22	\N
215	Plovdiv	16	22	\N
216	Razgrad	17	22	\N
217	Ruse	18	22	\N
218	Silistra	19	22	\N
219	Sliven	20	22	\N
220	Smolyan	21	22	\N
221	Sofia-Grad	22	22	\N
222	Sofia	23	22	\N
223	Stara Zagora	24	22	\N
224	Targovishte	25	22	\N
225	Haskovo	26	22	\N
226	Shumen	27	22	\N
227	Yambol	28	22	\N
228	Al Manāmah (Al ‘Āşimah)	13	23	\N
229	Al Janūbīyah	14	23	\N
230	Al Muḩarraq	15	23	\N
231	Al Wusţá	16	23	\N
232	Ash Shamālīyah	17	23	\N
233	Belait	BE	28	\N
234	Brunei-Muara	BM	28	\N
235	Temburong	TE	28	\N
236	Tutong	TU	28	\N
237	Bonaire	BO	30	\N
238	Saba	SA	30	\N
239	Sint Eustatius	SE	30	\N
240	Acre	AC	31	\N
241	Alagoas	AL	31	\N
242	Amazonas	AM	31	\N
243	Amapá	AP	31	\N
244	Bahia	BA	31	\N
245	Ceará	CE	31	\N
246	Distrito Federal	DF	31	\N
247	Espírito Santo	ES	31	\N
248	Fernando de Noronha	FN	31	\N
249	Goiás	GO	31	\N
250	Maranhão	MA	31	\N
251	Minas Gerais	MG	31	\N
252	Mato Grosso do Sul	MS	31	\N
253	Mato Grosso	MT	31	\N
254	Pará	PA	31	\N
255	Paraíba	PB	31	\N
256	Pernambuco	PE	31	\N
257	Piauí	PI	31	\N
258	Paraná	PR	31	\N
259	Rio de Janeiro	RJ	31	\N
260	Rio Grande do Norte	RN	31	\N
261	Rondônia	RO	31	\N
262	Roraima	RR	31	\N
263	Rio Grande do Sul	RS	31	\N
264	Santa Catarina	SC	31	\N
265	Sergipe	SE	31	\N
266	São Paulo	SP	31	\N
267	Tocantins	TO	31	\N
268	Paro	11	33	\N
269	Chhukha	12	33	\N
270	Ha	13	33	\N
271	Samtee	14	33	\N
272	Thimphu	15	33	\N
273	Tsirang	21	33	\N
274	Dagana	22	33	\N
275	Punakha	23	33	\N
276	Wangdue Phodrang	24	33	\N
277	Sarpang	31	33	\N
278	Trongsa	32	33	\N
279	Bumthang	33	33	\N
280	Zhemgang	34	33	\N
281	Trashigang	41	33	\N
282	Monggar	42	33	\N
283	Pemagatshel	43	33	\N
284	Lhuentse	44	33	\N
285	Samdrup Jongkha	45	33	\N
286	Gasa	GA	33	\N
287	Trashi Yangtse	TY	33	\N
288	Brèsckaja voblasc'	BR	36	\N
289	Horad Minsk	HM	36	\N
290	Homel'skaja voblasc'	HO	36	\N
291	Hrodzenskaja voblasc'	HR	36	\N
292	Mahilëuskaja voblasc'	MA	36	\N
293	Minskaja voblasc'	MI	36	\N
294	Vicebskaja voblasc'	VI	36	\N
295	Alberta	AB	38	\N
296	British Columbia	BC	38	\N
297	Manitoba	MB	38	\N
298	New Brunswick	NB	38	\N
299	Newfoundland and Labrador	NL	38	\N
300	Nova Scotia	NS	38	\N
301	Northwest Territories	NT	38	\N
302	Nunavut	NU	38	\N
303	Ontario	ON	38	\N
304	Prince Edward Island	PE	38	\N
305	Quebec	QC	38	\N
306	Saskatchewan	SK	38	\N
307	Yukon Territory	YT	38	\N
308	Aargau	AG	43	\N
309	Appenzell Innerrhoden	AI	43	\N
310	Appenzell Ausserrhoden	AR	43	\N
311	Bern	BE	43	\N
312	Basel-Landschaft	BL	43	\N
313	Basel-Stadt	BS	43	\N
314	Fribourg	FR	43	\N
315	Genève	GE	43	\N
316	Glarus	GL	43	\N
317	Graubünden	GR	43	\N
318	Jura	JU	43	\N
319	Luzern	LU	43	\N
320	Neuchâtel	NE	43	\N
321	Nidwalden	NW	43	\N
322	Obwalden	OW	43	\N
323	Sankt Gallen	SG	43	\N
324	Schaffhausen	SH	43	\N
325	Solothurn	SO	43	\N
326	Schwyz	SZ	43	\N
327	Thurgau	TG	43	\N
328	Ticino	TI	43	\N
329	Uri	UR	43	\N
330	Vaud	VD	43	\N
331	Valais	VS	43	\N
332	Zug	ZG	43	\N
333	Zürich	ZH	43	\N
334	Aisén del General Carlos Ibáñez del Campo	AI	46	\N
335	Antofagasta	AN	46	\N
336	Arica y Parinacota	AP	46	\N
337	Araucanía	AR	46	\N
338	Atacama	AT	46	\N
339	Bío-Bío	BI	46	\N
340	Coquimbo	CO	46	\N
341	Libertador General Bernardo O'Higgins	LI	46	\N
342	Los Lagos	LL	46	\N
343	Los Ríos	LR	46	\N
344	Magallanes y Antártica Chilena	MA	46	\N
345	Maule	ML	46	\N
346	Región Metropolitana de Santiago	RM	46	\N
347	Tarapacá	TA	46	\N
348	Valparaíso	VS	46	\N
349	Beijing	11	48	\N
350	Tianjin	12	48	\N
351	Hebei	13	48	\N
352	Shanxi	14	48	\N
353	Nei Mongol	15	48	\N
354	Liaoning	21	48	\N
355	Jilin	22	48	\N
356	Heilongjiang	23	48	\N
357	Shanghai	31	48	\N
358	Jiangsu	32	48	\N
359	Zhejiang	33	48	\N
360	Anhui	34	48	\N
361	Fujian	35	48	\N
362	Jiangxi	36	48	\N
363	Shandong	37	48	\N
364	Henan	41	48	\N
365	Hubei	42	48	\N
366	Hunan	43	48	\N
367	Guangdong	44	48	\N
368	Guangxi	45	48	\N
369	Hainan	46	48	\N
370	Chongqing	50	48	\N
371	Sichuan	51	48	\N
372	Guizhou	52	48	\N
373	Yunnan	53	48	\N
374	Xizang	54	48	\N
375	Shaanxi	61	48	\N
376	Gansu	62	48	\N
377	Qinghai	63	48	\N
378	Ningxia	64	48	\N
379	Xinjiang	65	48	\N
380	Taiwan	71	48	\N
381	Xianggang (Hong-Kong)	91	48	\N
382	Aomen (Macau)	92	48	\N
383	Amazonas	AMA	49	\N
384	Antioquia	ANT	49	\N
385	Arauca	ARA	49	\N
386	Atlántico	ATL	49	\N
387	Bolívar	BOL	49	\N
388	Boyacá	BOY	49	\N
389	Caldas	CAL	49	\N
390	Caquetá	CAQ	49	\N
391	Casanare	CAS	49	\N
392	Cauca	CAU	49	\N
393	Cesar	CES	49	\N
394	Chocó	CHO	49	\N
395	Córdoba	COR	49	\N
396	Cundinamarca	CUN	49	\N
397	Distrito Capital de Bogotá	DC	49	\N
398	Guainía	GUA	49	\N
399	Guaviare	GUV	49	\N
400	Huila	HUI	49	\N
401	La Guajira	LAG	49	\N
402	Magdalena	MAG	49	\N
403	Meta	MET	49	\N
404	Nariño	NAR	49	\N
405	Norte de Santander	NSA	49	\N
406	Putumayo	PUT	49	\N
407	Quindío	QUI	49	\N
408	Risaralda	RIS	49	\N
409	Santander	SAN	49	\N
410	San Andrés, Providencia y Santa Catalina	SAP	49	\N
411	Sucre	SUC	49	\N
412	Tolima	TOL	49	\N
413	Valle del Cauca	VAC	49	\N
414	Vaupés	VAU	49	\N
415	Vichada	VID	49	\N
416	Alajuela	A	50	\N
417	Cartago	C	50	\N
418	Guanacaste	G	50	\N
419	Heredia	H	50	\N
420	Limón	L	50	\N
421	Puntarenas	P	50	\N
422	San José	SJ	50	\N
423	Pinar del Rio	01	51	\N
424	La Habana	02	51	\N
425	Ciudad de La Habana	03	51	\N
426	Matanzas	04	51	\N
427	Villa Clara	05	51	\N
428	Cienfuegos	06	51	\N
429	Sancti Spíritus	07	51	\N
430	Ciego de Ávila	08	51	\N
431	Camagüey	09	51	\N
432	Las Tunas	10	51	\N
433	Holguín	11	51	\N
434	Granma	12	51	\N
435	Santiago de Cuba	13	51	\N
436	Guantánamo	14	51	\N
437	Isla de la Juventud	99	51	\N
438	Ilhas de Barlavento	B	52	\N
439	Ilhas de Sotavento	S	52	\N
440	Lefkosía	01	55	\N
441	Lemesós	02	55	\N
442	Lárnaka	03	55	\N
443	Ammóchostos	04	55	\N
444	Páfos	05	55	\N
445	Kerýneia	06	55	\N
446	Jihočeský kraj	JC	56	\N
447	Jihomoravský kraj	JM	56	\N
448	Karlovarský kraj	KA	56	\N
449	Královéhradecký kraj	KR	56	\N
450	Liberecký kraj	LI	56	\N
451	Moravskoslezský kraj	MO	56	\N
452	Olomoucký kraj	OL	56	\N
453	Pardubický kraj	PA	56	\N
454	Plzeňský kraj	PL	56	\N
455	Praha, hlavní město	PR	56	\N
456	Středočeský kraj	ST	56	\N
457	Ústecký kraj	US	56	\N
458	Vysočina	VY	56	\N
459	Zlínský kraj	ZL	56	\N
460	Brandenburg	BB	57	\N
461	Berlin	BE	57	\N
462	Baden-Württemberg	BW	57	\N
463	Bayern	BY	57	\N
464	Bremen	HB	57	\N
465	Hessen	HE	57	\N
466	Hamburg	HH	57	\N
467	Mecklenburg-Vorpommern	MV	57	\N
468	Niedersachsen	NI	57	\N
469	Nordrhein-Westfalen	NW	57	\N
470	Rheinland-Pfalz	RP	57	\N
471	Schleswig-Holstein	SH	57	\N
472	Saarland	SL	57	\N
473	Sachsen	SN	57	\N
474	Sachsen-Anhalt	ST	57	\N
475	Thüringen	TH	57	\N
476	Nordjylland	81	59	\N
477	Midtjylland	82	59	\N
478	Syddanmark	83	59	\N
479	Hovedstaden	84	59	\N
480	Sjælland	85	59	\N
481	Distrito Nacional (Santo Domingo)	01	61	\N
482	Azua	02	61	\N
483	Bahoruco	03	61	\N
484	Barahona	04	61	\N
485	Dajabón	05	61	\N
486	Duarte	06	61	\N
487	La Estrelleta [Elías Piña]	07	61	\N
488	El Seybo [El Seibo]	08	61	\N
489	Espaillat	09	61	\N
490	Independencia	10	61	\N
491	La Altagracia	11	61	\N
492	La Romana	12	61	\N
493	La Vega	13	61	\N
494	María Trinidad Sánchez	14	61	\N
495	Monte Cristi	15	61	\N
496	Pedernales	16	61	\N
497	Peravia	17	61	\N
498	Puerto Plata	18	61	\N
499	Salcedo	19	61	\N
500	Samaná	20	61	\N
501	San Cristóbal	21	61	\N
502	San Juan	22	61	\N
503	San Pedro de Macorís	23	61	\N
504	Sánchez Ramírez	24	61	\N
505	Santiago	25	61	\N
506	Santiago Rodríguez	26	61	\N
507	Valverde	27	61	\N
508	Monseñor Nouel	28	61	\N
509	Monte Plata	29	61	\N
510	Hato Mayor	30	61	\N
511	Adrar	01	62	\N
512	Chlef	02	62	\N
513	Laghouat	03	62	\N
514	Oum el Bouaghi	04	62	\N
515	Batna	05	62	\N
516	Béjaïa	06	62	\N
517	Biskra	07	62	\N
518	Béchar	08	62	\N
519	Blida	09	62	\N
520	Bouira	10	62	\N
521	Tamanghasset	11	62	\N
522	Tébessa	12	62	\N
523	Tlemcen	13	62	\N
524	Tiaret	14	62	\N
525	Tizi Ouzou	15	62	\N
526	Alger	16	62	\N
527	Djelfa	17	62	\N
528	Jijel	18	62	\N
529	Sétif	19	62	\N
530	Saïda	20	62	\N
531	Skikda	21	62	\N
532	Sidi Bel Abbès	22	62	\N
533	Annaba	23	62	\N
534	Guelma	24	62	\N
535	Constantine	25	62	\N
536	Médéa	26	62	\N
537	Mostaganem	27	62	\N
538	Msila	28	62	\N
539	Mascara	29	62	\N
540	Ouargla	30	62	\N
541	Oran	31	62	\N
542	El Bayadh	32	62	\N
543	Illizi	33	62	\N
544	Bordj Bou Arréridj	34	62	\N
545	Boumerdès	35	62	\N
546	El Tarf	36	62	\N
547	Tindouf	37	62	\N
548	Tissemsilt	38	62	\N
549	El Oued	39	62	\N
550	Khenchela	40	62	\N
551	Souk Ahras	41	62	\N
552	Tipaza	42	62	\N
553	Mila	43	62	\N
554	Aïn Defla	44	62	\N
555	Naama	45	62	\N
556	Aïn Témouchent	46	62	\N
557	Ghardaïa	47	62	\N
558	Relizane	48	62	\N
559	Azuay	A	63	\N
560	Bolívar	B	63	\N
561	Carchi	C	63	\N
562	Orellana	D	63	\N
563	Esmeraldas	E	63	\N
564	Cañar	F	63	\N
565	Guayas	G	63	\N
566	Chimborazo	H	63	\N
567	Imbabura	I	63	\N
568	Loja	L	63	\N
569	Manabí	M	63	\N
570	Napo	N	63	\N
571	El Oro	O	63	\N
572	Pichincha	P	63	\N
573	Los Ríos	R	63	\N
574	Morona-Santiago	S	63	\N
575	Santo Domingo de los Tsáchilas	SD	63	\N
576	Santa Elena	SE	63	\N
577	Tungurahua	T	63	\N
578	Sucumbíos	U	63	\N
579	Galápagos	W	63	\N
580	Cotopaxi	X	63	\N
581	Pastaza	Y	63	\N
582	Zamora-Chinchipe	Z	63	\N
583	Harjumaa	37	64	\N
584	Hiiumaa	39	64	\N
585	Ida-Virumaa	44	64	\N
586	Jõgevamaa	49	64	\N
587	Järvamaa	51	64	\N
588	Läänemaa	57	64	\N
589	Lääne-Virumaa	59	64	\N
590	Põlvamaa	65	64	\N
591	Pärnumaa	67	64	\N
592	Raplamaa	70	64	\N
593	Saaremaa	74	64	\N
594	Tartumaa	78	64	\N
595	Valgamaa	82	64	\N
596	Viljandimaa	84	64	\N
597	Võrumaa	86	64	\N
598	Al Iskandarīyah	ALX	65	\N
599	Aswān	ASN	65	\N
600	Asyūt	AST	65	\N
601	Al Bahr al Ahmar	BA	65	\N
602	Al Buhayrah	BH	65	\N
603	Banī Suwayf	BNS	65	\N
604	Al Qāhirah	C	65	\N
605	Ad Daqahlīyah	DK	65	\N
606	Dumyāt	DT	65	\N
607	Al Fayyūm	FYM	65	\N
608	Al Gharbīyah	GH	65	\N
609	Al Jīzah	GZ	65	\N
610	Ḩulwān	HU	65	\N
611	Al Ismā`īlīyah	IS	65	\N
612	Janūb Sīnā'	JS	65	\N
613	Al Qalyūbīyah	KB	65	\N
614	Kafr ash Shaykh	KFS	65	\N
615	Qinā	KN	65	\N
616	Al Minyā	MN	65	\N
617	Al Minūfīyah	MNF	65	\N
618	Matrūh	MT	65	\N
619	Būr Sa`īd	PTS	65	\N
620	Sūhāj	SHG	65	\N
621	Ash Sharqīyah	SHR	65	\N
622	Shamal Sīnā'	SIN	65	\N
623	As Sādis min Uktūbar	SU	65	\N
624	As Suways	SUZ	65	\N
625	Al Wādī al Jadīd	WAD	65	\N
626	Andalucía	AN	68	\N
627	Aragón	AR	68	\N
628	Asturias, Principado de	AS	68	\N
629	Cantabria	CB	68	\N
630	Ceuta	CE	68	\N
631	Castilla y León	CL	68	\N
632	Castilla-La Mancha	CM	68	\N
633	Canarias	CN	68	\N
634	Catalunya	CT	68	\N
635	Extremadura	EX	68	\N
636	Galicia	GA	68	\N
637	Illes Balears	IB	68	\N
638	Murcia, Región de	MC	68	\N
639	Madrid, Comunidad de	MD	68	\N
640	Melilla	ML	68	\N
641	Navarra, Comunidad Foral de / Nafarroako Foru Komunitatea	NC	68	\N
642	País Vasco / Euskal Herria	PV	68	\N
643	La Rioja	RI	68	\N
644	Valenciana, Comunidad / Valenciana, Comunitat 	VC	68	\N
645	Ādīs Ābeba	AA	69	\N
646	Āfar	AF	69	\N
647	Āmara	AM	69	\N
648	Bīnshangul Gumuz	BE	69	\N
649	Dirē Dawa	DD	69	\N
650	Gambēla Hizboch	GA	69	\N
651	Hārerī Hizb	HA	69	\N
652	Oromīya	OR	69	\N
653	YeDebub Bihēroch Bihēreseboch na Hizboch	SN	69	\N
654	Sumalē	SO	69	\N
655	Tigray	TI	69	\N
656	Ahvenanmaan maakunta	01	70	\N
657	Etelä-Karjala	02	70	\N
658	Etelä-Pohjanmaa	03	70	\N
659	Etelä-Savo	04	70	\N
660	Kainuu	05	70	\N
661	Kanta-Häme	06	70	\N
662	Keski-Pohjanmaa	07	70	\N
663	Keski-Suomi	08	70	\N
664	Kymenlaakso	09	70	\N
665	Lappi	10	70	\N
666	Pirkanmaa	11	70	\N
667	Pohjanmaa	12	70	\N
668	Pohjois-Karjala	13	70	\N
669	Pohjois-Pohjanmaa	14	70	\N
670	Pohjois-Savo	15	70	\N
671	Päijät-Häme	16	70	\N
672	Satakunta	17	70	\N
673	Uusimaa	18	70	\N
674	Varsinais-Suomi	19	70	\N
675	Kosrae	KSA	73	\N
676	Pohnpei	PNI	73	\N
677	Chuuk	TRK	73	\N
678	Yap	YAP	73	\N
679	Alsace	A	75	\N
680	Aquitaine	B	75	\N
681	Saint-Barthélemy	BL	75	\N
682	Auvergne	C	75	\N
683	Clipperton	CP	75	\N
684	Bourgogne	D	75	\N
685	Bretagne	E	75	\N
686	Centre	F	75	\N
687	Champagne-Ardenne	G	75	\N
688	Guyane	GF	75	\N
689	Guadeloupe	GP	75	\N
690	Corse	H	75	\N
691	Franche-Comté	I	75	\N
692	Île-de-France	J	75	\N
693	Languedoc-Roussillon	K	75	\N
694	Limousin	L	75	\N
695	Lorraine	M	75	\N
696	Saint-Martin	MF	75	\N
697	Martinique	MQ	75	\N
698	Midi-Pyrénées	N	75	\N
699	Nouvelle-Calédonie	NC	75	\N
700	Nord-Pas-de-Calais	O	75	\N
701	Basse-Normandie	P	75	\N
702	Polynésie française	PF	75	\N
703	Saint-Pierre-et-Miquelon	PM	75	\N
704	Haute-Normandie	Q	75	\N
705	Pays de la Loire	R	75	\N
706	La Réunion	RE	75	\N
707	Picardie	S	75	\N
708	Poitou-Charentes	T	75	\N
709	Terres australes françaises	TF	75	\N
710	Provence-Alpes-Côte d'Azur	U	75	\N
711	Rhône-Alpes	V	75	\N
712	Wallis-et-Futuna	WF	75	\N
713	Mayotte	YT	75	\N
714	Estuaire	1	76	\N
715	Haut-Ogooué	2	76	\N
716	Moyen-Ogooué	3	76	\N
717	Ngounié	4	76	\N
718	Nyanga	5	76	\N
719	Ogooué-Ivindo	6	76	\N
720	Ogooué-Lolo	7	76	\N
721	Ogooué-Maritime	8	76	\N
722	Woleu-Ntem	9	76	\N
723	Aberdeenshire	ABD	77	\N
724	Aberdeen City	ABE	77	\N
725	Argyll and Bute	AGB	77	\N
726	Isle of Anglesey;Sir Ynys Môn	AGY	77	\N
727	Angus	ANS	77	\N
728	Antrim	ANT	77	\N
729	Ards	ARD	77	\N
730	Armagh	ARM	77	\N
731	Bath and North East Somerset	BAS	77	\N
732	Blackburn with Darwen	BBD	77	\N
733	Bedford	BDF	77	\N
734	Barking and Dagenham	BDG	77	\N
735	Brent	BEN	77	\N
736	Bexley	BEX	77	\N
737	Belfast	BFS	77	\N
738	Bridgend;Pen-y-bont ar Ogwr	BGE	77	\N
739	Blaenau Gwent	BGW	77	\N
740	Birmingham	BIR	77	\N
741	Buckinghamshire	BKM	77	\N
742	Ballymena	BLA	77	\N
743	Ballymoney	BLY	77	\N
744	Bournemouth	BMH	77	\N
745	Banbridge	BNB	77	\N
746	Barnet	BNE	77	\N
747	Brighton and Hove	BNH	77	\N
748	Barnsley	BNS	77	\N
749	Bolton	BOL	77	\N
750	Blackpool	BPL	77	\N
751	Bracknell Forest	BRC	77	\N
752	Bradford	BRD	77	\N
753	Bromley	BRY	77	\N
754	Bristol, City of	BST	77	\N
755	Bury	BUR	77	\N
756	Cambridgeshire	CAM	77	\N
757	Caerphilly;Caerffili	CAY	77	\N
758	Central Bedfordshire	CBF	77	\N
759	Ceredigion;Sir Ceredigion	CGN	77	\N
760	Craigavon	CGV	77	\N
761	Cheshire East	CHE	77	\N
762	Cheshire West and Chester	CHW	77	\N
763	Carrickfergus	CKF	77	\N
764	Cookstown	CKT	77	\N
765	Calderdale	CLD	77	\N
766	Clackmannanshire	CLK	77	\N
767	Coleraine	CLR	77	\N
768	Cumbria	CMA	77	\N
769	Camden	CMD	77	\N
770	Carmarthenshire;Sir Gaerfyrddin	CMN	77	\N
771	Cornwall	CON	77	\N
772	Coventry	COV	77	\N
773	Cardiff;Caerdydd	CRF	77	\N
774	Croydon	CRY	77	\N
775	Castlereagh	CSR	77	\N
776	Conwy	CWY	77	\N
777	Darlington	DAL	77	\N
778	Derbyshire	DBY	77	\N
779	Denbighshire;Sir Ddinbych	DEN	77	\N
780	Derby	DER	77	\N
781	Devon	DEV	77	\N
782	Dungannon and South Tyrone	DGN	77	\N
783	Dumfries and Galloway	DGY	77	\N
784	Doncaster	DNC	77	\N
785	Dundee City	DND	77	\N
786	Dorset	DOR	77	\N
787	Down	DOW	77	\N
788	Derry	DRY	77	\N
789	Dudley	DUD	77	\N
790	Durham, County	DUR	77	\N
791	Ealing	EAL	77	\N
792	England and Wales	EAW	77	\N
793	East Ayrshire	EAY	77	\N
794	Edinburgh, City of	EDH	77	\N
795	East Dunbartonshire	EDU	77	\N
796	East Lothian	ELN	77	\N
797	Eilean Siar	ELS	77	\N
798	Enfield	ENF	77	\N
799	England	ENG	77	\N
800	East Renfrewshire	ERW	77	\N
801	East Riding of Yorkshire	ERY	77	\N
802	Essex	ESS	77	\N
803	East Sussex	ESX	77	\N
804	Falkirk	FAL	77	\N
805	Fermanagh	FER	77	\N
806	Fife	FIF	77	\N
807	Flintshire;Sir y Fflint	FLN	77	\N
808	Gateshead	GAT	77	\N
809	Great Britain	GBN	77	\N
810	Glasgow City	GLG	77	\N
811	Gloucestershire	GLS	77	\N
812	Greenwich	GRE	77	\N
813	Gwynedd	GWN	77	\N
814	Halton	HAL	77	\N
815	Hampshire	HAM	77	\N
816	Havering	HAV	77	\N
817	Hackney	HCK	77	\N
818	Herefordshire	HEF	77	\N
819	Hillingdon	HIL	77	\N
820	Highland	HLD	77	\N
821	Hammersmith and Fulham	HMF	77	\N
822	Hounslow	HNS	77	\N
823	Hartlepool	HPL	77	\N
824	Hertfordshire	HRT	77	\N
825	Harrow	HRW	77	\N
826	Haringey	HRY	77	\N
827	Isle of Wight	IOW	77	\N
828	Islington	ISL	77	\N
829	Inverclyde	IVC	77	\N
830	Kensington and Chelsea	KEC	77	\N
831	Kent	KEN	77	\N
832	Kingston upon Hull	KHL	77	\N
833	Kirklees	KIR	77	\N
834	Kingston upon Thames	KTT	77	\N
835	Knowsley	KWL	77	\N
836	Lancashire	LAN	77	\N
837	Lambeth	LBH	77	\N
838	Leicester	LCE	77	\N
839	Leeds	LDS	77	\N
840	Leicestershire	LEC	77	\N
841	Lewisham	LEW	77	\N
842	Lincolnshire	LIN	77	\N
843	Liverpool	LIV	77	\N
844	Limavady	LMV	77	\N
845	London, City of	LND	77	\N
846	Larne	LRN	77	\N
847	Lisburn	LSB	77	\N
848	Luton	LUT	77	\N
849	Manchester	MAN	77	\N
850	Middlesbrough	MDB	77	\N
851	Medway	MDW	77	\N
852	Magherafelt	MFT	77	\N
853	Milton Keynes	MIK	77	\N
854	Midlothian	MLN	77	\N
855	Monmouthshire;Sir Fynwy	MON	77	\N
856	Merton	MRT	77	\N
857	Moray	MRY	77	\N
858	Merthyr Tydfil;Merthyr Tudful	MTY	77	\N
859	Moyle	MYL	77	\N
860	North Ayrshire	NAY	77	\N
861	Northumberland	NBL	77	\N
862	North Down	NDN	77	\N
863	North East Lincolnshire	NEL	77	\N
864	Newcastle upon Tyne	NET	77	\N
865	Norfolk	NFK	77	\N
866	Nottingham	NGM	77	\N
867	Northern Ireland	NIR	77	\N
868	North Lanarkshire	NLK	77	\N
869	North Lincolnshire	NLN	77	\N
870	North Somerset	NSM	77	\N
871	Newtownabbey	NTA	77	\N
872	Northamptonshire	NTH	77	\N
873	Neath Port Talbot;Castell-nedd Port Talbot	NTL	77	\N
874	Nottinghamshire	NTT	77	\N
875	North Tyneside	NTY	77	\N
876	Newham	NWM	77	\N
877	Newport;Casnewydd	NWP	77	\N
878	North Yorkshire	NYK	77	\N
879	Newry and Mourne	NYM	77	\N
880	Oldham	OLD	77	\N
881	Omagh	OMH	77	\N
882	Orkney Islands	ORK	77	\N
883	Oxfordshire	OXF	77	\N
884	Pembrokeshire;Sir Benfro	PEM	77	\N
885	Perth and Kinross	PKN	77	\N
886	Plymouth	PLY	77	\N
887	Poole	POL	77	\N
888	Portsmouth	POR	77	\N
889	Powys	POW	77	\N
890	Peterborough	PTE	77	\N
891	Redcar and Cleveland	RCC	77	\N
892	Rochdale	RCH	77	\N
893	Rhondda, Cynon, Taff;Rhondda, Cynon,Taf	RCT	77	\N
894	Redbridge	RDB	77	\N
895	Reading	RDG	77	\N
896	Renfrewshire	RFW	77	\N
897	Richmond upon Thames	RIC	77	\N
898	Rotherham	ROT	77	\N
899	Rutland	RUT	77	\N
900	Sandwell	SAW	77	\N
901	South Ayrshire	SAY	77	\N
902	Scottish Borders, The	SCB	77	\N
903	Scotland	SCT	77	\N
904	Suffolk	SFK	77	\N
905	Sefton	SFT	77	\N
906	South Gloucestershire	SGC	77	\N
907	Sheffield	SHF	77	\N
908	St. Helens	SHN	77	\N
909	Shropshire	SHR	77	\N
910	Stockport	SKP	77	\N
911	Salford	SLF	77	\N
912	Slough	SLG	77	\N
913	South Lanarkshire	SLK	77	\N
914	Sunderland	SND	77	\N
915	Solihull	SOL	77	\N
916	Somerset	SOM	77	\N
917	Southend-on-Sea	SOS	77	\N
918	Surrey	SRY	77	\N
919	Strabane	STB	77	\N
920	Stoke-on-Trent	STE	77	\N
921	Stirling	STG	77	\N
922	Southampton	STH	77	\N
923	Sutton	STN	77	\N
924	Staffordshire	STS	77	\N
925	Stockton-on-Tees	STT	77	\N
926	South Tyneside	STY	77	\N
927	Swansea;Abertawe	SWA	77	\N
928	Swindon	SWD	77	\N
929	Southwark	SWK	77	\N
930	Tameside	TAM	77	\N
931	Telford and Wrekin	TFW	77	\N
932	Thurrock	THR	77	\N
933	Torbay	TOB	77	\N
934	Torfaen;Tor-faen	TOF	77	\N
935	Trafford	TRF	77	\N
936	Tower Hamlets	TWH	77	\N
937	United Kingdom	UKM	77	\N
938	Vale of Glamorgan, The;Bro Morgannwg	VGL	77	\N
939	Warwickshire	WAR	77	\N
940	West Berkshire	WBK	77	\N
941	West Dunbartonshire	WDU	77	\N
942	Waltham Forest	WFT	77	\N
943	Wigan	WGN	77	\N
944	Wakefield	WKF	77	\N
945	Walsall	WLL	77	\N
946	West Lothian	WLN	77	\N
947	Wales	WLS	77	\N
948	Wolverhampton	WLV	77	\N
949	Wandsworth	WND	77	\N
950	Windsor and Maidenhead	WNM	77	\N
951	Wokingham	WOK	77	\N
952	Worcestershire	WOR	77	\N
953	Wirral	WRL	77	\N
954	Warrington	WRT	77	\N
955	Wrexham;Wrecsam	WRX	77	\N
956	Westminster	WSM	77	\N
957	West Sussex	WSX	77	\N
958	York	YOR	77	\N
959	Shetland Islands	ZET	77	\N
960	Wiltshire	WIL	77	\N
961	Abkhazia	AB	79	\N
962	Ajaria	AJ	79	\N
963	Guria	GU	79	\N
964	Imeret’i	IM	79	\N
965	Kakhet’i	KA	79	\N
966	K’vemo K’art’li	KK	79	\N
967	Mts’khet’a-Mt’ianet’i	MM	79	\N
968	Racha-Lech’khumi-K’vemo Svanet’i	RL	79	\N
969	Samts’khe-Javakhet’i	SJ	79	\N
970	Shida K’art’li	SK	79	\N
971	Samegrelo-Zemo Svanet’i	SZ	79	\N
972	T’bilisi	TB	79	\N
973	Kommune Kujalleq	KU	84	\N
974	Qaasuitsup Kommunia	QA	84	\N
975	Qeqqata Kommunia	QE	84	\N
976	Kommuneqarfik Sermersooq	SM	84	\N
977	Agio Oros	69	89	\N
978	Anatoliki Makedonia kai Thraki	A	89	\N
979	Kentriki Makedonia	B	89	\N
980	Dytiki Makedonia	C	89	\N
981	Ipeiros	D	89	\N
982	Thessalia	E	89	\N
983	Ionia Nisia	F	89	\N
984	Dytiki Ellada	G	89	\N
985	Sterea Ellada	H	89	\N
986	Attiki	I	89	\N
987	Peloponnisos	J	89	\N
988	Voreio Aigaio	K	89	\N
989	Notio Aigaio	L	89	\N
990	Kriti	M	89	\N
991	Alta Verapaz	AV	91	\N
992	Baja Verapaz	BV	91	\N
993	Chimaltenango	CM	91	\N
994	Chiquimula	CQ	91	\N
995	Escuintla	ES	91	\N
996	Guatemala	GU	91	\N
997	Huehuetenango	HU	91	\N
998	Izabal	IZ	91	\N
999	Jalapa	JA	91	\N
1000	Jutiapa	JU	91	\N
1001	Petén	PE	91	\N
1002	El Progreso	PR	91	\N
1003	Quiché	QC	91	\N
1004	Quetzaltenango	QZ	91	\N
1005	Retalhuleu	RE	91	\N
1006	Sacatepéquez	SA	91	\N
1007	San Marcos	SM	91	\N
1008	Sololá	SO	91	\N
1009	Santa Rosa	SR	91	\N
1010	Suchitepéquez	SU	91	\N
1011	Totonicapán	TO	91	\N
1012	Zacapa	ZA	91	\N
1013	Bissau	BS	93	\N
1014	Leste	L	93	\N
1015	Norte	N	93	\N
1016	Sul	S	93	\N
1017	Atlántida	AT	97	\N
1018	Choluteca	CH	97	\N
1019	Colón	CL	97	\N
1020	Comayagua	CM	97	\N
1021	Copán	CP	97	\N
1022	Cortés	CR	97	\N
1023	El Paraíso	EP	97	\N
1024	Francisco Morazán	FM	97	\N
1025	Gracias a Dios	GD	97	\N
1026	Islas de la Bahía	IB	97	\N
1027	Intibucá	IN	97	\N
1028	Lempira	LE	97	\N
1029	La Paz	LP	97	\N
1030	Ocotepeque	OC	97	\N
1031	Olancho	OL	97	\N
1032	Santa Bárbara	SB	97	\N
1033	Valle	VA	97	\N
1034	Yoro	YO	97	\N
1035	Zagrebačka županija	01	98	\N
1036	Krapinsko-zagorska županija	02	98	\N
1037	Sisačko-moslavačka županija	03	98	\N
1038	Karlovačka županija	04	98	\N
1039	Varaždinska županija	05	98	\N
1040	Koprivničko-križevačka županija	06	98	\N
1041	Bjelovarsko-bilogorska županija	07	98	\N
1042	Primorsko-goranska županija	08	98	\N
1043	Ličko-senjska županija	09	98	\N
1044	Virovitičko-podravska županija	10	98	\N
1045	Požeško-slavonska županija	11	98	\N
1046	Brodsko-posavska županija	12	98	\N
1047	Zadarska županija	13	98	\N
1048	Osječko-baranjska županija	14	98	\N
1049	Šibensko-kninska županija	15	98	\N
1050	Vukovarsko-srijemska županija	16	98	\N
1051	Splitsko-dalmatinska županija	17	98	\N
1052	Istarska županija	18	98	\N
1053	Dubrovačko-neretvanska županija	19	98	\N
1054	Međimurska županija	20	98	\N
1055	Grad Zagreb	21	98	\N
1056	Artibonite	AR	99	\N
1057	Centre	CE	99	\N
1058	Grande-Anse	GA	99	\N
1059	Nord	ND	99	\N
1060	Nord-Est	NE	99	\N
1061	Nord-Ouest	NO	99	\N
1062	Ouest	OU	99	\N
1063	Sud	SD	99	\N
1064	Sud-Est	SE	99	\N
1065	Baranya	BA	100	\N
1066	Békéscsaba	BC	100	\N
1067	Békés	BE	100	\N
1068	Bács-Kiskun	BK	100	\N
1069	Budapest	BU	100	\N
1070	Borsod-Abaúj-Zemplén	BZ	100	\N
1071	Csongrád	CS	100	\N
1072	Debrecen	DE	100	\N
1073	Dunaújváros	DU	100	\N
1074	Eger	EG	100	\N
1075	Érd	ER	100	\N
1076	Fejér	FE	100	\N
1077	Győr-Moson-Sopron	GS	100	\N
1078	Győr	GY	100	\N
1079	Hajdú-Bihar	HB	100	\N
1080	Heves	HE	100	\N
1081	Hódmezővásárhely	HV	100	\N
1082	Jász-Nagykun-Szolnok	JN	100	\N
1083	Komárom-Esztergom	KE	100	\N
1084	Kecskemét	KM	100	\N
1085	Kaposvár	KV	100	\N
1086	Miskolc	MI	100	\N
1087	Nagykanizsa	NK	100	\N
1088	Nógrád	NO	100	\N
1089	Nyíregyháza	NY	100	\N
1090	Pest	PE	100	\N
1091	Pécs	PS	100	\N
1092	Szeged	SD	100	\N
1093	Székesfehérvár	SF	100	\N
1094	Szombathely	SH	100	\N
1095	Szolnok	SK	100	\N
1096	Sopron	SN	100	\N
1097	Somogy	SO	100	\N
1098	Szekszárd	SS	100	\N
1099	Salgótarján	ST	100	\N
1100	Szabolcs-Szatmár-Bereg	SZ	100	\N
1101	Tatabánya	TB	100	\N
1102	Tolna	TO	100	\N
1103	Vas	VA	100	\N
1104	Veszprém (county)	VE	100	\N
1105	Veszprém	VM	100	\N
1106	Zala	ZA	100	\N
1107	Zalaegerszeg	ZE	100	\N
1108	Papua	IJ	101	\N
1109	Jawa	JW	101	\N
1110	Kalimantan	KA	101	\N
1111	Maluku	ML	101	\N
1112	Nusa Tenggara	NU	101	\N
1113	Sulawesi	SL	101	\N
1114	Sumatera	SM	101	\N
1115	HaDarom	D	103	\N
1116	Hefa	HA	103	\N
1117	Yerushalayim Al Quds	JM	103	\N
1118	HaMerkaz	M	103	\N
1119	Tel-Aviv	TA	103	\N
1120	HaZafon	Z	103	\N
1121	Andaman and Nicobar Islands	AN	105	\N
1122	Andhra Pradesh	AP	105	\N
1123	Arunachal Pradesh	AR	105	\N
1124	Assam	AS	105	\N
1125	Bihar	BR	105	\N
1126	Chandigarh	CH	105	\N
1127	Chhattisgarh	CT	105	\N
1128	Damen and Diu	DD	105	\N
1129	Delhi	DL	105	\N
1130	Dadra and Nagar Haveli	DN	105	\N
1131	Goa	GA	105	\N
1132	Gujarat	GJ	105	\N
1133	Himachal Pradesh	HP	105	\N
1134	Haryana	HR	105	\N
1135	Jharkhand	JH	105	\N
1136	Jammu and Kashmir	JK	105	\N
1137	Karnataka	KA	105	\N
1138	Kerala	KL	105	\N
1139	Lakshadweep	LD	105	\N
1140	Maharashtra	MH	105	\N
1141	Meghalaya	ML	105	\N
1142	Manipur	MN	105	\N
1143	Madhya Pradesh	MP	105	\N
1144	Mizoram	MZ	105	\N
1145	Nagaland	NL	105	\N
1146	Orissa	OR	105	\N
1147	Punjab	PB	105	\N
1148	Puducherry	PY	105	\N
1149	Rajasthan	RJ	105	\N
1150	Sikkim	SK	105	\N
1151	Tamil Nadu	TN	105	\N
1152	Tripura	TR	105	\N
1153	Uttar Pradesh	UP	105	\N
1154	Uttarakhand	UT	105	\N
1155	West Bengal	WB	105	\N
1156	Al Anbar	AN	107	\N
1157	Arbil	AR	107	\N
1158	Al Basrah	BA	107	\N
1159	Babil	BB	107	\N
1160	Baghdad	BG	107	\N
1161	Dahuk	DA	107	\N
1162	Diyala	DI	107	\N
1163	Dhi Qar	DQ	107	\N
1164	Karbala'	KA	107	\N
1165	Maysan	MA	107	\N
1166	Al Muthanna	MU	107	\N
1167	An Najef	NA	107	\N
1168	Ninawa	NI	107	\N
1169	Al Qadisiyah	QA	107	\N
1170	Salah ad Din	SD	107	\N
1171	As Sulaymaniyah	SW	107	\N
1172	At Ta'mim	TS	107	\N
1173	Wasit	WA	107	\N
1174	Āzarbāyjān-e Sharqī	01	108	\N
1175	Āzarbāyjān-e Gharbī	02	108	\N
1176	Ardabīl	03	108	\N
1177	Eşfahān	04	108	\N
1178	Īlām	05	108	\N
1179	Būshehr	06	108	\N
1180	Tehrān	07	108	\N
1181	Chahār Mahāll va Bakhtīārī	08	108	\N
1182	Khūzestān	10	108	\N
1183	Zanjān	11	108	\N
1184	Semnān	12	108	\N
1185	Sīstān va Balūchestān	13	108	\N
1186	Fārs	14	108	\N
1187	Kermān	15	108	\N
1188	Kordestān	16	108	\N
1189	Kermānshāh	17	108	\N
1190	Kohgīlūyeh va Būyer Ahmad	18	108	\N
1191	Gīlān	19	108	\N
1192	Lorestān	20	108	\N
1193	Māzandarān	21	108	\N
1194	Markazī	22	108	\N
1195	Hormozgān	23	108	\N
1196	Hamadān	24	108	\N
1197	Yazd	25	108	\N
1198	Qom	26	108	\N
1199	Golestān	27	108	\N
1200	Qazvīn	28	108	\N
1201	Khorāsān-e Janūbī	29	108	\N
1202	Khorāsān-e Razavī	30	108	\N
1203	Khorāsān-e Shemālī	31	108	\N
1204	Reykjavík	0	109	\N
1205	Höfuðborgarsvæðið	1	109	\N
1206	Suðurnes	2	109	\N
1207	Vesturland	3	109	\N
1208	Vestfirðir	4	109	\N
1209	Norðurland vestra	5	109	\N
1210	Norðurland eystra	6	109	\N
1211	Austurland	7	109	\N
1212	Suðurland	8	109	\N
1213	Piemonte	21	110	\N
1214	Valle d'Aosta	23	110	\N
1215	Lombardia	25	110	\N
1216	Trentino-Alto Adige	32	110	\N
1217	Veneto	34	110	\N
1218	Friuli-Venezia Giulia	36	110	\N
1219	Liguria	42	110	\N
1220	Emilia-Romagna	45	110	\N
1221	Toscana	52	110	\N
1222	Umbria	55	110	\N
1223	Marche	57	110	\N
1224	Lazio	62	110	\N
1225	Abruzzo	65	110	\N
1226	Molise	67	110	\N
1227	Campania	72	110	\N
1228	Puglia	75	110	\N
1229	Basilicata	77	110	\N
1230	Calabria	78	110	\N
1231	Sicilia	82	110	\N
1232	Sardegna	88	110	\N
1233	Kingston	01	112	\N
1234	Saint Andrew	02	112	\N
1235	Saint Thomas	03	112	\N
1236	Portland	04	112	\N
1237	Saint Mary	05	112	\N
1238	Saint Ann	06	112	\N
1239	Trelawny	07	112	\N
1240	Saint James	08	112	\N
1241	Hanover	09	112	\N
1242	Westmoreland	10	112	\N
1243	Saint Elizabeth	11	112	\N
1244	Manchester	12	112	\N
1245	Clarendon	13	112	\N
1246	Saint Catherine	14	112	\N
1247	‘Ajlūn	AJ	113	\N
1248	‘Ammān (Al ‘Aşimah)	AM	113	\N
1249	Al ‘Aqabah	AQ	113	\N
1250	Aţ Ţafīlah	AT	113	\N
1251	Az Zarqā'	AZ	113	\N
1252	Al Balqā'	BA	113	\N
1253	Irbid	IR	113	\N
1254	Jarash	JA	113	\N
1255	Al Karak	KA	113	\N
1256	Al Mafraq	MA	113	\N
1257	Mādabā	MD	113	\N
1258	Ma‘ān	MN	113	\N
1259	Hokkaido	01	114	\N
1260	Aomori	02	114	\N
1261	Iwate	03	114	\N
1262	Miyagi	04	114	\N
1263	Akita	05	114	\N
1264	Yamagata	06	114	\N
1265	Fukushima	07	114	\N
1266	Ibaraki	08	114	\N
1267	Tochigi	09	114	\N
1268	Gunma	10	114	\N
1269	Saitama	11	114	\N
1270	Chiba	12	114	\N
1271	Tokyo	13	114	\N
1272	Kanagawa	14	114	\N
1273	Niigata	15	114	\N
1274	Toyama	16	114	\N
1275	Ishikawa	17	114	\N
1276	Fukui	18	114	\N
1277	Yamanashi	19	114	\N
1278	Nagano	20	114	\N
1279	Gifu	21	114	\N
1280	Shizuoka	22	114	\N
1281	Aichi	23	114	\N
1282	Mie	24	114	\N
1283	Shiga	25	114	\N
1284	Kyoto	26	114	\N
1285	Osaka	27	114	\N
1286	Hyogo	28	114	\N
1287	Nara	29	114	\N
1288	Wakayama	30	114	\N
1289	Tottori	31	114	\N
1290	Shimane	32	114	\N
1291	Okayama	33	114	\N
1292	Hiroshima	34	114	\N
1293	Yamaguchi	35	114	\N
1294	Tokushima	36	114	\N
1295	Kagawa	37	114	\N
1296	Ehime	38	114	\N
1297	Kochi	39	114	\N
1298	Fukuoka	40	114	\N
1299	Saga	41	114	\N
1300	Nagasaki	42	114	\N
1301	Kumamoto	43	114	\N
1302	Oita	44	114	\N
1303	Miyazaki	45	114	\N
1304	Kagoshima	46	114	\N
1305	Okinawa	47	114	\N
1306	Nairobi Municipality	110	115	\N
1307	Central	200	115	\N
1308	Coast	300	115	\N
1309	Eastern	400	115	\N
1310	North-Eastern Kaskazini Mashariki	500	115	\N
1311	Rift Valley	700	115	\N
1312	Western Magharibi	800	115	\N
1313	Batken	B	116	\N
1314	Chü	C	116	\N
1315	Bishkek	GB	116	\N
1316	Jalal-Abad	J	116	\N
1317	Naryn	N	116	\N
1318	Osh	O	116	\N
1319	Talas	T	116	\N
1320	Ysyk-Köl	Y	116	\N
1321	Banteay Mean Chey	1	117	\N
1322	Krachoh	10	117	\N
1323	Mondol Kiri	11	117	\N
1324	Phnom Penh	12	117	\N
1325	Preah Vihear	13	117	\N
1326	Prey Veaeng	14	117	\N
1327	Pousaat	15	117	\N
1328	Rotanak Kiri	16	117	\N
1329	Siem Reab	17	117	\N
1330	Krong Preah Sihanouk	18	117	\N
1331	Stueng Traeng	19	117	\N
1332	Battambang	2	117	\N
1333	Svaay Rieng	20	117	\N
1334	Taakaev	21	117	\N
1335	Otdar Mean Chey	22	117	\N
1336	Krong Kaeb	23	117	\N
1337	Krong Pailin	24	117	\N
1338	Kampong Cham	3	117	\N
1339	Kampong Chhnang	4	117	\N
1340	Kampong Speu	5	117	\N
1341	Kampong Thom	6	117	\N
1342	Kampot	7	117	\N
1343	Kandal	8	117	\N
1344	Kach Kong	9	117	\N
1345	Seoul Teugbyeolsi	11	122	\N
1346	Busan Gwang'yeogsi	26	122	\N
1347	Daegu Gwang'yeogsi	27	122	\N
1348	Incheon Gwang'yeogsi	28	122	\N
1349	Gwangju Gwang'yeogsi	29	122	\N
1350	Daejeon Gwang'yeogsi	30	122	\N
1351	Ulsan Gwang'yeogsi	31	122	\N
1352	Gyeonggido	41	122	\N
1353	Gang'weondo	42	122	\N
1354	Chungcheongbukdo	43	122	\N
1355	Chungcheongnamdo	44	122	\N
1356	Jeonrabukdo	45	122	\N
1357	Jeonranamdo	46	122	\N
1358	Gyeongsangbukdo	47	122	\N
1359	Gyeongsangnamdo	48	122	\N
1360	Jejudo	49	122	\N
1361	Al Ahmadi	AH	123	\N
1362	Al Farwānīyah	FA	123	\N
1363	Hawallī	HA	123	\N
1364	Al Jahrrā’	JA	123	\N
1365	Al Kuwayt (Al ‘Āşimah)	KU	123	\N
1366	Mubārak al Kabīr	MU	123	\N
1367	Aqmola oblysy	AKM	125	\N
1368	Aqtöbe oblysy	AKT	125	\N
1369	Almaty	ALA	125	\N
1370	Almaty oblysy	ALM	125	\N
1371	Astana	AST	125	\N
1372	Atyraū oblysy	ATY	125	\N
1373	Qaraghandy oblysy	KAR	125	\N
1374	Qostanay oblysy	KUS	125	\N
1375	Qyzylorda oblysy	KZY	125	\N
1376	Mangghystaū oblysy	MAN	125	\N
1377	Pavlodar oblysy	PAV	125	\N
1378	Soltüstik Quzaqstan oblysy	SEV	125	\N
1379	Shyghys Qazaqstan oblysy	VOS	125	\N
1380	Ongtüstik Qazaqstan oblysy	YUZ	125	\N
1381	Batys Quzaqstan oblysy	ZAP	125	\N
1382	Zhambyl oblysy	ZHA	125	\N
1383	Attapu	AT	126	\N
1384	Bokèo	BK	126	\N
1385	Bolikhamxai	BL	126	\N
1386	Champasak	CH	126	\N
1387	Houaphan	HO	126	\N
1388	Khammouan	KH	126	\N
1389	Louang Namtha	LM	126	\N
1390	Louangphabang	LP	126	\N
1391	Oudômxai	OU	126	\N
1392	Phôngsali	PH	126	\N
1393	Salavan	SL	126	\N
1394	Savannakhét	SV	126	\N
1395	Vientiane	VI	126	\N
1396	Vientiane	VT	126	\N
1397	Xaignabouli	XA	126	\N
1398	Xékong	XE	126	\N
1399	Xiangkhoang	XI	126	\N
1400	Xiasômboun	XN	126	\N
1401	Aakkâr	AK	127	\N
1402	Liban-Nord	AS	127	\N
1403	Beyrouth	BA	127	\N
1404	Baalbek-Hermel	BH	127	\N
1405	Béqaa	BI	127	\N
1406	Liban-Sud	JA	127	\N
1407	Mont-Liban	JL	127	\N
1408	Nabatîyé	NA	127	\N
1409	Balzers	01	129	\N
1410	Eschen	02	129	\N
1411	Gamprin	03	129	\N
1412	Mauren	04	129	\N
1413	Planken	05	129	\N
1414	Ruggell	06	129	\N
1415	Schaan	07	129	\N
1416	Schellenberg	08	129	\N
1417	Triesen	09	129	\N
1418	Triesenberg	10	129	\N
1419	Vaduz	11	129	\N
1420	Basnāhira paḷāta	1	130	\N
1421	Madhyama paḷāta	2	130	\N
1422	Dakuṇu paḷāta	3	130	\N
1423	Uturu paḷāta	4	130	\N
1424	Næ̆gĕnahira paḷāta	5	130	\N
1425	Vayamba paḷāta	6	130	\N
1426	Uturumæ̆da paḷāta	7	130	\N
1427	Ūva paḷāta	8	130	\N
1428	Sabaragamuva paḷāta	9	130	\N
1429	Bong	BG	131	\N
1430	Bomi	BM	131	\N
1431	Grand Cape Mount	CM	131	\N
1432	Grand Bassa	GB	131	\N
1433	Grand Gedeh	GG	131	\N
1434	Grand Kru	GK	131	\N
1435	Lofa	LO	131	\N
1436	Margibi	MG	131	\N
1437	Montserrado	MO	131	\N
1438	Maryland	MY	131	\N
1439	Nimba	NI	131	\N
1440	Rivercess	RI	131	\N
1441	Sinoe	SI	131	\N
1442	Maseru	A	132	\N
1443	Butha-Buthe	B	132	\N
1444	Leribe	C	132	\N
1445	Berea	D	132	\N
1446	Mafeteng	E	132	\N
1447	Mohale's Hoek	F	132	\N
1448	Quthing	G	132	\N
1449	Qacha's Nek	H	132	\N
1450	Mokhotlong	J	132	\N
1451	Thaba-Tseka	K	132	\N
1452	Alytaus Apskritis	AL	133	\N
1453	Klaipėdos Apskritis	KL	133	\N
1454	Kauno Apskritis	KU	133	\N
1455	Marijampolės Apskritis	MR	133	\N
1456	Panevėžio Apskritis	PN	133	\N
1457	Šiaulių Apskritis	SA	133	\N
1458	Tauragés Apskritis	TA	133	\N
1459	Telšių Apskritis	TE	133	\N
1460	Utenos Apskritis	UT	133	\N
1461	Vilniaus Apskritis	VL	133	\N
1462	Diekirch	D	134	\N
1463	Grevenmacher	G	134	\N
1464	Luxembourg	L	134	\N
1465	Aglonas novads	001	135	\N
1466	Aizkraukles novads	002	135	\N
1467	Aizputes novads	003	135	\N
1468	Aknīstes novads	004	135	\N
1469	Alojas novads	005	135	\N
1470	Alsungas novads	006	135	\N
1471	Alūksnes novads	007	135	\N
1472	Amatas novads	008	135	\N
1473	Apes novads	009	135	\N
1474	Auces novads	010	135	\N
1475	Ādažu novads	011	135	\N
1476	Babītes novads	012	135	\N
1477	Baldones novads	013	135	\N
1478	Baltinavas novads	014	135	\N
1479	Balvu novads	015	135	\N
1480	Bauskas novads	016	135	\N
1481	Beverīnas novads	017	135	\N
1482	Brocēnu novads	018	135	\N
1483	Burtnieku novads	019	135	\N
1484	Carnikavas novads	020	135	\N
1485	Cesvaines novads	021	135	\N
1486	Cēsu novads	022	135	\N
1487	Ciblas novads	023	135	\N
1488	Dagdas novads	024	135	\N
1489	Daugavpils novads	025	135	\N
1490	Dobeles novads	026	135	\N
1491	Dundagas novads	027	135	\N
1492	Durbes novads	028	135	\N
1493	Engures novads	029	135	\N
1494	Ērgļu novads	030	135	\N
1495	Garkalnes novads	031	135	\N
1496	Grobiņas novads	032	135	\N
1497	Gulbenes novads	033	135	\N
1498	Iecavas novads	034	135	\N
1499	Ikšķiles novads	035	135	\N
1500	Ilūkstes novads	036	135	\N
1501	Inčukalna novads	037	135	\N
1502	Jaunjelgavas novads	038	135	\N
1503	Jaunpiebalgas novads	039	135	\N
1504	Jaunpils novads	040	135	\N
1505	Jelgavas novads	041	135	\N
1506	Jēkabpils novads	042	135	\N
1507	Kandavas novads	043	135	\N
1508	Kārsavas novads	044	135	\N
1509	Kocēnu novads	045	135	\N
1510	Kokneses novads	046	135	\N
1511	Krāslavas novads	047	135	\N
1512	Krimuldas novads	048	135	\N
1513	Krustpils novads	049	135	\N
1514	Kuldīgas novads	050	135	\N
1515	Ķeguma novads	051	135	\N
1516	Ķekavas novads	052	135	\N
1517	Lielvārdes novads	053	135	\N
1518	Limbažu novads	054	135	\N
1519	Līgatnes novads	055	135	\N
1520	Līvānu novads	056	135	\N
1521	Lubānas novads	057	135	\N
1522	Ludzas novads	058	135	\N
1523	Madonas novads	059	135	\N
1524	Mazsalacas novads	060	135	\N
1525	Mālpils novads	061	135	\N
1526	Mārupes novads	062	135	\N
1527	Mērsraga novads	063	135	\N
1528	Naukšēnu novads	064	135	\N
1529	Neretas novads	065	135	\N
1530	Nīcas novads	066	135	\N
1531	Ogres novads	067	135	\N
1532	Olaines novads	068	135	\N
1533	Ozolnieku novads	069	135	\N
1534	Pārgaujas novads	070	135	\N
1535	Pāvilostas novads	071	135	\N
1536	Pļaviņu novads	072	135	\N
1537	Preiļu novads	073	135	\N
1538	Priekules novads	074	135	\N
1539	Priekuļu novads	075	135	\N
1540	Raunas novads	076	135	\N
1541	Rēzeknes novads	077	135	\N
1542	Riebiņu novads	078	135	\N
1543	Rojas novads	079	135	\N
1544	Ropažu novads	080	135	\N
1545	Rucavas novads	081	135	\N
1546	Rugāju novads	082	135	\N
1547	Rundāles novads	083	135	\N
1548	Rūjienas novads	084	135	\N
1549	Salas novads	085	135	\N
1550	Salacgrīvas novads	086	135	\N
1551	Salaspils novads	087	135	\N
1552	Saldus novads	088	135	\N
1553	Saulkrastu novads	089	135	\N
1554	Sējas novads	090	135	\N
1555	Siguldas novads	091	135	\N
1556	Skrīveru novads	092	135	\N
1557	Skrundas novads	093	135	\N
1558	Smiltenes novads	094	135	\N
1559	Stopiņu novads	095	135	\N
1560	Strenču novads	096	135	\N
1561	Talsu novads	097	135	\N
1562	Tērvetes novads	098	135	\N
1563	Tukuma novads	099	135	\N
1564	Vaiņodes novads	100	135	\N
1565	Valkas novads	101	135	\N
1566	Varakļānu novads	102	135	\N
1567	Vārkavas novads	103	135	\N
1568	Vecpiebalgas novads	104	135	\N
1569	Vecumnieku novads	105	135	\N
1570	Ventspils novads	106	135	\N
1571	Viesītes novads	107	135	\N
1572	Viļakas novads	108	135	\N
1573	Viļānu novads	109	135	\N
1574	Zilupes novads	110	135	\N
1575	Daugavpils	DGV	135	\N
1576	Jelgava	JEL	135	\N
1577	Jēkabpils	JKB	135	\N
1578	Jūrmala	JUR	135	\N
1579	Liepāja	LPX	135	\N
1580	Rēzekne	REZ	135	\N
1581	Rīga	RIX	135	\N
1582	Ventspils	VEN	135	\N
1583	Valmiera	VMR	135	\N
1584	Tanger-Tétouan	01	137	\N
1585	Gharb-Chrarda-Beni Hssen	02	137	\N
1586	Taza-Al Hoceima-Taounate	03	137	\N
1587	L'Oriental	04	137	\N
1588	Fès-Boulemane	05	137	\N
1589	Meknès-Tafilalet	06	137	\N
1590	Rabat-Salé-Zemmour-Zaer	07	137	\N
1591	Grand Casablanca	08	137	\N
1592	Chaouia-Ouardigha	09	137	\N
1593	Doukhala-Abda	10	137	\N
1594	Marrakech-Tensift-Al Haouz	11	137	\N
1595	Tadla-Azilal	12	137	\N
1596	Sous-Massa-Draa	13	137	\N
1597	Guelmim-Es Smara	14	137	\N
1598	Laâyoune-Boujdour-Sakia el Hamra	15	137	\N
1599	Oued ed Dahab-Lagouira	16	137	\N
1600	La Colle	CL	138	\N
1601	La Condamine	CO	138	\N
1602	Fontvieille	FO	138	\N
1603	La Gare	GA	138	\N
1604	Jardin Exotique	JE	138	\N
1605	Larvotto	LA	138	\N
1606	Malbousquet	MA	138	\N
1607	Monte-Carlo	MC	138	\N
1608	Moneghetti	MG	138	\N
1609	Monaco-Ville	MO	138	\N
1610	Moulins	MU	138	\N
1611	Port-Hercule	PH	138	\N
1612	Sainte-Dévote	SD	138	\N
1613	La Source	SO	138	\N
1614	Spélugues	SP	138	\N
1615	Saint-Roman	SR	138	\N
1616	Vallon de la Rousse	VR	138	\N
1617	Anenii Noi	AN	139	\N
1618	Bălți	BA	139	\N
1619	Tighina	BD	139	\N
1620	Briceni	BR	139	\N
1621	Basarabeasca	BS	139	\N
1622	Cahul	CA	139	\N
1623	Călărași	CL	139	\N
1624	Cimișlia	CM	139	\N
1625	Criuleni	CR	139	\N
1626	Căușeni	CS	139	\N
1627	Cantemir	CT	139	\N
1628	Chișinău	CU	139	\N
1629	Dondușeni	DO	139	\N
1630	Drochia	DR	139	\N
1631	Dubăsari	DU	139	\N
1632	Edineț	ED	139	\N
1633	Fălești	FA	139	\N
1634	Florești	FL	139	\N
1635	Găgăuzia, Unitatea teritorială autonomă	GA	139	\N
1636	Glodeni	GL	139	\N
1637	Hîncești	HI	139	\N
1638	Ialoveni	IA	139	\N
1639	Leova	LE	139	\N
1640	Nisporeni	NI	139	\N
1641	Ocnița	OC	139	\N
1642	Orhei	OR	139	\N
1643	Rezina	RE	139	\N
1644	Rîșcani	RI	139	\N
1645	Șoldănești	SD	139	\N
1646	Sîngerei	SI	139	\N
1647	Stînga Nistrului, unitatea teritorială din	SN	139	\N
1648	Soroca	SO	139	\N
1649	Strășeni	ST	139	\N
1650	Ștefan Vodă	SV	139	\N
1651	Taraclia	TA	139	\N
1652	Telenești	TE	139	\N
1653	Ungheni	UN	139	\N
1654	Andrijevica	01	140	\N
1655	Bar	02	140	\N
1656	Berane	03	140	\N
1657	Bijelo Polje	04	140	\N
1658	Budva	05	140	\N
1659	Cetinje	06	140	\N
1660	Danilovgrad	07	140	\N
1661	Herceg-Novi	08	140	\N
1662	Kolašin	09	140	\N
1663	Kotor	10	140	\N
1664	Mojkovac	11	140	\N
1665	Nikšić	12	140	\N
1666	Plav	13	140	\N
1667	Pljevlja	14	140	\N
1668	Plužine	15	140	\N
1669	Podgorica	16	140	\N
1670	Rožaje	17	140	\N
1671	Šavnik	18	140	\N
1672	Tivat	19	140	\N
1673	Ulcinj	20	140	\N
1674	Žabljak	21	140	\N
1675	Toamasina	A	142	\N
1676	Antsiranana	D	142	\N
1677	Fianarantsoa	F	142	\N
1678	Mahajanga	M	142	\N
1679	Antananarivo	T	142	\N
1680	Toliara	U	142	\N
1681	Ralik chain	L	143	\N
1682	Ratak chain	T	143	\N
1683	Aerodrom	01	144	\N
1684	Aračinovo	02	144	\N
1685	Berovo	03	144	\N
1686	Bitola	04	144	\N
1687	Bogdanci	05	144	\N
1688	Bogovinje	06	144	\N
1689	Bosilovo	07	144	\N
1690	Brvenica	08	144	\N
1691	Butel	09	144	\N
1692	Valandovo	10	144	\N
1693	Vasilevo	11	144	\N
1694	Vevčani	12	144	\N
1695	Veles	13	144	\N
1696	Vinica	14	144	\N
1697	Vraneštica	15	144	\N
1698	Vrapčište	16	144	\N
1699	Gazi Baba	17	144	\N
1700	Gevgelija	18	144	\N
1701	Gostivar	19	144	\N
1702	Gradsko	20	144	\N
1703	Debar	21	144	\N
1704	Debarca	22	144	\N
1705	Delčevo	23	144	\N
1706	Demir Kapija	24	144	\N
1707	Demir Hisar	25	144	\N
1708	Dojran	26	144	\N
1709	Dolneni	27	144	\N
1710	Drugovo	28	144	\N
1711	Gjorče Petrov	29	144	\N
1712	Želino	30	144	\N
1713	Zajas	31	144	\N
1714	Zelenikovo	32	144	\N
1715	Zrnovci	33	144	\N
1716	Ilinden	34	144	\N
1717	Jegunovce	35	144	\N
1718	Kavadarci	36	144	\N
1719	Karbinci	37	144	\N
1720	Karpoš	38	144	\N
1721	Kisela Voda	39	144	\N
1722	Kičevo	40	144	\N
1723	Konče	41	144	\N
1724	Kočani	42	144	\N
1725	Kratovo	43	144	\N
1726	Kriva Palanka	44	144	\N
1727	Krivogaštani	45	144	\N
1728	Kruševo	46	144	\N
1729	Kumanovo	47	144	\N
1730	Lipkovo	48	144	\N
1731	Lozovo	49	144	\N
1732	Mavrovo-i-Rostuša	50	144	\N
1733	Makedonska Kamenica	51	144	\N
1734	Makedonski Brod	52	144	\N
1735	Mogila	53	144	\N
1736	Negotino	54	144	\N
1737	Novaci	55	144	\N
1738	Novo Selo	56	144	\N
1739	Oslomej	57	144	\N
1740	Ohrid	58	144	\N
1741	Petrovec	59	144	\N
1742	Pehčevo	60	144	\N
1743	Plasnica	61	144	\N
1744	Prilep	62	144	\N
1745	Probištip	63	144	\N
1746	Radoviš	64	144	\N
1747	Rankovce	65	144	\N
1748	Resen	66	144	\N
1749	Rosoman	67	144	\N
1750	Saraj	68	144	\N
1751	Sveti Nikole	69	144	\N
1752	Sopište	70	144	\N
1753	Staro Nagoričane	71	144	\N
1754	Struga	72	144	\N
1755	Strumica	73	144	\N
1756	Studeničani	74	144	\N
1757	Tearce	75	144	\N
1758	Tetovo	76	144	\N
1759	Centar	77	144	\N
1760	Centar Župa	78	144	\N
1761	Čair	79	144	\N
1762	Čaška	80	144	\N
1763	Češinovo-Obleševo	81	144	\N
1764	Čučer Sandevo	82	144	\N
1765	Štip	83	144	\N
1766	Šuto Orizari	84	144	\N
1767	Sagaing	01	146	\N
1768	Bago	02	146	\N
1769	Magway	03	146	\N
1770	Mandalay	04	146	\N
1771	Tanintharyi	05	146	\N
1772	Yangon	06	146	\N
1773	Ayeyarwady	07	146	\N
1774	Kachin	11	146	\N
1775	Kayah	12	146	\N
1776	Kayin	13	146	\N
1777	Chin	14	146	\N
1778	Mon	15	146	\N
1779	Rakhine	16	146	\N
1780	Shan	17	146	\N
1781	Orhon	035	147	\N
1782	Darhan uul	037	147	\N
1783	Hentiy	039	147	\N
1784	Hövsgöl	041	147	\N
1785	Hovd	043	147	\N
1786	Uvs	046	147	\N
1787	Töv	047	147	\N
1788	Selenge	049	147	\N
1789	Sühbaatar	051	147	\N
1790	Ömnögovi	053	147	\N
1791	Övörhangay	055	147	\N
1792	Dzavhan	057	147	\N
1793	Dundgovi	059	147	\N
1794	Dornod	061	147	\N
1795	Dornogovi	063	147	\N
1796	Govi-Sumber	064	147	\N
1797	Govi-Altay	065	147	\N
1798	Bulgan	067	147	\N
1799	Bayanhongor	069	147	\N
1800	Bayan-Ölgiy	071	147	\N
1801	Arhangay	073	147	\N
1802	Ulanbaatar	1	147	\N
1803	Attard	01	153	\N
1804	Balzan	02	153	\N
1805	Birgu	03	153	\N
1806	Birkirkara	04	153	\N
1807	Birżebbuġa	05	153	\N
1808	Bormla	06	153	\N
1809	Dingli	07	153	\N
1810	Fgura	08	153	\N
1811	Floriana	09	153	\N
1812	Fontana	10	153	\N
1813	Gudja	11	153	\N
1814	Gżira	12	153	\N
1815	Għajnsielem	13	153	\N
1816	Għarb	14	153	\N
1817	Għargħur	15	153	\N
1818	Għasri	16	153	\N
1819	Għaxaq	17	153	\N
1820	Ħamrun	18	153	\N
1821	Iklin	19	153	\N
1822	Isla	20	153	\N
1823	Kalkara	21	153	\N
1824	Kerċem	22	153	\N
1825	Kirkop	23	153	\N
1826	Lija	24	153	\N
1827	Luqa	25	153	\N
1828	Marsa	26	153	\N
1829	Marsaskala	27	153	\N
1830	Marsaxlokk	28	153	\N
1831	Mdina	29	153	\N
1832	Mellieħa	30	153	\N
1833	Mġarr	31	153	\N
1834	Mosta	32	153	\N
1835	Mqabba	33	153	\N
1836	Msida	34	153	\N
1837	Mtarfa	35	153	\N
1838	Munxar	36	153	\N
1839	Nadur	37	153	\N
1840	Naxxar	38	153	\N
1841	Paola	39	153	\N
1842	Pembroke	40	153	\N
1843	Pietà	41	153	\N
1844	Qala	42	153	\N
1845	Qormi	43	153	\N
1846	Qrendi	44	153	\N
1847	Rabat Għawdex	45	153	\N
1848	Rabat Malta	46	153	\N
1849	Safi	47	153	\N
1850	San Ġiljan	48	153	\N
1851	San Ġwann	49	153	\N
1852	San Lawrenz	50	153	\N
1853	San Pawl il-Baħar	51	153	\N
1854	Sannat	52	153	\N
1855	Santa Luċija	53	153	\N
1856	Santa Venera	54	153	\N
1857	Siġġiewi	55	153	\N
1858	Sliema	56	153	\N
1859	Swieqi	57	153	\N
1860	Ta’ Xbiex	58	153	\N
1861	Tarxien	59	153	\N
1862	Valletta	60	153	\N
1863	Xagħra	61	153	\N
1864	Xewkija	62	153	\N
1865	Xgħajra	63	153	\N
1866	Żabbar	64	153	\N
1867	Żebbuġ Għawdex	65	153	\N
1868	Żebbuġ Malta	66	153	\N
1869	Żejtun	67	153	\N
1870	Żurrieq	68	153	\N
1871	Agalega Islands	AG	154	\N
1872	Black River	BL	154	\N
1873	Beau Bassin-Rose Hill	BR	154	\N
1874	Cargados Carajos Shoals	CC	154	\N
1875	Curepipe	CU	154	\N
1876	Flacq	FL	154	\N
1877	Grand Port	GP	154	\N
1878	Moka	MO	154	\N
1879	Pamplemousses	PA	154	\N
1880	Port Louis	PL	154	\N
1881	Port Louis	PU	154	\N
1882	Plaines Wilhems	PW	154	\N
1883	Quatre Bornes	QB	154	\N
1884	Rodrigues Island	RO	154	\N
1885	Rivière du Rempart	RP	154	\N
1886	Savanne	SA	154	\N
1887	Vacoas-Phoenix	VP	154	\N
1888	Central	CE	155	\N
1889	Male	MLE	155	\N
1890	North Central	NC	155	\N
1891	North	NO	155	\N
1892	South Central	SC	155	\N
1893	South	SU	155	\N
1894	Upper North	UN	155	\N
1895	Upper South	US	155	\N
1896	Aguascalientes	AGU	157	\N
1897	Baja California	BCN	157	\N
1898	Baja California Sur	BCS	157	\N
1899	Campeche	CAM	157	\N
1900	Chihuahua	CHH	157	\N
1901	Chiapas	CHP	157	\N
1902	Coahuila	COA	157	\N
1903	Colima	COL	157	\N
1904	Distrito Federal	DIF	157	\N
1905	Durango	DUR	157	\N
1906	Guerrero	GRO	157	\N
1907	Guanajuato	GUA	157	\N
1908	Hidalgo	HID	157	\N
1909	Jalisco	JAL	157	\N
1910	México	MEX	157	\N
1911	Michoacán	MIC	157	\N
1912	Morelos	MOR	157	\N
1913	Nayarit	NAY	157	\N
1914	Nuevo León	NLE	157	\N
1915	Oaxaca	OAX	157	\N
1916	Puebla	PUE	157	\N
1917	Querétaro	QUE	157	\N
1918	Quintana Roo	ROO	157	\N
1919	Sinaloa	SIN	157	\N
1920	San Luis Potosí	SLP	157	\N
1921	Sonora	SON	157	\N
1922	Tabasco	TAB	157	\N
1923	Tamaulipas	TAM	157	\N
1924	Tlaxcala	TLA	157	\N
1925	Veracruz	VER	157	\N
1926	Yucatán	YUC	157	\N
1927	Zacatecas	ZAC	157	\N
1928	Johor	01	158	\N
1929	Kedah	02	158	\N
1930	Kelantan	03	158	\N
1931	Melaka	04	158	\N
1932	Negeri Sembilan	05	158	\N
1933	Pahang	06	158	\N
1934	Pulau Pinang	07	158	\N
1935	Perak	08	158	\N
1936	Perlis	09	158	\N
1937	Selangor	10	158	\N
1938	Terengganu	11	158	\N
1939	Sabah	12	158	\N
1940	Sarawak	13	158	\N
1941	Wilayah Persekutuan Kuala Lumpur	14	158	\N
1942	Wilayah Persekutuan Labuan	15	158	\N
1943	Wilayah Persekutuan Putrajaya	16	158	\N
1944	Niassa	A	159	\N
1945	Manica	B	159	\N
1946	Gaza	G	159	\N
1947	Inhambane	I	159	\N
1948	Maputo	L	159	\N
1949	Maputo (city)	MPM	159	\N
1950	Numpula	N	159	\N
1951	Cabo Delgado	P	159	\N
1952	Zambezia	Q	159	\N
1953	Sofala	S	159	\N
1954	Tete	T	159	\N
1955	Caprivi	CA	160	\N
1956	Erongo	ER	160	\N
1957	Hardap	HA	160	\N
1958	Karas	KA	160	\N
1959	Khomas	KH	160	\N
1960	Kunene	KU	160	\N
1961	Otjozondjupa	OD	160	\N
1962	Omaheke	OH	160	\N
1963	Okavango	OK	160	\N
1964	Oshana	ON	160	\N
1965	Omusati	OS	160	\N
1966	Oshikoto	OT	160	\N
1967	Ohangwena	OW	160	\N
1968	Agadez	1	162	\N
1969	Diffa	2	162	\N
1970	Dosso	3	162	\N
1971	Maradi	4	162	\N
1972	Tahoua	5	162	\N
1973	Tillabéri	6	162	\N
1974	Zinder	7	162	\N
1975	Niamey	8	162	\N
1976	Abia	AB	164	\N
1977	Adamawa	AD	164	\N
1978	Akwa Ibom	AK	164	\N
1979	Anambra	AN	164	\N
1980	Bauchi	BA	164	\N
1981	Benue	BE	164	\N
1982	Borno	BO	164	\N
1983	Bayelsa	BY	164	\N
1984	Cross River	CR	164	\N
1985	Delta	DE	164	\N
1986	Ebonyi	EB	164	\N
1987	Edo	ED	164	\N
1988	Ekiti	EK	164	\N
1989	Enugu	EN	164	\N
1990	Abuja Capital Territory	FC	164	\N
1991	Gombe	GO	164	\N
1992	Imo	IM	164	\N
1993	Jigawa	JI	164	\N
1994	Kaduna	KD	164	\N
1995	Kebbi	KE	164	\N
1996	Kano	KN	164	\N
1997	Kogi	KO	164	\N
1998	Katsina	KT	164	\N
1999	Kwara	KW	164	\N
2000	Lagos	LA	164	\N
2001	Nassarawa	NA	164	\N
2002	Niger	NI	164	\N
2003	Ogun	OG	164	\N
2004	Ondo	ON	164	\N
2005	Osun	OS	164	\N
2006	Oyo	OY	164	\N
2007	Plateau	PL	164	\N
2008	Rivers	RI	164	\N
2009	Sokoto	SO	164	\N
2010	Taraba	TA	164	\N
2011	Yobe	YO	164	\N
2012	Zamfara	ZA	164	\N
2013	Atlántico Norte	AN	165	\N
2014	Atlántico Sur	AS	165	\N
2015	Boaco	BO	165	\N
2016	Carazo	CA	165	\N
2017	Chinandega	CI	165	\N
2018	Chontales	CO	165	\N
2019	Estelí	ES	165	\N
2020	Granada	GR	165	\N
2021	Jinotega	JI	165	\N
2022	León	LE	165	\N
2023	Madriz	MD	165	\N
2024	Managua	MN	165	\N
2025	Masaya	MS	165	\N
2026	Matagalpa	MT	165	\N
2027	Nueva Segovia	NS	165	\N
2028	Rivas	RI	165	\N
2029	Río San Juan	SJ	165	\N
2030	Aruba	AW	166	\N
2031	Bonaire	BQ1	166	\N
2032	Saba	BQ2	166	\N
2033	Sint Eustatius	BQ3	166	\N
2034	Curaçao	CW	166	\N
2035	Drenthe	DR	166	\N
2036	Flevoland	FL	166	\N
2037	Friesland	FR	166	\N
2038	Gelderland	GE	166	\N
2039	Groningen	GR	166	\N
2040	Limburg	LI	166	\N
2041	Noord-Brabant	NB	166	\N
2042	Noord-Holland	NH	166	\N
2043	Overijssel	OV	166	\N
2044	Sint Maarten	SX	166	\N
2045	Utrecht	UT	166	\N
2046	Zeeland	ZE	166	\N
2047	Zuid-Holland	ZH	166	\N
2048	Østfold	01	167	\N
2049	Akershus	02	167	\N
2050	Oslo	03	167	\N
2051	Hedmark	04	167	\N
2052	Oppland	05	167	\N
2053	Buskerud	06	167	\N
2054	Vestfold	07	167	\N
2055	Telemark	08	167	\N
2056	Aust-Agder	09	167	\N
2057	Vest-Agder	10	167	\N
2058	Rogaland	11	167	\N
2059	Hordaland	12	167	\N
2060	Sogn og Fjordane	14	167	\N
2061	Møre og Romsdal	15	167	\N
2062	Sør-Trøndelag	16	167	\N
2063	Nord-Trøndelag	17	167	\N
2064	Nordland	18	167	\N
2065	Troms	19	167	\N
2066	Finnmark	20	167	\N
2067	Svalbard (Arctic Region)	21	167	\N
2068	Jan Mayen (Arctic Region)	22	167	\N
2069	Madhyamanchal	1	168	\N
2070	Madhya Pashchimanchal	2	168	\N
2071	Pashchimanchal	3	168	\N
2072	Purwanchal	4	168	\N
2073	Sudur Pashchimanchal	5	168	\N
2074	Chatham Islands Territory	CIT	171	\N
2075	North Island	N	171	\N
2076	South Island	S	171	\N
2077	Al Bāţinah	BA	172	\N
2078	Al Buraymī	BU	172	\N
2079	Ad Dākhilīya	DA	172	\N
2080	Masqaţ	MA	172	\N
2081	Musandam	MU	172	\N
2082	Ash Sharqīyah	SH	172	\N
2083	Al Wusţá	WU	172	\N
2084	Az̧ Z̧āhirah	ZA	172	\N
2085	Z̧ufār	ZU	172	\N
2086	Amazonas	AMA	174	\N
2087	Ancash	ANC	174	\N
2088	Apurímac	APU	174	\N
2089	Arequipa	ARE	174	\N
2090	Ayacucho	AYA	174	\N
2091	Cajamarca	CAJ	174	\N
2092	El Callao	CAL	174	\N
2093	Cusco [Cuzco]	CUS	174	\N
2094	Huánuco	HUC	174	\N
2095	Huancavelica	HUV	174	\N
2096	Ica	ICA	174	\N
2097	Junín	JUN	174	\N
2098	La Libertad	LAL	174	\N
2099	Lambayeque	LAM	174	\N
2100	Lima	LIM	174	\N
2101	Municipalidad Metropolitana de Lima	LMA	174	\N
2102	Loreto	LOR	174	\N
2103	Madre de Dios	MDD	174	\N
2104	Moquegua	MOQ	174	\N
2105	Pasco	PAS	174	\N
2106	Piura	PIU	174	\N
2107	Puno	PUN	174	\N
2108	San Martín	SAM	174	\N
2109	Tacna	TAC	174	\N
2110	Tumbes	TUM	174	\N
2111	Ucayali	UCA	174	\N
2112	Chimbu	CPK	176	\N
2113	Central	CPM	176	\N
2114	East New Britain	EBR	176	\N
2115	Eastern Highlands	EHG	176	\N
2116	Enga	EPW	176	\N
2117	East Sepik	ESW	176	\N
2118	Gulf	GPK	176	\N
2119	Milne Bay	MBA	176	\N
2120	Morobe	MPL	176	\N
2121	Madang	MPM	176	\N
2122	Manus	MRL	176	\N
2123	National Capital District (Port Moresby)	NCD	176	\N
2124	New Ireland	NIK	176	\N
2125	Northern	NPP	176	\N
2126	Bougainville	NSB	176	\N
2127	Sandaun	SAN	176	\N
2128	Southern Highlands	SHM	176	\N
2129	West New Britain	WBK	176	\N
2130	Western Highlands	WHM	176	\N
2131	Western	WPD	176	\N
2132	National Capital Region	00	177	\N
2133	Ilocos (Region I)	01	177	\N
2134	Cagayan Valley (Region II)	02	177	\N
2135	Central Luzon (Region III)	03	177	\N
2136	Bicol (Region V)	05	177	\N
2137	Western Visayas (Region VI)	06	177	\N
2138	Central Visayas (Region VII)	07	177	\N
2139	Eastern Visayas (Region VIII)	08	177	\N
2140	Zamboanga Peninsula (Region IX)	09	177	\N
2141	Northern Mindanao (Region X)	10	177	\N
2142	Davao (Region XI)	11	177	\N
2143	Soccsksargen (Region XII)	12	177	\N
2144	Caraga (Region XIII)	13	177	\N
2145	Autonomous Region in Muslim Mindanao (ARMM)	14	177	\N
2146	Cordillera Administrative Region (CAR)	15	177	\N
2147	CALABARZON (Region IV-A)	40	177	\N
2148	MIMAROPA (Region IV-B)	41	177	\N
2149	Balochistan	BA	178	\N
2150	Gilgit-Baltistan	GB	178	\N
2151	Islamabad	IS	178	\N
2152	Azad Kashmir	JK	178	\N
2153	Khyber Pakhtunkhwa	KP	178	\N
2154	Punjab	PB	178	\N
2155	Sindh	SD	178	\N
2156	Federally Administered Tribal Areas	TA	178	\N
2157	Dolnośląskie	DS	179	\N
2158	Kujawsko-pomorskie	KP	179	\N
2159	Lubuskie	LB	179	\N
2160	Łódzkie	LD	179	\N
2161	Lubelskie	LU	179	\N
2162	Małopolskie	MA	179	\N
2163	Mazowieckie	MZ	179	\N
2164	Opolskie	OP	179	\N
2165	Podlaskie	PD	179	\N
2166	Podkarpackie	PK	179	\N
2167	Pomorskie	PM	179	\N
2168	Świętokrzyskie	SK	179	\N
2169	Śląskie	SL	179	\N
2170	Warmińsko-mazurskie	WN	179	\N
2171	Wielkopolskie	WP	179	\N
2172	Zachodniopomorskie	ZP	179	\N
2173	Bethlehem	BTH	182	\N
2174	Deir El Balah	DEB	182	\N
2175	Gaza	GZA	182	\N
2176	Hebron	HBN	182	\N
2177	Jerusalem	JEM	182	\N
2178	Jenin	JEN	182	\N
2179	Jericho - Al Aghwar	JRH	182	\N
2180	Khan Yunis	KYS	182	\N
2181	Nablus	NBS	182	\N
2182	North Gaza	NGZ	182	\N
2183	Qalqilya	QQA	182	\N
2184	Ramallah	RBH	182	\N
2185	Rafah	RFH	182	\N
2186	Salfit	SLT	182	\N
2187	Tubas	TBS	182	\N
2188	Tulkarm	TKM	182	\N
2189	Aveiro	01	183	\N
2190	Beja	02	183	\N
2191	Braga	03	183	\N
2192	Bragança	04	183	\N
2193	Castelo Branco	05	183	\N
2194	Coimbra	06	183	\N
2195	Évora	07	183	\N
2196	Faro	08	183	\N
2197	Guarda	09	183	\N
2198	Leiria	10	183	\N
2199	Lisboa	11	183	\N
2200	Portalegre	12	183	\N
2201	Porto	13	183	\N
2202	Santarém	14	183	\N
2203	Setúbal	15	183	\N
2204	Viana do Castelo	16	183	\N
2205	Vila Real	17	183	\N
2206	Viseu	18	183	\N
2207	Região Autónoma dos Açores	20	183	\N
2208	Região Autónoma da Madeira	30	183	\N
2209	Aimeliik	002	184	\N
2210	Airai	004	184	\N
2211	Angaur	010	184	\N
2212	Hatobohei	050	184	\N
2213	Kayangel	100	184	\N
2214	Koror	150	184	\N
2215	Melekeok	212	184	\N
2216	Ngaraard	214	184	\N
2217	Ngarchelong	218	184	\N
2218	Ngardmau	222	184	\N
2219	Ngatpang	224	184	\N
2220	Ngchesar	226	184	\N
2221	Ngeremlengui	227	184	\N
2222	Ngiwal	228	184	\N
2223	Peleliu	350	184	\N
2224	Sonsorol	370	184	\N
2225	Concepción	1	185	\N
2226	Alto Paraná	10	185	\N
2227	Central	11	185	\N
2228	Ñeembucú	12	185	\N
2229	Amambay	13	185	\N
2230	Canindeyú	14	185	\N
2231	Presidente Hayes	15	185	\N
2232	Alto Paraguay	16	185	\N
2233	Boquerón	19	185	\N
2234	San Pedro	2	185	\N
2235	Cordillera	3	185	\N
2236	Guairá	4	185	\N
2237	Caaguazú	5	185	\N
2238	Caazapá	6	185	\N
2239	Itapúa	7	185	\N
2240	Misiones	8	185	\N
2241	Paraguarí	9	185	\N
2242	Asunción	ASU	185	\N
2243	Alba	AB	188	\N
2244	Argeș	AG	188	\N
2245	Arad	AR	188	\N
2246	București	B	188	\N
2247	Bacău	BC	188	\N
2248	Bihor	BH	188	\N
2249	Bistrița-Năsăud	BN	188	\N
2250	Brăila	BR	188	\N
2251	Botoșani	BT	188	\N
2252	Brașov	BV	188	\N
2253	Buzău	BZ	188	\N
2254	Cluj	CJ	188	\N
2255	Călărași	CL	188	\N
2256	Caraș-Severin	CS	188	\N
2257	Constanța	CT	188	\N
2258	Covasna	CV	188	\N
2259	Dâmbovița	DB	188	\N
2260	Dolj	DJ	188	\N
2261	Gorj	GJ	188	\N
2262	Galați	GL	188	\N
2263	Giurgiu	GR	188	\N
2264	Hunedoara	HD	188	\N
2265	Harghita	HR	188	\N
2266	Ilfov	IF	188	\N
2267	Ialomița	IL	188	\N
2268	Iași	IS	188	\N
2269	Mehedinți	MH	188	\N
2270	Maramureș	MM	188	\N
2271	Mureș	MS	188	\N
2272	Neamț	NT	188	\N
2273	Olt	OT	188	\N
2274	Prahova	PH	188	\N
2275	Sibiu	SB	188	\N
2276	Sălaj	SJ	188	\N
2277	Satu Mare	SM	188	\N
2278	Suceava	SV	188	\N
2279	Tulcea	TL	188	\N
2280	Timiș	TM	188	\N
2281	Teleorman	TR	188	\N
2282	Vâlcea	VL	188	\N
2283	Vrancea	VN	188	\N
2284	Vaslui	VS	188	\N
2285	Beograd	00	189	\N
2286	Mačvanski okrug	08	189	\N
2287	Kolubarski okrug	09	189	\N
2288	Podunavski okrug	10	189	\N
2289	Braničevski okrug	11	189	\N
2290	Šumadijski okrug	12	189	\N
2291	Pomoravski okrug	13	189	\N
2292	Borski okrug	14	189	\N
2293	Zaječarski okrug	15	189	\N
2294	Zlatiborski okrug	16	189	\N
2295	Moravički okrug	17	189	\N
2296	Raški okrug	18	189	\N
2297	Rasinski okrug	19	189	\N
2298	Nišavski okrug	20	189	\N
2299	Toplički okrug	21	189	\N
2300	Pirotski okrug	22	189	\N
2301	Jablanički okrug	23	189	\N
2302	Pčinjski okrug	24	189	\N
2303	Kosovo-Metohija	KM	189	\N
2304	Vojvodina	VO	189	\N
2305	Adygeya, Respublika	AD	190	\N
2306	Altay, Respublika	AL	190	\N
2307	Altayskiy kray	ALT	190	\N
2308	Amurskaya oblast'	AMU	190	\N
2309	Arkhangel'skaya oblast'	ARK	190	\N
2310	Astrakhanskaya oblast'	AST	190	\N
2311	Bashkortostan, Respublika	BA	190	\N
2312	Belgorodskaya oblast'	BEL	190	\N
2313	Bryanskaya oblast'	BRY	190	\N
2314	Buryatiya, Respublika	BU	190	\N
2315	Chechenskaya Respublika	CE	190	\N
2316	Chelyabinskaya oblast'	CHE	190	\N
2317	Chukotskiy avtonomnyy okrug	CHU	190	\N
2318	Chuvashskaya Respublika	CU	190	\N
2319	Dagestan, Respublika	DA	190	\N
2320	Respublika Ingushetiya	IN	190	\N
2321	Irkutiskaya oblast'	IRK	190	\N
2322	Ivanovskaya oblast'	IVA	190	\N
2323	Kamchatskiy kray	KAM	190	\N
2324	Kabardino-Balkarskaya Respublika	KB	190	\N
2325	Karachayevo-Cherkesskaya Respublika	KC	190	\N
2326	Krasnodarskiy kray	KDA	190	\N
2327	Kemerovskaya oblast'	KEM	190	\N
2328	Kaliningradskaya oblast'	KGD	190	\N
2329	Kurganskaya oblast'	KGN	190	\N
2330	Khabarovskiy kray	KHA	190	\N
2331	Khanty-Mansiysky avtonomnyy okrug-Yugra	KHM	190	\N
2332	Kirovskaya oblast'	KIR	190	\N
2333	Khakasiya, Respublika	KK	190	\N
2334	Kalmykiya, Respublika	KL	190	\N
2335	Kaluzhskaya oblast'	KLU	190	\N
2336	Komi, Respublika	KO	190	\N
2337	Kostromskaya oblast'	KOS	190	\N
2338	Kareliya, Respublika	KR	190	\N
2339	Kurskaya oblast'	KRS	190	\N
2340	Krasnoyarskiy kray	KYA	190	\N
2341	Leningradskaya oblast'	LEN	190	\N
2342	Lipetskaya oblast'	LIP	190	\N
2343	Magadanskaya oblast'	MAG	190	\N
2344	Mariy El, Respublika	ME	190	\N
2345	Mordoviya, Respublika	MO	190	\N
2346	Moskovskaya oblast'	MOS	190	\N
2347	Moskva	MOW	190	\N
2348	Murmanskaya oblast'	MUR	190	\N
2349	Nenetskiy avtonomnyy okrug	NEN	190	\N
2350	Novgorodskaya oblast'	NGR	190	\N
2351	Nizhegorodskaya oblast'	NIZ	190	\N
2352	Novosibirskaya oblast'	NVS	190	\N
2353	Omskaya oblast'	OMS	190	\N
2354	Orenburgskaya oblast'	ORE	190	\N
2355	Orlovskaya oblast'	ORL	190	\N
2356	Permskiy kray	PER	190	\N
2357	Penzenskaya oblast'	PNZ	190	\N
2358	Primorskiy kray	PRI	190	\N
2359	Pskovskaya oblast'	PSK	190	\N
2360	Rostovskaya oblast'	ROS	190	\N
2361	Ryazanskaya oblast'	RYA	190	\N
2362	Sakha, Respublika [Yakutiya]	SA	190	\N
2363	Sakhalinskaya oblast'	SAK	190	\N
2364	Samaraskaya oblast'	SAM	190	\N
2365	Saratovskaya oblast'	SAR	190	\N
2366	Severnaya Osetiya-Alaniya, Respublika	SE	190	\N
2367	Smolenskaya oblast'	SMO	190	\N
2368	Sankt-Peterburg	SPE	190	\N
2369	Stavropol'skiy kray	STA	190	\N
2370	Sverdlovskaya oblast'	SVE	190	\N
2371	Tatarstan, Respublika	TA	190	\N
2372	Tambovskaya oblast'	TAM	190	\N
2373	Tomskaya oblast'	TOM	190	\N
2374	Tul'skaya oblast'	TUL	190	\N
2375	Tverskaya oblast'	TVE	190	\N
2376	Tyva, Respublika [Tuva]	TY	190	\N
2377	Tyumenskaya oblast'	TYU	190	\N
2378	Udmurtskaya Respublika	UD	190	\N
2379	Ul'yanovskaya oblast'	ULY	190	\N
2380	Volgogradskaya oblast'	VGG	190	\N
2381	Vladimirskaya oblast'	VLA	190	\N
2382	Vologodskaya oblast'	VLG	190	\N
2383	Voronezhskaya oblast'	VOR	190	\N
2384	Yamalo-Nenetskiy avtonomnyy okrug	YAN	190	\N
2385	Yaroslavskaya oblast'	YAR	190	\N
2386	Yevreyskaya avtonomnaya oblast'	YEV	190	\N
2387	Zabajkal'skij kraj	ZAB	190	\N
2388	Ar Riyāḍ	01	192	\N
2389	Makkah	02	192	\N
2390	Al Madīnah	03	192	\N
2391	Ash Sharqīyah	04	192	\N
2392	Al Qaşīm	05	192	\N
2393	Ḥā'il	06	192	\N
2394	Tabūk	07	192	\N
2395	Al Ḥudūd ash Shamāliyah	08	192	\N
2396	Jīzan	09	192	\N
2397	Najrān	10	192	\N
2398	Al Bāhah	11	192	\N
2399	Al Jawf	12	192	\N
2400	`Asīr	14	192	\N
2401	Zalingei	DC	195	\N
2402	Sharq Dārfūr	DE	195	\N
2403	Shamāl Dārfūr	DN	195	\N
2404	Janūb Dārfūr	DS	195	\N
2405	Gharb Dārfūr	DW	195	\N
2406	Al Qaḑārif	GD	195	\N
2407	Al Jazīrah	GZ	195	\N
2408	Kassalā	KA	195	\N
2409	Al Kharţūm	KH	195	\N
2410	Shamāl Kurdufān	KN	195	\N
2411	Janūb Kurdufān	KS	195	\N
2412	An Nīl al Azraq	NB	195	\N
2413	Ash Shamālīyah	NO	195	\N
2414	An Nīl	NR	195	\N
2415	An Nīl al Abyaḑ	NW	195	\N
2416	Al Baḩr al Aḩmar	RS	195	\N
2417	Sinnār	SI	195	\N
2418	Stockholms län	AB	196	\N
2419	Västerbottens län	AC	196	\N
2420	Norrbottens län	BD	196	\N
2421	Uppsala län	C	196	\N
2422	Södermanlands län	D	196	\N
2423	Östergötlands län	E	196	\N
2424	Jönköpings län	F	196	\N
2425	Kronobergs län	G	196	\N
2426	Kalmar län	H	196	\N
2427	Gotlands län	I	196	\N
2428	Blekinge län	K	196	\N
2429	Skåne län	M	196	\N
2430	Hallands län	N	196	\N
2431	Västra Götalands län	O	196	\N
2432	Värmlands län	S	196	\N
2433	Örebro län	T	196	\N
2434	Västmanlands län	U	196	\N
2435	Dalarnas län	W	196	\N
2436	Gävleborgs län	X	196	\N
2437	Västernorrlands län	Y	196	\N
2438	Jämtlands län	Z	196	\N
2439	Central Singapore	01	197	\N
2440	North East	02	197	\N
2441	North West	03	197	\N
2442	South East	04	197	\N
2443	South West	05	197	\N
2444	Connacht	C	102	\N
2445	Leinster	L	102	\N
2446	Munster	M	102	\N
2447	Ulster	U	102	\N
2448	Ascension	AC	198	\N
2449	Saint Helena	HL	198	\N
2450	Tristan da Cunha	TA	198	\N
2451	Ajdovščina	001	199	\N
2452	Beltinci	002	199	\N
2453	Bled	003	199	\N
2454	Bohinj	004	199	\N
2455	Borovnica	005	199	\N
2456	Bovec	006	199	\N
2457	Brda	007	199	\N
2458	Brezovica	008	199	\N
2459	Brežice	009	199	\N
2460	Tišina	010	199	\N
2461	Celje	011	199	\N
2462	Cerklje na Gorenjskem	012	199	\N
2463	Cerknica	013	199	\N
2464	Cerkno	014	199	\N
2465	Črenšovci	015	199	\N
2466	Črna na Koroškem	016	199	\N
2467	Črnomelj	017	199	\N
2468	Destrnik	018	199	\N
2469	Divača	019	199	\N
2470	Dobrepolje	020	199	\N
2471	Dobrova-Polhov Gradec	021	199	\N
2472	Dol pri Ljubljani	022	199	\N
2473	Domžale	023	199	\N
2474	Dornava	024	199	\N
2475	Dravograd	025	199	\N
2476	Duplek	026	199	\N
2477	Gorenja vas-Poljane	027	199	\N
2478	Gorišnica	028	199	\N
2479	Gornja Radgona	029	199	\N
2480	Gornji Grad	030	199	\N
2481	Gornji Petrovci	031	199	\N
2482	Grosuplje	032	199	\N
2483	Šalovci	033	199	\N
2484	Hrastnik	034	199	\N
2485	Hrpelje-Kozina	035	199	\N
2486	Idrija	036	199	\N
2487	Ig	037	199	\N
2488	Ilirska Bistrica	038	199	\N
2489	Ivančna Gorica	039	199	\N
2490	Izola/Isola	040	199	\N
2491	Jesenice	041	199	\N
2492	Juršinci	042	199	\N
2493	Kamnik	043	199	\N
2494	Kanal	044	199	\N
2495	Kidričevo	045	199	\N
2496	Kobarid	046	199	\N
2497	Kobilje	047	199	\N
2498	Kočevje	048	199	\N
2499	Komen	049	199	\N
2500	Koper/Capodistria	050	199	\N
2501	Kozje	051	199	\N
2502	Kranj	052	199	\N
2503	Kranjska Gora	053	199	\N
2504	Krško	054	199	\N
2505	Kungota	055	199	\N
2506	Kuzma	056	199	\N
2507	Laško	057	199	\N
2508	Lenart	058	199	\N
2509	Lendava/Lendva	059	199	\N
2510	Litija	060	199	\N
2511	Ljubljana	061	199	\N
2512	Ljubno	062	199	\N
2513	Ljutomer	063	199	\N
2514	Logatec	064	199	\N
2515	Loška dolina	065	199	\N
2516	Loški Potok	066	199	\N
2517	Luče	067	199	\N
2518	Lukovica	068	199	\N
2519	Majšperk	069	199	\N
2520	Maribor	070	199	\N
2521	Medvode	071	199	\N
2522	Mengeš	072	199	\N
2523	Metlika	073	199	\N
2524	Mežica	074	199	\N
2525	Miren-Kostanjevica	075	199	\N
2526	Mislinja	076	199	\N
2527	Moravče	077	199	\N
2528	Moravske Toplice	078	199	\N
2529	Mozirje	079	199	\N
2530	Murska Sobota	080	199	\N
2531	Muta	081	199	\N
2532	Naklo	082	199	\N
2533	Nazarje	083	199	\N
2534	Nova Gorica	084	199	\N
2535	Novo mesto	085	199	\N
2536	Odranci	086	199	\N
2537	Ormož	087	199	\N
2538	Osilnica	088	199	\N
2539	Pesnica	089	199	\N
2540	Piran/Pirano	090	199	\N
2541	Pivka	091	199	\N
2542	Podčetrtek	092	199	\N
2543	Podvelka	093	199	\N
2544	Postojna	094	199	\N
2545	Preddvor	095	199	\N
2546	Ptuj	096	199	\N
2547	Puconci	097	199	\N
2548	Rače-Fram	098	199	\N
2549	Radeče	099	199	\N
2550	Radenci	100	199	\N
2551	Radlje ob Dravi	101	199	\N
2552	Radovljica	102	199	\N
2553	Ravne na Koroškem	103	199	\N
2554	Ribnica	104	199	\N
2555	Rogašovci	105	199	\N
2556	Rogaška Slatina	106	199	\N
2557	Rogatec	107	199	\N
2558	Ruše	108	199	\N
2559	Semič	109	199	\N
2560	Sevnica	110	199	\N
2561	Sežana	111	199	\N
2562	Slovenj Gradec	112	199	\N
2563	Slovenska Bistrica	113	199	\N
2564	Slovenske Konjice	114	199	\N
2565	Starče	115	199	\N
2566	Sveti Jurij	116	199	\N
2567	Šenčur	117	199	\N
2568	Šentilj	118	199	\N
2569	Šentjernej	119	199	\N
2570	Šentjur	120	199	\N
2571	Škocjan	121	199	\N
2572	Škofja Loka	122	199	\N
2573	Škofljica	123	199	\N
2574	Šmarje pri Jelšah	124	199	\N
2575	Šmartno ob Paki	125	199	\N
2576	Šoštanj	126	199	\N
2577	Štore	127	199	\N
2578	Tolmin	128	199	\N
2579	Trbovlje	129	199	\N
2580	Trebnje	130	199	\N
2581	Tržič	131	199	\N
2582	Turnišče	132	199	\N
2583	Velenje	133	199	\N
2584	Velike Lašče	134	199	\N
2585	Videm	135	199	\N
2586	Vipava	136	199	\N
2587	Vitanje	137	199	\N
2588	Vodice	138	199	\N
2589	Vojnik	139	199	\N
2590	Vrhnika	140	199	\N
2591	Vuzenica	141	199	\N
2592	Zagorje ob Savi	142	199	\N
2593	Zavrč	143	199	\N
2594	Zreče	144	199	\N
2595	Železniki	146	199	\N
2596	Žiri	147	199	\N
2597	Benedikt	148	199	\N
2598	Bistrica ob Sotli	149	199	\N
2599	Bloke	150	199	\N
2600	Braslovče	151	199	\N
2601	Cankova	152	199	\N
2602	Cerkvenjak	153	199	\N
2603	Dobje	154	199	\N
2604	Dobrna	155	199	\N
2605	Dobrovnik/Dobronak	156	199	\N
2606	Dolenjske Toplice	157	199	\N
2607	Grad	158	199	\N
2608	Hajdina	159	199	\N
2609	Hoče-Slivnica	160	199	\N
2610	Hodoš/Hodos	161	199	\N
2611	Horjul	162	199	\N
2612	Jezersko	163	199	\N
2613	Komenda	164	199	\N
2614	Kostel	165	199	\N
2615	Križevci	166	199	\N
2616	Lovrenc na Pohorju	167	199	\N
2617	Markovci	168	199	\N
2618	Miklavž na Dravskem polju	169	199	\N
2619	Mirna Peč	170	199	\N
2620	Oplotnica	171	199	\N
2621	Podlehnik	172	199	\N
2622	Polzela	173	199	\N
2623	Prebold	174	199	\N
2624	Prevalje	175	199	\N
2625	Razkrižje	176	199	\N
2626	Ribnica na Pohorju	177	199	\N
2627	Selnica ob Dravi	178	199	\N
2628	Sodražica	179	199	\N
2629	Solčava	180	199	\N
2630	Sveta Ana	181	199	\N
2631	Sveta Andraž v Slovenskih Goricah	182	199	\N
2632	Šempeter-Vrtojba	183	199	\N
2633	Tabor	184	199	\N
2634	Trnovska vas	185	199	\N
2635	Trzin	186	199	\N
2636	Velika Polana	187	199	\N
2637	Veržej	188	199	\N
2638	Vransko	189	199	\N
2639	Žalec	190	199	\N
2640	Žetale	191	199	\N
2641	Žirovnica	192	199	\N
2642	Žužemberk	193	199	\N
2643	Šmartno pri Litiji	194	199	\N
2644	Apače	195	199	\N
2645	Cirkulane	196	199	\N
2646	Kosanjevica na Krki	197	199	\N
2647	Makole	198	199	\N
2648	Mokronog-Trebelno	199	199	\N
2649	Poljčane	200	199	\N
2650	Renče-Vogrsko	201	199	\N
2651	Središče ob Dravi	202	199	\N
2652	Straža	203	199	\N
2653	Sveta Trojica v Slovenskih Goricah	204	199	\N
2654	Sveti Tomaž	205	199	\N
2655	Šmarjeske Topliče	206	199	\N
2656	Gorje	207	199	\N
2657	Log-Dragomer	208	199	\N
2658	Rečica ob Savinji	209	199	\N
2659	Sveti Jurij v Slovenskih Goricah	210	199	\N
2660	Šentrupert	211	199	\N
2661	Banskobystrický kraj	BC	201	\N
2662	Bratislavský kraj	BL	201	\N
2663	Košický kraj	KI	201	\N
2664	Nitriansky kraj	NI	201	\N
2665	Prešovský kraj	PV	201	\N
2666	Trnavský kraj	TA	201	\N
2667	Trenčiansky kraj	TC	201	\N
2668	Žilinský kraj	ZI	201	\N
2669	Acquaviva	01	203	\N
2670	Chiesanuova	02	203	\N
2671	Domagnano	03	203	\N
2672	Faetano	04	203	\N
2673	Fiorentino	05	203	\N
2674	Borgo Maggiore	06	203	\N
2675	San Marino	07	203	\N
2676	Montegiardino	08	203	\N
2677	Serravalle	09	203	\N
2678	Diourbel	DB	204	\N
2679	Dakar	DK	204	\N
2680	Fatick	FK	204	\N
2681	Kaffrine	KA	204	\N
2682	Kolda	KD	204	\N
2683	Kédougou	KE	204	\N
2684	Kaolack	KL	204	\N
2685	Louga	LG	204	\N
2686	Matam	MT	204	\N
2687	Sédhiou	SE	204	\N
2688	Saint-Louis	SL	204	\N
2689	Tambacounda	TC	204	\N
2690	Thiès	TH	204	\N
2691	Ziguinchor	ZG	204	\N
2692	Northern Bahr el-Ghazal	BN	207	\N
2693	Western Bahr el-Ghazal	BW	207	\N
2694	Central Equatoria	EC	207	\N
2695	Eastern Equatoria	EE8	207	\N
2696	Western Equatoria	EW	207	\N
2697	Jonglei	JG	207	\N
2698	Lakes	LK	207	\N
2699	Upper Nile	NU	207	\N
2700	Unity	UY	207	\N
2701	Warrap	WR	207	\N
2702	Ahuachapán	AH	209	\N
2703	Cabañas	CA	209	\N
2704	Chalatenango	CH	209	\N
2705	Cuscatlán	CU	209	\N
2706	La Libertad	LI	209	\N
2707	Morazán	MO	209	\N
2708	La Paz	PA	209	\N
2709	Santa Ana	SA	209	\N
2710	San Miguel	SM	209	\N
2711	Sonsonate	SO	209	\N
2712	San Salvador	SS	209	\N
2713	San Vicente	SV	209	\N
2714	La Unión	UN	209	\N
2715	Usulután	US	209	\N
2716	Hhohho	HH	212	\N
2717	Lubombo	LU	212	\N
2718	Manzini	MA	212	\N
2719	Shiselweni	SH	212	\N
2720	Al Baṭḩah	BA	214	\N
2721	Baḩr al Ghazāl	BG	214	\N
2722	Būrkū	BO	214	\N
2723	Shārī Bāqirmī	CB	214	\N
2724	Innīdī	EN	214	\N
2725	Qīrā	GR	214	\N
2726	Ḥajjar Lamīs	HL	214	\N
2727	Kānim	KA	214	\N
2728	Al Buḩayrah	LC	214	\N
2729	Lūqūn al Gharbī	LO	214	\N
2730	Lūqūn ash Sharqī	LR	214	\N
2731	Māndūl	MA	214	\N
2732	Shārī al Awsaṭ	MC	214	\N
2733	Māyū Kībbī ash Sharqī	ME	214	\N
2734	Māyū Kībbī al Gharbī	MO	214	\N
2735	Madīnat Injamīnā	ND	214	\N
2736	Waddāy	OD	214	\N
2737	Salāmāt	SA	214	\N
2738	Sīlā	SI	214	\N
2739	Tānjilī	TA	214	\N
2740	Tibastī	TI	214	\N
2741	Wādī Fīrā	WF	214	\N
2742	Krung Thep Maha Nakhon Bangkok	10	217	\N
2743	Samut Prakan	11	217	\N
2744	Nonthaburi	12	217	\N
2745	Pathum Thani	13	217	\N
2746	Phra Nakhon Si Ayutthaya	14	217	\N
2747	Ang Thong	15	217	\N
2748	Lop Buri	16	217	\N
2749	Sing Buri	17	217	\N
2750	Chai Nat	18	217	\N
2751	Saraburi	19	217	\N
2752	Chon Buri	20	217	\N
2753	Rayong	21	217	\N
2754	Chanthaburi	22	217	\N
2755	Trat	23	217	\N
2756	Chachoengsao	24	217	\N
2757	Prachin Buri	25	217	\N
2758	Nakhon Nayok	26	217	\N
2759	Sa Kaeo	27	217	\N
2760	Nakhon Ratchasima	30	217	\N
2761	Buri Ram	31	217	\N
2762	Surin	32	217	\N
2763	Si Sa Ket	33	217	\N
2764	Ubon Ratchathani	34	217	\N
2765	Yasothon	35	217	\N
2766	Chaiyaphum	36	217	\N
2767	Amnat Charoen	37	217	\N
2768	Nong Bua Lam Phu	39	217	\N
2769	Khon Kaen	40	217	\N
2770	Udon Thani	41	217	\N
2771	Loei	42	217	\N
2772	Nong Khai	43	217	\N
2773	Maha Sarakham	44	217	\N
2774	Roi Et	45	217	\N
2775	Kalasin	46	217	\N
2776	Sakon Nakhon	47	217	\N
2777	Nakhon Phanom	48	217	\N
2778	Mukdahan	49	217	\N
2779	Chiang Mai	50	217	\N
2780	Lamphun	51	217	\N
2781	Lampang	52	217	\N
2782	Uttaradit	53	217	\N
2783	Phrae	54	217	\N
2784	Nan	55	217	\N
2785	Phayao	56	217	\N
2786	Chiang Rai	57	217	\N
2787	Mae Hong Son	58	217	\N
2788	Nakhon Sawan	60	217	\N
2789	Uthai Thani	61	217	\N
2790	Kamphaeng Phet	62	217	\N
2791	Tak	63	217	\N
2792	Sukhothai	64	217	\N
2793	Phitsanulok	65	217	\N
2794	Phichit	66	217	\N
2795	Phetchabun	67	217	\N
2796	Ratchaburi	70	217	\N
2797	Kanchanaburi	71	217	\N
2798	Suphan Buri	72	217	\N
2799	Nakhon Pathom	73	217	\N
2800	Samut Sakhon	74	217	\N
2801	Samut Songkhram	75	217	\N
2802	Phetchaburi	76	217	\N
2803	Prachuap Khiri Khan	77	217	\N
2804	Nakhon Si Thammarat	80	217	\N
2805	Krabi	81	217	\N
2806	Phangnga	82	217	\N
2807	Phuket	83	217	\N
2808	Surat Thani	84	217	\N
2809	Ranong	85	217	\N
2810	Chumphon	86	217	\N
2811	Songkhla	90	217	\N
2812	Satun	91	217	\N
2813	Trang	92	217	\N
2814	Phatthalung	93	217	\N
2815	Pattani	94	217	\N
2816	Yala	95	217	\N
2817	Narathiwat	96	217	\N
2818	Phatthaya	S	217	\N
2819	Gorno-Badakhshan	GB	218	\N
2820	Khatlon	KT	218	\N
2821	Sughd	SU	218	\N
2822	Ahal	A	221	\N
2823	Balkan	B	221	\N
2824	Daşoguz	D	221	\N
2825	Lebap	L	221	\N
2826	Mary	M	221	\N
2827	Aşgabat	S	221	\N
2828	Tunis	11	222	\N
2829	Ariana	12	222	\N
2830	Ben Arous	13	222	\N
2831	La Manouba	14	222	\N
2832	Nabeul	21	222	\N
2833	Zaghouan	22	222	\N
2834	Bizerte	23	222	\N
2835	Béja	31	222	\N
2836	Jendouba	32	222	\N
2837	Le Kef	33	222	\N
2838	Siliana	34	222	\N
2839	Kairouan	41	222	\N
2840	Kasserine	42	222	\N
2841	Sidi Bouzid	43	222	\N
2842	Sousse	51	222	\N
2843	Monastir	52	222	\N
2844	Mahdia	53	222	\N
2845	Sfax	61	222	\N
2846	Gafsa	71	222	\N
2847	Tozeur	72	222	\N
2848	Kebili	73	222	\N
2849	Gabès	81	222	\N
2850	Medenine	82	222	\N
2851	Tataouine	83	222	\N
2852	Adana	01	224	\N
2853	Adıyaman	02	224	\N
2854	Afyonkarahisar	03	224	\N
2855	Ağrı	04	224	\N
2856	Amasya	05	224	\N
2857	Ankara	06	224	\N
2858	Antalya	07	224	\N
2859	Artvin	08	224	\N
2860	Aydın	09	224	\N
2861	Balıkesir	10	224	\N
2862	Bilecik	11	224	\N
2863	Bingöl	12	224	\N
2864	Bitlis	13	224	\N
2865	Bolu	14	224	\N
2866	Burdur	15	224	\N
2867	Bursa	16	224	\N
2868	Çanakkale	17	224	\N
2869	Çankırı	18	224	\N
2870	Çorum	19	224	\N
2871	Denizli	20	224	\N
2872	Diyarbakır	21	224	\N
2873	Edirne	22	224	\N
2874	Elazığ	23	224	\N
2875	Erzincan	24	224	\N
2876	Erzurum	25	224	\N
2877	Eskişehir	26	224	\N
2878	Gaziantep	27	224	\N
2879	Giresun	28	224	\N
2880	Gümüşhane	29	224	\N
2881	Hakkâri	30	224	\N
2882	Hatay	31	224	\N
2883	Isparta	32	224	\N
2884	Mersin	33	224	\N
2885	İstanbul	34	224	\N
2886	İzmir	35	224	\N
2887	Kars	36	224	\N
2888	Kastamonu	37	224	\N
2889	Kayseri	38	224	\N
2890	Kırklareli	39	224	\N
2891	Kırşehir	40	224	\N
2892	Kocaeli	41	224	\N
2893	Konya	42	224	\N
2894	Kütahya	43	224	\N
2895	Malatya	44	224	\N
2896	Manisa	45	224	\N
2897	Kahramanmaraş	46	224	\N
2898	Mardin	47	224	\N
2899	Muğla	48	224	\N
2900	Muş	49	224	\N
2901	Nevşehir	50	224	\N
2902	Niğde	51	224	\N
2903	Ordu	52	224	\N
2904	Rize	53	224	\N
2905	Sakarya	54	224	\N
2906	Samsun	55	224	\N
2907	Siirt	56	224	\N
2908	Sinop	57	224	\N
2909	Sivas	58	224	\N
2910	Tekirdağ	59	224	\N
2911	Tokat	60	224	\N
2912	Trabzon	61	224	\N
2913	Tunceli	62	224	\N
2914	Şanlıurfa	63	224	\N
2915	Uşak	64	224	\N
2916	Van	65	224	\N
2917	Yozgat	66	224	\N
2918	Zonguldak	67	224	\N
2919	Aksaray	68	224	\N
2920	Bayburt	69	224	\N
2921	Karaman	70	224	\N
2922	Kırıkkale	71	224	\N
2923	Batman	72	224	\N
2924	Şırnak	73	224	\N
2925	Bartın	74	224	\N
2926	Ardahan	75	224	\N
2927	Iğdır	76	224	\N
2928	Yalova	77	224	\N
2929	Karabük	78	224	\N
2930	Kilis	79	224	\N
2931	Osmaniye	80	224	\N
2932	Düzce	81	224	\N
2933	Arima	ARI	225	\N
2934	Chaguanas	CHA	225	\N
2935	Couva-Tabaquite-Talparo	CTT	225	\N
2936	Diego Martin	DMN	225	\N
2937	Eastern Tobago	ETO	225	\N
2938	Penal-Debe	PED	225	\N
2939	Port of Spain	POS	225	\N
2940	Princes Town	PRT	225	\N
2941	Point Fortin	PTF	225	\N
2942	Rio Claro-Mayaro	RCM	225	\N
2943	San Fernando	SFO	225	\N
2944	Sangre Grande	SGE	225	\N
2945	Siparia	SIP	225	\N
2946	San Juan-Laventille	SJL	225	\N
2947	Tunapuna-Piarco	TUP	225	\N
2948	Western Tobago	WTO	225	\N
2949	Changhua	CHA	227	\N
2950	Chiay City	CYI	227	\N
2951	Chiayi	CYQ	227	\N
2952	Hsinchu	HSQ	227	\N
2953	Hsinchui City	HSZ	227	\N
2954	Hualien	HUA	227	\N
2955	Ilan	ILA	227	\N
2956	Keelung City	KEE	227	\N
2957	Kaohsiung City	KHH	227	\N
2958	Kaohsiung	KHQ	227	\N
2959	Miaoli	MIA	227	\N
2960	Nantou	NAN	227	\N
2961	Penghu	PEN	227	\N
2962	Pingtung	PIF	227	\N
2963	Taoyuan	TAO	227	\N
2964	Tainan City	TNN	227	\N
2965	Tainan	TNQ	227	\N
2966	Taipei City	TPE	227	\N
2967	Taipei	TPQ	227	\N
2968	Taitung	TTT	227	\N
2969	Taichung City	TXG	227	\N
2970	Taichung	TXQ	227	\N
2971	Yunlin	YUN	227	\N
2972	Vinnyts'ka Oblast'	05	229	\N
2973	Volyns'ka Oblast'	07	229	\N
2974	Luhans'ka Oblast'	09	229	\N
2975	Dnipropetrovs'ka Oblast'	12	229	\N
2976	Donets'ka Oblast'	14	229	\N
2977	Zhytomyrs'ka Oblast'	18	229	\N
2978	Zakarpats'ka Oblast'	21	229	\N
2979	Zaporiz'ka Oblast'	23	229	\N
2980	Ivano-Frankivs'ka Oblast'	26	229	\N
2981	Kyïvs'ka mis'ka rada	30	229	\N
2982	Kyïvs'ka Oblast'	32	229	\N
2983	Kirovohrads'ka Oblast'	35	229	\N
2984	Sevastopol	40	229	\N
2985	Respublika Krym	43	229	\N
2986	L'vivs'ka Oblast'	46	229	\N
2987	Mykolaïvs'ka Oblast'	48	229	\N
2988	Odes'ka Oblast'	51	229	\N
2989	Poltavs'ka Oblast'	53	229	\N
2990	Rivnens'ka Oblast'	56	229	\N
2991	Sums 'ka Oblast'	59	229	\N
2992	Ternopil's'ka Oblast'	61	229	\N
2993	Kharkivs'ka Oblast'	63	229	\N
2994	Khersons'ka Oblast'	65	229	\N
2995	Khmel'nyts'ka Oblast'	68	229	\N
2996	Cherkas'ka Oblast'	71	229	\N
2997	Chernihivs'ka Oblast'	74	229	\N
2998	Chernivets'ka Oblast'	77	229	\N
2999	Johnston Atoll	67	231	\N
3000	Midway Islands	71	231	\N
3001	Navassa Island	76	231	\N
3002	Wake Island	79	231	\N
3003	Baker Island	81	231	\N
3004	Howland Island	84	231	\N
3005	Jarvis Island	86	231	\N
3006	Kingman Reef	89	231	\N
3007	Palmyra Atoll	95	231	\N
3008	Alaska	AK	232	\N
3009	Alabama	AL	232	\N
3010	Arkansas	AR	232	\N
3011	American Samoa	AS	232	\N
3012	Arizona	AZ	232	\N
3013	California	CA	232	\N
3014	Colorado	CO	232	\N
3015	Connecticut	CT	232	\N
3016	District of Columbia	DC	232	\N
3017	Delaware	DE	232	\N
3018	Florida	FL	232	\N
3019	Georgia	GA	232	\N
3020	Guam	GU	232	\N
3021	Hawaii	HI	232	\N
3022	Iowa	IA	232	\N
3023	Idaho	ID	232	\N
3024	Illinois	IL	232	\N
3025	Indiana	IN	232	\N
3026	Kansas	KS	232	\N
3027	Kentucky	KY	232	\N
3028	Louisiana	LA	232	\N
3029	Massachusetts	MA	232	\N
3030	Maryland	MD	232	\N
3031	Maine	ME	232	\N
3032	Michigan	MI	232	\N
3033	Minnesota	MN	232	\N
3034	Missouri	MO	232	\N
3035	Northern Mariana Islands	MP	232	\N
3036	Mississippi	MS	232	\N
3037	Montana	MT	232	\N
3038	North Carolina	NC	232	\N
3039	North Dakota	ND	232	\N
3040	Nebraska	NE	232	\N
3041	New Hampshire	NH	232	\N
3042	New Jersey	NJ	232	\N
3043	New Mexico	NM	232	\N
3044	Nevada	NV	232	\N
3045	New York	NY	232	\N
3046	Ohio	OH	232	\N
3047	Oklahoma	OK	232	\N
3048	Oregon	OR	232	\N
3049	Pennsylvania	PA	232	\N
3050	Puerto Rico	PR	232	\N
3051	Rhode Island	RI	232	\N
3052	South Carolina	SC	232	\N
3053	South Dakota	SD	232	\N
3054	Tennessee	TN	232	\N
3055	Texas	TX	232	\N
3056	United States Minor Outlying Islands	UM	232	\N
3057	Utah	UT	232	\N
3058	Virginia	VA	232	\N
3059	Virgin Islands	VI	232	\N
3060	Vermont	VT	232	\N
3061	Washington	WA	232	\N
3062	Wisconsin	WI	232	\N
3063	West Virginia	WV	232	\N
3064	Wyoming	WY	232	\N
3065	Armed Forces Americas (except Canada)	AA	232	\N
3066	Armed Forces Africa, Canada, Europe, Middle East	AE	232	\N
3067	Armed Forces Pacific	AP	232	\N
3068	Artigas	AR	233	\N
3069	Canelones	CA	233	\N
3070	Cerro Largo	CL	233	\N
3071	Colonia	CO	233	\N
3072	Durazno	DU	233	\N
3073	Florida	FD	233	\N
3074	Flores	FS	233	\N
3075	Lavalleja	LA	233	\N
3076	Maldonado	MA	233	\N
3077	Montevideo	MO	233	\N
3078	Paysandú	PA	233	\N
3079	Río Negro	RN	233	\N
3080	Rocha	RO	233	\N
3081	Rivera	RV	233	\N
3082	Salto	SA	233	\N
3083	San José	SJ	233	\N
3084	Soriano	SO	233	\N
3085	Tacuarembó	TA	233	\N
3086	Treinta y Tres	TT	233	\N
3087	Andijon	AN	234	\N
3088	Buxoro	BU	234	\N
3089	Farg'ona	FA	234	\N
3090	Jizzax	JI	234	\N
3091	Namangan	NG	234	\N
3092	Navoiy	NW	234	\N
3093	Qashqadaryo	QA	234	\N
3094	Qoraqalpog'iston Respublikasi	QR	234	\N
3095	Samarqand	SA	234	\N
3096	Sirdaryo	SI	234	\N
3097	Surxondaryo	SU	234	\N
3098	Toshkent	TK	234	\N
3099	Toshkent	TO	234	\N
3100	Xorazm	XO	234	\N
3101	Charlotte	01	236	\N
3102	Saint Andrew	02	236	\N
3103	Saint David	03	236	\N
3104	Saint George	04	236	\N
3105	Saint Patrick	05	236	\N
3106	Grenadines	06	236	\N
3107	Distrito Federal	A	237	\N
3108	Anzoátegui	B	237	\N
3109	Apure	C	237	\N
3110	Aragua	D	237	\N
3111	Barinas	E	237	\N
3112	Bolívar	F	237	\N
3113	Carabobo	G	237	\N
3114	Cojedes	H	237	\N
3115	Falcón	I	237	\N
3116	Guárico	J	237	\N
3117	Lara	K	237	\N
3118	Mérida	L	237	\N
3119	Miranda	M	237	\N
3120	Monagas	N	237	\N
3121	Nueva Esparta	O	237	\N
3122	Portuguesa	P	237	\N
3123	Sucre	R	237	\N
3124	Táchira	S	237	\N
3125	Trujillo	T	237	\N
3126	Yaracuy	U	237	\N
3127	Zulia	V	237	\N
3128	Dependencias Federales	W	237	\N
3129	Vargas	X	237	\N
3130	Delta Amacuro	Y	237	\N
3131	Amazonas	Z	237	\N
3132	Lai Châu	01	240	\N
3133	Lào Cai	02	240	\N
3134	Hà Giang	03	240	\N
3135	Cao Bằng	04	240	\N
3136	Sơn La	05	240	\N
3137	Yên Bái	06	240	\N
3138	Tuyên Quang	07	240	\N
3139	Lạng Sơn	09	240	\N
3140	Quảng Ninh	13	240	\N
3141	Hoà Bình	14	240	\N
3142	Hà Tây	15	240	\N
3143	Ninh Bình	18	240	\N
3144	Thái Bình	20	240	\N
3145	Thanh Hóa	21	240	\N
3146	Nghệ An	22	240	\N
3147	Hà Tỉnh	23	240	\N
3148	Quảng Bình	24	240	\N
3149	Quảng Trị	25	240	\N
3150	Thừa Thiên-Huế	26	240	\N
3151	Quảng Nam	27	240	\N
3152	Kon Tum	28	240	\N
3153	Quảng Ngãi	29	240	\N
3154	Gia Lai	30	240	\N
3155	Bình Định	31	240	\N
3156	Phú Yên	32	240	\N
3157	Đắc Lắk	33	240	\N
3158	Khánh Hòa	34	240	\N
3159	Lâm Đồng	35	240	\N
3160	Ninh Thuận	36	240	\N
3161	Tây Ninh	37	240	\N
3162	Đồng Nai	39	240	\N
3163	Bình Thuận	40	240	\N
3164	Long An	41	240	\N
3165	Bà Rịa-Vũng Tàu	43	240	\N
3166	An Giang	44	240	\N
3167	Đồng Tháp	45	240	\N
3168	Tiền Giang	46	240	\N
3169	Kiên Giang	47	240	\N
3170	Vĩnh Long	49	240	\N
3171	Bến Tre	50	240	\N
3172	Trà Vinh	51	240	\N
3173	Sóc Trăng	52	240	\N
3174	Bắc Kạn	53	240	\N
3175	Bắc Giang	54	240	\N
3176	Bạc Liêu	55	240	\N
3177	Bắc Ninh	56	240	\N
3178	Bình Dương	57	240	\N
3179	Bình Phước	58	240	\N
3180	Cà Mau	59	240	\N
3181	Hải Duong	61	240	\N
3182	Hà Nam	63	240	\N
3183	Hưng Yên	66	240	\N
3184	Nam Định	67	240	\N
3185	Phú Thọ	68	240	\N
3186	Thái Nguyên	69	240	\N
3187	Vĩnh Phúc	70	240	\N
3188	Điện Biên	71	240	\N
3189	Đắk Nông	72	240	\N
3190	Hậu Giang	73	240	\N
3191	Cần Thơ	CT	240	\N
3192	Đà Nẵng	DN	240	\N
3193	Hà Nội	HN	240	\N
3194	Hải Phòng	HP	240	\N
3195	Hồ Chí Minh [Sài Gòn]	SG	240	\N
3196	A'ana	AA	243	\N
3197	Aiga-i-le-Tai	AL	243	\N
3198	Atua	AT	243	\N
3199	Fa'asaleleaga	FA	243	\N
3200	Gaga'emauga	GE	243	\N
3201	Gagaifomauga	GI	243	\N
3202	Palauli	PA	243	\N
3203	Satupa'itea	SA	243	\N
3204	Tuamasaga	TU	243	\N
3205	Va'a-o-Fonoti	VF	243	\N
3206	Vaisigano	VS	243	\N
3207	Eastern Cape	EC	246	\N
3208	Free State	FS	246	\N
3209	Gauteng	GP	246	\N
3210	Limpopo	LP	246	\N
3211	Mpumalanga	MP	246	\N
3212	Northern Cape	NC	246	\N
3213	North-West (South Africa)	NW	246	\N
3214	Western Cape	WC	246	\N
3215	Kwazulu-Natal	ZN	246	\N
3216	Western	01	247	\N
3217	Central	02	247	\N
3218	Eastern	03	247	\N
3219	Luapula	04	247	\N
3220	Northern	05	247	\N
3221	North-Western	06	247	\N
3222	Southern (Zambia)	07	247	\N
3223	Copperbelt	08	247	\N
3224	Lusaka	09	247	\N
3225	'Ajmān	AJ	2	\N
3226	Abū Ȥaby [Abu Dhabi]	AZ	2	\N
3227	Dubayy	DU	2	\N
3228	Al Fujayrah	FU	2	\N
3229	Ra’s al Khaymah	RK	2	\N
3230	Ash Shāriqah	SH	2	\N
3231	Umm al Qaywayn	UQ	2	\N
3232	Saint George	03	4	\N
3233	Saint John	04	4	\N
3234	Saint Mary	05	4	\N
3235	Saint Paul	06	4	\N
3236	Saint Peter	07	4	\N
3237	Saint Philip	08	4	\N
3238	Barbuda	10	4	\N
3239	Redonda	11	4	\N
3240	Bengo	BGO	8	\N
3241	Benguela	BGU	8	\N
3242	Bié	BIE	8	\N
3243	Cabinda	CAB	8	\N
3244	Cuando-Cubango	CCU	8	\N
3245	Cunene	CNN	8	\N
3246	Cuanza Norte	CNO	8	\N
3247	Cuanza Sul	CUS	8	\N
3248	Huambo	HUA	8	\N
3249	Huíla	HUI	8	\N
3250	Lunda Norte	LNO	8	\N
3251	Lunda Sul	LSU	8	\N
3252	Luanda	LUA	8	\N
3253	Malange	MAL	8	\N
3254	Moxico	MOX	8	\N
3255	Namibe	NAM	8	\N
3256	Uíge	UIG	8	\N
3257	Zaire	ZAI	8	\N
3258	Boucle du Mouhoun	01	21	\N
3259	Cascades	02	21	\N
3260	Centre	03	21	\N
3261	Centre-Est	04	21	\N
3262	Centre-Nord	05	21	\N
3263	Centre-Ouest	06	21	\N
3264	Centre-Sud	07	21	\N
3265	Est	08	21	\N
3266	Hauts-Bassins	09	21	\N
3267	Nord	10	21	\N
3268	Plateau-Central	11	21	\N
3269	Sahel	12	21	\N
3270	Sud-Ouest	13	21	\N
3271	Bubanza	BB	24	\N
3272	Bujumbura Rural	BL	24	\N
3273	Bujumbura Mairie	BM	24	\N
3274	Bururi	BR	24	\N
3275	Cankuzo	CA	24	\N
3276	Cibitoke	CI	24	\N
3277	Gitega	GI	24	\N
3278	Kirundo	KI	24	\N
3279	Karuzi	KR	24	\N
3280	Kayanza	KY	24	\N
3281	Makamba	MA	24	\N
3282	Muramvya	MU	24	\N
3283	Mwaro	MW	24	\N
3284	Ngozi	NG	24	\N
3285	Rutana	RT	24	\N
3286	Ruyigi	RY	24	\N
3287	Atakora	AK	25	\N
3288	Alibori	AL	25	\N
3289	Atlantique	AQ	25	\N
3290	Borgou	BO	25	\N
3291	Collines	CO	25	\N
3292	Donga	DO	25	\N
3293	Kouffo	KO	25	\N
3294	Littoral	LI	25	\N
3295	Mono	MO	25	\N
3296	Ouémé	OU	25	\N
3297	Plateau	PL	25	\N
3298	Zou	ZO	25	\N
3299	El Beni	B	29	\N
3300	Cochabamba	C	29	\N
3301	Chuquisaca	H	29	\N
3302	La Paz	L	29	\N
3303	Pando	N	29	\N
3304	Oruro	O	29	\N
3305	Potosí	P	29	\N
3306	Santa Cruz	S	29	\N
3307	Tarija	T	29	\N
3308	Acklins	AK	32	\N
3309	Bimini	BI	32	\N
3310	Black Point	BP	32	\N
3311	Berry Islands	BY	32	\N
3312	Central Eleuthera	CE	32	\N
3313	Cat Island	CI	32	\N
3314	Crooked Island and Long Cay	CK	32	\N
3315	Central Abaco	CO	32	\N
3316	Central Andros	CS	32	\N
3317	East Grand Bahama	EG	32	\N
3318	Exuma	EX	32	\N
3319	City of Freeport	FP	32	\N
3320	Grand Cay	GC	32	\N
3321	Harbour Island	HI	32	\N
3322	Hope Town	HT	32	\N
3323	Inagua	IN	32	\N
3324	Long Island	LI	32	\N
3325	Mangrove Cay	MC	32	\N
3326	Mayaguana	MG	32	\N
3327	Moore's Island	MI	32	\N
3328	North Eleuthera	NE	32	\N
3329	North Abaco	NO	32	\N
3330	North Andros	NS	32	\N
3331	Rum Cay	RC	32	\N
3332	Ragged Island	RI	32	\N
3333	South Andros	SA	32	\N
3334	South Eleuthera	SE	32	\N
3335	South Abaco	SO	32	\N
3336	San Salvador	SS	32	\N
3337	Spanish Wells	SW	32	\N
3338	West Grand Bahama	WG	32	\N
3339	Central	CE	35	\N
3340	Ghanzi	GH	35	\N
3341	Kgalagadi	KG	35	\N
3342	Kgatleng	KL	35	\N
3343	Kweneng	KW	35	\N
3344	North-East	NE	35	\N
3345	North-West	NW	35	\N
3346	South-East	SE	35	\N
3347	Southern	SO	35	\N
3348	Belize	BZ	37	\N
3349	Cayo	CY	37	\N
3350	Corozal	CZL	37	\N
3351	Orange Walk	OW	37	\N
3352	Stann Creek	SC	37	\N
3353	Toledo	TOL	37	\N
3354	Bas-Congo	BC	40	\N
3355	Bandundu	BN	40	\N
3356	Équateur	EQ	40	\N
3357	Katanga	KA	40	\N
3358	Kasai-Oriental	KE	40	\N
3359	Kinshasa	KN	40	\N
3360	Kasai-Occidental	KW	40	\N
3361	Maniema	MA	40	\N
3362	Nord-Kivu	NK	40	\N
3363	Orientale	OR	40	\N
3364	Sud-Kivu	SK	40	\N
3365	Ouham	AC	41	\N
3366	Bamingui-Bangoran	BB	41	\N
3367	Bangui	BGF	41	\N
3368	Basse-Kotto	BK	41	\N
3369	Haute-Kotto	HK	41	\N
3370	Haut-Mbomou	HM	41	\N
3371	Haute-Sangha / Mambéré-Kadéï	HS	41	\N
3372	Gribingui	KB	41	\N
3373	Kémo-Gribingui	KG	41	\N
3374	Lobaye	LB	41	\N
3375	Mbomou	MB	41	\N
3376	Ombella-M'poko	MP	41	\N
3377	Nana-Mambéré	NM	41	\N
3378	Ouham-Pendé	OP	41	\N
3379	Sangha	SE	41	\N
3380	Ouaka	UK	41	\N
3381	Vakaga	VK	41	\N
3382	Bouenza	11	42	\N
3383	Pool	12	42	\N
3384	Sangha	13	42	\N
3385	Plateaux	14	42	\N
3386	Cuvette-Ouest	15	42	\N
3387	Lékoumou	2	42	\N
3388	Kouilou	5	42	\N
3389	Likouala	7	42	\N
3390	Cuvette	8	42	\N
3391	Niari	9	42	\N
3392	Brazzaville	BZV	42	\N
3393	Lagunes (Région des)	01	44	\N
3394	Haut-Sassandra (Région du)	02	44	\N
3395	Savanes (Région des)	03	44	\N
3396	Vallée du Bandama (Région de la)	04	44	\N
3397	Moyen-Comoé (Région du)	05	44	\N
3398	18 Montagnes (Région des)	06	44	\N
3399	Lacs (Région des)	07	44	\N
3400	Zanzan (Région du)	08	44	\N
3401	Bas-Sassandra (Région du)	09	44	\N
3402	Denguélé (Région du)	10	44	\N
3403	Nzi-Comoé (Région)	11	44	\N
3404	Marahoué (Région de la)	12	44	\N
3405	Sud-Comoé (Région du)	13	44	\N
3406	Worodouqou (Région du)	14	44	\N
3407	Sud-Bandama (Région du)	15	44	\N
3408	Agnébi (Région de l')	16	44	\N
3409	Bafing (Région du)	17	44	\N
3410	Fromager (Région du)	18	44	\N
3411	Moyen-Cavally (Région du)	19	44	\N
3412	Adamaoua	AD	47	\N
3413	Centre	CE	47	\N
3414	Far North	EN	47	\N
3415	East	ES	47	\N
3416	Littoral	LT	47	\N
3417	North	NO	47	\N
3418	North-West (Cameroon)	NW	47	\N
3419	West	OU	47	\N
3420	South	SU	47	\N
3421	South-West	SW	47	\N
3422	Arta	AR	58	\N
3423	Ali Sabieh	AS	58	\N
3424	Dikhil	DI	58	\N
3425	Djibouti	DJ	58	\N
3426	Obock	OB	58	\N
3427	Tadjourah	TA	58	\N
3428	Saint Peter	01	60	\N
3429	Saint Andrew	02	60	\N
3430	Saint David	03	60	\N
3431	Saint George	04	60	\N
3432	Saint John	05	60	\N
3433	Saint Joseph	06	60	\N
3434	Saint Luke	07	60	\N
3435	Saint Mark	08	60	\N
3436	Saint Patrick	09	60	\N
3437	Saint Paul	10	60	\N
3438	Ansabā	AN	67	\N
3439	Janūbī al Baḩrī al Aḩmar	DK	67	\N
3440	Al Janūbī	DU	67	\N
3441	Qāsh-Barkah	GB	67	\N
3442	Al Awsaţ	MA	67	\N
3443	Shimālī al Baḩrī al Aḩmar	SK	67	\N
3444	Central	C	71	\N
3445	Eastern	E	71	\N
3446	Northern	N	71	\N
3447	Rotuma	R	71	\N
3448	Western	W	71	\N
3449	Saint Andrew	01	78	\N
3450	Saint David	02	78	\N
3451	Saint George	03	78	\N
3452	Saint John	04	78	\N
3453	Saint Mark	05	78	\N
3454	Saint Patrick	06	78	\N
3455	Southern Grenadine Islands	10	78	\N
3456	Greater Accra	AA	82	\N
3457	Ashanti	AH	82	\N
3458	Brong-Ahafo	BA	82	\N
3459	Central	CP	82	\N
3460	Eastern	EP	82	\N
3461	Northern	NP	82	\N
3462	Volta	TV	82	\N
3463	Upper East	UE	82	\N
3464	Upper West	UW	82	\N
3465	Western	WP	82	\N
3466	Banjul	B	85	\N
3467	Lower River	L	85	\N
3468	Central River	M	85	\N
3469	North Bank	N	85	\N
3470	Upper River	U	85	\N
3471	Western	W	85	\N
3472	Boké	B	86	\N
3473	Conakry	C	86	\N
3474	Kindia	D	86	\N
3475	Faranah	F	86	\N
3476	Kankan	K	86	\N
3477	Labé	L	86	\N
3478	Mamou	M	86	\N
3479	Nzérékoré	N	86	\N
3480	Región Continental	C	88	\N
3481	Región Insular	I	88	\N
3482	Barima-Waini	BA	94	\N
3483	Cuyuni-Mazaruni	CU	94	\N
3484	Demerara-Mahaica	DE	94	\N
3485	East Berbice-Corentyne	EB	94	\N
3486	Essequibo Islands-West Demerara	ES	94	\N
3487	Mahaica-Berbice	MA	94	\N
3488	Pomeroon-Supenaam	PM	94	\N
3489	Potaro-Siparuni	PT	94	\N
3490	Upper Demerara-Berbice	UD	94	\N
3491	Upper Takutu-Upper Essequibo	UT	94	\N
3492	Gilbert Islands	G	118	\N
3493	Line Islands	L	118	\N
3494	Phoenix Islands	P	118	\N
3495	Andjouân (Anjwān)	A	119	\N
3496	Andjazîdja (Anjazījah)	G	119	\N
3497	Moûhîlî (Mūhīlī)	M	119	\N
3498	Saint Kitts	K	120	\N
3499	Nevis	N	120	\N
3500	P’yŏngyang	01	121	\N
3501	P’yŏngan-namdo	02	121	\N
3502	P’yŏngan-bukto	03	121	\N
3503	Chagang-do	04	121	\N
3504	Hwanghae-namdo	05	121	\N
3505	Hwanghae-bukto	06	121	\N
3506	Kangwŏn-do	07	121	\N
3507	Hamgyŏng-namdo	08	121	\N
3508	Hamgyŏng-bukto	09	121	\N
3509	Yanggang-do	10	121	\N
3510	Nasŏn (Najin-Sŏnbong)	13	121	\N
3511	Banghāzī	BA	136	\N
3512	Al Buţnān	BU	136	\N
3513	Darnah	DR	136	\N
3514	Ghāt	GT	136	\N
3515	Al Jabal al Akhḑar	JA	136	\N
3516	Jaghbūb	JB	136	\N
3517	Al Jabal al Gharbī	JG	136	\N
3518	Al Jifārah	JI	136	\N
3519	Al Jufrah	JU	136	\N
3520	Al Kufrah	KF	136	\N
3521	Al Marqab	MB	136	\N
3522	Mişrātah	MI	136	\N
3523	Al Marj	MJ	136	\N
3524	Murzuq	MQ	136	\N
3525	Nālūt	NL	136	\N
3526	An Nuqaţ al Khams	NQ	136	\N
3527	Sabhā	SB	136	\N
3528	Surt	SR	136	\N
3529	Ţarābulus	TB	136	\N
3530	Al Wāḩāt	WA	136	\N
3531	Wādī al Ḩayāt	WD	136	\N
3532	Wādī ash Shāţiʾ	WS	136	\N
3533	Az Zāwiyah	ZA	136	\N
3534	Kayes	1	145	\N
3535	Koulikoro	2	145	\N
3536	Sikasso	3	145	\N
3537	Ségou	4	145	\N
3538	Mopti	5	145	\N
3539	Tombouctou	6	145	\N
3540	Gao	7	145	\N
3541	Kidal	8	145	\N
3542	Bamako	BK0	145	\N
3543	Hodh ech Chargui	01	151	\N
3544	Hodh el Charbi	02	151	\N
3545	Assaba	03	151	\N
3546	Gorgol	04	151	\N
3547	Brakna	05	151	\N
3548	Trarza	06	151	\N
3549	Adrar	07	151	\N
3550	Dakhlet Nouadhibou	08	151	\N
3551	Tagant	09	151	\N
3552	Guidimaka	10	151	\N
3553	Tiris Zemmour	11	151	\N
3554	Inchiri	12	151	\N
3555	Nouakchott	NKC	151	\N
3556	Central Region	C	156	\N
3557	Northern Region	N	156	\N
3558	Southern Region	S	156	\N
3559	Aiwo	01	169	\N
3560	Anabar	02	169	\N
3561	Anetan	03	169	\N
3562	Anibare	04	169	\N
3563	Baiti	05	169	\N
3564	Boe	06	169	\N
3565	Buada	07	169	\N
3566	Denigomodu	08	169	\N
3567	Ewa	09	169	\N
3568	Ijuw	10	169	\N
3569	Meneng	11	169	\N
3570	Nibok	12	169	\N
3571	Uaboe	13	169	\N
3572	Yaren	14	169	\N
3573	Bocas del Toro	1	173	\N
3574	Coclé	2	173	\N
3575	Colón	3	173	\N
3576	Chiriquí	4	173	\N
3577	Darién	5	173	\N
3578	Herrera	6	173	\N
3579	Los Santos	7	173	\N
3580	Panamá	8	173	\N
3581	Veraguas	9	173	\N
3582	Emberá	EM	173	\N
3583	Kuna Yala	KY	173	\N
3584	Ngöbe-Buglé	NB	173	\N
3585	Ad Dawhah	DA	186	\N
3586	Al Khawr wa adh Dhakhīrah	KH	186	\N
3587	Ash Shamal	MS	186	\N
3588	Ar Rayyan	RA	186	\N
3589	Umm Salal	US	186	\N
3590	Al Wakrah	WA	186	\N
3591	Az̧ Z̧a‘āyin	ZA	186	\N
3592	Ville de Kigali	01	191	\N
3593	Est	02	191	\N
3594	Nord	03	191	\N
3595	Ouest	04	191	\N
3596	Sud	05	191	\N
3597	Awdal	AW	205	\N
3598	Bakool	BK	205	\N
3599	Banaadir	BN	205	\N
3600	Bari	BR	205	\N
3601	Bay	BY	205	\N
3602	Galguduud	GA	205	\N
3603	Gedo	GE	205	\N
3604	Hiirsan	HI	205	\N
3605	Jubbada Dhexe	JD	205	\N
3606	Jubbada Hoose	JH	205	\N
3607	Mudug	MU	205	\N
3608	Nugaal	NU	205	\N
3609	Saneag	SA	205	\N
3610	Shabeellaha Dhexe	SD	205	\N
3611	Shabeellaha Hoose	SH	205	\N
3612	Sool	SO	205	\N
3613	Togdheer	TO	205	\N
3614	Woqooyi Galbeed	WO	205	\N
3615	Central	CE	193	\N
3616	Choiseul	CH	193	\N
3617	Capital Territory (Honiara)	CT	193	\N
3618	Guadalcanal	GU	193	\N
3619	Isabel	IS	193	\N
3620	Makira	MK	193	\N
3621	Malaita	ML	193	\N
3622	Rennell and Bellona	RB	193	\N
3623	Temotu	TE	193	\N
3624	Western	WE	193	\N
3625	Anse aux Pins	01	194	\N
3626	Anse Boileau	02	194	\N
3627	Anse Etoile	03	194	\N
3628	Anse Louis	04	194	\N
3629	Anse Royale	05	194	\N
3630	Baie Lazare	06	194	\N
3631	Baie Sainte Anne	07	194	\N
3632	Beau Vallon	08	194	\N
3633	Bel Air	09	194	\N
3634	Bel Ombre	10	194	\N
3635	Cascade	11	194	\N
3636	Glacis	12	194	\N
3637	Grand Anse Mahe	13	194	\N
3638	Grand Anse Praslin	14	194	\N
3639	La Digue	15	194	\N
3640	English River	16	194	\N
3641	Mont Buxton	17	194	\N
3642	Mont Fleuri	18	194	\N
3643	Plaisance	19	194	\N
3644	Pointe Larue	20	194	\N
3645	Port Glaud	21	194	\N
3646	Saint Louis	22	194	\N
3647	Takamaka	23	194	\N
3648	Les Mamelles	24	194	\N
3649	Roche Caiman	25	194	\N
3650	Eastern	E	202	\N
3651	Northern	N	202	\N
3652	Southern (Sierra Leone)	S	202	\N
3653	Western Area (Freetown)	W	202	\N
3654	Brokopondo	BR	206	\N
3655	Commewijne	CM	206	\N
3656	Coronie	CR	206	\N
3657	Marowijne	MA	206	\N
3658	Nickerie	NI	206	\N
3659	Paramaribo	PM	206	\N
3660	Para	PR	206	\N
3661	Saramacca	SA	206	\N
3662	Sipaliwini	SI	206	\N
3663	Wanica	WA	206	\N
3664	Príncipe	P	208	\N
3665	São Tomé	S	208	\N
3666	Dimashq	DI	211	\N
3667	Dar'a	DR	211	\N
3668	Dayr az Zawr	DY	211	\N
3669	Al Hasakah	HA	211	\N
3670	Homs	HI	211	\N
3671	Halab	HL	211	\N
3672	Hamah	HM	211	\N
3673	Idlib	ID	211	\N
3674	Al Ladhiqiyah	LA	211	\N
3675	Al Qunaytirah	QU	211	\N
3676	Ar Raqqah	RA	211	\N
3677	Rif Dimashq	RD	211	\N
3678	As Suwayda'	SU	211	\N
3679	Tartus	TA	211	\N
3680	Région du Centre	C	216	\N
3681	Région de la Kara	K	216	\N
3682	Région Maritime	M	216	\N
3683	Région des Plateaux	P	216	\N
3684	Région des Savannes	S	216	\N
3685	Aileu	AL	220	\N
3686	Ainaro	AN	220	\N
3687	Baucau	BA	220	\N
3688	Bobonaro	BO	220	\N
3689	Cova Lima	CO	220	\N
3690	Díli	DI	220	\N
3691	Ermera	ER	220	\N
3692	Lautem	LA	220	\N
3693	Liquiça	LI	220	\N
3694	Manufahi	MF	220	\N
3695	Manatuto	MT	220	\N
3696	Oecussi	OE	220	\N
3697	Viqueque	VI	220	\N
3698	'Eua	01	223	\N
3699	Ha'apai	02	223	\N
3700	Niuas	03	223	\N
3701	Tongatapu	04	223	\N
3702	Vava'u	05	223	\N
3703	Funafuti	FUN	226	\N
3704	Niutao	NIT	226	\N
3705	Nukufetau	NKF	226	\N
3706	Nukulaelae	NKL	226	\N
3707	Nanumea	NMA	226	\N
3708	Nanumanga	NMG	226	\N
3709	Nui	NUI	226	\N
3710	Vaitupu	VAI	226	\N
3711	Arusha	01	228	\N
3712	Dar-es-Salaam	02	228	\N
3713	Dodoma	03	228	\N
3714	Iringa	04	228	\N
3715	Kagera	05	228	\N
3716	Kaskazini Pemba	06	228	\N
3717	Kaskazini Unguja	07	228	\N
3718	Kigoma	08	228	\N
3719	Kilimanjaro	09	228	\N
3720	Kusini Pemba	10	228	\N
3721	Kusini Unguja	11	228	\N
3722	Lindi	12	228	\N
3723	Mara	13	228	\N
3724	Mbeya	14	228	\N
3725	Mjini Magharibi	15	228	\N
3726	Morogoro	16	228	\N
3727	Mtwara	17	228	\N
3728	Mwanza	18	228	\N
3729	Pwani	19	228	\N
3730	Rukwa	20	228	\N
3731	Ruvuma	21	228	\N
3732	Shinyanga	22	228	\N
3733	Singida	23	228	\N
3734	Tabora	24	228	\N
3735	Tanga	25	228	\N
3736	Manyara	26	228	\N
3737	Central	C	230	\N
3738	Eastern	E	230	\N
3739	Northern	N	230	\N
3740	Western	W	230	\N
3741	Malampa	MAP	241	\N
3742	Pénama	PAM	241	\N
3743	Sanma	SAM	241	\N
3744	Shéfa	SEE	241	\N
3745	Taféa	TAE	241	\N
3746	Torba	TOB	241	\N
3747	Abyān	AB	244	\N
3748	'Adan	AD	244	\N
3749	'Amrān	AM	244	\N
3750	Al Bayḑā'	BA	244	\N
3751	Aḑ Ḑāli‘	DA	244	\N
3752	Dhamār	DH	244	\N
3753	Ḩaḑramawt	HD	244	\N
3754	Ḩajjah	HJ	244	\N
3755	Ibb	IB	244	\N
3756	Al Jawf	JA	244	\N
3757	Laḩij	LA	244	\N
3758	Ma'rib	MA	244	\N
3759	Al Mahrah	MR	244	\N
3760	Al Ḩudaydah	MU	244	\N
3761	Al Maḩwīt	MW	244	\N
3762	Raymah	RA	244	\N
3763	Şa'dah	SD	244	\N
3764	Shabwah	SH	244	\N
3765	Şan'ā'	SN	244	\N
3766	Tā'izz	TA	244	\N
3767	Bulawayo	BU	248	\N
3768	Harare	HA	248	\N
3769	Manicaland	MA	248	\N
3770	Mashonaland Central	MC	248	\N
3771	Mashonaland East	ME	248	\N
3772	Midlands	MI	248	\N
3773	Matabeleland North	MN	248	\N
3774	Matabeleland South	MS	248	\N
3775	Masvingo	MV	248	\N
3776	Mashonaland West	MW	248	\N
\.


--
-- Name: spree_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_states_id_seq', 3776, true);


--
-- Data for Name: spree_stock_items; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_stock_items (id, stock_location_id, variant_id, count_on_hand, created_at, updated_at, backorderable, deleted_at) FROM stdin;
2	1	2	10	2017-11-15 10:04:30.878592	2017-11-15 10:04:32.140216	f	\N
13	1	13	10	2017-11-15 10:04:30.960736	2017-11-15 10:04:32.266618	f	\N
8	1	8	10	2017-11-15 10:04:30.923591	2017-11-15 10:04:32.616583	f	\N
16	1	16	10	2017-11-15 10:04:30.988374	2017-11-15 10:04:32.840049	f	\N
12	1	12	10	2017-11-15 10:04:30.953033	2017-11-15 10:04:33.039825	f	\N
7	1	7	10	2017-11-15 10:04:30.917345	2017-11-15 12:44:51.688841	f	\N
26	1	26	10	2017-11-15 10:04:31.060681	2017-11-15 13:27:16.695876	f	2017-11-15 13:27:16.69583
25	1	25	10	2017-11-15 10:04:31.054245	2017-11-15 13:27:19.154584	f	2017-11-15 13:27:19.154469
24	1	24	10	2017-11-15 10:04:31.048039	2017-11-15 13:27:21.75706	f	2017-11-15 13:27:21.757006
23	1	23	10	2017-11-15 10:04:31.040906	2017-11-15 13:27:24.193805	f	2017-11-15 13:27:24.19376
22	1	22	10	2017-11-15 10:04:31.032949	2017-11-15 13:27:26.266251	f	2017-11-15 13:27:26.266211
21	1	21	10	2017-11-15 10:04:31.026537	2017-11-15 13:27:28.626169	f	2017-11-15 13:27:28.626124
20	1	20	10	2017-11-15 10:04:31.019043	2017-11-15 13:27:30.964892	f	2017-11-15 13:27:30.964845
19	1	19	10	2017-11-15 10:04:31.012527	2017-11-15 13:27:32.888908	f	2017-11-15 13:27:32.888866
15	1	15	10	2017-11-15 10:04:30.979386	2017-11-24 15:37:11.200551	f	2017-11-24 15:37:11.200505
9	1	9	10	2017-11-15 10:04:30.930251	2017-11-24 15:37:14.922184	f	2017-11-24 15:37:14.922133
10	1	10	10	2017-11-15 10:04:30.938365	2017-11-24 15:37:18.286067	f	2017-11-24 15:37:18.28601
11	1	11	10	2017-11-15 10:04:30.946327	2017-11-24 15:37:21.372052	f	2017-11-24 15:37:21.371976
3	1	3	0	2017-11-15 10:04:30.886157	2017-11-24 15:37:24.730179	f	2017-11-24 15:37:24.730102
17	1	17	10	2017-11-15 10:04:30.996428	2017-11-24 15:37:24.792542	f	2017-11-24 15:37:24.792468
18	1	18	10	2017-11-15 10:04:31.004375	2017-11-24 15:37:24.904414	f	2017-11-24 15:37:24.904341
4	1	4	10	2017-11-15 10:04:30.893854	2017-11-24 15:37:28.184741	f	2017-11-24 15:37:28.184537
5	1	5	10	2017-11-15 10:04:30.902408	2017-11-24 15:37:31.966721	f	2017-11-24 15:37:31.966674
14	1	14	9	2017-11-15 10:04:30.971335	2017-11-25 13:03:21.523208	f	\N
1	1	1	9	2017-11-15 10:04:30.851271	2017-11-25 13:54:34.698694	f	\N
6	1	6	9	2017-11-15 10:04:30.910842	2017-11-25 14:31:16.972945	f	\N
\.


--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_stock_items_id_seq', 26, true);


--
-- Data for Name: spree_stock_locations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_stock_locations (id, name, created_at, updated_at, "default", address1, address2, city, state_id, state_name, country_id, zipcode, phone, active, backorderable_default, propagate_all_variants, admin_name) FROM stdin;
1	default	2017-11-15 10:04:30.814398	2017-11-15 10:04:30.814398	f	Example Street	\N	City	3008	\N	232	12345	\N	t	f	t	\N
\.


--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_stock_locations_id_seq', 1, true);


--
-- Data for Name: spree_stock_movements; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_stock_movements (id, stock_item_id, quantity, action, created_at, updated_at, originator_type, originator_id) FROM stdin;
1	17	10	\N	2017-11-15 10:04:31.385548	2017-11-15 10:04:31.385548	\N	\N
2	18	10	\N	2017-11-15 10:04:31.481867	2017-11-15 10:04:31.481867	\N	\N
3	19	10	\N	2017-11-15 10:04:31.539008	2017-11-15 10:04:31.539008	\N	\N
4	20	10	\N	2017-11-15 10:04:31.597559	2017-11-15 10:04:31.597559	\N	\N
5	21	10	\N	2017-11-15 10:04:31.664118	2017-11-15 10:04:31.664118	\N	\N
6	22	10	\N	2017-11-15 10:04:31.723834	2017-11-15 10:04:31.723834	\N	\N
7	23	10	\N	2017-11-15 10:04:31.782891	2017-11-15 10:04:31.782891	\N	\N
8	24	10	\N	2017-11-15 10:04:31.849276	2017-11-15 10:04:31.849276	\N	\N
9	25	10	\N	2017-11-15 10:04:31.90589	2017-11-15 10:04:31.90589	\N	\N
10	26	10	\N	2017-11-15 10:04:31.974989	2017-11-15 10:04:31.974989	\N	\N
11	1	10	\N	2017-11-15 10:04:32.052357	2017-11-15 10:04:32.052357	\N	\N
12	2	10	\N	2017-11-15 10:04:32.125149	2017-11-15 10:04:32.125149	\N	\N
13	4	10	\N	2017-11-15 10:04:32.191871	2017-11-15 10:04:32.191871	\N	\N
14	13	10	\N	2017-11-15 10:04:32.250571	2017-11-15 10:04:32.250571	\N	\N
15	5	10	\N	2017-11-15 10:04:32.313576	2017-11-15 10:04:32.313576	\N	\N
16	14	10	\N	2017-11-15 10:04:32.38776	2017-11-15 10:04:32.38776	\N	\N
17	7	10	\N	2017-11-15 10:04:32.456291	2017-11-15 10:04:32.456291	\N	\N
18	6	10	\N	2017-11-15 10:04:32.520794	2017-11-15 10:04:32.520794	\N	\N
19	8	10	\N	2017-11-15 10:04:32.589223	2017-11-15 10:04:32.589223	\N	\N
20	15	10	\N	2017-11-15 10:04:32.66593	2017-11-15 10:04:32.66593	\N	\N
21	9	10	\N	2017-11-15 10:04:32.741633	2017-11-15 10:04:32.741633	\N	\N
22	16	10	\N	2017-11-15 10:04:32.823155	2017-11-15 10:04:32.823155	\N	\N
23	10	10	\N	2017-11-15 10:04:32.886645	2017-11-15 10:04:32.886645	\N	\N
24	11	10	\N	2017-11-15 10:04:32.959452	2017-11-15 10:04:32.959452	\N	\N
25	12	10	\N	2017-11-15 10:04:33.02052	2017-11-15 10:04:33.02052	\N	\N
26	7	-1	\N	2017-11-15 12:27:34.395677	2017-11-15 12:27:34.395677	Spree::Shipment	4
27	7	1	\N	2017-11-15 12:44:51.670652	2017-11-15 12:44:51.670652	\N	\N
28	14	-1	\N	2017-11-25 13:03:21.50216	2017-11-25 13:03:21.50216	Spree::Shipment	5
29	1	-1	\N	2017-11-25 13:36:11.040278	2017-11-25 13:36:11.040278	Spree::Shipment	6
30	1	1	\N	2017-11-25 13:52:38.834368	2017-11-25 13:52:38.834368	Spree::ReturnAuthorization	1
31	1	-1	\N	2017-11-25 13:54:34.680067	2017-11-25 13:54:34.680067	Spree::Shipment	7
32	6	-1	\N	2017-11-25 14:31:16.953196	2017-11-25 14:31:16.953196	Spree::Shipment	8
\.


--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_stock_movements_id_seq', 32, true);


--
-- Data for Name: spree_stock_transfers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_stock_transfers (id, type, reference, source_location_id, destination_location_id, created_at, updated_at, number) FROM stdin;
\.


--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_stock_transfers_id_seq', 1, false);


--
-- Data for Name: spree_store_credit_categories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_store_credit_categories (id, name, created_at, updated_at) FROM stdin;
1	Default	2017-11-15 10:04:50.940475	2017-11-15 10:04:50.940475
\.


--
-- Name: spree_store_credit_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_store_credit_categories_id_seq', 1, true);


--
-- Data for Name: spree_store_credit_events; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_store_credit_events (id, store_credit_id, action, amount, authorization_code, user_total_amount, originator_id, originator_type, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_store_credit_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_store_credit_events_id_seq', 1, false);


--
-- Data for Name: spree_store_credit_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_store_credit_types (id, name, priority, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_store_credit_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_store_credit_types_id_seq', 1, false);


--
-- Data for Name: spree_store_credits; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_store_credits (id, user_id, category_id, created_by_id, amount, amount_used, memo, deleted_at, currency, amount_authorized, originator_id, originator_type, type_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_store_credits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_store_credits_id_seq', 1, false);


--
-- Data for Name: spree_stores; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_stores (id, name, url, meta_description, meta_keywords, seo_title, mail_from_address, default_currency, code, "default", created_at, updated_at) FROM stdin;
1	Spree Demo Site	example.com				spree@example.com	\N	spree	t	2017-11-15 10:03:59.013023	2017-11-25 13:25:06.717927
\.


--
-- Name: spree_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_stores_id_seq', 1, true);


--
-- Data for Name: spree_taggings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_taggings (id, tag_id, taggable_type, taggable_id, tagger_type, tagger_id, context, created_at) FROM stdin;
\.


--
-- Name: spree_taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_taggings_id_seq', 1, false);


--
-- Data for Name: spree_tags; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_tags (id, name, taggings_count) FROM stdin;
\.


--
-- Name: spree_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_tags_id_seq', 1, false);


--
-- Data for Name: spree_tax_categories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_tax_categories (id, name, description, is_default, deleted_at, created_at, updated_at, tax_code) FROM stdin;
1	Clothing	\N	f	\N	2017-11-15 10:04:16.654916	2017-11-15 10:04:16.654916	\N
2	Food	\N	f	\N	2017-11-15 10:04:16.683312	2017-11-15 10:04:16.683312	\N
3	Default		t	\N	2017-11-15 12:12:48.248553	2017-11-15 12:12:48.248553	
\.


--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_tax_categories_id_seq', 3, true);


--
-- Data for Name: spree_tax_rates; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_tax_rates (id, amount, zone_id, tax_category_id, included_in_price, created_at, updated_at, name, show_rate_in_label, deleted_at) FROM stdin;
1	0.05000	2	1	f	2017-11-15 10:04:16.787495	2017-11-15 10:04:16.787495	North America	t	\N
2	0.07000	3	3	f	2017-11-15 12:15:35.699428	2017-11-15 12:15:35.699428	VAT	t	\N
\.


--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_tax_rates_id_seq', 2, true);


--
-- Data for Name: spree_taxonomies; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_taxonomies (id, name, created_at, updated_at, "position") FROM stdin;
2	Brands	2017-11-15 10:04:23.206492	2017-11-25 14:31:16.997539	1
\.


--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_taxonomies_id_seq', 2, true);


--
-- Data for Name: spree_taxons; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_taxons (id, parent_id, "position", name, permalink, taxonomy_id, lft, rgt, icon_file_name, icon_content_type, icon_file_size, icon_updated_at, description, created_at, updated_at, meta_title, meta_description, meta_keywords, depth) FROM stdin;
15	14	0	Shirts	brand/clothing/shirt	2	7	8	\N	\N	\N	\N	\N	2017-11-15 11:48:36.115936	2017-11-15 14:15:56.226599	\N	\N	\N	2
18	2	0	Apache	brand/apache	2	14	15	\N	\N	\N	\N	\N	2017-11-15 11:49:07.890051	2017-11-15 12:44:51.703326	\N	\N	\N	1
19	2	0	Nike	brand/nike	2	16	17	\N	\N	\N	\N	\N	2017-11-15 11:49:36.710107	2017-11-15 14:24:59.301195	\N	\N	\N	1
13	2	0	Mugs	brand/mugs	2	4	5	\N	\N	\N	\N	\N	2017-11-15 11:48:17.549149	2017-11-15 14:18:07.967496	\N	\N	\N	1
12	2	0	Bags	brand/bags	2	2	3	\N	\N	\N	\N	\N	2017-11-15 11:48:12.196674	2017-11-25 13:54:34.717909	\N	\N	\N	1
21	2	0	Puma	brand/puma	2	18	19	\N	\N	\N	\N	\N	2017-11-15 11:50:00.108337	2017-11-25 13:54:34.717909	\N	\N	\N	1
17	2	0	Adidas	brand/new-node	2	12	13	\N	\N	\N	\N	\N	2017-11-15 11:48:49.607616	2017-11-25 14:31:16.990338	\N	\N	\N	1
16	14	0	T-Shirts	brand/clothing/t-shirt	2	9	10	\N	\N	\N	\N	\N	2017-11-15 11:48:44.71646	2017-11-25 14:31:16.990338	\N	\N	\N	2
14	2	0	Clothing	brand/clothing	2	6	11	\N	\N	\N	\N	\N	2017-11-15 11:48:25.314762	2017-11-25 14:31:16.990338	\N	\N	\N	1
2	\N	0	Brands	brand	2	1	20	\N	\N	\N	\N	\N	2017-11-15 10:04:23.211848	2017-11-25 14:31:16.990338	\N	\N	\N	0
\.


--
-- Name: spree_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_taxons_id_seq', 21, true);


--
-- Data for Name: spree_themes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_themes (id, name, state, template_file_file_name, template_file_content_type, template_file_file_size, template_file_updated_at) FROM stdin;
\.


--
-- Name: spree_themes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_themes_id_seq', 1, false);


--
-- Data for Name: spree_themes_templates; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_themes_templates (id, name, body, path, format, locale, handler, partial, theme_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_themes_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_themes_templates_id_seq', 1, false);


--
-- Data for Name: spree_trackers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_trackers (id, analytics_id, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_trackers_id_seq', 1, false);


--
-- Data for Name: spree_users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_users (id, encrypted_password, password_salt, email, remember_token, persistence_token, reset_password_token, perishable_token, sign_in_count, failed_attempts, last_request_at, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, login, ship_address_id, bill_address_id, authentication_token, unlock_token, locked_at, reset_password_sent_at, created_at, updated_at, spree_api_key, remember_created_at, deleted_at, confirmation_token, confirmed_at, confirmation_sent_at, loyalty_points_balance, lock_version) FROM stdin;
3	06e8dd66ec6b2b95e9dc3f7b470cb496506daecd06d217fdd4dac38bcfe8241b587b9b0074b83908ebc6b302f782aa26efb7de1193473ce4d49ac4613c62f044	C7zQ9TzGqnuWjB_eKFxx	products@ecomm9.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	products@ecomm9.com	\N	\N	\N	\N	\N	\N	2017-11-15 15:08:58.115947	2017-11-15 15:09:01.059501	b6756e403e2bdd86c05bd02b0fc59f7c268b514f81171649	\N	\N	\N	\N	\N	0	0
4	c0b64dc628e7edbcda2e6f195227fc1104c8569db83d32eab2a2c97abd7f1bf0eacbae4f6d673e2b0964f8fc32dfd3d8e07c99344e5e5915b1bade293e600900	zs675--8ecxNC2FW1DLs	orders@ecomm9.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	orders@ecomm9.com	\N	\N	\N	\N	\N	\N	2017-11-15 15:09:37.571386	2017-11-15 15:09:41.046282	01d2138ae630a424ffc0216f84bf8c8f0efc62616cf5cb61	\N	\N	\N	\N	\N	0	0
5	adfca84108a91bbb07f275033fadcd71deebd37a192f602f87631c541491c59fab824362840628531ca02eb256d98ce368e0e5bff695e11bb4461b93000bce54	sbx_z7331Q84yFxQM7uU	users@ecomm9.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	users@ecomm9.com	\N	\N	\N	\N	\N	\N	2017-11-15 15:10:17.168751	2017-11-15 15:10:20.917782	c657ac81ba222f51e3fffa032cf451442d6e4c1fdde0c4cd	\N	\N	\N	\N	\N	0	0
6	0ce9c513dca69c46fbc67401cc60e2ab358ed0440b75d124162faab2da648c0c36c5141afb433dabc43a9d4e5b83b5a9a6b713740c39dff790ac405231f23b44	sgTCGw41x7gxmSfuNGTu	spree@example.com	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	spree@example.com	\N	\N	\N	\N	\N	\N	2017-11-25 10:54:07.709695	2017-11-25 10:54:07.709695	\N	\N	\N	\N	\N	\N	0	0
2	2ee2d74f951334f182b1e117d0fa6d4794755e8dc152578c0c530f5172495fe5020261bc7e9b8be8e90b87b3cc62729900457f98fa803b88ade6470e0b472d12	GxM2VfXWzKsQsDSkqmpx	customer@ecomm9.com	\N	\N	\N	\N	4	0	\N	2017-11-28 14:35:24.862271	2017-11-28 14:27:14.30869	127.0.0.1	127.0.0.1	customer@ecomm9.com	10	9	\N	\N	\N	\N	2017-11-15 15:08:13.707543	2017-11-28 14:35:24.863367	971a173a7ea9e961ebfbef0ed786172fc1845890ed546660	\N	\N	\N	\N	\N	0	5
7	02e3fcf3a54d49df0b734649d161dbc6c7de1514b909b730d7fb47f632f3b90575cf55088c021fd76623d91c58d48895c244ae32322ed1c34efccadc0d3e9178	DYMxpnvksZ7KL9RZ2fR3	test@ecomm9.com	\N	\N	\N	\N	1	0	\N	2017-11-29 09:31:47.946213	2017-11-29 09:31:47.946213	127.0.0.1	127.0.0.1	test@ecomm9.com	\N	\N	\N	\N	\N	\N	2017-11-29 09:31:47.753745	2017-11-29 09:31:47.947858	\N	\N	\N	\N	\N	\N	0	1
1	3a4296b0237537f98babc45667b297ac164a1a881d4cbf70be5cdbb97f1677b58659afd700e515a36e79b3f8d5bfc1858b151d7ca22f9bca95dd84985a91f1f4	GpMCDfxz7En4sDRH9zWG	admin@ecomm9.com	\N	\N	\N	\N	19	0	\N	2017-12-06 09:41:47.053566	2017-12-04 14:22:20.084706	127.0.0.1	127.0.0.1	admin@ecomm9.com	6	5	\N	\N	\N	\N	2017-11-15 09:59:51.39731	2017-12-06 09:41:47.055104	103264b88495c52bc9f5a4f198c31f16f7cd74859d5bd6fa	\N	\N	\N	\N	\N	447	19
\.


--
-- Name: spree_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_users_id_seq', 7, true);


--
-- Data for Name: spree_variants; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_variants (id, sku, weight, height, width, depth, deleted_at, is_master, product_id, cost_price, "position", cost_currency, track_inventory, tax_category_id, updated_at, discontinue_on, created_at) FROM stdin;
13	ROR-00014	0.00	\N	\N	\N	\N	t	13	11.00	1	USD	t	\N	2017-11-15 13:47:33.976138	\N	2017-11-15 10:04:19.951763
12	NK-00012	0.00	\N	\N	\N	\N	t	12	21.00	1	USD	t	\N	2017-11-15 14:12:22.635593	\N	2017-11-15 10:04:19.72246
8	NK-00001	0.00	\N	\N	\N	\N	t	8	17.00	1	USD	t	\N	2017-11-15 14:14:32.155268	\N	2017-11-15 10:04:18.82385
16	NK-00014	0.00	\N	\N	\N	\N	t	16	11.00	1	USD	t	\N	2017-11-15 14:18:07.954891	\N	2017-11-15 10:04:20.618474
26	ROR-00010	0.00	\N	\N	\N	2017-11-15 13:27:16.70914	f	3	17.00	4	USD	t	\N	2017-11-15 13:27:32.90472	\N	2017-11-15 10:04:29.945225
25	ROR-00009	0.00	\N	\N	\N	2017-11-15 13:27:19.16748	f	3	17.00	4	USD	t	\N	2017-11-15 13:27:32.90472	\N	2017-11-15 10:04:29.878688
24	ROR-00008	0.00	\N	\N	\N	2017-11-15 13:27:21.771079	f	3	17.00	4	USD	t	\N	2017-11-15 13:27:32.90472	\N	2017-11-15 10:04:29.807139
7	APC-00001	0.00	\N	\N	\N	\N	t	7	17.00	1	USD	t	\N	2017-11-15 12:44:51.691189	\N	2017-11-15 10:04:18.593043
2	PMA-00012	0.00	\N	\N	\N	\N	t	2	21.00	1	USD	t	\N	2017-11-15 13:11:01.468937	\N	2017-11-15 10:04:17.443191
23	ROR-00007	0.00	\N	\N	\N	2017-11-15 13:27:24.205322	f	3	17.00	4	USD	t	\N	2017-11-15 13:27:32.90472	\N	2017-11-15 10:04:29.747495
22	ROR-00006	0.00	\N	\N	\N	2017-11-15 13:27:26.277311	f	3	17.00	4	USD	t	\N	2017-11-15 13:27:32.90472	\N	2017-11-15 10:04:29.689992
21	ROR-00005	0.00	\N	\N	\N	2017-11-15 13:27:28.637312	f	3	17.00	4	USD	t	\N	2017-11-15 13:27:32.90472	\N	2017-11-15 10:04:29.625692
20	ROR-00004	0.00	\N	\N	\N	2017-11-15 13:27:30.978257	f	3	17.00	4	USD	t	\N	2017-11-15 13:27:32.90472	\N	2017-11-15 10:04:29.555761
19	ROR-00003	0.00	\N	\N	\N	2017-11-15 13:27:32.901878	f	3	17.00	4	USD	t	\N	2017-11-15 13:27:32.881178	\N	2017-11-15 10:04:29.484633
15	NK-00016	0.00	\N	\N	\N	2017-11-24 15:37:11.270605	t	15	15.00	1	USD	t	\N	2017-11-24 15:37:11.154399	\N	2017-11-15 10:04:20.392192
9	NK-00013	0.00	\N	\N	\N	2017-11-24 15:37:14.951786	t	9	17.00	1	USD	t	\N	2017-11-24 15:37:14.912429	\N	2017-11-15 10:04:19.051768
10	NK-00015	0.00	\N	\N	\N	2017-11-24 15:37:18.326693	t	10	17.00	1	USD	t	\N	2017-11-24 15:37:18.275282	\N	2017-11-15 10:04:19.289929
11	NK-00011	0.00	\N	\N	\N	2017-11-24 15:37:21.425566	t	11	13.00	1	USD	t	\N	2017-11-24 15:37:21.362031	\N	2017-11-15 10:04:19.508666
3	ROR-001	0.00	\N	\N	\N	2017-11-24 15:37:24.772254	t	3	17.00	1	USD	t	\N	2017-11-24 15:37:24.718379	\N	2017-11-15 10:04:17.674639
17	PMA-00001	0.00	\N	\N	\N	2017-11-24 15:37:24.884804	f	3	17.00	2	USD	t	\N	2017-11-24 15:37:24.782954	\N	2017-11-15 10:04:29.236237
18	PMA-00002	0.00	\N	\N	\N	2017-11-24 15:37:24.937771	f	3	17.00	3	USD	t	\N	2017-11-24 15:37:24.894607	\N	2017-11-15 10:04:29.420054
4	PMA-00013	0.00	\N	\N	\N	2017-11-24 15:37:28.212473	t	4	17.00	1	USD	t	\N	2017-11-24 15:37:28.173283	\N	2017-11-15 10:04:17.907938
5	PMA-00015	0.00	\N	\N	\N	2017-11-24 15:37:32.072854	t	5	17.00	1	USD	t	\N	2017-11-24 15:37:31.954424	\N	2017-11-15 10:04:18.164287
14	PMA-00016	0.00	\N	\N	\N	\N	t	14	15.00	1	USD	t	\N	2017-11-25 13:03:21.526775	\N	2017-11-15 10:04:20.170402
1	PMA-00011	0.00	\N	\N	\N	\N	t	1	17.00	1	USD	t	\N	2017-11-25 13:54:34.702677	\N	2017-11-15 10:04:17.069852
6	ADS-00001	0.00	\N	\N	\N	\N	t	6	17.00	1	USD	t	\N	2017-11-25 14:31:16.976458	\N	2017-11-15 10:04:18.385222
\.


--
-- Name: spree_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_variants_id_seq', 26, true);


--
-- Data for Name: spree_zone_members; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_zone_members (id, zoneable_type, zoneable_id, zone_id, created_at, updated_at) FROM stdin;
1	Spree::Country	179	1	2017-11-15 10:03:59.162875	2017-11-15 10:03:59.162875
2	Spree::Country	70	1	2017-11-15 10:03:59.186667	2017-11-15 10:03:59.186667
3	Spree::Country	183	1	2017-11-15 10:03:59.2081	2017-11-15 10:03:59.2081
4	Spree::Country	188	1	2017-11-15 10:03:59.236609	2017-11-15 10:03:59.236609
5	Spree::Country	57	1	2017-11-15 10:03:59.257814	2017-11-15 10:03:59.257814
6	Spree::Country	75	1	2017-11-15 10:03:59.286476	2017-11-15 10:03:59.286476
7	Spree::Country	201	1	2017-11-15 10:03:59.307404	2017-11-15 10:03:59.307404
8	Spree::Country	100	1	2017-11-15 10:03:59.335327	2017-11-15 10:03:59.335327
9	Spree::Country	199	1	2017-11-15 10:03:59.360251	2017-11-15 10:03:59.360251
10	Spree::Country	102	1	2017-11-15 10:03:59.383053	2017-11-15 10:03:59.383053
11	Spree::Country	12	1	2017-11-15 10:03:59.410742	2017-11-15 10:03:59.410742
12	Spree::Country	68	1	2017-11-15 10:03:59.433433	2017-11-15 10:03:59.433433
13	Spree::Country	110	1	2017-11-15 10:03:59.460972	2017-11-15 10:03:59.460972
14	Spree::Country	20	1	2017-11-15 10:03:59.484909	2017-11-15 10:03:59.484909
15	Spree::Country	196	1	2017-11-15 10:03:59.510749	2017-11-15 10:03:59.510749
16	Spree::Country	135	1	2017-11-15 10:03:59.534114	2017-11-15 10:03:59.534114
17	Spree::Country	22	1	2017-11-15 10:03:59.560542	2017-11-15 10:03:59.560542
18	Spree::Country	77	1	2017-11-15 10:03:59.583123	2017-11-15 10:03:59.583123
19	Spree::Country	133	1	2017-11-15 10:03:59.611039	2017-11-15 10:03:59.611039
20	Spree::Country	55	1	2017-11-15 10:03:59.634225	2017-11-15 10:03:59.634225
21	Spree::Country	134	1	2017-11-15 10:03:59.661372	2017-11-15 10:03:59.661372
22	Spree::Country	153	1	2017-11-15 10:03:59.683136	2017-11-15 10:03:59.683136
23	Spree::Country	59	1	2017-11-15 10:03:59.711059	2017-11-15 10:03:59.711059
24	Spree::Country	166	1	2017-11-15 10:03:59.733837	2017-11-15 10:03:59.733837
25	Spree::Country	64	1	2017-11-15 10:03:59.761592	2017-11-15 10:03:59.761592
26	Spree::Country	98	1	2017-11-15 10:03:59.782615	2017-11-15 10:03:59.782615
27	Spree::Country	56	1	2017-11-15 10:03:59.812485	2017-11-15 10:03:59.812485
28	Spree::Country	89	1	2017-11-15 10:03:59.833574	2017-11-15 10:03:59.833574
29	Spree::Country	232	2	2017-11-15 10:03:59.861946	2017-11-15 10:03:59.861946
30	Spree::Country	38	2	2017-11-15 10:03:59.882847	2017-11-15 10:03:59.882847
31	Spree::Country	105	3	2017-11-15 12:14:21.714983	2017-11-15 12:14:21.714983
32	Spree::Country	232	3	2017-11-15 12:14:21.718395	2017-11-15 12:14:21.718395
\.


--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_zone_members_id_seq', 32, true);


--
-- Data for Name: spree_zones; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY spree_zones (id, name, description, default_tax, zone_members_count, created_at, updated_at, kind) FROM stdin;
1	EU_VAT	Countries that make up the EU VAT zone.	f	28	2017-11-15 10:03:59.071213	2017-11-15 10:03:59.071213	country
2	North America	USA + Canada	f	2	2017-11-15 10:03:59.118852	2017-11-15 10:03:59.118852	country
3	India	India+USA	f	2	2017-11-15 12:14:21.713126	2017-11-15 12:14:21.713126	country
\.


--
-- Name: spree_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('spree_zones_id_seq', 3, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: connections_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY connections
    ADD CONSTRAINT connections_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: spree_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_addresses
    ADD CONSTRAINT spree_addresses_pkey PRIMARY KEY (id);


--
-- Name: spree_adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_adjustments
    ADD CONSTRAINT spree_adjustments_pkey PRIMARY KEY (id);


--
-- Name: spree_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_assets
    ADD CONSTRAINT spree_assets_pkey PRIMARY KEY (id);


--
-- Name: spree_braintree_checkouts_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_braintree_checkouts
    ADD CONSTRAINT spree_braintree_checkouts_pkey PRIMARY KEY (id);


--
-- Name: spree_calculators_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_calculators
    ADD CONSTRAINT spree_calculators_pkey PRIMARY KEY (id);


--
-- Name: spree_cart_events_pkey; Type: CONSTRAINT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_cart_events
    ADD CONSTRAINT spree_cart_events_pkey PRIMARY KEY (id);


--
-- Name: spree_checkout_events_pkey; Type: CONSTRAINT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_checkout_events
    ADD CONSTRAINT spree_checkout_events_pkey PRIMARY KEY (id);


--
-- Name: spree_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_countries
    ADD CONSTRAINT spree_countries_pkey PRIMARY KEY (id);


--
-- Name: spree_credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_credit_cards
    ADD CONSTRAINT spree_credit_cards_pkey PRIMARY KEY (id);


--
-- Name: spree_customer_returns_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_customer_returns
    ADD CONSTRAINT spree_customer_returns_pkey PRIMARY KEY (id);


--
-- Name: spree_delivery_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_delivery_slots
    ADD CONSTRAINT spree_delivery_slots_pkey PRIMARY KEY (id);


--
-- Name: spree_gateways_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_gateways
    ADD CONSTRAINT spree_gateways_pkey PRIMARY KEY (id);


--
-- Name: spree_inventory_units_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_inventory_units
    ADD CONSTRAINT spree_inventory_units_pkey PRIMARY KEY (id);


--
-- Name: spree_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_line_items
    ADD CONSTRAINT spree_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_log_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_log_entries
    ADD CONSTRAINT spree_log_entries_pkey PRIMARY KEY (id);


--
-- Name: spree_loyalty_points_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_loyalty_points_transactions
    ADD CONSTRAINT spree_loyalty_points_transactions_pkey PRIMARY KEY (id);


--
-- Name: spree_marketing_campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_marketing_campaigns
    ADD CONSTRAINT spree_marketing_campaigns_pkey PRIMARY KEY (id);


--
-- Name: spree_marketing_contacts_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_marketing_contacts_lists
    ADD CONSTRAINT spree_marketing_contacts_lists_pkey PRIMARY KEY (id);


--
-- Name: spree_marketing_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_marketing_contacts
    ADD CONSTRAINT spree_marketing_contacts_pkey PRIMARY KEY (id);


--
-- Name: spree_marketing_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_marketing_lists
    ADD CONSTRAINT spree_marketing_lists_pkey PRIMARY KEY (id);


--
-- Name: spree_marketing_recipients_pkey; Type: CONSTRAINT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_marketing_recipients
    ADD CONSTRAINT spree_marketing_recipients_pkey PRIMARY KEY (id);


--
-- Name: spree_option_type_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_option_type_prototypes
    ADD CONSTRAINT spree_option_type_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_option_types
    ADD CONSTRAINT spree_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_option_value_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_option_value_variants
    ADD CONSTRAINT spree_option_value_variants_pkey PRIMARY KEY (id);


--
-- Name: spree_option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_option_values
    ADD CONSTRAINT spree_option_values_pkey PRIMARY KEY (id);


--
-- Name: spree_order_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_order_promotions
    ADD CONSTRAINT spree_order_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_orders
    ADD CONSTRAINT spree_orders_pkey PRIMARY KEY (id);


--
-- Name: spree_page_events_pkey; Type: CONSTRAINT; Schema: public; Owner: e9comm
--

ALTER TABLE ONLY spree_page_events
    ADD CONSTRAINT spree_page_events_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_capture_events_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_payment_capture_events
    ADD CONSTRAINT spree_payment_capture_events_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_payment_methods
    ADD CONSTRAINT spree_payment_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_payments
    ADD CONSTRAINT spree_payments_pkey PRIMARY KEY (id);


--
-- Name: spree_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_permissions
    ADD CONSTRAINT spree_permissions_pkey PRIMARY KEY (id);


--
-- Name: spree_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_preferences
    ADD CONSTRAINT spree_preferences_pkey PRIMARY KEY (id);


--
-- Name: spree_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_prices
    ADD CONSTRAINT spree_prices_pkey PRIMARY KEY (id);


--
-- Name: spree_product_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_product_option_types
    ADD CONSTRAINT spree_product_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_product_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_product_packages
    ADD CONSTRAINT spree_product_packages_pkey PRIMARY KEY (id);


--
-- Name: spree_product_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_product_promotion_rules
    ADD CONSTRAINT spree_product_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_product_properties
    ADD CONSTRAINT spree_product_properties_pkey PRIMARY KEY (id);


--
-- Name: spree_products_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_products
    ADD CONSTRAINT spree_products_pkey PRIMARY KEY (id);


--
-- Name: spree_products_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_products_taxons
    ADD CONSTRAINT spree_products_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_action_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotion_action_line_items
    ADD CONSTRAINT spree_promotion_action_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotion_actions
    ADD CONSTRAINT spree_promotion_actions_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotion_categories
    ADD CONSTRAINT spree_promotion_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rule_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotion_rule_taxons
    ADD CONSTRAINT spree_promotion_rule_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rule_users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotion_rule_users
    ADD CONSTRAINT spree_promotion_rule_users_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotion_rules
    ADD CONSTRAINT spree_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_promotions
    ADD CONSTRAINT spree_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_properties
    ADD CONSTRAINT spree_properties_pkey PRIMARY KEY (id);


--
-- Name: spree_property_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_property_prototypes
    ADD CONSTRAINT spree_property_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_prototype_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_prototype_taxons
    ADD CONSTRAINT spree_prototype_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_prototypes
    ADD CONSTRAINT spree_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_refund_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_refund_reasons
    ADD CONSTRAINT spree_refund_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_refunds
    ADD CONSTRAINT spree_refunds_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_reimbursement_credits
    ADD CONSTRAINT spree_reimbursement_credits_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_reimbursement_types
    ADD CONSTRAINT spree_reimbursement_types_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursements_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_reimbursements
    ADD CONSTRAINT spree_reimbursements_pkey PRIMARY KEY (id);


--
-- Name: spree_return_authorization_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_return_authorization_reasons
    ADD CONSTRAINT spree_return_authorization_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_return_authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_return_authorizations
    ADD CONSTRAINT spree_return_authorizations_pkey PRIMARY KEY (id);


--
-- Name: spree_return_items_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_return_items
    ADD CONSTRAINT spree_return_items_pkey PRIMARY KEY (id);


--
-- Name: spree_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_roles
    ADD CONSTRAINT spree_roles_pkey PRIMARY KEY (id);


--
-- Name: spree_roles_users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_roles_users
    ADD CONSTRAINT spree_roles_users_pkey PRIMARY KEY (id);


--
-- Name: spree_shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_shipments
    ADD CONSTRAINT spree_shipments_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_shipping_categories
    ADD CONSTRAINT spree_shipping_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_shipping_method_categories
    ADD CONSTRAINT spree_shipping_method_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_shipping_method_zones
    ADD CONSTRAINT spree_shipping_method_zones_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_shipping_methods
    ADD CONSTRAINT spree_shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_shipping_rates
    ADD CONSTRAINT spree_shipping_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_state_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_state_changes
    ADD CONSTRAINT spree_state_changes_pkey PRIMARY KEY (id);


--
-- Name: spree_states_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_states
    ADD CONSTRAINT spree_states_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_items_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_stock_items
    ADD CONSTRAINT spree_stock_items_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_stock_locations
    ADD CONSTRAINT spree_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_stock_movements
    ADD CONSTRAINT spree_stock_movements_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_stock_transfers
    ADD CONSTRAINT spree_stock_transfers_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_store_credit_categories
    ADD CONSTRAINT spree_store_credit_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_events_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_store_credit_events
    ADD CONSTRAINT spree_store_credit_events_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_types_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_store_credit_types
    ADD CONSTRAINT spree_store_credit_types_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_store_credits
    ADD CONSTRAINT spree_store_credits_pkey PRIMARY KEY (id);


--
-- Name: spree_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_stores
    ADD CONSTRAINT spree_stores_pkey PRIMARY KEY (id);


--
-- Name: spree_taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_taggings
    ADD CONSTRAINT spree_taggings_pkey PRIMARY KEY (id);


--
-- Name: spree_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_tags
    ADD CONSTRAINT spree_tags_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_tax_categories
    ADD CONSTRAINT spree_tax_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_tax_rates
    ADD CONSTRAINT spree_tax_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_taxonomies
    ADD CONSTRAINT spree_taxonomies_pkey PRIMARY KEY (id);


--
-- Name: spree_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_taxons
    ADD CONSTRAINT spree_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_themes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_themes
    ADD CONSTRAINT spree_themes_pkey PRIMARY KEY (id);


--
-- Name: spree_themes_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_themes_templates
    ADD CONSTRAINT spree_themes_templates_pkey PRIMARY KEY (id);


--
-- Name: spree_trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_trackers
    ADD CONSTRAINT spree_trackers_pkey PRIMARY KEY (id);


--
-- Name: spree_users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_users
    ADD CONSTRAINT spree_users_pkey PRIMARY KEY (id);


--
-- Name: spree_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_variants
    ADD CONSTRAINT spree_variants_pkey PRIMARY KEY (id);


--
-- Name: spree_zone_members_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_zone_members
    ADD CONSTRAINT spree_zone_members_pkey PRIMARY KEY (id);


--
-- Name: spree_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY spree_zones
    ADD CONSTRAINT spree_zones_pkey PRIMARY KEY (id);


--
-- Name: by_source; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX by_source ON spree_loyalty_points_transactions USING btree (source_type, source_id);


--
-- Name: email_idx_unique; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX email_idx_unique ON spree_users USING btree (email);


--
-- Name: index_addresses_on_firstname; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_addresses_on_firstname ON spree_addresses USING btree (firstname);


--
-- Name: index_addresses_on_lastname; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_addresses_on_lastname ON spree_addresses USING btree (lastname);


--
-- Name: index_assets_on_viewable_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_assets_on_viewable_id ON spree_assets USING btree (viewable_id);


--
-- Name: index_assets_on_viewable_type_and_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_assets_on_viewable_type_and_type ON spree_assets USING btree (viewable_type, type);


--
-- Name: index_friendly_id_slugs_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_friendly_id_slugs_on_deleted_at ON friendly_id_slugs USING btree (deleted_at);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_inventory_units_on_order_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_inventory_units_on_order_id ON spree_inventory_units USING btree (order_id);


--
-- Name: index_inventory_units_on_shipment_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_inventory_units_on_shipment_id ON spree_inventory_units USING btree (shipment_id);


--
-- Name: index_inventory_units_on_variant_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_inventory_units_on_variant_id ON spree_inventory_units USING btree (variant_id);


--
-- Name: index_option_types_prototypes_on_prototype_and_option_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_option_types_prototypes_on_prototype_and_option_type ON spree_option_type_prototypes USING btree (prototype_id, option_type_id);


--
-- Name: index_option_values_variants_on_variant_id_and_option_value_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_option_values_variants_on_variant_id_and_option_value_id ON spree_option_value_variants USING btree (variant_id, option_value_id);


--
-- Name: index_product_properties_on_product_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_product_properties_on_product_id ON spree_product_properties USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_product_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_products_promotion_rules_on_product_id ON spree_product_promotion_rules USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_promotion_rule_and_product; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_products_promotion_rules_on_promotion_rule_and_product ON spree_product_promotion_rules USING btree (promotion_rule_id, product_id);


--
-- Name: index_promotion_rules_on_product_group_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_promotion_rules_on_product_group_id ON spree_promotion_rules USING btree (product_group_id);


--
-- Name: index_promotion_rules_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_promotion_rules_on_user_id ON spree_promotion_rules USING btree (user_id);


--
-- Name: index_promotion_rules_users_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_promotion_rules_users_on_promotion_rule_id ON spree_promotion_rule_users USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_users_on_user_id_and_promotion_rule_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_promotion_rules_users_on_user_id_and_promotion_rule_id ON spree_promotion_rule_users USING btree (user_id, promotion_rule_id);


--
-- Name: index_properties_prototypes_on_prototype_and_property; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_properties_prototypes_on_prototype_and_property ON spree_property_prototypes USING btree (prototype_id, property_id);


--
-- Name: index_refunds_on_refund_reason_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_refunds_on_refund_reason_id ON spree_refunds USING btree (refund_reason_id);


--
-- Name: index_return_authorizations_on_return_authorization_reason_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_return_authorizations_on_return_authorization_reason_id ON spree_return_authorizations USING btree (return_authorization_reason_id);


--
-- Name: index_return_items_on_customer_return_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_return_items_on_customer_return_id ON spree_return_items USING btree (customer_return_id);


--
-- Name: index_shipments_on_number; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_shipments_on_number ON spree_shipments USING btree (number);


--
-- Name: index_spree_addresses_on_country_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_addresses_on_country_id ON spree_addresses USING btree (country_id);


--
-- Name: index_spree_addresses_on_state_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_addresses_on_state_id ON spree_addresses USING btree (state_id);


--
-- Name: index_spree_adjustments_on_adjustable_id_and_adjustable_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_adjustments_on_adjustable_id_and_adjustable_type ON spree_adjustments USING btree (adjustable_id, adjustable_type);


--
-- Name: index_spree_adjustments_on_eligible; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_adjustments_on_eligible ON spree_adjustments USING btree (eligible);


--
-- Name: index_spree_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_adjustments_on_order_id ON spree_adjustments USING btree (order_id);


--
-- Name: index_spree_adjustments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_adjustments_on_source_id_and_source_type ON spree_adjustments USING btree (source_id, source_type);


--
-- Name: index_spree_assets_on_position; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_assets_on_position ON spree_assets USING btree ("position");


--
-- Name: index_spree_braintree_checkouts_on_state; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_braintree_checkouts_on_state ON spree_braintree_checkouts USING btree (state);


--
-- Name: index_spree_braintree_checkouts_on_transaction_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_braintree_checkouts_on_transaction_id ON spree_braintree_checkouts USING btree (transaction_id);


--
-- Name: index_spree_calculators_on_calculable_id_and_calculable_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_calculators_on_calculable_id_and_calculable_type ON spree_calculators USING btree (calculable_id, calculable_type);


--
-- Name: index_spree_calculators_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_calculators_on_deleted_at ON spree_calculators USING btree (deleted_at);


--
-- Name: index_spree_calculators_on_id_and_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_calculators_on_id_and_type ON spree_calculators USING btree (id, type);


--
-- Name: index_spree_cart_events_on_actor_type_and_actor_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_cart_events_on_actor_type_and_actor_id ON spree_cart_events USING btree (actor_type, actor_id);


--
-- Name: index_spree_cart_events_on_target_type_and_target_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_cart_events_on_target_type_and_target_id ON spree_cart_events USING btree (target_type, target_id);


--
-- Name: index_spree_cart_events_on_variant_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_cart_events_on_variant_id ON spree_cart_events USING btree (variant_id);


--
-- Name: index_spree_checkout_events_on_actor_type_and_actor_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_checkout_events_on_actor_type_and_actor_id ON spree_checkout_events USING btree (actor_type, actor_id);


--
-- Name: index_spree_checkout_events_on_target_type_and_target_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_checkout_events_on_target_type_and_target_id ON spree_checkout_events USING btree (target_type, target_id);


--
-- Name: index_spree_credit_cards_on_address_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_credit_cards_on_address_id ON spree_credit_cards USING btree (address_id);


--
-- Name: index_spree_credit_cards_on_payment_method_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_credit_cards_on_payment_method_id ON spree_credit_cards USING btree (payment_method_id);


--
-- Name: index_spree_credit_cards_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_credit_cards_on_user_id ON spree_credit_cards USING btree (user_id);


--
-- Name: index_spree_delivery_slots_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_delivery_slots_on_deleted_at ON spree_delivery_slots USING btree (deleted_at);


--
-- Name: index_spree_delivery_slots_on_shipping_method_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_delivery_slots_on_shipping_method_id ON spree_delivery_slots USING btree (shipping_method_id);


--
-- Name: index_spree_gateways_on_active; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_gateways_on_active ON spree_gateways USING btree (active);


--
-- Name: index_spree_gateways_on_test_mode; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_gateways_on_test_mode ON spree_gateways USING btree (test_mode);


--
-- Name: index_spree_inventory_units_on_line_item_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_inventory_units_on_line_item_id ON spree_inventory_units USING btree (line_item_id);


--
-- Name: index_spree_line_items_on_order_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_line_items_on_order_id ON spree_line_items USING btree (order_id);


--
-- Name: index_spree_line_items_on_tax_category_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_line_items_on_tax_category_id ON spree_line_items USING btree (tax_category_id);


--
-- Name: index_spree_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_line_items_on_variant_id ON spree_line_items USING btree (variant_id);


--
-- Name: index_spree_log_entries_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_log_entries_on_source_id_and_source_type ON spree_log_entries USING btree (source_id, source_type);


--
-- Name: index_spree_loyalty_points_transactions_on_type; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_loyalty_points_transactions_on_type ON spree_loyalty_points_transactions USING btree (type);


--
-- Name: index_spree_loyalty_points_transactions_on_user_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_loyalty_points_transactions_on_user_id ON spree_loyalty_points_transactions USING btree (user_id);


--
-- Name: index_spree_marketing_campaigns_on_list_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_marketing_campaigns_on_list_id ON spree_marketing_campaigns USING btree (list_id);


--
-- Name: index_spree_marketing_campaigns_on_mailchimp_type; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_marketing_campaigns_on_mailchimp_type ON spree_marketing_campaigns USING btree (mailchimp_type);


--
-- Name: index_spree_marketing_contacts_lists_on_active; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_marketing_contacts_lists_on_active ON spree_marketing_contacts_lists USING btree (active);


--
-- Name: index_spree_marketing_contacts_lists_on_contact_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_marketing_contacts_lists_on_contact_id ON spree_marketing_contacts_lists USING btree (contact_id);


--
-- Name: index_spree_marketing_contacts_lists_on_list_id_and_contact_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_marketing_contacts_lists_on_list_id_and_contact_id ON spree_marketing_contacts_lists USING btree (list_id, contact_id);


--
-- Name: index_spree_marketing_contacts_on_active_and_email; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_marketing_contacts_on_active_and_email ON spree_marketing_contacts USING btree (active, email);


--
-- Name: index_spree_marketing_contacts_on_email; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_marketing_contacts_on_email ON spree_marketing_contacts USING btree (email);


--
-- Name: index_spree_marketing_lists_on_active_and_name; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_marketing_lists_on_active_and_name ON spree_marketing_lists USING btree (active, name);


--
-- Name: index_spree_marketing_lists_on_name; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_marketing_lists_on_name ON spree_marketing_lists USING btree (name);


--
-- Name: index_spree_marketing_recipients_on_campaign_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_marketing_recipients_on_campaign_id ON spree_marketing_recipients USING btree (campaign_id);


--
-- Name: index_spree_marketing_recipients_on_contact_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_marketing_recipients_on_contact_id ON spree_marketing_recipients USING btree (contact_id);


--
-- Name: index_spree_option_type_prototypes_on_option_type_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_option_type_prototypes_on_option_type_id ON spree_option_type_prototypes USING btree (option_type_id);


--
-- Name: index_spree_option_types_on_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_option_types_on_name ON spree_option_types USING btree (name);


--
-- Name: index_spree_option_types_on_position; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_option_types_on_position ON spree_option_types USING btree ("position");


--
-- Name: index_spree_option_value_variants_on_option_value_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_option_value_variants_on_option_value_id ON spree_option_value_variants USING btree (option_value_id);


--
-- Name: index_spree_option_values_on_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_option_values_on_name ON spree_option_values USING btree (name);


--
-- Name: index_spree_option_values_on_option_type_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_option_values_on_option_type_id ON spree_option_values USING btree (option_type_id);


--
-- Name: index_spree_option_values_on_position; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_option_values_on_position ON spree_option_values USING btree ("position");


--
-- Name: index_spree_order_promotions_on_order_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_order_promotions_on_order_id ON spree_order_promotions USING btree (order_id);


--
-- Name: index_spree_order_promotions_on_promotion_id_and_order_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_order_promotions_on_promotion_id_and_order_id ON spree_order_promotions USING btree (promotion_id, order_id);


--
-- Name: index_spree_orders_on_approver_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_orders_on_approver_id ON spree_orders USING btree (approver_id);


--
-- Name: index_spree_orders_on_bill_address_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_orders_on_bill_address_id ON spree_orders USING btree (bill_address_id);


--
-- Name: index_spree_orders_on_canceler_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_orders_on_canceler_id ON spree_orders USING btree (canceler_id);


--
-- Name: index_spree_orders_on_completed_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_orders_on_completed_at ON spree_orders USING btree (completed_at);


--
-- Name: index_spree_orders_on_confirmation_delivered; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_orders_on_confirmation_delivered ON spree_orders USING btree (confirmation_delivered);


--
-- Name: index_spree_orders_on_considered_risky; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_orders_on_considered_risky ON spree_orders USING btree (considered_risky);


--
-- Name: index_spree_orders_on_created_by_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_orders_on_created_by_id ON spree_orders USING btree (created_by_id);


--
-- Name: index_spree_orders_on_guest_token; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_orders_on_guest_token ON spree_orders USING btree (guest_token);


--
-- Name: index_spree_orders_on_number; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_orders_on_number ON spree_orders USING btree (number);


--
-- Name: index_spree_orders_on_ship_address_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_orders_on_ship_address_id ON spree_orders USING btree (ship_address_id);


--
-- Name: index_spree_orders_on_store_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_orders_on_store_id ON spree_orders USING btree (store_id);


--
-- Name: index_spree_orders_on_user_id_and_created_by_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_orders_on_user_id_and_created_by_id ON spree_orders USING btree (user_id, created_by_id);


--
-- Name: index_spree_page_events_on_actor_type_and_actor_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_page_events_on_actor_type_and_actor_id ON spree_page_events USING btree (actor_type, actor_id);


--
-- Name: index_spree_page_events_on_target_type_and_target_id; Type: INDEX; Schema: public; Owner: e9comm
--

CREATE INDEX index_spree_page_events_on_target_type_and_target_id ON spree_page_events USING btree (target_type, target_id);


--
-- Name: index_spree_payment_capture_events_on_payment_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_payment_capture_events_on_payment_id ON spree_payment_capture_events USING btree (payment_id);


--
-- Name: index_spree_payment_methods_on_id_and_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_payment_methods_on_id_and_type ON spree_payment_methods USING btree (id, type);


--
-- Name: index_spree_payments_on_number; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_payments_on_number ON spree_payments USING btree (number);


--
-- Name: index_spree_payments_on_order_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_payments_on_order_id ON spree_payments USING btree (order_id);


--
-- Name: index_spree_payments_on_payment_method_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_payments_on_payment_method_id ON spree_payments USING btree (payment_method_id);


--
-- Name: index_spree_payments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_payments_on_source_id_and_source_type ON spree_payments USING btree (source_id, source_type);


--
-- Name: index_spree_permissions_on_visible; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_permissions_on_visible ON spree_permissions USING btree (visible);


--
-- Name: index_spree_preferences_on_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_spree_preferences_on_key ON spree_preferences USING btree (key);


--
-- Name: index_spree_prices_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_prices_on_deleted_at ON spree_prices USING btree (deleted_at);


--
-- Name: index_spree_prices_on_variant_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_prices_on_variant_id ON spree_prices USING btree (variant_id);


--
-- Name: index_spree_prices_on_variant_id_and_currency; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_prices_on_variant_id_and_currency ON spree_prices USING btree (variant_id, currency);


--
-- Name: index_spree_product_option_types_on_option_type_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_product_option_types_on_option_type_id ON spree_product_option_types USING btree (option_type_id);


--
-- Name: index_spree_product_option_types_on_position; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_product_option_types_on_position ON spree_product_option_types USING btree ("position");


--
-- Name: index_spree_product_option_types_on_product_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_product_option_types_on_product_id ON spree_product_option_types USING btree (product_id);


--
-- Name: index_spree_product_properties_on_position; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_product_properties_on_position ON spree_product_properties USING btree ("position");


--
-- Name: index_spree_product_properties_on_property_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_product_properties_on_property_id ON spree_product_properties USING btree (property_id);


--
-- Name: index_spree_products_on_available_on; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_products_on_available_on ON spree_products USING btree (available_on);


--
-- Name: index_spree_products_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_products_on_deleted_at ON spree_products USING btree (deleted_at);


--
-- Name: index_spree_products_on_discontinue_on; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_products_on_discontinue_on ON spree_products USING btree (discontinue_on);


--
-- Name: index_spree_products_on_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_products_on_name ON spree_products USING btree (name);


--
-- Name: index_spree_products_on_shipping_category_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_products_on_shipping_category_id ON spree_products USING btree (shipping_category_id);


--
-- Name: index_spree_products_on_slug; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_spree_products_on_slug ON spree_products USING btree (slug);


--
-- Name: index_spree_products_on_tax_category_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_products_on_tax_category_id ON spree_products USING btree (tax_category_id);


--
-- Name: index_spree_products_taxons_on_position; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_products_taxons_on_position ON spree_products_taxons USING btree ("position");


--
-- Name: index_spree_products_taxons_on_product_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_products_taxons_on_product_id ON spree_products_taxons USING btree (product_id);


--
-- Name: index_spree_products_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_products_taxons_on_taxon_id ON spree_products_taxons USING btree (taxon_id);


--
-- Name: index_spree_promotion_action_line_items_on_promotion_action_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotion_action_line_items_on_promotion_action_id ON spree_promotion_action_line_items USING btree (promotion_action_id);


--
-- Name: index_spree_promotion_action_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotion_action_line_items_on_variant_id ON spree_promotion_action_line_items USING btree (variant_id);


--
-- Name: index_spree_promotion_actions_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotion_actions_on_deleted_at ON spree_promotion_actions USING btree (deleted_at);


--
-- Name: index_spree_promotion_actions_on_id_and_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotion_actions_on_id_and_type ON spree_promotion_actions USING btree (id, type);


--
-- Name: index_spree_promotion_actions_on_promotion_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotion_actions_on_promotion_id ON spree_promotion_actions USING btree (promotion_id);


--
-- Name: index_spree_promotion_rule_taxons_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotion_rule_taxons_on_promotion_rule_id ON spree_promotion_rule_taxons USING btree (promotion_rule_id);


--
-- Name: index_spree_promotion_rule_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotion_rule_taxons_on_taxon_id ON spree_promotion_rule_taxons USING btree (taxon_id);


--
-- Name: index_spree_promotion_rules_on_promotion_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotion_rules_on_promotion_id ON spree_promotion_rules USING btree (promotion_id);


--
-- Name: index_spree_promotions_on_advertise; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotions_on_advertise ON spree_promotions USING btree (advertise);


--
-- Name: index_spree_promotions_on_code; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotions_on_code ON spree_promotions USING btree (code);


--
-- Name: index_spree_promotions_on_expires_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotions_on_expires_at ON spree_promotions USING btree (expires_at);


--
-- Name: index_spree_promotions_on_id_and_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotions_on_id_and_type ON spree_promotions USING btree (id, type);


--
-- Name: index_spree_promotions_on_promotion_category_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotions_on_promotion_category_id ON spree_promotions USING btree (promotion_category_id);


--
-- Name: index_spree_promotions_on_starts_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_promotions_on_starts_at ON spree_promotions USING btree (starts_at);


--
-- Name: index_spree_properties_on_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_properties_on_name ON spree_properties USING btree (name);


--
-- Name: index_spree_prototype_taxons_on_prototype_id_and_taxon_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_prototype_taxons_on_prototype_id_and_taxon_id ON spree_prototype_taxons USING btree (prototype_id, taxon_id);


--
-- Name: index_spree_prototype_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_prototype_taxons_on_taxon_id ON spree_prototype_taxons USING btree (taxon_id);


--
-- Name: index_spree_reimbursement_types_on_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_reimbursement_types_on_type ON spree_reimbursement_types USING btree (type);


--
-- Name: index_spree_reimbursements_on_customer_return_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_reimbursements_on_customer_return_id ON spree_reimbursements USING btree (customer_return_id);


--
-- Name: index_spree_reimbursements_on_order_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_reimbursements_on_order_id ON spree_reimbursements USING btree (order_id);


--
-- Name: index_spree_return_items_on_exchange_inventory_unit_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_return_items_on_exchange_inventory_unit_id ON spree_return_items USING btree (exchange_inventory_unit_id);


--
-- Name: index_spree_roles_on_editable; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_roles_on_editable ON spree_roles USING btree (editable);


--
-- Name: index_spree_roles_on_is_default; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_roles_on_is_default ON spree_roles USING btree (is_default);


--
-- Name: index_spree_roles_on_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_roles_on_name ON spree_roles USING btree (name);


--
-- Name: index_spree_roles_permissions_on_permission_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_roles_permissions_on_permission_id ON spree_roles_permissions USING btree (permission_id);


--
-- Name: index_spree_roles_permissions_on_role_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_roles_permissions_on_role_id ON spree_roles_permissions USING btree (role_id);


--
-- Name: index_spree_roles_users_on_role_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_roles_users_on_role_id ON spree_roles_users USING btree (role_id);


--
-- Name: index_spree_roles_users_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_roles_users_on_user_id ON spree_roles_users USING btree (user_id);


--
-- Name: index_spree_shipments_on_address_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_shipments_on_address_id ON spree_shipments USING btree (address_id);


--
-- Name: index_spree_shipments_on_delivery_slot_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_shipments_on_delivery_slot_id ON spree_shipments USING btree (delivery_slot_id);


--
-- Name: index_spree_shipments_on_order_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_shipments_on_order_id ON spree_shipments USING btree (order_id);


--
-- Name: index_spree_shipments_on_stock_location_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_shipments_on_stock_location_id ON spree_shipments USING btree (stock_location_id);


--
-- Name: index_spree_shipping_categories_on_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_shipping_categories_on_name ON spree_shipping_categories USING btree (name);


--
-- Name: index_spree_shipping_method_categories_on_shipping_method_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_shipping_method_categories_on_shipping_method_id ON spree_shipping_method_categories USING btree (shipping_method_id);


--
-- Name: index_spree_shipping_methods_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_shipping_methods_on_deleted_at ON spree_shipping_methods USING btree (deleted_at);


--
-- Name: index_spree_shipping_methods_on_tax_category_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_shipping_methods_on_tax_category_id ON spree_shipping_methods USING btree (tax_category_id);


--
-- Name: index_spree_shipping_rates_on_selected; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_shipping_rates_on_selected ON spree_shipping_rates USING btree (selected);


--
-- Name: index_spree_shipping_rates_on_tax_rate_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_shipping_rates_on_tax_rate_id ON spree_shipping_rates USING btree (tax_rate_id);


--
-- Name: index_spree_state_changes_on_stateful_id_and_stateful_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_state_changes_on_stateful_id_and_stateful_type ON spree_state_changes USING btree (stateful_id, stateful_type);


--
-- Name: index_spree_states_on_country_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_states_on_country_id ON spree_states USING btree (country_id);


--
-- Name: index_spree_stock_items_on_backorderable; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stock_items_on_backorderable ON spree_stock_items USING btree (backorderable);


--
-- Name: index_spree_stock_items_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stock_items_on_deleted_at ON spree_stock_items USING btree (deleted_at);


--
-- Name: index_spree_stock_items_on_variant_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stock_items_on_variant_id ON spree_stock_items USING btree (variant_id);


--
-- Name: index_spree_stock_locations_on_active; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stock_locations_on_active ON spree_stock_locations USING btree (active);


--
-- Name: index_spree_stock_locations_on_backorderable_default; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stock_locations_on_backorderable_default ON spree_stock_locations USING btree (backorderable_default);


--
-- Name: index_spree_stock_locations_on_country_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stock_locations_on_country_id ON spree_stock_locations USING btree (country_id);


--
-- Name: index_spree_stock_locations_on_propagate_all_variants; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stock_locations_on_propagate_all_variants ON spree_stock_locations USING btree (propagate_all_variants);


--
-- Name: index_spree_stock_locations_on_state_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stock_locations_on_state_id ON spree_stock_locations USING btree (state_id);


--
-- Name: index_spree_stock_movements_on_stock_item_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stock_movements_on_stock_item_id ON spree_stock_movements USING btree (stock_item_id);


--
-- Name: index_spree_stock_transfers_on_destination_location_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stock_transfers_on_destination_location_id ON spree_stock_transfers USING btree (destination_location_id);


--
-- Name: index_spree_stock_transfers_on_number; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stock_transfers_on_number ON spree_stock_transfers USING btree (number);


--
-- Name: index_spree_stock_transfers_on_source_location_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stock_transfers_on_source_location_id ON spree_stock_transfers USING btree (source_location_id);


--
-- Name: index_spree_store_credit_events_on_store_credit_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_store_credit_events_on_store_credit_id ON spree_store_credit_events USING btree (store_credit_id);


--
-- Name: index_spree_store_credit_types_on_priority; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_store_credit_types_on_priority ON spree_store_credit_types USING btree (priority);


--
-- Name: index_spree_store_credits_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_store_credits_on_deleted_at ON spree_store_credits USING btree (deleted_at);


--
-- Name: index_spree_store_credits_on_type_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_store_credits_on_type_id ON spree_store_credits USING btree (type_id);


--
-- Name: index_spree_store_credits_on_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_store_credits_on_user_id ON spree_store_credits USING btree (user_id);


--
-- Name: index_spree_stores_on_code; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stores_on_code ON spree_stores USING btree (code);


--
-- Name: index_spree_stores_on_default; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stores_on_default ON spree_stores USING btree ("default");


--
-- Name: index_spree_stores_on_url; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_stores_on_url ON spree_stores USING btree (url);


--
-- Name: index_spree_taggings_on_context; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_taggings_on_context ON spree_taggings USING btree (context);


--
-- Name: index_spree_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_taggings_on_tag_id ON spree_taggings USING btree (tag_id);


--
-- Name: index_spree_taggings_on_taggable_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_taggings_on_taggable_id ON spree_taggings USING btree (taggable_id);


--
-- Name: index_spree_taggings_on_taggable_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_taggings_on_taggable_type ON spree_taggings USING btree (taggable_type);


--
-- Name: index_spree_taggings_on_tagger_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_taggings_on_tagger_id ON spree_taggings USING btree (tagger_id);


--
-- Name: index_spree_taggings_on_tagger_id_and_tagger_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_taggings_on_tagger_id_and_tagger_type ON spree_taggings USING btree (tagger_id, tagger_type);


--
-- Name: index_spree_tags_on_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX index_spree_tags_on_name ON spree_tags USING btree (name);


--
-- Name: index_spree_tax_categories_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_tax_categories_on_deleted_at ON spree_tax_categories USING btree (deleted_at);


--
-- Name: index_spree_tax_categories_on_is_default; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_tax_categories_on_is_default ON spree_tax_categories USING btree (is_default);


--
-- Name: index_spree_tax_rates_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_tax_rates_on_deleted_at ON spree_tax_rates USING btree (deleted_at);


--
-- Name: index_spree_tax_rates_on_included_in_price; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_tax_rates_on_included_in_price ON spree_tax_rates USING btree (included_in_price);


--
-- Name: index_spree_tax_rates_on_show_rate_in_label; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_tax_rates_on_show_rate_in_label ON spree_tax_rates USING btree (show_rate_in_label);


--
-- Name: index_spree_tax_rates_on_tax_category_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_tax_rates_on_tax_category_id ON spree_tax_rates USING btree (tax_category_id);


--
-- Name: index_spree_tax_rates_on_zone_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_tax_rates_on_zone_id ON spree_tax_rates USING btree (zone_id);


--
-- Name: index_spree_taxonomies_on_position; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_taxonomies_on_position ON spree_taxonomies USING btree ("position");


--
-- Name: index_spree_taxons_on_lft; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_taxons_on_lft ON spree_taxons USING btree (lft);


--
-- Name: index_spree_taxons_on_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_taxons_on_name ON spree_taxons USING btree (name);


--
-- Name: index_spree_taxons_on_position; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_taxons_on_position ON spree_taxons USING btree ("position");


--
-- Name: index_spree_taxons_on_rgt; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_taxons_on_rgt ON spree_taxons USING btree (rgt);


--
-- Name: index_spree_themes_templates_on_theme_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_themes_templates_on_theme_id ON spree_themes_templates USING btree (theme_id);


--
-- Name: index_spree_trackers_on_active; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_trackers_on_active ON spree_trackers USING btree (active);


--
-- Name: index_spree_users_on_bill_address_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_users_on_bill_address_id ON spree_users USING btree (bill_address_id);


--
-- Name: index_spree_users_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_users_on_deleted_at ON spree_users USING btree (deleted_at);


--
-- Name: index_spree_users_on_ship_address_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_users_on_ship_address_id ON spree_users USING btree (ship_address_id);


--
-- Name: index_spree_users_on_spree_api_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_users_on_spree_api_key ON spree_users USING btree (spree_api_key);


--
-- Name: index_spree_variants_on_deleted_at; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_variants_on_deleted_at ON spree_variants USING btree (deleted_at);


--
-- Name: index_spree_variants_on_discontinue_on; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_variants_on_discontinue_on ON spree_variants USING btree (discontinue_on);


--
-- Name: index_spree_variants_on_is_master; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_variants_on_is_master ON spree_variants USING btree (is_master);


--
-- Name: index_spree_variants_on_position; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_variants_on_position ON spree_variants USING btree ("position");


--
-- Name: index_spree_variants_on_product_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_variants_on_product_id ON spree_variants USING btree (product_id);


--
-- Name: index_spree_variants_on_sku; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_variants_on_sku ON spree_variants USING btree (sku);


--
-- Name: index_spree_variants_on_tax_category_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_variants_on_tax_category_id ON spree_variants USING btree (tax_category_id);


--
-- Name: index_spree_variants_on_track_inventory; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_variants_on_track_inventory ON spree_variants USING btree (track_inventory);


--
-- Name: index_spree_zone_members_on_zone_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_zone_members_on_zone_id ON spree_zone_members USING btree (zone_id);


--
-- Name: index_spree_zone_members_on_zoneable_id_and_zoneable_type; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_zone_members_on_zoneable_id_and_zoneable_type ON spree_zone_members USING btree (zoneable_id, zoneable_type);


--
-- Name: index_spree_zones_on_default_tax; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_zones_on_default_tax ON spree_zones USING btree (default_tax);


--
-- Name: index_spree_zones_on_kind; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_spree_zones_on_kind ON spree_zones USING btree (kind);


--
-- Name: index_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_taxons_on_parent_id ON spree_taxons USING btree (parent_id);


--
-- Name: index_taxons_on_permalink; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_taxons_on_permalink ON spree_taxons USING btree (permalink);


--
-- Name: index_taxons_on_taxonomy_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX index_taxons_on_taxonomy_id ON spree_taxons USING btree (taxonomy_id);


--
-- Name: spree_shipping_rates_join_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX spree_shipping_rates_join_index ON spree_shipping_rates USING btree (shipment_id, shipping_method_id);


--
-- Name: spree_store_credit_events_originator; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX spree_store_credit_events_originator ON spree_store_credit_events USING btree (originator_id, originator_type);


--
-- Name: spree_store_credits_originator; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX spree_store_credits_originator ON spree_store_credits USING btree (originator_id, originator_type);


--
-- Name: spree_taggings_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX spree_taggings_idx ON spree_taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: spree_taggings_idy; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX spree_taggings_idy ON spree_taggings USING btree (taggable_id, taggable_type, tagger_id, context);


--
-- Name: stock_item_by_loc_and_var_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX stock_item_by_loc_and_var_id ON spree_stock_items USING btree (stock_location_id, variant_id);


--
-- Name: unique_spree_shipping_method_categories; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX unique_spree_shipping_method_categories ON spree_shipping_method_categories USING btree (shipping_category_id, shipping_method_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

