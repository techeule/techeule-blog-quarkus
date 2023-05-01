CREATE USER oidc_keycloak WITH PASSWORD 'oidc-keycloak-password';
CREATE DATABASE oidc_keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
ALTER DATABASE oidc_keycloak OWNER TO "oidc_keycloak";

\connect oidc_keycloak

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.7 (Homebrew)

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

ALTER TABLE IF EXISTS ONLY public.identity_provider_config DROP CONSTRAINT IF EXISTS fkdc4897cf864c4e43;
ALTER TABLE IF EXISTS ONLY public.policy_config DROP CONSTRAINT IF EXISTS fkdc34197cf864c4e43;
ALTER TABLE IF EXISTS ONLY public.user_group_membership DROP CONSTRAINT IF EXISTS fk_user_group_user;
ALTER TABLE IF EXISTS ONLY public.user_federation_config DROP CONSTRAINT IF EXISTS fk_t13hpu1j94r2ebpekr39x5eu5;
ALTER TABLE IF EXISTS ONLY public.realm_supported_locales DROP CONSTRAINT IF EXISTS fk_supported_locales_realm;
ALTER TABLE IF EXISTS ONLY public.role_attribute DROP CONSTRAINT IF EXISTS fk_role_attribute_id;
ALTER TABLE IF EXISTS ONLY public.resource_uris DROP CONSTRAINT IF EXISTS fk_resource_server_uris;
ALTER TABLE IF EXISTS ONLY public.required_action_provider DROP CONSTRAINT IF EXISTS fk_req_act_realm;
ALTER TABLE IF EXISTS ONLY public.default_client_scope DROP CONSTRAINT IF EXISTS fk_r_def_cli_scope_realm;
ALTER TABLE IF EXISTS ONLY public.protocol_mapper_config DROP CONSTRAINT IF EXISTS fk_pmconfig;
ALTER TABLE IF EXISTS ONLY public.credential DROP CONSTRAINT IF EXISTS fk_pfyr0glasqyl0dei3kl69r6v0;
ALTER TABLE IF EXISTS ONLY public.protocol_mapper DROP CONSTRAINT IF EXISTS fk_pcm_realm;
ALTER TABLE IF EXISTS ONLY public.scope_mapping DROP CONSTRAINT IF EXISTS fk_ouse064plmlr732lxjcn1q5f1;
ALTER TABLE IF EXISTS ONLY public.web_origins DROP CONSTRAINT IF EXISTS fk_lojpho213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.idp_mapper_config DROP CONSTRAINT IF EXISTS fk_idpmconfig;
ALTER TABLE IF EXISTS ONLY public.identity_provider_mapper DROP CONSTRAINT IF EXISTS fk_idpm_realm;
ALTER TABLE IF EXISTS ONLY public.realm_events_listeners DROP CONSTRAINT IF EXISTS fk_h846o4h0w8epx5nxev9f5y69j;
ALTER TABLE IF EXISTS ONLY public.realm_enabled_event_types DROP CONSTRAINT IF EXISTS fk_h846o4h0w8epx5nwedrf5y69j;
ALTER TABLE IF EXISTS ONLY public.group_role_mapping DROP CONSTRAINT IF EXISTS fk_group_role_group;
ALTER TABLE IF EXISTS ONLY public.group_attribute DROP CONSTRAINT IF EXISTS fk_group_attribute_group;
ALTER TABLE IF EXISTS ONLY public.user_consent DROP CONSTRAINT IF EXISTS fk_grntcsnt_user;
ALTER TABLE IF EXISTS ONLY public.user_consent_client_scope DROP CONSTRAINT IF EXISTS fk_grntcsnt_clsc_usc;
ALTER TABLE IF EXISTS ONLY public.composite_role DROP CONSTRAINT IF EXISTS fk_gr7thllb9lu8q4vqa4524jjy8;
ALTER TABLE IF EXISTS ONLY public.resource_server_scope DROP CONSTRAINT IF EXISTS fk_frsrso213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_scope DROP CONSTRAINT IF EXISTS fk_frsrps213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_policy DROP CONSTRAINT IF EXISTS fk_frsrpp213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_policy DROP CONSTRAINT IF EXISTS fk_frsrpos53xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_scope DROP CONSTRAINT IF EXISTS fk_frsrpos13xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_server_policy DROP CONSTRAINT IF EXISTS fk_frsrpo213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_server_perm_ticket DROP CONSTRAINT IF EXISTS fk_frsrpo2128cx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.scope_policy DROP CONSTRAINT IF EXISTS fk_frsrpass3xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.associated_policy DROP CONSTRAINT IF EXISTS fk_frsrpas14xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_server_perm_ticket DROP CONSTRAINT IF EXISTS fk_frsrho213xcx4wnkog84sspmt;
ALTER TABLE IF EXISTS ONLY public.resource_server_perm_ticket DROP CONSTRAINT IF EXISTS fk_frsrho213xcx4wnkog83sspmt;
ALTER TABLE IF EXISTS ONLY public.resource_server_resource DROP CONSTRAINT IF EXISTS fk_frsrho213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.resource_server_perm_ticket DROP CONSTRAINT IF EXISTS fk_frsrho213xcx4wnkog82sspmt;
ALTER TABLE IF EXISTS ONLY public.scope_policy DROP CONSTRAINT IF EXISTS fk_frsrasp13xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.associated_policy DROP CONSTRAINT IF EXISTS fk_frsr5s213xcx4wnkog82ssrfy;
ALTER TABLE IF EXISTS ONLY public.user_federation_mapper DROP CONSTRAINT IF EXISTS fk_fedmapperpm_realm;
ALTER TABLE IF EXISTS ONLY public.user_federation_mapper DROP CONSTRAINT IF EXISTS fk_fedmapperpm_fedprv;
ALTER TABLE IF EXISTS ONLY public.user_federation_mapper_config DROP CONSTRAINT IF EXISTS fk_fedmapper_cfg;
ALTER TABLE IF EXISTS ONLY public.realm_default_groups DROP CONSTRAINT IF EXISTS fk_def_groups_realm;
ALTER TABLE IF EXISTS ONLY public.component DROP CONSTRAINT IF EXISTS fk_component_realm;
ALTER TABLE IF EXISTS ONLY public.component_config DROP CONSTRAINT IF EXISTS fk_component_config;
ALTER TABLE IF EXISTS ONLY public.client_initial_access DROP CONSTRAINT IF EXISTS fk_client_init_acc_realm;
ALTER TABLE IF EXISTS ONLY public.protocol_mapper DROP CONSTRAINT IF EXISTS fk_cli_scope_mapper;
ALTER TABLE IF EXISTS ONLY public.client_user_session_note DROP CONSTRAINT IF EXISTS fk_cl_usr_ses_note;
ALTER TABLE IF EXISTS ONLY public.client_scope_role_mapping DROP CONSTRAINT IF EXISTS fk_cl_scope_rm_scope;
ALTER TABLE IF EXISTS ONLY public.client_scope_attributes DROP CONSTRAINT IF EXISTS fk_cl_scope_attr_scope;
ALTER TABLE IF EXISTS ONLY public.user_role_mapping DROP CONSTRAINT IF EXISTS fk_c4fqv34p1mbylloxang7b1q3l;
ALTER TABLE IF EXISTS ONLY public.client_session DROP CONSTRAINT IF EXISTS fk_b4ao2vcvat6ukau74wbwtfqo1;
ALTER TABLE IF EXISTS ONLY public.authenticator_config DROP CONSTRAINT IF EXISTS fk_auth_realm;
ALTER TABLE IF EXISTS ONLY public.authentication_flow DROP CONSTRAINT IF EXISTS fk_auth_flow_realm;
ALTER TABLE IF EXISTS ONLY public.authentication_execution DROP CONSTRAINT IF EXISTS fk_auth_exec_realm;
ALTER TABLE IF EXISTS ONLY public.authentication_execution DROP CONSTRAINT IF EXISTS fk_auth_exec_flow;
ALTER TABLE IF EXISTS ONLY public.composite_role DROP CONSTRAINT IF EXISTS fk_a63wvekftu8jo1pnj81e7mce2;
ALTER TABLE IF EXISTS ONLY public.realm_attribute DROP CONSTRAINT IF EXISTS fk_8shxd6l3e9atqukacxgpffptw;
ALTER TABLE IF EXISTS ONLY public.realm_smtp_config DROP CONSTRAINT IF EXISTS fk_70ej8xdxgxd0b9hh6180irr0o;
ALTER TABLE IF EXISTS ONLY public.keycloak_role DROP CONSTRAINT IF EXISTS fk_6vyqfe4cn4wlq8r6kt5vdsj5c;
ALTER TABLE IF EXISTS ONLY public.user_required_action DROP CONSTRAINT IF EXISTS fk_6qj3w1jw9cvafhe19bwsiuvmd;
ALTER TABLE IF EXISTS ONLY public.user_attribute DROP CONSTRAINT IF EXISTS fk_5hrm2vlf9ql5fu043kqepovbr;
ALTER TABLE IF EXISTS ONLY public.resource_attribute DROP CONSTRAINT IF EXISTS fk_5hrm2vlf9ql5fu022kqepovbr;
ALTER TABLE IF EXISTS ONLY public.realm_required_credential DROP CONSTRAINT IF EXISTS fk_5hg65lybevavkqfki3kponh9v;
ALTER TABLE IF EXISTS ONLY public.client_session_prot_mapper DROP CONSTRAINT IF EXISTS fk_33a8sgqw18i532811v7o2dk89;
ALTER TABLE IF EXISTS ONLY public.user_federation_provider DROP CONSTRAINT IF EXISTS fk_1fj32f6ptolw2qy60cd8n01e8;
ALTER TABLE IF EXISTS ONLY public.redirect_uris DROP CONSTRAINT IF EXISTS fk_1burs8pb4ouj97h5wuppahv9f;
ALTER TABLE IF EXISTS ONLY public.client_session_role DROP CONSTRAINT IF EXISTS fk_11b7sgqw18i532811v7o2dv76;
ALTER TABLE IF EXISTS ONLY public.user_session_note DROP CONSTRAINT IF EXISTS fk5edfb00ff51d3472;
ALTER TABLE IF EXISTS ONLY public.client_session_note DROP CONSTRAINT IF EXISTS fk5edfb00ff51c2736;
ALTER TABLE IF EXISTS ONLY public.client_node_registrations DROP CONSTRAINT IF EXISTS fk4129723ba992f594;
ALTER TABLE IF EXISTS ONLY public.federated_identity DROP CONSTRAINT IF EXISTS fk404288b92ef007a6;
ALTER TABLE IF EXISTS ONLY public.client_attributes DROP CONSTRAINT IF EXISTS fk3c47c64beacca966;
ALTER TABLE IF EXISTS ONLY public.identity_provider DROP CONSTRAINT IF EXISTS fk2b4ebc52ae5c3b34;
ALTER TABLE IF EXISTS ONLY public.client_session_auth_status DROP CONSTRAINT IF EXISTS auth_status_constraint;
DROP INDEX IF EXISTS public.idx_web_orig_client;
DROP INDEX IF EXISTS public.idx_usr_fed_prv_realm;
DROP INDEX IF EXISTS public.idx_usr_fed_map_realm;
DROP INDEX IF EXISTS public.idx_usr_fed_map_fed_prv;
DROP INDEX IF EXISTS public.idx_user_service_account;
DROP INDEX IF EXISTS public.idx_user_role_mapping;
DROP INDEX IF EXISTS public.idx_user_reqactions;
DROP INDEX IF EXISTS public.idx_user_group_mapping;
DROP INDEX IF EXISTS public.idx_user_email;
DROP INDEX IF EXISTS public.idx_user_credential;
DROP INDEX IF EXISTS public.idx_user_consent;
DROP INDEX IF EXISTS public.idx_user_attribute_name;
DROP INDEX IF EXISTS public.idx_user_attribute;
DROP INDEX IF EXISTS public.idx_usconsent_clscope;
DROP INDEX IF EXISTS public.idx_us_sess_id_on_cl_sess;
DROP INDEX IF EXISTS public.idx_update_time;
DROP INDEX IF EXISTS public.idx_scope_policy_policy;
DROP INDEX IF EXISTS public.idx_scope_mapping_role;
DROP INDEX IF EXISTS public.idx_role_clscope;
DROP INDEX IF EXISTS public.idx_role_attribute;
DROP INDEX IF EXISTS public.idx_res_srv_scope_res_srv;
DROP INDEX IF EXISTS public.idx_res_srv_res_res_srv;
DROP INDEX IF EXISTS public.idx_res_serv_pol_res_serv;
DROP INDEX IF EXISTS public.idx_res_scope_scope;
DROP INDEX IF EXISTS public.idx_res_policy_policy;
DROP INDEX IF EXISTS public.idx_req_act_prov_realm;
DROP INDEX IF EXISTS public.idx_redir_uri_client;
DROP INDEX IF EXISTS public.idx_realm_supp_local_realm;
DROP INDEX IF EXISTS public.idx_realm_master_adm_cli;
DROP INDEX IF EXISTS public.idx_realm_evt_types_realm;
DROP INDEX IF EXISTS public.idx_realm_evt_list_realm;
DROP INDEX IF EXISTS public.idx_realm_def_grp_realm;
DROP INDEX IF EXISTS public.idx_realm_clscope;
DROP INDEX IF EXISTS public.idx_realm_attr_realm;
DROP INDEX IF EXISTS public.idx_protocol_mapper_client;
DROP INDEX IF EXISTS public.idx_offline_uss_preload;
DROP INDEX IF EXISTS public.idx_offline_uss_createdon;
DROP INDEX IF EXISTS public.idx_offline_uss_by_usersess;
DROP INDEX IF EXISTS public.idx_offline_uss_by_user;
DROP INDEX IF EXISTS public.idx_offline_css_preload;
DROP INDEX IF EXISTS public.idx_keycloak_role_realm;
DROP INDEX IF EXISTS public.idx_keycloak_role_client;
DROP INDEX IF EXISTS public.idx_ident_prov_realm;
DROP INDEX IF EXISTS public.idx_id_prov_mapp_realm;
DROP INDEX IF EXISTS public.idx_group_role_mapp_group;
DROP INDEX IF EXISTS public.idx_group_attr_group;
DROP INDEX IF EXISTS public.idx_group_att_by_name_value;
DROP INDEX IF EXISTS public.idx_fu_role_mapping_ru;
DROP INDEX IF EXISTS public.idx_fu_role_mapping;
DROP INDEX IF EXISTS public.idx_fu_required_action_ru;
DROP INDEX IF EXISTS public.idx_fu_required_action;
DROP INDEX IF EXISTS public.idx_fu_group_membership_ru;
DROP INDEX IF EXISTS public.idx_fu_group_membership;
DROP INDEX IF EXISTS public.idx_fu_credential_ru;
DROP INDEX IF EXISTS public.idx_fu_credential;
DROP INDEX IF EXISTS public.idx_fu_consent_ru;
DROP INDEX IF EXISTS public.idx_fu_consent;
DROP INDEX IF EXISTS public.idx_fu_cnsnt_ext;
DROP INDEX IF EXISTS public.idx_fu_attribute;
DROP INDEX IF EXISTS public.idx_fedidentity_user;
DROP INDEX IF EXISTS public.idx_fedidentity_feduser;
DROP INDEX IF EXISTS public.idx_event_time;
DROP INDEX IF EXISTS public.idx_defcls_scope;
DROP INDEX IF EXISTS public.idx_defcls_realm;
DROP INDEX IF EXISTS public.idx_composite_child;
DROP INDEX IF EXISTS public.idx_composite;
DROP INDEX IF EXISTS public.idx_component_realm;
DROP INDEX IF EXISTS public.idx_component_provider_type;
DROP INDEX IF EXISTS public.idx_compo_config_compo;
DROP INDEX IF EXISTS public.idx_clscope_role;
DROP INDEX IF EXISTS public.idx_clscope_protmap;
DROP INDEX IF EXISTS public.idx_clscope_cl;
DROP INDEX IF EXISTS public.idx_clscope_attrs;
DROP INDEX IF EXISTS public.idx_client_session_session;
DROP INDEX IF EXISTS public.idx_client_init_acc_realm;
DROP INDEX IF EXISTS public.idx_client_id;
DROP INDEX IF EXISTS public.idx_cl_clscope;
DROP INDEX IF EXISTS public.idx_auth_flow_realm;
DROP INDEX IF EXISTS public.idx_auth_exec_realm_flow;
DROP INDEX IF EXISTS public.idx_auth_exec_flow;
DROP INDEX IF EXISTS public.idx_auth_config_realm;
DROP INDEX IF EXISTS public.idx_assoc_pol_assoc_pol_id;
DROP INDEX IF EXISTS public.idx_admin_event_time;
ALTER TABLE IF EXISTS ONLY public.user_entity DROP CONSTRAINT IF EXISTS uk_ru8tt6t700s9v50bu18ws5ha6;
ALTER TABLE IF EXISTS ONLY public.realm DROP CONSTRAINT IF EXISTS uk_orvsdmla56612eaefiq6wl5oi;
ALTER TABLE IF EXISTS ONLY public.user_consent DROP CONSTRAINT IF EXISTS uk_jkuwuvd56ontgsuhogm8uewrt;
ALTER TABLE IF EXISTS ONLY public.resource_server_scope DROP CONSTRAINT IF EXISTS uk_frsrst700s9v50bu18ws5ha6;
ALTER TABLE IF EXISTS ONLY public.resource_server_policy DROP CONSTRAINT IF EXISTS uk_frsrpt700s9v50bu18ws5ha6;
ALTER TABLE IF EXISTS ONLY public.resource_server_perm_ticket DROP CONSTRAINT IF EXISTS uk_frsr6t700s9v50bu18ws5pmt;
ALTER TABLE IF EXISTS ONLY public.resource_server_resource DROP CONSTRAINT IF EXISTS uk_frsr6t700s9v50bu18ws5ha6;
ALTER TABLE IF EXISTS ONLY public.user_entity DROP CONSTRAINT IF EXISTS uk_dykn684sl8up1crfei6eckhd7;
ALTER TABLE IF EXISTS ONLY public.client_scope DROP CONSTRAINT IF EXISTS uk_cli_scope;
ALTER TABLE IF EXISTS ONLY public.client DROP CONSTRAINT IF EXISTS uk_b71cjlbenv945rb6gcon438at;
ALTER TABLE IF EXISTS ONLY public.identity_provider DROP CONSTRAINT IF EXISTS uk_2daelwnibji49avxsrtuf6xj33;
ALTER TABLE IF EXISTS ONLY public.keycloak_group DROP CONSTRAINT IF EXISTS sibling_names;
ALTER TABLE IF EXISTS ONLY public.resource_attribute DROP CONSTRAINT IF EXISTS res_attr_pk;
ALTER TABLE IF EXISTS ONLY public.realm_localizations DROP CONSTRAINT IF EXISTS realm_localizations_pkey;
ALTER TABLE IF EXISTS ONLY public.default_client_scope DROP CONSTRAINT IF EXISTS r_def_cli_scope_bind;
ALTER TABLE IF EXISTS ONLY public.client_scope_role_mapping DROP CONSTRAINT IF EXISTS pk_template_scope;
ALTER TABLE IF EXISTS ONLY public.resource_server DROP CONSTRAINT IF EXISTS pk_resource_server;
ALTER TABLE IF EXISTS ONLY public.databasechangeloglock DROP CONSTRAINT IF EXISTS pk_databasechangeloglock;
ALTER TABLE IF EXISTS ONLY public.client_scope DROP CONSTRAINT IF EXISTS pk_cli_template;
ALTER TABLE IF EXISTS ONLY public.client_scope_attributes DROP CONSTRAINT IF EXISTS pk_cl_tmpl_attr;
ALTER TABLE IF EXISTS ONLY public.web_origins DROP CONSTRAINT IF EXISTS constraint_web_origins;
ALTER TABLE IF EXISTS ONLY public.user_session_note DROP CONSTRAINT IF EXISTS constraint_usn_pk;
ALTER TABLE IF EXISTS ONLY public.user_group_membership DROP CONSTRAINT IF EXISTS constraint_user_group;
ALTER TABLE IF EXISTS ONLY public.user_attribute DROP CONSTRAINT IF EXISTS constraint_user_attribute_pk;
ALTER TABLE IF EXISTS ONLY public.role_attribute DROP CONSTRAINT IF EXISTS constraint_role_attribute_pk;
ALTER TABLE IF EXISTS ONLY public.resource_uris DROP CONSTRAINT IF EXISTS constraint_resour_uris_pk;
ALTER TABLE IF EXISTS ONLY public.user_required_action DROP CONSTRAINT IF EXISTS constraint_required_action;
ALTER TABLE IF EXISTS ONLY public.required_action_provider DROP CONSTRAINT IF EXISTS constraint_req_act_prv_pk;
ALTER TABLE IF EXISTS ONLY public.required_action_config DROP CONSTRAINT IF EXISTS constraint_req_act_cfg_pk;
ALTER TABLE IF EXISTS ONLY public.redirect_uris DROP CONSTRAINT IF EXISTS constraint_redirect_uris;
ALTER TABLE IF EXISTS ONLY public.protocol_mapper_config DROP CONSTRAINT IF EXISTS constraint_pmconfig;
ALTER TABLE IF EXISTS ONLY public.protocol_mapper DROP CONSTRAINT IF EXISTS constraint_pcm;
ALTER TABLE IF EXISTS ONLY public.offline_user_session DROP CONSTRAINT IF EXISTS constraint_offl_us_ses_pk2;
ALTER TABLE IF EXISTS ONLY public.offline_client_session DROP CONSTRAINT IF EXISTS constraint_offl_cl_ses_pk3;
ALTER TABLE IF EXISTS ONLY public.migration_model DROP CONSTRAINT IF EXISTS constraint_migmod;
ALTER TABLE IF EXISTS ONLY public.idp_mapper_config DROP CONSTRAINT IF EXISTS constraint_idpmconfig;
ALTER TABLE IF EXISTS ONLY public.identity_provider_mapper DROP CONSTRAINT IF EXISTS constraint_idpm;
ALTER TABLE IF EXISTS ONLY public.group_role_mapping DROP CONSTRAINT IF EXISTS constraint_group_role;
ALTER TABLE IF EXISTS ONLY public.group_attribute DROP CONSTRAINT IF EXISTS constraint_group_attribute_pk;
ALTER TABLE IF EXISTS ONLY public.keycloak_group DROP CONSTRAINT IF EXISTS constraint_group;
ALTER TABLE IF EXISTS ONLY public.user_consent DROP CONSTRAINT IF EXISTS constraint_grntcsnt_pm;
ALTER TABLE IF EXISTS ONLY public.user_consent_client_scope DROP CONSTRAINT IF EXISTS constraint_grntcsnt_clsc_pm;
ALTER TABLE IF EXISTS ONLY public.fed_user_consent_cl_scope DROP CONSTRAINT IF EXISTS constraint_fgrntcsnt_clsc_pm;
ALTER TABLE IF EXISTS ONLY public.user_federation_mapper DROP CONSTRAINT IF EXISTS constraint_fedmapperpm;
ALTER TABLE IF EXISTS ONLY public.user_federation_mapper_config DROP CONSTRAINT IF EXISTS constraint_fedmapper_cfg_pm;
ALTER TABLE IF EXISTS ONLY public.user_entity DROP CONSTRAINT IF EXISTS constraint_fb;
ALTER TABLE IF EXISTS ONLY public.scope_policy DROP CONSTRAINT IF EXISTS constraint_farsrsps;
ALTER TABLE IF EXISTS ONLY public.resource_scope DROP CONSTRAINT IF EXISTS constraint_farsrsp;
ALTER TABLE IF EXISTS ONLY public.resource_server_scope DROP CONSTRAINT IF EXISTS constraint_farsrs;
ALTER TABLE IF EXISTS ONLY public.resource_policy DROP CONSTRAINT IF EXISTS constraint_farsrpp;
ALTER TABLE IF EXISTS ONLY public.associated_policy DROP CONSTRAINT IF EXISTS constraint_farsrpap;
ALTER TABLE IF EXISTS ONLY public.resource_server_policy DROP CONSTRAINT IF EXISTS constraint_farsrp;
ALTER TABLE IF EXISTS ONLY public.resource_server_resource DROP CONSTRAINT IF EXISTS constraint_farsr;
ALTER TABLE IF EXISTS ONLY public.resource_server_perm_ticket DROP CONSTRAINT IF EXISTS constraint_fapmt;
ALTER TABLE IF EXISTS ONLY public.user_federation_config DROP CONSTRAINT IF EXISTS constraint_f9;
ALTER TABLE IF EXISTS ONLY public.credential DROP CONSTRAINT IF EXISTS constraint_f;
ALTER TABLE IF EXISTS ONLY public.realm_smtp_config DROP CONSTRAINT IF EXISTS constraint_e;
ALTER TABLE IF EXISTS ONLY public.policy_config DROP CONSTRAINT IF EXISTS constraint_dpc;
ALTER TABLE IF EXISTS ONLY public.identity_provider_config DROP CONSTRAINT IF EXISTS constraint_d;
ALTER TABLE IF EXISTS ONLY public.client_session_prot_mapper DROP CONSTRAINT IF EXISTS constraint_cs_pmp_pk;
ALTER TABLE IF EXISTS ONLY public.composite_role DROP CONSTRAINT IF EXISTS constraint_composite_role;
ALTER TABLE IF EXISTS ONLY public.user_role_mapping DROP CONSTRAINT IF EXISTS constraint_c;
ALTER TABLE IF EXISTS ONLY public.client_session_auth_status DROP CONSTRAINT IF EXISTS constraint_auth_status_pk;
ALTER TABLE IF EXISTS ONLY public.authenticator_config DROP CONSTRAINT IF EXISTS constraint_auth_pk;
ALTER TABLE IF EXISTS ONLY public.authentication_flow DROP CONSTRAINT IF EXISTS constraint_auth_flow_pk;
ALTER TABLE IF EXISTS ONLY public.authentication_execution DROP CONSTRAINT IF EXISTS constraint_auth_exec_pk;
ALTER TABLE IF EXISTS ONLY public.authenticator_config_entry DROP CONSTRAINT IF EXISTS constraint_auth_cfg_pk;
ALTER TABLE IF EXISTS ONLY public.admin_event_entity DROP CONSTRAINT IF EXISTS constraint_admin_event_entity;
ALTER TABLE IF EXISTS ONLY public.keycloak_role DROP CONSTRAINT IF EXISTS constraint_a;
ALTER TABLE IF EXISTS ONLY public.realm_required_credential DROP CONSTRAINT IF EXISTS constraint_92;
ALTER TABLE IF EXISTS ONLY public.realm_attribute DROP CONSTRAINT IF EXISTS constraint_9;
ALTER TABLE IF EXISTS ONLY public.client_node_registrations DROP CONSTRAINT IF EXISTS constraint_84;
ALTER TABLE IF EXISTS ONLY public.scope_mapping DROP CONSTRAINT IF EXISTS constraint_81;
ALTER TABLE IF EXISTS ONLY public.client_session DROP CONSTRAINT IF EXISTS constraint_8;
ALTER TABLE IF EXISTS ONLY public.client DROP CONSTRAINT IF EXISTS constraint_7;
ALTER TABLE IF EXISTS ONLY public.client_session_note DROP CONSTRAINT IF EXISTS constraint_5e;
ALTER TABLE IF EXISTS ONLY public.user_federation_provider DROP CONSTRAINT IF EXISTS constraint_5c;
ALTER TABLE IF EXISTS ONLY public.user_session DROP CONSTRAINT IF EXISTS constraint_57;
ALTER TABLE IF EXISTS ONLY public.client_session_role DROP CONSTRAINT IF EXISTS constraint_5;
ALTER TABLE IF EXISTS ONLY public.realm DROP CONSTRAINT IF EXISTS constraint_4a;
ALTER TABLE IF EXISTS ONLY public.federated_identity DROP CONSTRAINT IF EXISTS constraint_40;
ALTER TABLE IF EXISTS ONLY public.event_entity DROP CONSTRAINT IF EXISTS constraint_4;
ALTER TABLE IF EXISTS ONLY public.client_attributes DROP CONSTRAINT IF EXISTS constraint_3c;
ALTER TABLE IF EXISTS ONLY public.identity_provider DROP CONSTRAINT IF EXISTS constraint_2b;
ALTER TABLE IF EXISTS ONLY public.realm_supported_locales DROP CONSTRAINT IF EXISTS constr_realm_supported_locales;
ALTER TABLE IF EXISTS ONLY public.realm_events_listeners DROP CONSTRAINT IF EXISTS constr_realm_events_listeners;
ALTER TABLE IF EXISTS ONLY public.realm_enabled_event_types DROP CONSTRAINT IF EXISTS constr_realm_enabl_event_types;
ALTER TABLE IF EXISTS ONLY public.realm_default_groups DROP CONSTRAINT IF EXISTS constr_realm_default_groups;
ALTER TABLE IF EXISTS ONLY public.federated_user DROP CONSTRAINT IF EXISTS constr_federated_user;
ALTER TABLE IF EXISTS ONLY public.fed_user_role_mapping DROP CONSTRAINT IF EXISTS constr_fed_user_role;
ALTER TABLE IF EXISTS ONLY public.fed_user_group_membership DROP CONSTRAINT IF EXISTS constr_fed_user_group;
ALTER TABLE IF EXISTS ONLY public.fed_user_credential DROP CONSTRAINT IF EXISTS constr_fed_user_cred_pk;
ALTER TABLE IF EXISTS ONLY public.fed_user_consent DROP CONSTRAINT IF EXISTS constr_fed_user_consent_pk;
ALTER TABLE IF EXISTS ONLY public.fed_user_attribute DROP CONSTRAINT IF EXISTS constr_fed_user_attr_pk;
ALTER TABLE IF EXISTS ONLY public.fed_user_required_action DROP CONSTRAINT IF EXISTS constr_fed_required_action;
ALTER TABLE IF EXISTS ONLY public.component DROP CONSTRAINT IF EXISTS constr_component_pk;
ALTER TABLE IF EXISTS ONLY public.component_config DROP CONSTRAINT IF EXISTS constr_component_config_pk;
ALTER TABLE IF EXISTS ONLY public.client_user_session_note DROP CONSTRAINT IF EXISTS constr_cl_usr_ses_note;
ALTER TABLE IF EXISTS ONLY public.broker_link DROP CONSTRAINT IF EXISTS constr_broker_link_pk;
ALTER TABLE IF EXISTS ONLY public.realm_default_groups DROP CONSTRAINT IF EXISTS con_group_id_def_groups;
ALTER TABLE IF EXISTS ONLY public.client_initial_access DROP CONSTRAINT IF EXISTS cnstr_client_init_acc_pk;
ALTER TABLE IF EXISTS ONLY public.client_scope_client DROP CONSTRAINT IF EXISTS c_cli_scope_bind;
ALTER TABLE IF EXISTS ONLY public.client_auth_flow_bindings DROP CONSTRAINT IF EXISTS c_cli_flow_bind;
ALTER TABLE IF EXISTS ONLY public.keycloak_role DROP CONSTRAINT IF EXISTS "UK_J3RWUVD56ONTGSUHOGM184WW2-2";
ALTER TABLE IF EXISTS ONLY public.username_login_failure DROP CONSTRAINT IF EXISTS "CONSTRAINT_17-2";
DROP TABLE IF EXISTS public.web_origins;
DROP TABLE IF EXISTS public.username_login_failure;
DROP TABLE IF EXISTS public.user_session_note;
DROP TABLE IF EXISTS public.user_session;
DROP TABLE IF EXISTS public.user_role_mapping;
DROP TABLE IF EXISTS public.user_required_action;
DROP TABLE IF EXISTS public.user_group_membership;
DROP TABLE IF EXISTS public.user_federation_provider;
DROP TABLE IF EXISTS public.user_federation_mapper_config;
DROP TABLE IF EXISTS public.user_federation_mapper;
DROP TABLE IF EXISTS public.user_federation_config;
DROP TABLE IF EXISTS public.user_entity;
DROP TABLE IF EXISTS public.user_consent_client_scope;
DROP TABLE IF EXISTS public.user_consent;
DROP TABLE IF EXISTS public.user_attribute;
DROP TABLE IF EXISTS public.scope_policy;
DROP TABLE IF EXISTS public.scope_mapping;
DROP TABLE IF EXISTS public.role_attribute;
DROP TABLE IF EXISTS public.resource_uris;
DROP TABLE IF EXISTS public.resource_server_scope;
DROP TABLE IF EXISTS public.resource_server_resource;
DROP TABLE IF EXISTS public.resource_server_policy;
DROP TABLE IF EXISTS public.resource_server_perm_ticket;
DROP TABLE IF EXISTS public.resource_server;
DROP TABLE IF EXISTS public.resource_scope;
DROP TABLE IF EXISTS public.resource_policy;
DROP TABLE IF EXISTS public.resource_attribute;
DROP TABLE IF EXISTS public.required_action_provider;
DROP TABLE IF EXISTS public.required_action_config;
DROP TABLE IF EXISTS public.redirect_uris;
DROP TABLE IF EXISTS public.realm_supported_locales;
DROP TABLE IF EXISTS public.realm_smtp_config;
DROP TABLE IF EXISTS public.realm_required_credential;
DROP TABLE IF EXISTS public.realm_localizations;
DROP TABLE IF EXISTS public.realm_events_listeners;
DROP TABLE IF EXISTS public.realm_enabled_event_types;
DROP TABLE IF EXISTS public.realm_default_groups;
DROP TABLE IF EXISTS public.realm_attribute;
DROP TABLE IF EXISTS public.realm;
DROP TABLE IF EXISTS public.protocol_mapper_config;
DROP TABLE IF EXISTS public.protocol_mapper;
DROP TABLE IF EXISTS public.policy_config;
DROP TABLE IF EXISTS public.offline_user_session;
DROP TABLE IF EXISTS public.offline_client_session;
DROP TABLE IF EXISTS public.migration_model;
DROP TABLE IF EXISTS public.keycloak_role;
DROP TABLE IF EXISTS public.keycloak_group;
DROP TABLE IF EXISTS public.idp_mapper_config;
DROP TABLE IF EXISTS public.identity_provider_mapper;
DROP TABLE IF EXISTS public.identity_provider_config;
DROP TABLE IF EXISTS public.identity_provider;
DROP TABLE IF EXISTS public.group_role_mapping;
DROP TABLE IF EXISTS public.group_attribute;
DROP TABLE IF EXISTS public.federated_user;
DROP TABLE IF EXISTS public.federated_identity;
DROP TABLE IF EXISTS public.fed_user_role_mapping;
DROP TABLE IF EXISTS public.fed_user_required_action;
DROP TABLE IF EXISTS public.fed_user_group_membership;
DROP TABLE IF EXISTS public.fed_user_credential;
DROP TABLE IF EXISTS public.fed_user_consent_cl_scope;
DROP TABLE IF EXISTS public.fed_user_consent;
DROP TABLE IF EXISTS public.fed_user_attribute;
DROP TABLE IF EXISTS public.event_entity;
DROP TABLE IF EXISTS public.default_client_scope;
DROP TABLE IF EXISTS public.databasechangeloglock;
DROP TABLE IF EXISTS public.databasechangelog;
DROP TABLE IF EXISTS public.credential;
DROP TABLE IF EXISTS public.composite_role;
DROP TABLE IF EXISTS public.component_config;
DROP TABLE IF EXISTS public.component;
DROP TABLE IF EXISTS public.client_user_session_note;
DROP TABLE IF EXISTS public.client_session_role;
DROP TABLE IF EXISTS public.client_session_prot_mapper;
DROP TABLE IF EXISTS public.client_session_note;
DROP TABLE IF EXISTS public.client_session_auth_status;
DROP TABLE IF EXISTS public.client_session;
DROP TABLE IF EXISTS public.client_scope_role_mapping;
DROP TABLE IF EXISTS public.client_scope_client;
DROP TABLE IF EXISTS public.client_scope_attributes;
DROP TABLE IF EXISTS public.client_scope;
DROP TABLE IF EXISTS public.client_node_registrations;
DROP TABLE IF EXISTS public.client_initial_access;
DROP TABLE IF EXISTS public.client_auth_flow_bindings;
DROP TABLE IF EXISTS public.client_attributes;
DROP TABLE IF EXISTS public.client;
DROP TABLE IF EXISTS public.broker_link;
DROP TABLE IF EXISTS public.authenticator_config_entry;
DROP TABLE IF EXISTS public.authenticator_config;
DROP TABLE IF EXISTS public.authentication_flow;
DROP TABLE IF EXISTS public.authentication_execution;
DROP TABLE IF EXISTS public.associated_policy;
DROP TABLE IF EXISTS public.admin_event_entity;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.admin_event_entity OWNER TO oidc_keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO oidc_keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.authentication_execution OWNER TO oidc_keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.authentication_flow OWNER TO oidc_keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO oidc_keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO oidc_keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.broker_link OWNER TO oidc_keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.client OWNER TO oidc_keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO oidc_keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO oidc_keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO oidc_keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO oidc_keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO oidc_keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO oidc_keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO oidc_keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO oidc_keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.client_session OWNER TO oidc_keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO oidc_keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO oidc_keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO oidc_keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO oidc_keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO oidc_keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.component OWNER TO oidc_keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO oidc_keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO oidc_keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.credential OWNER TO oidc_keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.databasechangelog OWNER TO oidc_keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO oidc_keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO oidc_keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.event_entity OWNER TO oidc_keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO oidc_keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.fed_user_consent OWNER TO oidc_keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO oidc_keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.fed_user_credential OWNER TO oidc_keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO oidc_keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO oidc_keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO oidc_keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO oidc_keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO oidc_keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO oidc_keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO oidc_keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.identity_provider OWNER TO oidc_keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO oidc_keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO oidc_keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO oidc_keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO oidc_keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.keycloak_role OWNER TO oidc_keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO oidc_keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.offline_client_session OWNER TO oidc_keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.offline_user_session OWNER TO oidc_keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO oidc_keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO oidc_keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO oidc_keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.realm OWNER TO oidc_keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO oidc_keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO oidc_keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO oidc_keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO oidc_keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO oidc_keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO oidc_keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO oidc_keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO oidc_keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO oidc_keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO oidc_keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.required_action_provider OWNER TO oidc_keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO oidc_keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO oidc_keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO oidc_keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO oidc_keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.resource_server_perm_ticket OWNER TO oidc_keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO oidc_keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.resource_server_resource OWNER TO oidc_keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO oidc_keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO oidc_keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO oidc_keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO oidc_keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO oidc_keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO oidc_keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.user_consent OWNER TO oidc_keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO oidc_keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.user_entity OWNER TO oidc_keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO oidc_keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO oidc_keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO oidc_keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.user_federation_provider OWNER TO oidc_keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO oidc_keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO oidc_keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO oidc_keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: oidc_keycloak
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


