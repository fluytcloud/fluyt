--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE root;
ALTER ROLE root WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:KTFnjAxXVmrD7HGw82dSEg==$nHTnwj7BwbNGr5wfGl4LXT6x4GLb1blbSQ9a+QtYKDU=:ZNt2+wAlcffbyxc29GaJA6IZhJASW+prw+pF3uEdUCU=';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

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
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dumpfil
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

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
-- PostgreSQL database dump complete
--

--
-- Database "keycloak" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

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
-- Name: keycloak; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE keycloak OWNER TO root;

\connect keycloak

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
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.admin_event_entity (
                                           id character varying(36) NOT NULL,
                                           admin_event_time bigint,
                                           realm_id character varying(255),
                                           operation_type character varying(255),
                                           auth_realm_id character varying(255),
                                           auth_client_id character varying(255),
                                           auth_user_id character varying(255),
                                           ip_address character varying(255),
                                           resource_path character varying(2550),
                                           representation text,
                                           error character varying(255),
                                           resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO root;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.associated_policy (
                                          policy_id character varying(36) NOT NULL,
                                          associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO root;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authentication_execution (
                                                 id character varying(36) NOT NULL,
                                                 alias character varying(255),
                                                 authenticator character varying(36),
                                                 realm_id character varying(36),
                                                 flow_id character varying(36),
                                                 requirement integer,
                                                 priority integer,
                                                 authenticator_flow boolean DEFAULT false NOT NULL,
                                                 auth_flow_id character varying(36),
                                                 auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO root;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authentication_flow (
                                            id character varying(36) NOT NULL,
                                            alias character varying(255),
                                            description character varying(255),
                                            realm_id character varying(36),
                                            provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
                                            top_level boolean DEFAULT false NOT NULL,
                                            built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO root;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authenticator_config (
                                             id character varying(36) NOT NULL,
                                             alias character varying(255),
                                             realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO root;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authenticator_config_entry (
                                                   authenticator_id character varying(36) NOT NULL,
                                                   value text,
                                                   name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO root;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.broker_link (
                                    identity_provider character varying(255) NOT NULL,
                                    storage_provider_id character varying(255),
                                    realm_id character varying(36) NOT NULL,
                                    broker_user_id character varying(255),
                                    broker_username character varying(255),
                                    token text,
                                    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO root;

--
-- Name: client; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client (
                               id character varying(36) NOT NULL,
                               enabled boolean DEFAULT false NOT NULL,
                               full_scope_allowed boolean DEFAULT false NOT NULL,
                               client_id character varying(255),
                               not_before integer,
                               public_client boolean DEFAULT false NOT NULL,
                               secret character varying(255),
                               base_url character varying(255),
                               bearer_only boolean DEFAULT false NOT NULL,
                               management_url character varying(255),
                               surrogate_auth_required boolean DEFAULT false NOT NULL,
                               realm_id character varying(36),
                               protocol character varying(255),
                               node_rereg_timeout integer DEFAULT 0,
                               frontchannel_logout boolean DEFAULT false NOT NULL,
                               consent_required boolean DEFAULT false NOT NULL,
                               name character varying(255),
                               service_accounts_enabled boolean DEFAULT false NOT NULL,
                               client_authenticator_type character varying(255),
                               root_url character varying(255),
                               description character varying(255),
                               registration_token character varying(255),
                               standard_flow_enabled boolean DEFAULT true NOT NULL,
                               implicit_flow_enabled boolean DEFAULT false NOT NULL,
                               direct_access_grants_enabled boolean DEFAULT false NOT NULL,
                               always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO root;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_attributes (
                                          client_id character varying(36) NOT NULL,
                                          value character varying(4000),
                                          name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO root;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_auth_flow_bindings (
                                                  client_id character varying(36) NOT NULL,
                                                  flow_id character varying(36),
                                                  binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO root;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_initial_access (
                                              id character varying(36) NOT NULL,
                                              realm_id character varying(36) NOT NULL,
                                              "timestamp" integer,
                                              expiration integer,
                                              count integer,
                                              remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO root;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_node_registrations (
                                                  client_id character varying(36) NOT NULL,
                                                  value integer,
                                                  name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO root;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_scope (
                                     id character varying(36) NOT NULL,
                                     name character varying(255),
                                     realm_id character varying(36),
                                     description character varying(255),
                                     protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO root;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_scope_attributes (
                                                scope_id character varying(36) NOT NULL,
                                                value character varying(2048),
                                                name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO root;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_scope_client (
                                            client_id character varying(255) NOT NULL,
                                            scope_id character varying(255) NOT NULL,
                                            default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO root;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_scope_role_mapping (
                                                  scope_id character varying(36) NOT NULL,
                                                  role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO root;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_session (
                                       id character varying(36) NOT NULL,
                                       client_id character varying(36),
                                       redirect_uri character varying(255),
                                       state character varying(255),
                                       "timestamp" integer,
                                       session_id character varying(36),
                                       auth_method character varying(255),
                                       realm_id character varying(255),
                                       auth_user_id character varying(36),
                                       current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO root;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_session_auth_status (
                                                   authenticator character varying(36) NOT NULL,
                                                   status integer,
                                                   client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO root;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_session_note (
                                            name character varying(255) NOT NULL,
                                            value character varying(255),
                                            client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO root;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_session_prot_mapper (
                                                   protocol_mapper_id character varying(36) NOT NULL,
                                                   client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO root;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_session_role (
                                            role_id character varying(255) NOT NULL,
                                            client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO root;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_user_session_note (
                                                 name character varying(255) NOT NULL,
                                                 value character varying(2048),
                                                 client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO root;

--
-- Name: component; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.component (
                                  id character varying(36) NOT NULL,
                                  name character varying(255),
                                  parent_id character varying(36),
                                  provider_id character varying(36),
                                  provider_type character varying(255),
                                  realm_id character varying(36),
                                  sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO root;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.component_config (
                                         id character varying(36) NOT NULL,
                                         component_id character varying(36) NOT NULL,
                                         name character varying(255) NOT NULL,
                                         value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO root;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.composite_role (
                                       composite character varying(36) NOT NULL,
                                       child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO root;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.credential (
                                   id character varying(36) NOT NULL,
                                   salt bytea,
                                   type character varying(255),
                                   user_id character varying(36),
                                   created_date bigint,
                                   user_label character varying(255),
                                   secret_data text,
                                   credential_data text,
                                   priority integer
);


ALTER TABLE public.credential OWNER TO root;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.databasechangelog (
                                          id character varying(255) NOT NULL,
                                          author character varying(255) NOT NULL,
                                          filename character varying(255) NOT NULL,
                                          dateexecuted timestamp without time zone NOT NULL,
                                          orderexecuted integer NOT NULL,
                                          exectype character varying(10) NOT NULL,
                                          md5sum character varying(35),
                                          description character varying(255),
                                          comments character varying(255),
                                          tag character varying(255),
                                          liquibase character varying(20),
                                          contexts character varying(255),
                                          labels character varying(255),
                                          deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO root;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.databasechangeloglock (
                                              id integer NOT NULL,
                                              locked boolean NOT NULL,
                                              lockgranted timestamp without time zone,
                                              lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO root;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.default_client_scope (
                                             realm_id character varying(36) NOT NULL,
                                             scope_id character varying(36) NOT NULL,
                                             default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO root;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.event_entity (
                                     id character varying(36) NOT NULL,
                                     client_id character varying(255),
                                     details_json character varying(2550),
                                     error character varying(255),
                                     ip_address character varying(255),
                                     realm_id character varying(255),
                                     session_id character varying(255),
                                     event_time bigint,
                                     type character varying(255),
                                     user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO root;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_attribute (
                                           id character varying(36) NOT NULL,
                                           name character varying(255) NOT NULL,
                                           user_id character varying(255) NOT NULL,
                                           realm_id character varying(36) NOT NULL,
                                           storage_provider_id character varying(36),
                                           value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO root;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_consent (
                                         id character varying(36) NOT NULL,
                                         client_id character varying(255),
                                         user_id character varying(255) NOT NULL,
                                         realm_id character varying(36) NOT NULL,
                                         storage_provider_id character varying(36),
                                         created_date bigint,
                                         last_updated_date bigint,
                                         client_storage_provider character varying(36),
                                         external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO root;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_consent_cl_scope (
                                                  user_consent_id character varying(36) NOT NULL,
                                                  scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO root;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_credential (
                                            id character varying(36) NOT NULL,
                                            salt bytea,
                                            type character varying(255),
                                            created_date bigint,
                                            user_id character varying(255) NOT NULL,
                                            realm_id character varying(36) NOT NULL,
                                            storage_provider_id character varying(36),
                                            user_label character varying(255),
                                            secret_data text,
                                            credential_data text,
                                            priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO root;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_group_membership (
                                                  group_id character varying(36) NOT NULL,
                                                  user_id character varying(255) NOT NULL,
                                                  realm_id character varying(36) NOT NULL,
                                                  storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO root;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_required_action (
                                                 required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
                                                 user_id character varying(255) NOT NULL,
                                                 realm_id character varying(36) NOT NULL,
                                                 storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO root;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_role_mapping (
                                              role_id character varying(36) NOT NULL,
                                              user_id character varying(255) NOT NULL,
                                              realm_id character varying(36) NOT NULL,
                                              storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO root;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.federated_identity (
                                           identity_provider character varying(255) NOT NULL,
                                           realm_id character varying(36),
                                           federated_user_id character varying(255),
                                           federated_username character varying(255),
                                           token text,
                                           user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO root;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.federated_user (
                                       id character varying(255) NOT NULL,
                                       storage_provider_id character varying(255),
                                       realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO root;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.group_attribute (
                                        id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
                                        name character varying(255) NOT NULL,
                                        value character varying(255),
                                        group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO root;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.group_role_mapping (
                                           role_id character varying(36) NOT NULL,
                                           group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO root;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.identity_provider (
                                          internal_id character varying(36) NOT NULL,
                                          enabled boolean DEFAULT false NOT NULL,
                                          provider_alias character varying(255),
                                          provider_id character varying(255),
                                          store_token boolean DEFAULT false NOT NULL,
                                          authenticate_by_default boolean DEFAULT false NOT NULL,
                                          realm_id character varying(36),
                                          add_token_role boolean DEFAULT true NOT NULL,
                                          trust_email boolean DEFAULT false NOT NULL,
                                          first_broker_login_flow_id character varying(36),
                                          post_broker_login_flow_id character varying(36),
                                          provider_display_name character varying(255),
                                          link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO root;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.identity_provider_config (
                                                 identity_provider_id character varying(36) NOT NULL,
                                                 value text,
                                                 name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO root;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.identity_provider_mapper (
                                                 id character varying(36) NOT NULL,
                                                 name character varying(255) NOT NULL,
                                                 idp_alias character varying(255) NOT NULL,
                                                 idp_mapper_name character varying(255) NOT NULL,
                                                 realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO root;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.idp_mapper_config (
                                          idp_mapper_id character varying(36) NOT NULL,
                                          value text,
                                          name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO root;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.keycloak_group (
                                       id character varying(36) NOT NULL,
                                       name character varying(255),
                                       parent_group character varying(36) NOT NULL,
                                       realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO root;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.keycloak_role (
                                      id character varying(36) NOT NULL,
                                      client_realm_constraint character varying(255),
                                      client_role boolean DEFAULT false NOT NULL,
                                      description character varying(255),
                                      name character varying(255),
                                      realm_id character varying(255),
                                      client character varying(36),
                                      realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO root;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migration_model (
                                        id character varying(36) NOT NULL,
                                        version character varying(36),
                                        update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO root;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.offline_client_session (
                                               user_session_id character varying(36) NOT NULL,
                                               client_id character varying(255) NOT NULL,
                                               offline_flag character varying(4) NOT NULL,
                                               "timestamp" integer,
                                               data text,
                                               client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
                                               external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO root;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.offline_user_session (
                                             user_session_id character varying(36) NOT NULL,
                                             user_id character varying(255) NOT NULL,
                                             realm_id character varying(36) NOT NULL,
                                             created_on integer NOT NULL,
                                             offline_flag character varying(4) NOT NULL,
                                             data text,
                                             last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO root;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.policy_config (
                                      policy_id character varying(36) NOT NULL,
                                      name character varying(255) NOT NULL,
                                      value text
);


ALTER TABLE public.policy_config OWNER TO root;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.protocol_mapper (
                                        id character varying(36) NOT NULL,
                                        name character varying(255) NOT NULL,
                                        protocol character varying(255) NOT NULL,
                                        protocol_mapper_name character varying(255) NOT NULL,
                                        client_id character varying(36),
                                        client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO root;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.protocol_mapper_config (
                                               protocol_mapper_id character varying(36) NOT NULL,
                                               value text,
                                               name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO root;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm (
                              id character varying(36) NOT NULL,
                              access_code_lifespan integer,
                              user_action_lifespan integer,
                              access_token_lifespan integer,
                              account_theme character varying(255),
                              admin_theme character varying(255),
                              email_theme character varying(255),
                              enabled boolean DEFAULT false NOT NULL,
                              events_enabled boolean DEFAULT false NOT NULL,
                              events_expiration bigint,
                              login_theme character varying(255),
                              name character varying(255),
                              not_before integer,
                              password_policy character varying(2550),
                              registration_allowed boolean DEFAULT false NOT NULL,
                              remember_me boolean DEFAULT false NOT NULL,
                              reset_password_allowed boolean DEFAULT false NOT NULL,
                              social boolean DEFAULT false NOT NULL,
                              ssl_required character varying(255),
                              sso_idle_timeout integer,
                              sso_max_lifespan integer,
                              update_profile_on_soc_login boolean DEFAULT false NOT NULL,
                              verify_email boolean DEFAULT false NOT NULL,
                              master_admin_client character varying(36),
                              login_lifespan integer,
                              internationalization_enabled boolean DEFAULT false NOT NULL,
                              default_locale character varying(255),
                              reg_email_as_username boolean DEFAULT false NOT NULL,
                              admin_events_enabled boolean DEFAULT false NOT NULL,
                              admin_events_details_enabled boolean DEFAULT false NOT NULL,
                              edit_username_allowed boolean DEFAULT false NOT NULL,
                              otp_policy_counter integer DEFAULT 0,
                              otp_policy_window integer DEFAULT 1,
                              otp_policy_period integer DEFAULT 30,
                              otp_policy_digits integer DEFAULT 6,
                              otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
                              otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
                              browser_flow character varying(36),
                              registration_flow character varying(36),
                              direct_grant_flow character varying(36),
                              reset_credentials_flow character varying(36),
                              client_auth_flow character varying(36),
                              offline_session_idle_timeout integer DEFAULT 0,
                              revoke_refresh_token boolean DEFAULT false NOT NULL,
                              access_token_life_implicit integer DEFAULT 0,
                              login_with_email_allowed boolean DEFAULT true NOT NULL,
                              duplicate_emails_allowed boolean DEFAULT false NOT NULL,
                              docker_auth_flow character varying(36),
                              refresh_token_max_reuse integer DEFAULT 0,
                              allow_user_managed_access boolean DEFAULT false NOT NULL,
                              sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
                              sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
                              default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO root;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_attribute (
                                        name character varying(255) NOT NULL,
                                        realm_id character varying(36) NOT NULL,
                                        value text
);


ALTER TABLE public.realm_attribute OWNER TO root;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_default_groups (
                                             realm_id character varying(36) NOT NULL,
                                             group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO root;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_enabled_event_types (
                                                  realm_id character varying(36) NOT NULL,
                                                  value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO root;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_events_listeners (
                                               realm_id character varying(36) NOT NULL,
                                               value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO root;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_localizations (
                                            realm_id character varying(255) NOT NULL,
                                            locale character varying(255) NOT NULL,
                                            texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO root;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_required_credential (
                                                  type character varying(255) NOT NULL,
                                                  form_label character varying(255),
                                                  input boolean DEFAULT false NOT NULL,
                                                  secret boolean DEFAULT false NOT NULL,
                                                  realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO root;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_smtp_config (
                                          realm_id character varying(36) NOT NULL,
                                          value character varying(255),
                                          name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO root;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_supported_locales (
                                                realm_id character varying(36) NOT NULL,
                                                value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO root;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.redirect_uris (
                                      client_id character varying(36) NOT NULL,
                                      value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO root;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.required_action_config (
                                               required_action_id character varying(36) NOT NULL,
                                               value text,
                                               name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO root;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.required_action_provider (
                                                 id character varying(36) NOT NULL,
                                                 alias character varying(255),
                                                 name character varying(255),
                                                 realm_id character varying(36),
                                                 enabled boolean DEFAULT false NOT NULL,
                                                 default_action boolean DEFAULT false NOT NULL,
                                                 provider_id character varying(255),
                                                 priority integer
);


ALTER TABLE public.required_action_provider OWNER TO root;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_attribute (
                                           id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
                                           name character varying(255) NOT NULL,
                                           value character varying(255),
                                           resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO root;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_policy (
                                        resource_id character varying(36) NOT NULL,
                                        policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO root;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_scope (
                                       resource_id character varying(36) NOT NULL,
                                       scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO root;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_server (
                                        id character varying(36) NOT NULL,
                                        allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
                                        policy_enforce_mode character varying(15) NOT NULL,
                                        decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO root;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_server_perm_ticket (
                                                    id character varying(36) NOT NULL,
                                                    owner character varying(255) NOT NULL,
                                                    requester character varying(255) NOT NULL,
                                                    created_timestamp bigint NOT NULL,
                                                    granted_timestamp bigint,
                                                    resource_id character varying(36) NOT NULL,
                                                    scope_id character varying(36),
                                                    resource_server_id character varying(36) NOT NULL,
                                                    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO root;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_server_policy (
                                               id character varying(36) NOT NULL,
                                               name character varying(255) NOT NULL,
                                               description character varying(255),
                                               type character varying(255) NOT NULL,
                                               decision_strategy character varying(20),
                                               logic character varying(20),
                                               resource_server_id character varying(36) NOT NULL,
                                               owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO root;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_server_resource (
                                                 id character varying(36) NOT NULL,
                                                 name character varying(255) NOT NULL,
                                                 type character varying(255),
                                                 icon_uri character varying(255),
                                                 owner character varying(255) NOT NULL,
                                                 resource_server_id character varying(36) NOT NULL,
                                                 owner_managed_access boolean DEFAULT false NOT NULL,
                                                 display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO root;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_server_scope (
                                              id character varying(36) NOT NULL,
                                              name character varying(255) NOT NULL,
                                              icon_uri character varying(255),
                                              resource_server_id character varying(36) NOT NULL,
                                              display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO root;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_uris (
                                      resource_id character varying(36) NOT NULL,
                                      value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO root;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.role_attribute (
                                       id character varying(36) NOT NULL,
                                       role_id character varying(36) NOT NULL,
                                       name character varying(255) NOT NULL,
                                       value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO root;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.scope_mapping (
                                      client_id character varying(36) NOT NULL,
                                      role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO root;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.scope_policy (
                                     scope_id character varying(36) NOT NULL,
                                     policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO root;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_attribute (
                                       name character varying(255) NOT NULL,
                                       value character varying(255),
                                       user_id character varying(36) NOT NULL,
                                       id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO root;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_consent (
                                     id character varying(36) NOT NULL,
                                     client_id character varying(255),
                                     user_id character varying(36) NOT NULL,
                                     created_date bigint,
                                     last_updated_date bigint,
                                     client_storage_provider character varying(36),
                                     external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO root;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_consent_client_scope (
                                                  user_consent_id character varying(36) NOT NULL,
                                                  scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO root;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_entity (
                                    id character varying(36) NOT NULL,
                                    email character varying(255),
                                    email_constraint character varying(255),
                                    email_verified boolean DEFAULT false NOT NULL,
                                    enabled boolean DEFAULT false NOT NULL,
                                    federation_link character varying(255),
                                    first_name character varying(255),
                                    last_name character varying(255),
                                    realm_id character varying(255),
                                    username character varying(255),
                                    created_timestamp bigint,
                                    service_account_client_link character varying(255),
                                    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO root;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_federation_config (
                                               user_federation_provider_id character varying(36) NOT NULL,
                                               value character varying(255),
                                               name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO root;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_federation_mapper (
                                               id character varying(36) NOT NULL,
                                               name character varying(255) NOT NULL,
                                               federation_provider_id character varying(36) NOT NULL,
                                               federation_mapper_type character varying(255) NOT NULL,
                                               realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO root;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_federation_mapper_config (
                                                      user_federation_mapper_id character varying(36) NOT NULL,
                                                      value character varying(255),
                                                      name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO root;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_federation_provider (
                                                 id character varying(36) NOT NULL,
                                                 changed_sync_period integer,
                                                 display_name character varying(255),
                                                 full_sync_period integer,
                                                 last_sync integer,
                                                 priority integer,
                                                 provider_name character varying(255),
                                                 realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO root;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_group_membership (
                                              group_id character varying(36) NOT NULL,
                                              user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO root;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_required_action (
                                             user_id character varying(36) NOT NULL,
                                             required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO root;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_role_mapping (
                                          role_id character varying(255) NOT NULL,
                                          user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO root;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_session (
                                     id character varying(36) NOT NULL,
                                     auth_method character varying(255),
                                     ip_address character varying(255),
                                     last_session_refresh integer,
                                     login_username character varying(255),
                                     realm_id character varying(255),
                                     remember_me boolean DEFAULT false NOT NULL,
                                     started integer,
                                     user_id character varying(255),
                                     user_session_state integer,
                                     broker_session_id character varying(255),
                                     broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO root;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_session_note (
                                          user_session character varying(36) NOT NULL,
                                          name character varying(255) NOT NULL,
                                          value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO root;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.username_login_failure (
                                               realm_id character varying(36) NOT NULL,
                                               username character varying(255) NOT NULL,
                                               failed_login_not_before integer,
                                               last_failure bigint,
                                               last_ip_failure character varying(255),
                                               num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO root;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.web_origins (
                                    client_id character varying(36) NOT NULL,
                                    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO root;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
ff551c82-26a2-4dd2-977c-7801eb7ed50b	e75f858e-d8a5-4de2-88cb-54ee6fee6824
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
a15b21fc-1549-4131-a964-4879e8e1b02b	\N	auth-cookie	1fdc94c4-226d-4d2a-96fc-e04291889300	b21c8d8d-10f9-4263-a81f-4181d74e6899	2	10	f	\N	\N
a7663990-8126-45ee-8d7a-5b16a1d78bbe	\N	auth-spnego	1fdc94c4-226d-4d2a-96fc-e04291889300	b21c8d8d-10f9-4263-a81f-4181d74e6899	3	20	f	\N	\N
a18b9160-9e37-4da0-b015-a723f75b8389	\N	identity-provider-redirector	1fdc94c4-226d-4d2a-96fc-e04291889300	b21c8d8d-10f9-4263-a81f-4181d74e6899	2	25	f	\N	\N
4e5cd1f6-09a5-48ef-89f2-554433771433	\N	\N	1fdc94c4-226d-4d2a-96fc-e04291889300	b21c8d8d-10f9-4263-a81f-4181d74e6899	2	30	t	229badff-9158-4700-a71a-4f7da03cf495	\N
380d698a-f082-45db-9d21-784f5ffdf496	\N	auth-username-password-form	1fdc94c4-226d-4d2a-96fc-e04291889300	229badff-9158-4700-a71a-4f7da03cf495	0	10	f	\N	\N
db6dab9c-48e3-4609-814c-8b4a3648a07e	\N	\N	1fdc94c4-226d-4d2a-96fc-e04291889300	229badff-9158-4700-a71a-4f7da03cf495	1	20	t	4b9b9754-db30-4883-a16b-7994e61e78c8	\N
51fb5691-ab31-47a5-acc2-b0efbc4b6d80	\N	conditional-user-configured	1fdc94c4-226d-4d2a-96fc-e04291889300	4b9b9754-db30-4883-a16b-7994e61e78c8	0	10	f	\N	\N
50187828-fe65-4243-b681-5a0da70b229b	\N	auth-otp-form	1fdc94c4-226d-4d2a-96fc-e04291889300	4b9b9754-db30-4883-a16b-7994e61e78c8	0	20	f	\N	\N
14a08363-1b1a-4df0-bc9f-e6f0bb10ce2d	\N	direct-grant-validate-username	1fdc94c4-226d-4d2a-96fc-e04291889300	a6c3c6e6-ffe6-4523-9cdf-1ca7f5c88261	0	10	f	\N	\N
a98bcabc-73ea-45a6-a452-c4fd06d06227	\N	direct-grant-validate-password	1fdc94c4-226d-4d2a-96fc-e04291889300	a6c3c6e6-ffe6-4523-9cdf-1ca7f5c88261	0	20	f	\N	\N
22f0ef4e-fb0e-4976-8db9-d0404725108d	\N	\N	1fdc94c4-226d-4d2a-96fc-e04291889300	a6c3c6e6-ffe6-4523-9cdf-1ca7f5c88261	1	30	t	456d4b33-e394-47aa-a6c4-70c1576fcdff	\N
d0a62090-8292-4fe3-8999-a2fbe6132dc9	\N	conditional-user-configured	1fdc94c4-226d-4d2a-96fc-e04291889300	456d4b33-e394-47aa-a6c4-70c1576fcdff	0	10	f	\N	\N
cc46f00a-2fa9-476d-ab5f-c6a817a4dfe3	\N	direct-grant-validate-otp	1fdc94c4-226d-4d2a-96fc-e04291889300	456d4b33-e394-47aa-a6c4-70c1576fcdff	0	20	f	\N	\N
eb17da68-ec1a-4f06-b092-28ecf5be9481	\N	registration-page-form	1fdc94c4-226d-4d2a-96fc-e04291889300	8f41c9c3-6bbb-4c01-a9d4-2f4814925627	0	10	t	e7d29e27-9b57-45ea-820c-301623ed22f4	\N
975bbc43-4744-4a59-b062-2f028b6602cd	\N	registration-user-creation	1fdc94c4-226d-4d2a-96fc-e04291889300	e7d29e27-9b57-45ea-820c-301623ed22f4	0	20	f	\N	\N
2c902287-6234-47fa-bda1-70d94b60bf1a	\N	registration-profile-action	1fdc94c4-226d-4d2a-96fc-e04291889300	e7d29e27-9b57-45ea-820c-301623ed22f4	0	40	f	\N	\N
ad236aa6-d797-411d-84df-3baca286e743	\N	registration-password-action	1fdc94c4-226d-4d2a-96fc-e04291889300	e7d29e27-9b57-45ea-820c-301623ed22f4	0	50	f	\N	\N
65a12ff3-14ba-4739-af44-5d794eb68f93	\N	registration-recaptcha-action	1fdc94c4-226d-4d2a-96fc-e04291889300	e7d29e27-9b57-45ea-820c-301623ed22f4	3	60	f	\N	\N
53f62dfc-6764-450c-a750-62c089bc7138	\N	reset-credentials-choose-user	1fdc94c4-226d-4d2a-96fc-e04291889300	1abc5ec7-c204-4ee0-a93c-fdb43f3ad49d	0	10	f	\N	\N
ef576aad-4e14-4304-b275-3ec4ce0b7ec3	\N	reset-credential-email	1fdc94c4-226d-4d2a-96fc-e04291889300	1abc5ec7-c204-4ee0-a93c-fdb43f3ad49d	0	20	f	\N	\N
f301b6e9-4fe6-4563-95b6-383996b65826	\N	reset-password	1fdc94c4-226d-4d2a-96fc-e04291889300	1abc5ec7-c204-4ee0-a93c-fdb43f3ad49d	0	30	f	\N	\N
f156c3d8-c8c1-4340-b8de-6bfa3cc9d2d2	\N	\N	1fdc94c4-226d-4d2a-96fc-e04291889300	1abc5ec7-c204-4ee0-a93c-fdb43f3ad49d	1	40	t	b14125f4-0f97-4646-9761-b11ecdb950c3	\N
c98b9b18-2a24-41b7-bca0-75699fff6da7	\N	conditional-user-configured	1fdc94c4-226d-4d2a-96fc-e04291889300	b14125f4-0f97-4646-9761-b11ecdb950c3	0	10	f	\N	\N
daf9f36d-23b0-42a3-9aae-75fef9bdd8b7	\N	reset-otp	1fdc94c4-226d-4d2a-96fc-e04291889300	b14125f4-0f97-4646-9761-b11ecdb950c3	0	20	f	\N	\N
5f6958b8-746e-4255-aa60-1f2ddb2bf983	\N	client-secret	1fdc94c4-226d-4d2a-96fc-e04291889300	d5a162bb-8c51-4fa6-905a-4c56fedb9ff5	2	10	f	\N	\N
7c319424-9859-41dc-b4ca-f796814e9312	\N	client-jwt	1fdc94c4-226d-4d2a-96fc-e04291889300	d5a162bb-8c51-4fa6-905a-4c56fedb9ff5	2	20	f	\N	\N
93ccbc85-dbbb-4c49-9009-d45cf474b7ae	\N	client-secret-jwt	1fdc94c4-226d-4d2a-96fc-e04291889300	d5a162bb-8c51-4fa6-905a-4c56fedb9ff5	2	30	f	\N	\N
494dd899-551f-4efc-b1fb-8b15ce54ea9b	\N	client-x509	1fdc94c4-226d-4d2a-96fc-e04291889300	d5a162bb-8c51-4fa6-905a-4c56fedb9ff5	2	40	f	\N	\N
1637669e-2b13-41b6-ab94-fac53f4fc030	\N	idp-review-profile	1fdc94c4-226d-4d2a-96fc-e04291889300	90a3ec5c-5685-45a6-923b-b4abfcf1a007	0	10	f	\N	eb0e4864-92d2-48f3-a6df-458a9ce15a2f
36cf00f8-5ffd-40c4-8f88-29b7af3e8099	\N	\N	1fdc94c4-226d-4d2a-96fc-e04291889300	90a3ec5c-5685-45a6-923b-b4abfcf1a007	0	20	t	98f8c4d8-830d-4dcc-bb06-35f15c94b302	\N
e2ffb533-04d0-45dc-9011-da0bff368d3b	\N	idp-create-user-if-unique	1fdc94c4-226d-4d2a-96fc-e04291889300	98f8c4d8-830d-4dcc-bb06-35f15c94b302	2	10	f	\N	b396c100-170a-45f9-ad2b-b197dbbfa899
33b6657c-96af-4266-9f27-4d402d4d9823	\N	\N	1fdc94c4-226d-4d2a-96fc-e04291889300	98f8c4d8-830d-4dcc-bb06-35f15c94b302	2	20	t	3a76d641-6121-49c5-8993-f887232408af	\N
c66cbe65-9da8-44d0-937c-d163e68af314	\N	idp-confirm-link	1fdc94c4-226d-4d2a-96fc-e04291889300	3a76d641-6121-49c5-8993-f887232408af	0	10	f	\N	\N
afc32e31-12e2-4c60-a8a9-ea874f05f202	\N	\N	1fdc94c4-226d-4d2a-96fc-e04291889300	3a76d641-6121-49c5-8993-f887232408af	0	20	t	7573a190-ba41-4bca-841a-79aff4692bfb	\N
62377d3b-e7ca-4cef-ac8b-5817bdbc62bd	\N	idp-email-verification	1fdc94c4-226d-4d2a-96fc-e04291889300	7573a190-ba41-4bca-841a-79aff4692bfb	2	10	f	\N	\N
7112fb74-bc8e-4b14-8a58-0c14bd433e43	\N	\N	1fdc94c4-226d-4d2a-96fc-e04291889300	7573a190-ba41-4bca-841a-79aff4692bfb	2	20	t	6d519d4d-fe27-4954-88b6-2fa2ed640273	\N
19c3e70b-0204-40ca-a898-5354681da7dd	\N	idp-username-password-form	1fdc94c4-226d-4d2a-96fc-e04291889300	6d519d4d-fe27-4954-88b6-2fa2ed640273	0	10	f	\N	\N
d135f553-063d-4ac6-bec6-ea7ac14c6132	\N	\N	1fdc94c4-226d-4d2a-96fc-e04291889300	6d519d4d-fe27-4954-88b6-2fa2ed640273	1	20	t	fe77ef96-afb0-4abf-ac4a-fdde3fa5aa58	\N
7ebd1753-53a8-4deb-882c-188d64393852	\N	conditional-user-configured	1fdc94c4-226d-4d2a-96fc-e04291889300	fe77ef96-afb0-4abf-ac4a-fdde3fa5aa58	0	10	f	\N	\N
331f85b7-4094-4c6c-b74d-cabe0497e0dd	\N	auth-otp-form	1fdc94c4-226d-4d2a-96fc-e04291889300	fe77ef96-afb0-4abf-ac4a-fdde3fa5aa58	0	20	f	\N	\N
0e631425-90a8-43ce-b79f-c953e09cb6e8	\N	http-basic-authenticator	1fdc94c4-226d-4d2a-96fc-e04291889300	3f73ec9f-63d9-47be-ab00-a5f1bfea0d3a	0	10	f	\N	\N
52737701-ead8-42ca-9718-655a9182c306	\N	docker-http-basic-authenticator	1fdc94c4-226d-4d2a-96fc-e04291889300	17fe9314-a100-42d5-8d1f-d6bb08c8772c	0	10	f	\N	\N
0682e050-aeaa-41ac-9690-282dab4f8a73	\N	no-cookie-redirect	1fdc94c4-226d-4d2a-96fc-e04291889300	339b09b1-981a-4efc-9267-da96a76e4cc3	0	10	f	\N	\N
d0e93c48-ae13-43ab-ad07-f06a3853a82d	\N	\N	1fdc94c4-226d-4d2a-96fc-e04291889300	339b09b1-981a-4efc-9267-da96a76e4cc3	0	20	t	ca4e2e6b-2912-46c6-b9d8-adc4458e2005	\N
5bc7448f-ec75-4678-8216-4ab13f650e6f	\N	basic-auth	1fdc94c4-226d-4d2a-96fc-e04291889300	ca4e2e6b-2912-46c6-b9d8-adc4458e2005	0	10	f	\N	\N
1b00535b-6327-4e68-93bb-dc50b7dbdada	\N	basic-auth-otp	1fdc94c4-226d-4d2a-96fc-e04291889300	ca4e2e6b-2912-46c6-b9d8-adc4458e2005	3	20	f	\N	\N
bd412132-a356-4548-9fa7-cb747a0631f8	\N	auth-spnego	1fdc94c4-226d-4d2a-96fc-e04291889300	ca4e2e6b-2912-46c6-b9d8-adc4458e2005	3	30	f	\N	\N
3997a27c-9a19-4071-9143-6974b856a708	\N	auth-cookie	20f9497d-ff36-42f0-8b47-64a1c65fc3df	74538e17-62d2-4cff-a53a-4b96511706d7	2	10	f	\N	\N
0d3eafb2-5796-4e18-9917-78ecb661b32b	\N	auth-spnego	20f9497d-ff36-42f0-8b47-64a1c65fc3df	74538e17-62d2-4cff-a53a-4b96511706d7	3	20	f	\N	\N
9cc67149-e162-42a0-a12f-5d964ab676b8	\N	identity-provider-redirector	20f9497d-ff36-42f0-8b47-64a1c65fc3df	74538e17-62d2-4cff-a53a-4b96511706d7	2	25	f	\N	\N
50e79805-721e-43ff-8e35-59f9b1b919bf	\N	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	74538e17-62d2-4cff-a53a-4b96511706d7	2	30	t	27396386-45f2-4490-92e4-60a0044d3920	\N
8cc02227-873e-429e-bcfc-e6bdab3bafb1	\N	auth-username-password-form	20f9497d-ff36-42f0-8b47-64a1c65fc3df	27396386-45f2-4490-92e4-60a0044d3920	0	10	f	\N	\N
a8db9eac-cbe3-485d-96d2-0d2ec460ec81	\N	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	27396386-45f2-4490-92e4-60a0044d3920	1	20	t	05861f20-a65f-46ce-9aa1-db78bfae3e75	\N
9c0700ce-3ff1-494d-8a96-a60458a957a5	\N	conditional-user-configured	20f9497d-ff36-42f0-8b47-64a1c65fc3df	05861f20-a65f-46ce-9aa1-db78bfae3e75	0	10	f	\N	\N
3dee9712-1a59-4809-94b3-28cb6435bd3a	\N	auth-otp-form	20f9497d-ff36-42f0-8b47-64a1c65fc3df	05861f20-a65f-46ce-9aa1-db78bfae3e75	0	20	f	\N	\N
a78629fb-0d2a-4c3a-9f5a-da7f48a3f8a4	\N	direct-grant-validate-username	20f9497d-ff36-42f0-8b47-64a1c65fc3df	016ea270-4a02-4ad5-999d-40a01bd68161	0	10	f	\N	\N
60ad108a-6c84-4efd-9ea8-f5cdd3d770b1	\N	direct-grant-validate-password	20f9497d-ff36-42f0-8b47-64a1c65fc3df	016ea270-4a02-4ad5-999d-40a01bd68161	0	20	f	\N	\N
f5289102-358f-443c-a75c-3b8af5e6fe07	\N	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	016ea270-4a02-4ad5-999d-40a01bd68161	1	30	t	e913693c-2cfa-4288-adb1-5e23ceff6bc9	\N
25eb6ef3-21ed-4105-b9f5-af53bc03ff16	\N	conditional-user-configured	20f9497d-ff36-42f0-8b47-64a1c65fc3df	e913693c-2cfa-4288-adb1-5e23ceff6bc9	0	10	f	\N	\N
50494de1-afc1-4404-a670-b2b92f250f38	\N	direct-grant-validate-otp	20f9497d-ff36-42f0-8b47-64a1c65fc3df	e913693c-2cfa-4288-adb1-5e23ceff6bc9	0	20	f	\N	\N
8f650a30-bff2-471a-b185-240c8973b835	\N	registration-page-form	20f9497d-ff36-42f0-8b47-64a1c65fc3df	5425d512-59e4-4849-8274-42451ecda25c	0	10	t	76c5e82a-ed6b-4e34-bc9f-4405ca7c9202	\N
7b796948-636e-446e-930c-0d8722d93794	\N	registration-user-creation	20f9497d-ff36-42f0-8b47-64a1c65fc3df	76c5e82a-ed6b-4e34-bc9f-4405ca7c9202	0	20	f	\N	\N
e2cdbc10-cd2f-4604-9f01-5ebc0a15bc75	\N	registration-profile-action	20f9497d-ff36-42f0-8b47-64a1c65fc3df	76c5e82a-ed6b-4e34-bc9f-4405ca7c9202	0	40	f	\N	\N
2cd1021c-030f-444a-aa6c-5e2210e8d39e	\N	registration-password-action	20f9497d-ff36-42f0-8b47-64a1c65fc3df	76c5e82a-ed6b-4e34-bc9f-4405ca7c9202	0	50	f	\N	\N
300f7174-7355-4680-8410-e11eb67cbfbc	\N	registration-recaptcha-action	20f9497d-ff36-42f0-8b47-64a1c65fc3df	76c5e82a-ed6b-4e34-bc9f-4405ca7c9202	3	60	f	\N	\N
df7946d0-9fe7-4537-a96b-a836a1940baf	\N	reset-credentials-choose-user	20f9497d-ff36-42f0-8b47-64a1c65fc3df	637a86f9-06dd-4470-ae73-1a20f7136dac	0	10	f	\N	\N
98c10611-8ce0-445f-9a01-55fa0990093a	\N	reset-credential-email	20f9497d-ff36-42f0-8b47-64a1c65fc3df	637a86f9-06dd-4470-ae73-1a20f7136dac	0	20	f	\N	\N
aabd79b0-5717-4995-92c3-976fdedd5694	\N	reset-password	20f9497d-ff36-42f0-8b47-64a1c65fc3df	637a86f9-06dd-4470-ae73-1a20f7136dac	0	30	f	\N	\N
f0ebd612-597f-4d93-9881-529c031a4212	\N	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	637a86f9-06dd-4470-ae73-1a20f7136dac	1	40	t	c3b46f5e-c299-4468-89b0-687a35550c05	\N
5213da78-12ab-491d-8b1b-a2dda20ca4ca	\N	conditional-user-configured	20f9497d-ff36-42f0-8b47-64a1c65fc3df	c3b46f5e-c299-4468-89b0-687a35550c05	0	10	f	\N	\N
8512fe58-1890-47f9-a49a-024fe0972b1b	\N	reset-otp	20f9497d-ff36-42f0-8b47-64a1c65fc3df	c3b46f5e-c299-4468-89b0-687a35550c05	0	20	f	\N	\N
f379980e-dd57-458c-b6ae-ca6db27c490c	\N	client-secret	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1877d22b-e6c5-4b0f-a92d-419b51bcad92	2	10	f	\N	\N
8337184b-b20d-4f9f-8dca-838a7b1d96d7	\N	client-jwt	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1877d22b-e6c5-4b0f-a92d-419b51bcad92	2	20	f	\N	\N
1ed24354-0d69-4225-8579-a794504275af	\N	client-secret-jwt	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1877d22b-e6c5-4b0f-a92d-419b51bcad92	2	30	f	\N	\N
50d36334-5bf0-4d93-a87e-05081171709b	\N	client-x509	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1877d22b-e6c5-4b0f-a92d-419b51bcad92	2	40	f	\N	\N
507d34ab-4533-42dc-8cc2-04ca9f96a646	\N	idp-review-profile	20f9497d-ff36-42f0-8b47-64a1c65fc3df	bdb0b26b-9efe-4743-904b-686291730954	0	10	f	\N	405cb177-bba0-4999-8ae1-785ec5fc897e
c8c0032a-4b54-4bbc-8823-ead68dc27939	\N	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	bdb0b26b-9efe-4743-904b-686291730954	0	20	t	89a52ade-c0a2-4835-9e1e-1639cfd3622e	\N
e2c28f61-2361-43ce-9400-a4bc7f7501f2	\N	idp-create-user-if-unique	20f9497d-ff36-42f0-8b47-64a1c65fc3df	89a52ade-c0a2-4835-9e1e-1639cfd3622e	2	10	f	\N	62935651-71a9-4f4c-bf15-d0ad45aa3f18
7eb5ab92-8eb3-401a-9680-38913e4d6bbc	\N	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	89a52ade-c0a2-4835-9e1e-1639cfd3622e	2	20	t	9f4b1462-00f8-4498-863b-80b5de77e11d	\N
e1e98fa3-c5cb-4cf9-b11e-0676cc08781f	\N	idp-confirm-link	20f9497d-ff36-42f0-8b47-64a1c65fc3df	9f4b1462-00f8-4498-863b-80b5de77e11d	0	10	f	\N	\N
1935b45b-bc54-4e5d-9848-94c756afc388	\N	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	9f4b1462-00f8-4498-863b-80b5de77e11d	0	20	t	4cefe473-4b3c-4020-ad60-093aedbbc04c	\N
b2fc26d7-698b-4ba4-bb95-95cf383f5cde	\N	idp-email-verification	20f9497d-ff36-42f0-8b47-64a1c65fc3df	4cefe473-4b3c-4020-ad60-093aedbbc04c	2	10	f	\N	\N
cea27d17-d265-4d3d-892b-7e7b24f83b1d	\N	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	4cefe473-4b3c-4020-ad60-093aedbbc04c	2	20	t	08b76231-f121-4022-9787-3d65b611c736	\N
07a25c6f-7b17-4957-82b5-342f6cd2052a	\N	idp-username-password-form	20f9497d-ff36-42f0-8b47-64a1c65fc3df	08b76231-f121-4022-9787-3d65b611c736	0	10	f	\N	\N
7a166f45-97f3-4ef9-910a-3364083f84cf	\N	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	08b76231-f121-4022-9787-3d65b611c736	1	20	t	1f67690b-7731-42bf-9062-10a32615f5b3	\N
91f30d3c-ebb0-4e83-9f6e-2e1405a17244	\N	conditional-user-configured	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f67690b-7731-42bf-9062-10a32615f5b3	0	10	f	\N	\N
7fde693c-79e4-46ca-914c-f42aebd8cb31	\N	auth-otp-form	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f67690b-7731-42bf-9062-10a32615f5b3	0	20	f	\N	\N
b3dcb1b8-8446-4aba-b955-eaccee5f9940	\N	http-basic-authenticator	20f9497d-ff36-42f0-8b47-64a1c65fc3df	8cea3e13-1563-4294-a4c4-a9de729602ac	0	10	f	\N	\N
1a0c1d37-92cd-4da9-a59e-e938ef948824	\N	docker-http-basic-authenticator	20f9497d-ff36-42f0-8b47-64a1c65fc3df	3312825b-f595-4361-9563-36739f6ed042	0	10	f	\N	\N
f32a0c46-cd4a-4b7b-871d-b09d6239d9f4	\N	no-cookie-redirect	20f9497d-ff36-42f0-8b47-64a1c65fc3df	9c4bcd4b-cc86-4822-8db9-0a0247e50691	0	10	f	\N	\N
794db43d-afdc-44b7-8e0a-0b2c73e98366	\N	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	9c4bcd4b-cc86-4822-8db9-0a0247e50691	0	20	t	4f1e46f0-8979-4459-ab1e-2a028fd25a01	\N
cb481a85-4e5d-479e-9902-766465946a9e	\N	basic-auth	20f9497d-ff36-42f0-8b47-64a1c65fc3df	4f1e46f0-8979-4459-ab1e-2a028fd25a01	0	10	f	\N	\N
ec7a9517-817e-46e0-84c6-7ba07bdaf263	\N	basic-auth-otp	20f9497d-ff36-42f0-8b47-64a1c65fc3df	4f1e46f0-8979-4459-ab1e-2a028fd25a01	3	20	f	\N	\N
1d714c71-33c5-46c5-900f-8156a44ea25d	\N	auth-spnego	20f9497d-ff36-42f0-8b47-64a1c65fc3df	4f1e46f0-8979-4459-ab1e-2a028fd25a01	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
b21c8d8d-10f9-4263-a81f-4181d74e6899	browser	browser based authentication	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	t	t
229badff-9158-4700-a71a-4f7da03cf495	forms	Username, password, otp and other auth forms.	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	f	t
4b9b9754-db30-4883-a16b-7994e61e78c8	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	f	t
a6c3c6e6-ffe6-4523-9cdf-1ca7f5c88261	direct grant	OpenID Connect Resource Owner Grant	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	t	t
456d4b33-e394-47aa-a6c4-70c1576fcdff	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	f	t
8f41c9c3-6bbb-4c01-a9d4-2f4814925627	registration	registration flow	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	t	t
e7d29e27-9b57-45ea-820c-301623ed22f4	registration form	registration form	1fdc94c4-226d-4d2a-96fc-e04291889300	form-flow	f	t
1abc5ec7-c204-4ee0-a93c-fdb43f3ad49d	reset credentials	Reset credentials for a user if they forgot their password or something	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	t	t
b14125f4-0f97-4646-9761-b11ecdb950c3	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	f	t
d5a162bb-8c51-4fa6-905a-4c56fedb9ff5	clients	Base authentication for clients	1fdc94c4-226d-4d2a-96fc-e04291889300	client-flow	t	t
90a3ec5c-5685-45a6-923b-b4abfcf1a007	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	t	t
98f8c4d8-830d-4dcc-bb06-35f15c94b302	User creation or linking	Flow for the existing/non-existing user alternatives	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	f	t
3a76d641-6121-49c5-8993-f887232408af	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	f	t
7573a190-ba41-4bca-841a-79aff4692bfb	Account verification options	Method with which to verity the existing account	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	f	t
6d519d4d-fe27-4954-88b6-2fa2ed640273	Verify Existing Account by Re-authentication	Reauthentication of existing account	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	f	t
fe77ef96-afb0-4abf-ac4a-fdde3fa5aa58	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	f	t
3f73ec9f-63d9-47be-ab00-a5f1bfea0d3a	saml ecp	SAML ECP Profile Authentication Flow	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	t	t
17fe9314-a100-42d5-8d1f-d6bb08c8772c	docker auth	Used by Docker clients to authenticate against the IDP	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	t	t
339b09b1-981a-4efc-9267-da96a76e4cc3	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	t	t
ca4e2e6b-2912-46c6-b9d8-adc4458e2005	Authentication Options	Authentication options.	1fdc94c4-226d-4d2a-96fc-e04291889300	basic-flow	f	t
74538e17-62d2-4cff-a53a-4b96511706d7	browser	browser based authentication	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	t	t
27396386-45f2-4490-92e4-60a0044d3920	forms	Username, password, otp and other auth forms.	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	f	t
05861f20-a65f-46ce-9aa1-db78bfae3e75	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	f	t
016ea270-4a02-4ad5-999d-40a01bd68161	direct grant	OpenID Connect Resource Owner Grant	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	t	t
e913693c-2cfa-4288-adb1-5e23ceff6bc9	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	f	t
5425d512-59e4-4849-8274-42451ecda25c	registration	registration flow	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	t	t
76c5e82a-ed6b-4e34-bc9f-4405ca7c9202	registration form	registration form	20f9497d-ff36-42f0-8b47-64a1c65fc3df	form-flow	f	t
637a86f9-06dd-4470-ae73-1a20f7136dac	reset credentials	Reset credentials for a user if they forgot their password or something	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	t	t
c3b46f5e-c299-4468-89b0-687a35550c05	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	f	t
1877d22b-e6c5-4b0f-a92d-419b51bcad92	clients	Base authentication for clients	20f9497d-ff36-42f0-8b47-64a1c65fc3df	client-flow	t	t
bdb0b26b-9efe-4743-904b-686291730954	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	t	t
89a52ade-c0a2-4835-9e1e-1639cfd3622e	User creation or linking	Flow for the existing/non-existing user alternatives	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	f	t
9f4b1462-00f8-4498-863b-80b5de77e11d	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	f	t
4cefe473-4b3c-4020-ad60-093aedbbc04c	Account verification options	Method with which to verity the existing account	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	f	t
08b76231-f121-4022-9787-3d65b611c736	Verify Existing Account by Re-authentication	Reauthentication of existing account	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	f	t
1f67690b-7731-42bf-9062-10a32615f5b3	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	f	t
8cea3e13-1563-4294-a4c4-a9de729602ac	saml ecp	SAML ECP Profile Authentication Flow	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	t	t
3312825b-f595-4361-9563-36739f6ed042	docker auth	Used by Docker clients to authenticate against the IDP	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	t	t
9c4bcd4b-cc86-4822-8db9-0a0247e50691	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	t	t
4f1e46f0-8979-4459-ab1e-2a028fd25a01	Authentication Options	Authentication options.	20f9497d-ff36-42f0-8b47-64a1c65fc3df	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
eb0e4864-92d2-48f3-a6df-458a9ce15a2f	review profile config	1fdc94c4-226d-4d2a-96fc-e04291889300
b396c100-170a-45f9-ad2b-b197dbbfa899	create unique user config	1fdc94c4-226d-4d2a-96fc-e04291889300
405cb177-bba0-4999-8ae1-785ec5fc897e	review profile config	20f9497d-ff36-42f0-8b47-64a1c65fc3df
62935651-71a9-4f4c-bf15-d0ad45aa3f18	create unique user config	20f9497d-ff36-42f0-8b47-64a1c65fc3df
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
b396c100-170a-45f9-ad2b-b197dbbfa899	false	require.password.update.after.registration
eb0e4864-92d2-48f3-a6df-458a9ce15a2f	missing	update.profile.on.first.login
                                                               405cb177-bba0-4999-8ae1-785ec5fc897e	missing	update.profile.on.first.login
                                                                                                                      62935651-71a9-4f4c-bf15-d0ad45aa3f18	false	require.password.update.after.registration
                                                                                                                      \.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: root
--

                                                                                                                      COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
233dea85-107d-4587-8eda-2b74b1f472c1	t	f	master-realm	0	f	\N	\N	t	\N	f	1fdc94c4-226d-4d2a-96fc-e04291889300	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
dd08fab5-5264-424e-8867-f10b7aec5f5b	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	1fdc94c4-226d-4d2a-96fc-e04291889300	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
fb151bdb-be96-4970-9814-848bdbb9d0c1	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	1fdc94c4-226d-4d2a-96fc-e04291889300	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
b0200f32-f5e1-4e97-a144-d478d4964cb9	t	f	broker	0	f	\N	\N	t	\N	f	1fdc94c4-226d-4d2a-96fc-e04291889300	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
69589433-2f6e-4175-8fff-1dd9b49b71bc	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	1fdc94c4-226d-4d2a-96fc-e04291889300	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
e12f4010-e225-43c8-8162-1a454a82eafc	t	f	admin-cli	0	t	\N	\N	f	\N	f	1fdc94c4-226d-4d2a-96fc-e04291889300	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
42b55fe7-b70b-4eab-9543-cb75038f4088	t	t	app-web	0	t	\N		f		f	20f9497d-ff36-42f0-8b47-64a1c65fc3df	openid-connect	-1	t	f	App WEB Angular	f	client-secret	https://keycloak.fluytcloud.com		\N	t	f	t	f
71a45c32-9354-4859-a43a-cb34dd1eac51	t	t	app-backend	0	f	PmqhRiH6UVcsGp1P67OgO23PWRKasfJu		f		f	20f9497d-ff36-42f0-8b47-64a1c65fc3df	openid-connect	-1	t	f	App Backend Quarkus	t	client-secret			\N	t	f	t	f
ff03b919-635c-4bac-b54f-14d5d5984439	t	f	fluyt-realm	0	f	\N	\N	t	\N	f	1fdc94c4-226d-4d2a-96fc-e04291889300	\N	0	f	f	keycloak Realm	f	client-secret	\N	\N	\N	t	f	f	f
499f92ad-3f8e-495e-b224-252c84a7cc7e	t	f	security-admin-console	0	t	\N	/admin/fluyt/console/	f	\N	f	20f9497d-ff36-42f0-8b47-64a1c65fc3df	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
b70432c4-b75f-4588-ba96-b77a22c12aaf	t	f	account	0	t	\N	/realms/fluyt/account/	f	\N	f	20f9497d-ff36-42f0-8b47-64a1c65fc3df	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
1f0d4898-7575-4378-929f-508a7ae8c7f8	t	f	realm-management	0	f	\N	\N	t	\N	f	20f9497d-ff36-42f0-8b47-64a1c65fc3df	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
5bad9d86-4193-457a-903c-95c2ec701f7b	t	f	account-console	0	t	\N	/realms/keycloak/account/	f	\N	f	20f9497d-ff36-42f0-8b47-64a1c65fc3df	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
53c48ae0-ada5-4d35-bb0d-e702d1af358b	t	f	broker	0	f	\N	\N	t	\N	f	20f9497d-ff36-42f0-8b47-64a1c65fc3df	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
410a4628-f1bb-4dca-bc9d-04f6e360438b	t	f	admin-cli	0	t	\N	\N	f	\N	f	20f9497d-ff36-42f0-8b47-64a1c65fc3df	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
dd08fab5-5264-424e-8867-f10b7aec5f5b	+	post.logout.redirect.uris
fb151bdb-be96-4970-9814-848bdbb9d0c1	+	post.logout.redirect.uris
fb151bdb-be96-4970-9814-848bdbb9d0c1	S256	pkce.code.challenge.method
69589433-2f6e-4175-8fff-1dd9b49b71bc	+	post.logout.redirect.uris
69589433-2f6e-4175-8fff-1dd9b49b71bc	S256	pkce.code.challenge.method
b70432c4-b75f-4588-ba96-b77a22c12aaf	+	post.logout.redirect.uris
5bad9d86-4193-457a-903c-95c2ec701f7b	+	post.logout.redirect.uris
5bad9d86-4193-457a-903c-95c2ec701f7b	S256	pkce.code.challenge.method
499f92ad-3f8e-495e-b224-252c84a7cc7e	+	post.logout.redirect.uris
499f92ad-3f8e-495e-b224-252c84a7cc7e	S256	pkce.code.challenge.method
42b55fe7-b70b-4eab-9543-cb75038f4088	1659807597	client.secret.creation.time
42b55fe7-b70b-4eab-9543-cb75038f4088	+	post.logout.redirect.uris
42b55fe7-b70b-4eab-9543-cb75038f4088	false	oauth2.device.authorization.grant.enabled
42b55fe7-b70b-4eab-9543-cb75038f4088	false	backchannel.logout.revoke.offline.tokens
42b55fe7-b70b-4eab-9543-cb75038f4088	true	backchannel.logout.session.required
42b55fe7-b70b-4eab-9543-cb75038f4088	true	use.refresh.tokens
42b55fe7-b70b-4eab-9543-cb75038f4088	false	tls-client-certificate-bound-access-tokens
42b55fe7-b70b-4eab-9543-cb75038f4088	false	oidc.ciba.grant.enabled
42b55fe7-b70b-4eab-9543-cb75038f4088	false	client_credentials.use_refresh_token
42b55fe7-b70b-4eab-9543-cb75038f4088	{}	acr.loa.map
42b55fe7-b70b-4eab-9543-cb75038f4088	false	require.pushed.authorization.requests
42b55fe7-b70b-4eab-9543-cb75038f4088	false	display.on.consent.screen
42b55fe7-b70b-4eab-9543-cb75038f4088	false	token.response.type.bearer.lower-case
71a45c32-9354-4859-a43a-cb34dd1eac51	false	oidc.ciba.grant.enabled
71a45c32-9354-4859-a43a-cb34dd1eac51	1661198908	client.secret.creation.time
71a45c32-9354-4859-a43a-cb34dd1eac51	true	backchannel.logout.session.required
71a45c32-9354-4859-a43a-cb34dd1eac51	false	backchannel.logout.revoke.offline.tokens
71a45c32-9354-4859-a43a-cb34dd1eac51	false	display.on.consent.screen
71a45c32-9354-4859-a43a-cb34dd1eac51	false	oauth2.device.authorization.grant.enabled
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
2a04c8ce-eb36-4a1a-9ae5-5d04637164ba	offline_access	1fdc94c4-226d-4d2a-96fc-e04291889300	OpenID Connect built-in scope: offline_access	openid-connect
005267f3-164c-4f8e-94e3-5c0337bd0005	role_list	1fdc94c4-226d-4d2a-96fc-e04291889300	SAML role list	saml
fe266107-a59a-4adc-972a-0c65ba0147fa	profile	1fdc94c4-226d-4d2a-96fc-e04291889300	OpenID Connect built-in scope: profile	openid-connect
96dcb049-1eaa-44a0-b805-b286e0124282	email	1fdc94c4-226d-4d2a-96fc-e04291889300	OpenID Connect built-in scope: email	openid-connect
4bbd9b87-644d-4ff5-9eed-338cb70389b6	address	1fdc94c4-226d-4d2a-96fc-e04291889300	OpenID Connect built-in scope: address	openid-connect
ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08	phone	1fdc94c4-226d-4d2a-96fc-e04291889300	OpenID Connect built-in scope: phone	openid-connect
ede3edd8-e865-45b0-87f4-8bd7280ef6d6	roles	1fdc94c4-226d-4d2a-96fc-e04291889300	OpenID Connect scope for add user roles to the access token	openid-connect
3d0f4aab-8f0a-46ab-8306-8593cf89a9e5	web-origins	1fdc94c4-226d-4d2a-96fc-e04291889300	OpenID Connect scope for add allowed web origins to the access token	openid-connect
34dea6e1-2519-4c7e-b008-c59b82a5de69	microprofile-jwt	1fdc94c4-226d-4d2a-96fc-e04291889300	Microprofile - JWT built-in scope	openid-connect
f9fd5382-fb92-4129-9cd8-cdff5877e56b	acr	1fdc94c4-226d-4d2a-96fc-e04291889300	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
f587dfd2-dfdc-4f44-9463-57e5b4e69d29	email	20f9497d-ff36-42f0-8b47-64a1c65fc3df	OpenID Connect built-in scope: email	openid-connect
9ca346a4-998e-4e00-b080-b13654653bbe	address	20f9497d-ff36-42f0-8b47-64a1c65fc3df	OpenID Connect built-in scope: address	openid-connect
81f00f09-2199-4fd9-b73d-9ac8ff16971f	phone	20f9497d-ff36-42f0-8b47-64a1c65fc3df	OpenID Connect built-in scope: phone	openid-connect
5ecff666-e5fa-4cd0-aaec-fde219d24f99	roles	20f9497d-ff36-42f0-8b47-64a1c65fc3df	OpenID Connect scope for add user roles to the access token	openid-connect
b4f226f6-bcf7-4c10-9c7b-01305350c351	web-origins	20f9497d-ff36-42f0-8b47-64a1c65fc3df	OpenID Connect scope for add allowed web origins to the access token	openid-connect
ea149db0-a513-4d20-854e-3d6699a27721	microprofile-jwt	20f9497d-ff36-42f0-8b47-64a1c65fc3df	Microprofile - JWT built-in scope	openid-connect
ffae67c4-2c06-47ca-815e-581674c7846d	offline_access	20f9497d-ff36-42f0-8b47-64a1c65fc3df	OpenID Connect built-in scope: offline_access	openid-connect
541cb6ae-f63d-4e1a-a8b7-090a3a901f1e	role_list	20f9497d-ff36-42f0-8b47-64a1c65fc3df	SAML role list	saml
bea7f837-2759-41d2-9d5e-2522f33a31ea	profile	20f9497d-ff36-42f0-8b47-64a1c65fc3df	OpenID Connect built-in scope: profile	openid-connect
45012b46-e04a-4b9b-be12-e1e20766133a	acr	20f9497d-ff36-42f0-8b47-64a1c65fc3df	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
18764984-b6ab-4bf3-9f19-d73ebbf630c1	groups	20f9497d-ff36-42f0-8b47-64a1c65fc3df	groups	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
2a04c8ce-eb36-4a1a-9ae5-5d04637164ba	true	display.on.consent.screen
2a04c8ce-eb36-4a1a-9ae5-5d04637164ba	${offlineAccessScopeConsentText}	consent.screen.text
005267f3-164c-4f8e-94e3-5c0337bd0005	true	display.on.consent.screen
005267f3-164c-4f8e-94e3-5c0337bd0005	${samlRoleListScopeConsentText}	consent.screen.text
fe266107-a59a-4adc-972a-0c65ba0147fa	true	display.on.consent.screen
fe266107-a59a-4adc-972a-0c65ba0147fa	${profileScopeConsentText}	consent.screen.text
fe266107-a59a-4adc-972a-0c65ba0147fa	true	include.in.token.scope
96dcb049-1eaa-44a0-b805-b286e0124282	true	display.on.consent.screen
96dcb049-1eaa-44a0-b805-b286e0124282	${emailScopeConsentText}	consent.screen.text
96dcb049-1eaa-44a0-b805-b286e0124282	true	include.in.token.scope
4bbd9b87-644d-4ff5-9eed-338cb70389b6	true	display.on.consent.screen
4bbd9b87-644d-4ff5-9eed-338cb70389b6	${addressScopeConsentText}	consent.screen.text
4bbd9b87-644d-4ff5-9eed-338cb70389b6	true	include.in.token.scope
ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08	true	display.on.consent.screen
ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08	${phoneScopeConsentText}	consent.screen.text
ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08	true	include.in.token.scope
ede3edd8-e865-45b0-87f4-8bd7280ef6d6	true	display.on.consent.screen
ede3edd8-e865-45b0-87f4-8bd7280ef6d6	${rolesScopeConsentText}	consent.screen.text
ede3edd8-e865-45b0-87f4-8bd7280ef6d6	false	include.in.token.scope
3d0f4aab-8f0a-46ab-8306-8593cf89a9e5	false	display.on.consent.screen
3d0f4aab-8f0a-46ab-8306-8593cf89a9e5		consent.screen.text
3d0f4aab-8f0a-46ab-8306-8593cf89a9e5	false	include.in.token.scope
34dea6e1-2519-4c7e-b008-c59b82a5de69	false	display.on.consent.screen
34dea6e1-2519-4c7e-b008-c59b82a5de69	true	include.in.token.scope
f9fd5382-fb92-4129-9cd8-cdff5877e56b	false	display.on.consent.screen
f9fd5382-fb92-4129-9cd8-cdff5877e56b	false	include.in.token.scope
ffae67c4-2c06-47ca-815e-581674c7846d	true	display.on.consent.screen
ffae67c4-2c06-47ca-815e-581674c7846d	${offlineAccessScopeConsentText}	consent.screen.text
541cb6ae-f63d-4e1a-a8b7-090a3a901f1e	true	display.on.consent.screen
541cb6ae-f63d-4e1a-a8b7-090a3a901f1e	${samlRoleListScopeConsentText}	consent.screen.text
bea7f837-2759-41d2-9d5e-2522f33a31ea	true	display.on.consent.screen
bea7f837-2759-41d2-9d5e-2522f33a31ea	${profileScopeConsentText}	consent.screen.text
bea7f837-2759-41d2-9d5e-2522f33a31ea	true	include.in.token.scope
f587dfd2-dfdc-4f44-9463-57e5b4e69d29	true	display.on.consent.screen
f587dfd2-dfdc-4f44-9463-57e5b4e69d29	${emailScopeConsentText}	consent.screen.text
f587dfd2-dfdc-4f44-9463-57e5b4e69d29	true	include.in.token.scope
9ca346a4-998e-4e00-b080-b13654653bbe	true	display.on.consent.screen
9ca346a4-998e-4e00-b080-b13654653bbe	${addressScopeConsentText}	consent.screen.text
9ca346a4-998e-4e00-b080-b13654653bbe	true	include.in.token.scope
81f00f09-2199-4fd9-b73d-9ac8ff16971f	true	display.on.consent.screen
81f00f09-2199-4fd9-b73d-9ac8ff16971f	${phoneScopeConsentText}	consent.screen.text
81f00f09-2199-4fd9-b73d-9ac8ff16971f	true	include.in.token.scope
5ecff666-e5fa-4cd0-aaec-fde219d24f99	true	display.on.consent.screen
5ecff666-e5fa-4cd0-aaec-fde219d24f99	${rolesScopeConsentText}	consent.screen.text
5ecff666-e5fa-4cd0-aaec-fde219d24f99	false	include.in.token.scope
b4f226f6-bcf7-4c10-9c7b-01305350c351	false	display.on.consent.screen
b4f226f6-bcf7-4c10-9c7b-01305350c351		consent.screen.text
b4f226f6-bcf7-4c10-9c7b-01305350c351	false	include.in.token.scope
ea149db0-a513-4d20-854e-3d6699a27721	false	display.on.consent.screen
ea149db0-a513-4d20-854e-3d6699a27721	true	include.in.token.scope
45012b46-e04a-4b9b-be12-e1e20766133a	false	display.on.consent.screen
45012b46-e04a-4b9b-be12-e1e20766133a	false	include.in.token.scope
18764984-b6ab-4bf3-9f19-d73ebbf630c1		consent.screen.text
18764984-b6ab-4bf3-9f19-d73ebbf630c1	true	display.on.consent.screen
18764984-b6ab-4bf3-9f19-d73ebbf630c1	true	include.in.token.scope
18764984-b6ab-4bf3-9f19-d73ebbf630c1		gui.order
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
dd08fab5-5264-424e-8867-f10b7aec5f5b	3d0f4aab-8f0a-46ab-8306-8593cf89a9e5	t
dd08fab5-5264-424e-8867-f10b7aec5f5b	f9fd5382-fb92-4129-9cd8-cdff5877e56b	t
dd08fab5-5264-424e-8867-f10b7aec5f5b	ede3edd8-e865-45b0-87f4-8bd7280ef6d6	t
dd08fab5-5264-424e-8867-f10b7aec5f5b	96dcb049-1eaa-44a0-b805-b286e0124282	t
dd08fab5-5264-424e-8867-f10b7aec5f5b	fe266107-a59a-4adc-972a-0c65ba0147fa	t
dd08fab5-5264-424e-8867-f10b7aec5f5b	4bbd9b87-644d-4ff5-9eed-338cb70389b6	f
dd08fab5-5264-424e-8867-f10b7aec5f5b	34dea6e1-2519-4c7e-b008-c59b82a5de69	f
dd08fab5-5264-424e-8867-f10b7aec5f5b	2a04c8ce-eb36-4a1a-9ae5-5d04637164ba	f
dd08fab5-5264-424e-8867-f10b7aec5f5b	ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08	f
fb151bdb-be96-4970-9814-848bdbb9d0c1	3d0f4aab-8f0a-46ab-8306-8593cf89a9e5	t
fb151bdb-be96-4970-9814-848bdbb9d0c1	f9fd5382-fb92-4129-9cd8-cdff5877e56b	t
fb151bdb-be96-4970-9814-848bdbb9d0c1	ede3edd8-e865-45b0-87f4-8bd7280ef6d6	t
fb151bdb-be96-4970-9814-848bdbb9d0c1	96dcb049-1eaa-44a0-b805-b286e0124282	t
fb151bdb-be96-4970-9814-848bdbb9d0c1	fe266107-a59a-4adc-972a-0c65ba0147fa	t
fb151bdb-be96-4970-9814-848bdbb9d0c1	4bbd9b87-644d-4ff5-9eed-338cb70389b6	f
fb151bdb-be96-4970-9814-848bdbb9d0c1	34dea6e1-2519-4c7e-b008-c59b82a5de69	f
fb151bdb-be96-4970-9814-848bdbb9d0c1	2a04c8ce-eb36-4a1a-9ae5-5d04637164ba	f
fb151bdb-be96-4970-9814-848bdbb9d0c1	ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08	f
e12f4010-e225-43c8-8162-1a454a82eafc	3d0f4aab-8f0a-46ab-8306-8593cf89a9e5	t
e12f4010-e225-43c8-8162-1a454a82eafc	f9fd5382-fb92-4129-9cd8-cdff5877e56b	t
e12f4010-e225-43c8-8162-1a454a82eafc	ede3edd8-e865-45b0-87f4-8bd7280ef6d6	t
e12f4010-e225-43c8-8162-1a454a82eafc	96dcb049-1eaa-44a0-b805-b286e0124282	t
e12f4010-e225-43c8-8162-1a454a82eafc	fe266107-a59a-4adc-972a-0c65ba0147fa	t
e12f4010-e225-43c8-8162-1a454a82eafc	4bbd9b87-644d-4ff5-9eed-338cb70389b6	f
e12f4010-e225-43c8-8162-1a454a82eafc	34dea6e1-2519-4c7e-b008-c59b82a5de69	f
e12f4010-e225-43c8-8162-1a454a82eafc	2a04c8ce-eb36-4a1a-9ae5-5d04637164ba	f
e12f4010-e225-43c8-8162-1a454a82eafc	ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08	f
b0200f32-f5e1-4e97-a144-d478d4964cb9	3d0f4aab-8f0a-46ab-8306-8593cf89a9e5	t
b0200f32-f5e1-4e97-a144-d478d4964cb9	f9fd5382-fb92-4129-9cd8-cdff5877e56b	t
b0200f32-f5e1-4e97-a144-d478d4964cb9	ede3edd8-e865-45b0-87f4-8bd7280ef6d6	t
b0200f32-f5e1-4e97-a144-d478d4964cb9	96dcb049-1eaa-44a0-b805-b286e0124282	t
b0200f32-f5e1-4e97-a144-d478d4964cb9	fe266107-a59a-4adc-972a-0c65ba0147fa	t
b0200f32-f5e1-4e97-a144-d478d4964cb9	4bbd9b87-644d-4ff5-9eed-338cb70389b6	f
b0200f32-f5e1-4e97-a144-d478d4964cb9	34dea6e1-2519-4c7e-b008-c59b82a5de69	f
b0200f32-f5e1-4e97-a144-d478d4964cb9	2a04c8ce-eb36-4a1a-9ae5-5d04637164ba	f
b0200f32-f5e1-4e97-a144-d478d4964cb9	ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08	f
233dea85-107d-4587-8eda-2b74b1f472c1	3d0f4aab-8f0a-46ab-8306-8593cf89a9e5	t
233dea85-107d-4587-8eda-2b74b1f472c1	f9fd5382-fb92-4129-9cd8-cdff5877e56b	t
233dea85-107d-4587-8eda-2b74b1f472c1	ede3edd8-e865-45b0-87f4-8bd7280ef6d6	t
233dea85-107d-4587-8eda-2b74b1f472c1	96dcb049-1eaa-44a0-b805-b286e0124282	t
233dea85-107d-4587-8eda-2b74b1f472c1	fe266107-a59a-4adc-972a-0c65ba0147fa	t
233dea85-107d-4587-8eda-2b74b1f472c1	4bbd9b87-644d-4ff5-9eed-338cb70389b6	f
233dea85-107d-4587-8eda-2b74b1f472c1	34dea6e1-2519-4c7e-b008-c59b82a5de69	f
233dea85-107d-4587-8eda-2b74b1f472c1	2a04c8ce-eb36-4a1a-9ae5-5d04637164ba	f
233dea85-107d-4587-8eda-2b74b1f472c1	ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08	f
69589433-2f6e-4175-8fff-1dd9b49b71bc	3d0f4aab-8f0a-46ab-8306-8593cf89a9e5	t
69589433-2f6e-4175-8fff-1dd9b49b71bc	f9fd5382-fb92-4129-9cd8-cdff5877e56b	t
69589433-2f6e-4175-8fff-1dd9b49b71bc	ede3edd8-e865-45b0-87f4-8bd7280ef6d6	t
69589433-2f6e-4175-8fff-1dd9b49b71bc	96dcb049-1eaa-44a0-b805-b286e0124282	t
69589433-2f6e-4175-8fff-1dd9b49b71bc	fe266107-a59a-4adc-972a-0c65ba0147fa	t
69589433-2f6e-4175-8fff-1dd9b49b71bc	4bbd9b87-644d-4ff5-9eed-338cb70389b6	f
69589433-2f6e-4175-8fff-1dd9b49b71bc	34dea6e1-2519-4c7e-b008-c59b82a5de69	f
69589433-2f6e-4175-8fff-1dd9b49b71bc	2a04c8ce-eb36-4a1a-9ae5-5d04637164ba	f
69589433-2f6e-4175-8fff-1dd9b49b71bc	ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08	f
b70432c4-b75f-4588-ba96-b77a22c12aaf	5ecff666-e5fa-4cd0-aaec-fde219d24f99	t
b70432c4-b75f-4588-ba96-b77a22c12aaf	bea7f837-2759-41d2-9d5e-2522f33a31ea	t
b70432c4-b75f-4588-ba96-b77a22c12aaf	45012b46-e04a-4b9b-be12-e1e20766133a	t
b70432c4-b75f-4588-ba96-b77a22c12aaf	b4f226f6-bcf7-4c10-9c7b-01305350c351	t
b70432c4-b75f-4588-ba96-b77a22c12aaf	f587dfd2-dfdc-4f44-9463-57e5b4e69d29	t
b70432c4-b75f-4588-ba96-b77a22c12aaf	ffae67c4-2c06-47ca-815e-581674c7846d	f
b70432c4-b75f-4588-ba96-b77a22c12aaf	ea149db0-a513-4d20-854e-3d6699a27721	f
b70432c4-b75f-4588-ba96-b77a22c12aaf	9ca346a4-998e-4e00-b080-b13654653bbe	f
b70432c4-b75f-4588-ba96-b77a22c12aaf	81f00f09-2199-4fd9-b73d-9ac8ff16971f	f
5bad9d86-4193-457a-903c-95c2ec701f7b	5ecff666-e5fa-4cd0-aaec-fde219d24f99	t
5bad9d86-4193-457a-903c-95c2ec701f7b	bea7f837-2759-41d2-9d5e-2522f33a31ea	t
5bad9d86-4193-457a-903c-95c2ec701f7b	45012b46-e04a-4b9b-be12-e1e20766133a	t
5bad9d86-4193-457a-903c-95c2ec701f7b	b4f226f6-bcf7-4c10-9c7b-01305350c351	t
5bad9d86-4193-457a-903c-95c2ec701f7b	f587dfd2-dfdc-4f44-9463-57e5b4e69d29	t
5bad9d86-4193-457a-903c-95c2ec701f7b	ffae67c4-2c06-47ca-815e-581674c7846d	f
5bad9d86-4193-457a-903c-95c2ec701f7b	ea149db0-a513-4d20-854e-3d6699a27721	f
5bad9d86-4193-457a-903c-95c2ec701f7b	9ca346a4-998e-4e00-b080-b13654653bbe	f
5bad9d86-4193-457a-903c-95c2ec701f7b	81f00f09-2199-4fd9-b73d-9ac8ff16971f	f
410a4628-f1bb-4dca-bc9d-04f6e360438b	5ecff666-e5fa-4cd0-aaec-fde219d24f99	t
410a4628-f1bb-4dca-bc9d-04f6e360438b	bea7f837-2759-41d2-9d5e-2522f33a31ea	t
410a4628-f1bb-4dca-bc9d-04f6e360438b	45012b46-e04a-4b9b-be12-e1e20766133a	t
410a4628-f1bb-4dca-bc9d-04f6e360438b	b4f226f6-bcf7-4c10-9c7b-01305350c351	t
410a4628-f1bb-4dca-bc9d-04f6e360438b	f587dfd2-dfdc-4f44-9463-57e5b4e69d29	t
410a4628-f1bb-4dca-bc9d-04f6e360438b	ffae67c4-2c06-47ca-815e-581674c7846d	f
42b55fe7-b70b-4eab-9543-cb75038f4088	b4f226f6-bcf7-4c10-9c7b-01305350c351	t
42b55fe7-b70b-4eab-9543-cb75038f4088	45012b46-e04a-4b9b-be12-e1e20766133a	t
410a4628-f1bb-4dca-bc9d-04f6e360438b	ea149db0-a513-4d20-854e-3d6699a27721	f
410a4628-f1bb-4dca-bc9d-04f6e360438b	9ca346a4-998e-4e00-b080-b13654653bbe	f
410a4628-f1bb-4dca-bc9d-04f6e360438b	81f00f09-2199-4fd9-b73d-9ac8ff16971f	f
53c48ae0-ada5-4d35-bb0d-e702d1af358b	5ecff666-e5fa-4cd0-aaec-fde219d24f99	t
53c48ae0-ada5-4d35-bb0d-e702d1af358b	bea7f837-2759-41d2-9d5e-2522f33a31ea	t
53c48ae0-ada5-4d35-bb0d-e702d1af358b	45012b46-e04a-4b9b-be12-e1e20766133a	t
53c48ae0-ada5-4d35-bb0d-e702d1af358b	b4f226f6-bcf7-4c10-9c7b-01305350c351	t
53c48ae0-ada5-4d35-bb0d-e702d1af358b	f587dfd2-dfdc-4f44-9463-57e5b4e69d29	t
53c48ae0-ada5-4d35-bb0d-e702d1af358b	ffae67c4-2c06-47ca-815e-581674c7846d	f
42b55fe7-b70b-4eab-9543-cb75038f4088	bea7f837-2759-41d2-9d5e-2522f33a31ea	t
42b55fe7-b70b-4eab-9543-cb75038f4088	5ecff666-e5fa-4cd0-aaec-fde219d24f99	t
42b55fe7-b70b-4eab-9543-cb75038f4088	f587dfd2-dfdc-4f44-9463-57e5b4e69d29	t
42b55fe7-b70b-4eab-9543-cb75038f4088	9ca346a4-998e-4e00-b080-b13654653bbe	f
42b55fe7-b70b-4eab-9543-cb75038f4088	81f00f09-2199-4fd9-b73d-9ac8ff16971f	f
42b55fe7-b70b-4eab-9543-cb75038f4088	ffae67c4-2c06-47ca-815e-581674c7846d	f
42b55fe7-b70b-4eab-9543-cb75038f4088	ea149db0-a513-4d20-854e-3d6699a27721	f
53c48ae0-ada5-4d35-bb0d-e702d1af358b	ea149db0-a513-4d20-854e-3d6699a27721	f
53c48ae0-ada5-4d35-bb0d-e702d1af358b	9ca346a4-998e-4e00-b080-b13654653bbe	f
53c48ae0-ada5-4d35-bb0d-e702d1af358b	81f00f09-2199-4fd9-b73d-9ac8ff16971f	f
1f0d4898-7575-4378-929f-508a7ae8c7f8	5ecff666-e5fa-4cd0-aaec-fde219d24f99	t
1f0d4898-7575-4378-929f-508a7ae8c7f8	bea7f837-2759-41d2-9d5e-2522f33a31ea	t
1f0d4898-7575-4378-929f-508a7ae8c7f8	45012b46-e04a-4b9b-be12-e1e20766133a	t
1f0d4898-7575-4378-929f-508a7ae8c7f8	b4f226f6-bcf7-4c10-9c7b-01305350c351	t
1f0d4898-7575-4378-929f-508a7ae8c7f8	f587dfd2-dfdc-4f44-9463-57e5b4e69d29	t
1f0d4898-7575-4378-929f-508a7ae8c7f8	ffae67c4-2c06-47ca-815e-581674c7846d	f
71a45c32-9354-4859-a43a-cb34dd1eac51	b4f226f6-bcf7-4c10-9c7b-01305350c351	t
71a45c32-9354-4859-a43a-cb34dd1eac51	45012b46-e04a-4b9b-be12-e1e20766133a	t
1f0d4898-7575-4378-929f-508a7ae8c7f8	ea149db0-a513-4d20-854e-3d6699a27721	f
1f0d4898-7575-4378-929f-508a7ae8c7f8	9ca346a4-998e-4e00-b080-b13654653bbe	f
1f0d4898-7575-4378-929f-508a7ae8c7f8	81f00f09-2199-4fd9-b73d-9ac8ff16971f	f
499f92ad-3f8e-495e-b224-252c84a7cc7e	5ecff666-e5fa-4cd0-aaec-fde219d24f99	t
499f92ad-3f8e-495e-b224-252c84a7cc7e	bea7f837-2759-41d2-9d5e-2522f33a31ea	t
499f92ad-3f8e-495e-b224-252c84a7cc7e	45012b46-e04a-4b9b-be12-e1e20766133a	t
499f92ad-3f8e-495e-b224-252c84a7cc7e	b4f226f6-bcf7-4c10-9c7b-01305350c351	t
499f92ad-3f8e-495e-b224-252c84a7cc7e	f587dfd2-dfdc-4f44-9463-57e5b4e69d29	t
499f92ad-3f8e-495e-b224-252c84a7cc7e	ffae67c4-2c06-47ca-815e-581674c7846d	f
71a45c32-9354-4859-a43a-cb34dd1eac51	bea7f837-2759-41d2-9d5e-2522f33a31ea	t
71a45c32-9354-4859-a43a-cb34dd1eac51	5ecff666-e5fa-4cd0-aaec-fde219d24f99	t
71a45c32-9354-4859-a43a-cb34dd1eac51	f587dfd2-dfdc-4f44-9463-57e5b4e69d29	t
71a45c32-9354-4859-a43a-cb34dd1eac51	9ca346a4-998e-4e00-b080-b13654653bbe	f
71a45c32-9354-4859-a43a-cb34dd1eac51	81f00f09-2199-4fd9-b73d-9ac8ff16971f	f
71a45c32-9354-4859-a43a-cb34dd1eac51	ffae67c4-2c06-47ca-815e-581674c7846d	f
71a45c32-9354-4859-a43a-cb34dd1eac51	ea149db0-a513-4d20-854e-3d6699a27721	f
42b55fe7-b70b-4eab-9543-cb75038f4088	18764984-b6ab-4bf3-9f19-d73ebbf630c1	t
499f92ad-3f8e-495e-b224-252c84a7cc7e	ea149db0-a513-4d20-854e-3d6699a27721	f
499f92ad-3f8e-495e-b224-252c84a7cc7e	9ca346a4-998e-4e00-b080-b13654653bbe	f
499f92ad-3f8e-495e-b224-252c84a7cc7e	81f00f09-2199-4fd9-b73d-9ac8ff16971f	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
2a04c8ce-eb36-4a1a-9ae5-5d04637164ba	baf975f8-a586-4994-81a9-edfdb92e05f2
ffae67c4-2c06-47ca-815e-581674c7846d	5e8541ee-9981-4069-b562-b8de6d38be18
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
77c3030a-579a-43ad-aa29-d1a59be9ed36	Trusted Hosts	1fdc94c4-226d-4d2a-96fc-e04291889300	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fdc94c4-226d-4d2a-96fc-e04291889300	anonymous
1f5b8bbf-3e21-41e9-b6a1-2a6ff99349cb	Consent Required	1fdc94c4-226d-4d2a-96fc-e04291889300	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fdc94c4-226d-4d2a-96fc-e04291889300	anonymous
6311b206-5ab2-4653-a58a-acaa64de7cfe	Full Scope Disabled	1fdc94c4-226d-4d2a-96fc-e04291889300	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fdc94c4-226d-4d2a-96fc-e04291889300	anonymous
82eee300-893b-4074-9963-29b9e3d07cdf	Max Clients Limit	1fdc94c4-226d-4d2a-96fc-e04291889300	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fdc94c4-226d-4d2a-96fc-e04291889300	anonymous
22c3fa7f-c699-4f4e-8f7e-7c948170b90f	Allowed Protocol Mapper Types	1fdc94c4-226d-4d2a-96fc-e04291889300	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fdc94c4-226d-4d2a-96fc-e04291889300	anonymous
8f5eabcc-fe7a-4fd5-9919-71094d897283	Allowed Client Scopes	1fdc94c4-226d-4d2a-96fc-e04291889300	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fdc94c4-226d-4d2a-96fc-e04291889300	anonymous
6640a85b-f250-42e6-8399-e861a4ef2167	Allowed Protocol Mapper Types	1fdc94c4-226d-4d2a-96fc-e04291889300	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fdc94c4-226d-4d2a-96fc-e04291889300	authenticated
6d43c666-e493-4551-8865-2364f1041b0b	Allowed Client Scopes	1fdc94c4-226d-4d2a-96fc-e04291889300	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	1fdc94c4-226d-4d2a-96fc-e04291889300	authenticated
f7471424-ea6e-4e53-92e4-c63b567cbbdd	rsa-generated	1fdc94c4-226d-4d2a-96fc-e04291889300	rsa-generated	org.keycloak.keys.KeyProvider	1fdc94c4-226d-4d2a-96fc-e04291889300	\N
df464600-c066-4731-aa46-901d2ca59eae	rsa-enc-generated	1fdc94c4-226d-4d2a-96fc-e04291889300	rsa-enc-generated	org.keycloak.keys.KeyProvider	1fdc94c4-226d-4d2a-96fc-e04291889300	\N
55b40f09-a8bc-44f2-b17b-5be517aed7b6	hmac-generated	1fdc94c4-226d-4d2a-96fc-e04291889300	hmac-generated	org.keycloak.keys.KeyProvider	1fdc94c4-226d-4d2a-96fc-e04291889300	\N
44c30334-c027-4165-a1c2-3810836a57a0	aes-generated	1fdc94c4-226d-4d2a-96fc-e04291889300	aes-generated	org.keycloak.keys.KeyProvider	1fdc94c4-226d-4d2a-96fc-e04291889300	\N
17a14de0-7ec3-42f1-9d52-397c89436020	rsa-generated	20f9497d-ff36-42f0-8b47-64a1c65fc3df	rsa-generated	org.keycloak.keys.KeyProvider	20f9497d-ff36-42f0-8b47-64a1c65fc3df	\N
004e126e-b5e9-4c20-bd99-3c9985c22b2b	rsa-enc-generated	20f9497d-ff36-42f0-8b47-64a1c65fc3df	rsa-enc-generated	org.keycloak.keys.KeyProvider	20f9497d-ff36-42f0-8b47-64a1c65fc3df	\N
2a0c3af4-75e9-4ebf-890c-f5c2595d2310	hmac-generated	20f9497d-ff36-42f0-8b47-64a1c65fc3df	hmac-generated	org.keycloak.keys.KeyProvider	20f9497d-ff36-42f0-8b47-64a1c65fc3df	\N
cd8e95f6-45fe-4cbc-b168-ed52df14bfa6	aes-generated	20f9497d-ff36-42f0-8b47-64a1c65fc3df	aes-generated	org.keycloak.keys.KeyProvider	20f9497d-ff36-42f0-8b47-64a1c65fc3df	\N
31dbcf28-aaf1-4dcf-9e08-3bcb2fc8dacc	Trusted Hosts	20f9497d-ff36-42f0-8b47-64a1c65fc3df	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	20f9497d-ff36-42f0-8b47-64a1c65fc3df	anonymous
212661a4-b883-4895-9c09-d255c7e3afc9	Consent Required	20f9497d-ff36-42f0-8b47-64a1c65fc3df	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	20f9497d-ff36-42f0-8b47-64a1c65fc3df	anonymous
4edd5976-8227-4fa8-b01c-61db31260fd2	Full Scope Disabled	20f9497d-ff36-42f0-8b47-64a1c65fc3df	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	20f9497d-ff36-42f0-8b47-64a1c65fc3df	anonymous
932e2d59-3901-42e9-b7c5-2ee68e450db8	Max Clients Limit	20f9497d-ff36-42f0-8b47-64a1c65fc3df	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	20f9497d-ff36-42f0-8b47-64a1c65fc3df	anonymous
40b2dc78-9df4-4053-bd52-271a93679c54	Allowed Protocol Mapper Types	20f9497d-ff36-42f0-8b47-64a1c65fc3df	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	20f9497d-ff36-42f0-8b47-64a1c65fc3df	anonymous
84c6c72b-eee6-4089-b766-22957a6b25b0	Allowed Client Scopes	20f9497d-ff36-42f0-8b47-64a1c65fc3df	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	20f9497d-ff36-42f0-8b47-64a1c65fc3df	anonymous
57e6d300-97ff-4950-81bd-5bb45b3875ac	Allowed Protocol Mapper Types	20f9497d-ff36-42f0-8b47-64a1c65fc3df	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	20f9497d-ff36-42f0-8b47-64a1c65fc3df	authenticated
387c47e4-77c4-470c-97e1-95eae3b2ebad	Allowed Client Scopes	20f9497d-ff36-42f0-8b47-64a1c65fc3df	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	20f9497d-ff36-42f0-8b47-64a1c65fc3df	authenticated
6cc713e3-4ab6-4c9a-b8d0-bff79340ebcc	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	20f9497d-ff36-42f0-8b47-64a1c65fc3df	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
b795cfb6-a22e-4361-9f9b-f20e3712233c	82eee300-893b-4074-9963-29b9e3d07cdf	max-clients	200
871ccbc9-dc95-43d4-829f-8ee6e59fe883	8f5eabcc-fe7a-4fd5-9919-71094d897283	allow-default-scopes	true
8c54101c-cd98-4879-863b-8cf576da2af5	22c3fa7f-c699-4f4e-8f7e-7c948170b90f	allowed-protocol-mapper-types	saml-user-attribute-mapper
82434bb6-3e51-4cfb-85ee-2bf650e81ea1	22c3fa7f-c699-4f4e-8f7e-7c948170b90f	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
e347f11b-bdea-4a6b-975a-2d2fb4bcfc87	22c3fa7f-c699-4f4e-8f7e-7c948170b90f	allowed-protocol-mapper-types	saml-user-property-mapper
5918dc45-d407-47bb-8ba6-1a6aa889ce04	22c3fa7f-c699-4f4e-8f7e-7c948170b90f	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
326f9b68-9e3c-44ef-a28b-55288d2f3c4a	22c3fa7f-c699-4f4e-8f7e-7c948170b90f	allowed-protocol-mapper-types	oidc-address-mapper
2a393467-128a-4222-a6f8-0c4b607c91b3	22c3fa7f-c699-4f4e-8f7e-7c948170b90f	allowed-protocol-mapper-types	oidc-full-name-mapper
2a48b905-7595-44a4-bcc7-a9bd529dabc3	22c3fa7f-c699-4f4e-8f7e-7c948170b90f	allowed-protocol-mapper-types	saml-role-list-mapper
7475cb48-546a-4195-b8e9-4b7ae119dd9d	22c3fa7f-c699-4f4e-8f7e-7c948170b90f	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
5d0c39bf-c4e9-404f-af7a-8f861a2ddaf8	6640a85b-f250-42e6-8399-e861a4ef2167	allowed-protocol-mapper-types	saml-user-property-mapper
442d0554-e3a7-45a4-acfe-07eea3db825b	6640a85b-f250-42e6-8399-e861a4ef2167	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
d2ee6367-8191-4e82-ae2e-0be9a8759520	6640a85b-f250-42e6-8399-e861a4ef2167	allowed-protocol-mapper-types	oidc-full-name-mapper
d07818fd-0415-48f1-bf01-aa4bebddf41d	6640a85b-f250-42e6-8399-e861a4ef2167	allowed-protocol-mapper-types	oidc-address-mapper
4e0b55ca-6669-43b4-9ddc-28942e3840e9	6640a85b-f250-42e6-8399-e861a4ef2167	allowed-protocol-mapper-types	saml-user-attribute-mapper
1c630606-1d28-4211-85aa-fbb83f81f78a	6640a85b-f250-42e6-8399-e861a4ef2167	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
cc60b060-7606-4b40-8b56-39d554acf22b	6640a85b-f250-42e6-8399-e861a4ef2167	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
97fd2aa0-aa17-477f-b967-a7c47eb30a48	6640a85b-f250-42e6-8399-e861a4ef2167	allowed-protocol-mapper-types	saml-role-list-mapper
81976bca-cdff-4e37-8ba8-436a5026c7c5	6d43c666-e493-4551-8865-2364f1041b0b	allow-default-scopes	true
41c64b8a-ec17-4be1-8478-057e6142a044	77c3030a-579a-43ad-aa29-d1a59be9ed36	client-uris-must-match	true
a18dd1a2-f7d0-42fd-a0ea-6128250abd2b	77c3030a-579a-43ad-aa29-d1a59be9ed36	host-sending-registration-request-must-match	true
57b49c7e-ad7a-411d-887e-c245930cf89a	55b40f09-a8bc-44f2-b17b-5be517aed7b6	kid	ffa11c90-5d0c-45c5-8cdf-05b2bdea78a1
581f244c-a2ec-4c26-83b2-0ef8f36f208b	55b40f09-a8bc-44f2-b17b-5be517aed7b6	algorithm	HS256
073a3638-9256-4ba1-957a-90c8dbb75f22	55b40f09-a8bc-44f2-b17b-5be517aed7b6	secret	u9jnUpjr2u5_9SVyMrZ6Y6N0-PkhXb7oUkdxUIPDjqbCC4bPt18PriQgxDTXl8OyT7etI4ag8FR7-sTseWXiLw
dd25058b-3928-400f-bce6-5d9bdcef5fb8	55b40f09-a8bc-44f2-b17b-5be517aed7b6	priority	100
ad95eb61-f646-48af-a3f9-012dad890a99	f7471424-ea6e-4e53-92e4-c63b567cbbdd	priority	100
0866bcac-e0ea-4254-903c-5f785ceeb80e	f7471424-ea6e-4e53-92e4-c63b567cbbdd	keyUse	SIG
7fde0e73-a31c-47dd-82ea-d6f615d6f4c5	f7471424-ea6e-4e53-92e4-c63b567cbbdd	privateKey	MIIEpAIBAAKCAQEAn5AKWKmnfKOG0iX59m/DD0FuzcI6EbFditSCB25jXbPGhf5cKSbFC/DXqSsF1hzEYHAruXg2p052Ym1ZXpP/BsQJ9OCnzmkG47NhzaUi3m8DPApFa03QxZd2A/+OSEDmnYiDDtFpziirnaAgEggdnwQfxzYNLHdCWrPmrM/RJR62Ky4uSaFre5ew5eWb7ePpeaMecpOO7kJFNIqKUraHiMK1RkgZHKAWCtRcfiqIg3y9YUZptclxYlkgHAZD3C/MjPyNB8O/3/AqVN1ot9H4p4CbpYsco64h2o0rtAXBZVYZvsaTy1EfWkb1roivVPSsYVXBh0tVHHERTdyytL+7+wIDAQABAoIBAAhn0bbpL2+IPC2NEcvpO0261RfcJ9717vpfRrJJhTNS3LectkVcseJDjIWjqvakJIKU2VjRFZMrgpHQ0A830KZBZLZ65AKI03OvTkAQRCcsX4k/XHgFbP51UIkJYpKf1WyhdY+URifPSkS1dYfXPmg5rJevKAznNp5vyuXgblR8LyO/Zz6eX0IAW/ZDsOGvr9Ck+hVUms/q+cL9RKd8ObkcuZmx1vVWHCezcCSdCsPWatihAq3QgVZRgB/2itD71ohIpQ6ljVHJg/8cXPL4YRLLfaKkAUO89oNLxessXf2yEgc2/BwHDR3jt8hKguaFzvBerfPAUReJD1OVrdeHqjECgYEA2U1PfOW0wgwwHEKKaRsp4qvLff4al9RYLAwhdBB2QodmuixRB3+13bRHVCRBMVDcB02DKIxLTqse5ck8utDn0p8sOg0T+soV39IHN695s4QKiaEg3XJwV/sWR2IjPKhIUaU5eIxU+qJE93yu/1IrR4dM7wixUitxR9IbDyrcbWcCgYEAu/psITV5jvrd/PeeLQ5NW5Q2ZcN/GCnjNgy/9ZsjQszbSlK/Scqw3VqGozR7I3bCYnInM9e4RhlXeEtaMPUx4qqEBt0R469ItB2Mij3XxwYdYhdGsN7bcf/Nh3i4DBq/M6R+tjx3ed0cS+eWmJdkh10Dk/9eH6nr2b+5HATeDE0CgYEAn0bonY6tiJJwbTZkx5fOgsQTmx03FtThcB/QIYezdx5SMOIs3odAoenzYnxUgLZZIM0y9vSmelo5goqXhgN7+MkNHNvbKjcYA3+qJKntVaTSKIE/WrH4ILT9ZoNLermKkLW/w1lxLGjmjlUI3EK5UGue+5JujuEi3lbl2J89BL8CgYAuWTWWDphVT7eyat9+XntmbCnpd4V70MAsEIK4LTNJgjdDoRl3OVnYijyOOx9thBezrE/MMZFG/3KYv4OSdLKDH+YDxzhk+lAj0PFZGJx+fxx5liGg9KII/riPgY1ntqSUOCfiCRCwZHtYn9Z680EfOyjpsdpkVkJH40TiCrUxNQKBgQDI0g4gAY1vcA+JWL57CIhjyuTCfIoaDduCGCCSoShAaSOv7BeqvsVDWpphij6uKWaQQFNlaQ5ylyxsIe3cNHOB7u//6a7CipCLfYJjjGMfSXTC1anfux97v2RRSrMmEZBvV3Fg1XoUMs4QvVQDN9eP+wRGSaBlxOlHnPXqKt/gPQ==
dcd691f5-2bad-4c9b-a5fa-cdd0844223ad	f7471424-ea6e-4e53-92e4-c63b567cbbdd	certificate	MIICmzCCAYMCBgGCdDL/CzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwODA2MTcyNjE1WhcNMzIwODA2MTcyNzU1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCfkApYqad8o4bSJfn2b8MPQW7NwjoRsV2K1IIHbmNds8aF/lwpJsUL8NepKwXWHMRgcCu5eDanTnZibVlek/8GxAn04KfOaQbjs2HNpSLebwM8CkVrTdDFl3YD/45IQOadiIMO0WnOKKudoCASCB2fBB/HNg0sd0Jas+asz9ElHrYrLi5JoWt7l7Dl5Zvt4+l5ox5yk47uQkU0iopStoeIwrVGSBkcoBYK1Fx+KoiDfL1hRmm1yXFiWSAcBkPcL8yM/I0Hw7/f8CpU3Wi30fingJulixyjriHajSu0BcFlVhm+xpPLUR9aRvWuiK9U9KxhVcGHS1UccRFN3LK0v7v7AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFvIEpqpcUZSC7qtfrzRG4dbwpAYUxsW/mSsZFeVeNV3NZQYtewsqz/MXJSJmqmrcpo4XBY9hh1jMKbnsivvjDp39UXlua7pBaAkBncAZgCRERn5SYQzIC2jqL93uDnuBQwCPR2RDqH4u1xw636cFNOucOguupQELRwk0iF573hkSMQSAhNgAh9caBx/J2GP7++UO0WNericK8VuiWy6V7xFSUHwrU4mrWmprkvQyBHVZcWFlADCHx7O5HJfeMM5ahBi+eZNZUpf3n10uZvGnCP6AQ1HuHAe15y3whAc8fFIA1Twxs929YvCZgAAJAyl+2jBCFS43hx1huYGmG3rRLo=
30f2437b-ad66-4774-a189-bf1a24efb0a2	df464600-c066-4731-aa46-901d2ca59eae	algorithm	RSA-OAEP
61aa9c2b-a722-4c26-be44-453648b5791c	df464600-c066-4731-aa46-901d2ca59eae	certificate	MIICmzCCAYMCBgGCdDL/iTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwODA2MTcyNjE1WhcNMzIwODA2MTcyNzU1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDGQw5QaGEPLZnJqXmJO3MsWrtkCTqAjc5V3XHId6HNdvOE1dLiDyeBKVJ5PtthAxg3JTB/LyxTROmCgULCngzhQf/IhqAx+bJcxtpa5m1w77iuGJ72uit007Y1xWta7EvmYOdgNPA91EJTQY9IjfASFtqN4uJ+cSzkzz5eA/vrzer2Pr818etBDve4J/eg3T7/kDtDm9IJCKJRCsE9VIjjNc8lhFtKdSqggWGKpSm2YfDsCYbsSM7Z+8pln+uFar64T57/wnyd/Ipww5mgGPgjn7KuqfXb/vdy8NMfMyJuNnbhi/enjQr8il2fElS+JGlw7QhEvVJDQlBms7BSyn0hAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGJUBtNlQPyqBS2XSBFsOygKftlRnKsE2m0VjDUrIKQx0BOfCJ0FgJaBSa6gXURvP56IAKDD07hiGj1pklBjeRoziqbGsfMYPagb7ShiRJ1GOJmN96DxjEAG3b3iBi94Gn9bnTuClo6UmwZX0hHpR10s/zFk4W4pPTMJ18j/R65VxdGFBC3Zr2tug+AJ6cDdL5g6Nv9oeT0rqNNh6Mat4EYNGqPFzHY9pwShaMeYcQGsywbKSHg7cA0ULRrR1+CXoyBeRwAyoxm9T14LgS/cR4VLy4H9QYITW/9ifasaUkk4pnTQTILmgNhhO3OoDM/zJwrHx3fRxSG+YSGA6rRL4XU=
4fcaa801-b3bd-4402-92db-1dfec56725de	df464600-c066-4731-aa46-901d2ca59eae	keyUse	ENC
955943e4-3aff-485c-9729-6d5bd0971be4	df464600-c066-4731-aa46-901d2ca59eae	privateKey	MIIEpAIBAAKCAQEAxkMOUGhhDy2Zyal5iTtzLFq7ZAk6gI3OVd1xyHehzXbzhNXS4g8ngSlSeT7bYQMYNyUwfy8sU0TpgoFCwp4M4UH/yIagMfmyXMbaWuZtcO+4rhie9rordNO2NcVrWuxL5mDnYDTwPdRCU0GPSI3wEhbajeLifnEs5M8+XgP7683q9j6/NfHrQQ73uCf3oN0+/5A7Q5vSCQiiUQrBPVSI4zXPJYRbSnUqoIFhiqUptmHw7AmG7EjO2fvKZZ/rhWq+uE+e/8J8nfyKcMOZoBj4I5+yrqn12/73cvDTHzMibjZ24Yv3p40K/IpdnxJUviRpcO0IRL1SQ0JQZrOwUsp9IQIDAQABAoIBAET+2wFigbx9exJx9wip9rfNz37Ns10/fDnneYxxDY7qQW7N1riy22WYksn89O163Td7qrfoG73SsoynHSuLQyI1DKWlLCSYJ9kfnqeZnyZ5VkTH7rIgMbVTZAqsbGLU7sj6miqh4aUys+4zV4DBXHV/HInaFkY4bo4mDSc8rbPudXBR2regxPRl6py6phypytj9D8b0LFzrfDN2eHmIEB/PzsKI/9rRURJWjMklIjEIwKuyoPQsut2DuaSZGfR6lpSCmEX8dfGyta/Kxf8jKwM6ZfuJU4HL0lsjZfycA9n3NiTOGGrHmss788+gB1lAr8cCWmyEWQIKAZv7QxxKOR0CgYEA5BTz8aafCEgk5KJ3bGL4kYxf7rx1Hclj7fbKL0qf7hCJ8PkueGgtCjERSmoA+lsBLxOMS1uT3koiv4lbdwZujlp7zXPiPh4wj3yjnHa3UBlN3hD0/+tNJX6yPbqBRmwTjhqIm7D4IVxoF/x+B0BB9oUwGD75f8WnhycWTsFVIi8CgYEA3oeux8BWFD8dVli+GuQY7CRWMiZff0RwIIN75JhOu+RflDL18e1Naix52rhSErW24DblaY4ENSFhMgIepPI7w7jm7N8wJywzHnlSiSf5/s1dhjOY17BAFy1B0JpnkdYUOeuGLgLQ+BiLE2jdNPlYA+mo9tCbkJkGtv9VMc0dEa8CgYEAg4/egtaUx2ct+MAKWPfh37r0HzaP68WeIcaIK61FAUKC/wANISEeUdGp4p2wwLi7vxbshw9lBQUIdClcHBUWsoBZB1K//wrVAf9oNLl51fcyplRrri9hSa6CS/8H0MJIqWB+yifTiRLPbH6Vh8M2CWgcLPAuZNhzYQ9X28fDPrsCgYEAilsb/VAFdQMkz2nPkNKe+DtDaFzZZTx85oo5fpB/62x7TJ4+slNTnZ7XiHivdriKYm9fRbipvwro7nnI6c89/1u4IDBINSLTCbBu853qXlT7QBRWhEwuHPrjf7pwiIjs/HIGdBcGLCq+VawOVQBui8g8aHCdOFMcjKzGIHeiCjsCgYBgETJLRaH821ohmkLhxsmyrPzvpBOAXnfYSl58LGfD+w23oRZkXvWzcVJE8jv7dTk4u7eAr1H0/lWbPpkas8FihpNKL1u/R7c97P9uSPYoBZ3DfxYou3zrR2B5OmsaInTP8BZfsO6eCyDq/CgbRyLeqvL2WV7WLHXYgkLc8w9biQ==
1c55cee3-a3ea-444a-8f97-64e367a94b90	df464600-c066-4731-aa46-901d2ca59eae	priority	100
928529f0-5be9-45e7-8339-2c01fda40294	44c30334-c027-4165-a1c2-3810836a57a0	secret	vq7322NnAAHydw9lmatyoQ
115af81c-bd9a-4cd9-9c48-d0a9156a9ac6	44c30334-c027-4165-a1c2-3810836a57a0	kid	720e2ad5-1f00-4448-a0b9-027dcfde6b29
40883bca-459e-4829-aed8-f76d09c913b1	44c30334-c027-4165-a1c2-3810836a57a0	priority	100
ba92c60b-25c9-4373-b174-865f5f232554	004e126e-b5e9-4c20-bd99-3c9985c22b2b	privateKey	MIIEogIBAAKCAQEAxDVOUC6ENcPfoDAM1cUpCxerDGZT/+yfCU4w/4BuNVlbWQuvFU+aPKWt5s7hBgi+2taL5OG/3Kc/PKiOCv8nLoSiMZnau4VvqRleemn1zSf+r+0Dy+1x9XzcTUEAxxdQpUeVBlxwtO4b8PgiHT3QPYwcNNdcFH9AbK5eq/LeV/AicrRkZfUuuvccn061cJ1pROleoGMWwP0GTHP10B+JS09a1eR0niXmdVzvukE4wxF3Ykypw9QOGwma6NIyeeQiq4MfLY9aAEEHae6V0PyzfLehYyxHJiK9ed1rOwhAuxM1nphGL/9hZ2GDHbx0Qq98XsAOvmn7HGgr/o4qhsdTAQIDAQABAoIBAA2SiBIKVwlsElGfo/JRTYtE+MdRDcb34dwa1/oDSDxcVnIPWZi5Cq40IhaDoYkRZ6MLhnOk/RNg+1dxa8VNd0hOaEoo6SVMb+1Wgf9S9JabiWXh2JUi80gxZKuFugLLn//ANvS7cMLHRNCzWBLF65wnpMIv/TXgGT9bWX+opiJBglTi8MD+jtpLbYLKb/sf0YeeKy3j1S9fMlELeFXAtW1s7C7cHKOAwbiW8Ld8DpgGRdnS6ncITAgHq3SQWBJYP+eaj0MJb+mukk8N2ra4bpeiudzlvTAQZpALw8LRL6GhMCI+qZU0fRv+GBosvsCz/qaaKQNDyhynxIy674HuywUCgYEA9HLqF+WJdRwAeHGANV10eHYO+ptN6+ZBnrzljzu3jZ49voprHxdKINZVON06P/P7vLEKnrVdcJZbpYZ/yuAXhedwsrmOeqengZu9I+BWc3ah57TnucmGYr4rdoaLWSrFxl7hOVsCqZHu87Bpn1sTlqCdwMqZQm9rtX4rx4W/d6UCgYEAzXrTpC3TbQmpMxm2CwT25mIxyLmr79Y+pKu0SgWSynz6tLwiBKRMlKztOOJR5dqlJ6Pm6JbnCuZww+OyD6hZqytRs15ls6CSLqIFISzJNLZAe3VcCx3PxuO2rC3siJxy7MU3QoXvaA63B2je/3UbkbhPOpxxzsgu3VBX+6AILy0CgYA3lG0/c7Q2SWCeAgiJma8iuI0dU/R6n4bqBb8YOxa3/3PAgA5tKklzf+gunrZg1iO1undUsJ4HPFioIRWrVhpjGsVYDbKklrwSTwvJPXfKlv2nBk3twzFoAB83us2yP3RqbyY8eUH4tjKje8f4MKgahnh33ljMbzMJOB/SJMns9QKBgAx3Ty++t/z9gQ5gmPLCMlh3zJ1o5k1+qf5DjISRIf625l7gqw+tCBhdBWdWE7HmOe7VusSRoyK+KEk6HytkA0ynLCW9rF3hd/zsR3NjzDEufWsAC72A6YIffo2jm54OH8rNjDS0+3lMqz3/1seYyztj+yqLIzxwWKeEoFHbu6NhAoGAWHgdloKBgWrTLfpGdJAC4UN28WEWXui2exh7n8O0iDdj79liYSvSQkFoF+Tbk+tzeV+p+6gC9zKaSu8VudsB/KSCxM3AtZUr9cYi+3a/sf59hkm2/3jlJdkIVh1R+AB5O3+0cddmVMBGy5cCrBovNZ7LaXVGS3rdnbZ6MIw0tB4=
6b945a1f-c176-4f4f-8855-a219aa818c38	004e126e-b5e9-4c20-bd99-3c9985c22b2b	keyUse	ENC
686c3b39-fc5e-48e1-9f3a-fddfd69b8e8b	004e126e-b5e9-4c20-bd99-3c9985c22b2b	certificate	MIICpTCCAY0CBgGDEEwUyjANBgkqhkiG9w0BAQsFADAWMRQwEgYDVQQDDAtyZXN0YXVyYW50ZTAeFw0yMjA5MDYwMDU0MjVaFw0zMjA5MDYwMDU2MDVaMBYxFDASBgNVBAMMC3Jlc3RhdXJhbnRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxDVOUC6ENcPfoDAM1cUpCxerDGZT/+yfCU4w/4BuNVlbWQuvFU+aPKWt5s7hBgi+2taL5OG/3Kc/PKiOCv8nLoSiMZnau4VvqRleemn1zSf+r+0Dy+1x9XzcTUEAxxdQpUeVBlxwtO4b8PgiHT3QPYwcNNdcFH9AbK5eq/LeV/AicrRkZfUuuvccn061cJ1pROleoGMWwP0GTHP10B+JS09a1eR0niXmdVzvukE4wxF3Ykypw9QOGwma6NIyeeQiq4MfLY9aAEEHae6V0PyzfLehYyxHJiK9ed1rOwhAuxM1nphGL/9hZ2GDHbx0Qq98XsAOvmn7HGgr/o4qhsdTAQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQABsoWde+0USX67N1R4BTBqKXibt7JiQ4P4alaTK+KCpP9qwr8+p2oqtWS57aar7qjSlObl6dZOafnEpJ5PLlNsaIzW+BzRqk43hV2Ze6wwh0XQmqt++hIhW7M1wqhVRwWiN6C5it6ZBwCq/hcLcErYYxUfTwmLpLZmvOYvbx2gd8wFmw6GjJtFoFcOLJW3vHUimNiF14qWNsZEE58gf6r/hlZI5teiHYISv5geMLJQm2UkmBlAsjFALr6Dz4B+K4CjZi4V98bM02QBOvT5haoa0+kbwlAu8qJMfl+kiXub2QSk9de/aIMGpYSofEBittzBr5MQan1Zetf+yMwyqFfd
a371bf7e-2945-4fd6-b9e9-deee741555cf	004e126e-b5e9-4c20-bd99-3c9985c22b2b	priority	100
40f34ee7-58b2-40b2-ba58-69256c1ddd7c	004e126e-b5e9-4c20-bd99-3c9985c22b2b	algorithm	RSA-OAEP
bf55f0a2-f382-4821-a88a-be67bfbd7e20	2a0c3af4-75e9-4ebf-890c-f5c2595d2310	priority	100
1499a58e-f65f-40cc-8da9-b42934419b3a	2a0c3af4-75e9-4ebf-890c-f5c2595d2310	algorithm	HS256
eb6215f6-2310-4bf2-8206-3e35a005d617	2a0c3af4-75e9-4ebf-890c-f5c2595d2310	kid	145a628c-c9d7-4656-8afe-0d295abfb0c8
901b3319-1b35-40d0-96f3-e8e7005dbae3	2a0c3af4-75e9-4ebf-890c-f5c2595d2310	secret	oV_wfIRriwifWiMv7ureIUnw-g5myGBPJHLXsjcYtmSGwNoXqc8CdIkO0EY_Rm1zdfQlk_ZUe-4yS8nrK26kAA
705eee45-f3f1-4608-9f8e-51660132a8fa	cd8e95f6-45fe-4cbc-b168-ed52df14bfa6	kid	c62261b8-cea1-452a-8d5d-13cdc100c31d
05eab830-fc6e-4dd5-a716-069761a8fb27	cd8e95f6-45fe-4cbc-b168-ed52df14bfa6	priority	100
4f5bfb44-aa68-41fc-8e35-685a37d784d1	cd8e95f6-45fe-4cbc-b168-ed52df14bfa6	secret	hgAMz4nn-lUrhXhQ6Qwgzw
8c611543-acce-4a59-9f5a-49fc81c4a512	17a14de0-7ec3-42f1-9d52-397c89436020	certificate	MIICpTCCAY0CBgGDEEwTyjANBgkqhkiG9w0BAQsFADAWMRQwEgYDVQQDDAtyZXN0YXVyYW50ZTAeFw0yMjA5MDYwMDU0MjRaFw0zMjA5MDYwMDU2MDRaMBYxFDASBgNVBAMMC3Jlc3RhdXJhbnRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxQlaVSdu2KINgRuG23J1K77qhBl9ETMsZM36/RAKjKdFyhjyMLxHbjp4UQTiwhGP7on+CjMsvSg4hQFKjOu6twzFukdYmhNjfaudtHYhCjIrbAj+OJ+Oxph/5vgg9EBgGNeVcRs0rzDLls6x1Uv2fH4aLABHikX/2vC0RV7PJtRnc1TD1n3GL0MGJXihbX6Z0/+xqXPW9tagdPppClVnj5IPGgBa9pb4j42hKMjqHw/UvhzESyY2vxE79SUkaoETFmjsdA4ieM6v1geXtQfSzSCuGUh1PxfqQOVZkZ6xnwOz550rcDmzl73Wmnp/P7cXpglYFVfpXzM/I03HsLX2kQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQC9lm53iZJ99iOPBRH64hJg2WfobT8DgHxss55AWJbyeb8hYy2gDBfPFMaXj9dO6zVEkF4hQQDIqXfGHGmc32N4E41NGLwRw7C0O/cG4JGcMv2F8y+8ppcxp5IYoE85DOHcJ3sbMBwYjC6QjHo/YVg6jNwwlJvfXVEu1hYtpMVChfZtSetV6/GYCVZHOhBGzGY1ONJ+Q/H3qE++hnG2R25cvlMTvrau489zTFXa80NISqbs2N/nf0+mCgMVVsaTRet2KMMiJlbEtnjfHGsT1zwrtsQKUibX4Ol9RzqyZzB4ZkMsJvyZjJTqRw1W7T6w2eW4YVq5pHpEdX9GdvRdr7TD
9e48ccab-3828-4e53-957a-1ea8639dcfe3	17a14de0-7ec3-42f1-9d52-397c89436020	privateKey	MIIEpAIBAAKCAQEAxQlaVSdu2KINgRuG23J1K77qhBl9ETMsZM36/RAKjKdFyhjyMLxHbjp4UQTiwhGP7on+CjMsvSg4hQFKjOu6twzFukdYmhNjfaudtHYhCjIrbAj+OJ+Oxph/5vgg9EBgGNeVcRs0rzDLls6x1Uv2fH4aLABHikX/2vC0RV7PJtRnc1TD1n3GL0MGJXihbX6Z0/+xqXPW9tagdPppClVnj5IPGgBa9pb4j42hKMjqHw/UvhzESyY2vxE79SUkaoETFmjsdA4ieM6v1geXtQfSzSCuGUh1PxfqQOVZkZ6xnwOz550rcDmzl73Wmnp/P7cXpglYFVfpXzM/I03HsLX2kQIDAQABAoIBAAmMWdsrS2b2WGzvoG4BOo4dhPgUk5/aIN48MJvjk31MLFi+M3ta3mPIM9UqRVJV/0l2GLBWGUaL3MxOOxZ/5GcTOIA9zZx+0MkR4FUyzchUlM/aEja8fbLgSD9xOgiYF4gQp2ppIPkV5mHHH61ITngrNLm55D2eRYcut6+uZ9+34LRr7n8zFqDUtZAkQVK+9nFHb9MJz+6E5k8Uazvjpmaq7HBMAGxsNW419uCdalZV7VrLpXOM3oIKrXb5XPuuAqnvAeXpMujuh3//lCsr6F6jLdOkhHsKmzTUcTjM7O4NmyY8I5FS6eGyFclo+MVjsYuW0gF+IGOCXdxQOIzo60ECgYEA9nw2z3xzW5YXjVm+/iCDSQISMis8WLb6qiJhkA2bqR/r3g9DiNGurHkTVRSJjsgMywo5nJ59HzXyLjiEE121YuX3pb/i1KTkrAnFxqOvmMJm8iuUfAgrvR4m9yeq66TA3On3cOv6z6uQZ+Uy3TNhzxZvPPj3XSuhbN5mjzzgyPECgYEAzKR7rXeBico4/gWqoKaQb1IVY/eue413wrHwB5/IvmaDrD49mql0xJpR8iehVElgv8mhlLNgII+Qpkjmg3qvRDg/ZMHDjmJQAl1nsuuiXMKRT+23MBfzvlh3gYTabxL5ewUpNKFTj0kmrEM4Hx9J9AfzNcbfNkr8WEj8y0dpB6ECgYBC9gO94kVEgEXttI/aYeLIlrNyxaQjRbJbPfPbOpcrHuzo6qSiKrSVTl8eIfIsw9QV5LU6AyRisjkUrW3UBQUd1POuJ67rrdAhnJYKHLW7fjSRXZ19BIs9WU+knTYlxiBO45DBMJp2iFk2oGFtDmRn6eRWYBxzR0MXXGPoTdWTQQKBgQCyNDH3NvA4+z5yBqE1UJbKOeKisRbiRKkbhDQPj5cSJtdW8MRYoGQsqG3fv57/dP6pRH5OrX1yHVLLWwRRTk69y3V42jrfDMG7rXcWGZfDyzMbNVimqtT41rUKtpQ40X8rH61oRWwshHkG3WpLv8V4mkuycsIB136zqqtooYDWwQKBgQDwpu/7xQpNDlZjNmWrKlyRS09nf979lDCxbF9TAPNEct6HyhRXFpYp/IzdiIIwmJxfYC9HFLeXFgX37Jc1VY5O14JbnLMtePXKNORtutEmpPrhi6evWyauH5EAfdCHjFsKinp/5m5gBT1kFWwrFiYpPof5VlFfsJHlKV2gUka+Wg==
b54b01be-c98f-4182-9677-a72585029685	17a14de0-7ec3-42f1-9d52-397c89436020	priority	100
afc1cb18-fbba-48ae-8b2f-ff5432353d18	17a14de0-7ec3-42f1-9d52-397c89436020	keyUse	SIG
7cf5b0b8-54d8-477a-ba75-b43d03fe1f21	932e2d59-3901-42e9-b7c5-2ee68e450db8	max-clients	200
71085d52-ca57-493a-9c28-7b5a6f7e22af	84c6c72b-eee6-4089-b766-22957a6b25b0	allow-default-scopes	true
f6d5efa6-58ac-4bb4-8514-ef78ee349ea8	40b2dc78-9df4-4053-bd52-271a93679c54	allowed-protocol-mapper-types	oidc-full-name-mapper
99edf6f3-5823-4bb3-9226-0457a3970f9d	40b2dc78-9df4-4053-bd52-271a93679c54	allowed-protocol-mapper-types	oidc-address-mapper
eed85193-a5af-4460-995d-c5c3bc5da70d	40b2dc78-9df4-4053-bd52-271a93679c54	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
066c1a9e-7daa-4256-bfed-7107fca1a182	40b2dc78-9df4-4053-bd52-271a93679c54	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
bef569f1-a4f9-44dd-829b-c957bd382ec5	40b2dc78-9df4-4053-bd52-271a93679c54	allowed-protocol-mapper-types	saml-user-property-mapper
35aa8f17-2739-46d5-8d15-2685bf9f81b1	40b2dc78-9df4-4053-bd52-271a93679c54	allowed-protocol-mapper-types	saml-user-attribute-mapper
f3750d14-a1fc-4266-89cf-8b9a6c91fb84	40b2dc78-9df4-4053-bd52-271a93679c54	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
6f736074-196c-44f7-95a6-ae75987b69e0	40b2dc78-9df4-4053-bd52-271a93679c54	allowed-protocol-mapper-types	saml-role-list-mapper
e9d4c7ee-6782-4fa5-84a5-d6016985df31	31dbcf28-aaf1-4dcf-9e08-3bcb2fc8dacc	client-uris-must-match	true
a9cbb817-de9f-4200-8947-56dbbc153fc8	31dbcf28-aaf1-4dcf-9e08-3bcb2fc8dacc	host-sending-registration-request-must-match	true
2ac0375a-d028-4cb8-88f9-fadb14cd2097	387c47e4-77c4-470c-97e1-95eae3b2ebad	allow-default-scopes	true
50bd88c8-81f5-4c86-9825-c383cbff27f8	57e6d300-97ff-4950-81bd-5bb45b3875ac	allowed-protocol-mapper-types	saml-user-property-mapper
796d2989-ea07-44bf-8780-fa50ea1424d0	57e6d300-97ff-4950-81bd-5bb45b3875ac	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
cee8fdbc-2a0f-4b9e-bc65-6592c42289c4	57e6d300-97ff-4950-81bd-5bb45b3875ac	allowed-protocol-mapper-types	oidc-address-mapper
bcea3f2a-a09d-40a6-817a-c2cada50ba7d	57e6d300-97ff-4950-81bd-5bb45b3875ac	allowed-protocol-mapper-types	saml-user-attribute-mapper
fdbbcf1a-a7fa-4423-b699-a67cab0dd30d	57e6d300-97ff-4950-81bd-5bb45b3875ac	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
fa237907-ab9f-457e-8cf2-175e4fadf2bb	57e6d300-97ff-4950-81bd-5bb45b3875ac	allowed-protocol-mapper-types	saml-role-list-mapper
46e6038a-c256-478b-90cd-9cd1919ca7a1	57e6d300-97ff-4950-81bd-5bb45b3875ac	allowed-protocol-mapper-types	oidc-full-name-mapper
a414aa71-7b61-4175-b155-76ff34d2815a	57e6d300-97ff-4950-81bd-5bb45b3875ac	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.composite_role (composite, child_role) FROM stdin;
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	bc55ab87-92c1-4eb3-9b50-8a5923fd4e04
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	c7a46b1a-d191-4177-a10f-f4249ae7d8d3
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	65d69fe5-b43c-4459-830c-10130c848c55
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	97971fd2-3f7a-4109-8847-78fdad7ede22
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	aaff896b-ac2a-4b4b-90ae-b8dc6bcff53e
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	73ddf090-2cd6-4ea8-893d-9978f1979da8
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	f04acda0-d227-4365-93e2-7aae53d83c46
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	4030189c-9846-4b90-9d9c-5496aa0e2dcf
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	224cf3b1-5127-40fa-a856-daa21d0d0687
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	b840df63-dab4-4f97-bd46-2a8d28b79c87
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	719af698-d31f-4068-b84e-fdb540d1cac8
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	adff4f17-1077-4025-ad58-7d146d86ebb0
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	810f4023-c0f0-4dab-8b96-7a15705e260a
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	4636a454-6f30-4084-b17f-55c1cdb8b5ab
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	5432db93-be9b-4a10-aac8-c8bd58938946
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	0293c7ce-7682-4127-aaa2-790018b2646b
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	a7b09324-3537-4514-a8b0-397421516b6d
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	e312fec5-b738-4338-8135-b6fb576345c5
898a1703-ee98-452d-90bd-e1c9ed9d996b	ff300f33-4eb5-4eb7-bb36-82715c1fb06a
97971fd2-3f7a-4109-8847-78fdad7ede22	5432db93-be9b-4a10-aac8-c8bd58938946
97971fd2-3f7a-4109-8847-78fdad7ede22	e312fec5-b738-4338-8135-b6fb576345c5
aaff896b-ac2a-4b4b-90ae-b8dc6bcff53e	0293c7ce-7682-4127-aaa2-790018b2646b
898a1703-ee98-452d-90bd-e1c9ed9d996b	f191d84b-90c2-4dfe-af43-d7c93ee914e9
f191d84b-90c2-4dfe-af43-d7c93ee914e9	b8b98f8b-2a2a-4a82-8dec-e3eb2cd50230
5faf21d3-3fb3-421e-9783-88f117e3b38c	8e0d1d0e-fcb9-4c07-986c-6f1ebdbda4eb
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	84e75dde-e28a-47e1-bfc6-5035ee894e98
898a1703-ee98-452d-90bd-e1c9ed9d996b	baf975f8-a586-4994-81a9-edfdb92e05f2
898a1703-ee98-452d-90bd-e1c9ed9d996b	27caaa2c-8e57-45ca-8772-7295f64a5257
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	07421ae9-50dc-4d65-8508-85077f46cd51
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	bb2b004a-13bf-4490-baf9-78b312a521d9
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	239d1d24-776e-41ef-b465-9d62c1b638eb
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	6417d1d9-7ccb-4eee-a959-012d96a4ff41
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	bce7221f-582a-4e6b-a87e-f77a4d7bda7d
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	15f5580d-e0e2-4621-ba7a-4ac1e2791e5e
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	946ab484-e473-458d-a623-8b61153f46ba
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	8f011b19-591f-4734-96e0-5522aa6f4a58
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	74756c0c-63f2-47bd-a215-7b564d301a2f
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	47d35844-019e-4945-9828-88815472c190
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	1f268a66-ef23-42c8-bb7e-4fd547830d12
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	abf13058-0b9a-403d-952d-ebed1b0b1f3e
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	e1b50dfe-56c9-4944-941c-5c81498944b6
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	ec626861-0e4e-48b1-a11c-8b06706b0970
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	5ec3243d-0761-4aee-9499-39a77f882b8c
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	6264cb1a-e26e-4727-a9e8-cf2a2a386410
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	39af844e-0961-4d0a-b3ad-716c6ab1ea6c
239d1d24-776e-41ef-b465-9d62c1b638eb	39af844e-0961-4d0a-b3ad-716c6ab1ea6c
239d1d24-776e-41ef-b465-9d62c1b638eb	ec626861-0e4e-48b1-a11c-8b06706b0970
6417d1d9-7ccb-4eee-a959-012d96a4ff41	5ec3243d-0761-4aee-9499-39a77f882b8c
f114dee8-a2ee-476c-8243-f2006304d177	6e657f01-3623-480d-8a18-9335e44323a5
f114dee8-a2ee-476c-8243-f2006304d177	3498a436-2048-4690-acba-89fb5aefb45b
f114dee8-a2ee-476c-8243-f2006304d177	04d30821-8da9-41c0-b7cd-91e669baecbb
f114dee8-a2ee-476c-8243-f2006304d177	0cd693d0-6556-4a19-9faa-6f352024b5db
f114dee8-a2ee-476c-8243-f2006304d177	1d5353dc-ce7e-4008-9a7b-11d60540df7c
f114dee8-a2ee-476c-8243-f2006304d177	991482d8-0dc7-4e88-b259-404a743dddbc
f114dee8-a2ee-476c-8243-f2006304d177	49163e9a-4359-4d8f-96fa-5d5b48181df2
f114dee8-a2ee-476c-8243-f2006304d177	45df5603-6a79-4969-8716-f6501139ca23
f114dee8-a2ee-476c-8243-f2006304d177	5b05d666-7816-4fd7-9165-c5f9e3b6df8f
f114dee8-a2ee-476c-8243-f2006304d177	e29a8608-5c25-43cc-bd63-9bdd091dee4e
f114dee8-a2ee-476c-8243-f2006304d177	84c1bc66-5b33-44a4-b699-1909d2e4d4a7
f114dee8-a2ee-476c-8243-f2006304d177	ab082486-86cf-478e-a4ba-2e19437cacc3
f114dee8-a2ee-476c-8243-f2006304d177	ed861dc0-f313-4724-8b53-836b7e26da1c
f114dee8-a2ee-476c-8243-f2006304d177	705d3c1b-0e43-4b85-b9fa-712ce99476e4
f114dee8-a2ee-476c-8243-f2006304d177	714b33e1-0d58-44cc-a937-539aa13a72c1
f114dee8-a2ee-476c-8243-f2006304d177	3b163124-5127-42a7-b483-b7bde90e66ed
f114dee8-a2ee-476c-8243-f2006304d177	b2e1e8db-c42e-4f19-a044-f49610972d2c
04d30821-8da9-41c0-b7cd-91e669baecbb	705d3c1b-0e43-4b85-b9fa-712ce99476e4
04d30821-8da9-41c0-b7cd-91e669baecbb	b2e1e8db-c42e-4f19-a044-f49610972d2c
0cd693d0-6556-4a19-9faa-6f352024b5db	714b33e1-0d58-44cc-a937-539aa13a72c1
de7d57f4-9f04-4ff5-9b8b-233ce7db79fd	0ba97173-b46a-401a-82c7-e835cd9081cc
de7d57f4-9f04-4ff5-9b8b-233ce7db79fd	b4eb8170-5a54-4b95-bb98-c6e4559ea51f
b4eb8170-5a54-4b95-bb98-c6e4559ea51f	43f54114-d9c6-40c5-a27b-2081311aeeae
d0971eb0-23c7-46c0-9d20-ed731b47145b	14c342b1-29de-4a44-aa1c-c26f8c60baa0
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	b3b2f647-79bb-4b94-81c9-eecd954a0379
f114dee8-a2ee-476c-8243-f2006304d177	d3ad4bff-c6a4-4fb7-8df5-f0a5985d3cdd
de7d57f4-9f04-4ff5-9b8b-233ce7db79fd	5e8541ee-9981-4069-b562-b8de6d38be18
de7d57f4-9f04-4ff5-9b8b-233ce7db79fd	ae2ac03e-45b0-44b7-b0cb-58159fe066e8
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
19949de3-d015-4b71-829d-3c3704b0acd2	\N	password	bb80b78a-c792-4041-9eca-3b7403da810e	1659806877409	\N	{"value":"/n02byFyMe8LJaNPrARbJrvL4DhUD2yErGIxokvHNgwfa23d8RTn6BdoBRXViFO6d9rlOAsiD+S8okO0q6JIVQ==","salt":"gGDppGNQIIMkPMKtLS6RqQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
42fca680-7e28-4e75-96d4-2de1fbf96961	\N	password	43d65449-f8f4-46b9-a761-f3bdeb77c06e	1682078554263	My password	{"value":"qS50IZhAx/Bm4ag509W3zhoYO3cCOT1uy4mLRNHuDBv0cPFwhpP4ERYMjE7JJh937SeYfFuSbuVFyf010/rZUA==","salt":"G3Cm7GXX28HIpXBXeEqavQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
3a674fd3-e2e6-4688-9b72-24ce6ec47169	\N	password	c7403070-a343-4f59-bc3b-2bc396728f2c	1682078649472	My password	{"value":"Jvxn3ozac/2Z0ZAwtmKN7zehJORLNGu0LE1u+rJYROO5RlLCLPwdQbyhI7R4NKZatahSOBAshAWnjuhYQVpAzQ==","salt":"vOMD4tcIPNsOc9pGcxdBCw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
5d891842-c3de-44be-8591-7a37e1f8b677	\N	password	2800183b-b9e5-4b18-b42b-a1d1a773deff	1682078432453	My password	{"value":"qASvHcXB4oGAoWmz48zSEUrAcSD89oC11kmXlRq4N9AOpYvv/5yJEiVHPG60+S/jn0mmxvshu9A2tSNbeFO/iA==","salt":"dBzlj11gko9CC3XSn01lsg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
622364c7-86cf-44e0-8cda-7ad58427d0af	\N	password	8309bca3-1d02-468e-b172-94fe14b23d37	1682078792582	My password	{"value":"1926TowD87Mp9V65i3Eq9+MhfzytRUdLDMHX4RPuQtm5Ddzv+nf/FY3rrfh69uFWloOCMFj0c9FiG0i22sDDCQ==","salt":"LZdqep2vUU+axS1+281KYA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
182eef81-7654-4627-bf6a-5ec6ce64638d	\N	password	a11a4856-4b65-4249-b092-f73e613a930a	1682079116102	My password	{"value":"kCMaCgjIOphBq/+A0HzP/3sbSVAjg1GxT+f7JqpaK1uX6YJrSXLnMxypI1tgPaPdg6clkTkwkVZocQ3WKEwyjA==","salt":"ox7d5FcwwjnueJhokBZ51A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2022-08-06 17:27:52.636746	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	9806872223
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2022-08-06 17:27:52.645345	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	9806872223
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2022-08-06 17:27:52.686482	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	9806872223
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2022-08-06 17:27:52.691543	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	9806872223
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2022-08-06 17:27:52.790187	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	9806872223
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2022-08-06 17:27:52.793215	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	9806872223
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2022-08-06 17:27:52.877216	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	9806872223
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2022-08-06 17:27:52.881008	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	9806872223
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2022-08-06 17:27:52.885649	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	9806872223
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2022-08-06 17:27:52.985024	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	9806872223
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2022-08-06 17:27:53.038431	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	9806872223
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2022-08-06 17:27:53.041507	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	9806872223
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2022-08-06 17:27:53.055855	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	9806872223
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-08-06 17:27:53.082302	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	9806872223
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-08-06 17:27:53.084977	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	9806872223
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-08-06 17:27:53.087518	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	9806872223
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-08-06 17:27:53.089963	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	9806872223
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2022-08-06 17:27:53.133047	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	9806872223
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2022-08-06 17:27:53.176168	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	9806872223
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2022-08-06 17:27:53.181757	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	9806872223
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-08-06 17:27:53.773384	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	9806872223
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2022-08-06 17:27:53.184563	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	9806872223
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2022-08-06 17:27:53.187354	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	9806872223
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2022-08-06 17:27:53.206185	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	9806872223
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2022-08-06 17:27:53.211938	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	9806872223
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2022-08-06 17:27:53.214817	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	9806872223
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2022-08-06 17:27:53.266328	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	9806872223
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2022-08-06 17:27:53.358171	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	9806872223
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2022-08-06 17:27:53.361514	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	9806872223
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2022-08-06 17:27:53.44559	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	9806872223
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2022-08-06 17:27:53.461541	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	9806872223
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2022-08-06 17:27:53.480799	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	9806872223
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2022-08-06 17:27:53.485128	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	9806872223
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-08-06 17:27:53.491096	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	9806872223
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-08-06 17:27:53.495334	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	9806872223
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-08-06 17:27:53.525926	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	9806872223
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2022-08-06 17:27:53.531607	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	9806872223
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-08-06 17:27:53.540862	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	9806872223
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2022-08-06 17:27:53.545843	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	9806872223
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2022-08-06 17:27:53.550938	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	9806872223
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-08-06 17:27:53.553394	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	9806872223
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-08-06 17:27:53.555918	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	9806872223
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2022-08-06 17:27:53.560104	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	9806872223
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-08-06 17:27:53.763655	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	9806872223
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2022-08-06 17:27:53.768375	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	9806872223
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-08-06 17:27:53.777334	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	9806872223
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-08-06 17:27:53.779476	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	9806872223
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-08-06 17:27:53.81904	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	9806872223
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-08-06 17:27:53.823523	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	9806872223
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2022-08-06 17:27:53.878048	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	9806872223
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2022-08-06 17:27:53.922623	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	9806872223
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2022-08-06 17:27:53.926917	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	9806872223
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2022-08-06 17:27:53.929655	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	9806872223
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2022-08-06 17:27:53.932285	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	9806872223
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-08-06 17:27:53.940576	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	9806872223
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-08-06 17:27:53.945341	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	9806872223
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-08-06 17:27:53.968969	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	9806872223
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-08-06 17:27:54.0681	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	9806872223
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2022-08-06 17:27:54.094332	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	9806872223
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2022-08-06 17:27:54.099855	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	9806872223
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-08-06 17:27:54.106772	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	9806872223
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-08-06 17:27:54.114549	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	9806872223
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2022-08-06 17:27:54.118805	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	9806872223
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2022-08-06 17:27:54.121651	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	9806872223
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2022-08-06 17:27:54.124517	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	9806872223
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2022-08-06 17:27:54.140761	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	9806872223
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2022-08-06 17:27:54.148558	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	9806872223
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2022-08-06 17:27:54.153385	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	9806872223
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2022-08-06 17:27:54.163746	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	9806872223
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2022-08-06 17:27:54.169344	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	9806872223
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2022-08-06 17:27:54.173689	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	9806872223
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-08-06 17:27:54.179935	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	9806872223
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-08-06 17:27:54.184995	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	9806872223
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-08-06 17:27:54.187191	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	9806872223
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-08-06 17:27:54.200224	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	9806872223
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-08-06 17:27:54.208814	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	9806872223
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-08-06 17:27:54.213091	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	9806872223
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-08-06 17:27:54.21531	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	9806872223
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-08-06 17:27:54.23209	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	9806872223
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-08-06 17:27:54.234391	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	9806872223
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-08-06 17:27:54.241973	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	9806872223
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-08-06 17:27:54.244285	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	9806872223
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-08-06 17:27:54.248952	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	9806872223
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-08-06 17:27:54.251056	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	9806872223
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-08-06 17:27:54.258515	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	9806872223
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2022-08-06 17:27:54.263727	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	9806872223
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-08-06 17:27:54.270283	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	9806872223
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-08-06 17:27:54.282227	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	9806872223
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-06 17:27:54.288397	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	9806872223
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-06 17:27:54.294157	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	9806872223
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-06 17:27:54.30258	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	9806872223
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-06 17:27:54.309778	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	9806872223
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-06 17:27:54.312128	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	9806872223
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-06 17:27:54.321207	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	9806872223
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-06 17:27:54.323429	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	9806872223
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-08-06 17:27:54.328756	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	9806872223
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-06 17:27:54.344364	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	9806872223
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-06 17:27:54.346771	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	9806872223
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-06 17:27:54.354219	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	9806872223
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-06 17:27:54.363896	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	9806872223
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-06 17:27:54.366514	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	9806872223
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-06 17:27:54.374576	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	9806872223
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-08-06 17:27:54.379002	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	9806872223
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2022-08-06 17:27:54.385053	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	9806872223
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2022-08-06 17:27:54.392875	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	9806872223
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2022-08-06 17:27:54.400725	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.8.0	\N	\N	9806872223
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2022-08-06 17:27:54.404611	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.8.0	\N	\N	9806872223
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
1fdc94c4-226d-4d2a-96fc-e04291889300	2a04c8ce-eb36-4a1a-9ae5-5d04637164ba	f
1fdc94c4-226d-4d2a-96fc-e04291889300	005267f3-164c-4f8e-94e3-5c0337bd0005	t
1fdc94c4-226d-4d2a-96fc-e04291889300	fe266107-a59a-4adc-972a-0c65ba0147fa	t
1fdc94c4-226d-4d2a-96fc-e04291889300	96dcb049-1eaa-44a0-b805-b286e0124282	t
1fdc94c4-226d-4d2a-96fc-e04291889300	4bbd9b87-644d-4ff5-9eed-338cb70389b6	f
1fdc94c4-226d-4d2a-96fc-e04291889300	ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08	f
1fdc94c4-226d-4d2a-96fc-e04291889300	ede3edd8-e865-45b0-87f4-8bd7280ef6d6	t
1fdc94c4-226d-4d2a-96fc-e04291889300	3d0f4aab-8f0a-46ab-8306-8593cf89a9e5	t
1fdc94c4-226d-4d2a-96fc-e04291889300	34dea6e1-2519-4c7e-b008-c59b82a5de69	f
1fdc94c4-226d-4d2a-96fc-e04291889300	f9fd5382-fb92-4129-9cd8-cdff5877e56b	t
20f9497d-ff36-42f0-8b47-64a1c65fc3df	ffae67c4-2c06-47ca-815e-581674c7846d	f
20f9497d-ff36-42f0-8b47-64a1c65fc3df	541cb6ae-f63d-4e1a-a8b7-090a3a901f1e	t
20f9497d-ff36-42f0-8b47-64a1c65fc3df	bea7f837-2759-41d2-9d5e-2522f33a31ea	t
20f9497d-ff36-42f0-8b47-64a1c65fc3df	f587dfd2-dfdc-4f44-9463-57e5b4e69d29	t
20f9497d-ff36-42f0-8b47-64a1c65fc3df	9ca346a4-998e-4e00-b080-b13654653bbe	f
20f9497d-ff36-42f0-8b47-64a1c65fc3df	81f00f09-2199-4fd9-b73d-9ac8ff16971f	f
20f9497d-ff36-42f0-8b47-64a1c65fc3df	5ecff666-e5fa-4cd0-aaec-fde219d24f99	t
20f9497d-ff36-42f0-8b47-64a1c65fc3df	b4f226f6-bcf7-4c10-9c7b-01305350c351	t
20f9497d-ff36-42f0-8b47-64a1c65fc3df	ea149db0-a513-4d20-854e-3d6699a27721	f
20f9497d-ff36-42f0-8b47-64a1c65fc3df	45012b46-e04a-4b9b-be12-e1e20766133a	t
20f9497d-ff36-42f0-8b47-64a1c65fc3df	18764984-b6ab-4bf3-9f19-d73ebbf630c1	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
b0c198c4-e56a-4122-88e7-28b9a2720a6a	user	 	20f9497d-ff36-42f0-8b47-64a1c65fc3df
3495d34a-407b-4585-abc7-a91ff1b8707e	user	b0c198c4-e56a-4122-88e7-28b9a2720a6a	20f9497d-ff36-42f0-8b47-64a1c65fc3df
050a3aff-4fa5-44b3-a66f-98148d25aa0b	manager	 	20f9497d-ff36-42f0-8b47-64a1c65fc3df
b5a12a74-e07c-494e-b1ca-7ae2884adc65	manager	050a3aff-4fa5-44b3-a66f-98148d25aa0b	20f9497d-ff36-42f0-8b47-64a1c65fc3df
eb01f8f2-a8b3-489d-b291-dded98d6dac4	multi-tenant	 	20f9497d-ff36-42f0-8b47-64a1c65fc3df
659e146a-9db0-48f8-b485-4f5dbb97e0c3	multi-tenant	eb01f8f2-a8b3-489d-b291-dded98d6dac4	20f9497d-ff36-42f0-8b47-64a1c65fc3df
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
898a1703-ee98-452d-90bd-e1c9ed9d996b	1fdc94c4-226d-4d2a-96fc-e04291889300	f	${role_default-roles}	default-roles-master	1fdc94c4-226d-4d2a-96fc-e04291889300	\N	\N
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	1fdc94c4-226d-4d2a-96fc-e04291889300	f	${role_admin}	admin	1fdc94c4-226d-4d2a-96fc-e04291889300	\N	\N
bc55ab87-92c1-4eb3-9b50-8a5923fd4e04	1fdc94c4-226d-4d2a-96fc-e04291889300	f	${role_create-realm}	create-realm	1fdc94c4-226d-4d2a-96fc-e04291889300	\N	\N
c7a46b1a-d191-4177-a10f-f4249ae7d8d3	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_create-client}	create-client	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
65d69fe5-b43c-4459-830c-10130c848c55	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_view-realm}	view-realm	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
97971fd2-3f7a-4109-8847-78fdad7ede22	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_view-users}	view-users	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
aaff896b-ac2a-4b4b-90ae-b8dc6bcff53e	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_view-clients}	view-clients	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
73ddf090-2cd6-4ea8-893d-9978f1979da8	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_view-events}	view-events	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
f04acda0-d227-4365-93e2-7aae53d83c46	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_view-identity-providers}	view-identity-providers	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
4030189c-9846-4b90-9d9c-5496aa0e2dcf	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_view-authorization}	view-authorization	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
224cf3b1-5127-40fa-a856-daa21d0d0687	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_manage-realm}	manage-realm	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
b840df63-dab4-4f97-bd46-2a8d28b79c87	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_manage-users}	manage-users	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
719af698-d31f-4068-b84e-fdb540d1cac8	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_manage-clients}	manage-clients	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
adff4f17-1077-4025-ad58-7d146d86ebb0	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_manage-events}	manage-events	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
810f4023-c0f0-4dab-8b96-7a15705e260a	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_manage-identity-providers}	manage-identity-providers	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
4636a454-6f30-4084-b17f-55c1cdb8b5ab	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_manage-authorization}	manage-authorization	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
5432db93-be9b-4a10-aac8-c8bd58938946	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_query-users}	query-users	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
0293c7ce-7682-4127-aaa2-790018b2646b	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_query-clients}	query-clients	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
a7b09324-3537-4514-a8b0-397421516b6d	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_query-realms}	query-realms	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
0b167a5e-07b6-44a1-b137-8eed98cda768	20f9497d-ff36-42f0-8b47-64a1c65fc3df	f	administrator	administrator	20f9497d-ff36-42f0-8b47-64a1c65fc3df	\N	\N
6383e5e1-2f19-4c93-9693-c1d5559e7e0f	20f9497d-ff36-42f0-8b47-64a1c65fc3df	f	manager	manager	20f9497d-ff36-42f0-8b47-64a1c65fc3df	\N	\N
e312fec5-b738-4338-8135-b6fb576345c5	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_query-groups}	query-groups	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
ff300f33-4eb5-4eb7-bb36-82715c1fb06a	dd08fab5-5264-424e-8867-f10b7aec5f5b	t	${role_view-profile}	view-profile	1fdc94c4-226d-4d2a-96fc-e04291889300	dd08fab5-5264-424e-8867-f10b7aec5f5b	\N
f191d84b-90c2-4dfe-af43-d7c93ee914e9	dd08fab5-5264-424e-8867-f10b7aec5f5b	t	${role_manage-account}	manage-account	1fdc94c4-226d-4d2a-96fc-e04291889300	dd08fab5-5264-424e-8867-f10b7aec5f5b	\N
b8b98f8b-2a2a-4a82-8dec-e3eb2cd50230	dd08fab5-5264-424e-8867-f10b7aec5f5b	t	${role_manage-account-links}	manage-account-links	1fdc94c4-226d-4d2a-96fc-e04291889300	dd08fab5-5264-424e-8867-f10b7aec5f5b	\N
935ff4a9-2853-499b-82f5-ca051dd7933f	dd08fab5-5264-424e-8867-f10b7aec5f5b	t	${role_view-applications}	view-applications	1fdc94c4-226d-4d2a-96fc-e04291889300	dd08fab5-5264-424e-8867-f10b7aec5f5b	\N
8e0d1d0e-fcb9-4c07-986c-6f1ebdbda4eb	dd08fab5-5264-424e-8867-f10b7aec5f5b	t	${role_view-consent}	view-consent	1fdc94c4-226d-4d2a-96fc-e04291889300	dd08fab5-5264-424e-8867-f10b7aec5f5b	\N
5faf21d3-3fb3-421e-9783-88f117e3b38c	dd08fab5-5264-424e-8867-f10b7aec5f5b	t	${role_manage-consent}	manage-consent	1fdc94c4-226d-4d2a-96fc-e04291889300	dd08fab5-5264-424e-8867-f10b7aec5f5b	\N
c5642425-50d3-4692-8bee-166512a479d9	dd08fab5-5264-424e-8867-f10b7aec5f5b	t	${role_delete-account}	delete-account	1fdc94c4-226d-4d2a-96fc-e04291889300	dd08fab5-5264-424e-8867-f10b7aec5f5b	\N
c26ec06a-193d-4721-82f7-6412a2820fdc	b0200f32-f5e1-4e97-a144-d478d4964cb9	t	${role_read-token}	read-token	1fdc94c4-226d-4d2a-96fc-e04291889300	b0200f32-f5e1-4e97-a144-d478d4964cb9	\N
84e75dde-e28a-47e1-bfc6-5035ee894e98	233dea85-107d-4587-8eda-2b74b1f472c1	t	${role_impersonation}	impersonation	1fdc94c4-226d-4d2a-96fc-e04291889300	233dea85-107d-4587-8eda-2b74b1f472c1	\N
baf975f8-a586-4994-81a9-edfdb92e05f2	1fdc94c4-226d-4d2a-96fc-e04291889300	f	${role_offline-access}	offline_access	1fdc94c4-226d-4d2a-96fc-e04291889300	\N	\N
27caaa2c-8e57-45ca-8772-7295f64a5257	1fdc94c4-226d-4d2a-96fc-e04291889300	f	${role_uma_authorization}	uma_authorization	1fdc94c4-226d-4d2a-96fc-e04291889300	\N	\N
9112f935-396c-48d8-968e-5db7a2d0e2c2	20f9497d-ff36-42f0-8b47-64a1c65fc3df	f		user	20f9497d-ff36-42f0-8b47-64a1c65fc3df	\N	\N
15f5580d-e0e2-4621-ba7a-4ac1e2791e5e	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_view-identity-providers}	view-identity-providers	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
946ab484-e473-458d-a623-8b61153f46ba	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_view-authorization}	view-authorization	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
8f011b19-591f-4734-96e0-5522aa6f4a58	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_manage-realm}	manage-realm	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
74756c0c-63f2-47bd-a215-7b564d301a2f	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_manage-users}	manage-users	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
47d35844-019e-4945-9828-88815472c190	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_manage-clients}	manage-clients	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
1f268a66-ef23-42c8-bb7e-4fd547830d12	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_manage-events}	manage-events	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
abf13058-0b9a-403d-952d-ebed1b0b1f3e	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_manage-identity-providers}	manage-identity-providers	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
e1b50dfe-56c9-4944-941c-5c81498944b6	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_manage-authorization}	manage-authorization	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
ec626861-0e4e-48b1-a11c-8b06706b0970	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_query-users}	query-users	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
de7d57f4-9f04-4ff5-9b8b-233ce7db79fd	20f9497d-ff36-42f0-8b47-64a1c65fc3df	f	${role_default-roles}	default-roles-keycloak	20f9497d-ff36-42f0-8b47-64a1c65fc3df	\N	\N
07421ae9-50dc-4d65-8508-85077f46cd51	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_create-client}	create-client	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
bb2b004a-13bf-4490-baf9-78b312a521d9	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_view-realm}	view-realm	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
239d1d24-776e-41ef-b465-9d62c1b638eb	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_view-users}	view-users	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
6417d1d9-7ccb-4eee-a959-012d96a4ff41	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_view-clients}	view-clients	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
bce7221f-582a-4e6b-a87e-f77a4d7bda7d	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_view-events}	view-events	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
5ec3243d-0761-4aee-9499-39a77f882b8c	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_query-clients}	query-clients	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
6264cb1a-e26e-4727-a9e8-cf2a2a386410	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_query-realms}	query-realms	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
39af844e-0961-4d0a-b3ad-716c6ab1ea6c	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_query-groups}	query-groups	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
f114dee8-a2ee-476c-8243-f2006304d177	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_realm-admin}	realm-admin	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
6e657f01-3623-480d-8a18-9335e44323a5	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_create-client}	create-client	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
3498a436-2048-4690-acba-89fb5aefb45b	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_view-realm}	view-realm	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
04d30821-8da9-41c0-b7cd-91e669baecbb	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_view-users}	view-users	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
0cd693d0-6556-4a19-9faa-6f352024b5db	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_view-clients}	view-clients	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
1d5353dc-ce7e-4008-9a7b-11d60540df7c	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_view-events}	view-events	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
991482d8-0dc7-4e88-b259-404a743dddbc	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_view-identity-providers}	view-identity-providers	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
49163e9a-4359-4d8f-96fa-5d5b48181df2	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_view-authorization}	view-authorization	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
45df5603-6a79-4969-8716-f6501139ca23	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_manage-realm}	manage-realm	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
5b05d666-7816-4fd7-9165-c5f9e3b6df8f	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_manage-users}	manage-users	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
e29a8608-5c25-43cc-bd63-9bdd091dee4e	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_manage-clients}	manage-clients	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
84c1bc66-5b33-44a4-b699-1909d2e4d4a7	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_manage-events}	manage-events	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
ab082486-86cf-478e-a4ba-2e19437cacc3	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_manage-identity-providers}	manage-identity-providers	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
ed861dc0-f313-4724-8b53-836b7e26da1c	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_manage-authorization}	manage-authorization	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
705d3c1b-0e43-4b85-b9fa-712ce99476e4	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_query-users}	query-users	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
714b33e1-0d58-44cc-a937-539aa13a72c1	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_query-clients}	query-clients	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
3b163124-5127-42a7-b483-b7bde90e66ed	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_query-realms}	query-realms	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
b2e1e8db-c42e-4f19-a044-f49610972d2c	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_query-groups}	query-groups	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
0ba97173-b46a-401a-82c7-e835cd9081cc	b70432c4-b75f-4588-ba96-b77a22c12aaf	t	${role_view-profile}	view-profile	20f9497d-ff36-42f0-8b47-64a1c65fc3df	b70432c4-b75f-4588-ba96-b77a22c12aaf	\N
b4eb8170-5a54-4b95-bb98-c6e4559ea51f	b70432c4-b75f-4588-ba96-b77a22c12aaf	t	${role_manage-account}	manage-account	20f9497d-ff36-42f0-8b47-64a1c65fc3df	b70432c4-b75f-4588-ba96-b77a22c12aaf	\N
43f54114-d9c6-40c5-a27b-2081311aeeae	b70432c4-b75f-4588-ba96-b77a22c12aaf	t	${role_manage-account-links}	manage-account-links	20f9497d-ff36-42f0-8b47-64a1c65fc3df	b70432c4-b75f-4588-ba96-b77a22c12aaf	\N
64b5c4c3-ad06-4d1f-9938-f15b6d7ef914	b70432c4-b75f-4588-ba96-b77a22c12aaf	t	${role_view-applications}	view-applications	20f9497d-ff36-42f0-8b47-64a1c65fc3df	b70432c4-b75f-4588-ba96-b77a22c12aaf	\N
14c342b1-29de-4a44-aa1c-c26f8c60baa0	b70432c4-b75f-4588-ba96-b77a22c12aaf	t	${role_view-consent}	view-consent	20f9497d-ff36-42f0-8b47-64a1c65fc3df	b70432c4-b75f-4588-ba96-b77a22c12aaf	\N
d0971eb0-23c7-46c0-9d20-ed731b47145b	b70432c4-b75f-4588-ba96-b77a22c12aaf	t	${role_manage-consent}	manage-consent	20f9497d-ff36-42f0-8b47-64a1c65fc3df	b70432c4-b75f-4588-ba96-b77a22c12aaf	\N
fedb2fc9-467e-47ca-a2fd-7935f317e3d8	b70432c4-b75f-4588-ba96-b77a22c12aaf	t	${role_delete-account}	delete-account	20f9497d-ff36-42f0-8b47-64a1c65fc3df	b70432c4-b75f-4588-ba96-b77a22c12aaf	\N
b3b2f647-79bb-4b94-81c9-eecd954a0379	ff03b919-635c-4bac-b54f-14d5d5984439	t	${role_impersonation}	impersonation	1fdc94c4-226d-4d2a-96fc-e04291889300	ff03b919-635c-4bac-b54f-14d5d5984439	\N
d3ad4bff-c6a4-4fb7-8df5-f0a5985d3cdd	1f0d4898-7575-4378-929f-508a7ae8c7f8	t	${role_impersonation}	impersonation	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1f0d4898-7575-4378-929f-508a7ae8c7f8	\N
89d7d64f-a1be-414a-a96c-fd57d6238a42	53c48ae0-ada5-4d35-bb0d-e702d1af358b	t	${role_read-token}	read-token	20f9497d-ff36-42f0-8b47-64a1c65fc3df	53c48ae0-ada5-4d35-bb0d-e702d1af358b	\N
5e8541ee-9981-4069-b562-b8de6d38be18	20f9497d-ff36-42f0-8b47-64a1c65fc3df	f	${role_offline-access}	offline_access	20f9497d-ff36-42f0-8b47-64a1c65fc3df	\N	\N
ae2ac03e-45b0-44b7-b0cb-58159fe066e8	20f9497d-ff36-42f0-8b47-64a1c65fc3df	f	${role_uma_authorization}	uma_authorization	20f9497d-ff36-42f0-8b47-64a1c65fc3df	\N	\N
146270d0-2a55-415b-9c65-58f05d25ece2	71a45c32-9354-4859-a43a-cb34dd1eac51	t	\N	uma_protection	20f9497d-ff36-42f0-8b47-64a1c65fc3df	71a45c32-9354-4859-a43a-cb34dd1eac51	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.migration_model (id, version, update_time) FROM stdin;
azf2r	19.0.1	1659806874
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
e75f858e-d8a5-4de2-88cb-54ee6fee6824	code	// by default, grants any permission associated with this policy\n$evaluation.grant();\n
ff551c82-26a2-4dd2-977c-7801eb7ed50b	defaultResourceType	urn:app-backend:resources:default
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
5bc3942d-aa24-4454-a0dc-43d53ace488d	audience resolve	openid-connect	oidc-audience-resolve-mapper	fb151bdb-be96-4970-9814-848bdbb9d0c1	\N
8663c331-b993-4306-8b86-e25d66517bbc	locale	openid-connect	oidc-usermodel-attribute-mapper	69589433-2f6e-4175-8fff-1dd9b49b71bc	\N
83507d7a-e853-4f8d-be43-f68d6a56a93e	role list	saml	saml-role-list-mapper	\N	005267f3-164c-4f8e-94e3-5c0337bd0005
dfb3422f-ce10-4be0-b6c9-a56840d78514	full name	openid-connect	oidc-full-name-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
1e0fba44-28a0-421b-955c-f8223e336429	family name	openid-connect	oidc-usermodel-property-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
01f775ab-368a-4397-a53a-27ae486abcaa	given name	openid-connect	oidc-usermodel-property-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
c4ae295c-d516-4111-977c-93783e1ec983	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
b758309c-0679-4dce-a03a-b9e914f5390f	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
b2826cb7-9e0f-464b-b394-d775fb0cf0c8	username	openid-connect	oidc-usermodel-property-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
50dcc47d-5d81-45af-b919-6e45d6b92486	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
930a4594-5127-4a13-aef9-0a01ee779e90	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
b6132104-f442-43b2-9b80-568103a0e8c6	website	openid-connect	oidc-usermodel-attribute-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
b1ed7f27-f3d8-45b2-aa1f-6fe6a6e2eb04	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
545f484a-8c42-4b18-98e6-2aa04ae8236c	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
01b71526-5e72-47d3-9f44-6552bf829630	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
d38137b7-dba4-4ec5-86d9-1c5ef20fe667	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
5fc5ffe0-89e4-4818-8a04-bbcb4356b66e	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	fe266107-a59a-4adc-972a-0c65ba0147fa
b0ac31b8-901a-4baa-9473-7bea82d520a7	email	openid-connect	oidc-usermodel-property-mapper	\N	96dcb049-1eaa-44a0-b805-b286e0124282
14ac3c56-83e6-4d30-820f-e77a8f5c9a6c	email verified	openid-connect	oidc-usermodel-property-mapper	\N	96dcb049-1eaa-44a0-b805-b286e0124282
8fa1b62b-d989-4efd-a29c-bfdcfd2cf83a	address	openid-connect	oidc-address-mapper	\N	4bbd9b87-644d-4ff5-9eed-338cb70389b6
76a6e8fb-79e1-491d-bc1a-7e7a0c0b4b87	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08
fa462904-e425-4780-96e6-9101bb7f69f0	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	ebc3a08a-0bd0-4151-aa7b-f80e08a5cd08
aa827e43-743f-48c5-a40e-88bfa7d1e38b	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	ede3edd8-e865-45b0-87f4-8bd7280ef6d6
95f5448c-6b36-4735-955c-9ec0409770ba	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	ede3edd8-e865-45b0-87f4-8bd7280ef6d6
c3b27661-2308-4faf-882f-2a1344be955a	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	ede3edd8-e865-45b0-87f4-8bd7280ef6d6
0a178ac6-00d1-4e0a-b633-ef80a7ec9842	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	3d0f4aab-8f0a-46ab-8306-8593cf89a9e5
76e733fd-7382-4c65-ab1f-5387559e505e	upn	openid-connect	oidc-usermodel-property-mapper	\N	34dea6e1-2519-4c7e-b008-c59b82a5de69
bcb0880f-471d-40b6-972b-97d7c86744f4	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	34dea6e1-2519-4c7e-b008-c59b82a5de69
9a6358c5-3a48-4b4e-bbf1-efcc0a706952	acr loa level	openid-connect	oidc-acr-mapper	\N	f9fd5382-fb92-4129-9cd8-cdff5877e56b
b01c86ae-3612-4f09-be6e-747d0e6824b7	audience resolve	openid-connect	oidc-audience-resolve-mapper	5bad9d86-4193-457a-903c-95c2ec701f7b	\N
b62e3a45-a86e-471c-841a-28b904a000be	role list	saml	saml-role-list-mapper	\N	541cb6ae-f63d-4e1a-a8b7-090a3a901f1e
53b58832-644d-42b4-9497-8f0583d321c1	full name	openid-connect	oidc-full-name-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
d885cee5-b8e7-44c0-913d-8aafca497555	family name	openid-connect	oidc-usermodel-property-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
d424530a-9430-4089-8ad5-389bd906b914	given name	openid-connect	oidc-usermodel-property-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
9cdffb66-1525-4757-98fb-7e087e67bb60	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
ea09814e-683c-487d-bc35-579c508b404a	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
fd49420b-c1dd-4737-9b12-36253338c457	username	openid-connect	oidc-usermodel-property-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
01ab2739-d8a3-4953-a65e-9ef2cff20b38	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
6833b73a-6615-457a-8815-d1da11915961	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
d945285b-8e9f-4f0d-91ab-4b088557c305	website	openid-connect	oidc-usermodel-attribute-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
c85c97c3-26a1-4ec9-8fe7-8eaf09656147	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
977cf137-3c1d-493c-892e-98d13f8925ab	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
47e18df4-29ec-43e0-9c4a-e178da28b639	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
73165557-c844-4ba2-8190-960495abf7fb	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
0370ef4b-c995-48c7-bf17-3a1d3754cb57	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	bea7f837-2759-41d2-9d5e-2522f33a31ea
33508fb7-7a81-459f-aa9d-c51049d7d237	email	openid-connect	oidc-usermodel-property-mapper	\N	f587dfd2-dfdc-4f44-9463-57e5b4e69d29
3b2b457c-a1f7-4fee-bd03-f6eb550ba77d	email verified	openid-connect	oidc-usermodel-property-mapper	\N	f587dfd2-dfdc-4f44-9463-57e5b4e69d29
4506ac26-fb64-42c5-937b-fcf859aa6f5f	address	openid-connect	oidc-address-mapper	\N	9ca346a4-998e-4e00-b080-b13654653bbe
5a6b258f-15c9-487e-a0c0-c4d883094bc1	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	81f00f09-2199-4fd9-b73d-9ac8ff16971f
da5fbcd7-d7cb-4885-a480-041d7ec0ddf6	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	81f00f09-2199-4fd9-b73d-9ac8ff16971f
4b9e86d1-54b4-43a9-a012-2b8c30b66781	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	5ecff666-e5fa-4cd0-aaec-fde219d24f99
10915eeb-a053-478d-8475-77fe5a818c07	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	5ecff666-e5fa-4cd0-aaec-fde219d24f99
826b2577-8f76-49c2-ba5b-4794b51b752f	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	5ecff666-e5fa-4cd0-aaec-fde219d24f99
b3024c85-bc19-45c0-bb5d-295a77302257	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	b4f226f6-bcf7-4c10-9c7b-01305350c351
3b595558-3b4c-4814-bdb6-ea7116bba8a3	upn	openid-connect	oidc-usermodel-property-mapper	\N	ea149db0-a513-4d20-854e-3d6699a27721
ce59fb4c-9da8-4636-a5c5-f1bb44ecaea3	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	ea149db0-a513-4d20-854e-3d6699a27721
0479a525-4633-4fdd-8cf7-43aa1cbb1332	acr loa level	openid-connect	oidc-acr-mapper	\N	45012b46-e04a-4b9b-be12-e1e20766133a
497e86c0-aedc-43e5-ba19-e9b57f06e94e	locale	openid-connect	oidc-usermodel-attribute-mapper	499f92ad-3f8e-495e-b224-252c84a7cc7e	\N
4694c17c-8746-43a1-9662-f508099d568f	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	71a45c32-9354-4859-a43a-cb34dd1eac51	\N
3e1a409d-85c1-462a-aa63-46e2a5d53a5f	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	71a45c32-9354-4859-a43a-cb34dd1eac51	\N
13e9453e-5443-4f70-aaa7-2513e5d4b947	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	71a45c32-9354-4859-a43a-cb34dd1eac51	\N
4dd8f113-c3c8-45c7-820a-262e097da243	groups	openid-connect	oidc-group-membership-mapper	\N	18764984-b6ab-4bf3-9f19-d73ebbf630c1
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
8663c331-b993-4306-8b86-e25d66517bbc	true	userinfo.token.claim
8663c331-b993-4306-8b86-e25d66517bbc	locale	user.attribute
8663c331-b993-4306-8b86-e25d66517bbc	true	id.token.claim
8663c331-b993-4306-8b86-e25d66517bbc	true	access.token.claim
8663c331-b993-4306-8b86-e25d66517bbc	locale	claim.name
8663c331-b993-4306-8b86-e25d66517bbc	String	jsonType.label
83507d7a-e853-4f8d-be43-f68d6a56a93e	false	single
83507d7a-e853-4f8d-be43-f68d6a56a93e	Basic	attribute.nameformat
83507d7a-e853-4f8d-be43-f68d6a56a93e	Role	attribute.name
01b71526-5e72-47d3-9f44-6552bf829630	true	userinfo.token.claim
01b71526-5e72-47d3-9f44-6552bf829630	zoneinfo	user.attribute
01b71526-5e72-47d3-9f44-6552bf829630	true	id.token.claim
01b71526-5e72-47d3-9f44-6552bf829630	true	access.token.claim
01b71526-5e72-47d3-9f44-6552bf829630	zoneinfo	claim.name
01b71526-5e72-47d3-9f44-6552bf829630	String	jsonType.label
01f775ab-368a-4397-a53a-27ae486abcaa	true	userinfo.token.claim
01f775ab-368a-4397-a53a-27ae486abcaa	firstName	user.attribute
01f775ab-368a-4397-a53a-27ae486abcaa	true	id.token.claim
01f775ab-368a-4397-a53a-27ae486abcaa	true	access.token.claim
01f775ab-368a-4397-a53a-27ae486abcaa	given_name	claim.name
01f775ab-368a-4397-a53a-27ae486abcaa	String	jsonType.label
1e0fba44-28a0-421b-955c-f8223e336429	true	userinfo.token.claim
1e0fba44-28a0-421b-955c-f8223e336429	lastName	user.attribute
1e0fba44-28a0-421b-955c-f8223e336429	true	id.token.claim
1e0fba44-28a0-421b-955c-f8223e336429	true	access.token.claim
1e0fba44-28a0-421b-955c-f8223e336429	family_name	claim.name
1e0fba44-28a0-421b-955c-f8223e336429	String	jsonType.label
50dcc47d-5d81-45af-b919-6e45d6b92486	true	userinfo.token.claim
50dcc47d-5d81-45af-b919-6e45d6b92486	profile	user.attribute
50dcc47d-5d81-45af-b919-6e45d6b92486	true	id.token.claim
50dcc47d-5d81-45af-b919-6e45d6b92486	true	access.token.claim
50dcc47d-5d81-45af-b919-6e45d6b92486	profile	claim.name
50dcc47d-5d81-45af-b919-6e45d6b92486	String	jsonType.label
545f484a-8c42-4b18-98e6-2aa04ae8236c	true	userinfo.token.claim
545f484a-8c42-4b18-98e6-2aa04ae8236c	birthdate	user.attribute
545f484a-8c42-4b18-98e6-2aa04ae8236c	true	id.token.claim
545f484a-8c42-4b18-98e6-2aa04ae8236c	true	access.token.claim
545f484a-8c42-4b18-98e6-2aa04ae8236c	birthdate	claim.name
545f484a-8c42-4b18-98e6-2aa04ae8236c	String	jsonType.label
5fc5ffe0-89e4-4818-8a04-bbcb4356b66e	true	userinfo.token.claim
5fc5ffe0-89e4-4818-8a04-bbcb4356b66e	updatedAt	user.attribute
5fc5ffe0-89e4-4818-8a04-bbcb4356b66e	true	id.token.claim
5fc5ffe0-89e4-4818-8a04-bbcb4356b66e	true	access.token.claim
5fc5ffe0-89e4-4818-8a04-bbcb4356b66e	updated_at	claim.name
5fc5ffe0-89e4-4818-8a04-bbcb4356b66e	long	jsonType.label
930a4594-5127-4a13-aef9-0a01ee779e90	true	userinfo.token.claim
930a4594-5127-4a13-aef9-0a01ee779e90	picture	user.attribute
930a4594-5127-4a13-aef9-0a01ee779e90	true	id.token.claim
930a4594-5127-4a13-aef9-0a01ee779e90	true	access.token.claim
930a4594-5127-4a13-aef9-0a01ee779e90	picture	claim.name
930a4594-5127-4a13-aef9-0a01ee779e90	String	jsonType.label
b1ed7f27-f3d8-45b2-aa1f-6fe6a6e2eb04	true	userinfo.token.claim
b1ed7f27-f3d8-45b2-aa1f-6fe6a6e2eb04	gender	user.attribute
b1ed7f27-f3d8-45b2-aa1f-6fe6a6e2eb04	true	id.token.claim
b1ed7f27-f3d8-45b2-aa1f-6fe6a6e2eb04	true	access.token.claim
b1ed7f27-f3d8-45b2-aa1f-6fe6a6e2eb04	gender	claim.name
b1ed7f27-f3d8-45b2-aa1f-6fe6a6e2eb04	String	jsonType.label
b2826cb7-9e0f-464b-b394-d775fb0cf0c8	true	userinfo.token.claim
b2826cb7-9e0f-464b-b394-d775fb0cf0c8	username	user.attribute
b2826cb7-9e0f-464b-b394-d775fb0cf0c8	true	id.token.claim
b2826cb7-9e0f-464b-b394-d775fb0cf0c8	true	access.token.claim
b2826cb7-9e0f-464b-b394-d775fb0cf0c8	preferred_username	claim.name
b2826cb7-9e0f-464b-b394-d775fb0cf0c8	String	jsonType.label
b6132104-f442-43b2-9b80-568103a0e8c6	true	userinfo.token.claim
b6132104-f442-43b2-9b80-568103a0e8c6	website	user.attribute
b6132104-f442-43b2-9b80-568103a0e8c6	true	id.token.claim
b6132104-f442-43b2-9b80-568103a0e8c6	true	access.token.claim
b6132104-f442-43b2-9b80-568103a0e8c6	website	claim.name
b6132104-f442-43b2-9b80-568103a0e8c6	String	jsonType.label
b758309c-0679-4dce-a03a-b9e914f5390f	true	userinfo.token.claim
b758309c-0679-4dce-a03a-b9e914f5390f	nickname	user.attribute
b758309c-0679-4dce-a03a-b9e914f5390f	true	id.token.claim
b758309c-0679-4dce-a03a-b9e914f5390f	true	access.token.claim
b758309c-0679-4dce-a03a-b9e914f5390f	nickname	claim.name
b758309c-0679-4dce-a03a-b9e914f5390f	String	jsonType.label
c4ae295c-d516-4111-977c-93783e1ec983	true	userinfo.token.claim
c4ae295c-d516-4111-977c-93783e1ec983	middleName	user.attribute
c4ae295c-d516-4111-977c-93783e1ec983	true	id.token.claim
c4ae295c-d516-4111-977c-93783e1ec983	true	access.token.claim
c4ae295c-d516-4111-977c-93783e1ec983	middle_name	claim.name
c4ae295c-d516-4111-977c-93783e1ec983	String	jsonType.label
d38137b7-dba4-4ec5-86d9-1c5ef20fe667	true	userinfo.token.claim
d38137b7-dba4-4ec5-86d9-1c5ef20fe667	locale	user.attribute
d38137b7-dba4-4ec5-86d9-1c5ef20fe667	true	id.token.claim
d38137b7-dba4-4ec5-86d9-1c5ef20fe667	true	access.token.claim
d38137b7-dba4-4ec5-86d9-1c5ef20fe667	locale	claim.name
d38137b7-dba4-4ec5-86d9-1c5ef20fe667	String	jsonType.label
dfb3422f-ce10-4be0-b6c9-a56840d78514	true	userinfo.token.claim
dfb3422f-ce10-4be0-b6c9-a56840d78514	true	id.token.claim
dfb3422f-ce10-4be0-b6c9-a56840d78514	true	access.token.claim
14ac3c56-83e6-4d30-820f-e77a8f5c9a6c	true	userinfo.token.claim
14ac3c56-83e6-4d30-820f-e77a8f5c9a6c	emailVerified	user.attribute
14ac3c56-83e6-4d30-820f-e77a8f5c9a6c	true	id.token.claim
14ac3c56-83e6-4d30-820f-e77a8f5c9a6c	true	access.token.claim
14ac3c56-83e6-4d30-820f-e77a8f5c9a6c	email_verified	claim.name
14ac3c56-83e6-4d30-820f-e77a8f5c9a6c	boolean	jsonType.label
b0ac31b8-901a-4baa-9473-7bea82d520a7	true	userinfo.token.claim
b0ac31b8-901a-4baa-9473-7bea82d520a7	email	user.attribute
b0ac31b8-901a-4baa-9473-7bea82d520a7	true	id.token.claim
b0ac31b8-901a-4baa-9473-7bea82d520a7	true	access.token.claim
b0ac31b8-901a-4baa-9473-7bea82d520a7	email	claim.name
b0ac31b8-901a-4baa-9473-7bea82d520a7	String	jsonType.label
8fa1b62b-d989-4efd-a29c-bfdcfd2cf83a	formatted	user.attribute.formatted
8fa1b62b-d989-4efd-a29c-bfdcfd2cf83a	country	user.attribute.country
8fa1b62b-d989-4efd-a29c-bfdcfd2cf83a	postal_code	user.attribute.postal_code
8fa1b62b-d989-4efd-a29c-bfdcfd2cf83a	true	userinfo.token.claim
8fa1b62b-d989-4efd-a29c-bfdcfd2cf83a	street	user.attribute.street
8fa1b62b-d989-4efd-a29c-bfdcfd2cf83a	true	id.token.claim
8fa1b62b-d989-4efd-a29c-bfdcfd2cf83a	region	user.attribute.region
8fa1b62b-d989-4efd-a29c-bfdcfd2cf83a	true	access.token.claim
8fa1b62b-d989-4efd-a29c-bfdcfd2cf83a	locality	user.attribute.locality
76a6e8fb-79e1-491d-bc1a-7e7a0c0b4b87	true	userinfo.token.claim
76a6e8fb-79e1-491d-bc1a-7e7a0c0b4b87	phoneNumber	user.attribute
76a6e8fb-79e1-491d-bc1a-7e7a0c0b4b87	true	id.token.claim
76a6e8fb-79e1-491d-bc1a-7e7a0c0b4b87	true	access.token.claim
76a6e8fb-79e1-491d-bc1a-7e7a0c0b4b87	phone_number	claim.name
76a6e8fb-79e1-491d-bc1a-7e7a0c0b4b87	String	jsonType.label
fa462904-e425-4780-96e6-9101bb7f69f0	true	userinfo.token.claim
fa462904-e425-4780-96e6-9101bb7f69f0	phoneNumberVerified	user.attribute
fa462904-e425-4780-96e6-9101bb7f69f0	true	id.token.claim
fa462904-e425-4780-96e6-9101bb7f69f0	true	access.token.claim
fa462904-e425-4780-96e6-9101bb7f69f0	phone_number_verified	claim.name
fa462904-e425-4780-96e6-9101bb7f69f0	boolean	jsonType.label
95f5448c-6b36-4735-955c-9ec0409770ba	true	multivalued
95f5448c-6b36-4735-955c-9ec0409770ba	foo	user.attribute
95f5448c-6b36-4735-955c-9ec0409770ba	true	access.token.claim
95f5448c-6b36-4735-955c-9ec0409770ba	resource_access.${client_id}.roles	claim.name
95f5448c-6b36-4735-955c-9ec0409770ba	String	jsonType.label
aa827e43-743f-48c5-a40e-88bfa7d1e38b	true	multivalued
aa827e43-743f-48c5-a40e-88bfa7d1e38b	foo	user.attribute
aa827e43-743f-48c5-a40e-88bfa7d1e38b	true	access.token.claim
aa827e43-743f-48c5-a40e-88bfa7d1e38b	realm_access.roles	claim.name
aa827e43-743f-48c5-a40e-88bfa7d1e38b	String	jsonType.label
76e733fd-7382-4c65-ab1f-5387559e505e	true	userinfo.token.claim
76e733fd-7382-4c65-ab1f-5387559e505e	username	user.attribute
76e733fd-7382-4c65-ab1f-5387559e505e	true	id.token.claim
76e733fd-7382-4c65-ab1f-5387559e505e	true	access.token.claim
76e733fd-7382-4c65-ab1f-5387559e505e	upn	claim.name
76e733fd-7382-4c65-ab1f-5387559e505e	String	jsonType.label
bcb0880f-471d-40b6-972b-97d7c86744f4	true	multivalued
bcb0880f-471d-40b6-972b-97d7c86744f4	foo	user.attribute
bcb0880f-471d-40b6-972b-97d7c86744f4	true	id.token.claim
bcb0880f-471d-40b6-972b-97d7c86744f4	true	access.token.claim
bcb0880f-471d-40b6-972b-97d7c86744f4	groups	claim.name
bcb0880f-471d-40b6-972b-97d7c86744f4	String	jsonType.label
9a6358c5-3a48-4b4e-bbf1-efcc0a706952	true	id.token.claim
9a6358c5-3a48-4b4e-bbf1-efcc0a706952	true	access.token.claim
13e9453e-5443-4f70-aaa7-2513e5d4b947	clientAddress	user.session.note
13e9453e-5443-4f70-aaa7-2513e5d4b947	true	userinfo.token.claim
13e9453e-5443-4f70-aaa7-2513e5d4b947	true	id.token.claim
13e9453e-5443-4f70-aaa7-2513e5d4b947	true	access.token.claim
13e9453e-5443-4f70-aaa7-2513e5d4b947	clientAddress	claim.name
13e9453e-5443-4f70-aaa7-2513e5d4b947	String	jsonType.label
3e1a409d-85c1-462a-aa63-46e2a5d53a5f	clientHost	user.session.note
3e1a409d-85c1-462a-aa63-46e2a5d53a5f	true	userinfo.token.claim
3e1a409d-85c1-462a-aa63-46e2a5d53a5f	true	id.token.claim
3e1a409d-85c1-462a-aa63-46e2a5d53a5f	true	access.token.claim
3e1a409d-85c1-462a-aa63-46e2a5d53a5f	clientHost	claim.name
3e1a409d-85c1-462a-aa63-46e2a5d53a5f	String	jsonType.label
4694c17c-8746-43a1-9662-f508099d568f	clientId	user.session.note
4694c17c-8746-43a1-9662-f508099d568f	true	userinfo.token.claim
4694c17c-8746-43a1-9662-f508099d568f	true	id.token.claim
4694c17c-8746-43a1-9662-f508099d568f	true	access.token.claim
4694c17c-8746-43a1-9662-f508099d568f	clientId	claim.name
4694c17c-8746-43a1-9662-f508099d568f	String	jsonType.label
4dd8f113-c3c8-45c7-820a-262e097da243	true	full.path
4dd8f113-c3c8-45c7-820a-262e097da243	true	id.token.claim
4dd8f113-c3c8-45c7-820a-262e097da243	true	access.token.claim
4dd8f113-c3c8-45c7-820a-262e097da243	groups	claim.name
4dd8f113-c3c8-45c7-820a-262e097da243	true	userinfo.token.claim
b62e3a45-a86e-471c-841a-28b904a000be	false	single
b62e3a45-a86e-471c-841a-28b904a000be	Basic	attribute.nameformat
b62e3a45-a86e-471c-841a-28b904a000be	Role	attribute.name
01ab2739-d8a3-4953-a65e-9ef2cff20b38	true	userinfo.token.claim
01ab2739-d8a3-4953-a65e-9ef2cff20b38	profile	user.attribute
01ab2739-d8a3-4953-a65e-9ef2cff20b38	true	id.token.claim
01ab2739-d8a3-4953-a65e-9ef2cff20b38	true	access.token.claim
01ab2739-d8a3-4953-a65e-9ef2cff20b38	profile	claim.name
01ab2739-d8a3-4953-a65e-9ef2cff20b38	String	jsonType.label
0370ef4b-c995-48c7-bf17-3a1d3754cb57	true	userinfo.token.claim
0370ef4b-c995-48c7-bf17-3a1d3754cb57	updatedAt	user.attribute
0370ef4b-c995-48c7-bf17-3a1d3754cb57	true	id.token.claim
0370ef4b-c995-48c7-bf17-3a1d3754cb57	true	access.token.claim
0370ef4b-c995-48c7-bf17-3a1d3754cb57	updated_at	claim.name
0370ef4b-c995-48c7-bf17-3a1d3754cb57	long	jsonType.label
47e18df4-29ec-43e0-9c4a-e178da28b639	true	userinfo.token.claim
47e18df4-29ec-43e0-9c4a-e178da28b639	zoneinfo	user.attribute
47e18df4-29ec-43e0-9c4a-e178da28b639	true	id.token.claim
47e18df4-29ec-43e0-9c4a-e178da28b639	true	access.token.claim
47e18df4-29ec-43e0-9c4a-e178da28b639	zoneinfo	claim.name
47e18df4-29ec-43e0-9c4a-e178da28b639	String	jsonType.label
53b58832-644d-42b4-9497-8f0583d321c1	true	userinfo.token.claim
53b58832-644d-42b4-9497-8f0583d321c1	true	id.token.claim
53b58832-644d-42b4-9497-8f0583d321c1	true	access.token.claim
6833b73a-6615-457a-8815-d1da11915961	true	userinfo.token.claim
6833b73a-6615-457a-8815-d1da11915961	picture	user.attribute
6833b73a-6615-457a-8815-d1da11915961	true	id.token.claim
6833b73a-6615-457a-8815-d1da11915961	true	access.token.claim
6833b73a-6615-457a-8815-d1da11915961	picture	claim.name
6833b73a-6615-457a-8815-d1da11915961	String	jsonType.label
73165557-c844-4ba2-8190-960495abf7fb	true	userinfo.token.claim
73165557-c844-4ba2-8190-960495abf7fb	locale	user.attribute
73165557-c844-4ba2-8190-960495abf7fb	true	id.token.claim
73165557-c844-4ba2-8190-960495abf7fb	true	access.token.claim
73165557-c844-4ba2-8190-960495abf7fb	locale	claim.name
73165557-c844-4ba2-8190-960495abf7fb	String	jsonType.label
977cf137-3c1d-493c-892e-98d13f8925ab	true	userinfo.token.claim
977cf137-3c1d-493c-892e-98d13f8925ab	birthdate	user.attribute
977cf137-3c1d-493c-892e-98d13f8925ab	true	id.token.claim
977cf137-3c1d-493c-892e-98d13f8925ab	true	access.token.claim
977cf137-3c1d-493c-892e-98d13f8925ab	birthdate	claim.name
977cf137-3c1d-493c-892e-98d13f8925ab	String	jsonType.label
9cdffb66-1525-4757-98fb-7e087e67bb60	true	userinfo.token.claim
9cdffb66-1525-4757-98fb-7e087e67bb60	middleName	user.attribute
9cdffb66-1525-4757-98fb-7e087e67bb60	true	id.token.claim
9cdffb66-1525-4757-98fb-7e087e67bb60	true	access.token.claim
9cdffb66-1525-4757-98fb-7e087e67bb60	middle_name	claim.name
9cdffb66-1525-4757-98fb-7e087e67bb60	String	jsonType.label
c85c97c3-26a1-4ec9-8fe7-8eaf09656147	true	userinfo.token.claim
c85c97c3-26a1-4ec9-8fe7-8eaf09656147	gender	user.attribute
c85c97c3-26a1-4ec9-8fe7-8eaf09656147	true	id.token.claim
c85c97c3-26a1-4ec9-8fe7-8eaf09656147	true	access.token.claim
c85c97c3-26a1-4ec9-8fe7-8eaf09656147	gender	claim.name
c85c97c3-26a1-4ec9-8fe7-8eaf09656147	String	jsonType.label
d424530a-9430-4089-8ad5-389bd906b914	true	userinfo.token.claim
d424530a-9430-4089-8ad5-389bd906b914	firstName	user.attribute
d424530a-9430-4089-8ad5-389bd906b914	true	id.token.claim
d424530a-9430-4089-8ad5-389bd906b914	true	access.token.claim
d424530a-9430-4089-8ad5-389bd906b914	given_name	claim.name
d424530a-9430-4089-8ad5-389bd906b914	String	jsonType.label
d885cee5-b8e7-44c0-913d-8aafca497555	true	userinfo.token.claim
d885cee5-b8e7-44c0-913d-8aafca497555	lastName	user.attribute
d885cee5-b8e7-44c0-913d-8aafca497555	true	id.token.claim
d885cee5-b8e7-44c0-913d-8aafca497555	true	access.token.claim
d885cee5-b8e7-44c0-913d-8aafca497555	family_name	claim.name
d885cee5-b8e7-44c0-913d-8aafca497555	String	jsonType.label
d945285b-8e9f-4f0d-91ab-4b088557c305	true	userinfo.token.claim
d945285b-8e9f-4f0d-91ab-4b088557c305	website	user.attribute
d945285b-8e9f-4f0d-91ab-4b088557c305	true	id.token.claim
d945285b-8e9f-4f0d-91ab-4b088557c305	true	access.token.claim
d945285b-8e9f-4f0d-91ab-4b088557c305	website	claim.name
d945285b-8e9f-4f0d-91ab-4b088557c305	String	jsonType.label
ea09814e-683c-487d-bc35-579c508b404a	true	userinfo.token.claim
ea09814e-683c-487d-bc35-579c508b404a	nickname	user.attribute
ea09814e-683c-487d-bc35-579c508b404a	true	id.token.claim
ea09814e-683c-487d-bc35-579c508b404a	true	access.token.claim
ea09814e-683c-487d-bc35-579c508b404a	nickname	claim.name
ea09814e-683c-487d-bc35-579c508b404a	String	jsonType.label
fd49420b-c1dd-4737-9b12-36253338c457	true	userinfo.token.claim
fd49420b-c1dd-4737-9b12-36253338c457	username	user.attribute
fd49420b-c1dd-4737-9b12-36253338c457	true	id.token.claim
fd49420b-c1dd-4737-9b12-36253338c457	true	access.token.claim
fd49420b-c1dd-4737-9b12-36253338c457	preferred_username	claim.name
fd49420b-c1dd-4737-9b12-36253338c457	String	jsonType.label
33508fb7-7a81-459f-aa9d-c51049d7d237	true	userinfo.token.claim
33508fb7-7a81-459f-aa9d-c51049d7d237	email	user.attribute
33508fb7-7a81-459f-aa9d-c51049d7d237	true	id.token.claim
33508fb7-7a81-459f-aa9d-c51049d7d237	true	access.token.claim
33508fb7-7a81-459f-aa9d-c51049d7d237	email	claim.name
33508fb7-7a81-459f-aa9d-c51049d7d237	String	jsonType.label
3b2b457c-a1f7-4fee-bd03-f6eb550ba77d	true	userinfo.token.claim
3b2b457c-a1f7-4fee-bd03-f6eb550ba77d	emailVerified	user.attribute
3b2b457c-a1f7-4fee-bd03-f6eb550ba77d	true	id.token.claim
3b2b457c-a1f7-4fee-bd03-f6eb550ba77d	true	access.token.claim
3b2b457c-a1f7-4fee-bd03-f6eb550ba77d	email_verified	claim.name
3b2b457c-a1f7-4fee-bd03-f6eb550ba77d	boolean	jsonType.label
4506ac26-fb64-42c5-937b-fcf859aa6f5f	formatted	user.attribute.formatted
4506ac26-fb64-42c5-937b-fcf859aa6f5f	country	user.attribute.country
4506ac26-fb64-42c5-937b-fcf859aa6f5f	postal_code	user.attribute.postal_code
4506ac26-fb64-42c5-937b-fcf859aa6f5f	true	userinfo.token.claim
4506ac26-fb64-42c5-937b-fcf859aa6f5f	street	user.attribute.street
4506ac26-fb64-42c5-937b-fcf859aa6f5f	true	id.token.claim
4506ac26-fb64-42c5-937b-fcf859aa6f5f	region	user.attribute.region
4506ac26-fb64-42c5-937b-fcf859aa6f5f	true	access.token.claim
4506ac26-fb64-42c5-937b-fcf859aa6f5f	locality	user.attribute.locality
5a6b258f-15c9-487e-a0c0-c4d883094bc1	true	userinfo.token.claim
5a6b258f-15c9-487e-a0c0-c4d883094bc1	phoneNumber	user.attribute
5a6b258f-15c9-487e-a0c0-c4d883094bc1	true	id.token.claim
5a6b258f-15c9-487e-a0c0-c4d883094bc1	true	access.token.claim
5a6b258f-15c9-487e-a0c0-c4d883094bc1	phone_number	claim.name
5a6b258f-15c9-487e-a0c0-c4d883094bc1	String	jsonType.label
da5fbcd7-d7cb-4885-a480-041d7ec0ddf6	true	userinfo.token.claim
da5fbcd7-d7cb-4885-a480-041d7ec0ddf6	phoneNumberVerified	user.attribute
da5fbcd7-d7cb-4885-a480-041d7ec0ddf6	true	id.token.claim
da5fbcd7-d7cb-4885-a480-041d7ec0ddf6	true	access.token.claim
da5fbcd7-d7cb-4885-a480-041d7ec0ddf6	phone_number_verified	claim.name
da5fbcd7-d7cb-4885-a480-041d7ec0ddf6	boolean	jsonType.label
10915eeb-a053-478d-8475-77fe5a818c07	true	multivalued
10915eeb-a053-478d-8475-77fe5a818c07	foo	user.attribute
10915eeb-a053-478d-8475-77fe5a818c07	true	access.token.claim
10915eeb-a053-478d-8475-77fe5a818c07	resource_access.${client_id}.roles	claim.name
10915eeb-a053-478d-8475-77fe5a818c07	String	jsonType.label
4b9e86d1-54b4-43a9-a012-2b8c30b66781	true	multivalued
4b9e86d1-54b4-43a9-a012-2b8c30b66781	foo	user.attribute
4b9e86d1-54b4-43a9-a012-2b8c30b66781	true	access.token.claim
4b9e86d1-54b4-43a9-a012-2b8c30b66781	realm_access.roles	claim.name
4b9e86d1-54b4-43a9-a012-2b8c30b66781	String	jsonType.label
3b595558-3b4c-4814-bdb6-ea7116bba8a3	true	userinfo.token.claim
3b595558-3b4c-4814-bdb6-ea7116bba8a3	username	user.attribute
3b595558-3b4c-4814-bdb6-ea7116bba8a3	true	id.token.claim
3b595558-3b4c-4814-bdb6-ea7116bba8a3	true	access.token.claim
3b595558-3b4c-4814-bdb6-ea7116bba8a3	upn	claim.name
3b595558-3b4c-4814-bdb6-ea7116bba8a3	String	jsonType.label
ce59fb4c-9da8-4636-a5c5-f1bb44ecaea3	true	multivalued
ce59fb4c-9da8-4636-a5c5-f1bb44ecaea3	foo	user.attribute
ce59fb4c-9da8-4636-a5c5-f1bb44ecaea3	true	id.token.claim
ce59fb4c-9da8-4636-a5c5-f1bb44ecaea3	true	access.token.claim
ce59fb4c-9da8-4636-a5c5-f1bb44ecaea3	groups	claim.name
ce59fb4c-9da8-4636-a5c5-f1bb44ecaea3	String	jsonType.label
0479a525-4633-4fdd-8cf7-43aa1cbb1332	true	id.token.claim
0479a525-4633-4fdd-8cf7-43aa1cbb1332	true	access.token.claim
497e86c0-aedc-43e5-ba19-e9b57f06e94e	true	userinfo.token.claim
497e86c0-aedc-43e5-ba19-e9b57f06e94e	locale	user.attribute
497e86c0-aedc-43e5-ba19-e9b57f06e94e	true	id.token.claim
497e86c0-aedc-43e5-ba19-e9b57f06e94e	true	access.token.claim
497e86c0-aedc-43e5-ba19-e9b57f06e94e	locale	claim.name
497e86c0-aedc-43e5-ba19-e9b57f06e94e	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
1fdc94c4-226d-4d2a-96fc-e04291889300	60	300	60				t	f	0	keycloak	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	233dea85-107d-4587-8eda-2b74b1f472c1	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	b21c8d8d-10f9-4263-a81f-4181d74e6899	8f41c9c3-6bbb-4c01-a9d4-2f4814925627	a6c3c6e6-ffe6-4523-9cdf-1ca7f5c88261	1abc5ec7-c204-4ee0-a93c-fdb43f3ad49d	d5a162bb-8c51-4fa6-905a-4c56fedb9ff5	2592000	f	900	t	f	17fe9314-a100-42d5-8d1f-d6bb08c8772c	0	f	0	0	898a1703-ee98-452d-90bd-e1c9ed9d996b
20f9497d-ff36-42f0-8b47-64a1c65fc3df	60	300	300				t	f	0	fluytcloud	fluyt	0	\N	f	t	t	f	EXTERNAL	1800	36000	f	f	ff03b919-635c-4bac-b54f-14d5d5984439	1800	t	pt-BR	f	f	f	f	0	1	30	6	HmacSHA1	totp	74538e17-62d2-4cff-a53a-4b96511706d7	5425d512-59e4-4849-8274-42451ecda25c	016ea270-4a02-4ad5-999d-40a01bd68161	637a86f9-06dd-4470-ae73-1a20f7136dac	1877d22b-e6c5-4b0f-a92d-419b51bcad92	2592000	f	900	t	f	3312825b-f595-4361-9563-36739f6ed042	0	f	0	0	de7d57f4-9f04-4ff5-9b8b-233ce7db79fd
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
frontendUrl	20f9497d-ff36-42f0-8b47-64a1c65fc3df
acr.loa.map	20f9497d-ff36-42f0-8b47-64a1c65fc3df	[]
displayName	20f9497d-ff36-42f0-8b47-64a1c65fc3df
displayNameHtml	20f9497d-ff36-42f0-8b47-64a1c65fc3df
bruteForceProtected	20f9497d-ff36-42f0-8b47-64a1c65fc3df	false
permanentLockout	20f9497d-ff36-42f0-8b47-64a1c65fc3df	false
maxFailureWaitSeconds	20f9497d-ff36-42f0-8b47-64a1c65fc3df	900
minimumQuickLoginWaitSeconds	20f9497d-ff36-42f0-8b47-64a1c65fc3df	60
waitIncrementSeconds	20f9497d-ff36-42f0-8b47-64a1c65fc3df	60
quickLoginCheckMilliSeconds	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1000
maxDeltaTimeSeconds	20f9497d-ff36-42f0-8b47-64a1c65fc3df	43200
failureFactor	20f9497d-ff36-42f0-8b47-64a1c65fc3df	30
actionTokenGeneratedByAdminLifespan	20f9497d-ff36-42f0-8b47-64a1c65fc3df	43200
actionTokenGeneratedByUserLifespan	20f9497d-ff36-42f0-8b47-64a1c65fc3df	300
defaultSignatureAlgorithm	20f9497d-ff36-42f0-8b47-64a1c65fc3df	RS256
offlineSessionMaxLifespanEnabled	20f9497d-ff36-42f0-8b47-64a1c65fc3df	false
offlineSessionMaxLifespan	20f9497d-ff36-42f0-8b47-64a1c65fc3df	5184000
webAuthnPolicyRpEntityName	20f9497d-ff36-42f0-8b47-64a1c65fc3df	keycloak
webAuthnPolicySignatureAlgorithms	20f9497d-ff36-42f0-8b47-64a1c65fc3df	ES256
webAuthnPolicyRpId	20f9497d-ff36-42f0-8b47-64a1c65fc3df
oauth2DeviceCodeLifespan	20f9497d-ff36-42f0-8b47-64a1c65fc3df	600
oauth2DevicePollingInterval	20f9497d-ff36-42f0-8b47-64a1c65fc3df	5
webAuthnPolicyAttestationConveyancePreference	20f9497d-ff36-42f0-8b47-64a1c65fc3df	not specified
webAuthnPolicyAuthenticatorAttachment	20f9497d-ff36-42f0-8b47-64a1c65fc3df	not specified
webAuthnPolicyRequireResidentKey	20f9497d-ff36-42f0-8b47-64a1c65fc3df	not specified
webAuthnPolicyUserVerificationRequirement	20f9497d-ff36-42f0-8b47-64a1c65fc3df	not specified
webAuthnPolicyCreateTimeout	20f9497d-ff36-42f0-8b47-64a1c65fc3df	0
webAuthnPolicyAvoidSameAuthenticatorRegister	20f9497d-ff36-42f0-8b47-64a1c65fc3df	false
webAuthnPolicyRpEntityNamePasswordless	20f9497d-ff36-42f0-8b47-64a1c65fc3df	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	20f9497d-ff36-42f0-8b47-64a1c65fc3df	ES256
webAuthnPolicyRpIdPasswordless	20f9497d-ff36-42f0-8b47-64a1c65fc3df
webAuthnPolicyAttestationConveyancePreferencePasswordless	20f9497d-ff36-42f0-8b47-64a1c65fc3df	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	20f9497d-ff36-42f0-8b47-64a1c65fc3df	not specified
webAuthnPolicyRequireResidentKeyPasswordless	20f9497d-ff36-42f0-8b47-64a1c65fc3df	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	20f9497d-ff36-42f0-8b47-64a1c65fc3df	not specified
webAuthnPolicyCreateTimeoutPasswordless	20f9497d-ff36-42f0-8b47-64a1c65fc3df	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	20f9497d-ff36-42f0-8b47-64a1c65fc3df	false
client-policies.profiles	20f9497d-ff36-42f0-8b47-64a1c65fc3df	{"profiles":[]}
client-policies.policies	20f9497d-ff36-42f0-8b47-64a1c65fc3df	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	20f9497d-ff36-42f0-8b47-64a1c65fc3df
_browser_header.xContentTypeOptions	20f9497d-ff36-42f0-8b47-64a1c65fc3df	nosniff
_browser_header.xRobotsTag	20f9497d-ff36-42f0-8b47-64a1c65fc3df	none
_browser_header.xFrameOptions	20f9497d-ff36-42f0-8b47-64a1c65fc3df	SAMEORIGIN
_browser_header.contentSecurityPolicy	20f9497d-ff36-42f0-8b47-64a1c65fc3df	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
cibaBackchannelTokenDeliveryMode	20f9497d-ff36-42f0-8b47-64a1c65fc3df	poll
cibaExpiresIn	20f9497d-ff36-42f0-8b47-64a1c65fc3df	120
_browser_header.xXSSProtection	20f9497d-ff36-42f0-8b47-64a1c65fc3df	1; mode=block
_browser_header.strictTransportSecurity	20f9497d-ff36-42f0-8b47-64a1c65fc3df	max-age=31536000; includeSubDomains
cibaInterval	20f9497d-ff36-42f0-8b47-64a1c65fc3df	5
cibaAuthRequestedUserHint	20f9497d-ff36-42f0-8b47-64a1c65fc3df	login_hint
parRequestUriLifespan	20f9497d-ff36-42f0-8b47-64a1c65fc3df	60
cibaBackchannelTokenDeliveryMode	1fdc94c4-226d-4d2a-96fc-e04291889300	poll
cibaExpiresIn	1fdc94c4-226d-4d2a-96fc-e04291889300	120
cibaAuthRequestedUserHint	1fdc94c4-226d-4d2a-96fc-e04291889300	login_hint
parRequestUriLifespan	1fdc94c4-226d-4d2a-96fc-e04291889300	60
cibaInterval	1fdc94c4-226d-4d2a-96fc-e04291889300	5
oauth2DeviceCodeLifespan	1fdc94c4-226d-4d2a-96fc-e04291889300	600
oauth2DevicePollingInterval	1fdc94c4-226d-4d2a-96fc-e04291889300	5
clientSessionIdleTimeout	20f9497d-ff36-42f0-8b47-64a1c65fc3df	0
clientSessionMaxLifespan	20f9497d-ff36-42f0-8b47-64a1c65fc3df	0
clientSessionIdleTimeout	1fdc94c4-226d-4d2a-96fc-e04291889300	0
clientSessionMaxLifespan	1fdc94c4-226d-4d2a-96fc-e04291889300	0
clientOfflineSessionIdleTimeout	1fdc94c4-226d-4d2a-96fc-e04291889300	0
clientOfflineSessionMaxLifespan	1fdc94c4-226d-4d2a-96fc-e04291889300	0
clientOfflineSessionIdleTimeout	20f9497d-ff36-42f0-8b47-64a1c65fc3df	0
clientOfflineSessionMaxLifespan	20f9497d-ff36-42f0-8b47-64a1c65fc3df	0
displayName	1fdc94c4-226d-4d2a-96fc-e04291889300	Keycloak
displayNameHtml	1fdc94c4-226d-4d2a-96fc-e04291889300	<div class="kc-logo-text"><span>Keycloak</span></div>
bruteForceProtected	1fdc94c4-226d-4d2a-96fc-e04291889300	false
permanentLockout	1fdc94c4-226d-4d2a-96fc-e04291889300	false
maxFailureWaitSeconds	1fdc94c4-226d-4d2a-96fc-e04291889300	900
minimumQuickLoginWaitSeconds	1fdc94c4-226d-4d2a-96fc-e04291889300	60
waitIncrementSeconds	1fdc94c4-226d-4d2a-96fc-e04291889300	60
quickLoginCheckMilliSeconds	1fdc94c4-226d-4d2a-96fc-e04291889300	1000
maxDeltaTimeSeconds	1fdc94c4-226d-4d2a-96fc-e04291889300	43200
failureFactor	1fdc94c4-226d-4d2a-96fc-e04291889300	30
actionTokenGeneratedByAdminLifespan	1fdc94c4-226d-4d2a-96fc-e04291889300	43200
actionTokenGeneratedByUserLifespan	1fdc94c4-226d-4d2a-96fc-e04291889300	300
defaultSignatureAlgorithm	1fdc94c4-226d-4d2a-96fc-e04291889300	RS256
offlineSessionMaxLifespanEnabled	1fdc94c4-226d-4d2a-96fc-e04291889300	false
offlineSessionMaxLifespan	1fdc94c4-226d-4d2a-96fc-e04291889300	5184000
webAuthnPolicyRpEntityName	1fdc94c4-226d-4d2a-96fc-e04291889300	keycloak
webAuthnPolicySignatureAlgorithms	1fdc94c4-226d-4d2a-96fc-e04291889300	ES256
webAuthnPolicyRpId	1fdc94c4-226d-4d2a-96fc-e04291889300
webAuthnPolicyAttestationConveyancePreference	1fdc94c4-226d-4d2a-96fc-e04291889300	not specified
webAuthnPolicyAuthenticatorAttachment	1fdc94c4-226d-4d2a-96fc-e04291889300	not specified
webAuthnPolicyRequireResidentKey	1fdc94c4-226d-4d2a-96fc-e04291889300	not specified
webAuthnPolicyUserVerificationRequirement	1fdc94c4-226d-4d2a-96fc-e04291889300	not specified
webAuthnPolicyCreateTimeout	1fdc94c4-226d-4d2a-96fc-e04291889300	0
webAuthnPolicyAvoidSameAuthenticatorRegister	1fdc94c4-226d-4d2a-96fc-e04291889300	false
webAuthnPolicyRpEntityNamePasswordless	1fdc94c4-226d-4d2a-96fc-e04291889300	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	1fdc94c4-226d-4d2a-96fc-e04291889300	ES256
webAuthnPolicyRpIdPasswordless	1fdc94c4-226d-4d2a-96fc-e04291889300
webAuthnPolicyAttestationConveyancePreferencePasswordless	1fdc94c4-226d-4d2a-96fc-e04291889300	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	1fdc94c4-226d-4d2a-96fc-e04291889300	not specified
webAuthnPolicyRequireResidentKeyPasswordless	1fdc94c4-226d-4d2a-96fc-e04291889300	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	1fdc94c4-226d-4d2a-96fc-e04291889300	not specified
webAuthnPolicyCreateTimeoutPasswordless	1fdc94c4-226d-4d2a-96fc-e04291889300	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	1fdc94c4-226d-4d2a-96fc-e04291889300	false
client-policies.profiles	1fdc94c4-226d-4d2a-96fc-e04291889300	{"profiles":[]}
client-policies.policies	1fdc94c4-226d-4d2a-96fc-e04291889300	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	1fdc94c4-226d-4d2a-96fc-e04291889300
_browser_header.xContentTypeOptions	1fdc94c4-226d-4d2a-96fc-e04291889300	nosniff
_browser_header.xRobotsTag	1fdc94c4-226d-4d2a-96fc-e04291889300	none
_browser_header.xFrameOptions	1fdc94c4-226d-4d2a-96fc-e04291889300	SAMEORIGIN
_browser_header.contentSecurityPolicy	1fdc94c4-226d-4d2a-96fc-e04291889300	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	1fdc94c4-226d-4d2a-96fc-e04291889300	1; mode=block
_browser_header.strictTransportSecurity	1fdc94c4-226d-4d2a-96fc-e04291889300	max-age=31536000; includeSubDomains
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
1fdc94c4-226d-4d2a-96fc-e04291889300	jboss-logging
20f9497d-ff36-42f0-8b47-64a1c65fc3df	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	1fdc94c4-226d-4d2a-96fc-e04291889300
password	password	t	t	20f9497d-ff36-42f0-8b47-64a1c65fc3df
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
20f9497d-ff36-42f0-8b47-64a1c65fc3df	pt-BR
20f9497d-ff36-42f0-8b47-64a1c65fc3df	en
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.redirect_uris (client_id, value) FROM stdin;
dd08fab5-5264-424e-8867-f10b7aec5f5b	/realms/master/account/*
fb151bdb-be96-4970-9814-848bdbb9d0c1	/realms/master/account/*
69589433-2f6e-4175-8fff-1dd9b49b71bc	/admin/master/console/*
5bad9d86-4193-457a-903c-95c2ec701f7b	/realms/keycloak/account/*
42b55fe7-b70b-4eab-9543-cb75038f4088	https://keycloak.fluytcloud.com
42b55fe7-b70b-4eab-9543-cb75038f4088	http://localhost:4200/*
42b55fe7-b70b-4eab-9543-cb75038f4088	http://localhost/*
42b55fe7-b70b-4eab-9543-cb75038f4088	https://keycloak.fluytcloud.com/*
42b55fe7-b70b-4eab-9543-cb75038f4088	https://oauth.pstmn.io/v1/callback
71a45c32-9354-4859-a43a-cb34dd1eac51	/*
499f92ad-3f8e-495e-b224-252c84a7cc7e	/admin/fluyt/console/*
b70432c4-b75f-4588-ba96-b77a22c12aaf	/realms/fluyt/account/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
dc137018-2cd4-4f58-b135-8c7a9a39013f	VERIFY_EMAIL	Verify Email	1fdc94c4-226d-4d2a-96fc-e04291889300	t	f	VERIFY_EMAIL	50
d5794837-4ec0-4ec3-98cf-268a77150632	UPDATE_PROFILE	Update Profile	1fdc94c4-226d-4d2a-96fc-e04291889300	t	f	UPDATE_PROFILE	40
fb02622b-f9fd-44c6-908f-9b1a78f21db8	CONFIGURE_TOTP	Configure OTP	1fdc94c4-226d-4d2a-96fc-e04291889300	t	f	CONFIGURE_TOTP	10
9a1b6ee5-38be-486f-93d3-d9b2ff4496d5	UPDATE_PASSWORD	Update Password	1fdc94c4-226d-4d2a-96fc-e04291889300	t	f	UPDATE_PASSWORD	30
f5df7448-09f8-4920-9350-b5d3b804248b	terms_and_conditions	Terms and Conditions	1fdc94c4-226d-4d2a-96fc-e04291889300	f	f	terms_and_conditions	20
07eb10e0-4c76-41f5-8bdd-9af610e18a04	update_user_locale	Update User Locale	1fdc94c4-226d-4d2a-96fc-e04291889300	t	f	update_user_locale	1000
defef065-6ca3-47f4-8af3-893af41655c1	delete_account	Delete Account	1fdc94c4-226d-4d2a-96fc-e04291889300	f	f	delete_account	60
5eeb5336-28b0-40e5-9abb-9ca971e7b6aa	webauthn-register	Webauthn Register	1fdc94c4-226d-4d2a-96fc-e04291889300	t	f	webauthn-register	70
39d15f5b-12ff-4869-b81b-5f0965f1f1c3	webauthn-register-passwordless	Webauthn Register Passwordless	1fdc94c4-226d-4d2a-96fc-e04291889300	t	f	webauthn-register-passwordless	80
a78513a2-123c-4ed4-ae03-0460f51c7b9f	VERIFY_EMAIL	Verify Email	20f9497d-ff36-42f0-8b47-64a1c65fc3df	t	f	VERIFY_EMAIL	50
c459dbb4-bc44-45af-9ed7-d4c843772433	UPDATE_PROFILE	Update Profile	20f9497d-ff36-42f0-8b47-64a1c65fc3df	t	f	UPDATE_PROFILE	40
8d46bb4f-8716-48f1-ad4b-1d3acd207b72	CONFIGURE_TOTP	Configure OTP	20f9497d-ff36-42f0-8b47-64a1c65fc3df	t	f	CONFIGURE_TOTP	10
5cf31fb4-8ece-4811-839c-13664ed4c242	UPDATE_PASSWORD	Update Password	20f9497d-ff36-42f0-8b47-64a1c65fc3df	t	f	UPDATE_PASSWORD	30
088cc346-968b-4fc4-b80b-9495053cd147	terms_and_conditions	Terms and Conditions	20f9497d-ff36-42f0-8b47-64a1c65fc3df	f	f	terms_and_conditions	20
193a07d3-c9d4-4ea0-99a6-9e0dc0ada784	update_user_locale	Update User Locale	20f9497d-ff36-42f0-8b47-64a1c65fc3df	t	f	update_user_locale	1000
4d0fff3a-cc6a-4fac-b02e-e875b13153c9	delete_account	Delete Account	20f9497d-ff36-42f0-8b47-64a1c65fc3df	f	f	delete_account	60
964796cc-6023-471f-8b68-f0769927fbc0	webauthn-register	Webauthn Register	20f9497d-ff36-42f0-8b47-64a1c65fc3df	t	f	webauthn-register	70
853e062c-bc29-418a-9dad-ef0c583f5483	webauthn-register-passwordless	Webauthn Register Passwordless	20f9497d-ff36-42f0-8b47-64a1c65fc3df	t	f	webauthn-register-passwordless	80
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
71a45c32-9354-4859-a43a-cb34dd1eac51	t	0	1
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
e75f858e-d8a5-4de2-88cb-54ee6fee6824	Default Policy	A policy that grants access only for users within this realm	js	0	0	71a45c32-9354-4859-a43a-cb34dd1eac51	\N
ff551c82-26a2-4dd2-977c-7801eb7ed50b	Default Permission	A permission that applies to the default resource type	resource	1	0	71a45c32-9354-4859-a43a-cb34dd1eac51	\N
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
8d1b5b5a-9229-4bcd-8e3d-71a434f277b7	Default Resource	urn:app-backend:resources:default	\N	71a45c32-9354-4859-a43a-cb34dd1eac51	71a45c32-9354-4859-a43a-cb34dd1eac51	f	\N
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.resource_uris (resource_id, value) FROM stdin;
8d1b5b5a-9229-4bcd-8e3d-71a434f277b7	/*
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
fb151bdb-be96-4970-9814-848bdbb9d0c1	f191d84b-90c2-4dfe-af43-d7c93ee914e9
5bad9d86-4193-457a-903c-95c2ec701f7b	b4eb8170-5a54-4b95-bb98-c6e4559ea51f
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
bb80b78a-c792-4041-9eca-3b7403da810e	\N	e84a342e-d19e-47a9-863b-d0ecbff8fb88	f	t	\N	\N	\N	1fdc94c4-226d-4d2a-96fc-e04291889300	admin	1659806877321	\N	0
b8699ad9-7665-4fd2-a382-839b9c26b93c	\N	69e817e9-27ae-4ce2-a62b-78f448a7b5e3	f	t	\N	\N	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	service-account-app-backend	1662425808208	71a45c32-9354-4859-a43a-cb34dd1eac51	0
2800183b-b9e5-4b18-b42b-a1d1a773deff	user@fluyt.com	user@fluyt.com	f	t	\N	user	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	user@fluyt.com	1682078403048	\N	0
43d65449-f8f4-46b9-a761-f3bdeb77c06e	manager@fluyt.com	manager@fluyt.com	f	t	\N	manager	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	manager@fluyt.com	1682078542665	\N	0
c7403070-a343-4f59-bc3b-2bc396728f2c	multi-tenant@fluyt.com	multi-tenant@fluyt.com	f	t	\N	multi-tenant	\N	20f9497d-ff36-42f0-8b47-64a1c65fc3df	multi-tenant@fluyt.com	1682078638417	\N	0
8309bca3-1d02-468e-b172-94fe14b23d37	admin@fluyt.com	admin@fluyt.com	f	t	\N	Admin	Fluyt	20f9497d-ff36-42f0-8b47-64a1c65fc3df	admin	1682078787544	\N	0
a11a4856-4b65-4249-b092-f73e613a930a	test@fluyt.com	test@fluyt.com	f	t	\N	Test	Manager	20f9497d-ff36-42f0-8b47-64a1c65fc3df	test	1682079109124	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
3495d34a-407b-4585-abc7-a91ff1b8707e	2800183b-b9e5-4b18-b42b-a1d1a773deff
b5a12a74-e07c-494e-b1ca-7ae2884adc65	43d65449-f8f4-46b9-a761-f3bdeb77c06e
659e146a-9db0-48f8-b485-4f5dbb97e0c3	c7403070-a343-4f59-bc3b-2bc396728f2c
b5a12a74-e07c-494e-b1ca-7ae2884adc65	c7403070-a343-4f59-bc3b-2bc396728f2c
3495d34a-407b-4585-abc7-a91ff1b8707e	c7403070-a343-4f59-bc3b-2bc396728f2c
659e146a-9db0-48f8-b485-4f5dbb97e0c3	a11a4856-4b65-4249-b092-f73e613a930a
3495d34a-407b-4585-abc7-a91ff1b8707e	a11a4856-4b65-4249-b092-f73e613a930a
b5a12a74-e07c-494e-b1ca-7ae2884adc65	a11a4856-4b65-4249-b092-f73e613a930a
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
898a1703-ee98-452d-90bd-e1c9ed9d996b	bb80b78a-c792-4041-9eca-3b7403da810e
4dccc09d-d8a8-4f8b-8fc6-831e52ebeaaa	bb80b78a-c792-4041-9eca-3b7403da810e
07421ae9-50dc-4d65-8508-85077f46cd51	bb80b78a-c792-4041-9eca-3b7403da810e
bb2b004a-13bf-4490-baf9-78b312a521d9	bb80b78a-c792-4041-9eca-3b7403da810e
239d1d24-776e-41ef-b465-9d62c1b638eb	bb80b78a-c792-4041-9eca-3b7403da810e
6417d1d9-7ccb-4eee-a959-012d96a4ff41	bb80b78a-c792-4041-9eca-3b7403da810e
bce7221f-582a-4e6b-a87e-f77a4d7bda7d	bb80b78a-c792-4041-9eca-3b7403da810e
15f5580d-e0e2-4621-ba7a-4ac1e2791e5e	bb80b78a-c792-4041-9eca-3b7403da810e
946ab484-e473-458d-a623-8b61153f46ba	bb80b78a-c792-4041-9eca-3b7403da810e
8f011b19-591f-4734-96e0-5522aa6f4a58	bb80b78a-c792-4041-9eca-3b7403da810e
74756c0c-63f2-47bd-a215-7b564d301a2f	bb80b78a-c792-4041-9eca-3b7403da810e
47d35844-019e-4945-9828-88815472c190	bb80b78a-c792-4041-9eca-3b7403da810e
1f268a66-ef23-42c8-bb7e-4fd547830d12	bb80b78a-c792-4041-9eca-3b7403da810e
abf13058-0b9a-403d-952d-ebed1b0b1f3e	bb80b78a-c792-4041-9eca-3b7403da810e
e1b50dfe-56c9-4944-941c-5c81498944b6	bb80b78a-c792-4041-9eca-3b7403da810e
ec626861-0e4e-48b1-a11c-8b06706b0970	bb80b78a-c792-4041-9eca-3b7403da810e
5ec3243d-0761-4aee-9499-39a77f882b8c	bb80b78a-c792-4041-9eca-3b7403da810e
6264cb1a-e26e-4727-a9e8-cf2a2a386410	bb80b78a-c792-4041-9eca-3b7403da810e
39af844e-0961-4d0a-b3ad-716c6ab1ea6c	bb80b78a-c792-4041-9eca-3b7403da810e
de7d57f4-9f04-4ff5-9b8b-233ce7db79fd	b8699ad9-7665-4fd2-a382-839b9c26b93c
146270d0-2a55-415b-9c65-58f05d25ece2	b8699ad9-7665-4fd2-a382-839b9c26b93c
5e8541ee-9981-4069-b562-b8de6d38be18	b8699ad9-7665-4fd2-a382-839b9c26b93c
ae2ac03e-45b0-44b7-b0cb-58159fe066e8	b8699ad9-7665-4fd2-a382-839b9c26b93c
9112f935-396c-48d8-968e-5db7a2d0e2c2	b8699ad9-7665-4fd2-a382-839b9c26b93c
0b167a5e-07b6-44a1-b137-8eed98cda768	b8699ad9-7665-4fd2-a382-839b9c26b93c
6383e5e1-2f19-4c93-9693-c1d5559e7e0f	b8699ad9-7665-4fd2-a382-839b9c26b93c
ed861dc0-f313-4724-8b53-836b7e26da1c	b8699ad9-7665-4fd2-a382-839b9c26b93c
5b05d666-7816-4fd7-9165-c5f9e3b6df8f	b8699ad9-7665-4fd2-a382-839b9c26b93c
3498a436-2048-4690-acba-89fb5aefb45b	b8699ad9-7665-4fd2-a382-839b9c26b93c
6e657f01-3623-480d-8a18-9335e44323a5	b8699ad9-7665-4fd2-a382-839b9c26b93c
b2e1e8db-c42e-4f19-a044-f49610972d2c	b8699ad9-7665-4fd2-a382-839b9c26b93c
3b163124-5127-42a7-b483-b7bde90e66ed	b8699ad9-7665-4fd2-a382-839b9c26b93c
714b33e1-0d58-44cc-a937-539aa13a72c1	b8699ad9-7665-4fd2-a382-839b9c26b93c
ab082486-86cf-478e-a4ba-2e19437cacc3	b8699ad9-7665-4fd2-a382-839b9c26b93c
49163e9a-4359-4d8f-96fa-5d5b48181df2	b8699ad9-7665-4fd2-a382-839b9c26b93c
e29a8608-5c25-43cc-bd63-9bdd091dee4e	b8699ad9-7665-4fd2-a382-839b9c26b93c
04d30821-8da9-41c0-b7cd-91e669baecbb	b8699ad9-7665-4fd2-a382-839b9c26b93c
705d3c1b-0e43-4b85-b9fa-712ce99476e4	b8699ad9-7665-4fd2-a382-839b9c26b93c
f114dee8-a2ee-476c-8243-f2006304d177	b8699ad9-7665-4fd2-a382-839b9c26b93c
0cd693d0-6556-4a19-9faa-6f352024b5db	b8699ad9-7665-4fd2-a382-839b9c26b93c
991482d8-0dc7-4e88-b259-404a743dddbc	b8699ad9-7665-4fd2-a382-839b9c26b93c
45df5603-6a79-4969-8716-f6501139ca23	b8699ad9-7665-4fd2-a382-839b9c26b93c
89d7d64f-a1be-414a-a96c-fd57d6238a42	b8699ad9-7665-4fd2-a382-839b9c26b93c
1d5353dc-ce7e-4008-9a7b-11d60540df7c	b8699ad9-7665-4fd2-a382-839b9c26b93c
84c1bc66-5b33-44a4-b699-1909d2e4d4a7	b8699ad9-7665-4fd2-a382-839b9c26b93c
64b5c4c3-ad06-4d1f-9938-f15b6d7ef914	b8699ad9-7665-4fd2-a382-839b9c26b93c
d0971eb0-23c7-46c0-9d20-ed731b47145b	b8699ad9-7665-4fd2-a382-839b9c26b93c
43f54114-d9c6-40c5-a27b-2081311aeeae	b8699ad9-7665-4fd2-a382-839b9c26b93c
b4eb8170-5a54-4b95-bb98-c6e4559ea51f	b8699ad9-7665-4fd2-a382-839b9c26b93c
0ba97173-b46a-401a-82c7-e835cd9081cc	b8699ad9-7665-4fd2-a382-839b9c26b93c
fedb2fc9-467e-47ca-a2fd-7935f317e3d8	b8699ad9-7665-4fd2-a382-839b9c26b93c
14c342b1-29de-4a44-aa1c-c26f8c60baa0	b8699ad9-7665-4fd2-a382-839b9c26b93c
d3ad4bff-c6a4-4fb7-8df5-f0a5985d3cdd	b8699ad9-7665-4fd2-a382-839b9c26b93c
de7d57f4-9f04-4ff5-9b8b-233ce7db79fd	2800183b-b9e5-4b18-b42b-a1d1a773deff
9112f935-396c-48d8-968e-5db7a2d0e2c2	2800183b-b9e5-4b18-b42b-a1d1a773deff
de7d57f4-9f04-4ff5-9b8b-233ce7db79fd	43d65449-f8f4-46b9-a761-f3bdeb77c06e
9112f935-396c-48d8-968e-5db7a2d0e2c2	43d65449-f8f4-46b9-a761-f3bdeb77c06e
6383e5e1-2f19-4c93-9693-c1d5559e7e0f	43d65449-f8f4-46b9-a761-f3bdeb77c06e
de7d57f4-9f04-4ff5-9b8b-233ce7db79fd	c7403070-a343-4f59-bc3b-2bc396728f2c
9112f935-396c-48d8-968e-5db7a2d0e2c2	c7403070-a343-4f59-bc3b-2bc396728f2c
6383e5e1-2f19-4c93-9693-c1d5559e7e0f	c7403070-a343-4f59-bc3b-2bc396728f2c
de7d57f4-9f04-4ff5-9b8b-233ce7db79fd	8309bca3-1d02-468e-b172-94fe14b23d37
0b167a5e-07b6-44a1-b137-8eed98cda768	8309bca3-1d02-468e-b172-94fe14b23d37
5e8541ee-9981-4069-b562-b8de6d38be18	8309bca3-1d02-468e-b172-94fe14b23d37
ae2ac03e-45b0-44b7-b0cb-58159fe066e8	8309bca3-1d02-468e-b172-94fe14b23d37
9112f935-396c-48d8-968e-5db7a2d0e2c2	8309bca3-1d02-468e-b172-94fe14b23d37
6383e5e1-2f19-4c93-9693-c1d5559e7e0f	8309bca3-1d02-468e-b172-94fe14b23d37
64b5c4c3-ad06-4d1f-9938-f15b6d7ef914	8309bca3-1d02-468e-b172-94fe14b23d37
fedb2fc9-467e-47ca-a2fd-7935f317e3d8	8309bca3-1d02-468e-b172-94fe14b23d37
d0971eb0-23c7-46c0-9d20-ed731b47145b	8309bca3-1d02-468e-b172-94fe14b23d37
14c342b1-29de-4a44-aa1c-c26f8c60baa0	8309bca3-1d02-468e-b172-94fe14b23d37
0ba97173-b46a-401a-82c7-e835cd9081cc	8309bca3-1d02-468e-b172-94fe14b23d37
b4eb8170-5a54-4b95-bb98-c6e4559ea51f	8309bca3-1d02-468e-b172-94fe14b23d37
43f54114-d9c6-40c5-a27b-2081311aeeae	8309bca3-1d02-468e-b172-94fe14b23d37
04d30821-8da9-41c0-b7cd-91e669baecbb	8309bca3-1d02-468e-b172-94fe14b23d37
45df5603-6a79-4969-8716-f6501139ca23	8309bca3-1d02-468e-b172-94fe14b23d37
1d5353dc-ce7e-4008-9a7b-11d60540df7c	8309bca3-1d02-468e-b172-94fe14b23d37
84c1bc66-5b33-44a4-b699-1909d2e4d4a7	8309bca3-1d02-468e-b172-94fe14b23d37
89d7d64f-a1be-414a-a96c-fd57d6238a42	8309bca3-1d02-468e-b172-94fe14b23d37
ed861dc0-f313-4724-8b53-836b7e26da1c	8309bca3-1d02-468e-b172-94fe14b23d37
5b05d666-7816-4fd7-9165-c5f9e3b6df8f	8309bca3-1d02-468e-b172-94fe14b23d37
3498a436-2048-4690-acba-89fb5aefb45b	8309bca3-1d02-468e-b172-94fe14b23d37
b2e1e8db-c42e-4f19-a044-f49610972d2c	8309bca3-1d02-468e-b172-94fe14b23d37
49163e9a-4359-4d8f-96fa-5d5b48181df2	8309bca3-1d02-468e-b172-94fe14b23d37
991482d8-0dc7-4e88-b259-404a743dddbc	8309bca3-1d02-468e-b172-94fe14b23d37
6e657f01-3623-480d-8a18-9335e44323a5	8309bca3-1d02-468e-b172-94fe14b23d37
d3ad4bff-c6a4-4fb7-8df5-f0a5985d3cdd	8309bca3-1d02-468e-b172-94fe14b23d37
f114dee8-a2ee-476c-8243-f2006304d177	8309bca3-1d02-468e-b172-94fe14b23d37
146270d0-2a55-415b-9c65-58f05d25ece2	8309bca3-1d02-468e-b172-94fe14b23d37
e29a8608-5c25-43cc-bd63-9bdd091dee4e	8309bca3-1d02-468e-b172-94fe14b23d37
3b163124-5127-42a7-b483-b7bde90e66ed	8309bca3-1d02-468e-b172-94fe14b23d37
ab082486-86cf-478e-a4ba-2e19437cacc3	8309bca3-1d02-468e-b172-94fe14b23d37
de7d57f4-9f04-4ff5-9b8b-233ce7db79fd	a11a4856-4b65-4249-b092-f73e613a930a
9112f935-396c-48d8-968e-5db7a2d0e2c2	a11a4856-4b65-4249-b092-f73e613a930a
6383e5e1-2f19-4c93-9693-c1d5559e7e0f	a11a4856-4b65-4249-b092-f73e613a930a
0cd693d0-6556-4a19-9faa-6f352024b5db	8309bca3-1d02-468e-b172-94fe14b23d37
705d3c1b-0e43-4b85-b9fa-712ce99476e4	8309bca3-1d02-468e-b172-94fe14b23d37
714b33e1-0d58-44cc-a937-539aa13a72c1	8309bca3-1d02-468e-b172-94fe14b23d37
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.web_origins (client_id, value) FROM stdin;
69589433-2f6e-4175-8fff-1dd9b49b71bc	+
499f92ad-3f8e-495e-b224-252c84a7cc7e	+
42b55fe7-b70b-4eab-9543-cb75038f4088
42b55fe7-b70b-4eab-9543-cb75038f4088	+
71a45c32-9354-4859-a43a-cb34dd1eac51	/*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