ALTER TABLE public.user_session OWNER TO oidc_keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO oidc_keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO oidc_keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: oidc_keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO oidc_keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('77b7e02d-3a8f-4049-a365-d2a766d82274', NULL, 'auth-cookie', 'master', '23488e8b-7281-4abd-ae79-17fbf34a4443', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('21347cc3-b51b-4028-820f-eca9a1194f7c', NULL, 'auth-spnego', 'master', '23488e8b-7281-4abd-ae79-17fbf34a4443', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('97f743e2-95a2-4e18-9522-ff3a6288109c', NULL, 'identity-provider-redirector', 'master', '23488e8b-7281-4abd-ae79-17fbf34a4443', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('f771a7ca-4fe9-4f75-bf81-e057ae1a0e76', NULL, NULL, 'master', '23488e8b-7281-4abd-ae79-17fbf34a4443', 2, 30, true, '3af8ef08-fd9c-4484-a590-55f9a32cb4d4', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('1de69453-591b-4e31-ac2f-38ab8b294a37', NULL, 'auth-username-password-form', 'master', '3af8ef08-fd9c-4484-a590-55f9a32cb4d4', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('b3d64edd-38fe-41a7-81c7-b5445c4df564', NULL, NULL, 'master', '3af8ef08-fd9c-4484-a590-55f9a32cb4d4', 1, 20, true, '5e5f2d2e-9d9b-4f78-bbbb-eb000f8a4da8', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('7493680f-9b6b-482a-b042-f28d5f06eaf3', NULL, 'conditional-user-configured', 'master', '5e5f2d2e-9d9b-4f78-bbbb-eb000f8a4da8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('6207d5af-f70c-42e8-949e-c669b7cb5005', NULL, 'auth-otp-form', 'master', '5e5f2d2e-9d9b-4f78-bbbb-eb000f8a4da8', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('4c6e8f1b-0cce-46c5-b338-b6c697f92de3', NULL, 'direct-grant-validate-username', 'master', 'e5d7ed0f-15d2-4921-b650-cada5b768ed9', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ba4263d5-a514-4e3e-a781-4ece6095a892', NULL, 'direct-grant-validate-password', 'master', 'e5d7ed0f-15d2-4921-b650-cada5b768ed9', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('69910d64-a743-4c56-b263-b95f60d63159', NULL, NULL, 'master', 'e5d7ed0f-15d2-4921-b650-cada5b768ed9', 1, 30, true, 'd4933c67-21f0-492a-9f87-c23e0617bc97', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('862c53a2-fc47-4070-abf3-bb1627de1b6e', NULL, 'conditional-user-configured', 'master', 'd4933c67-21f0-492a-9f87-c23e0617bc97', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('2b975288-c7c9-4fc9-8e14-667c13e44e2f', NULL, 'direct-grant-validate-otp', 'master', 'd4933c67-21f0-492a-9f87-c23e0617bc97', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('2ad27361-507c-4f6b-991d-9078dce5cfd9', NULL, 'registration-page-form', 'master', '40cbcdab-23d0-4539-8487-7114f2fbe899', 0, 10, true, '14650d7d-a3ab-428f-a3ab-7c9e83737ba9', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('c0070b23-47d2-41fe-a7e5-80760509daed', NULL, 'registration-user-creation', 'master', '14650d7d-a3ab-428f-a3ab-7c9e83737ba9', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('dfc6f37d-81eb-4e01-8abf-7ae634a73d53', NULL, 'registration-profile-action', 'master', '14650d7d-a3ab-428f-a3ab-7c9e83737ba9', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('1e53acef-66c5-4382-b423-307a1692d392', NULL, 'registration-password-action', 'master', '14650d7d-a3ab-428f-a3ab-7c9e83737ba9', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('46d808a2-2e0e-4c6d-a055-1fb1104c819b', NULL, 'registration-recaptcha-action', 'master', '14650d7d-a3ab-428f-a3ab-7c9e83737ba9', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('7acfa90f-9309-4238-959e-1db491a135bc', NULL, 'reset-credentials-choose-user', 'master', '46ff7517-2911-47ba-bf78-78a587b9535e', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('755025ba-b168-434c-86a5-e3966566dbed', NULL, 'reset-credential-email', 'master', '46ff7517-2911-47ba-bf78-78a587b9535e', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('284634ed-f2e1-4e34-a3fc-33b28e5dd9b1', NULL, 'reset-password', 'master', '46ff7517-2911-47ba-bf78-78a587b9535e', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('84bb943f-2232-47e3-9eb1-aef4dc9cffd2', NULL, NULL, 'master', '46ff7517-2911-47ba-bf78-78a587b9535e', 1, 40, true, 'cd9f56d3-8e8d-4273-a93a-0d444e0b10f3', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('55ada456-120b-45b4-b20d-2fa1bf5201a6', NULL, 'conditional-user-configured', 'master', 'cd9f56d3-8e8d-4273-a93a-0d444e0b10f3', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('33c76d87-3262-4705-bde6-d7c6f0849a60', NULL, 'reset-otp', 'master', 'cd9f56d3-8e8d-4273-a93a-0d444e0b10f3', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('396d3ce8-2a9e-4ccd-99da-ff3fa9101af0', NULL, 'client-secret', 'master', '3daaf123-c36b-40fa-a7e8-764540aac445', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('d5e15098-1d3a-4ae4-872d-15ff3b9ad6ee', NULL, 'client-jwt', 'master', '3daaf123-c36b-40fa-a7e8-764540aac445', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('999bf31d-a08a-430a-8d17-46e195f6b7cd', NULL, 'client-secret-jwt', 'master', '3daaf123-c36b-40fa-a7e8-764540aac445', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('777b686d-1435-46d4-88a9-74b0e1790287', NULL, 'client-x509', 'master', '3daaf123-c36b-40fa-a7e8-764540aac445', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('67449628-fbd8-4299-8e28-442404b137cb', NULL, 'idp-review-profile', 'master', '3208a5fc-5722-4c9b-a3f7-76557d260fe2', 0, 10, false, NULL, '1731bf85-8b8c-4385-b2a0-0a3dadae6c68');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('12e30ebf-aa65-43dd-b2cc-fd3ad18e8c7d', NULL, NULL, 'master', '3208a5fc-5722-4c9b-a3f7-76557d260fe2', 0, 20, true, '1f3ae3e0-3d2b-4817-9370-07265cb5bc3c', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('bae47f49-963a-41ad-b7fb-1c9684398ad8', NULL, 'idp-create-user-if-unique', 'master', '1f3ae3e0-3d2b-4817-9370-07265cb5bc3c', 2, 10, false, NULL, '3a4f2167-0953-4e99-8f0b-75b0398b8e9b');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('6cbe16f8-e28e-4520-91b5-95cd9f256715', NULL, NULL, 'master', '1f3ae3e0-3d2b-4817-9370-07265cb5bc3c', 2, 20, true, 'd540b952-f0cb-4f49-938e-05a00afc7026', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('99b4f3ff-4d8d-41aa-919f-4cea5a6e766b', NULL, 'idp-confirm-link', 'master', 'd540b952-f0cb-4f49-938e-05a00afc7026', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('f7928a44-ff34-4957-b337-61b20fa4fd56', NULL, NULL, 'master', 'd540b952-f0cb-4f49-938e-05a00afc7026', 0, 20, true, '05bcd23c-e59f-4314-a05f-0020ec53219c', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('585c1370-9320-414e-abf1-e979889f6fbc', NULL, 'idp-email-verification', 'master', '05bcd23c-e59f-4314-a05f-0020ec53219c', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('162ee0a0-bb5f-4ef0-b241-b8e44a9febd7', NULL, NULL, 'master', '05bcd23c-e59f-4314-a05f-0020ec53219c', 2, 20, true, '1604cca0-8aa2-4712-9714-d5fb581fffea', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('117a5a66-657e-454b-8e31-7d9a98e07d5f', NULL, 'idp-username-password-form', 'master', '1604cca0-8aa2-4712-9714-d5fb581fffea', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('bd3ee445-2a5d-49e5-9c3e-7b40960fd44f', NULL, NULL, 'master', '1604cca0-8aa2-4712-9714-d5fb581fffea', 1, 20, true, '13aa149f-91d2-4093-892c-838cadc47d57', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('7d8de545-8024-403b-9bb9-246fe8f5e311', NULL, 'conditional-user-configured', 'master', '13aa149f-91d2-4093-892c-838cadc47d57', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('6e480bec-2e0b-4fd2-a0c7-1001e1ef2e03', NULL, 'auth-otp-form', 'master', '13aa149f-91d2-4093-892c-838cadc47d57', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('971313b3-d380-4b52-9efb-b3b3377bd689', NULL, 'http-basic-authenticator', 'master', 'c040248f-67c1-4f46-8764-d667f4c5bfc6', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('f83d0794-8c40-47d5-803d-9fecf140d59b', NULL, 'docker-http-basic-authenticator', 'master', 'c4f9c3d4-5ad3-4896-8690-584b1e42ed60', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ed1e284c-c6a7-4f74-bfe8-c6b3318aab6c', NULL, 'no-cookie-redirect', 'master', '49ef8416-e4b7-4f47-ae6c-1f2176501172', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ab8bda9e-5090-48c7-bd75-707236508ff3', NULL, NULL, 'master', '49ef8416-e4b7-4f47-ae6c-1f2176501172', 0, 20, true, 'e8a72860-83f6-4b45-9033-daf47936b421', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('97d0148c-f8db-406d-802f-9e4b37f76727', NULL, 'basic-auth', 'master', 'e8a72860-83f6-4b45-9033-daf47936b421', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('adaca099-c34c-4efc-bff4-66158c1c3729', NULL, 'basic-auth-otp', 'master', 'e8a72860-83f6-4b45-9033-daf47936b421', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ea312e39-011f-49ac-9bef-116d55438dd2', NULL, 'auth-spnego', 'master', 'e8a72860-83f6-4b45-9033-daf47936b421', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('739bc505-da17-43e2-b6fb-abbe196a6351', NULL, 'auth-cookie', '2b937222-9615-437f-bf8d-0e73191e2c82', 'ea783d6e-71a8-4ec0-95d3-de93642601a7', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('7a148183-e3c9-43ed-8358-58dfbd117472', NULL, 'auth-spnego', '2b937222-9615-437f-bf8d-0e73191e2c82', 'ea783d6e-71a8-4ec0-95d3-de93642601a7', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('949dd1a9-213d-45d6-b648-5c5ce92f4536', NULL, 'identity-provider-redirector', '2b937222-9615-437f-bf8d-0e73191e2c82', 'ea783d6e-71a8-4ec0-95d3-de93642601a7', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('8ada9bb2-fabd-43d4-ade3-b27b0f3dbbd8', NULL, NULL, '2b937222-9615-437f-bf8d-0e73191e2c82', 'ea783d6e-71a8-4ec0-95d3-de93642601a7', 2, 30, true, 'bf33e67b-7378-4670-bc9c-b69e2841c109', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('f9ebbb87-1fe9-4e1b-abf2-de36fd0a43a7', NULL, 'auth-username-password-form', '2b937222-9615-437f-bf8d-0e73191e2c82', 'bf33e67b-7378-4670-bc9c-b69e2841c109', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('a44e8913-fe84-45e4-a443-0abdf433aae3', NULL, NULL, '2b937222-9615-437f-bf8d-0e73191e2c82', 'bf33e67b-7378-4670-bc9c-b69e2841c109', 1, 20, true, '4b9ff095-8e57-4236-9d01-e9b2b6dd20d2', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('77fed54e-f21d-4e37-9edc-3e1d0ebc8cdf', NULL, 'conditional-user-configured', '2b937222-9615-437f-bf8d-0e73191e2c82', '4b9ff095-8e57-4236-9d01-e9b2b6dd20d2', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('315f0078-5658-4c74-b0d0-bc4001a2d4db', NULL, 'auth-otp-form', '2b937222-9615-437f-bf8d-0e73191e2c82', '4b9ff095-8e57-4236-9d01-e9b2b6dd20d2', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('22437211-32bb-4478-8d34-9d710e38628a', NULL, 'direct-grant-validate-username', '2b937222-9615-437f-bf8d-0e73191e2c82', '40a064b2-bf63-4683-a6eb-cb38335ebaf6', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('abe7a148-c2b7-431e-a1b6-f02e3af1fc28', NULL, 'direct-grant-validate-password', '2b937222-9615-437f-bf8d-0e73191e2c82', '40a064b2-bf63-4683-a6eb-cb38335ebaf6', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('a9739c23-b0d8-4561-8033-1d6661dd2642', NULL, NULL, '2b937222-9615-437f-bf8d-0e73191e2c82', '40a064b2-bf63-4683-a6eb-cb38335ebaf6', 1, 30, true, '1e29971c-d618-4fc3-a485-aeb284b695b7', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('b955c5eb-48a6-4a2d-a79c-62d97a2e1475', NULL, 'conditional-user-configured', '2b937222-9615-437f-bf8d-0e73191e2c82', '1e29971c-d618-4fc3-a485-aeb284b695b7', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('cd1f65ee-536a-421d-9d77-83626c22ab9d', NULL, 'direct-grant-validate-otp', '2b937222-9615-437f-bf8d-0e73191e2c82', '1e29971c-d618-4fc3-a485-aeb284b695b7', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('04302621-b3ae-4784-90ed-c5b50835b022', NULL, 'registration-page-form', '2b937222-9615-437f-bf8d-0e73191e2c82', '8fb9b19b-dd1a-4c45-9af6-6b6261e0b18a', 0, 10, true, '38171c68-6d55-4de0-bb18-0b75a1521db9', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('8b6ce158-21e5-4940-9315-ab5ebec449d5', NULL, 'registration-user-creation', '2b937222-9615-437f-bf8d-0e73191e2c82', '38171c68-6d55-4de0-bb18-0b75a1521db9', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('7655fced-0444-4eb2-8ecd-753cc4f8f067', NULL, 'registration-profile-action', '2b937222-9615-437f-bf8d-0e73191e2c82', '38171c68-6d55-4de0-bb18-0b75a1521db9', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('952977e6-d196-456a-8727-11c6152aa3e8', NULL, 'registration-password-action', '2b937222-9615-437f-bf8d-0e73191e2c82', '38171c68-6d55-4de0-bb18-0b75a1521db9', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ca037004-de50-4fd7-9b7b-0879328aad2a', NULL, 'registration-recaptcha-action', '2b937222-9615-437f-bf8d-0e73191e2c82', '38171c68-6d55-4de0-bb18-0b75a1521db9', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('eddc6d6b-6d19-4c1c-8105-381ca9c6dfd0', NULL, 'reset-credentials-choose-user', '2b937222-9615-437f-bf8d-0e73191e2c82', 'bd24ec5b-368c-4af9-a139-59aa4be76525', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('7d44d668-22e7-464b-8478-97604756bc5e', NULL, 'reset-credential-email', '2b937222-9615-437f-bf8d-0e73191e2c82', 'bd24ec5b-368c-4af9-a139-59aa4be76525', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('44609c9e-68be-44ae-891e-81329536a42e', NULL, 'reset-password', '2b937222-9615-437f-bf8d-0e73191e2c82', 'bd24ec5b-368c-4af9-a139-59aa4be76525', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('27a8bfb9-c2e1-40fa-89d5-534242be1e19', NULL, NULL, '2b937222-9615-437f-bf8d-0e73191e2c82', 'bd24ec5b-368c-4af9-a139-59aa4be76525', 1, 40, true, 'e83b9acc-e3fa-4cd2-81dc-f2bfb0901a9f', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('212eded5-f319-4013-a0d7-d67492836850', NULL, 'conditional-user-configured', '2b937222-9615-437f-bf8d-0e73191e2c82', 'e83b9acc-e3fa-4cd2-81dc-f2bfb0901a9f', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('037578cf-b1fc-4a64-927a-89d652081b51', NULL, 'reset-otp', '2b937222-9615-437f-bf8d-0e73191e2c82', 'e83b9acc-e3fa-4cd2-81dc-f2bfb0901a9f', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('89edb31f-637a-4fb8-9d5b-444252315ea0', NULL, 'client-secret', '2b937222-9615-437f-bf8d-0e73191e2c82', '2ee8fdf3-d083-4f31-8e2f-60537afc7c58', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('5ffae3a6-3e6d-478f-b3bf-991146d9c149', NULL, 'client-jwt', '2b937222-9615-437f-bf8d-0e73191e2c82', '2ee8fdf3-d083-4f31-8e2f-60537afc7c58', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('dc3c2ec7-08e0-430b-b018-003714663bc1', NULL, 'client-secret-jwt', '2b937222-9615-437f-bf8d-0e73191e2c82', '2ee8fdf3-d083-4f31-8e2f-60537afc7c58', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('52684705-bdb9-4faa-a87b-39acdc88585a', NULL, 'client-x509', '2b937222-9615-437f-bf8d-0e73191e2c82', '2ee8fdf3-d083-4f31-8e2f-60537afc7c58', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('5f1d58dd-bd6a-48e8-a990-29ba8abed8dc', NULL, 'idp-review-profile', '2b937222-9615-437f-bf8d-0e73191e2c82', 'b52bd6a3-20d5-4ae0-945c-be862802fdee', 0, 10, false, NULL, 'd12e01f6-8686-4c9f-99fa-054cd42020e4');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('a240c0d1-be46-43b5-a002-a143f9e23845', NULL, NULL, '2b937222-9615-437f-bf8d-0e73191e2c82', 'b52bd6a3-20d5-4ae0-945c-be862802fdee', 0, 20, true, 'ffa61114-0548-40bb-bec9-08ae769a9638', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('cdeb7132-104f-476c-a4d9-23896b2ae1e6', NULL, 'idp-create-user-if-unique', '2b937222-9615-437f-bf8d-0e73191e2c82', 'ffa61114-0548-40bb-bec9-08ae769a9638', 2, 10, false, NULL, '907d6af7-e63b-45f9-abcb-c77f2b7e8987');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('67d8dbf3-907a-4f07-8004-0829d44df264', NULL, NULL, '2b937222-9615-437f-bf8d-0e73191e2c82', 'ffa61114-0548-40bb-bec9-08ae769a9638', 2, 20, true, '78e63853-581c-4c6d-b4c8-6797b040cf1b', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('2cdd7663-f1dd-4c53-81ab-fa959298efde', NULL, 'idp-confirm-link', '2b937222-9615-437f-bf8d-0e73191e2c82', '78e63853-581c-4c6d-b4c8-6797b040cf1b', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ed35186b-b50d-4eec-8cd4-52b8fa90b0cb', NULL, NULL, '2b937222-9615-437f-bf8d-0e73191e2c82', '78e63853-581c-4c6d-b4c8-6797b040cf1b', 0, 20, true, '0089a471-1d85-4717-abe7-950317509777', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('2e7f6b99-5f22-4ddb-9953-1186a684b97b', NULL, 'idp-email-verification', '2b937222-9615-437f-bf8d-0e73191e2c82', '0089a471-1d85-4717-abe7-950317509777', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('d9a489ea-67ab-447d-9d30-ac96c0ff1906', NULL, NULL, '2b937222-9615-437f-bf8d-0e73191e2c82', '0089a471-1d85-4717-abe7-950317509777', 2, 20, true, '17ab5dea-08ce-493a-83f4-a45decb766ff', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('a848e4d1-932c-4394-978e-4cfc69f42b81', NULL, 'idp-username-password-form', '2b937222-9615-437f-bf8d-0e73191e2c82', '17ab5dea-08ce-493a-83f4-a45decb766ff', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('8d7e342f-c5f3-4fdc-830f-33321d3c89c7', NULL, NULL, '2b937222-9615-437f-bf8d-0e73191e2c82', '17ab5dea-08ce-493a-83f4-a45decb766ff', 1, 20, true, '053f053a-276b-4d9d-82b2-9f5b05de1174', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('278b0674-e3aa-4b7b-b509-be1925fb8ac8', NULL, 'conditional-user-configured', '2b937222-9615-437f-bf8d-0e73191e2c82', '053f053a-276b-4d9d-82b2-9f5b05de1174', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('2e2bfa7c-0bd8-4cdc-af2e-ff1be94ac314', NULL, 'auth-otp-form', '2b937222-9615-437f-bf8d-0e73191e2c82', '053f053a-276b-4d9d-82b2-9f5b05de1174', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('fc3fb430-d227-4f40-a90a-731d0d85c247', NULL, 'http-basic-authenticator', '2b937222-9615-437f-bf8d-0e73191e2c82', '57fb291b-12a9-4709-b505-511df18c7dd5', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('e27bde11-ee5e-4a62-982a-7bf658cdb2ec', NULL, 'docker-http-basic-authenticator', '2b937222-9615-437f-bf8d-0e73191e2c82', 'ce37689c-d4d4-4aff-abe2-85e0073edfd7', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('2b43f9c7-54a0-4e73-a6cc-0f007591718f', NULL, 'no-cookie-redirect', '2b937222-9615-437f-bf8d-0e73191e2c82', 'cdeca037-6e23-4f6e-86b8-7fdcf11309b1', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('c9db4357-c663-4021-b6f0-5b2828287562', NULL, NULL, '2b937222-9615-437f-bf8d-0e73191e2c82', 'cdeca037-6e23-4f6e-86b8-7fdcf11309b1', 0, 20, true, '6a7730be-df51-4c06-b0e8-f7315a3afce3', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('7aa5ef0d-8880-4ed8-865b-657871f0ddba', NULL, 'basic-auth', '2b937222-9615-437f-bf8d-0e73191e2c82', '6a7730be-df51-4c06-b0e8-f7315a3afce3', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('c7999935-3135-4d80-88ce-110b34b5d826', NULL, 'basic-auth-otp', '2b937222-9615-437f-bf8d-0e73191e2c82', '6a7730be-df51-4c06-b0e8-f7315a3afce3', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('20af758a-fc6f-49a5-a6a8-816ce9055db1', NULL, 'auth-spnego', '2b937222-9615-437f-bf8d-0e73191e2c82', '6a7730be-df51-4c06-b0e8-f7315a3afce3', 3, 30, false, NULL, NULL);


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('23488e8b-7281-4abd-ae79-17fbf34a4443', 'browser', 'browser based authentication', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('3af8ef08-fd9c-4484-a590-55f9a32cb4d4', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('5e5f2d2e-9d9b-4f78-bbbb-eb000f8a4da8', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('e5d7ed0f-15d2-4921-b650-cada5b768ed9', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('d4933c67-21f0-492a-9f87-c23e0617bc97', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('40cbcdab-23d0-4539-8487-7114f2fbe899', 'registration', 'registration flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('14650d7d-a3ab-428f-a3ab-7c9e83737ba9', 'registration form', 'registration form', 'master', 'form-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('46ff7517-2911-47ba-bf78-78a587b9535e', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('cd9f56d3-8e8d-4273-a93a-0d444e0b10f3', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('3daaf123-c36b-40fa-a7e8-764540aac445', 'clients', 'Base authentication for clients', 'master', 'client-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('3208a5fc-5722-4c9b-a3f7-76557d260fe2', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('1f3ae3e0-3d2b-4817-9370-07265cb5bc3c', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('d540b952-f0cb-4f49-938e-05a00afc7026', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('05bcd23c-e59f-4314-a05f-0020ec53219c', 'Account verification options', 'Method with which to verity the existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('1604cca0-8aa2-4712-9714-d5fb581fffea', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('13aa149f-91d2-4093-892c-838cadc47d57', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('c040248f-67c1-4f46-8764-d667f4c5bfc6', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('c4f9c3d4-5ad3-4896-8690-584b1e42ed60', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('49ef8416-e4b7-4f47-ae6c-1f2176501172', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('e8a72860-83f6-4b45-9033-daf47936b421', 'Authentication Options', 'Authentication options.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('ea783d6e-71a8-4ec0-95d3-de93642601a7', 'browser', 'browser based authentication', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('bf33e67b-7378-4670-bc9c-b69e2841c109', 'forms', 'Username, password, otp and other auth forms.', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('4b9ff095-8e57-4236-9d01-e9b2b6dd20d2', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('40a064b2-bf63-4683-a6eb-cb38335ebaf6', 'direct grant', 'OpenID Connect Resource Owner Grant', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('1e29971c-d618-4fc3-a485-aeb284b695b7', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('8fb9b19b-dd1a-4c45-9af6-6b6261e0b18a', 'registration', 'registration flow', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('38171c68-6d55-4de0-bb18-0b75a1521db9', 'registration form', 'registration form', '2b937222-9615-437f-bf8d-0e73191e2c82', 'form-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('bd24ec5b-368c-4af9-a139-59aa4be76525', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('e83b9acc-e3fa-4cd2-81dc-f2bfb0901a9f', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('2ee8fdf3-d083-4f31-8e2f-60537afc7c58', 'clients', 'Base authentication for clients', '2b937222-9615-437f-bf8d-0e73191e2c82', 'client-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('b52bd6a3-20d5-4ae0-945c-be862802fdee', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('ffa61114-0548-40bb-bec9-08ae769a9638', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('78e63853-581c-4c6d-b4c8-6797b040cf1b', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('0089a471-1d85-4717-abe7-950317509777', 'Account verification options', 'Method with which to verity the existing account', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('17ab5dea-08ce-493a-83f4-a45decb766ff', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('053f053a-276b-4d9d-82b2-9f5b05de1174', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('57fb291b-12a9-4709-b505-511df18c7dd5', 'saml ecp', 'SAML ECP Profile Authentication Flow', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('ce37689c-d4d4-4aff-abe2-85e0073edfd7', 'docker auth', 'Used by Docker clients to authenticate against the IDP', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('cdeca037-6e23-4f6e-86b8-7fdcf11309b1', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('6a7730be-df51-4c06-b0e8-f7315a3afce3', 'Authentication Options', 'Authentication options.', '2b937222-9615-437f-bf8d-0e73191e2c82', 'basic-flow', false, true);


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('1731bf85-8b8c-4385-b2a0-0a3dadae6c68', 'review profile config', 'master');
INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('3a4f2167-0953-4e99-8f0b-75b0398b8e9b', 'create unique user config', 'master');
INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('d12e01f6-8686-4c9f-99fa-054cd42020e4', 'review profile config', '2b937222-9615-437f-bf8d-0e73191e2c82');
INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('907d6af7-e63b-45f9-abcb-c77f2b7e8987', 'create unique user config', '2b937222-9615-437f-bf8d-0e73191e2c82');


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('1731bf85-8b8c-4385-b2a0-0a3dadae6c68', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('3a4f2167-0953-4e99-8f0b-75b0398b8e9b', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('907d6af7-e63b-45f9-abcb-c77f2b7e8987', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('d12e01f6-8686-4c9f-99fa-054cd42020e4', 'missing', 'update.profile.on.first.login');


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('896bc591-348d-45c4-8a2f-b2593c7b2155', true, false, 'master-realm', 0, false, NULL, NULL, true, NULL, false, 'master', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('71f2376d-ff99-44db-ba8d-4c485915b2ab', true, false, 'account', 0, true, NULL, '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('e0204d41-458b-46d9-be73-783880589f08', true, false, 'account-console', 0, true, NULL, '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('3b469c75-5126-4367-af6e-c3840c619260', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', true, false, 'security-admin-console', 0, true, NULL, '/admin/master/console/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('7a3d4ea9-70b3-4af6-aaf9-45066f6ccd2c', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('fed33eec-3955-4cb5-a210-5d087f86bad2', true, false, 'blogq-realm', 0, false, NULL, NULL, true, NULL, false, 'master', NULL, 0, false, false, 'blogq Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('d5b4a3ff-a868-471e-9eed-24145f758b5d', true, false, 'realm-management', 0, false, NULL, NULL, true, NULL, false, '2b937222-9615-437f-bf8d-0e73191e2c82', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('bf39530a-b2a6-4e37-8b3d-56614fdde86d', true, false, 'account', 0, true, NULL, '/realms/blogq/account/', false, NULL, false, '2b937222-9615-437f-bf8d-0e73191e2c82', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', true, false, 'account-console', 0, true, NULL, '/realms/blogq/account/', false, NULL, false, '2b937222-9615-437f-bf8d-0e73191e2c82', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('0ee223a4-733b-4513-9650-25dd62a70b0e', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, '2b937222-9615-437f-bf8d-0e73191e2c82', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', true, false, 'security-admin-console', 0, true, NULL, '/admin/blogq/console/', false, NULL, false, '2b937222-9615-437f-bf8d-0e73191e2c82', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('e0c62cf8-4567-44ae-ad1e-785b0b4aa83a', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, '2b937222-9615-437f-bf8d-0e73191e2c82', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', true, true, 'blogq-backend', 0, false, '6KAJ72rul4pDlOt7eYwZf3YGprGVxaZj', 'http://localhost:51080', false, 'http://localhost:51080', false, '2b937222-9615-437f-bf8d-0e73191e2c82', 'openid-connect', -1, true, false, 'BlogQ Backend', true, 'client-secret', 'http://localhost:51080', '', NULL, false, false, true, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', true, true, 'blogq-web-ui-editor', 0, true, NULL, 'http://localhost:5173', false, 'http://localhost:5173', false, '2b937222-9615-437f-bf8d-0e73191e2c82', 'openid-connect', -1, true, false, 'BlogQ Web UI Editor', false, 'client-secret', 'http://localhost:5173', 'BlogQ Web UI Editor', NULL, true, true, true, false);


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.client_attributes (client_id, name, value) VALUES ('bf39530a-b2a6-4e37-8b3d-56614fdde86d', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'acr.loa.map', '{}');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'backchannel.logout.revoke.offline.tokens', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'backchannel.logout.session.required', 'true');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'client_credentials.use_refresh_token', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'display.on.consent.screen', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'oauth2.device.authorization.grant.enabled', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'oidc.ciba.grant.enabled', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'post.logout.redirect.uris', 'http://localhost:5173');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'require.pushed.authorization.requests', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'tls.client.certificate.bound.access.tokens', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'token.response.type.bearer.lower-case', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'use.refresh.tokens', 'true');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'acr.loa.map', '{}');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'backchannel.logout.revoke.offline.tokens', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'backchannel.logout.session.required', 'true');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'client.secret.creation.time', '1683312595');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'client_credentials.use_refresh_token', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'display.on.consent.screen', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'oauth2.device.authorization.grant.enabled', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'oidc.ciba.grant.enabled', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'post.logout.redirect.uris', 'http://localhost:51080');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'require.pushed.authorization.requests', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'tls.client.certificate.bound.access.tokens', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'token.response.type.bearer.lower-case', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'use.refresh.tokens', 'true');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('e0204d41-458b-46d9-be73-783880589f08', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('71f2376d-ff99-44db-ba8d-4c485915b2ab', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('e0204d41-458b-46d9-be73-783880589f08', 'post.logout.redirect.uris', '+');


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('9d8da12b-cab2-410d-9bf0-95c4f4b14daf', 'offline_access', 'master', 'OpenID Connect built-in action: offline_access', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('741bf401-5cb1-4231-b9b8-054b1fb29739', 'role_list', 'master', 'SAML role list', 'saml');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('d82d724d-fe1d-4087-914d-81e0e902a609', 'profile', 'master', 'OpenID Connect built-in action: profile', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('4073ebe7-0135-4c60-b9a6-a65f93b4f22d', 'email', 'master', 'OpenID Connect built-in action: email', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('eb01fa23-cbd7-4576-a9e9-f5075954b9e6', 'address', 'master', 'OpenID Connect built-in action: address', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('70020d10-e937-43b2-ac3b-c7339593c20b', 'phone', 'master', 'OpenID Connect built-in action: phone', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('0b147536-c77e-4c19-825d-c104d9dbb41a', 'roles', 'master', 'OpenID Connect action for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('bd6eec3b-c69e-4f6f-9ff8-13c00889279c', 'web-origins', 'master', 'OpenID Connect action for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('292586f1-dfde-4c6e-a7c0-99f8dcb9e8fa', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in action', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('c33f5ab1-b994-4ce6-b729-55b62c8a4f95', 'acr', 'master', 'OpenID Connect action for add acr (authentication context class reference) to the token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('f94413e6-e0d9-40e6-9dea-b4886c08808f', 'offline_access', '2b937222-9615-437f-bf8d-0e73191e2c82', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('150585f5-f538-4051-9e83-2e9a90722b39', 'role_list', '2b937222-9615-437f-bf8d-0e73191e2c82', 'SAML role list', 'saml');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('baba4d5b-c3c9-481b-90f3-290650239f84', 'profile', '2b937222-9615-437f-bf8d-0e73191e2c82', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('d73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', 'email', '2b937222-9615-437f-bf8d-0e73191e2c82', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('db8ffb74-3e85-496c-9862-30d194f10d3c', 'address', '2b937222-9615-437f-bf8d-0e73191e2c82', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('5270b21c-a00a-43d2-a96a-45dd63fb31ea', 'phone', '2b937222-9615-437f-bf8d-0e73191e2c82', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('c255bdb5-88c0-45eb-b281-f93d7f5f1893', 'roles', '2b937222-9615-437f-bf8d-0e73191e2c82', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('20cc23a8-2380-4cea-a850-0cd648f75edc', 'web-origins', '2b937222-9615-437f-bf8d-0e73191e2c82', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('8f13b935-86e1-433b-ad55-465c18396ef4', 'microprofile-jwt', '2b937222-9615-437f-bf8d-0e73191e2c82', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('d93dd56b-989b-4f4b-bc8f-a134e429a728', 'acr', '2b937222-9615-437f-bf8d-0e73191e2c82', 'OpenID Connect scope for add acr (authentication context class reference) to the token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', 'blogq', '2b937222-9615-437f-bf8d-0e73191e2c82', 'BlogQ', 'openid-connect');


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('9d8da12b-cab2-410d-9bf0-95c4f4b14daf', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('9d8da12b-cab2-410d-9bf0-95c4f4b14daf', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('741bf401-5cb1-4231-b9b8-054b1fb29739', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('741bf401-5cb1-4231-b9b8-054b1fb29739', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d82d724d-fe1d-4087-914d-81e0e902a609', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d82d724d-fe1d-4087-914d-81e0e902a609', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d82d724d-fe1d-4087-914d-81e0e902a609', 'true', 'include.in.token.action');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('4073ebe7-0135-4c60-b9a6-a65f93b4f22d', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('4073ebe7-0135-4c60-b9a6-a65f93b4f22d', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('4073ebe7-0135-4c60-b9a6-a65f93b4f22d', 'true', 'include.in.token.action');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('eb01fa23-cbd7-4576-a9e9-f5075954b9e6', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('eb01fa23-cbd7-4576-a9e9-f5075954b9e6', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('eb01fa23-cbd7-4576-a9e9-f5075954b9e6', 'true', 'include.in.token.action');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('70020d10-e937-43b2-ac3b-c7339593c20b', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('70020d10-e937-43b2-ac3b-c7339593c20b', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('70020d10-e937-43b2-ac3b-c7339593c20b', 'true', 'include.in.token.action');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0b147536-c77e-4c19-825d-c104d9dbb41a', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0b147536-c77e-4c19-825d-c104d9dbb41a', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0b147536-c77e-4c19-825d-c104d9dbb41a', 'false', 'include.in.token.action');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('bd6eec3b-c69e-4f6f-9ff8-13c00889279c', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('bd6eec3b-c69e-4f6f-9ff8-13c00889279c', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('bd6eec3b-c69e-4f6f-9ff8-13c00889279c', 'false', 'include.in.token.action');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('292586f1-dfde-4c6e-a7c0-99f8dcb9e8fa', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('292586f1-dfde-4c6e-a7c0-99f8dcb9e8fa', 'true', 'include.in.token.action');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('c33f5ab1-b994-4ce6-b729-55b62c8a4f95', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('c33f5ab1-b994-4ce6-b729-55b62c8a4f95', 'false', 'include.in.token.action');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('f94413e6-e0d9-40e6-9dea-b4886c08808f', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('f94413e6-e0d9-40e6-9dea-b4886c08808f', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('150585f5-f538-4051-9e83-2e9a90722b39', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('150585f5-f538-4051-9e83-2e9a90722b39', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('baba4d5b-c3c9-481b-90f3-290650239f84', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('baba4d5b-c3c9-481b-90f3-290650239f84', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('baba4d5b-c3c9-481b-90f3-290650239f84', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('db8ffb74-3e85-496c-9862-30d194f10d3c', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('db8ffb74-3e85-496c-9862-30d194f10d3c', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('db8ffb74-3e85-496c-9862-30d194f10d3c', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('5270b21c-a00a-43d2-a96a-45dd63fb31ea', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('5270b21c-a00a-43d2-a96a-45dd63fb31ea', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('5270b21c-a00a-43d2-a96a-45dd63fb31ea', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('c255bdb5-88c0-45eb-b281-f93d7f5f1893', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('c255bdb5-88c0-45eb-b281-f93d7f5f1893', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('c255bdb5-88c0-45eb-b281-f93d7f5f1893', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('20cc23a8-2380-4cea-a850-0cd648f75edc', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('20cc23a8-2380-4cea-a850-0cd648f75edc', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('20cc23a8-2380-4cea-a850-0cd648f75edc', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('8f13b935-86e1-433b-ad55-465c18396ef4', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('8f13b935-86e1-433b-ad55-465c18396ef4', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d93dd56b-989b-4f4b-bc8f-a134e429a728', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d93dd56b-989b-4f4b-bc8f-a134e429a728', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', '', 'gui.order');


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('71f2376d-ff99-44db-ba8d-4c485915b2ab', '0b147536-c77e-4c19-825d-c104d9dbb41a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('71f2376d-ff99-44db-ba8d-4c485915b2ab', 'bd6eec3b-c69e-4f6f-9ff8-13c00889279c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('71f2376d-ff99-44db-ba8d-4c485915b2ab', '4073ebe7-0135-4c60-b9a6-a65f93b4f22d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('71f2376d-ff99-44db-ba8d-4c485915b2ab', 'd82d724d-fe1d-4087-914d-81e0e902a609', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('71f2376d-ff99-44db-ba8d-4c485915b2ab', '9d8da12b-cab2-410d-9bf0-95c4f4b14daf', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('71f2376d-ff99-44db-ba8d-4c485915b2ab', 'eb01fa23-cbd7-4576-a9e9-f5075954b9e6', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('71f2376d-ff99-44db-ba8d-4c485915b2ab', '292586f1-dfde-4c6e-a7c0-99f8dcb9e8fa', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('71f2376d-ff99-44db-ba8d-4c485915b2ab', '70020d10-e937-43b2-ac3b-c7339593c20b', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0204d41-458b-46d9-be73-783880589f08', '0b147536-c77e-4c19-825d-c104d9dbb41a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0204d41-458b-46d9-be73-783880589f08', 'bd6eec3b-c69e-4f6f-9ff8-13c00889279c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0204d41-458b-46d9-be73-783880589f08', '4073ebe7-0135-4c60-b9a6-a65f93b4f22d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0204d41-458b-46d9-be73-783880589f08', 'd82d724d-fe1d-4087-914d-81e0e902a609', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0204d41-458b-46d9-be73-783880589f08', '9d8da12b-cab2-410d-9bf0-95c4f4b14daf', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0204d41-458b-46d9-be73-783880589f08', 'eb01fa23-cbd7-4576-a9e9-f5075954b9e6', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0204d41-458b-46d9-be73-783880589f08', '292586f1-dfde-4c6e-a7c0-99f8dcb9e8fa', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0204d41-458b-46d9-be73-783880589f08', '70020d10-e937-43b2-ac3b-c7339593c20b', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7a3d4ea9-70b3-4af6-aaf9-45066f6ccd2c', '0b147536-c77e-4c19-825d-c104d9dbb41a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7a3d4ea9-70b3-4af6-aaf9-45066f6ccd2c', 'bd6eec3b-c69e-4f6f-9ff8-13c00889279c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7a3d4ea9-70b3-4af6-aaf9-45066f6ccd2c', '4073ebe7-0135-4c60-b9a6-a65f93b4f22d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7a3d4ea9-70b3-4af6-aaf9-45066f6ccd2c', 'd82d724d-fe1d-4087-914d-81e0e902a609', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7a3d4ea9-70b3-4af6-aaf9-45066f6ccd2c', '9d8da12b-cab2-410d-9bf0-95c4f4b14daf', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7a3d4ea9-70b3-4af6-aaf9-45066f6ccd2c', 'eb01fa23-cbd7-4576-a9e9-f5075954b9e6', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7a3d4ea9-70b3-4af6-aaf9-45066f6ccd2c', '292586f1-dfde-4c6e-a7c0-99f8dcb9e8fa', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7a3d4ea9-70b3-4af6-aaf9-45066f6ccd2c', '70020d10-e937-43b2-ac3b-c7339593c20b', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3b469c75-5126-4367-af6e-c3840c619260', '0b147536-c77e-4c19-825d-c104d9dbb41a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3b469c75-5126-4367-af6e-c3840c619260', 'bd6eec3b-c69e-4f6f-9ff8-13c00889279c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3b469c75-5126-4367-af6e-c3840c619260', '4073ebe7-0135-4c60-b9a6-a65f93b4f22d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3b469c75-5126-4367-af6e-c3840c619260', 'd82d724d-fe1d-4087-914d-81e0e902a609', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3b469c75-5126-4367-af6e-c3840c619260', '9d8da12b-cab2-410d-9bf0-95c4f4b14daf', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3b469c75-5126-4367-af6e-c3840c619260', 'eb01fa23-cbd7-4576-a9e9-f5075954b9e6', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3b469c75-5126-4367-af6e-c3840c619260', '292586f1-dfde-4c6e-a7c0-99f8dcb9e8fa', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3b469c75-5126-4367-af6e-c3840c619260', '70020d10-e937-43b2-ac3b-c7339593c20b', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('896bc591-348d-45c4-8a2f-b2593c7b2155', '0b147536-c77e-4c19-825d-c104d9dbb41a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('896bc591-348d-45c4-8a2f-b2593c7b2155', 'bd6eec3b-c69e-4f6f-9ff8-13c00889279c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('896bc591-348d-45c4-8a2f-b2593c7b2155', '4073ebe7-0135-4c60-b9a6-a65f93b4f22d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('896bc591-348d-45c4-8a2f-b2593c7b2155', 'd82d724d-fe1d-4087-914d-81e0e902a609', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('896bc591-348d-45c4-8a2f-b2593c7b2155', '9d8da12b-cab2-410d-9bf0-95c4f4b14daf', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('896bc591-348d-45c4-8a2f-b2593c7b2155', 'eb01fa23-cbd7-4576-a9e9-f5075954b9e6', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('896bc591-348d-45c4-8a2f-b2593c7b2155', '292586f1-dfde-4c6e-a7c0-99f8dcb9e8fa', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('896bc591-348d-45c4-8a2f-b2593c7b2155', '70020d10-e937-43b2-ac3b-c7339593c20b', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', '0b147536-c77e-4c19-825d-c104d9dbb41a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', 'bd6eec3b-c69e-4f6f-9ff8-13c00889279c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', '4073ebe7-0135-4c60-b9a6-a65f93b4f22d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', 'd82d724d-fe1d-4087-914d-81e0e902a609', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', '9d8da12b-cab2-410d-9bf0-95c4f4b14daf', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', 'eb01fa23-cbd7-4576-a9e9-f5075954b9e6', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', '292586f1-dfde-4c6e-a7c0-99f8dcb9e8fa', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', '70020d10-e937-43b2-ac3b-c7339593c20b', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'c255bdb5-88c0-45eb-b281-f93d7f5f1893', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'd93dd56b-989b-4f4b-bc8f-a134e429a728', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'baba4d5b-c3c9-481b-90f3-290650239f84', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'd73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', '20cc23a8-2380-4cea-a850-0cd648f75edc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'f94413e6-e0d9-40e6-9dea-b4886c08808f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', '8f13b935-86e1-433b-ad55-465c18396ef4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', '5270b21c-a00a-43d2-a96a-45dd63fb31ea', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'db8ffb74-3e85-496c-9862-30d194f10d3c', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'ee17eb07-b7f3-4093-8ac8-286290c3bf90', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'c255bdb5-88c0-45eb-b281-f93d7f5f1893', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'd93dd56b-989b-4f4b-bc8f-a134e429a728', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'baba4d5b-c3c9-481b-90f3-290650239f84', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'd73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', '20cc23a8-2380-4cea-a850-0cd648f75edc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'ee17eb07-b7f3-4093-8ac8-286290c3bf90', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'f94413e6-e0d9-40e6-9dea-b4886c08808f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', '8f13b935-86e1-433b-ad55-465c18396ef4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', '5270b21c-a00a-43d2-a96a-45dd63fb31ea', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'db8ffb74-3e85-496c-9862-30d194f10d3c', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bf39530a-b2a6-4e37-8b3d-56614fdde86d', 'c255bdb5-88c0-45eb-b281-f93d7f5f1893', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bf39530a-b2a6-4e37-8b3d-56614fdde86d', 'd93dd56b-989b-4f4b-bc8f-a134e429a728', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bf39530a-b2a6-4e37-8b3d-56614fdde86d', 'baba4d5b-c3c9-481b-90f3-290650239f84', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bf39530a-b2a6-4e37-8b3d-56614fdde86d', 'd73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bf39530a-b2a6-4e37-8b3d-56614fdde86d', '20cc23a8-2380-4cea-a850-0cd648f75edc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bf39530a-b2a6-4e37-8b3d-56614fdde86d', 'f94413e6-e0d9-40e6-9dea-b4886c08808f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bf39530a-b2a6-4e37-8b3d-56614fdde86d', '8f13b935-86e1-433b-ad55-465c18396ef4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bf39530a-b2a6-4e37-8b3d-56614fdde86d', '5270b21c-a00a-43d2-a96a-45dd63fb31ea', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bf39530a-b2a6-4e37-8b3d-56614fdde86d', 'db8ffb74-3e85-496c-9862-30d194f10d3c', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', 'c255bdb5-88c0-45eb-b281-f93d7f5f1893', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', 'd93dd56b-989b-4f4b-bc8f-a134e429a728', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', 'baba4d5b-c3c9-481b-90f3-290650239f84', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', 'd73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', '20cc23a8-2380-4cea-a850-0cd648f75edc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', 'f94413e6-e0d9-40e6-9dea-b4886c08808f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', '8f13b935-86e1-433b-ad55-465c18396ef4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', '5270b21c-a00a-43d2-a96a-45dd63fb31ea', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', 'db8ffb74-3e85-496c-9862-30d194f10d3c', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0c62cf8-4567-44ae-ad1e-785b0b4aa83a', 'c255bdb5-88c0-45eb-b281-f93d7f5f1893', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0c62cf8-4567-44ae-ad1e-785b0b4aa83a', 'd93dd56b-989b-4f4b-bc8f-a134e429a728', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0c62cf8-4567-44ae-ad1e-785b0b4aa83a', 'baba4d5b-c3c9-481b-90f3-290650239f84', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0c62cf8-4567-44ae-ad1e-785b0b4aa83a', 'd73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0c62cf8-4567-44ae-ad1e-785b0b4aa83a', '20cc23a8-2380-4cea-a850-0cd648f75edc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0c62cf8-4567-44ae-ad1e-785b0b4aa83a', 'f94413e6-e0d9-40e6-9dea-b4886c08808f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0c62cf8-4567-44ae-ad1e-785b0b4aa83a', '8f13b935-86e1-433b-ad55-465c18396ef4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0c62cf8-4567-44ae-ad1e-785b0b4aa83a', '5270b21c-a00a-43d2-a96a-45dd63fb31ea', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e0c62cf8-4567-44ae-ad1e-785b0b4aa83a', 'db8ffb74-3e85-496c-9862-30d194f10d3c', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0ee223a4-733b-4513-9650-25dd62a70b0e', 'c255bdb5-88c0-45eb-b281-f93d7f5f1893', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0ee223a4-733b-4513-9650-25dd62a70b0e', 'd93dd56b-989b-4f4b-bc8f-a134e429a728', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0ee223a4-733b-4513-9650-25dd62a70b0e', 'baba4d5b-c3c9-481b-90f3-290650239f84', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0ee223a4-733b-4513-9650-25dd62a70b0e', 'd73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0ee223a4-733b-4513-9650-25dd62a70b0e', '20cc23a8-2380-4cea-a850-0cd648f75edc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0ee223a4-733b-4513-9650-25dd62a70b0e', 'f94413e6-e0d9-40e6-9dea-b4886c08808f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0ee223a4-733b-4513-9650-25dd62a70b0e', '8f13b935-86e1-433b-ad55-465c18396ef4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0ee223a4-733b-4513-9650-25dd62a70b0e', '5270b21c-a00a-43d2-a96a-45dd63fb31ea', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0ee223a4-733b-4513-9650-25dd62a70b0e', 'db8ffb74-3e85-496c-9862-30d194f10d3c', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5b4a3ff-a868-471e-9eed-24145f758b5d', 'c255bdb5-88c0-45eb-b281-f93d7f5f1893', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5b4a3ff-a868-471e-9eed-24145f758b5d', 'd93dd56b-989b-4f4b-bc8f-a134e429a728', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5b4a3ff-a868-471e-9eed-24145f758b5d', 'baba4d5b-c3c9-481b-90f3-290650239f84', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5b4a3ff-a868-471e-9eed-24145f758b5d', 'd73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5b4a3ff-a868-471e-9eed-24145f758b5d', '20cc23a8-2380-4cea-a850-0cd648f75edc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5b4a3ff-a868-471e-9eed-24145f758b5d', 'f94413e6-e0d9-40e6-9dea-b4886c08808f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5b4a3ff-a868-471e-9eed-24145f758b5d', '8f13b935-86e1-433b-ad55-465c18396ef4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5b4a3ff-a868-471e-9eed-24145f758b5d', '5270b21c-a00a-43d2-a96a-45dd63fb31ea', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5b4a3ff-a868-471e-9eed-24145f758b5d', 'db8ffb74-3e85-496c-9862-30d194f10d3c', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', 'c255bdb5-88c0-45eb-b281-f93d7f5f1893', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', 'd93dd56b-989b-4f4b-bc8f-a134e429a728', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', 'baba4d5b-c3c9-481b-90f3-290650239f84', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', 'd73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', '20cc23a8-2380-4cea-a850-0cd648f75edc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', 'f94413e6-e0d9-40e6-9dea-b4886c08808f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', '8f13b935-86e1-433b-ad55-465c18396ef4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', '5270b21c-a00a-43d2-a96a-45dd63fb31ea', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', 'db8ffb74-3e85-496c-9862-30d194f10d3c', false);


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('9d8da12b-cab2-410d-9bf0-95c4f4b14daf', '01fa7869-599e-4b5d-b377-fa0de2d1569d');
INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('f94413e6-e0d9-40e6-9dea-b4886c08808f', 'f19c5777-099d-4c6e-9f3f-350119bb6f3b');
INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', '3a90c589-fa25-4818-ab4f-8b6130c228d5');
INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', '8567f7f8-6587-4792-99b2-db141ca899b3');
INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', 'c3f065aa-6173-4d49-8995-d2b302707207');
INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', '8b10b8bd-fc65-4bd8-a9e9-0a4642b112cc');
INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', '80e3747b-66ef-4fbe-9221-206066e53139');
INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', 'dcbd94c1-8b5e-44bf-9cdf-39de1a46baae');
INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', 'a99a7a4b-662d-4bb9-a659-08608b66f34d');
INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('ee17eb07-b7f3-4093-8ac8-286290c3bf90', '87669ed2-eb82-4a04-9a19-abeb21440284');


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('b4e3201e-bf08-43e4-a272-62e6d9859ec0', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('e3c2ab9e-3fcc-4fcc-a794-6f2c0feb4fe2', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('ddd81e73-1353-40c4-b3d9-f28e60a2d623', 'Full Scope Disabled', 'master', 'action', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('5e690f69-266b-4453-ab16-cb77c141ac90', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('76da5be9-2a96-415e-ac8a-30a4eb77fa34', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('4a175a13-1666-4ff3-ae72-dd5130e6540f', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('48fea2fe-14ab-4a66-91d6-b4368026286d', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('e0593f9b-a26c-469d-8225-fc654185f31c', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('f44bec78-d9bc-4194-a85d-d3b020d2e645', 'rsa-generated', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('b82ba87f-db4b-416f-8681-88c13f1ad112', 'rsa-enc-generated', 'master', 'rsa-enc-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('deb4f8e2-0847-458e-aa26-825676908021', 'hmac-generated', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('56d7a9c3-564b-46d8-a4d2-fda2badee8ba', 'aes-generated', 'master', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('792ed69b-38f7-4457-8768-e2fec0ea2fe0', 'rsa-generated', '2b937222-9615-437f-bf8d-0e73191e2c82', 'rsa-generated', 'org.keycloak.keys.KeyProvider', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('5a7e6a43-8229-403a-8809-1378775d9e08', 'rsa-enc-generated', '2b937222-9615-437f-bf8d-0e73191e2c82', 'rsa-enc-generated', 'org.keycloak.keys.KeyProvider', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('5e42f490-9005-481c-bf2b-5df012f1ea43', 'hmac-generated', '2b937222-9615-437f-bf8d-0e73191e2c82', 'hmac-generated', 'org.keycloak.keys.KeyProvider', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('2e29a4bd-2a0f-4593-b643-aaf363c7ab5f', 'aes-generated', '2b937222-9615-437f-bf8d-0e73191e2c82', 'aes-generated', 'org.keycloak.keys.KeyProvider', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('8dd6b2d8-dd30-43b4-a88b-2aad5ac155a9', 'Trusted Hosts', '2b937222-9615-437f-bf8d-0e73191e2c82', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '2b937222-9615-437f-bf8d-0e73191e2c82', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('c24e3c08-f716-47bd-a88b-099db33b1e02', 'Consent Required', '2b937222-9615-437f-bf8d-0e73191e2c82', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '2b937222-9615-437f-bf8d-0e73191e2c82', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('2d2f65d8-55f1-472a-8315-ac9b6a775863', 'Full Scope Disabled', '2b937222-9615-437f-bf8d-0e73191e2c82', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '2b937222-9615-437f-bf8d-0e73191e2c82', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('c197f44b-0558-4b5e-bbfb-a670a1ae1ecc', 'Max Clients Limit', '2b937222-9615-437f-bf8d-0e73191e2c82', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '2b937222-9615-437f-bf8d-0e73191e2c82', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('de36d7dd-8699-408c-b0d4-8bf29bbc76c3', 'Allowed Protocol Mapper Types', '2b937222-9615-437f-bf8d-0e73191e2c82', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '2b937222-9615-437f-bf8d-0e73191e2c82', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('a9750e39-d7e8-42a4-b42f-c552a568c903', 'Allowed Client Scopes', '2b937222-9615-437f-bf8d-0e73191e2c82', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '2b937222-9615-437f-bf8d-0e73191e2c82', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('91e67188-b8b7-43ed-8ca1-382672accb4f', 'Allowed Protocol Mapper Types', '2b937222-9615-437f-bf8d-0e73191e2c82', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '2b937222-9615-437f-bf8d-0e73191e2c82', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('68c3ee48-ebb1-4043-b4bb-4eb8a9182c83', 'Allowed Client Scopes', '2b937222-9615-437f-bf8d-0e73191e2c82', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '2b937222-9615-437f-bf8d-0e73191e2c82', 'authenticated');


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.component_config (id, component_id, name, value) VALUES ('31b80334-c224-4491-ae67-3bd5a3febb74', 'e0593f9b-a26c-469d-8225-fc654185f31c', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('2b9ded67-26d4-41a6-86c6-dc7192f10257', '4a175a13-1666-4ff3-ae72-dd5130e6540f', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('9adf1818-04f9-4577-9661-168674395622', '48fea2fe-14ab-4a66-91d6-b4368026286d', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('6e59a9df-1880-4c22-bb20-07fd4203e0c4', '48fea2fe-14ab-4a66-91d6-b4368026286d', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('5093c019-e01c-4e9f-b255-04e4f0eddf52', '48fea2fe-14ab-4a66-91d6-b4368026286d', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('8743a7bd-a5e5-43ba-96e2-95bb24b58e14', '48fea2fe-14ab-4a66-91d6-b4368026286d', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('ef230a38-2592-4555-a4ae-b38fcb485e94', '48fea2fe-14ab-4a66-91d6-b4368026286d', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('daa85afc-d339-4cf3-9312-573c4a7e6094', '48fea2fe-14ab-4a66-91d6-b4368026286d', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('0a6088ba-d651-4a8b-b1b8-2f4f8cfd002c', '48fea2fe-14ab-4a66-91d6-b4368026286d', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('c4508190-bd89-4441-acb7-b1583c54d3a7', '48fea2fe-14ab-4a66-91d6-b4368026286d', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('237a9315-9264-4f5f-8cea-2ba140bbcc5c', 'b4e3201e-bf08-43e4-a272-62e6d9859ec0', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('e5a67291-76af-4539-9e34-482c97cafcc7', 'b4e3201e-bf08-43e4-a272-62e6d9859ec0', 'client-uris-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('443ff5bd-e08f-4114-8916-1a12cce79274', '76da5be9-2a96-415e-ac8a-30a4eb77fa34', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('d0aff083-b6b9-41fa-9f39-5613ccae3e07', '76da5be9-2a96-415e-ac8a-30a4eb77fa34', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('7ef140fe-675c-4694-8cc5-d951c1cc9711', '76da5be9-2a96-415e-ac8a-30a4eb77fa34', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('981bc646-4454-4ec1-88c6-dfc89e22ecae', '76da5be9-2a96-415e-ac8a-30a4eb77fa34', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('5908dbcd-c15e-4206-8e04-182ae2cf2606', '76da5be9-2a96-415e-ac8a-30a4eb77fa34', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('90e8acf2-df9c-4634-a6aa-2e61b67929ed', '76da5be9-2a96-415e-ac8a-30a4eb77fa34', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('dd1a7b2c-a6b1-4c76-aa83-ea2383a7e0db', '76da5be9-2a96-415e-ac8a-30a4eb77fa34', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('e310a7d7-2e43-45aa-bddb-1dadda98bc74', '76da5be9-2a96-415e-ac8a-30a4eb77fa34', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('1e704c54-90a2-4322-8181-bfe57a717302', '5e690f69-266b-4453-ab16-cb77c141ac90', 'max-clients', '200');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('fea93041-578b-4c5c-8214-87d4884b3dbe', 'b82ba87f-db4b-416f-8681-88c13f1ad112', 'keyUse', 'ENC');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('7cd91d71-1c7c-4b9a-9127-5654fc1c3626', 'b82ba87f-db4b-416f-8681-88c13f1ad112', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('df8a07f5-0c21-4f81-a5b3-32e5a6480bf1', 'b82ba87f-db4b-416f-8681-88c13f1ad112', 'privateKey', 'MIIEowIBAAKCAQEAk2tq5tK39/Hca+R0gNvEwzXKIaIIqGA6vPCgjczQDRcgEqun3QRrKcvaOy9pHsJkjuHVeAJ+RCIcq3D/cCZomDn/phLQDyvZsD8PPnAbbOODoVjRz4g7h4f5tZgKLkEgKw+y3TgJDYYYuBoOxea+DP+SDNXXhGQIPXlXbIP1w9wU272t/F4k74oz5qsJLxM982PCX3YOYFQidDq/K5JUeGlIctxIbZQLxA56TijoI9fvmKmoM1y52GOINkDuLYtBEoqZR4X9rr7sSqrPxSbnMrYRQZ9wogGGa0LD29nAzFYYTQiNA0IW72cJqBJYEa3A+vmhnfmFHmt3RUY5RxknswIDAQABAoIBAFmEfOG1SykwoNyTWXt1+EFhxGAv+HnmFUTuCVCR8jRAuqUbv08ig8BZnScbXwXinRV2ZR3+xZWx8R7Z+wKrEBCAB5FdEyJjSkkPwb30bXLtpNyxBpay7xMZqrRuop/7xADiA4b5o+WmbBQ/HoFl4DocZx+MKtalt6s8p62pY++OIoO9y8NiDojG8ZMKXLJqAYgvuIBq8jeMwOlKlGxpNcvL3fuf6P2rHjNqwMA52bnKnEO/CT8ESIU7UXsxVsgIig3MvTn3TlhMqpaZ6ajTT1ODSCCNYJITOvG+l+wej9KLSX8j+8am92Q3NOUCNnxn3SknOxxwgix2dAOu8Y2Ej2ECgYEA37LyWMq5aodJ3/AT35j3AkAZ/Wk/gQzoAjNh4MqiuIGTrALqhqdLE396tw6DLW06TrVlnq1YIhG/wE7KIAGPerkZE8Ag6Ggvgt3GD6DvQ2FbArkHAMSQHJoGNHdN3qAj4XdsmTBjcGUYz+sVW/yTTVS8oDN48dyP2tVwb+CEpQcCgYEAqLTLv2ekQK4nTVZp+uepMHES2sFWxr3uOFmuWYJTGQLxcNoS0U5Z4EUjHDvZILbYXBE56x8pDpfPWiTxjm0+BPA8eFZL1rm9Us/0oALjoGCcQxPrnmqUgRJ0kPh8KX4UIlY0UGNBeJbsQnWxVo/0b8h76qv3BmX0abT0tSxJCPUCgYBa6DTWYqQRJ6Oc7sqUvmv7LSOiuQfGoQEUC9+F47NW+cmSSKkYSZoX9WFgTPSAHHhqjgsa/eToC4B6XUqE0T2GqPwI67Yz3Esaipe3uDYjksfShnDTHg5WoT1OSwGJLFkIgmjOpDx065C2xhkrBayy63GwRNqsp26Khtynin09NwKBgAcY2/1oWcOSz/pz6S9x8W8lQprLSWBA+zWJqEkBr4c81XVe5y3A8wz5O5njdqXmq0FsRBh9DhgcENAE/9hzBgnlJVYWo0gcNje2od7dYEAN8GTuAJqAd1DauuaiXW7NbAFpyPecxVNSXgwJsXUnxyuwrm3X4CN3xIlx4F2CyGvFAoGBAK3QmHTvC/yEgRI7b0hp3AzYt6Tim/Nh8wYtfla4G07bJFC0y/HDeUEaaTuzwVkDr+/nFbJxq2WkCegk+3+7RStFLusLjIlD+FILEt7ZIJfPaE1PtSZdREySRYUOIbX5N5ahWWTC4yY9Wtiubp2y4y60n0jMNkb4JCRXn6YD+IDr');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('57a3dc5f-ac17-4e40-ad6b-6621814895de', 'b82ba87f-db4b-416f-8681-88c13f1ad112', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('e1f47f91-d780-410a-860c-be13efd6b69c', 'b82ba87f-db4b-416f-8681-88c13f1ad112', 'certificate', 'MIICmzCCAYMCBgF+6N3svzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwMjExMTI1NzQ1WhcNMzIwMjExMTI1OTI1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCTa2rm0rf38dxr5HSA28TDNcohogioYDq88KCNzNANFyASq6fdBGspy9o7L2kewmSO4dV4An5EIhyrcP9wJmiYOf+mEtAPK9mwPw8+cBts44OhWNHPiDuHh/m1mAouQSArD7LdOAkNhhi4Gg7F5r4M/5IM1deEZAg9eVdsg/XD3BTbva38XiTvijPmqwkvEz3zY8Jfdg5gVCJ0Or8rklR4aUhy3EhtlAvEDnpOKOgj1++YqagzXLnYY4g2QO4ti0ESiplHhf2uvuxKqs/FJucythFBn3CiAYZrQsPb2cDMVhhNCI0DQhbvZwmoElgRrcD6+aGd+YUea3dFRjlHGSezAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAEg8zQqk5gEbtL9FAhrYUdiJbi0CoHi3dzBP+cTGnuS8ZXl/1ItGQzGdi9IO6eLBuumpNoOmd7GAsjmUBN5XrCXnyl6xIQy6JJvpXDkw12m3Xr9IJdFNlprzZk4OmuMH8wet6+m29+iFjXvERuNaI6S+SAuK1qIAHeVMgSM+lpduPib3HvaPljr5utY7PylmyGwj9fPkK/XGbrdCKcjoeM7n4xeE2Umv0yVYyRCGwTHzzvtsAtfHZMpN8ODsvwMPrwDxNz3JQ5JNGyoNEFB4YQtX8t7Qj2o0unRmEBJJdB7j4Z1aHZPJ1sv45UQxFMWNg3YkJM8LveksSKWooIcZNSM=');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a400aeae-cd33-4859-a7fb-8505984ee130', 'f44bec78-d9bc-4194-a85d-d3b020d2e645', 'keyUse', 'SIG');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('9969b577-680a-4613-a94d-8ec996be3eeb', 'f44bec78-d9bc-4194-a85d-d3b020d2e645', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('8c0556c5-21f8-4230-95b2-91c0d33822a2', 'f44bec78-d9bc-4194-a85d-d3b020d2e645', 'privateKey', 'MIIEowIBAAKCAQEApyIWyVMu8ASa2jsU85ZWtZ9LNBgTh+vDSnVuh4xeXLcglPe+06gsdht+6rXzY32+ugj1I70QKTrLhmmxXKQBBoeL21qeQU5M1kApiaTZDKaDQ3LWmoBmhhbHxVB0tOHaIgbYED6VdAJVOSSP238MXVphYur4WkrkERlI8GHiEjJ1tRJrX5BkeNSziTXo3gu7wqBb+3d7s+Gd5cK2a2IhoImugIKchof9Xh1W2ybpd03vqKS1RshDvF7ynkr0EmAJagWRKEryEUYRIqiKODUefSTYI9rI0jxP0icya1KS/4BEJeMV0MrXzfG2og+89Y2u5wKAY/hNv67elMdYaexAqQIDAQABAoIBABa8MWNTmHf3+GSlUtVL5yGvuJguikGcFaXEUbPIqXFtS9ZX2TKLlvi+BsbA14n6Kf6+hzJEXrVtFRCEwia6/JS5zZGaQxrZHuSqN7xMm2X4JLUBIyZDPy8QXD6AElAkxPqJ+cxD5yqvwo4SZitSngj46XR+SChoNZwJ130zo4Ab+oj8cBqHp3ICsyMDZAk+TepTKsknUYf3mXAm7nQd+yr0se9S4mpRSICnq6gSOTKEMAd5FfnKdvjAeBI3dNlC6X2ZhTHm2dDN8JprtHFaySHdzWMb9xJjwrtMTc7VaB5L/hOOO82bHm4mlKdo+jBwfsYowI6LaSx/uGVUJyjBGU0CgYEA5XBinMxk/UpqV5c7Zda8Eb8myKF+D6kx24vjGhPlXjN16gR+62m4SIRJdBQS2NHJSyNH8pU0LY6l4MEf2W6zyzcly2e5z6Bp83aI5lxLIKmVMNnyWBP37uBBGRHnTKlBze/MPIos5Ozl77HgH0Wfze/yBzy3dEatASBhlNCIcxsCgYEAuns38ftxaZph043cVIxmABXDsAAeu5NtPfqkS6Y97OSujEmQ85y4MYk3x1U5apdoXuyIzCUIDBfbj/afvsHjeGQBmvuE0tnZ6/vjBneEfxXla3n/Ht1e90UHlBN2KMwISxfmc9tWasJZQe139lIJwWqhNVGGD/Logx0kxDvMU4sCgYEA3L/vsSsa83S4skOoe4hKdMy0dQ6j6k+Az9pci8eexK7AgYMH1lpmWyckQRHbPE9D3A46+BREGp0HziIiEaJoTFpn+7d12GVf60Yd233rLqbbCyB3AfVcc7HCEGvgXirvTEOu/oR3Q18GsEM0/wGPCqYU+I+bdr1VUSMln/evgQcCgYBe52CkdQvV66zHppWwLbenaWwqwRTi73eUKF++5D71tbgjSzlK0cJn62aIupW66o1CaeyAwIPk66thC+lmgnRKi9LJViHV0Or4DzwNyXuT1cfpN7AfvBedjfL6aCElSBkcZnBxG/pR4NDeHYWExWGTnrmmUfQBX+T2/Tj96VTmWwKBgEm4p6060vA8gWoWlptNakMFZzVtsSNI7ym8GsYzb58pQu4lhkT+RE770rR+C1FdkqAI6GuWstsftbZwoaRcX8n/OfuqLnVAFcrGcNR0Pku7pUiQy4fWRCKfPTezQpm8J3L6p8JJSGIa8/JWTYfq4QgM3+mr0UHR0KsrSmApYnaz');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('0bcbcbaa-96c2-49cd-9c3c-86099c8dc3b5', 'f44bec78-d9bc-4194-a85d-d3b020d2e645', 'certificate', 'MIICmzCCAYMCBgF+6N3sIjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwMjExMTI1NzQ1WhcNMzIwMjExMTI1OTI1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCnIhbJUy7wBJraOxTzlla1n0s0GBOH68NKdW6HjF5ctyCU977TqCx2G37qtfNjfb66CPUjvRApOsuGabFcpAEGh4vbWp5BTkzWQCmJpNkMpoNDctaagGaGFsfFUHS04doiBtgQPpV0AlU5JI/bfwxdWmFi6vhaSuQRGUjwYeISMnW1EmtfkGR41LOJNejeC7vCoFv7d3uz4Z3lwrZrYiGgia6AgpyGh/1eHVbbJul3Te+opLVGyEO8XvKeSvQSYAlqBZEoSvIRRhEiqIo4NR59JNgj2sjSPE/SJzJrUpL/gEQl4xXQytfN8baiD7z1ja7nAoBj+E2/rt6Ux1hp7ECpAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHkJsDcbFXMiRlCf9X5twNtp+jXw3kCSSa9tvX2MXVKhm3Wm1D2XWLo9y7UKnAaXByUstj/FKEdyhnjFa1yoe+WPGrsVtZfNWa/pZ93knhuzm7gqeihTaAANXK7ND+KzrSOdDUMzc2zCinAQkuIaFEBCEya0c0+qnVLyVykFoONFBF1S9Cdy/bpg7qwo8Ry3GBtxB1ZsUd0g3U/I/vQriJdjdMuWTl8QH4ZNmm3ncuv555upXfxcPeNgIjqe2wKWnOxCee5Tm6Tt3pd4CsyXNf4qYGnG6XdBlER+RLfwk2o/4q4x9i68Zx/Io6No/DmWXvzEMFbIXF8g3pTPIXagviY=');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('e0d25271-0d7d-4257-8a6b-809e6867b155', 'deb4f8e2-0847-458e-aa26-825676908021', 'kid', '0d6705f6-4de8-460b-952f-ba63cbdaa0be');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a8616703-d7a2-4198-90c8-2d821edf82bc', 'deb4f8e2-0847-458e-aa26-825676908021', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('0e14079a-e42f-4b5c-9ad1-1d6263a50658', 'deb4f8e2-0847-458e-aa26-825676908021', 'secret', '_GcyVaPRzuLpdo4gAcADVcb9K8_HXo4fhrqJQfjkU_NDZk1zkx6UQ3nwGR7HI7ZbcF3bPwxHBTjmpmNXbHdmhQ');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('990922fd-86ca-4a91-b3b7-92a09a9819f8', 'deb4f8e2-0847-458e-aa26-825676908021', 'algorithm', 'HS256');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('5de5c263-3967-42b4-8c43-65ae1fe94a7c', '56d7a9c3-564b-46d8-a4d2-fda2badee8ba', 'secret', 'CxTfMa6WfBuxP9x4lX2_4w');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('ca74c479-acb6-4061-ab28-7822d54afd85', '56d7a9c3-564b-46d8-a4d2-fda2badee8ba', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('1053ca3a-f489-4a16-917d-cb808b0d657b', '56d7a9c3-564b-46d8-a4d2-fda2badee8ba', 'kid', '6eff3582-821a-4e87-8e96-2a11dbe73e8d');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('fcae70a8-f717-4473-b9d3-1774ba7482d9', '8dd6b2d8-dd30-43b4-a88b-2aad5ac155a9', 'client-uris-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('41a43b99-19d4-48c1-bcc2-204b8a5dee2b', 'de36d7dd-8699-408c-b0d4-8bf29bbc76c3', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('26ef01a2-5b15-4c36-88ae-995b909ee2cc', '5e42f490-9005-481c-bf2b-5df012f1ea43', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('1de79b10-ddb0-47dc-84e3-9a433071caea', '5e42f490-9005-481c-bf2b-5df012f1ea43', 'kid', 'ba06339c-f903-452d-8037-1fc492b57483');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('04f6be43-aedc-4986-9bc4-3131411c45dd', '5e42f490-9005-481c-bf2b-5df012f1ea43', 'secret', 'xGxrAM2j13j-5-aPsX698059sCx0uBwBwdgkay7fCVH9oxrCs-csYuP4eWYrQWA2PLKYGXDz8kT34J7P_mhfSA');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('321255ef-352b-4b33-a98a-44d2150b8225', '5e42f490-9005-481c-bf2b-5df012f1ea43', 'algorithm', 'HS256');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('1a73e63e-a662-466b-8dc8-fc911155c516', '792ed69b-38f7-4457-8768-e2fec0ea2fe0', 'keyUse', 'SIG');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('b0f9a43c-d75c-4a9d-a9b5-b4077c78a4dd', 'de36d7dd-8699-408c-b0d4-8bf29bbc76c3', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('91fa0502-e5e1-4fbc-8085-0341d2f2fabf', 'de36d7dd-8699-408c-b0d4-8bf29bbc76c3', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('84f7e50c-ff89-4485-9091-222e48d09c6c', 'de36d7dd-8699-408c-b0d4-8bf29bbc76c3', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('275fd96f-7551-4c35-af48-2402da00ead1', 'de36d7dd-8699-408c-b0d4-8bf29bbc76c3', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('0d4f94ec-720e-4fcf-a9c3-0a5edde10cd2', 'de36d7dd-8699-408c-b0d4-8bf29bbc76c3', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('4de5db28-7244-43b1-9268-4df528f76859', '792ed69b-38f7-4457-8768-e2fec0ea2fe0', 'certificate', 'MIICmTCCAYECBgGH3hGegTANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAVibG9ncTAeFw0yMzA1MDIyMDAzMjlaFw0zMzA1MDIyMDA1MDlaMBAxDjAMBgNVBAMMBWJsb2dxMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtDC9Wm44S16nIiUIMMNSknfFjlGQ5O4nSRobuP7uw3fh+cictTJRc1t5s+2NfxNffksVyEpfrEgijqjlWrbdILdEp3MCP0DCysOHbKU/JOfIapy9/wXQx1s8Cl7ZYyvkHUuP3g1qzWC2zqWtUvBsWagv/sNyEny+o2D+ErDBIoWcyfWmcRQapJrvZQKPHvKJiz3jpyl2e8yX9gM35q/A5PctAHje0U8rQZORnHEpbYeccpTCA8C05M6QFbOm3Dc7h2wzpeo4P0sb8fSoaI4S8GPe51I5jnE3sjpSEkBrr/nZSjTSEAJv9mDisg6/LIBDgZe2RHtJe1+3zhQRTfhbcwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBC/ICGL2Zz8hTdkzAtxWGv2fk64MPjb0bQgVfv9sK7aYLYoVVfhOtqch2viK2nsqRMVI/qxLYc9HnKNv/+Gw+9Ed0pgebhwM51cxBZocGa85bEAee3U3NlOFlmr5/lvBDfvvlJ7JRMTUzTkgMoSUJLjORKw8ex0G+PVIae1W4537rtHvzEjuoUxAI9opIxX0Tq2pGphgGKTT9yCHlNcRZsoH9Jc1R2JR/CcXvm3KCAHL80cG3968o6QiOuHf1hhn9yj8rbVu8Y64IGPLMJPmSq0wopNZ4dtJbkQvNxrONkRbb3J+eP7mdp4J985EmNwE1Wu0Vr9cGsxLfxD1wCG8eI');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('d07d6b42-0b31-4b63-8817-eddafcac8469', '792ed69b-38f7-4457-8768-e2fec0ea2fe0', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a8dc0960-bf78-4509-b8fd-408fdfa8cebe', '792ed69b-38f7-4457-8768-e2fec0ea2fe0', 'privateKey', 'MIIEpQIBAAKCAQEAtDC9Wm44S16nIiUIMMNSknfFjlGQ5O4nSRobuP7uw3fh+cictTJRc1t5s+2NfxNffksVyEpfrEgijqjlWrbdILdEp3MCP0DCysOHbKU/JOfIapy9/wXQx1s8Cl7ZYyvkHUuP3g1qzWC2zqWtUvBsWagv/sNyEny+o2D+ErDBIoWcyfWmcRQapJrvZQKPHvKJiz3jpyl2e8yX9gM35q/A5PctAHje0U8rQZORnHEpbYeccpTCA8C05M6QFbOm3Dc7h2wzpeo4P0sb8fSoaI4S8GPe51I5jnE3sjpSEkBrr/nZSjTSEAJv9mDisg6/LIBDgZe2RHtJe1+3zhQRTfhbcwIDAQABAoIBAA9wX6dyBM1i0LPQ8980IfNeL/8OOqzkdPKpoIRDOTnMhoAZWGGahdBHBbbNECmG6bc1/5AX3OCAYimfPt7J06+POsj7YAI21JnjLMugnjgiZF5lWLT5qBZbJfO57CsE1Z8aKTtvvEQ/P0D8gOaeDM9i/qqRaRXWOpvGeAgpvRqg4eEBuNgZQzC3nLyH2ETuGuBI/Wa0mWIvgCpOf8zOaEJ0BdMXrAGwZCGTRo9KEl7cnvuOEl6QwvHF+GKXtO6S+XhITaT/VVe0cAch5XXPed2SN6H3S+Z3PviiDtbnoQSDLu9BbDQh4yRpcNtfLbBbCOM1krGIr6rvh0RSpEXaCfkCgYEA4bVqJuD890RN6wwKPJRdKOKdJh7l/w+VDXbIEBFyJQEGwusX3UBQsOTsI8Ye/lL1mzFGFXNsk95XWRxzo+z10lbR4FJgrb5qApg9vosM3YFObE+USpm70jvfyKA2AkrRY4WhdsM2EmCMDinRC26+g0cD77mR/hhdkUQ2IbmP94sCgYEAzF94ugfeM6E9Hg26xZC8F5MCw3ILCA6MjMMxfFengHOkr7GbIOW9q9eMyOnTzySqDlcn73S1fpnkoJ7SvH/UUTYs1NeWw8kB+OfVttvxo36W8fB1TSjf8rbEHDt/oYhOxFXfPPB068sZY7Ob4hc8FsY762IkLsKNDHROokTaaLkCgYEAwZKi3YErsqzj3mfPB7F+TCg9+omZWyxz+r4aSp2LtWyx7c1OBDS6f1t1oiCySA/CED0sDA2X2yFe7E/YZYg+Mwy+ppI/1AJwTJVgrt/2Qqo5Je8CERDT4jPzcs7kQwcDmUTr+zzkTNJ8i1EVtaZewZvQJnKSYMdox8MmYboRXI0CgYEAt6g8B4E2j1MgZzeTViOAw/aajySXAUCB0aU/fSwQHIDPyAtlCqUqU5i6rXpjm0ypfYWZH7jTuNd2+1h+rGJ7XBfBJewvUfX6zcEY7uCsP25tGzIpV5OZ3LWdenmFcpXZotpAaLT1fUfgoxYuyXhzyUuPYTGqrlKrCjwixfP2ChECgYEAzAZ+IjpJO0kTeuiF/vdj4FxysViY6q1TEnZFa9Xx22f3pbMWzQE/VVMgBdnU+ptRuGcDVQA+MpnzdDHfDv9nUDclvUSjdoF0CSfYOZt3EGyN5i1cpU70uiMJDa0JY3N81zr254Kse4YKax/AawbFbcsB1+MS9X/NG0EYDXypJUA=');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('d460d745-ea98-4d38-9f13-6a625277f240', '2e29a4bd-2a0f-4593-b643-aaf363c7ab5f', 'kid', 'eda35e4c-b7d9-44b0-8c7e-a109e754bcc2');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('2a802e64-039d-450a-b8ce-813746ad6acc', '2e29a4bd-2a0f-4593-b643-aaf363c7ab5f', 'secret', 'uWUndLn_OUZ5_3MtQAlxUg');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('dd8a51b0-ba17-4052-a06e-c56b3463119e', '2e29a4bd-2a0f-4593-b643-aaf363c7ab5f', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('2aa84768-0909-4686-a794-8211bd976fff', '5a7e6a43-8229-403a-8809-1378775d9e08', 'certificate', 'MIICmTCCAYECBgGH3hGgbzANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAVibG9ncTAeFw0yMzA1MDIyMDAzMjlaFw0zMzA1MDIyMDA1MDlaMBAxDjAMBgNVBAMMBWJsb2dxMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4uGKIkNulHFVxAqWyNv6aIUQ++/aM//r1tBDaLCR2wmgmVr1Cwtai6/T6xbTjq0B7wyX+w3cLdXC9h9gfiiYrDJgTUKRtYRL6qwNKiE+0lrVNV/GYvsz88+yWnr3TiqQUwlzAhtJjjmEeBT/1kp3WjL0W402rMKR1uDCo/jVs6Qac2zfPSUcgGEYKhvsH9TNuN6aTYzeBYEae84LlzbAdZ4JKPAq6CgHycgc0eXDlQAgexrs9N9udaZTmT/GR9czHgxARBlAJzBTy9jG3Ed20i13FYs2PDOT53eFp5+MFhqzwWQ5yTha/5J/KE1UgTpNXkiavS0taYLXeSgKsb/p2QIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBnSk2vHj+sxhKY1fl87HHJD9uAznvSbzMJZ3yL/BOxzOJRx3bOeWaonLLBPQrXXKGxMKvg7VkVjmO8VZNAMyR+00SiW3a6Y3/Cdn7NvadiErpEL1PjHFXKdxmm1Lvnik/RvB74z/3J7A/B0/B7N50BIC0QOMO5WsWoz3NZWXpyGGgr9MUZBgmrgtbh6w0PX1r5T925SzYzuI6pFI+AJMOfYXcB1xQBszFeWot6CQw4GUSJSSwHzzvetSQL4a65v9wad6UT0f9/jO8hu9SBuY3H1iEycilI7yMF0juQ1Z8LpDm0K5LPUVXXxNqNWCqf2P1Lac/RxQEqL9XI7SYh06yj');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('6c776752-d248-40f8-ac5f-d9edfed8da67', '5a7e6a43-8229-403a-8809-1378775d9e08', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('fabb9881-86b4-4218-9364-ad605caadedf', '5a7e6a43-8229-403a-8809-1378775d9e08', 'privateKey', 'MIIEowIBAAKCAQEA4uGKIkNulHFVxAqWyNv6aIUQ++/aM//r1tBDaLCR2wmgmVr1Cwtai6/T6xbTjq0B7wyX+w3cLdXC9h9gfiiYrDJgTUKRtYRL6qwNKiE+0lrVNV/GYvsz88+yWnr3TiqQUwlzAhtJjjmEeBT/1kp3WjL0W402rMKR1uDCo/jVs6Qac2zfPSUcgGEYKhvsH9TNuN6aTYzeBYEae84LlzbAdZ4JKPAq6CgHycgc0eXDlQAgexrs9N9udaZTmT/GR9czHgxARBlAJzBTy9jG3Ed20i13FYs2PDOT53eFp5+MFhqzwWQ5yTha/5J/KE1UgTpNXkiavS0taYLXeSgKsb/p2QIDAQABAoH/MdL2yOsqZxo60RwQCaKtOyziFb3Qm1BqowL1JLEeh0G7LXXa0bkCMvHbUg0Usvb2sW2+sNFPJZuf32fZWV6xzo26p+LtF5agcsi4eMqljGgwjqEyA+nOZdrYf64Nh2gwpVfDgwiKnduTUWdSF02wIVVPTzACfCqOB7fxnuId26xs8YBeGFy5S0APBMqI+cw84v3SsXMK77TizsquKN09Vxk+aiWXCPjTBa4LnTNIhvIiWcM6hsvLdgKMHULA5taVXtmbwl4LyzISq3NdjKQv7bhklGd+B4eof28t4qh+KL8vC5FCY7G6/1jsshiKQ9WOTM3sG2m2wz/Qxi/r54eBAoGBAPK05+k+tTA2V7mB+45Gjkjxl8B1UldH1a5s7b3tCqjQcG/fwNV9az+Ck4CoXHlErULCV+SVK7Tz6XTlwfPHfzVacsReH6TFqK5AdWFjXx3GouOENis7FU/mHuPOgZTG7uHuRd0zdijLQ7IREulHlxJd6XPnGg52OyEjQ73M2sCBAoGBAO9OvEe34y/GKat1SlG1+iaHUCwfMwGnYb5LofIrMUYkZkYzJVAwYcRKI+NTwNyrTjVti0ZwHJf0ILvcST4jvzTTXOgWJNRSI1JJLVzTmCbx5wucGfb8CGHBFS8XcDVGmoNIyHT+0zvWotAIcZKUX7JST5YgAVJc30UgupDPtH1ZAoGBAN9+YPPyz6w2zm8/16J7LDjVZ9VM8+b1ejplikNTjXZIgtEyLQMqu+C+4A8geg8dg6KvDXqrNpUp6je//ur6MRSzVm2m8uKrNRpItw5YEFV9/a8epzcF8CkkEhvapI6Y5Y7c+C6qXctQ6eSGPnDcgKvkGL6m9+KLUwW/0HhttJ6BAoGBALuYXlJeXdNCpcHKFXOOk0WGx5t+7a47N41EnvRHVb4lpKMdTv/YnZuRfyairkqOY6XQdODH3DJmZw69dhEnVqmjk25AhaiHpzbHNK9TFDBba4KXYWdTVYLEKMYcupKZAWEvOi004gRDkqhAJkAA3i/dBJSsDD0znrcDHB2PJW8pAoGBAIZrW9L8pfomzvEHAMpKy8672ga3+upUDJFrAsxlY22qETWJUv5MSg8TQC1bXSsJDaJrFlG7ETj9O91lDtZVvzjRL1zWByLKxVD1W8OehPz+aJU/jUQHQANEim2FNXxepTcPbUcwHnvOSF5ErPdf9EFzE/3BvCj+boKO38ArTVMs');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('5227871b-8dbf-4c54-a3b7-ae9505085fc5', '5a7e6a43-8229-403a-8809-1378775d9e08', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('7c423c3e-79ed-4dec-8c3d-0bf450ff5f6c', '5a7e6a43-8229-403a-8809-1378775d9e08', 'keyUse', 'ENC');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('9034128b-333c-4696-862a-2fba4f93c41d', '91e67188-b8b7-43ed-8ca1-382672accb4f', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a7bbe6bc-e475-48e1-9dc0-a486e9417e7f', '91e67188-b8b7-43ed-8ca1-382672accb4f', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('7bf4432c-a819-4dd0-b48b-c54bc0df9ab4', '91e67188-b8b7-43ed-8ca1-382672accb4f', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('8b5e32ef-27dc-4852-ac1e-1f908871c122', '91e67188-b8b7-43ed-8ca1-382672accb4f', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('2a6e4c70-dc1a-49f1-a3c0-f4278402b740', '91e67188-b8b7-43ed-8ca1-382672accb4f', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('52f0c90e-1a27-424a-83c3-cd18f8e40716', '91e67188-b8b7-43ed-8ca1-382672accb4f', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('cace184d-6243-4d1f-9af4-d256f3c2ffcc', '91e67188-b8b7-43ed-8ca1-382672accb4f', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('d9bf8165-c72b-422c-b792-fc28932825ae', '91e67188-b8b7-43ed-8ca1-382672accb4f', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('573d12ff-e0d6-4817-8a50-efeefbf3966b', '68c3ee48-ebb1-4043-b4bb-4eb8a9182c83', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a15c80b4-6d15-4ca3-bb72-fbe35eb05795', 'a9750e39-d7e8-42a4-b42f-c552a568c903', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('36ebdbf7-4928-46e4-8d6b-48d5dc437358', 'c197f44b-0558-4b5e-bbfb-a670a1ae1ecc', 'max-clients', '200');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('d7230f05-aa87-4808-ba01-a4822864c2aa', '8dd6b2d8-dd30-43b4-a88b-2aad5ac155a9', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('cbb55ef8-977a-4ae1-a285-2b70b3789bf2', 'de36d7dd-8699-408c-b0d4-8bf29bbc76c3', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('3d2e39e1-47c4-48ba-bfcc-117698cbe9b8', 'de36d7dd-8699-408c-b0d4-8bf29bbc76c3', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'b326edbd-8646-4c47-bffa-dff23ef4af95');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'a203789d-ad3c-46db-95d5-777b423a802c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'ace317fc-a4fd-46e3-b959-a98a35dca444');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '26220223-8cbc-48bb-99e2-207ead7cdee8');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '2c12c666-d499-4113-93b4-23a31aa0f1ae');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'e0bf838a-346a-4739-9238-e40e250c2da7');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '411b06c8-f580-4ca2-ab4b-499da8d8086b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'dac0334a-3d28-491f-9fb4-945aa1ac925c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'd97cdfaa-d95c-4bfb-916c-1e72cf6340e1');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '540e9fde-9911-487b-a4dc-38cde7a616ae');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'ff55e544-ae29-4bb6-a7b9-27871f8fa83e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'e4cf76ca-2d65-4a62-b05f-bb32f6244e1a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'b7adc794-337d-42fb-a6ed-3f1eb0487df3');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '67f3700a-75df-455f-b7ae-79bd200a1eeb');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'f3d59639-c9d6-401d-9843-d5dcc46b0b5f');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'aaee1233-44bf-4521-a3ea-c4e8a21fa2ce');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '86b5dd7a-1603-47c8-8fa1-85094e78e12a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '46991a10-167e-4e05-88cc-0ed4c3f302be');
INSERT INTO public.composite_role (composite, child_role) VALUES ('2c12c666-d499-4113-93b4-23a31aa0f1ae', 'aaee1233-44bf-4521-a3ea-c4e8a21fa2ce');
INSERT INTO public.composite_role (composite, child_role) VALUES ('26220223-8cbc-48bb-99e2-207ead7cdee8', '46991a10-167e-4e05-88cc-0ed4c3f302be');
INSERT INTO public.composite_role (composite, child_role) VALUES ('26220223-8cbc-48bb-99e2-207ead7cdee8', 'f3d59639-c9d6-401d-9843-d5dcc46b0b5f');
INSERT INTO public.composite_role (composite, child_role) VALUES ('fc8bf92c-0900-443e-8117-2a705f00b519', '370d85ba-8749-41aa-abf0-4bec75578608');
INSERT INTO public.composite_role (composite, child_role) VALUES ('fc8bf92c-0900-443e-8117-2a705f00b519', 'fe94932f-932c-46c4-8449-3361a217ac4e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('fe94932f-932c-46c4-8449-3361a217ac4e', '8d54f1e8-b102-495b-b675-767e8b83c137');
INSERT INTO public.composite_role (composite, child_role) VALUES ('4f5099ea-6bb4-43e6-91b2-84bc1dc90480', 'ffffc86a-670a-4755-b66f-096482806f30');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '358d73a4-be3d-4bc5-abc0-218b8da80d15');
INSERT INTO public.composite_role (composite, child_role) VALUES ('fc8bf92c-0900-443e-8117-2a705f00b519', '01fa7869-599e-4b5d-b377-fa0de2d1569d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('fc8bf92c-0900-443e-8117-2a705f00b519', 'cde32061-02a8-4fe2-a035-e8cf0bd0b403');
INSERT INTO public.composite_role (composite, child_role) VALUES ('80e3747b-66ef-4fbe-9221-206066e53139', 'c3f065aa-6173-4d49-8995-d2b302707207');
INSERT INTO public.composite_role (composite, child_role) VALUES ('80e3747b-66ef-4fbe-9221-206066e53139', '8b10b8bd-fc65-4bd8-a9e9-0a4642b112cc');
INSERT INTO public.composite_role (composite, child_role) VALUES ('c3f065aa-6173-4d49-8995-d2b302707207', '8b10b8bd-fc65-4bd8-a9e9-0a4642b112cc');
INSERT INTO public.composite_role (composite, child_role) VALUES ('dcbd94c1-8b5e-44bf-9cdf-39de1a46baae', 'a99a7a4b-662d-4bb9-a659-08608b66f34d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('dcbd94c1-8b5e-44bf-9cdf-39de1a46baae', 'c3f065aa-6173-4d49-8995-d2b302707207');
INSERT INTO public.composite_role (composite, child_role) VALUES ('dcbd94c1-8b5e-44bf-9cdf-39de1a46baae', '8b10b8bd-fc65-4bd8-a9e9-0a4642b112cc');
INSERT INTO public.composite_role (composite, child_role) VALUES ('dcbd94c1-8b5e-44bf-9cdf-39de1a46baae', '8567f7f8-6587-4792-99b2-db141ca899b3');
INSERT INTO public.composite_role (composite, child_role) VALUES ('87669ed2-eb82-4a04-9a19-abeb21440284', '8b10b8bd-fc65-4bd8-a9e9-0a4642b112cc');
INSERT INTO public.composite_role (composite, child_role) VALUES ('87669ed2-eb82-4a04-9a19-abeb21440284', '8567f7f8-6587-4792-99b2-db141ca899b3');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '4a5fcb74-935f-4941-a407-63e6ed83597c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'fdc418be-dafe-4b1e-b664-7e60d10d145c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '62c2cd5d-9f3d-4719-845a-f055c9b62046');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '70d83f5d-20bf-455b-a121-7aaaad7724d1');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '6d3c07c3-ba23-4822-abec-61bd4ef0ab73');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '0d1a5743-4d41-4457-9484-9649acde5b6b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '3f075890-9489-4e26-a184-59d504d0889d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '9e29f4a9-e184-4946-b627-1099db221548');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '6b67a461-e6ac-4b7e-81cd-82e1ef1a816f');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '4eb73e82-082b-461b-a191-00a867125624');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'cb869c05-a656-4964-824f-4733c6583579');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '22eb7536-4a15-4049-8c66-7e7c3e3fac10');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'ec71af46-8006-4eea-b32e-00429cfd10b4');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'b356f48c-da06-47b6-a584-48695ce433f4');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'a89ef883-6315-4528-b823-b08e4ba16e6d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '4fe6230c-c5af-4d9d-b648-3f21e3e12221');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '87c818d0-78be-4f35-9c54-09b1c019f4ad');
INSERT INTO public.composite_role (composite, child_role) VALUES ('62c2cd5d-9f3d-4719-845a-f055c9b62046', 'b356f48c-da06-47b6-a584-48695ce433f4');
INSERT INTO public.composite_role (composite, child_role) VALUES ('62c2cd5d-9f3d-4719-845a-f055c9b62046', '87c818d0-78be-4f35-9c54-09b1c019f4ad');
INSERT INTO public.composite_role (composite, child_role) VALUES ('70d83f5d-20bf-455b-a121-7aaaad7724d1', 'a89ef883-6315-4528-b823-b08e4ba16e6d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', 'a372ce39-1528-47d0-9eea-7daf18839b26');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '6cf87d04-4636-4c3c-916b-f16d102e0f7d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '2ea6363a-2627-4d8c-98e5-d29da4ce20d0');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '7403fe9e-c0a3-4941-8386-3bec35f7ddf6');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', 'c9df89c0-5848-459c-abff-3c2d97ba726a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', 'ca67bb11-da5e-4fbd-be25-f66895d95e59');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '907be75a-154f-40b0-981d-1fb5472e314e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '48511b90-1175-4de0-9fef-04a7926f4492');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '0eb12698-e768-4744-81c9-07adbd4adecd');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '9ccb6237-576f-4914-9d6c-d84947126a46');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '71caed99-5602-453b-8782-79f982360f77');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '38d6c276-04ee-41cb-aefe-c95d57efba75');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '5c27066b-d666-4b4c-ba7a-73889e8ecffd');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '2943befc-e583-4be8-a444-0e01e83fbec9');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', 'ec6ae452-d28a-41e1-b736-1ea0b63e15cf');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '3e07d7ab-56ec-414b-8ac7-d0f7f64e571c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '8632a893-cf0c-45ab-ac79-dfafe8ed9fb0');
INSERT INTO public.composite_role (composite, child_role) VALUES ('2ea6363a-2627-4d8c-98e5-d29da4ce20d0', '2943befc-e583-4be8-a444-0e01e83fbec9');
INSERT INTO public.composite_role (composite, child_role) VALUES ('2ea6363a-2627-4d8c-98e5-d29da4ce20d0', '8632a893-cf0c-45ab-ac79-dfafe8ed9fb0');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7403fe9e-c0a3-4941-8386-3bec35f7ddf6', 'ec6ae452-d28a-41e1-b736-1ea0b63e15cf');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f10f83c6-7bf9-42d3-8fee-56d518e941d9', 'cb216fa1-9c6e-4cb7-adcc-6119e2c150d9');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f10f83c6-7bf9-42d3-8fee-56d518e941d9', 'ff7f35c8-7a44-4217-8135-120f98d2e91d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('ff7f35c8-7a44-4217-8135-120f98d2e91d', '8edc7ef1-2529-4686-8de4-b6f17c479c6f');
INSERT INTO public.composite_role (composite, child_role) VALUES ('17b86164-cd97-4982-b0da-256601422ce1', 'a760930f-3f97-48f2-81bf-dfb33eb57c49');
INSERT INTO public.composite_role (composite, child_role) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', '1d54179d-fe58-4786-955e-4fc9b47b427a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', '7cdbffa1-3522-47be-8073-e4ac993b1419');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f10f83c6-7bf9-42d3-8fee-56d518e941d9', 'f19c5777-099d-4c6e-9f3f-350119bb6f3b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f10f83c6-7bf9-42d3-8fee-56d518e941d9', '256552d9-2458-4450-8018-2815b8613be0');


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) VALUES ('0663ed07-1d4c-4087-86c2-76b21dd53652', NULL, 'password', 'd35222cf-e57b-47ac-8a82-83420e3d6bad', 1644584365867, NULL, '{"value":"EOQNxdb5dsd4Q7ivl/aqBROMj0gSGAyPB105iHRbYXc=","salt":"oNtYlVozgkO1mhakhw6rhg==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) VALUES ('ca29f20d-faeb-467d-847c-49c1e6f161b5', NULL, 'password', 'c79ab150-a572-43f9-a730-60395e8dd914', 1683382518357, 'My password', '{"value":"rrpQ3DS7ZD4UTPCJppawnTDCqa+p5VKZkuMSAUjVP5A=","salt":"qb4/OTugffUnPVWf8LA4EA==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) VALUES ('d27feb4d-752f-4905-a65b-0cb6e0021da2', NULL, 'password', 'df1fd6bf-3117-464e-881b-957fcecc0566', 1683382533755, 'My password', '{"value":"nv8WxGOH+qAQwokydjWbfPnkqkEDder+YLP9Zt0hMIo=","salt":"rOFhpQTAL3sm7pK14EvYew==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) VALUES ('ddbe4349-1cce-484e-b7b2-f031fb0c7c9e', NULL, 'password', '30b1db82-829d-4fbc-945d-b84d4f097aca', 1683382555364, 'My password', '{"value":"CBaAWsp6s8dONDd8evYPTwUGCNhCKQ6QVPP9JiqIXwo=","salt":"s/wwPmMYAlzUKpnKdBqJhQ==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2022-02-11 12:59:13.931982', 9, 'EXECUTED', '8:9c136bc3187083a98745c7d03bc8a303', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2022-02-11 12:59:15.001329', 22, 'MARK_RAN', '8:dee9246280915712591f83a127665107', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-02-11 12:59:17.635663', 46, 'EXECUTED', '8:70a2b4f1f4bd4dbf487114bdb1810e64', 'customChange', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('17.0.0-9562', 'keycloak', 'META-INF/jpa-changelog-17.0.0.xml', '2022-02-14 13:43:40.040649', 105, 'EXECUTED', '8:5e06b1d75f5d17685485e610c2851b17', 'createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY', '', NULL, '4.6.2', NULL, NULL, '4846219708');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2022-02-11 12:59:12.952304', 1, 'EXECUTED', '8:bda77d94bf90182a1e30c24f1c155ec7', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2022-02-11 12:59:12.982781', 2, 'MARK_RAN', '8:1ecb330f30986693d1cba9ab579fa219', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2022-02-11 12:59:13.135294', 3, 'EXECUTED', '8:cb7ace19bc6d959f305605d255d4c843', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2022-02-11 12:59:13.139976', 4, 'EXECUTED', '8:80230013e961310e6872e871be424a63', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2022-02-11 12:59:13.596039', 5, 'EXECUTED', '8:67f4c20929126adc0c8e9bf48279d244', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2022-02-11 12:59:13.603328', 6, 'MARK_RAN', '8:7311018b0b8179ce14628ab412bb6783', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2022-02-11 12:59:13.919138', 7, 'EXECUTED', '8:037ba1216c3640f8785ee6b8e7c8e3c1', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2022-02-11 12:59:13.92477', 8, 'MARK_RAN', '8:7fe6ffe4af4df289b3157de32c624263', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2022-02-11 12:59:14.316329', 10, 'EXECUTED', '8:b5f09474dca81fb56a97cf5b6553d331', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2022-02-11 12:59:14.50867', 11, 'EXECUTED', '8:ca924f31bd2a3b219fdcfe78c82dacf4', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2022-02-11 12:59:14.512614', 12, 'MARK_RAN', '8:8acad7483e106416bcfa6f3b824a16cd', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2022-02-11 12:59:14.542906', 13, 'EXECUTED', '8:9b1266d17f4f87c78226f5055408fd5e', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2022-02-11 12:59:14.620658', 14, 'EXECUTED', '8:d80ec4ab6dbfe573550ff72396c7e910', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2022-02-11 12:59:14.623621', 15, 'MARK_RAN', '8:d86eb172171e7c20b9c849b584d147b2', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2022-02-11 12:59:14.626255', 16, 'MARK_RAN', '8:5735f46f0fa60689deb0ecdc2a0dea22', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2022-02-11 12:59:14.628961', 17, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2022-02-11 12:59:14.80447', 18, 'EXECUTED', '8:5c1a8fd2014ac7fc43b90a700f117b23', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2022-02-11 12:59:17.617381', 44, 'EXECUTED', '8:84b986e628fe8f7fd8fd3c275c5259f2', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2022-02-11 12:59:14.973393', 19, 'EXECUTED', '8:1f6c2c2dfc362aff4ed75b3f0ef6b331', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2022-02-11 12:59:14.981976', 20, 'EXECUTED', '8:dee9246280915712591f83a127665107', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2022-02-11 12:59:14.984501', 21, 'MARK_RAN', '8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2022-02-11 12:59:15.089775', 23, 'EXECUTED', '8:d9fa18ffa355320395b86270680dd4fe', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2022-02-11 12:59:15.095219', 24, 'EXECUTED', '8:90cff506fedb06141ffc1c71c4a1214c', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2022-02-11 12:59:15.097602', 25, 'MARK_RAN', '8:11a788aed4961d6d29c427c063af828c', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2022-02-11 12:59:15.40086', 26, 'EXECUTED', '8:a4218e51e1faf380518cce2af5d39b43', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2022-02-11 12:59:15.752035', 27, 'EXECUTED', '8:d9e9a1bfaa644da9952456050f07bbdc', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2022-02-11 12:59:15.764324', 28, 'EXECUTED', '8:d1bf991a6163c0acbfe664b615314505', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2022-02-11 12:59:16.058167', 29, 'EXECUTED', '8:88a743a1e87ec5e30bf603da68058a8c', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2022-02-11 12:59:16.11722', 30, 'EXECUTED', '8:c5517863c875d325dea463d00ec26d7a', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2022-02-11 12:59:16.163358', 31, 'EXECUTED', '8:ada8b4833b74a498f376d7136bc7d327', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2022-02-11 12:59:16.17067', 32, 'EXECUTED', '8:b9b73c8ea7299457f99fcbb825c263ba', 'customChange', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2022-02-11 12:59:16.175886', 33, 'EXECUTED', '8:07724333e625ccfcfc5adc63d57314f3', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2022-02-11 12:59:16.178182', 34, 'MARK_RAN', '8:8b6fd445958882efe55deb26fc541a7b', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2022-02-11 12:59:16.261769', 35, 'EXECUTED', '8:29b29cfebfd12600897680147277a9d7', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2022-02-11 12:59:16.270537', 36, 'EXECUTED', '8:73ad77ca8fd0410c7f9f15a471fa52bc', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2022-02-11 12:59:16.284369', 37, 'EXECUTED', '8:64f27a6fdcad57f6f9153210f2ec1bdb', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2022-02-11 12:59:16.288598', 38, 'EXECUTED', '8:27180251182e6c31846c2ddab4bc5781', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2022-02-11 12:59:16.292442', 39, 'EXECUTED', '8:d56f201bfcfa7a1413eb3e9bc02978f9', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2022-02-11 12:59:16.294444', 40, 'MARK_RAN', '8:91f5522bf6afdc2077dfab57fbd3455c', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2022-02-11 12:59:16.296473', 41, 'MARK_RAN', '8:0f01b554f256c22caeb7d8aee3a1cdc8', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2022-02-11 12:59:16.30326', 42, 'EXECUTED', '8:ab91cf9cee415867ade0e2df9651a947', 'customChange', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2022-02-11 12:59:17.610043', 43, 'EXECUTED', '8:ceac9b1889e97d602caf373eadb0d4b7', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-02-11 12:59:17.624195', 45, 'EXECUTED', '8:a164ae073c56ffdbc98a615493609a52', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-02-11 12:59:17.638422', 47, 'MARK_RAN', '8:7be68b71d2f5b94b8df2e824f2860fa2', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-02-11 12:59:17.855453', 48, 'EXECUTED', '8:bab7c631093c3861d6cf6144cd944982', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-02-11 12:59:17.861433', 49, 'EXECUTED', '8:fa809ac11877d74d76fe40869916daad', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2022-02-11 12:59:18.036217', 50, 'EXECUTED', '8:fac23540a40208f5f5e326f6ceb4d291', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2022-02-11 12:59:18.326963', 51, 'EXECUTED', '8:2612d1b8a97e2b5588c346e817307593', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2022-02-11 12:59:18.332551', 52, 'EXECUTED', '8:9842f155c5db2206c88bcb5d1046e941', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2022-02-11 12:59:18.337758', 53, 'EXECUTED', '8:2e12e06e45498406db72d5b3da5bbc76', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2022-02-11 12:59:18.342894', 54, 'EXECUTED', '8:33560e7c7989250c40da3abdabdc75a4', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2022-02-11 12:59:18.365145', 55, 'EXECUTED', '8:87a8d8542046817a9107c7eb9cbad1cd', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2022-02-11 12:59:18.39415', 56, 'EXECUTED', '8:3ea08490a70215ed0088c273d776311e', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2022-02-11 12:59:18.506312', 57, 'EXECUTED', '8:2d56697c8723d4592ab608ce14b6ed68', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2022-02-11 12:59:19.022358', 58, 'EXECUTED', '8:3e423e249f6068ea2bbe48bf907f9d86', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2022-02-11 12:59:19.128199', 59, 'EXECUTED', '8:15cabee5e5df0ff099510a0fc03e4103', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2022-02-11 12:59:19.14662', 60, 'EXECUTED', '8:4b80200af916ac54d2ffbfc47918ab0e', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2022-02-11 12:59:19.164583', 61, 'EXECUTED', '8:66564cd5e168045d52252c5027485bbb', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2022-02-11 12:59:19.177978', 62, 'EXECUTED', '8:1c7064fafb030222be2bd16ccf690f6f', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2022-02-11 12:59:19.182679', 63, 'EXECUTED', '8:2de18a0dce10cdda5c7e65c9b719b6e5', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2022-02-11 12:59:19.191088', 64, 'EXECUTED', '8:03e413dd182dcbd5c57e41c34d0ef682', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2022-02-11 12:59:19.195795', 65, 'EXECUTED', '8:d27b42bb2571c18fbe3fe4e4fb7582a7', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2022-02-11 12:59:19.259111', 66, 'EXECUTED', '8:698baf84d9fd0027e9192717c2154fb8', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2022-02-11 12:59:19.288677', 67, 'EXECUTED', '8:ced8822edf0f75ef26eb51582f9a821a', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2022-02-11 12:59:19.294893', 68, 'EXECUTED', '8:f0abba004cf429e8afc43056df06487d', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2022-02-11 12:59:19.331841', 69, 'EXECUTED', '8:6662f8b0b611caa359fcf13bf63b4e24', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2022-02-11 12:59:19.34592', 70, 'EXECUTED', '8:9e6b8009560f684250bdbdf97670d39e', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2022-02-11 12:59:19.354001', 71, 'EXECUTED', '8:4223f561f3b8dc655846562b57bb502e', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-02-11 12:59:19.363548', 72, 'EXECUTED', '8:215a31c398b363ce383a2b301202f29e', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-updating-credential-data-not-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-02-11 12:59:19.378748', 73, 'EXECUTED', '8:83f7a671792ca98b3cbd3a1a34862d3d', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-updating-credential-data-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-02-11 12:59:19.380826', 74, 'MARK_RAN', '8:f58ad148698cf30707a6efbdf8061aa7', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-02-11 12:59:19.448049', 75, 'EXECUTED', '8:79e4fd6c6442980e58d52ffc3ee7b19c', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-02-11 12:59:19.481972', 76, 'EXECUTED', '8:87af6a1e6d241ca4b15801d1f86a297d', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2022-02-11 12:59:19.486662', 77, 'EXECUTED', '8:b44f8d9b7b6ea455305a6d72a200ed15', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2022-02-11 12:59:19.489197', 78, 'MARK_RAN', '8:2d8ed5aaaeffd0cb004c046b4a903ac5', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2022-02-11 12:59:19.537079', 79, 'EXECUTED', '8:e290c01fcbc275326c511633f6e2acde', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2022-02-11 12:59:19.539591', 80, 'MARK_RAN', '8:c9db8784c33cea210872ac2d805439f8', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2022-02-11 12:59:19.567775', 81, 'EXECUTED', '8:95b676ce8fc546a1fcfb4c92fae4add5', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2022-02-11 12:59:19.570007', 82, 'MARK_RAN', '8:38a6b2a41f5651018b1aca93a41401e5', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2022-02-11 12:59:19.582292', 83, 'EXECUTED', '8:3fb99bcad86a0229783123ac52f7609c', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2022-02-11 12:59:19.58482', 84, 'MARK_RAN', '8:64f27a6fdcad57f6f9153210f2ec1bdb', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2022-02-11 12:59:19.614586', 85, 'EXECUTED', '8:ab4f863f39adafd4c862f7ec01890abc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2022-02-11 12:59:19.622143', 86, 'EXECUTED', '8:13c419a0eb336e91ee3a3bf8fda6e2a7', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2022-02-11 12:59:19.63159', 87, 'EXECUTED', '8:e3fb1e698e0471487f51af1ed80fe3ac', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2022-02-11 12:59:19.671015', 88, 'EXECUTED', '8:babadb686aab7b56562817e60bf0abd0', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('default-roles', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-02-11 12:59:19.680016', 89, 'EXECUTED', '8:72d03345fda8e2f17093d08801947773', 'addColumn tableName=REALM; customChange', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('default-roles-cleanup', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-02-11 12:59:19.729503', 90, 'EXECUTED', '8:61c9233951bd96ffecd9ba75f7d978a4', 'dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('13.0.0-KEYCLOAK-16844', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-02-11 12:59:19.762243', 91, 'EXECUTED', '8:ea82e6ad945cec250af6372767b25525', 'createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('map-remove-ri-13.0.0', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-02-11 12:59:19.770638', 92, 'EXECUTED', '8:d3f4a33f41d960ddacd7e2ef30d126b3', 'dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('13.0.0-KEYCLOAK-17992-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-02-11 12:59:19.773079', 93, 'MARK_RAN', '8:1284a27fbd049d65831cb6fc07c8a783', 'dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('13.0.0-increase-column-size-federated', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-02-11 12:59:19.799163', 94, 'EXECUTED', '8:9d11b619db2ae27c25853b8a37cd0dea', 'modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('13.0.0-KEYCLOAK-17992-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-02-11 12:59:19.802825', 95, 'MARK_RAN', '8:3002bb3997451bb9e8bac5c5cd8d6327', 'addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('json-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-02-11 12:59:19.812876', 96, 'EXECUTED', '8:dfbee0d6237a23ef4ccbb7a4e063c163', 'addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('14.0.0-KEYCLOAK-11019', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-02-11 12:59:19.895565', 97, 'EXECUTED', '8:75f3e372df18d38c62734eebb986b960', 'createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('14.0.0-KEYCLOAK-18286', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-02-11 12:59:19.898085', 98, 'MARK_RAN', '8:7fee73eddf84a6035691512c85637eef', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('14.0.0-KEYCLOAK-18286-revert', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-02-11 12:59:19.935511', 99, 'MARK_RAN', '8:7a11134ab12820f999fbf3bb13c3adc8', 'dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('14.0.0-KEYCLOAK-18286-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-02-11 12:59:19.970167', 100, 'EXECUTED', '8:c0f6eaac1f3be773ffe54cb5b8482b70', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('14.0.0-KEYCLOAK-18286-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-02-11 12:59:19.972333', 101, 'MARK_RAN', '8:18186f0008b86e0f0f49b0c4d0e842ac', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('KEYCLOAK-17267-add-index-to-user-attributes', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-02-11 12:59:20.000503', 102, 'EXECUTED', '8:09c2780bcb23b310a7019d217dc7b433', 'createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('KEYCLOAK-18146-add-saml-art-binding-identifier', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-02-11 12:59:20.006591', 103, 'EXECUTED', '8:276a44955eab693c970a42880197fff2', 'customChange', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('15.0.0-KEYCLOAK-18467', 'keycloak', 'META-INF/jpa-changelog-15.0.0.xml', '2022-02-11 12:59:20.019443', 104, 'EXECUTED', '8:ba8ee3b694d043f2bfc1a1079d0760d7', 'addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...', '', NULL, '3.5.4', NULL, NULL, '4584351857');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('18.0.0-10625-IDX_ADMIN_EVENT_TIME', 'keycloak', 'META-INF/jpa-changelog-18.0.0.xml', '2022-06-21 21:27:46.396975', 106, 'EXECUTED', '8:4b80546c1dc550ac552ee7b24a4ab7c0', 'createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY', '', NULL, '4.8.0', NULL, NULL, '5846866319');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('19.0.0-10135', 'keycloak', 'META-INF/jpa-changelog-19.0.0.xml', '2023-05-02 20:03:48.546463', 107, 'EXECUTED', '8:af510cd1bb2ab6339c45372f3e491696', 'customChange', '', NULL, '4.16.1', NULL, NULL, '3057828356');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('20.0.0-12964-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2023-05-02 20:03:48.561464', 108, 'EXECUTED', '8:05c99fc610845ef66ee812b7921af0ef', 'createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE', '', NULL, '4.16.1', NULL, NULL, '3057828356');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('20.0.0-12964-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2023-05-02 20:03:48.566118', 109, 'MARK_RAN', '8:314e803baf2f1ec315b3464e398b8247', 'createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE', '', NULL, '4.16.1', NULL, NULL, '3057828356');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('client-attributes-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2023-05-02 20:03:48.583306', 110, 'EXECUTED', '8:56e4677e7e12556f70b604c573840100', 'addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.16.1', NULL, NULL, '3057828356');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('21.0.2-17277', 'keycloak', 'META-INF/jpa-changelog-21.0.2.xml', '2023-05-02 20:03:48.597515', 111, 'EXECUTED', '8:8806cb33d2a546ce770384bf98cf6eac', 'customChange', '', NULL, '4.16.1', NULL, NULL, '3057828356');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('21.1.0-19404', 'keycloak', 'META-INF/jpa-changelog-21.1.0.xml', '2023-05-02 20:03:48.645054', 112, 'EXECUTED', '8:fdb2924649d30555ab3a1744faba4928', 'modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER', '', NULL, '4.16.1', NULL, NULL, '3057828356');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('21.1.0-19404-2', 'keycloak', 'META-INF/jpa-changelog-21.1.0.xml', '2023-05-02 20:03:48.649526', 113, 'MARK_RAN', '8:1c96cc2b10903bd07a03670098d67fd6', 'addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...', '', NULL, '4.16.1', NULL, NULL, '3057828356');


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby) VALUES (1, false, NULL, NULL);
INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby) VALUES (1000, false, NULL, NULL);
INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby) VALUES (1001, false, NULL, NULL);


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '9d8da12b-cab2-410d-9bf0-95c4f4b14daf', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '741bf401-5cb1-4231-b9b8-054b1fb29739', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', 'd82d724d-fe1d-4087-914d-81e0e902a609', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '4073ebe7-0135-4c60-b9a6-a65f93b4f22d', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', 'eb01fa23-cbd7-4576-a9e9-f5075954b9e6', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '70020d10-e937-43b2-ac3b-c7339593c20b', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '0b147536-c77e-4c19-825d-c104d9dbb41a', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', 'bd6eec3b-c69e-4f6f-9ff8-13c00889279c', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '292586f1-dfde-4c6e-a7c0-99f8dcb9e8fa', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', 'c33f5ab1-b994-4ce6-b729-55b62c8a4f95', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', 'f94413e6-e0d9-40e6-9dea-b4886c08808f', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', '150585f5-f538-4051-9e83-2e9a90722b39', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', 'baba4d5b-c3c9-481b-90f3-290650239f84', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', 'd73ecebe-cf0c-4e0c-8070-d3eb86d74f5f', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', 'db8ffb74-3e85-496c-9862-30d194f10d3c', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', '5270b21c-a00a-43d2-a96a-45dd63fb31ea', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', 'c255bdb5-88c0-45eb-b281-f93d7f5f1893', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', '20cc23a8-2380-4cea-a850-0cd648f75edc', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', '8f13b935-86e1-433b-ad55-465c18396ef4', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', 'd93dd56b-989b-4f4b-bc8f-a134e429a728', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', 'ee17eb07-b7f3-4093-8ac8-286290c3bf90', true);


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) VALUES ('45ee8852-ff35-49fd-b929-345162320e7f', 'security-admin-console', '{"redirect_uri":"http://localhost:28084/admin/master/console/"}', 'invalid_redirect_uri', '192.168.80.1', 'master', NULL, 1683057842421, 'LOGIN_ERROR', NULL);
INSERT INTO public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) VALUES ('092d75c3-d2c3-42f2-95ef-96003652616a', 'security-admin-console', '{"redirect_uri":"http://localhost:28084/admin/master/console/"}', 'invalid_redirect_uri', '172.22.0.1', 'master', NULL, 1683141250823, 'LOGIN_ERROR', NULL);
INSERT INTO public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) VALUES ('d13f0adf-42d9-4659-8069-ac0fa87c2dff', 'security-admin-console', '{"redirect_uri":"http://localhost:28084/admin/master/console/"}', 'invalid_redirect_uri', '172.22.0.1', 'master', NULL, 1683312546190, 'LOGIN_ERROR', NULL);
INSERT INTO public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) VALUES ('e2ce04f1-9a92-40d2-9897-7ece7202148a', 'security-admin-console', '{"redirect_uri":"http://localhost:28084/admin/master/console/"}', 'invalid_redirect_uri', '172.22.0.1', 'master', NULL, 1683312547758, 'LOGIN_ERROR', NULL);
INSERT INTO public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) VALUES ('5f3c791e-cd5e-438a-8351-a60addf0cc42', 'blogq-backend', '{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}', 'not_allowed', '172.22.0.1', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL, 1683313979709, 'LOGIN_ERROR', NULL);
INSERT INTO public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) VALUES ('74165907-03ac-4fad-a57d-ff6c7893a020', 'blogq-backend', '{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}', 'not_allowed', '172.22.0.1', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL, 1683315272033, 'LOGIN_ERROR', NULL);
INSERT INTO public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) VALUES ('9d37f372-de28-41b1-bbdf-ce294da5da11', 'abc', 'null', 'client_not_found', '172.22.0.1', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL, 1683324212854, 'LOGIN_ERROR', NULL);
INSERT INTO public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) VALUES ('e71c4ad6-fd19-433e-8868-7c530ccf434f', 'abc', 'null', 'client_not_found', '172.22.0.1', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL, 1683324212954, 'LOGIN_ERROR', NULL);
INSERT INTO public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) VALUES ('ebda608c-aacb-4264-b24a-a0a66614ea6f', 'abc', 'null', 'client_not_found', '172.22.0.1', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL, 1683324396034, 'LOGIN_ERROR', NULL);
INSERT INTO public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) VALUES ('c633b728-f356-404c-97ed-3fbc165fbe5f', 'abc', 'null', 'client_not_found', '172.22.0.1', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL, 1683324469861, 'LOGIN_ERROR', NULL);
INSERT INTO public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) VALUES ('e07f4030-0e60-4f1f-87bf-c7e93d215e95', 'blogq-web-ui-editor', '{"redirect_uri":"http://localhost:5173/#state=9b03c116-911d-488c-b389-90182dc385a7&session_state=af26d2c1-f34e-453b-be97-0c9ae4757ce2&code=4d84a27c-64fc-4a87-b031-a7fb76f2e0ec.af26d2c1-f34e-453b-be97-0c9ae4757ce2.d6f1071d-2a86-46bd-86a0-347dd8b715a8"}', 'invalid_redirect_uri', '172.22.0.1', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL, 1683324507934, 'LOGIN_ERROR', NULL);


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('87669ed2-eb82-4a04-9a19-abeb21440284', '2f8cff9b-9313-4012-a108-39c528449cae');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('dcbd94c1-8b5e-44bf-9cdf-39de1a46baae', 'c7f5f435-5014-4ba2-b04a-fba5e5a23623');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('80e3747b-66ef-4fbe-9221-206066e53139', 'c5f1d39f-8d7d-4e97-8ddb-2440f7fffd02');


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.keycloak_group (id, name, parent_group, realm_id) VALUES ('2f8cff9b-9313-4012-a108-39c528449cae', 'Blog-Authors', ' ', '2b937222-9615-437f-bf8d-0e73191e2c82');
INSERT INTO public.keycloak_group (id, name, parent_group, realm_id) VALUES ('c5f1d39f-8d7d-4e97-8ddb-2440f7fffd02', 'Blog-Publishers', ' ', '2b937222-9615-437f-bf8d-0e73191e2c82');
INSERT INTO public.keycloak_group (id, name, parent_group, realm_id) VALUES ('c7f5f435-5014-4ba2-b04a-fba5e5a23623', 'Blog-Admins', ' ', '2b937222-9615-437f-bf8d-0e73191e2c82');


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('fc8bf92c-0900-443e-8117-2a705f00b519', 'master', false, '${role_default-roles}', 'default-roles-master', 'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('b326edbd-8646-4c47-bffa-dff23ef4af95', 'master', false, '${role_create-realm}', 'create-realm', 'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a203789d-ad3c-46db-95d5-777b423a802c', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_create-client}', 'create-client', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ace317fc-a4fd-46e3-b959-a98a35dca444', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_view-realm}', 'view-realm', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('26220223-8cbc-48bb-99e2-207ead7cdee8', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_view-users}', 'view-users', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('2c12c666-d499-4113-93b4-23a31aa0f1ae', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_view-clients}', 'view-clients', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('e0bf838a-346a-4739-9238-e40e250c2da7', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_view-events}', 'view-events', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('411b06c8-f580-4ca2-ab4b-499da8d8086b', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('dac0334a-3d28-491f-9fb4-945aa1ac925c', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_view-authorization}', 'view-authorization', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('d97cdfaa-d95c-4bfb-916c-1e72cf6340e1', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_manage-realm}', 'manage-realm', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('540e9fde-9911-487b-a4dc-38cde7a616ae', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_manage-users}', 'manage-users', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ff55e544-ae29-4bb6-a7b9-27871f8fa83e', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_manage-clients}', 'manage-clients', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('e4cf76ca-2d65-4a62-b05f-bb32f6244e1a', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_manage-events}', 'manage-events', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('b7adc794-337d-42fb-a6ed-3f1eb0487df3', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('67f3700a-75df-455f-b7ae-79bd200a1eeb', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_manage-authorization}', 'manage-authorization', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('f3d59639-c9d6-401d-9843-d5dcc46b0b5f', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_query-users}', 'query-users', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('aaee1233-44bf-4521-a3ea-c4e8a21fa2ce', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_query-clients}', 'query-clients', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('86b5dd7a-1603-47c8-8fa1-85094e78e12a', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_query-realms}', 'query-realms', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('46991a10-167e-4e05-88cc-0ed4c3f302be', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_query-groups}', 'query-groups', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('370d85ba-8749-41aa-abf0-4bec75578608', '71f2376d-ff99-44db-ba8d-4c485915b2ab', true, '${role_view-profile}', 'view-profile', 'master', '71f2376d-ff99-44db-ba8d-4c485915b2ab', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('fe94932f-932c-46c4-8449-3361a217ac4e', '71f2376d-ff99-44db-ba8d-4c485915b2ab', true, '${role_manage-account}', 'manage-account', 'master', '71f2376d-ff99-44db-ba8d-4c485915b2ab', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('8d54f1e8-b102-495b-b675-767e8b83c137', '71f2376d-ff99-44db-ba8d-4c485915b2ab', true, '${role_manage-account-links}', 'manage-account-links', 'master', '71f2376d-ff99-44db-ba8d-4c485915b2ab', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7da6c83a-f365-42fb-9356-3f02dc84025e', '71f2376d-ff99-44db-ba8d-4c485915b2ab', true, '${role_view-applications}', 'view-applications', 'master', '71f2376d-ff99-44db-ba8d-4c485915b2ab', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ffffc86a-670a-4755-b66f-096482806f30', '71f2376d-ff99-44db-ba8d-4c485915b2ab', true, '${role_view-consent}', 'view-consent', 'master', '71f2376d-ff99-44db-ba8d-4c485915b2ab', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('4f5099ea-6bb4-43e6-91b2-84bc1dc90480', '71f2376d-ff99-44db-ba8d-4c485915b2ab', true, '${role_manage-consent}', 'manage-consent', 'master', '71f2376d-ff99-44db-ba8d-4c485915b2ab', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('1c515a50-aa38-49e8-8c83-d373d087e80b', '71f2376d-ff99-44db-ba8d-4c485915b2ab', true, '${role_delete-account}', 'delete-account', 'master', '71f2376d-ff99-44db-ba8d-4c485915b2ab', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7c3aca35-ac8c-4ff2-8237-6feac3434c7a', '3b469c75-5126-4367-af6e-c3840c619260', true, '${role_read-token}', 'read-token', 'master', '3b469c75-5126-4367-af6e-c3840c619260', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('358d73a4-be3d-4bc5-abc0-218b8da80d15', '896bc591-348d-45c4-8a2f-b2593c7b2155', true, '${role_impersonation}', 'impersonation', 'master', '896bc591-348d-45c4-8a2f-b2593c7b2155', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('01fa7869-599e-4b5d-b377-fa0de2d1569d', 'master', false, '${role_offline-access}', 'offline_access', 'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('cde32061-02a8-4fe2-a035-e8cf0bd0b403', 'master', false, '${role_uma_authorization}', 'uma_authorization', 'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('3a90c589-fa25-4818-ab4f-8b6130c228d5', 'a2365734-8e69-494b-abf4-c445e57d9eea', true, NULL, 'uma_protection', '2b937222-9615-437f-bf8d-0e73191e2c82', 'a2365734-8e69-494b-abf4-c445e57d9eea', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('c3f065aa-6173-4d49-8995-d2b302707207', 'a2365734-8e69-494b-abf4-c445e57d9eea', true, '', 'posts:publish', '2b937222-9615-437f-bf8d-0e73191e2c82', 'a2365734-8e69-494b-abf4-c445e57d9eea', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'master', false, '${role_admin}', 'admin', 'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('8567f7f8-6587-4792-99b2-db141ca899b3', 'a2365734-8e69-494b-abf4-c445e57d9eea', true, '', 'posts:write', '2b937222-9615-437f-bf8d-0e73191e2c82', 'a2365734-8e69-494b-abf4-c445e57d9eea', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('8b10b8bd-fc65-4bd8-a9e9-0a4642b112cc', 'a2365734-8e69-494b-abf4-c445e57d9eea', true, '', 'posts:read', '2b937222-9615-437f-bf8d-0e73191e2c82', 'a2365734-8e69-494b-abf4-c445e57d9eea', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a99a7a4b-662d-4bb9-a659-08608b66f34d', 'a2365734-8e69-494b-abf4-c445e57d9eea', true, '', 'posts:delete', '2b937222-9615-437f-bf8d-0e73191e2c82', 'a2365734-8e69-494b-abf4-c445e57d9eea', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('dcbd94c1-8b5e-44bf-9cdf-39de1a46baae', 'a2365734-8e69-494b-abf4-c445e57d9eea', true, '', 'blog-admin', '2b937222-9615-437f-bf8d-0e73191e2c82', 'a2365734-8e69-494b-abf4-c445e57d9eea', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('87669ed2-eb82-4a04-9a19-abeb21440284', 'a2365734-8e69-494b-abf4-c445e57d9eea', true, '', 'blog-author', '2b937222-9615-437f-bf8d-0e73191e2c82', 'a2365734-8e69-494b-abf4-c445e57d9eea', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('80e3747b-66ef-4fbe-9221-206066e53139', 'a2365734-8e69-494b-abf4-c445e57d9eea', true, '', 'blog-publisher', '2b937222-9615-437f-bf8d-0e73191e2c82', 'a2365734-8e69-494b-abf4-c445e57d9eea', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('cddf9797-0e0f-4152-9690-ff4298aa24de', '71f2376d-ff99-44db-ba8d-4c485915b2ab', true, '${role_view-groups}', 'view-groups', 'master', '71f2376d-ff99-44db-ba8d-4c485915b2ab', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a372ce39-1528-47d0-9eea-7daf18839b26', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_create-client}', 'create-client', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('f10f83c6-7bf9-42d3-8fee-56d518e941d9', '2b937222-9615-437f-bf8d-0e73191e2c82', false, '${role_default-roles}', 'default-roles-blogq', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('4a5fcb74-935f-4941-a407-63e6ed83597c', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_create-client}', 'create-client', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('fdc418be-dafe-4b1e-b664-7e60d10d145c', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_view-realm}', 'view-realm', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('62c2cd5d-9f3d-4719-845a-f055c9b62046', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_view-users}', 'view-users', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('70d83f5d-20bf-455b-a121-7aaaad7724d1', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_view-clients}', 'view-clients', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('6d3c07c3-ba23-4822-abec-61bd4ef0ab73', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_view-events}', 'view-events', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('0d1a5743-4d41-4457-9484-9649acde5b6b', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('3f075890-9489-4e26-a184-59d504d0889d', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_view-authorization}', 'view-authorization', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('9e29f4a9-e184-4946-b627-1099db221548', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_manage-realm}', 'manage-realm', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('6b67a461-e6ac-4b7e-81cd-82e1ef1a816f', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_manage-users}', 'manage-users', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('4eb73e82-082b-461b-a191-00a867125624', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_manage-clients}', 'manage-clients', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('cb869c05-a656-4964-824f-4733c6583579', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_manage-events}', 'manage-events', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('22eb7536-4a15-4049-8c66-7e7c3e3fac10', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ec71af46-8006-4eea-b32e-00429cfd10b4', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_manage-authorization}', 'manage-authorization', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('b356f48c-da06-47b6-a584-48695ce433f4', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_query-users}', 'query-users', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a89ef883-6315-4528-b823-b08e4ba16e6d', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_query-clients}', 'query-clients', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('4fe6230c-c5af-4d9d-b648-3f21e3e12221', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_query-realms}', 'query-realms', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('87c818d0-78be-4f35-9c54-09b1c019f4ad', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_query-groups}', 'query-groups', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('692038ec-4f8c-4bca-9635-116d4e8ef5fc', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_realm-admin}', 'realm-admin', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('6cf87d04-4636-4c3c-916b-f16d102e0f7d', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_view-realm}', 'view-realm', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('2ea6363a-2627-4d8c-98e5-d29da4ce20d0', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_view-users}', 'view-users', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7403fe9e-c0a3-4941-8386-3bec35f7ddf6', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_view-clients}', 'view-clients', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('c9df89c0-5848-459c-abff-3c2d97ba726a', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_view-events}', 'view-events', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ca67bb11-da5e-4fbd-be25-f66895d95e59', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_view-identity-providers}', 'view-identity-providers', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('907be75a-154f-40b0-981d-1fb5472e314e', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_view-authorization}', 'view-authorization', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('48511b90-1175-4de0-9fef-04a7926f4492', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_manage-realm}', 'manage-realm', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('0eb12698-e768-4744-81c9-07adbd4adecd', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_manage-users}', 'manage-users', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('9ccb6237-576f-4914-9d6c-d84947126a46', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_manage-clients}', 'manage-clients', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('71caed99-5602-453b-8782-79f982360f77', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_manage-events}', 'manage-events', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('38d6c276-04ee-41cb-aefe-c95d57efba75', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_manage-identity-providers}', 'manage-identity-providers', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('5c27066b-d666-4b4c-ba7a-73889e8ecffd', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_manage-authorization}', 'manage-authorization', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('2943befc-e583-4be8-a444-0e01e83fbec9', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_query-users}', 'query-users', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ec6ae452-d28a-41e1-b736-1ea0b63e15cf', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_query-clients}', 'query-clients', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('3e07d7ab-56ec-414b-8ac7-d0f7f64e571c', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_query-realms}', 'query-realms', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('8632a893-cf0c-45ab-ac79-dfafe8ed9fb0', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_query-groups}', 'query-groups', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('cb216fa1-9c6e-4cb7-adcc-6119e2c150d9', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', true, '${role_view-profile}', 'view-profile', '2b937222-9615-437f-bf8d-0e73191e2c82', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ff7f35c8-7a44-4217-8135-120f98d2e91d', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', true, '${role_manage-account}', 'manage-account', '2b937222-9615-437f-bf8d-0e73191e2c82', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('8edc7ef1-2529-4686-8de4-b6f17c479c6f', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', true, '${role_manage-account-links}', 'manage-account-links', '2b937222-9615-437f-bf8d-0e73191e2c82', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('709f280f-441a-4dc5-af62-f57256def30d', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', true, '${role_view-applications}', 'view-applications', '2b937222-9615-437f-bf8d-0e73191e2c82', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a760930f-3f97-48f2-81bf-dfb33eb57c49', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', true, '${role_view-consent}', 'view-consent', '2b937222-9615-437f-bf8d-0e73191e2c82', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('17b86164-cd97-4982-b0da-256601422ce1', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', true, '${role_manage-consent}', 'manage-consent', '2b937222-9615-437f-bf8d-0e73191e2c82', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('9f60b1c0-7aea-4052-8421-4516cab6ca9d', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', true, '${role_view-groups}', 'view-groups', '2b937222-9615-437f-bf8d-0e73191e2c82', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('5a3029f6-b592-42d2-b17c-7627832b3591', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', true, '${role_delete-account}', 'delete-account', '2b937222-9615-437f-bf8d-0e73191e2c82', 'bf39530a-b2a6-4e37-8b3d-56614fdde86d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('1d54179d-fe58-4786-955e-4fc9b47b427a', 'fed33eec-3955-4cb5-a210-5d087f86bad2', true, '${role_impersonation}', 'impersonation', 'master', 'fed33eec-3955-4cb5-a210-5d087f86bad2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7cdbffa1-3522-47be-8073-e4ac993b1419', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', true, '${role_impersonation}', 'impersonation', '2b937222-9615-437f-bf8d-0e73191e2c82', 'd5b4a3ff-a868-471e-9eed-24145f758b5d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('efa60880-e89a-495d-b3b8-9a49a9c38164', '0ee223a4-733b-4513-9650-25dd62a70b0e', true, '${role_read-token}', 'read-token', '2b937222-9615-437f-bf8d-0e73191e2c82', '0ee223a4-733b-4513-9650-25dd62a70b0e', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('f19c5777-099d-4c6e-9f3f-350119bb6f3b', '2b937222-9615-437f-bf8d-0e73191e2c82', false, '${role_offline-access}', 'offline_access', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('256552d9-2458-4450-8018-2815b8613be0', '2b937222-9615-437f-bf8d-0e73191e2c82', false, '${role_uma_authorization}', 'uma_authorization', '2b937222-9615-437f-bf8d-0e73191e2c82', NULL, NULL);


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.migration_model (id, version, update_time) VALUES ('2dn4p', '16.1.1', 1644584363);
INSERT INTO public.migration_model (id, version, update_time) VALUES ('s68f3', '17.0.0', 1644846220);
INSERT INTO public.migration_model (id, version, update_time) VALUES ('5hdmy', '18.0.1', 1655846867);
INSERT INTO public.migration_model (id, version, update_time) VALUES ('4ysar', '18.0.2', 1656619270);
INSERT INTO public.migration_model (id, version, update_time) VALUES ('522l4', '21.1.1', 1683057830);


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('ab49fa9f-b97f-4126-891d-287f08f5a45d', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', 'e0204d41-458b-46d9-be73-783880589f08', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('97faf414-37f7-4b16-8f1e-b52bcb82949c', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '200a4c48-e013-4cab-93c3-5e4e0e0c2885', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('edb8c935-3ccf-4426-9990-d934e0e283b7', 'role list', 'saml', 'saml-role-list-mapper', NULL, '741bf401-5cb1-4231-b9b8-054b1fb29739');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('b3183259-743b-4660-80ca-8f24e17e9bfb', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('8981a8b8-2d14-484e-a3ab-a51197b48581', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('e930962e-3d1f-4e6d-867a-35f3950524f4', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('bc5146a1-fe44-47cf-b282-ca938969a248', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('3b02d512-be1b-49f0-a0c1-e4572b2eb2d4', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('569eee8a-1d43-4154-a305-e0c3b71e54c9', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('2b96558c-1911-4ed9-8325-4903a51b5388', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('2dffa976-38bb-420a-abb3-57e4316581f3', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('752d1d1c-7a7f-42fb-8d12-cf5e4171e52c', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('db9bfd9c-86bf-4e5c-8378-7b9453b022e3', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('88fce930-9d2e-4bde-824b-4566bfaca766', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('db373146-3b32-4ff8-b5da-a961aeedaeb0', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('6fef267a-e504-41f5-a141-00b7aad74a88', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('575760f5-c1af-4ba1-bdfe-a8a65675fb37', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd82d724d-fe1d-4087-914d-81e0e902a609');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('101d8554-9adf-48c6-8807-816381f4d80d', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '4073ebe7-0135-4c60-b9a6-a65f93b4f22d');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('c3204096-b07e-472a-82b8-c285ed101ffe', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '4073ebe7-0135-4c60-b9a6-a65f93b4f22d');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('7ead97a4-974f-4ca7-9fa6-fe7591504920', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'eb01fa23-cbd7-4576-a9e9-f5075954b9e6');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('c1aaff3c-0e75-41d0-b76a-72eb46f83cb7', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '70020d10-e937-43b2-ac3b-c7339593c20b');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('04850b1a-3b33-45ce-ad02-ab4e9937cbe2', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '70020d10-e937-43b2-ac3b-c7339593c20b');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('ff7cbbb1-1de9-4f39-866d-f2d845519e5a', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '0b147536-c77e-4c19-825d-c104d9dbb41a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('49271c26-7ac1-4d7a-8b42-5e3b237b6c7f', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '0b147536-c77e-4c19-825d-c104d9dbb41a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('b0d6b63b-ac4c-4534-a6c8-db852988120d', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '0b147536-c77e-4c19-825d-c104d9dbb41a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('91beb9b2-0791-497b-a180-3e87c3a1c755', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'bd6eec3b-c69e-4f6f-9ff8-13c00889279c');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('43c44aaa-786a-4d7a-9082-7cc2e43782af', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '292586f1-dfde-4c6e-a7c0-99f8dcb9e8fa');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('edc03790-21ed-4bb9-86ad-75224c214b68', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '292586f1-dfde-4c6e-a7c0-99f8dcb9e8fa');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('13c825c8-b6f9-4734-b9ab-7947a3622aac', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'a2365734-8e69-494b-abf4-c445e57d9eea', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('95eede90-eed0-4cfc-a2e1-9eb5ba4f5aa4', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'a2365734-8e69-494b-abf4-c445e57d9eea', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('93cbb977-6b4c-4e06-a218-571c458be697', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', 'a2365734-8e69-494b-abf4-c445e57d9eea', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('a3ba0784-c04d-4f30-9410-afed2aa17972', 'BlogQ Audience', 'openid-connect', 'oidc-audience-mapper', NULL, 'ee17eb07-b7f3-4093-8ac8-286290c3bf90');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('a5f6c7f5-7fa1-4f52-a942-92bb3fae1233', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'ee17eb07-b7f3-4093-8ac8-286290c3bf90');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('571b7b98-cccf-4c72-b653-93bc34fff247', 'client-roles-as-groups-blogq-backend', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'ee17eb07-b7f3-4093-8ac8-286290c3bf90');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('862c04bd-0b7d-4df1-9033-8f87f2c07c55', 'acr loa level', 'openid-connect', 'oidc-acr-mapper', NULL, 'c33f5ab1-b994-4ce6-b729-55b62c8a4f95');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('5aa58fe4-8ffe-4245-a8c7-fb2f3aa67972', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', 'dd874f72-6771-4f47-9984-4e6f6deb4348', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('ef4a821c-639e-417b-bced-33982dc733f4', 'role list', 'saml', 'saml-role-list-mapper', NULL, '150585f5-f538-4051-9e83-2e9a90722b39');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('297529c5-6681-401f-8241-d440fdd484b6', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('ca91929c-a423-4548-999c-5c80a21e7ca7', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('aa12307d-fd8c-418f-abb7-d98d1dc686a3', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('2e55ecbb-7cd1-44ec-b540-b8e4be0cd3dc', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('efa30b9f-1204-4319-a9b2-a1de4519c375', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('1811e1ed-0c14-4fe6-9c83-fef078ceea27', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('906597fa-1862-41c0-89a4-01e70c5ec2d7', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('e9779c67-5c23-4ebc-91f6-107f65fd1111', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('7e39ac5d-00a1-40e0-a626-788d992363cc', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('b44dccba-7811-4bd3-b35d-b4b55e7d273f', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('aa6ace08-058a-4cec-b3dc-3c3e6d1f096b', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('5b0169ab-3e4d-4953-bc51-5b274467920a', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('ebdc00fc-a215-4248-b0ac-ea46a71eabcd', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('4158ca39-5462-4bc6-a9df-6fe6d01f1241', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'baba4d5b-c3c9-481b-90f3-290650239f84');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('c2c79023-cd28-42b8-8cf4-ee893305e500', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'd73ecebe-cf0c-4e0c-8070-d3eb86d74f5f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('b2ebf0b7-12bf-4438-8216-0fe606acd952', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'd73ecebe-cf0c-4e0c-8070-d3eb86d74f5f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('33ca0aa6-f7de-4d24-b20c-691f1a58aa0c', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'db8ffb74-3e85-496c-9862-30d194f10d3c');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('0e140a3f-152a-4eb6-a074-387a7361b033', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5270b21c-a00a-43d2-a96a-45dd63fb31ea');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('310f7db1-84ab-4d3a-91db-d624d1e24c8b', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '5270b21c-a00a-43d2-a96a-45dd63fb31ea');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('1ff32255-cd9f-4ec0-8e7c-1aa3d366b56c', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'c255bdb5-88c0-45eb-b281-f93d7f5f1893');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('f78b656d-c90d-4d82-9423-65321378dab0', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'c255bdb5-88c0-45eb-b281-f93d7f5f1893');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('a4183679-c056-478a-a4c5-6674ccb03d03', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'c255bdb5-88c0-45eb-b281-f93d7f5f1893');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('5622e26e-3f1d-4e9e-9192-53deeb9e14e6', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '20cc23a8-2380-4cea-a850-0cd648f75edc');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('1c9f4111-db32-4760-9c22-aa026c5d16a7', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '8f13b935-86e1-433b-ad55-465c18396ef4');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('9d1abf66-7d48-41bd-8972-517d912b4bbb', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '8f13b935-86e1-433b-ad55-465c18396ef4');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('4fafb168-ff8f-4d3e-99eb-a676b259c9c8', 'acr loa level', 'openid-connect', 'oidc-acr-mapper', NULL, 'd93dd56b-989b-4f4b-bc8f-a134e429a728');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('cf3d717f-042c-4bf6-8491-7aded97e978d', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '022e927e-db5e-4c54-9931-b648a7f7fb88', NULL);


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('97faf414-37f7-4b16-8f1e-b52bcb82949c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('97faf414-37f7-4b16-8f1e-b52bcb82949c', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('97faf414-37f7-4b16-8f1e-b52bcb82949c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('97faf414-37f7-4b16-8f1e-b52bcb82949c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('97faf414-37f7-4b16-8f1e-b52bcb82949c', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('97faf414-37f7-4b16-8f1e-b52bcb82949c', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('edb8c935-3ccf-4426-9990-d934e0e283b7', 'false', 'single');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('edb8c935-3ccf-4426-9990-d934e0e283b7', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('edb8c935-3ccf-4426-9990-d934e0e283b7', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b3183259-743b-4660-80ca-8f24e17e9bfb', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b3183259-743b-4660-80ca-8f24e17e9bfb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b3183259-743b-4660-80ca-8f24e17e9bfb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8981a8b8-2d14-484e-a3ab-a51197b48581', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8981a8b8-2d14-484e-a3ab-a51197b48581', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8981a8b8-2d14-484e-a3ab-a51197b48581', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8981a8b8-2d14-484e-a3ab-a51197b48581', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8981a8b8-2d14-484e-a3ab-a51197b48581', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8981a8b8-2d14-484e-a3ab-a51197b48581', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e930962e-3d1f-4e6d-867a-35f3950524f4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e930962e-3d1f-4e6d-867a-35f3950524f4', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e930962e-3d1f-4e6d-867a-35f3950524f4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e930962e-3d1f-4e6d-867a-35f3950524f4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e930962e-3d1f-4e6d-867a-35f3950524f4', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e930962e-3d1f-4e6d-867a-35f3950524f4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('bc5146a1-fe44-47cf-b282-ca938969a248', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('bc5146a1-fe44-47cf-b282-ca938969a248', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('bc5146a1-fe44-47cf-b282-ca938969a248', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('bc5146a1-fe44-47cf-b282-ca938969a248', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('bc5146a1-fe44-47cf-b282-ca938969a248', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('bc5146a1-fe44-47cf-b282-ca938969a248', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3b02d512-be1b-49f0-a0c1-e4572b2eb2d4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3b02d512-be1b-49f0-a0c1-e4572b2eb2d4', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3b02d512-be1b-49f0-a0c1-e4572b2eb2d4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3b02d512-be1b-49f0-a0c1-e4572b2eb2d4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3b02d512-be1b-49f0-a0c1-e4572b2eb2d4', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3b02d512-be1b-49f0-a0c1-e4572b2eb2d4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('569eee8a-1d43-4154-a305-e0c3b71e54c9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('569eee8a-1d43-4154-a305-e0c3b71e54c9', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('569eee8a-1d43-4154-a305-e0c3b71e54c9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('569eee8a-1d43-4154-a305-e0c3b71e54c9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('569eee8a-1d43-4154-a305-e0c3b71e54c9', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('569eee8a-1d43-4154-a305-e0c3b71e54c9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2b96558c-1911-4ed9-8325-4903a51b5388', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2b96558c-1911-4ed9-8325-4903a51b5388', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2b96558c-1911-4ed9-8325-4903a51b5388', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2b96558c-1911-4ed9-8325-4903a51b5388', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2b96558c-1911-4ed9-8325-4903a51b5388', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2b96558c-1911-4ed9-8325-4903a51b5388', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2dffa976-38bb-420a-abb3-57e4316581f3', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2dffa976-38bb-420a-abb3-57e4316581f3', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2dffa976-38bb-420a-abb3-57e4316581f3', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2dffa976-38bb-420a-abb3-57e4316581f3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2dffa976-38bb-420a-abb3-57e4316581f3', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2dffa976-38bb-420a-abb3-57e4316581f3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('752d1d1c-7a7f-42fb-8d12-cf5e4171e52c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('752d1d1c-7a7f-42fb-8d12-cf5e4171e52c', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('752d1d1c-7a7f-42fb-8d12-cf5e4171e52c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('752d1d1c-7a7f-42fb-8d12-cf5e4171e52c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('752d1d1c-7a7f-42fb-8d12-cf5e4171e52c', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('752d1d1c-7a7f-42fb-8d12-cf5e4171e52c', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db9bfd9c-86bf-4e5c-8378-7b9453b022e3', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db9bfd9c-86bf-4e5c-8378-7b9453b022e3', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db9bfd9c-86bf-4e5c-8378-7b9453b022e3', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db9bfd9c-86bf-4e5c-8378-7b9453b022e3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db9bfd9c-86bf-4e5c-8378-7b9453b022e3', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db9bfd9c-86bf-4e5c-8378-7b9453b022e3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88fce930-9d2e-4bde-824b-4566bfaca766', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88fce930-9d2e-4bde-824b-4566bfaca766', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88fce930-9d2e-4bde-824b-4566bfaca766', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88fce930-9d2e-4bde-824b-4566bfaca766', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88fce930-9d2e-4bde-824b-4566bfaca766', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88fce930-9d2e-4bde-824b-4566bfaca766', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db373146-3b32-4ff8-b5da-a961aeedaeb0', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db373146-3b32-4ff8-b5da-a961aeedaeb0', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db373146-3b32-4ff8-b5da-a961aeedaeb0', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db373146-3b32-4ff8-b5da-a961aeedaeb0', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db373146-3b32-4ff8-b5da-a961aeedaeb0', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db373146-3b32-4ff8-b5da-a961aeedaeb0', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6fef267a-e504-41f5-a141-00b7aad74a88', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6fef267a-e504-41f5-a141-00b7aad74a88', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6fef267a-e504-41f5-a141-00b7aad74a88', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6fef267a-e504-41f5-a141-00b7aad74a88', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6fef267a-e504-41f5-a141-00b7aad74a88', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6fef267a-e504-41f5-a141-00b7aad74a88', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('575760f5-c1af-4ba1-bdfe-a8a65675fb37', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('575760f5-c1af-4ba1-bdfe-a8a65675fb37', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('575760f5-c1af-4ba1-bdfe-a8a65675fb37', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('575760f5-c1af-4ba1-bdfe-a8a65675fb37', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('575760f5-c1af-4ba1-bdfe-a8a65675fb37', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('575760f5-c1af-4ba1-bdfe-a8a65675fb37', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('101d8554-9adf-48c6-8807-816381f4d80d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('101d8554-9adf-48c6-8807-816381f4d80d', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('101d8554-9adf-48c6-8807-816381f4d80d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('101d8554-9adf-48c6-8807-816381f4d80d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('101d8554-9adf-48c6-8807-816381f4d80d', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('101d8554-9adf-48c6-8807-816381f4d80d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3204096-b07e-472a-82b8-c285ed101ffe', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3204096-b07e-472a-82b8-c285ed101ffe', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3204096-b07e-472a-82b8-c285ed101ffe', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3204096-b07e-472a-82b8-c285ed101ffe', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3204096-b07e-472a-82b8-c285ed101ffe', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3204096-b07e-472a-82b8-c285ed101ffe', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ead97a4-974f-4ca7-9fa6-fe7591504920', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ead97a4-974f-4ca7-9fa6-fe7591504920', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ead97a4-974f-4ca7-9fa6-fe7591504920', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ead97a4-974f-4ca7-9fa6-fe7591504920', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ead97a4-974f-4ca7-9fa6-fe7591504920', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ead97a4-974f-4ca7-9fa6-fe7591504920', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ead97a4-974f-4ca7-9fa6-fe7591504920', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ead97a4-974f-4ca7-9fa6-fe7591504920', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ead97a4-974f-4ca7-9fa6-fe7591504920', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c1aaff3c-0e75-41d0-b76a-72eb46f83cb7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c1aaff3c-0e75-41d0-b76a-72eb46f83cb7', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c1aaff3c-0e75-41d0-b76a-72eb46f83cb7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c1aaff3c-0e75-41d0-b76a-72eb46f83cb7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c1aaff3c-0e75-41d0-b76a-72eb46f83cb7', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c1aaff3c-0e75-41d0-b76a-72eb46f83cb7', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('04850b1a-3b33-45ce-ad02-ab4e9937cbe2', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('04850b1a-3b33-45ce-ad02-ab4e9937cbe2', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('04850b1a-3b33-45ce-ad02-ab4e9937cbe2', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('04850b1a-3b33-45ce-ad02-ab4e9937cbe2', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('04850b1a-3b33-45ce-ad02-ab4e9937cbe2', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('04850b1a-3b33-45ce-ad02-ab4e9937cbe2', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ff7cbbb1-1de9-4f39-866d-f2d845519e5a', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ff7cbbb1-1de9-4f39-866d-f2d845519e5a', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ff7cbbb1-1de9-4f39-866d-f2d845519e5a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ff7cbbb1-1de9-4f39-866d-f2d845519e5a', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ff7cbbb1-1de9-4f39-866d-f2d845519e5a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('49271c26-7ac1-4d7a-8b42-5e3b237b6c7f', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('49271c26-7ac1-4d7a-8b42-5e3b237b6c7f', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('49271c26-7ac1-4d7a-8b42-5e3b237b6c7f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('49271c26-7ac1-4d7a-8b42-5e3b237b6c7f', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('49271c26-7ac1-4d7a-8b42-5e3b237b6c7f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('43c44aaa-786a-4d7a-9082-7cc2e43782af', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('43c44aaa-786a-4d7a-9082-7cc2e43782af', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('43c44aaa-786a-4d7a-9082-7cc2e43782af', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('43c44aaa-786a-4d7a-9082-7cc2e43782af', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('43c44aaa-786a-4d7a-9082-7cc2e43782af', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('43c44aaa-786a-4d7a-9082-7cc2e43782af', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('edc03790-21ed-4bb9-86ad-75224c214b68', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('edc03790-21ed-4bb9-86ad-75224c214b68', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('edc03790-21ed-4bb9-86ad-75224c214b68', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('edc03790-21ed-4bb9-86ad-75224c214b68', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('edc03790-21ed-4bb9-86ad-75224c214b68', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('edc03790-21ed-4bb9-86ad-75224c214b68', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('13c825c8-b6f9-4734-b9ab-7947a3622aac', 'client_id', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('13c825c8-b6f9-4734-b9ab-7947a3622aac', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('13c825c8-b6f9-4734-b9ab-7947a3622aac', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('13c825c8-b6f9-4734-b9ab-7947a3622aac', 'client_id', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('13c825c8-b6f9-4734-b9ab-7947a3622aac', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('93cbb977-6b4c-4e06-a218-571c458be697', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('93cbb977-6b4c-4e06-a218-571c458be697', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('93cbb977-6b4c-4e06-a218-571c458be697', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('93cbb977-6b4c-4e06-a218-571c458be697', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('93cbb977-6b4c-4e06-a218-571c458be697', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('95eede90-eed0-4cfc-a2e1-9eb5ba4f5aa4', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('95eede90-eed0-4cfc-a2e1-9eb5ba4f5aa4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('95eede90-eed0-4cfc-a2e1-9eb5ba4f5aa4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('95eede90-eed0-4cfc-a2e1-9eb5ba4f5aa4', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('95eede90-eed0-4cfc-a2e1-9eb5ba4f5aa4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a5f6c7f5-7fa1-4f52-a942-92bb3fae1233', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a5f6c7f5-7fa1-4f52-a942-92bb3fae1233', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a5f6c7f5-7fa1-4f52-a942-92bb3fae1233', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a5f6c7f5-7fa1-4f52-a942-92bb3fae1233', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a5f6c7f5-7fa1-4f52-a942-92bb3fae1233', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a5f6c7f5-7fa1-4f52-a942-92bb3fae1233', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a5f6c7f5-7fa1-4f52-a942-92bb3fae1233', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a3ba0784-c04d-4f30-9410-afed2aa17972', 'blogq-backend', 'included.client.audience');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a3ba0784-c04d-4f30-9410-afed2aa17972', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a3ba0784-c04d-4f30-9410-afed2aa17972', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('571b7b98-cccf-4c72-b653-93bc34fff247', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('571b7b98-cccf-4c72-b653-93bc34fff247', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('571b7b98-cccf-4c72-b653-93bc34fff247', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('571b7b98-cccf-4c72-b653-93bc34fff247', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('571b7b98-cccf-4c72-b653-93bc34fff247', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('571b7b98-cccf-4c72-b653-93bc34fff247', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('571b7b98-cccf-4c72-b653-93bc34fff247', 'blogq-backend', 'usermodel.clientRoleMapping.clientId');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('862c04bd-0b7d-4df1-9033-8f87f2c07c55', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('862c04bd-0b7d-4df1-9033-8f87f2c07c55', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ef4a821c-639e-417b-bced-33982dc733f4', 'false', 'single');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ef4a821c-639e-417b-bced-33982dc733f4', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ef4a821c-639e-417b-bced-33982dc733f4', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1811e1ed-0c14-4fe6-9c83-fef078ceea27', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1811e1ed-0c14-4fe6-9c83-fef078ceea27', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1811e1ed-0c14-4fe6-9c83-fef078ceea27', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1811e1ed-0c14-4fe6-9c83-fef078ceea27', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1811e1ed-0c14-4fe6-9c83-fef078ceea27', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1811e1ed-0c14-4fe6-9c83-fef078ceea27', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('297529c5-6681-401f-8241-d440fdd484b6', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('297529c5-6681-401f-8241-d440fdd484b6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('297529c5-6681-401f-8241-d440fdd484b6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2e55ecbb-7cd1-44ec-b540-b8e4be0cd3dc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2e55ecbb-7cd1-44ec-b540-b8e4be0cd3dc', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2e55ecbb-7cd1-44ec-b540-b8e4be0cd3dc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2e55ecbb-7cd1-44ec-b540-b8e4be0cd3dc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2e55ecbb-7cd1-44ec-b540-b8e4be0cd3dc', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2e55ecbb-7cd1-44ec-b540-b8e4be0cd3dc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4158ca39-5462-4bc6-a9df-6fe6d01f1241', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4158ca39-5462-4bc6-a9df-6fe6d01f1241', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4158ca39-5462-4bc6-a9df-6fe6d01f1241', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4158ca39-5462-4bc6-a9df-6fe6d01f1241', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4158ca39-5462-4bc6-a9df-6fe6d01f1241', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4158ca39-5462-4bc6-a9df-6fe6d01f1241', 'long', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5b0169ab-3e4d-4953-bc51-5b274467920a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5b0169ab-3e4d-4953-bc51-5b274467920a', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5b0169ab-3e4d-4953-bc51-5b274467920a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5b0169ab-3e4d-4953-bc51-5b274467920a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5b0169ab-3e4d-4953-bc51-5b274467920a', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5b0169ab-3e4d-4953-bc51-5b274467920a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7e39ac5d-00a1-40e0-a626-788d992363cc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7e39ac5d-00a1-40e0-a626-788d992363cc', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7e39ac5d-00a1-40e0-a626-788d992363cc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7e39ac5d-00a1-40e0-a626-788d992363cc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7e39ac5d-00a1-40e0-a626-788d992363cc', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7e39ac5d-00a1-40e0-a626-788d992363cc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('906597fa-1862-41c0-89a4-01e70c5ec2d7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('906597fa-1862-41c0-89a4-01e70c5ec2d7', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('906597fa-1862-41c0-89a4-01e70c5ec2d7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('906597fa-1862-41c0-89a4-01e70c5ec2d7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('906597fa-1862-41c0-89a4-01e70c5ec2d7', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('906597fa-1862-41c0-89a4-01e70c5ec2d7', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('aa12307d-fd8c-418f-abb7-d98d1dc686a3', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('aa12307d-fd8c-418f-abb7-d98d1dc686a3', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('aa12307d-fd8c-418f-abb7-d98d1dc686a3', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('aa12307d-fd8c-418f-abb7-d98d1dc686a3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('aa12307d-fd8c-418f-abb7-d98d1dc686a3', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('aa12307d-fd8c-418f-abb7-d98d1dc686a3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('aa6ace08-058a-4cec-b3dc-3c3e6d1f096b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('aa6ace08-058a-4cec-b3dc-3c3e6d1f096b', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('aa6ace08-058a-4cec-b3dc-3c3e6d1f096b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('aa6ace08-058a-4cec-b3dc-3c3e6d1f096b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('aa6ace08-058a-4cec-b3dc-3c3e6d1f096b', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('aa6ace08-058a-4cec-b3dc-3c3e6d1f096b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b44dccba-7811-4bd3-b35d-b4b55e7d273f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b44dccba-7811-4bd3-b35d-b4b55e7d273f', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b44dccba-7811-4bd3-b35d-b4b55e7d273f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b44dccba-7811-4bd3-b35d-b4b55e7d273f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b44dccba-7811-4bd3-b35d-b4b55e7d273f', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b44dccba-7811-4bd3-b35d-b4b55e7d273f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ca91929c-a423-4548-999c-5c80a21e7ca7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ca91929c-a423-4548-999c-5c80a21e7ca7', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ca91929c-a423-4548-999c-5c80a21e7ca7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ca91929c-a423-4548-999c-5c80a21e7ca7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ca91929c-a423-4548-999c-5c80a21e7ca7', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ca91929c-a423-4548-999c-5c80a21e7ca7', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e9779c67-5c23-4ebc-91f6-107f65fd1111', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e9779c67-5c23-4ebc-91f6-107f65fd1111', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e9779c67-5c23-4ebc-91f6-107f65fd1111', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e9779c67-5c23-4ebc-91f6-107f65fd1111', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e9779c67-5c23-4ebc-91f6-107f65fd1111', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e9779c67-5c23-4ebc-91f6-107f65fd1111', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ebdc00fc-a215-4248-b0ac-ea46a71eabcd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ebdc00fc-a215-4248-b0ac-ea46a71eabcd', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ebdc00fc-a215-4248-b0ac-ea46a71eabcd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ebdc00fc-a215-4248-b0ac-ea46a71eabcd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ebdc00fc-a215-4248-b0ac-ea46a71eabcd', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ebdc00fc-a215-4248-b0ac-ea46a71eabcd', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('efa30b9f-1204-4319-a9b2-a1de4519c375', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('efa30b9f-1204-4319-a9b2-a1de4519c375', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('efa30b9f-1204-4319-a9b2-a1de4519c375', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('efa30b9f-1204-4319-a9b2-a1de4519c375', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('efa30b9f-1204-4319-a9b2-a1de4519c375', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('efa30b9f-1204-4319-a9b2-a1de4519c375', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b2ebf0b7-12bf-4438-8216-0fe606acd952', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b2ebf0b7-12bf-4438-8216-0fe606acd952', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b2ebf0b7-12bf-4438-8216-0fe606acd952', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b2ebf0b7-12bf-4438-8216-0fe606acd952', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b2ebf0b7-12bf-4438-8216-0fe606acd952', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b2ebf0b7-12bf-4438-8216-0fe606acd952', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2c79023-cd28-42b8-8cf4-ee893305e500', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2c79023-cd28-42b8-8cf4-ee893305e500', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2c79023-cd28-42b8-8cf4-ee893305e500', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2c79023-cd28-42b8-8cf4-ee893305e500', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2c79023-cd28-42b8-8cf4-ee893305e500', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2c79023-cd28-42b8-8cf4-ee893305e500', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('33ca0aa6-f7de-4d24-b20c-691f1a58aa0c', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('33ca0aa6-f7de-4d24-b20c-691f1a58aa0c', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('33ca0aa6-f7de-4d24-b20c-691f1a58aa0c', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('33ca0aa6-f7de-4d24-b20c-691f1a58aa0c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('33ca0aa6-f7de-4d24-b20c-691f1a58aa0c', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('33ca0aa6-f7de-4d24-b20c-691f1a58aa0c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('33ca0aa6-f7de-4d24-b20c-691f1a58aa0c', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('33ca0aa6-f7de-4d24-b20c-691f1a58aa0c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('33ca0aa6-f7de-4d24-b20c-691f1a58aa0c', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e140a3f-152a-4eb6-a074-387a7361b033', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e140a3f-152a-4eb6-a074-387a7361b033', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e140a3f-152a-4eb6-a074-387a7361b033', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e140a3f-152a-4eb6-a074-387a7361b033', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e140a3f-152a-4eb6-a074-387a7361b033', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e140a3f-152a-4eb6-a074-387a7361b033', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('310f7db1-84ab-4d3a-91db-d624d1e24c8b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('310f7db1-84ab-4d3a-91db-d624d1e24c8b', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('310f7db1-84ab-4d3a-91db-d624d1e24c8b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('310f7db1-84ab-4d3a-91db-d624d1e24c8b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('310f7db1-84ab-4d3a-91db-d624d1e24c8b', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('310f7db1-84ab-4d3a-91db-d624d1e24c8b', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1ff32255-cd9f-4ec0-8e7c-1aa3d366b56c', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1ff32255-cd9f-4ec0-8e7c-1aa3d366b56c', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1ff32255-cd9f-4ec0-8e7c-1aa3d366b56c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1ff32255-cd9f-4ec0-8e7c-1aa3d366b56c', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1ff32255-cd9f-4ec0-8e7c-1aa3d366b56c', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f78b656d-c90d-4d82-9423-65321378dab0', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f78b656d-c90d-4d82-9423-65321378dab0', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f78b656d-c90d-4d82-9423-65321378dab0', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f78b656d-c90d-4d82-9423-65321378dab0', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f78b656d-c90d-4d82-9423-65321378dab0', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1c9f4111-db32-4760-9c22-aa026c5d16a7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1c9f4111-db32-4760-9c22-aa026c5d16a7', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1c9f4111-db32-4760-9c22-aa026c5d16a7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1c9f4111-db32-4760-9c22-aa026c5d16a7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1c9f4111-db32-4760-9c22-aa026c5d16a7', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1c9f4111-db32-4760-9c22-aa026c5d16a7', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('9d1abf66-7d48-41bd-8972-517d912b4bbb', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('9d1abf66-7d48-41bd-8972-517d912b4bbb', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('9d1abf66-7d48-41bd-8972-517d912b4bbb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('9d1abf66-7d48-41bd-8972-517d912b4bbb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('9d1abf66-7d48-41bd-8972-517d912b4bbb', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('9d1abf66-7d48-41bd-8972-517d912b4bbb', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4fafb168-ff8f-4d3e-99eb-a676b259c9c8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4fafb168-ff8f-4d3e-99eb-a676b259c9c8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('cf3d717f-042c-4bf6-8491-7aded97e978d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('cf3d717f-042c-4bf6-8491-7aded97e978d', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('cf3d717f-042c-4bf6-8491-7aded97e978d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('cf3d717f-042c-4bf6-8491-7aded97e978d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('cf3d717f-042c-4bf6-8491-7aded97e978d', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('cf3d717f-042c-4bf6-8491-7aded97e978d', 'String', 'jsonType.label');


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) VALUES ('master', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '896bc591-348d-45c4-8a2f-b2593c7b2155', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '23488e8b-7281-4abd-ae79-17fbf34a4443', '40cbcdab-23d0-4539-8487-7114f2fbe899', 'e5d7ed0f-15d2-4921-b650-cada5b768ed9', '46ff7517-2911-47ba-bf78-78a587b9535e', '3daaf123-c36b-40fa-a7e8-764540aac445', 2592000, false, 900, true, false, 'c4f9c3d4-5ad3-4896-8690-584b1e42ed60', 0, false, 0, 0, 'fc8bf92c-0900-443e-8117-2a705f00b519');
INSERT INTO public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, 'blogq', 0, NULL, true, true, false, false, 'NONE', 1800, 36000, false, false, 'fed33eec-3955-4cb5-a210-5d087f86bad2', 1800, false, NULL, true, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', 'ea783d6e-71a8-4ec0-95d3-de93642601a7', '8fb9b19b-dd1a-4c45-9af6-6b6261e0b18a', '40a064b2-bf63-4683-a6eb-cb38335ebaf6', 'bd24ec5b-368c-4af9-a139-59aa4be76525', '2ee8fdf3-d083-4f31-8e2f-60537afc7c58', 2592000, false, 900, true, false, 'ce37689c-d4d4-4aff-abe2-85e0073edfd7', 0, false, 0, 0, 'f10f83c6-7bf9-42d3-8fee-56d518e941d9');


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.contentSecurityPolicyReportOnly', 'master', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xContentTypeOptions', 'master', 'nosniff');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xRobotsTag', 'master', 'none');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xFrameOptions', 'master', 'SAMEORIGIN');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.contentSecurityPolicy', 'master', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xXSSProtection', 'master', '1; mode=block');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.strictTransportSecurity', 'master', 'max-age=31536000; includeSubDomains');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('bruteForceProtected', 'master', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('permanentLockout', 'master', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxFailureWaitSeconds', 'master', '900');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('minimumQuickLoginWaitSeconds', 'master', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('waitIncrementSeconds', 'master', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('quickLoginCheckMilliSeconds', 'master', '1000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxDeltaTimeSeconds', 'master', '43200');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('failureFactor', 'master', '30');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('displayName', 'master', 'Keycloak');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('displayNameHtml', 'master', '<div class="kc-logo-text"><span>Keycloak</span></div>');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('defaultSignatureAlgorithm', 'master', 'RS256');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('offlineSessionMaxLifespanEnabled', 'master', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('offlineSessionMaxLifespan', 'master', '5184000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('acr.loa.map', '2b937222-9615-437f-bf8d-0e73191e2c82', '{}');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('frontendUrl', '2b937222-9615-437f-bf8d-0e73191e2c82', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('oauth2DeviceCodeLifespan', '2b937222-9615-437f-bf8d-0e73191e2c82', '600');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('oauth2DevicePollingInterval', '2b937222-9615-437f-bf8d-0e73191e2c82', '5');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('clientOfflineSessionIdleTimeout', '2b937222-9615-437f-bf8d-0e73191e2c82', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('clientOfflineSessionMaxLifespan', '2b937222-9615-437f-bf8d-0e73191e2c82', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('clientSessionIdleTimeout', '2b937222-9615-437f-bf8d-0e73191e2c82', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('clientSessionMaxLifespan', '2b937222-9615-437f-bf8d-0e73191e2c82', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('realmReusableOtpCode', '2b937222-9615-437f-bf8d-0e73191e2c82', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('displayName', '2b937222-9615-437f-bf8d-0e73191e2c82', 'BlogQ');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('displayNameHtml', '2b937222-9615-437f-bf8d-0e73191e2c82', '<h1>BlogQ</h1>');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('bruteForceProtected', '2b937222-9615-437f-bf8d-0e73191e2c82', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('permanentLockout', '2b937222-9615-437f-bf8d-0e73191e2c82', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxFailureWaitSeconds', '2b937222-9615-437f-bf8d-0e73191e2c82', '900');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('minimumQuickLoginWaitSeconds', '2b937222-9615-437f-bf8d-0e73191e2c82', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('waitIncrementSeconds', '2b937222-9615-437f-bf8d-0e73191e2c82', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('quickLoginCheckMilliSeconds', '2b937222-9615-437f-bf8d-0e73191e2c82', '1000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxDeltaTimeSeconds', '2b937222-9615-437f-bf8d-0e73191e2c82', '43200');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('failureFactor', '2b937222-9615-437f-bf8d-0e73191e2c82', '30');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('actionTokenGeneratedByAdminLifespan', '2b937222-9615-437f-bf8d-0e73191e2c82', '43200');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('actionTokenGeneratedByUserLifespan', '2b937222-9615-437f-bf8d-0e73191e2c82', '300');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('defaultSignatureAlgorithm', '2b937222-9615-437f-bf8d-0e73191e2c82', 'RS256');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('offlineSessionMaxLifespanEnabled', '2b937222-9615-437f-bf8d-0e73191e2c82', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('offlineSessionMaxLifespan', '2b937222-9615-437f-bf8d-0e73191e2c82', '5184000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRpEntityName', '2b937222-9615-437f-bf8d-0e73191e2c82', 'keycloak');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicySignatureAlgorithms', '2b937222-9615-437f-bf8d-0e73191e2c82', 'ES256');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRpId', '2b937222-9615-437f-bf8d-0e73191e2c82', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAttestationConveyancePreference', '2b937222-9615-437f-bf8d-0e73191e2c82', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAuthenticatorAttachment', '2b937222-9615-437f-bf8d-0e73191e2c82', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRequireResidentKey', '2b937222-9615-437f-bf8d-0e73191e2c82', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyUserVerificationRequirement', '2b937222-9615-437f-bf8d-0e73191e2c82', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyCreateTimeout', '2b937222-9615-437f-bf8d-0e73191e2c82', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', '2b937222-9615-437f-bf8d-0e73191e2c82', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRpEntityNamePasswordless', '2b937222-9615-437f-bf8d-0e73191e2c82', 'keycloak');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', '2b937222-9615-437f-bf8d-0e73191e2c82', 'ES256');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRpIdPasswordless', '2b937222-9615-437f-bf8d-0e73191e2c82', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', '2b937222-9615-437f-bf8d-0e73191e2c82', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', '2b937222-9615-437f-bf8d-0e73191e2c82', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', '2b937222-9615-437f-bf8d-0e73191e2c82', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', '2b937222-9615-437f-bf8d-0e73191e2c82', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyCreateTimeoutPasswordless', '2b937222-9615-437f-bf8d-0e73191e2c82', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', '2b937222-9615-437f-bf8d-0e73191e2c82', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('client-policies.profiles', '2b937222-9615-437f-bf8d-0e73191e2c82', '{"profiles":[]}');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('client-policies.policies', '2b937222-9615-437f-bf8d-0e73191e2c82', '{"policies":[]}');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('cibaAuthRequestedUserHint', '2b937222-9615-437f-bf8d-0e73191e2c82', 'login_hint');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('cibaBackchannelTokenDeliveryMode', '2b937222-9615-437f-bf8d-0e73191e2c82', 'poll');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('cibaExpiresIn', '2b937222-9615-437f-bf8d-0e73191e2c82', '120');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('cibaInterval', '2b937222-9615-437f-bf8d-0e73191e2c82', '5');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('parRequestUriLifespan', '2b937222-9615-437f-bf8d-0e73191e2c82', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.contentSecurityPolicyReportOnly', '2b937222-9615-437f-bf8d-0e73191e2c82', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xContentTypeOptions', '2b937222-9615-437f-bf8d-0e73191e2c82', 'nosniff');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xRobotsTag', '2b937222-9615-437f-bf8d-0e73191e2c82', 'none');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xFrameOptions', '2b937222-9615-437f-bf8d-0e73191e2c82', 'SAMEORIGIN');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.contentSecurityPolicy', '2b937222-9615-437f-bf8d-0e73191e2c82', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xXSSProtection', '2b937222-9615-437f-bf8d-0e73191e2c82', '1; mode=block');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.strictTransportSecurity', '2b937222-9615-437f-bf8d-0e73191e2c82', 'max-age=31536000; includeSubDomains');


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.realm_events_listeners (realm_id, value) VALUES ('master', 'jboss-logging');
INSERT INTO public.realm_events_listeners (realm_id, value) VALUES ('2b937222-9615-437f-bf8d-0e73191e2c82', 'jboss-logging');


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.realm_required_credential (type, form_label, input, secret, realm_id) VALUES ('password', 'password', true, true, 'master');
INSERT INTO public.realm_required_credential (type, form_label, input, secret, realm_id) VALUES ('password', 'password', true, true, '2b937222-9615-437f-bf8d-0e73191e2c82');


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.redirect_uris (client_id, value) VALUES ('71f2376d-ff99-44db-ba8d-4c485915b2ab', '/realms/master/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('e0204d41-458b-46d9-be73-783880589f08', '/realms/master/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', '/admin/master/console/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('bf39530a-b2a6-4e37-8b3d-56614fdde86d', '/realms/blogq/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', '/realms/blogq/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', '/admin/blogq/console/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'http://localhost:51080/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'http://localhost:5173/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', '/*');


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('b1316a9b-0557-4e6e-8ab0-5a9a977c2842', 'VERIFY_EMAIL', 'Verify Email', 'master', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('d0f5d14c-6c4b-4145-9b23-6ae5ae2c9976', 'UPDATE_PROFILE', 'Update Profile', 'master', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('d45cc8d7-ae82-4abe-a111-bd7a47b07c64', 'CONFIGURE_TOTP', 'Configure OTP', 'master', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('ab012c57-c05c-4320-a44d-bf755f50b220', 'UPDATE_PASSWORD', 'Update Password', 'master', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('dc86171e-4da4-4550-8c09-fb97df309c6b', 'update_user_locale', 'Update User Locale', 'master', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('1eb6cca5-0640-46ad-8ab3-9b5b0120f4ef', 'delete_account', 'Delete Account', 'master', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('1d008f44-0aca-4333-9bd1-2754af4c17fd', 'TERMS_AND_CONDITIONS', 'Terms and Conditions', 'master', false, false, 'TERMS_AND_CONDITIONS', 20);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('727f411d-7e95-4d03-8f0e-a96e1d6e13b3', 'VERIFY_EMAIL', 'Verify Email', '2b937222-9615-437f-bf8d-0e73191e2c82', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('33712f6e-6315-430c-bdde-af123a4b94b1', 'UPDATE_PROFILE', 'Update Profile', '2b937222-9615-437f-bf8d-0e73191e2c82', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('3ba38853-a927-4791-a797-44a0acf945b9', 'CONFIGURE_TOTP', 'Configure OTP', '2b937222-9615-437f-bf8d-0e73191e2c82', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('b4982bfc-a3ea-4c08-927a-17286e266216', 'UPDATE_PASSWORD', 'Update Password', '2b937222-9615-437f-bf8d-0e73191e2c82', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('2f7b75ca-fedc-475c-a495-f37e9b5b4fd8', 'TERMS_AND_CONDITIONS', 'Terms and Conditions', '2b937222-9615-437f-bf8d-0e73191e2c82', false, false, 'TERMS_AND_CONDITIONS', 20);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('644d42bb-5874-4060-bb39-347ec7a58f4a', 'delete_account', 'Delete Account', '2b937222-9615-437f-bf8d-0e73191e2c82', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('0579799c-6259-4af6-8cd3-65135812f50c', 'update_user_locale', 'Update User Locale', '2b937222-9615-437f-bf8d-0e73191e2c82', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('2952b31f-e73a-4f94-97dc-142ab9157e11', 'webauthn-register', 'Webauthn Register', '2b937222-9615-437f-bf8d-0e73191e2c82', true, false, 'webauthn-register', 70);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('06c9c22c-f164-4ad3-ac18-f5bcf6d38f75', 'webauthn-register-passwordless', 'Webauthn Register Passwordless', '2b937222-9615-437f-bf8d-0e73191e2c82', true, false, 'webauthn-register-passwordless', 80);


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.scope_mapping (client_id, role_id) VALUES ('e0204d41-458b-46d9-be73-783880589f08', 'fe94932f-932c-46c4-8449-3361a217ac4e');
INSERT INTO public.scope_mapping (client_id, role_id) VALUES ('e0204d41-458b-46d9-be73-783880589f08', 'cddf9797-0e0f-4152-9690-ff4298aa24de');
INSERT INTO public.scope_mapping (client_id, role_id) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', 'ff7f35c8-7a44-4217-8135-120f98d2e91d');
INSERT INTO public.scope_mapping (client_id, role_id) VALUES ('dd874f72-6771-4f47-9984-4e6f6deb4348', '9f60b1c0-7aea-4052-8421-4516cab6ca9d');


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('d35222cf-e57b-47ac-8a82-83420e3d6bad', NULL, '61186b62-9383-479d-ade7-a73731b96a96', false, true, NULL, NULL, NULL, 'master', 'hst-admin-user', 1644584365799, NULL, 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('e9c71d94-e71b-44c5-8cd1-3ba0a146e719', NULL, 'c07b019d-0313-4aa8-9b27-06d9105fdb86', false, true, NULL, NULL, NULL, '2b937222-9615-437f-bf8d-0e73191e2c82', 'service-account-blogq-backend', 1683058559230, 'a2365734-8e69-494b-abf4-c445e57d9eea', 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('c79ab150-a572-43f9-a730-60395e8dd914', 'blogq-admin@t12s.io', 'blogq-admin@t12s.io', true, true, NULL, 'Blogger', 'Admin', '2b937222-9615-437f-bf8d-0e73191e2c82', 'blogq-admin@t12s.io', 1683059676121, NULL, 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('df1fd6bf-3117-464e-881b-957fcecc0566', 'blogq-author@t12s.io', 'blogq-author@t12s.io', true, true, NULL, 'Writer', 'Author', '2b937222-9615-437f-bf8d-0e73191e2c82', 'blogq-author@t12s.io', 1683059707460, NULL, 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('30b1db82-829d-4fbc-945d-b84d4f097aca', 'blogq-publisher@t12s.io', 'blogq-publisher@t12s.io', true, true, NULL, 'Paul', 'Publisher', '2b937222-9615-437f-bf8d-0e73191e2c82', 'blogq-publisher@t12s.io', 1683059734333, NULL, 0);


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.user_group_membership (group_id, user_id) VALUES ('c7f5f435-5014-4ba2-b04a-fba5e5a23623', 'c79ab150-a572-43f9-a730-60395e8dd914');
INSERT INTO public.user_group_membership (group_id, user_id) VALUES ('2f8cff9b-9313-4012-a108-39c528449cae', 'df1fd6bf-3117-464e-881b-957fcecc0566');
INSERT INTO public.user_group_membership (group_id, user_id) VALUES ('c5f1d39f-8d7d-4e97-8ddb-2440f7fffd02', '30b1db82-829d-4fbc-945d-b84d4f097aca');


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('fc8bf92c-0900-443e-8117-2a705f00b519', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('e0405c5f-3c5b-4721-aac3-a7834d6b6ddd', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('4a5fcb74-935f-4941-a407-63e6ed83597c', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('fdc418be-dafe-4b1e-b664-7e60d10d145c', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('62c2cd5d-9f3d-4719-845a-f055c9b62046', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('70d83f5d-20bf-455b-a121-7aaaad7724d1', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('6d3c07c3-ba23-4822-abec-61bd4ef0ab73', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('0d1a5743-4d41-4457-9484-9649acde5b6b', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('3f075890-9489-4e26-a184-59d504d0889d', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('9e29f4a9-e184-4946-b627-1099db221548', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('6b67a461-e6ac-4b7e-81cd-82e1ef1a816f', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('4eb73e82-082b-461b-a191-00a867125624', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('cb869c05-a656-4964-824f-4733c6583579', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('22eb7536-4a15-4049-8c66-7e7c3e3fac10', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('ec71af46-8006-4eea-b32e-00429cfd10b4', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('b356f48c-da06-47b6-a584-48695ce433f4', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('a89ef883-6315-4528-b823-b08e4ba16e6d', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('4fe6230c-c5af-4d9d-b648-3f21e3e12221', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('87c818d0-78be-4f35-9c54-09b1c019f4ad', 'd35222cf-e57b-47ac-8a82-83420e3d6bad');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('f10f83c6-7bf9-42d3-8fee-56d518e941d9', 'e9c71d94-e71b-44c5-8cd1-3ba0a146e719');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('3a90c589-fa25-4818-ab4f-8b6130c228d5', 'e9c71d94-e71b-44c5-8cd1-3ba0a146e719');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('f10f83c6-7bf9-42d3-8fee-56d518e941d9', 'c79ab150-a572-43f9-a730-60395e8dd914');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('f10f83c6-7bf9-42d3-8fee-56d518e941d9', 'df1fd6bf-3117-464e-881b-957fcecc0566');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('f10f83c6-7bf9-42d3-8fee-56d518e941d9', '30b1db82-829d-4fbc-945d-b84d4f097aca');


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--



--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: oidc_keycloak
--

INSERT INTO public.web_origins (client_id, value) VALUES ('200a4c48-e013-4cab-93c3-5e4e0e0c2885', '+');
INSERT INTO public.web_origins (client_id, value) VALUES ('022e927e-db5e-4c54-9931-b648a7f7fb88', '+');
INSERT INTO public.web_origins (client_id, value) VALUES ('a2365734-8e69-494b-abf4-c445e57d9eea', 'http://localhost:51080');
INSERT INTO public.web_origins (client_id, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'http://localhost:5173/*');
INSERT INTO public.web_origins (client_id, value) VALUES ('d6f1071d-2a86-46bd-86a0-347dd8b715a8', 'http://localhost:5173');


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: oidc_keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: oidc_keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

GRANT ALL ON DATABASE oidc_keycloak TO oidc_keycloak;
GRANT ALL PRIVILEGES ON DATABASE oidc_keycloak TO oidc_keycloak;
