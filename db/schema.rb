# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_03_055044) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "action_mailbox_inbound_emails", id: { scale: 8 }, force: :cascade do |t|
    t.integer "status", scale: 4, default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", id: { scale: 8 }, force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", scale: 4, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", id: { scale: 8 }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", scale: 8, null: false
    t.bigint "blob_id", scale: 8, null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: { scale: 8 }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", scale: 8, null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.string "service_name"
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "blob_id", scale: 8
    t.string "variation_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blob_id"], name: "index_active_storage_variant_records_on_blob_id"
  end

  create_table "agential_agencies", id: { scale: 8 }, force: :cascade do |t|
    t.string "relation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id", scale: 8
    t.bigint "agent_id", scale: 8
    t.decimal "commission_ratio", limit: 2, precision: 4, comment: "交易时抽成比例"
    t.string "note", comment: "备注"
  end

  create_table "attend_absence_stats", id: { scale: 8 }, force: :cascade do |t|
    t.string "year"
    t.float "annual_days"
    t.float "annual_add"
    t.float "left_annual_days"
    t.float "vacation_days"
    t.string "details", scale: 1024
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_id", scale: 8
    t.index ["member_id"], name: "index_attend_absence_stats_on_member_id"
  end

  create_table "attend_absences", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "merged_id", scale: 8
    t.string "type"
    t.string "state", default: "init"
    t.float "hours", default: 0.0
    t.string "kind"
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.string "note", scale: 2048
    t.string "comment", scale: 2048
    t.boolean "redeeming"
    t.string "redeeming_days", array: true
    t.boolean "processed"
    t.boolean "divided"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_attend_absences_on_member_id"
    t.index ["merged_id"], name: "index_attend_absences_on_merged_id"
  end

  create_table "attend_attendance_logs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "attendance_id", scale: 8
    t.string "source", default: "machine"
    t.string "state", default: "init"
    t.string "name"
    t.datetime "record_at", precision: nil
    t.boolean "processed"
    t.string "kind"
    t.string "note"
    t.string "record_at_str"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
    t.index ["attendance_id"], name: "index_attend_attendance_logs_on_attendance_id"
    t.index ["member_id"], name: "index_attend_attendance_logs_on_member_id"
  end

  create_table "attend_attendance_settings", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.string "state", default: "init"
    t.string "on_time", default: "08:30"
    t.string "off_time"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "effect_on"
    t.date "expire_on"
    t.index ["member_id"], name: "index_attend_attendance_settings_on_member_id"
  end

  create_table "attend_attendance_stats", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "financial_month_id", scale: 8
    t.string "costed_absence", scale: 1024
    t.string "redeeming_absence", scale: 1024
    t.string "free_absence", scale: 1024
    t.integer "allowance_days", scale: 4
    t.integer "late_days", scale: 4
    t.float "absence_redeeming_hours"
    t.float "cost_absence_hours"
    t.float "holiday_redeeming_hours"
    t.boolean "processed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["financial_month_id"], name: "index_attend_attendance_stats_on_financial_month_id"
    t.index ["member_id"], name: "index_attend_attendance_stats_on_member_id"
  end

  create_table "attend_attendances", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "interval_absence_id", scale: 8
    t.bigint "late_absence_id", scale: 8
    t.bigint "leave_absence_id", scale: 8
    t.integer "late_minutes", scale: 4
    t.integer "leave_minutes", scale: 4
    t.float "overtime_hours"
    t.float "attend_hours"
    t.float "interval_hours"
    t.float "total_hours"
    t.date "attend_on"
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.datetime "interval_start_at", precision: nil
    t.datetime "interval_finish_at", precision: nil
    t.string "kind"
    t.integer "absence_minutes", scale: 4
    t.boolean "absence_redeeming"
    t.string "lost_logs", array: true
    t.boolean "workday", default: true
    t.boolean "processed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interval_absence_id"], name: "index_attend_attendances_on_interval_absence_id"
    t.index ["late_absence_id"], name: "index_attend_attendances_on_late_absence_id"
    t.index ["leave_absence_id"], name: "index_attend_attendances_on_leave_absence_id"
    t.index ["member_id"], name: "index_attend_attendances_on_member_id"
  end

  create_table "attend_extra_days", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.date "the_day"
    t.string "name"
    t.string "kind", comment: "holiday, workday"
    t.string "scope"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_attend_extra_days_on_organ_id"
  end

  create_table "attend_financial_months", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.date "begin_date"
    t.date "end_date"
    t.string "working_days"
    t.string "color", default: "#8fdf82"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_attend_financial_months_on_organ_id"
  end

  create_table "attend_overtimes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.string "note", scale: 1024
    t.string "comment", scale: 1024
    t.float "hours"
    t.string "state", default: "init"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_attend_overtimes_on_member_id"
  end

  create_table "auditor_approvals", id: { scale: 8 }, force: :cascade do |t|
    t.string "approving_type"
    t.bigint "approving_id", scale: 8
    t.string "operator_type"
    t.bigint "operator_id", scale: 8
    t.string "state", default: "init"
    t.boolean "approved"
    t.json "pending_changes", default: {}
    t.json "related_changes", default: {}
    t.string "comment"
    t.datetime "approved_at", precision: nil
    t.integer "unapproved_approvals_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approving_type", "approving_id"], name: "index_auditor_approvals_on_approving_type_and_approving_id"
    t.index ["operator_type", "operator_id"], name: "index_auditor_approvals_on_operator_type_and_operator_id"
  end

  create_table "auditor_audits", id: { scale: 8 }, force: :cascade do |t|
    t.string "audited_type"
    t.bigint "audited_id", scale: 8
    t.string "operator_type"
    t.bigint "operator_id", scale: 8
    t.string "action", default: "update"
    t.json "audited_changes", default: {}
    t.json "related_changes", default: {}
    t.json "extra", default: {}
    t.string "note", scale: 1024
    t.string "remote_ip"
    t.string "controller_path"
    t.string "action_name"
    t.datetime "created_at", precision: nil, null: false
    t.index ["audited_type", "audited_id"], name: "index_auditor_audits_on_audited_type_and_audited_id"
    t.index ["created_at"], name: "index_auditor_audits_on_created_at"
    t.index ["operator_type", "operator_id"], name: "index_auditor_audits_on_operator_type_and_operator_id"
  end

  create_table "auditor_verifications", id: { scale: 8 }, force: :cascade do |t|
    t.string "verified_type"
    t.bigint "verified_id", scale: 8
    t.bigint "verifier_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.string "state"
    t.string "note"
    t.integer "position", scale: 4
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_title_id"], name: "index_auditor_verifications_on_job_title_id"
    t.index ["member_id"], name: "index_auditor_verifications_on_member_id"
    t.index ["verified_type", "verified_id"], name: "index_verifications_on_verified"
    t.index ["verifier_id"], name: "index_auditor_verifications_on_verifier_id"
  end

  create_table "auditor_verifiers", id: { scale: 8 }, force: :cascade do |t|
    t.string "verifiable_type"
    t.bigint "verifiable_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.string "name"
    t.integer "position", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_title_id"], name: "index_auditor_verifiers_on_job_title_id"
    t.index ["member_id"], name: "index_auditor_verifiers_on_member_id"
    t.index ["verifiable_type", "verifiable_id"], name: "index_verifiers_on_verifiable"
  end

  create_table "auth_accounts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "type"
    t.string "identity"
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source"
    t.index ["user_id"], name: "index_auth_accounts_on_user_id"
  end

  create_table "auth_apps", id: { scale: 8 }, force: :cascade do |t|
    t.string "appid"
    t.string "jwt_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_auth_apps_on_appid"
  end

  create_table "auth_authorized_tokens", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.string "identity"
    t.datetime "expire_at"
    t.integer "access_counter", scale: 4
    t.boolean "mock_member"
    t.boolean "mock_user"
    t.string "business"
    t.string "uid"
    t.string "session_id"
    t.string "suite_id"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "corp_userid"
    t.bigint "user_id", scale: 8
    t.index ["identity"], name: "index_auth_authorized_tokens_on_identity"
    t.index ["member_id"], name: "index_auth_authorized_tokens_on_member_id"
    t.index ["user_id"], name: "index_auth_authorized_tokens_on_user_id"
  end

  create_table "auth_disposable_tokens", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "identity"
    t.datetime "used_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identity"], name: "index_auth_disposable_tokens_on_identity"
  end

  create_table "auth_oauth_users", id: { scale: 8 }, force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "avatar_url"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "type"
    t.string "access_token"
    t.string "refresh_token"
    t.string "unionid"
    t.string "appid"
    t.datetime "expires_at", precision: nil
    t.string "state"
    t.json "extra", default: {}
    t.string "identity"
    t.bigint "user_inviter_id", scale: 8
    t.string "remark"
    t.datetime "unsubscribe_at"
    t.bigint "user_id", scale: 8
    t.string "scope"
    t.string "session_key"
    t.boolean "agency_oauth"
    t.index ["user_id"], name: "index_auth_oauth_users_on_user_id"
    t.index ["user_inviter_id"], name: "index_auth_oauth_users_on_user_inviter_id"
  end

  create_table "auth_user_taggeds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_tag_id", scale: 8
    t.bigint "user_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_auth_user_taggeds_on_user_id"
    t.index ["user_tag_id"], name: "index_auth_user_taggeds_on_user_tag_id"
  end

  create_table "auth_user_tags", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.integer "user_taggeds_count", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_tagging_type"
    t.bigint "user_tagging_id", scale: 8
    t.index ["organ_id"], name: "index_auth_user_tags_on_organ_id"
    t.index ["user_tagging_type", "user_tagging_id"], name: "index_user_tags_on_user_tagging"
  end

  create_table "auth_verify_tokens", id: { scale: 8 }, force: :cascade do |t|
    t.string "type", scale: 100
    t.string "token"
    t.datetime "expire_at", precision: nil
    t.string "identity"
    t.integer "access_counter", scale: 4, default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "bench_facilitate_indicators", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "facilitate_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.bigint "indicator_id", scale: 8
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_facilitate_indicators_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_bench_facilitate_indicators_on_facilitate_taxon_id"
    t.index ["indicator_id"], name: "index_bench_facilitate_indicators_on_indicator_id"
  end

  create_table "bench_facilitate_providers", id: { scale: 8 }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "facilitate_id", scale: 8
    t.bigint "provider_id", scale: 8
    t.boolean "selected"
    t.string "note"
    t.decimal "export_price"
    t.index ["facilitate_id"], name: "index_bench_facilitate_providers_on_facilitate_id"
    t.index ["provider_id"], name: "index_bench_facilitate_providers_on_provider_id"
  end

  create_table "bench_facilitate_taxon_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "facilitate_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "facilitate_taxon_desc_idx"
  end

  create_table "bench_facilitate_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4, default: 0
    t.integer "facilitates_count", scale: 4, default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "parent_id", scale: 8
    t.json "parent_ancestors"
    t.string "color"
    t.string "description"
    t.integer "indicators_count", scale: 4, default: 0
    t.bigint "taxon_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_bench_facilitate_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_bench_facilitate_taxons_on_parent_id"
    t.index ["taxon_id"], name: "index_bench_facilitate_taxons_on_taxon_id"
  end

  create_table "bench_facilitates", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "facilitate_taxon_id", scale: 8
    t.decimal "price", limit: 2, precision: 10
    t.string "sku"
    t.string "qr_prefix"
    t.decimal "quantity"
    t.string "unit"
    t.boolean "published", default: true
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.decimal "unified_quantity", default: "1.0"
    t.decimal "import_price", default: "0.0"
    t.decimal "profit_price", default: "0.0"
    t.string "good_type"
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.bigint "organ_id", scale: 8
    t.bigint "standard_id", scale: 8
    t.index ["facilitate_taxon_id"], name: "index_bench_facilitates_on_facilitate_taxon_id"
    t.index ["organ_id"], name: "index_bench_facilitates_on_organ_id"
    t.index ["standard_id"], name: "index_bench_facilitates_on_standard_id"
  end

  create_table "bench_facilitatings", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "facilitate_id", scale: 8
    t.bigint "facilitator_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "wallet_payment_id", scale: 8
    t.bigint "item_id", scale: 8
    t.datetime "start_at"
    t.datetime "finish_at"
    t.datetime "estimate_finish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_facilitatings_on_facilitate_id"
    t.index ["facilitator_id"], name: "index_bench_facilitatings_on_facilitator_id"
    t.index ["item_id"], name: "index_bench_facilitatings_on_item_id"
    t.index ["member_id"], name: "index_bench_facilitatings_on_member_id"
    t.index ["wallet_payment_id"], name: "index_bench_facilitatings_on_wallet_payment_id"
  end

  create_table "bench_facilitators", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "facilitate_id", scale: 8
    t.bigint "member_id", scale: 8
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_facilitators_on_facilitate_id"
    t.index ["member_id"], name: "index_bench_facilitators_on_member_id"
  end

  create_table "bench_indicators", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "unit"
    t.decimal "reference_min"
    t.decimal "reference_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "taxon_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.string "target_source"
    t.index ["facilitate_taxon_id"], name: "index_bench_indicators_on_facilitate_taxon_id"
    t.index ["taxon_id"], name: "index_bench_indicators_on_taxon_id"
  end

  create_table "bench_mileposts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.integer "position", scale: 4
    t.integer "project_mileposts_count", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_bench_mileposts_on_organ_id"
  end

  create_table "bench_project_facilitates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "project_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.bigint "facilitate_id", scale: 8
    t.bigint "provider_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_project_facilitates_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_bench_project_facilitates_on_facilitate_taxon_id"
    t.index ["project_id"], name: "index_bench_project_facilitates_on_project_id"
    t.index ["provider_id"], name: "index_bench_project_facilitates_on_provider_id"
  end

  create_table "bench_project_indicators", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "project_id", scale: 8
    t.bigint "indicator_id", scale: 8
    t.date "recorded_on"
    t.datetime "recorded_at", precision: nil
    t.string "value"
    t.string "source"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.index ["indicator_id"], name: "index_bench_project_indicators_on_indicator_id"
    t.index ["project_id"], name: "index_bench_project_indicators_on_project_id"
  end

  create_table "bench_project_mileposts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "project_id", scale: 8
    t.bigint "milepost_id", scale: 8
    t.date "recorded_on"
    t.boolean "current"
    t.string "milepost_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["milepost_id"], name: "index_bench_project_mileposts_on_milepost_id"
    t.index ["project_id"], name: "index_bench_project_mileposts_on_project_id"
  end

  create_table "bench_project_stages", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.date "begin_on"
    t.date "end_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.decimal "fund_budget"
    t.decimal "fund_expense"
    t.decimal "budget_amount"
    t.decimal "expense_amount"
    t.integer "projects_count", scale: 4
  end

  create_table "bench_project_webhooks", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "project_id", scale: 8
    t.json "origin_data"
    t.json "valuable_data"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["project_id"], name: "index_bench_project_webhooks_on_project_id"
  end

  create_table "bench_projects", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id", scale: 8
    t.bigint "taxon_id", scale: 8
    t.string "state"
    t.jsonb "extra"
    t.decimal "fund_expense"
    t.decimal "fund_budget"
    t.decimal "expense_amount"
    t.decimal "budget_amount"
    t.index ["organ_id"], name: "index_bench_projects_on_organ_id"
    t.index ["taxon_id"], name: "index_bench_projects_on_taxon_id"
  end

  create_table "bench_schedules", id: { scale: 8 }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bench_standard_providers", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "facilitate_id", scale: 8
    t.boolean "selected", default: false
    t.string "note"
    t.decimal "export_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_standard_providers_on_facilitate_id"
  end

  create_table "bench_task_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "task_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "task_desc_idx"
  end

  create_table "bench_task_template_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "task_template_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "task_template_desc_idx"
  end

  create_table "bench_task_templates", id: { scale: 8 }, force: :cascade do |t|
    t.string "title"
    t.integer "parent_id", scale: 4
    t.integer "position", scale: 4, default: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "taxon_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.bigint "member_id", scale: 8
    t.jsonb "parent_ancestors"
    t.string "color"
    t.bigint "department_id", scale: 8
    t.string "repeat_type", default: "once"
    t.integer "repeat_days", scale: 4, array: true
    t.index ["department_id"], name: "index_bench_task_templates_on_department_id"
    t.index ["job_title_id"], name: "index_bench_task_templates_on_job_title_id"
    t.index ["member_id"], name: "index_bench_task_templates_on_member_id"
    t.index ["organ_id"], name: "index_bench_task_templates_on_organ_id"
  end

  create_table "bench_task_timers", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "task_id", scale: 4
    t.integer "duration", scale: 4
    t.datetime "finish_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["task_id"], name: "index_bench_task_timers_on_task_id"
  end

  create_table "bench_tasks", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "title"
    t.integer "parent_id", scale: 4
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "state", default: "0"
    t.string "focus", default: "0"
    t.integer "position", scale: 4, default: 1
    t.integer "estimated_time", scale: 4
    t.integer "actual_time", scale: 4
    t.datetime "done_at", precision: nil
    t.integer "children_count", scale: 4, default: 0
    t.bigint "member_id", scale: 8
    t.bigint "user_id", scale: 8
    t.datetime "start_at", precision: nil
    t.json "parent_ancestors"
    t.bigint "organ_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.bigint "project_id", scale: 8
    t.bigint "task_template_id", scale: 8
    t.string "note"
    t.bigint "department_id", scale: 8
    t.string "serial_number", comment: "Task Template test repeat"
    t.decimal "cost_fund"
    t.integer "cost_stock", scale: 4
    t.date "deadline_on"
    t.index ["department_id"], name: "index_bench_tasks_on_department_id"
    t.index ["job_title_id"], name: "index_bench_tasks_on_job_title_id"
    t.index ["member_id"], name: "index_bench_tasks_on_member_id"
    t.index ["organ_id"], name: "index_bench_tasks_on_organ_id"
    t.index ["task_template_id"], name: "index_bench_tasks_on_task_template_id"
    t.index ["user_id"], name: "index_bench_tasks_on_user_id"
  end

  create_table "bench_taxon_facilitates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "taxon_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.bigint "facilitate_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_bench_taxon_facilitates_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_bench_taxon_facilitates_on_facilitate_taxon_id"
    t.index ["taxon_id"], name: "index_bench_taxon_facilitates_on_taxon_id"
  end

  create_table "bench_taxon_indicators", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "taxon_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.bigint "indicator_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_taxon_id"], name: "index_bench_taxon_indicators_on_facilitate_taxon_id"
    t.index ["indicator_id"], name: "index_bench_taxon_indicators_on_indicator_id"
    t.index ["taxon_id"], name: "index_bench_taxon_indicators_on_taxon_id"
  end

  create_table "bench_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.string "record_name"
    t.string "name"
    t.integer "projects_count", scale: 4, default: 0
    t.jsonb "parameters", default: {}
    t.decimal "fund_budget", default: "0.0"
    t.decimal "fund_expense", default: "0.0"
    t.decimal "budget_amount", default: "0.0"
    t.decimal "expense_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cms_audios", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "author_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.string "title"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_cms_audios_on_author_id"
    t.index ["organ_id"], name: "index_cms_audios_on_organ_id"
  end

  create_table "cms_carousels", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "title"
    t.integer "position", scale: 4
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_cms_carousels_on_organ_id"
  end

  create_table "cms_progressions", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "progressive_type"
    t.bigint "progressive_id", scale: 8
    t.decimal "ratio", comment: "完成比例"
    t.decimal "time"
    t.decimal "duration"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["progressive_type", "progressive_id"], name: "index_cms_progressions_on_progressive"
    t.index ["user_id"], name: "index_cms_progressions_on_user_id"
  end

  create_table "cms_videos", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "author_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.bigint "video_taxon_id", scale: 8
    t.string "title"
    t.integer "share_count", scale: 4
    t.integer "view_count", scale: 4
    t.integer "liked_count", scale: 4
    t.integer "comments_count", scale: 4
    t.string "water_mark_job"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_cms_videos_on_author_id"
    t.index ["organ_id"], name: "index_cms_videos_on_organ_id"
    t.index ["video_taxon_id"], name: "index_cms_videos_on_video_taxon_id"
  end

  create_table "com_acme_accounts", id: { scale: 8 }, force: :cascade do |t|
    t.string "email"
    t.string "kid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "ali_key"
    t.text "ali_secret"
  end

  create_table "com_acme_identifiers", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "acme_order_id", scale: 8
    t.string "identifier"
    t.string "file_name"
    t.string "file_content"
    t.string "record_name"
    t.string "record_content"
    t.string "domain"
    t.boolean "wildcard"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "status"
    t.string "type"
    t.index ["acme_order_id"], name: "index_com_acme_identifiers_on_acme_order_id"
  end

  create_table "com_acme_orders", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "acme_account_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "orderid"
    t.string "url"
    t.string "status"
    t.datetime "issued_at", precision: nil
    t.datetime "expire_at", comment: "过期时间"
    t.index ["acme_account_id"], name: "index_com_acme_orders_on_acme_account_id"
  end

  create_table "com_blob_defaults", id: { scale: 8 }, force: :cascade do |t|
    t.string "record_class", comment: "AR 类名，如 User"
    t.string "name", comment: "名称, attach 名称，如：avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "macro"
  end

  create_table "com_blob_temps", id: { scale: 8 }, force: :cascade do |t|
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_cache_lists", id: { scale: 8 }, force: :cascade do |t|
    t.string "path"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_csps", id: { scale: 8 }, force: :cascade do |t|
    t.string "document_uri"
    t.string "referrer"
    t.string "violated_directive"
    t.string "effective_directive"
    t.string "original_policy", scale: 1024
    t.string "disposition"
    t.string "blocked_uri"
    t.string "line_number"
    t.string "column_number"
    t.string "source_file"
    t.string "status_code"
    t.string "script_sample"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "com_debug_manies", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "debug_id", scale: 8
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debug_id"], name: "index_com_debug_manies_on_debug_id"
  end

  create_table "com_debugs", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state", default: "init"
  end

  create_table "com_err_summaries", id: { scale: 8 }, force: :cascade do |t|
    t.string "controller_name"
    t.string "action_name"
    t.string "exception_object"
    t.integer "errs_count", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_errs", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "path"
    t.string "controller_name"
    t.string "action_name"
    t.string "exception", scale: 10240
    t.string "exception_object"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "exception_backtrace", array: true
    t.string "ip"
    t.jsonb "headers"
    t.jsonb "params"
    t.jsonb "cookie"
    t.jsonb "session"
  end

  create_table "com_infos", id: { scale: 8 }, force: :cascade do |t|
    t.string "code"
    t.string "value"
    t.string "version"
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_meta_actions", id: { scale: 8 }, force: :cascade do |t|
    t.string "namespace_identifier", default: "", null: false
    t.string "business_identifier", default: "", null: false
    t.string "controller_path", null: false
    t.string "controller_name", null: false
    t.string "action_name"
    t.string "path"
    t.string "verb"
    t.string "required_parts", array: true
    t.integer "position", scale: 4
    t.boolean "landmark"
    t.string "operation", default: "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_identifier"], name: "index_com_meta_actions_on_business_identifier"
    t.index ["controller_path"], name: "index_com_meta_actions_on_controller_path"
    t.index ["namespace_identifier"], name: "index_com_meta_actions_on_namespace_identifier"
  end

  create_table "com_meta_businesses", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "identifier", default: "", null: false
    t.integer "position", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_com_meta_businesses_on_identifier"
  end

  create_table "com_meta_columns", id: { scale: 8 }, force: :cascade do |t|
    t.string "record_name"
    t.string "column_name"
    t.string "sql_type"
    t.string "column_type"
    t.integer "column_limit", scale: 4
    t.string "comment"
    t.boolean "defined_db"
    t.boolean "defined_model"
    t.boolean "belongs_enable"
    t.string "belongs_table"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_name"], name: "index_com_meta_columns_on_record_name"
  end

  create_table "com_meta_controllers", id: { scale: 8 }, force: :cascade do |t|
    t.string "namespace_identifier", default: "", null: false
    t.string "business_identifier", default: "", null: false
    t.string "controller_path", null: false
    t.string "controller_name", null: false
    t.integer "position", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_identifier"], name: "index_com_meta_controllers_on_business_identifier"
    t.index ["controller_path"], name: "index_com_meta_controllers_on_controller_path"
    t.index ["namespace_identifier"], name: "index_com_meta_controllers_on_namespace_identifier"
  end

  create_table "com_meta_models", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "record_name"
    t.string "description"
    t.boolean "defined_db"
    t.boolean "customizable", comment: "是否允许用户定制"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_name"], name: "index_com_meta_models_on_record_name"
  end

  create_table "com_meta_namespaces", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "identifier", default: "", null: false
    t.boolean "verify_organ"
    t.boolean "verify_member"
    t.boolean "verify_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_com_meta_namespaces_on_identifier"
  end

  create_table "com_meta_operations", id: { scale: 8 }, force: :cascade do |t|
    t.string "action_name"
    t.string "operation", default: "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "com_states", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.string "host"
    t.string "path"
    t.string "controller_path"
    t.string "action_name"
    t.string "request_method"
    t.string "referer"
    t.jsonb "params"
    t.jsonb "body"
    t.jsonb "cookie"
    t.jsonb "session"
    t.boolean "destroyable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_com_states_on_organ_id"
    t.index ["user_id"], name: "index_com_states_on_user_id"
  end

  create_table "crm_agencies", id: { scale: 8 }, force: :cascade do |t|
    t.string "agent_type"
    t.bigint "agent_id", scale: 8
    t.string "client_type"
    t.bigint "client_id", scale: 8
    t.string "relation", default: "unknown"
    t.decimal "commission_ratio", comment: "交易时抽成比例"
    t.string "note", comment: "备注"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_type", "agent_id"], name: "index_crm_agencies_on_agent"
    t.index ["client_type", "client_id"], name: "index_crm_agencies_on_client"
  end

  create_table "crm_maintain_logs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "maintain_id", scale: 8
    t.string "logged_type"
    t.bigint "logged_id", scale: 8
    t.bigint "maintain_tag_id", scale: 8
    t.string "note"
    t.string "tag_str"
    t.integer "tag_sequence", scale: 4
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["logged_type", "logged_id"], name: "index_crm_maintain_logs_on_logged"
    t.index ["maintain_id"], name: "index_crm_maintain_logs_on_maintain_id"
    t.index ["maintain_tag_id"], name: "index_crm_maintain_logs_on_maintain_tag_id"
    t.index ["member_id"], name: "index_crm_maintain_logs_on_member_id"
  end

  create_table "crm_maintain_sources", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "source_id", scale: 8
    t.string "name"
    t.integer "maintains_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_crm_maintain_sources_on_organ_id"
    t.index ["source_id"], name: "index_crm_maintain_sources_on_source_id"
  end

  create_table "crm_maintain_tags", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "tag_id", scale: 8
    t.string "name"
    t.string "logged_type"
    t.string "entity_column"
    t.string "entity_value"
    t.integer "sequence", scale: 4, default: 1
    t.boolean "manual", default: true
    t.string "color", default: "#2A92CA"
    t.integer "maintain_logs_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_crm_maintain_tags_on_organ_id"
    t.index ["tag_id"], name: "index_crm_maintain_tags_on_tag_id"
  end

  create_table "crm_maintains", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "task_template_id", scale: 8
    t.bigint "payment_strategy_id", scale: 8
    t.bigint "client_id", scale: 8
    t.string "agent_type"
    t.bigint "agent_id", scale: 8
    t.bigint "agency_id", scale: 8
    t.bigint "maintain_source_id", scale: 8
    t.bigint "upstream_id", scale: 8
    t.bigint "original_id", scale: 8
    t.integer "position", scale: 4
    t.integer "deposit_ratio", scale: 4, default: 100, comment: "最小预付比例"
    t.string "state", default: "init"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_user_id", scale: 8
    t.bigint "client_member_id", scale: 8
    t.integer "wallets_count", scale: 4, default: 0
    t.integer "cards_count", scale: 4, default: 0
    t.integer "orders_count", scale: 4, default: 0
    t.integer "addresses_count", scale: 4, default: 0
    t.string "type"
    t.string "remark"
    t.string "description"
    t.string "oper_userid"
    t.string "add_way"
    t.string "external_userid"
    t.string "pending_id"
    t.jsonb "remark_mobiles"
    t.integer "items_count", scale: 4
    t.integer "carts_count", scale: 4
    t.index ["agency_id"], name: "index_crm_maintains_on_agency_id"
    t.index ["agent_type", "agent_id"], name: "index_crm_maintains_on_agent"
    t.index ["client_member_id"], name: "index_crm_maintains_on_client_member_id"
    t.index ["client_user_id"], name: "index_crm_maintains_on_client_user_id"
    t.index ["maintain_source_id"], name: "index_crm_maintains_on_maintain_source_id"
    t.index ["member_id"], name: "index_crm_maintains_on_member_id"
    t.index ["organ_id"], name: "index_crm_maintains_on_organ_id"
    t.index ["original_id"], name: "index_crm_maintains_on_original_id"
    t.index ["payment_strategy_id"], name: "index_crm_maintains_on_payment_strategy_id"
    t.index ["task_template_id"], name: "index_crm_maintains_on_task_template_id"
    t.index ["upstream_id"], name: "index_crm_maintains_on_upstream_id"
  end

  create_table "crm_qrcodes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "source_id", scale: 8
    t.integer "margin_x", scale: 4, default: 0
    t.integer "margin_y", scale: 4, default: 0
    t.integer "fixed_width", scale: 4, default: 0
    t.string "align", default: "northwest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_crm_qrcodes_on_source_id"
  end

  create_table "crm_source_contacts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "maintain_source_id", scale: 8
    t.bigint "source_id", scale: 8
    t.bigint "contact_id", scale: 8
    t.bigint "trade_item_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_crm_source_contacts_on_contact_id"
    t.index ["maintain_source_id"], name: "index_crm_source_contacts_on_maintain_source_id"
    t.index ["organ_id"], name: "index_crm_source_contacts_on_organ_id"
    t.index ["source_id"], name: "index_crm_source_contacts_on_source_id"
    t.index ["trade_item_id"], name: "index_crm_source_contacts_on_trade_item_id"
  end

  create_table "crm_source_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "ancestor_id", scale: 8
    t.bigint "descendant_id", scale: 8
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "crm/source_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_crm_source_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_crm_source_hierarchies_on_descendant_id"
  end

  create_table "crm_sources", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "parent_id", scale: 8
    t.string "name"
    t.boolean "materialize", default: false
    t.integer "fixed_width", scale: 4, default: 0
    t.jsonb "parent_ancestors", default: {}
    t.string "sku"
    t.decimal "price", default: "0.0"
    t.decimal "advance_price", default: "0.0"
    t.jsonb "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.string "good_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.index ["parent_id"], name: "index_crm_sources_on_parent_id"
  end

  create_table "crm_tags", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "logged_type"
    t.string "entity_column"
    t.string "entity_value"
    t.string "color"
    t.integer "sequence", scale: 4, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crm_texts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "source_id", scale: 8
    t.string "note"
    t.integer "margin_x", scale: 4, default: 0
    t.integer "margin_y", scale: 4, default: 0
    t.string "font", default: "simsun"
    t.string "align", default: "northwest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_crm_texts_on_source_id"
  end

  create_table "datum_data_lists", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "title"
    t.string "comment", scale: 4096
    t.string "type"
    t.string "data_table"
    t.string "export_excel"
    t.string "export_pdf"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.jsonb "parameters"
    t.jsonb "columns"
    t.integer "x_position", scale: 4
  end

  create_table "datum_record_lists", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "data_list_id", scale: 4
    t.boolean "done"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.jsonb "parameters"
    t.jsonb "columns"
    t.index ["data_list_id"], name: "index_datum_record_lists_on_data_list_id"
  end

  create_table "datum_table_items", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "table_list_id", scale: 4
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "fields", array: true
    t.index ["table_list_id"], name: "index_datum_table_items_on_table_list_id"
  end

  create_table "datum_table_lists", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "data_list_id", scale: 4
    t.integer "table_items_count", scale: 4, default: 0
    t.string "timestamp"
    t.boolean "done"
    t.boolean "published"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "headers", array: true
    t.string "footers", array: true
    t.jsonb "parameters"
    t.jsonb "extra", default: {}
    t.index ["data_list_id"], name: "index_datum_table_lists_on_data_list_id"
  end

  create_table "detail_contents", id: { scale: 8 }, force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.text "body"
    t.integer "position", scale: 4, default: 0
    t.string "list", scale: 50
    t.bigint "detail_id", scale: 8
    t.bigint "author_id", scale: 8
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "detail_type"
    t.index ["author_id"], name: "index_detail_contents_on_author_id"
    t.index ["detail_id"], name: "index_detail_contents_on_detail_id"
  end

  create_table "detail_entity_items", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "list_id", scale: 8
    t.bigint "item_id", scale: 8
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "value"
    t.string "entity_type"
    t.bigint "entity_id", scale: 8
    t.bigint "taxon_item_id", scale: 8
    t.index ["entity_type", "entity_id"], name: "index_detail_entity_items_on_entity_type_and_entity_id"
    t.index ["item_id"], name: "index_detail_entity_items_on_item_id"
    t.index ["list_id"], name: "index_detail_entity_items_on_list_id"
    t.index ["taxon_item_id"], name: "index_detail_entity_items_on_taxon_item_id"
  end

  create_table "detail_items", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "key"
    t.string "description", scale: 1024
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "list_id", scale: 8
    t.index ["list_id"], name: "index_detail_items_on_list_id"
  end

  create_table "detail_knowings", id: { scale: 8 }, force: :cascade do |t|
    t.string "knowable_type"
    t.bigint "knowable_id", scale: 8
    t.bigint "knowledge_id", scale: 8
    t.boolean "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["knowable_type", "knowable_id"], name: "index_detail_knowings_on_knowable_type_and_knowable_id"
    t.index ["knowledge_id"], name: "index_detail_knowings_on_knowledge_id"
  end

  create_table "detail_knowledge_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "knowledge_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "knowledge_desc_idx"
  end

  create_table "detail_knowledges", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "parent_id", scale: 8
    t.string "title"
    t.text "body"
    t.integer "position", scale: 4
    t.json "parent_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_detail_knowledges_on_parent_id"
  end

  create_table "detail_lists", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4
    t.integer "items_count", scale: 4, default: 0
    t.integer "status", scale: 4, default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_detail_lists_on_organ_id"
  end

  create_table "detail_post_syncs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "post_id", scale: 8
    t.string "synced_type"
    t.bigint "synced_id", scale: 8
    t.datetime "synced_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source_id"
    t.index ["post_id"], name: "index_detail_post_syncs_on_post_id"
    t.index ["synced_type", "synced_id"], name: "index_detail_post_syncs_on_synced_type_and_synced_id"
  end

  create_table "detail_posts", id: { scale: 8 }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "title"
    t.string "content"
    t.string "link"
    t.string "html"
    t.bigint "organ_id", scale: 8
    t.string "thumb_media_id"
    t.index ["organ_id"], name: "index_detail_posts_on_organ_id"
  end

  create_table "detail_taxon_items", id: { scale: 8 }, force: :cascade do |t|
    t.string "taxon_type"
    t.bigint "taxon_id", scale: 8
    t.bigint "list_id", scale: 8
    t.bigint "item_id", scale: 8
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "default_value"
    t.index ["item_id"], name: "index_detail_taxon_items_on_item_id"
    t.index ["list_id"], name: "index_detail_taxon_items_on_list_id"
    t.index ["taxon_type", "taxon_id"], name: "index_detail_taxon_items_on_taxon_type_and_taxon_id"
  end

  create_table "doc_maps", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.jsonb "mappings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doc_subjects", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "rule_id", scale: 8
    t.string "name"
    t.jsonb "path_params"
    t.jsonb "request_params"
    t.jsonb "request_headers"
    t.string "request_type"
    t.jsonb "request_body"
    t.string "response_status"
    t.jsonb "response_headers"
    t.string "response_type"
    t.string "response_body"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rule_id"], name: "index_doc_subjects_on_rule_id"
  end

  create_table "email_logs", id: { scale: 8 }, force: :cascade do |t|
    t.string "message_object_id"
    t.string "mailer"
    t.string "action_name"
    t.string "params"
    t.string "subject"
    t.string "mail_to"
    t.string "cc_to"
    t.string "sent_status"
    t.string "sent_string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "template_id", scale: 8
    t.string "mail_from"
    t.index ["template_id"], name: "index_email_logs_on_template_id"
  end

  create_table "email_reasons", id: { scale: 8 }, force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_smtp_accounts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "smtp_id", scale: 8
    t.string "user_name"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", scale: 4
    t.index ["smtp_id"], name: "index_email_smtp_accounts_on_smtp_id"
  end

  create_table "email_smtps", id: { scale: 8 }, force: :cascade do |t|
    t.string "address"
    t.string "port"
    t.boolean "enable_starttls_auto"
    t.boolean "ssl"
    t.string "authentication"
    t.string "openssl_verify_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_subscriptions", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "smtp_id", scale: 8
    t.bigint "smtp_account_id", scale: 8
    t.string "address"
    t.string "state"
    t.datetime "subscribe_at", precision: nil
    t.datetime "unsubscribe_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "reason_id", scale: 8
    t.index ["reason_id"], name: "index_email_subscriptions_on_reason_id"
    t.index ["smtp_account_id"], name: "index_email_subscriptions_on_smtp_account_id"
    t.index ["smtp_id"], name: "index_email_subscriptions_on_smtp_id"
  end

  create_table "email_templates", id: { scale: 8 }, force: :cascade do |t|
    t.string "honorific"
    t.string "body"
    t.string "order_prefix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", scale: 4
    t.string "contact"
    t.string "subject"
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_email_templates_on_organ_id"
  end

  create_table "event_participants", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "event_id", scale: 8
    t.string "participant_type"
    t.bigint "participant_id", scale: 8
    t.string "state"
    t.integer "score", scale: 4
    t.string "comment", scale: 4096
    t.string "quit_note"
    t.string "assigned_status"
    t.string "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_crowd_id", scale: 8
    t.integer "crowd_member_id", scale: 4
    t.index ["event_crowd_id"], name: "index_event_participants_on_event_crowd_id"
    t.index ["event_id"], name: "index_event_participants_on_event_id"
    t.index ["participant_type", "participant_id"], name: "index_event_participants_on_participant_type_and_participant_id"
  end

  create_table "eventual_bookings", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "booker_type"
    t.integer "booker_id", scale: 4
    t.string "booked_type"
    t.integer "booked_id", scale: 4
    t.integer "plan_item_id", scale: 4
    t.integer "time_item_id", scale: 4
    t.integer "place_id", scale: 4
    t.date "booking_on"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "seat_id", scale: 8
    t.index ["booked_type", "booked_id"], name: "index_eventual_bookings_on_booked_type_and_booked_id"
    t.index ["booker_type", "booker_id"], name: "index_eventual_bookings_on_booker_type_and_booker_id"
    t.index ["place_id"], name: "index_eventual_bookings_on_place_id"
    t.index ["plan_item_id"], name: "index_eventual_bookings_on_plan_item_id"
    t.index ["seat_id"], name: "index_eventual_bookings_on_seat_id"
    t.index ["time_item_id"], name: "index_eventual_bookings_on_time_item_id"
  end

  create_table "eventual_crowd_members", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "crowd_id", scale: 8
    t.string "member_type"
    t.bigint "member_id", scale: 8
    t.bigint "agency_id", scale: 8
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_eventual_crowd_members_on_agency_id"
    t.index ["crowd_id"], name: "index_eventual_crowd_members_on_crowd_id"
    t.index ["member_type", "member_id"], name: "index_eventual_crowd_members_on_member_type_and_member_id"
  end

  create_table "eventual_crowds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "member_type"
    t.integer "crowd_members_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_eventual_crowds_on_organ_id"
  end

  create_table "eventual_event_crowds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "event_id", scale: 8
    t.bigint "crowd_id", scale: 8
    t.integer "present_number", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crowd_id"], name: "index_eventual_event_crowds_on_crowd_id"
    t.index ["event_id"], name: "index_eventual_event_crowds_on_event_id"
  end

  create_table "eventual_event_grants", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "event_id", scale: 8
    t.string "grant_kind"
    t.string "grant_column"
    t.jsonb "filter", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_eventual_event_grants_on_event_id"
  end

  create_table "eventual_event_items", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "event_id", scale: 8
    t.string "name"
    t.bigint "author_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_eventual_event_items_on_author_id"
    t.index ["event_id"], name: "index_eventual_event_items_on_event_id"
  end

  create_table "eventual_event_participants", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "event_crowd_id", scale: 8
    t.bigint "event_id", scale: 8
    t.bigint "crowd_member_id", scale: 8
    t.string "participant_type"
    t.bigint "participant_id", scale: 8
    t.integer "score", scale: 4
    t.string "comment"
    t.string "quit_note"
    t.string "assigned_status"
    t.string "job_id"
    t.string "state", default: "in_studying"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crowd_member_id"], name: "index_eventual_event_participants_on_crowd_member_id"
    t.index ["event_crowd_id"], name: "index_eventual_event_participants_on_event_crowd_id"
    t.index ["event_id"], name: "index_eventual_event_participants_on_event_id"
    t.index ["participant_type", "participant_id"], name: "index_eventual_event_participants_on_participant"
  end

  create_table "eventual_event_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_eventual_event_taxons_on_organ_id"
  end

  create_table "eventual_events", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "event_taxon_id", scale: 8
    t.string "name"
    t.string "description", scale: 4096
    t.integer "position", scale: 4
    t.integer "event_items_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.decimal "price", limit: 2, precision: 10
    t.integer "event_participants_count", scale: 4, default: 0
    t.integer "members_count", scale: 4, default: 0
    t.index ["event_taxon_id"], name: "index_eventual_events_on_event_taxon_id"
    t.index ["organ_id"], name: "index_eventual_events_on_organ_id"
  end

  create_table "eventual_place_taxon_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "place_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "place_taxon_desc_idx"
  end

  create_table "eventual_place_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "parent_id", scale: 8
    t.string "name"
    t.integer "position", scale: 4
    t.decimal "profit_margin", limit: 2, precision: 4
    t.jsonb "parent_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "places_count", scale: 4
    t.index ["organ_id"], name: "index_eventual_place_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_eventual_place_taxons_on_parent_id"
  end

  create_table "eventual_places", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "place_taxon_id", scale: 8
    t.string "description"
    t.bigint "area_id", scale: 8
    t.integer "seats_count", scale: 4, default: 0
    t.integer "plans_count", scale: 4, default: 0
    t.jsonb "place_taxon_ancestors"
    t.index ["area_id"], name: "index_eventual_places_on_area_id"
    t.index ["organ_id"], name: "index_eventual_places_on_organ_id"
    t.index ["place_taxon_id"], name: "index_eventual_places_on_place_taxon_id"
  end

  create_table "eventual_plan_attenders", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "plan_item_id", scale: 4
    t.string "attender_type"
    t.integer "attender_id", scale: 4
    t.integer "place_id", scale: 4
    t.boolean "attended"
    t.string "state"
    t.jsonb "extra"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "plan_participant_id", scale: 8
    t.bigint "plan_id", scale: 8
    t.index ["attender_type", "attender_id"], name: "index_eventual_plan_attenders_on_attender_type_and_attender_id"
    t.index ["place_id"], name: "index_eventual_plan_attenders_on_place_id"
    t.index ["plan_id"], name: "index_eventual_plan_attenders_on_plan_id"
    t.index ["plan_item_id"], name: "index_eventual_plan_attenders_on_plan_item_id"
    t.index ["plan_participant_id"], name: "index_eventual_plan_attenders_on_plan_participant_id"
  end

  create_table "eventual_plan_items", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "plan_id", scale: 4
    t.integer "time_item_id", scale: 4
    t.integer "place_id", scale: 4
    t.date "plan_on"
    t.string "repeat_index"
    t.integer "bookings_count", scale: 4, default: 0
    t.jsonb "extra"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "time_list_id", scale: 8
    t.string "planned_type"
    t.bigint "planned_id", scale: 8
    t.bigint "event_id", scale: 8
    t.bigint "event_item_id", scale: 8
    t.integer "plan_participants_count", scale: 4, default: 0
    t.index ["event_id"], name: "index_eventual_plan_items_on_event_id"
    t.index ["event_item_id"], name: "index_eventual_plan_items_on_event_item_id"
    t.index ["place_id"], name: "index_eventual_plan_items_on_place_id"
    t.index ["planned_type", "planned_id"], name: "index_eventual_plan_items_on_planned_type_and_planned_id"
    t.index ["time_item_id"], name: "index_eventual_plan_items_on_time_item_id"
    t.index ["time_list_id"], name: "index_eventual_plan_items_on_time_list_id"
  end

  create_table "eventual_plan_participants", id: { scale: 8 }, force: :cascade do |t|
    t.string "planning_type"
    t.bigint "planning_id", scale: 8
    t.bigint "event_participant_id", scale: 8
    t.string "participant_type"
    t.bigint "participant_id", scale: 8
    t.string "type"
    t.string "status", comment: "默认 event_participant 有效"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_participant_id"], name: "index_eventual_plan_participants_on_event_participant_id"
    t.index ["participant_type", "participant_id"], name: "index_eventual_plan_participants_on_participant"
    t.index ["planning_type", "planning_id"], name: "index_eventual_plan_participants_on_planning"
  end

  create_table "eventual_plans", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "time_list_id", scale: 4
    t.string "planned_type"
    t.integer "planned_id", scale: 4
    t.integer "place_id", scale: 4
    t.date "begin_on"
    t.date "end_on"
    t.string "repeat_type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "repeat_count", scale: 4
    t.jsonb "repeat_days"
    t.string "title"
    t.date "produced_begin_on"
    t.date "produced_end_on"
    t.boolean "produce_done"
    t.index ["place_id"], name: "index_eventual_plans_on_place_id"
    t.index ["planned_type", "planned_id"], name: "index_eventual_plans_on_planned_type_and_planned_id"
    t.index ["time_list_id"], name: "index_eventual_plans_on_time_list_id"
  end

  create_table "eventual_seats", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "place_id", scale: 8
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_members", scale: 4, default: 1
    t.integer "max_members", scale: 4
    t.index ["place_id"], name: "index_eventual_seats_on_place_id"
  end

  create_table "eventual_time_items", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "time_list_id", scale: 4
    t.time "start_at"
    t.time "finish_at"
    t.integer "position", scale: 4, default: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["time_list_id"], name: "index_eventual_time_items_on_time_list_id"
  end

  create_table "eventual_time_lists", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "interval_minutes", scale: 4, default: 0
    t.integer "item_minutes", scale: 4, default: 45
    t.boolean "default"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id", scale: 8
    t.string "kind"
    t.index ["organ_id"], name: "index_eventual_time_lists_on_organ_id"
  end

  create_table "factory_brands", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "code"
    t.integer "products_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_brands_on_organ_id"
  end

  create_table "factory_factory_providers", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "factory_taxon_id", scale: 8
    t.bigint "provider_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["factory_taxon_id"], name: "index_factory_factory_providers_on_factory_taxon_id"
    t.index ["provider_id"], name: "index_factory_factory_providers_on_provider_id"
  end

  create_table "factory_factory_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "scene_id", scale: 8
    t.integer "factory_providers_count", scale: 4
    t.index ["scene_id"], name: "index_factory_factory_taxons_on_scene_id"
  end

  create_table "factory_fits", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.bigint "production_id", scale: 8
    t.bigint "part_brand_id", scale: 8
    t.bigint "part_serial_id", scale: 8
    t.bigint "part_product_id", scale: 8
    t.bigint "part_production_id", scale: 8
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_brand_id"], name: "index_factory_fits_on_part_brand_id"
    t.index ["part_product_id"], name: "index_factory_fits_on_part_product_id"
    t.index ["part_production_id"], name: "index_factory_fits_on_part_production_id"
    t.index ["part_serial_id"], name: "index_factory_fits_on_part_serial_id"
    t.index ["product_id"], name: "index_factory_fits_on_product_id"
    t.index ["production_id"], name: "index_factory_fits_on_production_id"
  end

  create_table "factory_part_items", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "part_id", scale: 8
    t.bigint "product_item_id", scale: 8
    t.string "qr_code"
    t.string "state"
    t.datetime "received_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["part_id"], name: "index_factory_part_items_on_part_id"
    t.index ["product_item_id"], name: "index_factory_part_items_on_product_item_id"
  end

  create_table "factory_part_plans", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "part_id", scale: 8
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.string "state"
    t.integer "purchased_count", scale: 4, default: 0
    t.integer "received_count", scale: 4, default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "product_id", scale: 8
    t.bigint "production_id", scale: 8
    t.index ["part_id"], name: "index_factory_part_plans_on_part_id"
    t.index ["product_id"], name: "index_factory_part_plans_on_product_id"
    t.index ["production_id"], name: "index_factory_part_plans_on_production_id"
  end

  create_table "factory_part_providers", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.bigint "production_id", scale: 8
    t.bigint "provider_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.boolean "verified"
    t.boolean "selected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "upstream_product_id", scale: 8
    t.bigint "upstream_production_id", scale: 8
    t.decimal "cost_price"
    t.index ["organ_id"], name: "index_factory_part_providers_on_organ_id"
    t.index ["product_id"], name: "index_factory_part_providers_on_product_id"
    t.index ["production_id"], name: "index_factory_part_providers_on_production_id"
    t.index ["provider_id"], name: "index_factory_part_providers_on_provider_id"
    t.index ["upstream_product_id"], name: "index_factory_part_providers_on_upstream_product_id"
    t.index ["upstream_production_id"], name: "index_factory_part_providers_on_upstream_production_id"
  end

  create_table "factory_part_taxon_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "part_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "part_taxon_desc_idx"
  end

  create_table "factory_part_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4, default: 1
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id", scale: 8
    t.boolean "take_stock", comment: "可盘点"
    t.bigint "factory_taxon_id", scale: 8
    t.integer "parts_count", scale: 4, default: 0
    t.index ["factory_taxon_id"], name: "index_factory_part_taxons_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_part_taxons_on_organ_id"
  end

  create_table "factory_parts", id: { scale: 8 }, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "factory_produce_plans", id: { scale: 8 }, force: :cascade do |t|
    t.string "title"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.bigint "scene_id", scale: 8
    t.date "produce_on"
    t.integer "serial_number", scale: 4
    t.datetime "book_finish_at"
    t.datetime "book_start_at"
    t.integer "production_plans_count", scale: 4, default: 0
    t.index ["organ_id"], name: "index_factory_produce_plans_on_organ_id"
    t.index ["scene_id"], name: "index_factory_produce_plans_on_scene_id"
  end

  create_table "factory_produces", id: { scale: 8 }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "content"
  end

  create_table "factory_product_hosts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "product_id", scale: 8
    t.decimal "profit_margin", default: "0.0"
    t.decimal "min_price"
    t.decimal "max_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_product_hosts_on_organ_id"
    t.index ["product_id"], name: "index_factory_product_hosts_on_product_id"
  end

  create_table "factory_product_part_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.bigint "part_taxon_id", scale: 8
    t.string "name"
    t.integer "min_select", scale: 4, default: 1
    t.integer "max_select", scale: 4, default: 1, comment: "最大同时选择，1则为单选"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_parts_count", scale: 4, default: 0
    t.index ["part_taxon_id"], name: "index_factory_product_part_taxons_on_part_taxon_id"
    t.index ["product_id"], name: "index_factory_product_part_taxons_on_product_id"
  end

  create_table "factory_product_parts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.bigint "part_id", scale: 8
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "part_taxon_id", scale: 8
    t.boolean "default"
    t.index ["part_id"], name: "index_factory_product_parts_on_part_id"
    t.index ["part_taxon_id"], name: "index_factory_product_parts_on_part_taxon_id"
    t.index ["product_id"], name: "index_factory_product_parts_on_product_id"
  end

  create_table "factory_product_plans", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.string "state"
    t.integer "planned_count", scale: 4, default: 0
    t.integer "produced_count", scale: 4, default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "produce_plan_id", scale: 8
    t.index ["produce_plan_id"], name: "index_factory_product_plans_on_produce_plan_id"
    t.index ["product_id"], name: "index_factory_product_plans_on_product_id"
  end

  create_table "factory_product_produces", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.bigint "produce_id", scale: 8
    t.integer "position", scale: 4
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produce_id"], name: "index_factory_product_produces_on_produce_id"
    t.index ["product_id"], name: "index_factory_product_produces_on_product_id"
  end

  create_table "factory_product_taxon_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "product_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "product_taxon_desc_idx"
  end

  create_table "factory_product_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4, default: 1
    t.bigint "parent_id", scale: 8
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id", scale: 8
    t.json "parent_ancestors"
    t.bigint "factory_taxon_id", scale: 8
    t.integer "products_count", scale: 4, default: 0
    t.boolean "enabled", default: true
    t.bigint "template_id", scale: 8
    t.bigint "scene_id", scale: 8
    t.boolean "take_stock", comment: "可盘点"
    t.boolean "partial", default: false
    t.integer "provides_count", scale: 4
    t.boolean "nav", comment: "单独分类"
    t.index ["factory_taxon_id"], name: "index_factory_product_taxons_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_product_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_factory_product_taxons_on_parent_id"
    t.index ["scene_id"], name: "index_factory_product_taxons_on_scene_id"
    t.index ["template_id"], name: "index_factory_product_taxons_on_template_id"
  end

  create_table "factory_production_carts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "cart_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "product_id", scale: 8
    t.bigint "production_id", scale: 8
    t.string "state", default: "init"
    t.datetime "customized_at", precision: nil
    t.decimal "original_price", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_factory_production_carts_on_cart_id"
    t.index ["product_id"], name: "index_factory_production_carts_on_product_id"
    t.index ["production_id"], name: "index_factory_production_carts_on_production_id"
    t.index ["user_id"], name: "index_factory_production_carts_on_user_id"
  end

  create_table "factory_production_items", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "production_id", scale: 8
    t.string "state", default: "producing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "production_plan_id", scale: 8
    t.bigint "product_item_id", scale: 8
    t.datetime "came_at"
    t.string "code"
    t.bigint "grid_id", scale: 8
    t.bigint "room_id", scale: 8
    t.bigint "building_id", scale: 8
    t.bigint "station_id", scale: 8
    t.index ["building_id"], name: "index_factory_production_items_on_building_id"
    t.index ["grid_id"], name: "index_factory_production_items_on_grid_id"
    t.index ["product_item_id"], name: "index_factory_production_items_on_product_item_id"
    t.index ["production_id"], name: "index_factory_production_items_on_production_id"
    t.index ["production_plan_id"], name: "index_factory_production_items_on_production_plan_id"
    t.index ["room_id"], name: "index_factory_production_items_on_room_id"
    t.index ["station_id"], name: "index_factory_production_items_on_station_id"
  end

  create_table "factory_production_parts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "production_id", scale: 8
    t.bigint "part_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id", scale: 8
    t.bigint "part_taxon_id", scale: 8
    t.index ["part_id"], name: "index_factory_production_parts_on_part_id"
    t.index ["part_taxon_id"], name: "index_factory_production_parts_on_part_taxon_id"
    t.index ["product_id"], name: "index_factory_production_parts_on_product_id"
    t.index ["production_id"], name: "index_factory_production_parts_on_production_id"
  end

  create_table "factory_production_plans", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "production_id", scale: 8
    t.bigint "product_id", scale: 8
    t.bigint "scene_id", scale: 8
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string "state"
    t.integer "planned_count", scale: 4, default: 0
    t.integer "production_items_count", scale: 4, default: 0
    t.date "produce_on"
    t.boolean "specialty", default: false, comment: "主推"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trade_items_count", scale: 4, default: 0
    t.bigint "organ_id", scale: 8
    t.bigint "station_id", scale: 8
    t.index ["organ_id"], name: "index_factory_production_plans_on_organ_id"
    t.index ["product_id"], name: "index_factory_production_plans_on_product_id"
    t.index ["production_id"], name: "index_factory_production_plans_on_production_id"
    t.index ["scene_id"], name: "index_factory_production_plans_on_scene_id"
    t.index ["station_id"], name: "index_factory_production_plans_on_station_id"
  end

  create_table "factory_productions", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.string "name"
    t.string "qr_code"
    t.decimal "price", limit: 2, precision: 10, default: "0.0"
    t.decimal "cost_price", default: "0.0"
    t.decimal "profit_price", default: "0.0"
    t.string "str_part_ids"
    t.boolean "default"
    t.string "state", default: "init"
    t.string "sku"
    t.decimal "advance_price", default: "0.0"
    t.jsonb "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled", default: false
    t.bigint "product_taxon_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.boolean "automatic", default: false
    t.string "good_type"
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.bigint "product_host_id", scale: 8
    t.bigint "factory_taxon_id", scale: 8
    t.bigint "provider_id", scale: 8
    t.bigint "upstream_id", scale: 8
    t.string "type"
    t.integer "position", scale: 4
    t.integer "rent_charges_count", scale: 4
    t.string "rent_unit"
    t.boolean "presell"
    t.string "link"
    t.index ["factory_taxon_id"], name: "index_factory_productions_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_productions_on_organ_id"
    t.index ["product_host_id"], name: "index_factory_productions_on_product_host_id"
    t.index ["product_id"], name: "index_factory_productions_on_product_id"
    t.index ["product_taxon_id"], name: "index_factory_productions_on_product_taxon_id"
    t.index ["provider_id"], name: "index_factory_productions_on_provider_id"
    t.index ["upstream_id"], name: "index_factory_productions_on_upstream_id"
  end

  create_table "factory_products", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "product_taxon_id", scale: 8
    t.string "name"
    t.string "description"
    t.string "qr_prefix"
    t.string "sku"
    t.integer "order_items_count", scale: 4, default: 0
    t.boolean "published", default: true
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id", scale: 8
    t.integer "productions_count", scale: 4, default: 0
    t.integer "product_parts_count", scale: 4, default: 0
    t.bigint "unifier_id", scale: 8
    t.bigint "brand_id", scale: 8
    t.string "type"
    t.boolean "specialty", default: false
    t.integer "fits_count", scale: 4, default: 0
    t.jsonb "product_taxon_ancestors"
    t.bigint "factory_taxon_id", scale: 8
    t.bigint "upstream_id", scale: 8
    t.integer "position", scale: 4
    t.index ["brand_id"], name: "index_factory_products_on_brand_id"
    t.index ["factory_taxon_id"], name: "index_factory_products_on_factory_taxon_id"
    t.index ["organ_id"], name: "index_factory_products_on_organ_id"
    t.index ["product_taxon_id"], name: "index_factory_products_on_product_taxon_id"
    t.index ["sku"], name: "index_factory_products_on_sku"
    t.index ["unifier_id"], name: "index_factory_products_on_unifier_id"
    t.index ["upstream_id"], name: "index_factory_products_on_upstream_id"
  end

  create_table "factory_provides", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "provider_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_taxon_id", scale: 8
    t.index ["organ_id"], name: "index_factory_provides_on_organ_id"
    t.index ["product_taxon_id"], name: "index_factory_provides_on_product_taxon_id"
    t.index ["provider_id"], name: "index_factory_provides_on_provider_id"
  end

  create_table "factory_scene_automatics", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "scene_id", scale: 8
    t.integer "advance_days", scale: 4, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_factory_scene_automatics_on_organ_id"
    t.index ["scene_id"], name: "index_factory_scene_automatics_on_scene_id"
  end

  create_table "factory_scenes", id: { scale: 8 }, force: :cascade do |t|
    t.string "title"
    t.integer "book_start_days", scale: 4, default: 1
    t.time "book_start_at"
    t.integer "book_finish_days", scale: 4, default: 0
    t.time "book_finish_at"
    t.time "deliver_start_at"
    t.time "deliver_finish_at"
    t.boolean "specialty", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factory_serial_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "ancestor_id", scale: 8
    t.bigint "descendant_id", scale: 8
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "factory/serial_anc_desc_idx", unique: true
    t.index ["ancestor_id"], name: "index_factory_serial_hierarchies_on_ancestor_id"
    t.index ["descendant_id"], name: "index_factory_serial_hierarchies_on_descendant_id"
  end

  create_table "factory_serials", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "brand_id", scale: 8
    t.bigint "parent_id", scale: 8
    t.string "name"
    t.integer "position", scale: 4
    t.integer "products_count", scale: 4, default: 0
    t.jsonb "parent_ancestors", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_factory_serials_on_brand_id"
    t.index ["parent_id"], name: "index_factory_serials_on_parent_id"
  end

  create_table "factory_unifiers", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finance_assessments", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.decimal "amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "trustee_amount"
    t.index ["organ_id"], name: "index_finance_assessments_on_organ_id"
  end

  create_table "finance_budgets", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "member_id", scale: 8
    t.string "financial_type"
    t.bigint "financial_id", scale: 8
    t.bigint "financial_taxon_id", scale: 8
    t.string "state", default: "init"
    t.string "subject"
    t.decimal "amount"
    t.string "note", scale: 4096
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id", scale: 8
    t.string "type"
    t.bigint "fund_id", scale: 8
    t.bigint "stock_id", scale: 8
    t.index ["financial_taxon_id"], name: "index_finance_budgets_on_financial_taxon_id"
    t.index ["financial_type", "financial_id"], name: "index_budgets_on_budgeting"
    t.index ["fund_id"], name: "index_finance_budgets_on_fund_id"
    t.index ["member_id"], name: "index_finance_budgets_on_member_id"
    t.index ["organ_id"], name: "index_finance_budgets_on_organ_id"
    t.index ["stock_id"], name: "index_finance_budgets_on_stock_id"
    t.index ["task_id"], name: "index_finance_budgets_on_task_id"
  end

  create_table "finance_expense_items", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "expense_id", scale: 8
    t.bigint "financial_taxon_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.string "note"
    t.string "state"
    t.integer "quantity", scale: 4, default: 1
    t.decimal "price", limit: 2, precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "budget_id", scale: 8
    t.decimal "budget_amount"
    t.index ["budget_id"], name: "index_finance_expense_items_on_budget_id"
    t.index ["expense_id"], name: "index_finance_expense_items_on_expense_id"
    t.index ["financial_taxon_id"], name: "index_finance_expense_items_on_financial_taxon_id"
  end

  create_table "finance_expense_members", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "expense_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "payment_method_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.boolean "advance"
    t.string "state", default: "pending"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "operator_id", scale: 8
    t.string "payable_type"
    t.bigint "payable_id", scale: 8
    t.string "type"
    t.string "payout_uuid"
    t.decimal "requested_amount"
    t.decimal "actual_amount"
    t.datetime "paid_at", precision: nil
    t.string "account_bank"
    t.string "account_name"
    t.string "account_num"
    t.bigint "wallet_id", scale: 8
    t.index ["expense_id"], name: "index_finance_expense_members_on_expense_id"
    t.index ["member_id"], name: "index_finance_expense_members_on_member_id"
    t.index ["operator_id"], name: "index_finance_expense_members_on_operator_id"
    t.index ["payable_type", "payable_id"], name: "index_finance_expense_members_on_payable"
    t.index ["payment_method_id"], name: "index_finance_expense_members_on_payment_method_id"
    t.index ["wallet_id"], name: "index_finance_expense_members_on_wallet_id"
  end

  create_table "finance_expenses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "payout_id", scale: 8
    t.bigint "creator_id", scale: 8
    t.bigint "financial_taxon_id", scale: 8
    t.bigint "payment_method_id", scale: 8
    t.string "type"
    t.string "state", default: "init"
    t.string "subject"
    t.decimal "amount", limit: 2, precision: 10
    t.string "note", scale: 4096
    t.integer "invoices_count", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.bigint "budget_id", scale: 8
    t.string "financial_type"
    t.bigint "financial_id", scale: 8
    t.bigint "fund_id", scale: 8
    t.bigint "stock_id", scale: 8
    t.index ["budget_id"], name: "index_finance_expenses_on_budget_id"
    t.index ["creator_id"], name: "index_finance_expenses_on_creator_id"
    t.index ["financial_taxon_id"], name: "index_finance_expenses_on_financial_taxon_id"
    t.index ["financial_type", "financial_id"], name: "index_expenses_on_financial"
    t.index ["fund_id"], name: "index_finance_expenses_on_fund_id"
    t.index ["organ_id"], name: "index_finance_expenses_on_organ_id"
    t.index ["payment_method_id"], name: "index_finance_expenses_on_payment_method_id"
    t.index ["payout_id"], name: "index_finance_expenses_on_payout_id"
    t.index ["stock_id"], name: "index_finance_expenses_on_stock_id"
  end

  create_table "finance_financial_taxon_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "financial_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "financial_taxon_desc_idx"
  end

  create_table "finance_financial_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "parent_id", scale: 8
    t.jsonb "parent_ancestors"
    t.string "name"
    t.integer "position", scale: 4
    t.boolean "take_stock", comment: "是否有库存"
    t.boolean "individual", comment: "是否可盘点"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_finance_financial_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_finance_financial_taxons_on_parent_id"
  end

  create_table "finance_fund_incomes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "fund_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "financial_type"
    t.bigint "financial_id", scale: 8
    t.boolean "visible"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.string "state", default: "init"
    t.index ["financial_type", "financial_id"], name: "index_fund_incomes_on_financial"
    t.index ["fund_id"], name: "index_finance_fund_incomes_on_fund_id"
    t.index ["user_id"], name: "index_finance_fund_incomes_on_user_id"
  end

  create_table "finance_funds", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.decimal "budget_amount"
    t.decimal "amount", default: "0.0"
    t.string "note"
    t.string "sku"
    t.decimal "price", limit: 2, precision: 10, default: "0.0"
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "budget_detail", default: {}
    t.decimal "expense_amount", default: "0.0"
    t.jsonb "expense_detail", default: {}
    t.bigint "organ_id", scale: 8
    t.string "good_type"
    t.bigint "user_id", scale: 8
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.index ["organ_id"], name: "index_finance_funds_on_organ_id"
    t.index ["user_id"], name: "index_finance_funds_on_user_id"
  end

  create_table "finance_stocks", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "assessment_id", scale: 8
    t.decimal "ratio", limit: 2, precision: 4
    t.integer "amount", scale: 4, default: 0, comment: "发行量"
    t.integer "expense_amount", scale: 4, default: 0
    t.jsonb "expense_detail", default: {}
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "assess_amount"
    t.bigint "member_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.index ["assessment_id"], name: "index_finance_stocks_on_assessment_id"
    t.index ["member_id"], name: "index_finance_stocks_on_member_id"
    t.index ["organ_id"], name: "index_finance_stocks_on_organ_id"
  end

  create_table "good_job_batches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.jsonb "serialized_properties"
    t.text "on_finish"
    t.text "on_success"
    t.text "on_discard"
    t.text "callback_queue_name"
    t.integer "callback_priority", scale: 4
    t.datetime "enqueued_at"
    t.datetime "discarded_at"
    t.datetime "finished_at"
  end

  create_table "good_job_executions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "active_job_id", null: false
    t.text "job_class"
    t.text "queue_name"
    t.jsonb "serialized_params"
    t.datetime "scheduled_at"
    t.datetime "finished_at"
    t.text "error"
    t.integer "error_event", scale: 2
    t.index ["active_job_id", "created_at"], name: "index_good_job_executions_on_active_job_id_and_created_at"
  end

  create_table "good_job_processes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "state"
  end

  create_table "good_job_settings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "key"
    t.jsonb "value"
    t.index ["key"], name: "index_good_job_settings_on_key", unique: true
  end

  create_table "good_jobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "queue_name"
    t.integer "priority", scale: 4
    t.jsonb "serialized_params"
    t.datetime "scheduled_at", precision: nil
    t.datetime "performed_at", precision: nil
    t.datetime "finished_at", precision: nil
    t.text "error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "active_job_id"
    t.text "concurrency_key"
    t.text "cron_key"
    t.uuid "retried_good_job_id"
    t.datetime "cron_at", precision: nil
    t.uuid "batch_id"
    t.uuid "batch_callback_id"
    t.boolean "is_discrete"
    t.integer "executions_count", scale: 4
    t.text "job_class"
    t.integer "error_event", scale: 2
    t.index ["active_job_id", "created_at"], name: "index_good_jobs_on_active_job_id_and_created_at"
    t.index ["active_job_id"], name: "index_good_jobs_on_active_job_id"
    t.index ["batch_callback_id"], name: "index_good_jobs_on_batch_callback_id", where: "(batch_callback_id IS NOT NULL)"
    t.index ["batch_id"], name: "index_good_jobs_on_batch_id", where: "(batch_id IS NOT NULL)"
    t.index ["concurrency_key"], name: "index_good_jobs_on_concurrency_key_when_unfinished", where: "(finished_at IS NULL)"
    t.index ["cron_key", "created_at"], name: "index_good_jobs_on_cron_key_and_created_at"
    t.index ["cron_key", "cron_at"], name: "index_good_jobs_on_cron_key_and_cron_at", unique: true
    t.index ["finished_at"], name: "index_good_jobs_jobs_on_finished_at", where: "((retried_good_job_id IS NULL) AND (finished_at IS NOT NULL))"
    t.index ["priority", "created_at"], name: "index_good_jobs_jobs_on_priority_created_at_when_unfinished", order: { priority: "DESC NULLS LAST" }, where: "(finished_at IS NULL)"
    t.index ["queue_name", "scheduled_at"], name: "index_good_jobs_on_queue_name_and_scheduled_at", where: "(finished_at IS NULL)"
    t.index ["scheduled_at"], name: "index_good_jobs_on_scheduled_at", where: "(finished_at IS NULL)"
  end

  create_table "growth_aim_codes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "aim_id", scale: 8
    t.string "controller_path"
    t.string "action_name"
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aim_id"], name: "index_growth_aim_codes_on_aim_id"
  end

  create_table "growth_aim_entities", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "aim_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "entity_type"
    t.bigint "entity_id", scale: 8
    t.bigint "reward_expense_id", scale: 8
    t.integer "present_point", scale: 4
    t.string "state"
    t.string "serial_number"
    t.datetime "last_access_at", precision: nil
    t.string "ip"
    t.decimal "reward_amount", limit: 2, precision: 10
    t.integer "aim_logs_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aim_id"], name: "index_growth_aim_entities_on_aim_id"
    t.index ["entity_type", "entity_id"], name: "index_growth_aim_entities_on_entity_type_and_entity_id"
    t.index ["reward_expense_id"], name: "index_growth_aim_entities_on_reward_expense_id"
    t.index ["user_id"], name: "index_growth_aim_entities_on_user_id"
  end

  create_table "growth_aim_logs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "aim_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "entity_type"
    t.bigint "entity_id", scale: 8
    t.string "serial_number"
    t.string "ip"
    t.string "code"
    t.boolean "rewarded"
    t.datetime "created_at", precision: nil, null: false
    t.index ["aim_id"], name: "index_growth_aim_logs_on_aim_id"
    t.index ["entity_type", "entity_id"], name: "index_growth_aim_logs_on_entity_type_and_entity_id"
    t.index ["user_id"], name: "index_growth_aim_logs_on_user_id"
  end

  create_table "growth_aim_users", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "aim_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "serial_number"
    t.string "state", default: "task_doing"
    t.integer "reward_amount", scale: 4, default: 0
    t.integer "aim_entities_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aim_id"], name: "index_growth_aim_users_on_aim_id"
    t.index ["user_id"], name: "index_growth_aim_users_on_user_id"
  end

  create_table "growth_aims", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.string "repeat_type"
    t.decimal "rate", limit: 2, precision: 10, default: "1.0"
    t.integer "task_point", scale: 4, default: 0
    t.integer "reward_point", scale: 4, default: 0
    t.integer "reward_amount", scale: 4, default: 0
    t.boolean "verbose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "growth_praise_incomes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "reward_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "earner_id", scale: 8
    t.string "source_type"
    t.bigint "source_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10, default: "0.0", comment: "用户打赏"
    t.decimal "profit_amount", limit: 2, precision: 10, default: "0.0", comment: "平台收入"
    t.decimal "royalty_amount", limit: 2, precision: 10, default: "0.0", comment: "作者分成"
    t.decimal "reward_amount", limit: 2, precision: 10, default: "0.0", comment: "赏金池"
    t.string "state", default: "init"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["earner_id"], name: "index_growth_praise_incomes_on_earner_id"
    t.index ["reward_id"], name: "index_growth_praise_incomes_on_reward_id"
    t.index ["source_type", "source_id"], name: "index_growth_praise_incomes_on_source_type_and_source_id"
    t.index ["user_id"], name: "index_growth_praise_incomes_on_user_id"
  end

  create_table "growth_praise_users", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "reward_id", scale: 8
    t.string "entity_type"
    t.bigint "entity_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10, default: "0.0"
    t.integer "position", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_growth_praise_users_on_entity_type_and_entity_id"
    t.index ["reward_id"], name: "index_growth_praise_users_on_reward_id"
    t.index ["user_id"], name: "index_growth_praise_users_on_user_id"
  end

  create_table "growth_reward_expenses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "reward_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "aim_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aim_id"], name: "index_growth_reward_expenses_on_aim_id"
    t.index ["reward_id"], name: "index_growth_reward_expenses_on_reward_id"
    t.index ["user_id"], name: "index_growth_reward_expenses_on_user_id"
  end

  create_table "growth_reward_incomes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "reward_id", scale: 8
    t.bigint "user_id", scale: 8
    t.decimal "reward_amount", limit: 2, precision: 10, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reward_id"], name: "index_growth_reward_incomes_on_reward_id"
    t.index ["user_id"], name: "index_growth_reward_incomes_on_user_id"
  end

  create_table "growth_rewards", id: { scale: 8 }, force: :cascade do |t|
    t.string "entity_type"
    t.bigint "entity_id", scale: 8
    t.decimal "min_piece", limit: 2, precision: 10, default: "1.0"
    t.decimal "max_piece", limit: 2, precision: 10, default: "10.0"
    t.decimal "amount", limit: 2, precision: 10
    t.decimal "income_amount", limit: 2, precision: 10
    t.decimal "expense_amount", limit: 2, precision: 10
    t.datetime "start_at", precision: nil
    t.datetime "finish_at", precision: nil
    t.boolean "enabled", default: true
    t.integer "lock_version", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_growth_rewards_on_entity_type_and_entity_id"
  end

  create_table "interact_abuses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "abusement_type"
    t.bigint "abusement_id", scale: 8
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abusement_type", "abusement_id"], name: "index_interact_abuses_on_abusement_type_and_abusement_id"
    t.index ["user_id"], name: "index_interact_abuses_on_user_id"
  end

  create_table "interact_attitudes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "attitudinal_type"
    t.bigint "attitudinal_id", scale: 8
    t.string "opinion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attitudinal_type", "attitudinal_id"], name: "index_interact_attitudes_on_attitudinal_type_and_attitudinal_id"
    t.index ["user_id"], name: "index_interact_attitudes_on_user_id"
  end

  create_table "interact_comments", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "parent_id", scale: 8
    t.string "commentable_type"
    t.bigint "commentable_id", scale: 8
    t.string "title"
    t.string "content"
    t.string "state"
    t.float "score", default: 0.0
    t.integer "liked_count", scale: 4, default: 0
    t.integer "star_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_interact_comments_on_commentable_type_and_commentable_id"
    t.index ["parent_id"], name: "index_interact_comments_on_parent_id"
    t.index ["user_id"], name: "index_interact_comments_on_user_id"
  end

  create_table "interact_stars", id: { scale: 8 }, force: :cascade do |t|
    t.string "starred_type"
    t.bigint "starred_id", scale: 8
    t.bigint "user_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["starred_type", "starred_id"], name: "index_interact_stars_on_starred_type_and_starred_id"
    t.index ["user_id"], name: "index_interact_stars_on_user_id"
  end

  create_table "jia_bo_apps", id: { scale: 8 }, force: :cascade do |t|
    t.string "member_code"
    t.string "api_key"
    t.integer "devices_count", scale: 4, default: 0
    t.integer "templates_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "jia_bo_device_organs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "device_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_jia_bo_device_organs_on_device_id"
    t.index ["organ_id"], name: "index_jia_bo_device_organs_on_organ_id"
  end

  create_table "jia_bo_devices", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "app_id", scale: 8
    t.string "device_id"
    t.string "dev_name"
    t.string "grp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_jia_bo_devices_on_app_id"
  end

  create_table "jia_bo_parameters", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "template_id", scale: 8
    t.string "name", comment: "参数名称"
    t.string "code", comment: "参数 code"
    t.string "comment", comment: "评论"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_jia_bo_parameters_on_template_id"
  end

  create_table "jia_bo_templates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "app_id", scale: 8
    t.string "code", comment: "模板编号"
    t.string "type", comment: "模板类型"
    t.string "title", comment: "模板名称"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumb_url"
    t.index ["app_id"], name: "index_jia_bo_templates_on_app_id"
  end

  create_table "markdown_assets", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "git_id", scale: 8
    t.string "name"
    t.string "path"
    t.string "download_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sha"
    t.index ["git_id"], name: "index_markdown_assets_on_git_id"
  end

  create_table "markdown_catalogs", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.string "parent_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "git_id", scale: 8
    t.integer "position", scale: 4
    t.boolean "nav", default: false, comment: "是否导航菜单"
    t.bigint "organ_id", scale: 8
    t.integer "depth", scale: 4
    t.string "home_path"
    t.index ["git_id"], name: "index_markdown_catalogs_on_git_id"
    t.index ["organ_id"], name: "index_markdown_catalogs_on_organ_id"
  end

  create_table "markdown_gits", id: { scale: 8 }, force: :cascade do |t|
    t.string "working_directory"
    t.string "remote_url"
    t.string "last_commit_message"
    t.datetime "last_commit_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.string "type"
    t.string "identity"
    t.string "secret"
    t.string "base_name"
    t.index ["organ_id"], name: "index_markdown_gits_on_organ_id"
  end

  create_table "markdown_posts", id: { scale: 8 }, force: :cascade do |t|
    t.string "markdown"
    t.string "html"
    t.string "layout"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "git_id", scale: 8
    t.string "oid"
    t.string "title"
    t.boolean "published", default: true
    t.string "catalog_path", default: ""
    t.boolean "ppt", default: false
    t.boolean "nav", default: false, comment: "是否导航菜单"
    t.bigint "organ_id", scale: 8
    t.datetime "last_commit_at"
    t.string "slug"
    t.index ["git_id"], name: "index_markdown_posts_on_git_id"
    t.index ["organ_id"], name: "index_markdown_posts_on_organ_id"
  end

  create_table "notice_annunciations", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "publisher_type"
    t.bigint "publisher_id", scale: 8
    t.string "title"
    t.string "body"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "notifications_count", scale: 4
    t.integer "readed_count", scale: 4
    t.string "type"
    t.index ["organ_id"], name: "index_notice_annunciations_on_organ_id"
    t.index ["publisher_type", "publisher_id"], name: "index_notice_annunciations_on_publisher_type_and_publisher_id"
  end

  create_table "notice_member_annunciates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "annunciation_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.bigint "department_id", scale: 8
    t.integer "notifications_count", scale: 4, default: 0
    t.string "state"
    t.datetime "annunciated_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annunciation_id"], name: "index_notice_member_annunciates_on_annunciation_id"
    t.index ["department_id"], name: "index_notice_member_annunciates_on_department_id"
    t.index ["job_title_id"], name: "index_notice_member_annunciates_on_job_title_id"
  end

  create_table "notice_notification_sendings", id: { scale: 8 }, force: :cascade do |t|
    t.string "way"
    t.string "sent_to"
    t.datetime "sent_at", precision: nil
    t.string "sent_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "notification_id", scale: 8
    t.index ["notification_id"], name: "index_notice_notification_sendings_on_notification_id"
  end

  create_table "notice_notifications", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "notifiable_type"
    t.integer "notifiable_id", scale: 4
    t.string "code"
    t.string "state", default: "0"
    t.string "title"
    t.string "body", scale: 5000
    t.string "link"
    t.datetime "sending_at", precision: nil
    t.datetime "read_at", precision: nil
    t.boolean "verbose", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "archived"
    t.boolean "official"
    t.bigint "organ_id", scale: 8
    t.string "sender_type"
    t.bigint "sender_id", scale: 8
    t.string "linked_type"
    t.bigint "linked_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.index ["linked_type", "linked_id"], name: "index_notice_notifications_on_linked_type_and_linked_id"
    t.index ["member_id"], name: "index_notice_notifications_on_member_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notice_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["organ_id"], name: "index_notice_notifications_on_organ_id"
    t.index ["read_at"], name: "index_notice_notifications_on_read_at"
    t.index ["sender_type", "sender_id"], name: "index_notice_notifications_on_sender_type_and_sender_id"
    t.index ["user_id"], name: "index_notice_notifications_on_user_id"
  end

  create_table "notice_user_annunciates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "annunciation_id", scale: 8
    t.bigint "user_tag_id", scale: 8
    t.integer "notifications_count", scale: 4, default: 0
    t.string "state"
    t.datetime "annunciated_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annunciation_id"], name: "index_notice_user_annunciates_on_annunciation_id"
    t.index ["user_tag_id"], name: "index_notice_user_annunciates_on_user_tag_id"
  end

  create_table "org_department_grants", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "organ_handle_id", scale: 8
    t.bigint "department_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_org_department_grants_on_department_id"
    t.index ["job_title_id"], name: "index_org_department_grants_on_job_title_id"
    t.index ["organ_handle_id"], name: "index_org_department_grants_on_organ_handle_id"
    t.index ["organ_id"], name: "index_org_department_grants_on_organ_id"
  end

  create_table "org_department_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "department_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "department_desc_idx"
  end

  create_table "org_departments", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "parent_id", scale: 8
    t.string "name"
    t.integer "member_departments_count", scale: 4, default: 0
    t.integer "needed_number", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "all_member_departments_count", scale: 4
    t.bigint "superior_id", scale: 8
    t.jsonb "superior_ancestors"
    t.jsonb "parent_ancestors"
    t.index ["organ_id"], name: "index_org_departments_on_organ_id"
    t.index ["parent_id"], name: "index_org_departments_on_parent_id"
    t.index ["superior_id"], name: "index_org_departments_on_superior_id"
  end

  create_table "org_job_descriptions", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "department_id", scale: 8
    t.text "requirements"
    t.text "advanced_requirements"
    t.string "english_requirement"
    t.string "degree_requirement"
    t.text "duties"
    t.integer "salary_min", scale: 4
    t.integer "salary_max", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_org_job_descriptions_on_department_id"
  end

  create_table "org_job_titles", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "department_id", scale: 8
    t.bigint "department_root_id", scale: 8
    t.string "name"
    t.integer "grade", scale: 4
    t.integer "limit_member", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.bigint "super_job_title_id", scale: 8
    t.integer "super_grade", scale: 4
    t.index ["department_id"], name: "index_org_job_titles_on_department_id"
    t.index ["department_root_id"], name: "index_org_job_titles_on_department_root_id"
    t.index ["super_job_title_id"], name: "index_org_job_titles_on_super_job_title_id"
  end

  create_table "org_job_transfers", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "to_office_id", scale: 8
    t.bigint "to_department_id", scale: 8
    t.bigint "to_job_title_id", scale: 8
    t.bigint "from_office_id", scale: 8
    t.bigint "from_department_id", scale: 8
    t.bigint "from_job_title_id", scale: 8
    t.string "state", default: "init"
    t.date "transfer_on"
    t.string "reason_note", scale: 4096
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_department_id"], name: "index_org_job_transfers_on_from_department_id"
    t.index ["from_job_title_id"], name: "index_org_job_transfers_on_from_job_title_id"
    t.index ["from_office_id"], name: "index_org_job_transfers_on_from_office_id"
    t.index ["member_id"], name: "index_org_job_transfers_on_member_id"
    t.index ["to_department_id"], name: "index_org_job_transfers_on_to_department_id"
    t.index ["to_job_title_id"], name: "index_org_job_transfers_on_to_job_title_id"
    t.index ["to_office_id"], name: "index_org_job_transfers_on_to_office_id"
  end

  create_table "org_member_departments", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.bigint "department_root_id", scale: 8
    t.bigint "department_id", scale: 8
    t.integer "grade", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "department_ancestors"
    t.bigint "superior_id", scale: 8
    t.index ["department_id"], name: "index_org_member_departments_on_department_id"
    t.index ["department_root_id"], name: "index_org_member_departments_on_department_root_id"
    t.index ["job_title_id"], name: "index_org_member_departments_on_job_title_id"
    t.index ["member_id"], name: "index_org_member_departments_on_member_id"
    t.index ["superior_id"], name: "index_org_member_departments_on_superior_id"
  end

  create_table "org_members", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "identity"
    t.string "number"
    t.date "join_on"
    t.boolean "enabled", default: true
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pomodoro", scale: 4
    t.bigint "organ_root_id", scale: 8
    t.boolean "owned"
    t.jsonb "department_ancestors"
    t.string "experience"
    t.string "attendance_number"
    t.string "notifiable_types", default: [], array: true
    t.jsonb "counters", default: {}
    t.integer "showtime", scale: 4, default: 0
    t.boolean "accept_email", default: true
    t.boolean "inviter", default: false
    t.integer "promote_goods_count", scale: 4, default: 0
    t.string "corp_userid"
    t.string "wechat_openid"
    t.bigint "user_id", scale: 8
    t.integer "maintains_count", scale: 4
    t.bigint "member_inviter_id", scale: 8
    t.index ["member_inviter_id"], name: "index_org_members_on_member_inviter_id"
    t.index ["organ_id"], name: "index_org_members_on_organ_id"
    t.index ["organ_root_id"], name: "index_org_members_on_organ_root_id"
    t.index ["user_id"], name: "index_org_members_on_user_id"
  end

  create_table "org_organ_domains", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "subdomain"
    t.string "domain", default: "lvh.me"
    t.string "port", default: "3000"
    t.string "host"
    t.string "identifier"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "beian", comment: "备案号"
    t.string "scheme", default: "https"
    t.string "kind"
    t.index ["identifier"], name: "index_org_organ_domains_on_identifier"
    t.index ["organ_id"], name: "index_org_organ_domains_on_organ_id"
  end

  create_table "org_organ_handles", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "record_class"
    t.string "record_column"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "org_organ_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "organ_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "organ_desc_idx"
  end

  create_table "org_organs", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "limit_wechat", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id", scale: 8
    t.bigint "parent_id", scale: 8
    t.string "address"
    t.integer "members_count", scale: 4
    t.string "name_short"
    t.jsonb "area_ancestors"
    t.integer "limit_wechat_menu", scale: 4, default: 1
    t.jsonb "parent_ancestors"
    t.boolean "official", comment: "是否官方"
    t.boolean "joinable", comment: "是否可搜索并加入"
    t.string "code"
    t.bigint "corp_user_id", scale: 8
    t.string "redirect_controller"
    t.string "redirect_action", comment: "默认跳转"
    t.string "service_url", comment: "客服 url"
    t.string "appid"
    t.bigint "creator_id", scale: 8
    t.bigint "provider_id", scale: 8
    t.index ["area_id"], name: "index_org_organs_on_area_id"
    t.index ["corp_user_id"], name: "index_org_organs_on_corp_user_id"
    t.index ["creator_id"], name: "index_org_organs_on_creator_id"
    t.index ["parent_id"], name: "index_org_organs_on_parent_id"
    t.index ["provider_id"], name: "index_org_organs_on_provider_id"
  end

  create_table "org_resign_reasons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4
    t.integer "resigns_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "org_resign_references", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "resign_id", scale: 8
    t.bigint "resign_reason_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resign_id"], name: "index_org_resign_references_on_resign_id"
    t.index ["resign_reason_id"], name: "index_org_resign_references_on_resign_reason_id"
  end

  create_table "org_resigns", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.string "state", default: "init"
    t.date "leave_on"
    t.string "reason_note", scale: 4096
    t.string "handover_note", scale: 4096
    t.string "comment", scale: 4096
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_org_resigns_on_member_id"
  end

  create_table "org_super_job_titles", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "description"
    t.integer "grade", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_org_super_job_titles_on_organ_id"
  end

  create_table "org_supports", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "department_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.bigint "member_id", scale: 8
    t.string "name"
    t.integer "grade", scale: 4
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supporter_id", scale: 8
    t.json "department_ancestors"
    t.index ["department_id"], name: "index_org_supports_on_department_id"
    t.index ["member_id"], name: "index_org_supports_on_member_id"
    t.index ["organ_id"], name: "index_org_supports_on_organ_id"
    t.index ["supporter_id"], name: "index_org_supports_on_supporter_id"
  end

  create_table "org_tutorials", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "tutor_id", scale: 8
    t.string "kind"
    t.string "state"
    t.string "accepted_status"
    t.string "verified"
    t.date "start_on"
    t.date "finish_on"
    t.string "performance"
    t.integer "allowance", scale: 4
    t.string "note", scale: 4096
    t.string "comment", scale: 4096
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_org_tutorials_on_member_id"
    t.index ["tutor_id"], name: "index_org_tutorials_on_tutor_id"
  end

  create_table "plan_participants", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "event_participant_id", scale: 8
    t.string "participant_type"
    t.bigint "participant_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "planning_type"
    t.bigint "planning_id", scale: 8
    t.string "type"
    t.string "status", comment: "默认 event_participant 有效"
    t.index ["event_participant_id"], name: "index_plan_participants_on_event_participant_id"
    t.index ["participant_type", "participant_id"], name: "index_plan_participants_on_participant_type_and_participant_id"
    t.index ["planning_type", "planning_id"], name: "index_plan_participants_on_planning_type_and_planning_id"
  end

  create_table "profiled_address_organs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "address_id", scale: 8
    t.string "kind"
    t.boolean "default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_profiled_address_organs_on_address_id"
    t.index ["organ_id"], name: "index_profiled_address_organs_on_organ_id"
  end

  create_table "profiled_address_users", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "address_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "inviter_id", scale: 8
    t.decimal "commission_ratio", limit: 2, precision: 4, default: "0.0", comment: "佣金比例"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "ordinary"
    t.index ["address_id"], name: "index_profiled_address_users_on_address_id"
    t.index ["inviter_id"], name: "index_profiled_address_users_on_inviter_id"
    t.index ["user_id"], name: "index_profiled_address_users_on_user_id"
  end

  create_table "profiled_address_uses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "address_id", scale: 8
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_profiled_address_uses_on_address_id"
  end

  create_table "profiled_addresses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "area_id", scale: 8
    t.string "detail"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "name"
    t.string "contact"
    t.string "tel"
    t.string "post_code"
    t.string "source"
    t.string "cached_key"
    t.json "area_ancestors"
    t.bigint "station_id", scale: 8
    t.string "floor", comment: "楼层"
    t.string "room", comment: "房间号"
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.boolean "principal", default: false
    t.bigint "maintain_id", scale: 8
    t.bigint "client_id", scale: 8
    t.index ["area_id"], name: "index_profiled_addresses_on_area_id"
    t.index ["client_id"], name: "index_profiled_addresses_on_client_id"
    t.index ["maintain_id"], name: "index_profiled_addresses_on_maintain_id"
    t.index ["member_id"], name: "index_profiled_addresses_on_member_id"
    t.index ["member_organ_id"], name: "index_profiled_addresses_on_member_organ_id"
    t.index ["organ_id"], name: "index_profiled_addresses_on_organ_id"
    t.index ["station_id"], name: "index_profiled_addresses_on_station_id"
    t.index ["user_id"], name: "index_profiled_addresses_on_user_id"
  end

  create_table "profiled_area_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["ancestor_id", "descendant_id", "generations"], name: "area_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "area_desc_idx"
  end

  create_table "profiled_areas", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "names", array: true
    t.bigint "parent_id", scale: 8
    t.boolean "published", default: true
    t.boolean "popular", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.json "parent_ancestors"
    t.string "timezone"
    t.string "locale"
    t.string "full"
    t.string "code"
    t.index ["parent_id"], name: "index_profiled_areas_on_parent_id"
  end

  create_table "profiled_profiles", id: { scale: 8 }, force: :cascade do |t|
    t.string "gender"
    t.string "birthday_type"
    t.date "birthday"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id", scale: 8
    t.string "real_name"
    t.string "nick_name"
    t.string "identity"
    t.jsonb "extra", default: {}
    t.bigint "user_id", scale: 8
    t.string "corpid"
    t.string "external_userid"
    t.string "position"
    t.string "avatar_url"
    t.string "corp_name"
    t.string "corp_full_name"
    t.string "external_type"
    t.string "unionid"
    t.index ["organ_id"], name: "index_profiled_profiles_on_organ_id"
    t.index ["user_id"], name: "index_profiled_profiles_on_user_id"
  end

  create_table "project_taxon_facilitates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "taxon_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.bigint "facilitate_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_id"], name: "index_project_taxon_facilitates_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_project_taxon_facilitates_on_facilitate_taxon_id"
    t.index ["taxon_id"], name: "index_project_taxon_facilitates_on_taxon_id"
  end

  create_table "project_taxon_indicators", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "taxon_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.bigint "indicator_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facilitate_taxon_id"], name: "index_project_taxon_indicators_on_facilitate_taxon_id"
    t.index ["indicator_id"], name: "index_project_taxon_indicators_on_indicator_id"
    t.index ["taxon_id"], name: "index_project_taxon_indicators_on_taxon_id"
  end

  create_table "project_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "record_name", default: "ProjectTaxon"
    t.jsonb "parameters", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "fund_budget"
    t.decimal "fund_expense"
    t.decimal "budget_amount"
    t.decimal "expense_amount"
    t.integer "projects_count", scale: 4
  end

  create_table "quip_apps", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "private_folder_id"
    t.string "name"
    t.string "profile_picture_url"
    t.index ["organ_id"], name: "index_quip_apps_on_organ_id"
    t.index ["user_id"], name: "index_quip_apps_on_user_id"
  end

  create_table "requirements", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "from"
    t.string "to"
    t.date "pick_on"
    t.time "pick_at"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", scale: 8
    t.bigint "volunteer_id", scale: 8
    t.string "state", default: "init"
    t.bigint "from_area_id", scale: 8
    t.bigint "to_area_id", scale: 8
    t.index ["from_area_id"], name: "index_requirements_on_from_area_id"
    t.index ["to_area_id"], name: "index_requirements_on_to_area_id"
    t.index ["user_id"], name: "index_requirements_on_user_id"
    t.index ["volunteer_id"], name: "index_requirements_on_volunteer_id"
  end

  create_table "roled_busynesses", id: { scale: 8 }, force: :cascade do |t|
    t.string "identifier"
    t.integer "position", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "roled_governs", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "position", scale: 4, default: 0
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "namespace_identifier"
    t.string "business_identifier"
    t.string "controller_path"
    t.string "controller_name"
  end

  create_table "roled_name_spaces", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "identifier"
    t.boolean "verify_organ"
    t.boolean "verify_member"
    t.boolean "verify_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roled_role_rules", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "role_id", scale: 4
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "params_name"
    t.string "params_identifier"
    t.string "business_identifier"
    t.string "namespace_identifier"
    t.string "action_name"
    t.string "controller_path"
    t.bigint "meta_action_id", scale: 8
    t.index ["meta_action_id"], name: "index_roled_role_rules_on_meta_action_id"
  end

  create_table "roled_role_types", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "role_id", scale: 8
    t.string "who_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roled_role_types_on_role_id"
  end

  create_table "roled_roles", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "visible"
    t.jsonb "role_hash", default: {}
    t.boolean "default"
    t.string "type"
    t.string "tip"
  end

  create_table "roled_rule_operations", id: { scale: 8 }, force: :cascade do |t|
    t.string "action_name"
    t.string "operation", default: "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roled_rules", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "position", scale: 4, default: 0
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "namespace_identifier"
    t.string "business_identifier"
    t.string "action_name"
    t.string "operation", default: "read"
    t.string "controller_path"
    t.string "controller_name"
    t.string "path"
    t.string "verb"
    t.string "required_parts", array: true
    t.boolean "landmark"
  end

  create_table "roled_who_roles", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "who_id", scale: 8
    t.bigint "role_id", scale: 8
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "type"
    t.index ["role_id"], name: "index_roled_who_roles_on_role_id"
  end

  create_table "serve_servers", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "service_id", scale: 8
    t.bigint "member_id", scale: 8
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_serve_servers_on_member_id"
    t.index ["service_id"], name: "index_serve_servers_on_service_id"
  end

  create_table "serve_services", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "sku"
    t.decimal "price", default: "0.0"
    t.decimal "advance_price", default: "0.0"
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.jsonb "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.string "good_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_serve_services_on_organ_id"
  end

  create_table "serve_servings", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "service_id", scale: 8
    t.bigint "server_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "wallet_payment_id", scale: 8
    t.bigint "item_id", scale: 8
    t.datetime "start_at"
    t.datetime "finish_at"
    t.datetime "estimate_finish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_serve_servings_on_item_id"
    t.index ["member_id"], name: "index_serve_servings_on_member_id"
    t.index ["server_id"], name: "index_serve_servings_on_server_id"
    t.index ["service_id"], name: "index_serve_servings_on_service_id"
    t.index ["wallet_payment_id"], name: "index_serve_servings_on_wallet_payment_id"
  end

  create_table "ship_box_buys", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "box_specification_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.integer "buyable_count", scale: 4, default: 0
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_specification_id"], name: "index_ship_box_buys_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_buys_on_organ_id"
  end

  create_table "ship_box_holds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "box_specification_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.integer "boxes_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_organ_id", scale: 8
    t.integer "rented_amount", scale: 4
    t.integer "owned_amount", scale: 4
    t.integer "box_host_id", scale: 4
    t.index ["box_specification_id"], name: "index_ship_box_holds_on_box_specification_id"
    t.index ["member_id"], name: "index_ship_box_holds_on_member_id"
    t.index ["member_organ_id"], name: "index_ship_box_holds_on_member_organ_id"
    t.index ["organ_id"], name: "index_ship_box_holds_on_organ_id"
    t.index ["user_id"], name: "index_ship_box_holds_on_user_id"
  end

  create_table "ship_box_hosts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "box_specification_id", scale: 8
    t.integer "boxes_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "sku"
    t.decimal "price"
    t.decimal "advance_price"
    t.jsonb "card_price"
    t.jsonb "wallet_price"
    t.jsonb "extra"
    t.string "unit"
    t.decimal "quantity"
    t.decimal "unified_quantity"
    t.decimal "invest_ratio", comment: "抽成比例"
    t.string "good_type"
    t.integer "tradable_count", scale: 4, comment: "可交易数量，可租亦可卖"
    t.virtual "traded_count", type: :integer, scale: 4, as: "(boxes_count - tradable_count)", stored: true
    t.string "rent_unit"
    t.integer "rent_charges_count", scale: 4
    t.index ["box_specification_id"], name: "index_ship_box_hosts_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_hosts_on_organ_id"
  end

  create_table "ship_box_logs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "box_id", scale: 8
    t.datetime "boxed_in_at"
    t.datetime "boxed_out_at"
    t.integer "duration", scale: 4
    t.string "confirm_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "boxed_type"
    t.bigint "boxed_id", scale: 8
    t.index ["box_id"], name: "index_ship_box_logs_on_box_id"
    t.index ["boxed_type", "boxed_id"], name: "index_ship_box_logs_on_boxed"
  end

  create_table "ship_box_proxy_buys", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "box_specification_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.integer "buyable_count", scale: 4
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "box_host_id", scale: 8
    t.index ["box_host_id"], name: "index_ship_box_proxy_buys_on_box_host_id"
    t.index ["box_specification_id"], name: "index_ship_box_proxy_buys_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_proxy_buys_on_organ_id"
  end

  create_table "ship_box_proxy_sells", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "box_specification_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.integer "sellable_count", scale: 4
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_specification_id"], name: "index_ship_box_proxy_sells_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_box_proxy_sells_on_organ_id"
  end

  create_table "ship_box_sells", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "box_specification_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.decimal "price", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.integer "amount", scale: 4
    t.integer "done_amount", scale: 4
    t.integer "rest_amount", scale: 4
    t.string "state"
    t.index ["box_specification_id"], name: "index_ship_box_sells_on_box_specification_id"
    t.index ["member_id"], name: "index_ship_box_sells_on_member_id"
    t.index ["member_organ_id"], name: "index_ship_box_sells_on_member_organ_id"
    t.index ["organ_id"], name: "index_ship_box_sells_on_organ_id"
    t.index ["user_id"], name: "index_ship_box_sells_on_user_id"
  end

  create_table "ship_box_specifications", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "width", scale: 4
    t.integer "length", scale: 4
    t.integer "height", scale: 4
    t.integer "boxes_count", scale: 4, default: 0
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "ship_boxes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "box_specification_id", scale: 8
    t.string "code"
    t.string "status"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shipment_items_count", scale: 4, default: 0
    t.integer "box_logs_count", scale: 4, default: 0
    t.index ["box_specification_id"], name: "index_ship_boxes_on_box_specification_id"
    t.index ["organ_id"], name: "index_ship_boxes_on_organ_id"
  end

  create_table "ship_car_drivers", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "car_id", scale: 8
    t.bigint "driver_id", scale: 8
    t.jsonb "repeat_days"
    t.string "event_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_ship_car_drivers_on_car_id"
    t.index ["driver_id"], name: "index_ship_car_drivers_on_driver_id"
  end

  create_table "ship_cars", id: { scale: 8 }, force: :cascade do |t|
    t.string "location"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "detail"
    t.bigint "organ_id", scale: 8
    t.string "brand", comment: "车品牌"
    t.string "tel", comment: "随车电话"
    t.string "carriage"
    t.string "kind"
    t.bigint "user_id", scale: 8
    t.index ["organ_id"], name: "index_ship_cars_on_organ_id"
    t.index ["user_id"], name: "index_ship_cars_on_user_id"
  end

  create_table "ship_drivers", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "name"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "detail"
    t.bigint "organ_id", scale: 8
    t.bigint "member_id", scale: 8
    t.index ["member_id"], name: "index_ship_drivers_on_member_id"
    t.index ["organ_id"], name: "index_ship_drivers_on_organ_id"
    t.index ["user_id"], name: "index_ship_drivers_on_user_id"
  end

  create_table "ship_favorites", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "driver_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remark"
    t.index ["driver_id"], name: "index_ship_favorites_on_driver_id"
    t.index ["user_id"], name: "index_ship_favorites_on_user_id"
  end

  create_table "ship_item_shipments", id: { scale: 8 }, force: :cascade do |t|
    t.string "item_type"
    t.bigint "item_id", scale: 8
    t.bigint "shipment_id", scale: 8
    t.datetime "loaded_at"
    t.datetime "unloaded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_type", "item_id"], name: "index_ship_item_shipments_on_item"
    t.index ["shipment_id"], name: "index_ship_item_shipments_on_shipment_id"
  end

  create_table "ship_line_similars", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "line_id", scale: 8
    t.bigint "similar_id", scale: 8
    t.integer "position", scale: 4
    t.decimal "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_ship_line_similars_on_line_id"
    t.index ["similar_id"], name: "index_ship_line_similars_on_similar_id"
  end

  create_table "ship_line_stations", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "line_id", scale: 8
    t.bigint "station_id", scale: 8
    t.integer "position", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "expected_minutes", scale: 4, comment: "预计到下站分钟数"
    t.index ["line_id"], name: "index_ship_line_stations_on_line_id"
    t.index ["organ_id"], name: "index_ship_line_stations_on_organ_id"
    t.index ["station_id"], name: "index_ship_line_stations_on_station_id"
  end

  create_table "ship_lines", id: { scale: 8 }, force: :cascade do |t|
    t.string "start_name"
    t.string "finish_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "line_stations_count", scale: 4, default: 0
  end

  create_table "ship_locations", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "area_id", scale: 8
    t.string "poiname"
    t.string "poiaddress"
    t.string "cityname"
    t.decimal "lat", limit: 8, precision: 10
    t.decimal "lng", limit: 8, precision: 11
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", scale: 4
    t.point "coordinate"
    t.string "name"
    t.bigint "way_id", scale: 8
    t.bigint "station_id", scale: 8
    t.jsonb "area_ancestors"
    t.index ["area_id"], name: "index_ship_locations_on_area_id"
    t.index ["station_id"], name: "index_ship_locations_on_station_id"
    t.index ["way_id"], name: "index_ship_locations_on_way_id"
  end

  create_table "ship_package_shipments", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "box_id", scale: 8
    t.bigint "package_id", scale: 8
    t.bigint "shipment_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_ship_package_shipments_on_box_id"
    t.index ["package_id"], name: "index_ship_package_shipments_on_package_id"
    t.index ["shipment_id"], name: "index_ship_package_shipments_on_shipment_id"
  end

  create_table "ship_packageds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "package_id", scale: 8
    t.bigint "trade_item_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "trade_item_status"
    t.string "good_item_type"
    t.bigint "good_item_id", scale: 8
    t.index ["good_item_type", "good_item_id"], name: "index_ship_packageds_on_good_item"
    t.index ["package_id"], name: "index_ship_packageds_on_package_id"
    t.index ["trade_item_id"], name: "index_ship_packageds_on_trade_item_id"
  end

  create_table "ship_packages", id: { scale: 8 }, force: :cascade do |t|
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "expected_on"
    t.string "pick_mode"
    t.bigint "address_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "produce_plan_id", scale: 8
    t.bigint "box_id", scale: 8
    t.datetime "boxed_in_at"
    t.datetime "boxed_out_at"
    t.bigint "organ_id", scale: 8
    t.bigint "from_address_id", scale: 8
    t.bigint "from_station_id", scale: 8
    t.bigint "station_id", scale: 8
    t.bigint "current_shipment_id", scale: 8
    t.string "confirm_mode"
    t.integer "packageds_count", scale: 4, default: 0
    t.integer "shipment_items_count", scale: 4, default: 0
    t.index ["address_id"], name: "index_ship_packages_on_address_id"
    t.index ["box_id"], name: "index_ship_packages_on_box_id"
    t.index ["current_shipment_id"], name: "index_ship_packages_on_current_shipment_id"
    t.index ["from_address_id"], name: "index_ship_packages_on_from_address_id"
    t.index ["from_station_id"], name: "index_ship_packages_on_from_station_id"
    t.index ["organ_id"], name: "index_ship_packages_on_organ_id"
    t.index ["produce_plan_id"], name: "index_ship_packages_on_produce_plan_id"
    t.index ["station_id"], name: "index_ship_packages_on_station_id"
    t.index ["user_id"], name: "index_ship_packages_on_user_id"
  end

  create_table "ship_shipment_items", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "shipment_id", scale: 8
    t.datetime "loaded_at"
    t.datetime "unloaded_at"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "loaded_station_id", scale: 8
    t.bigint "unloaded_station_id", scale: 8
    t.bigint "package_id", scale: 8
    t.bigint "box_id", scale: 8
    t.string "confirm_mode"
    t.string "status"
    t.bigint "station_id", scale: 8
    t.index ["box_id"], name: "index_ship_shipment_items_on_box_id"
    t.index ["loaded_station_id"], name: "index_ship_shipment_items_on_loaded_station_id"
    t.index ["package_id"], name: "index_ship_shipment_items_on_package_id"
    t.index ["shipment_id"], name: "index_ship_shipment_items_on_shipment_id"
    t.index ["station_id"], name: "index_ship_shipment_items_on_station_id"
    t.index ["unloaded_station_id"], name: "index_ship_shipment_items_on_unloaded_station_id"
  end

  create_table "ship_shipment_logs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "shipment_id", scale: 8
    t.bigint "station_id", scale: 8
    t.datetime "expected_leave_at"
    t.datetime "left_at"
    t.datetime "arrived_at"
    t.datetime "prepared_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_ship_shipment_logs_on_shipment_id"
    t.index ["station_id"], name: "index_ship_shipment_logs_on_station_id"
  end

  create_table "ship_shipments", id: { scale: 8 }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shipping_type"
    t.bigint "shipping_id", scale: 8
    t.string "state"
    t.bigint "line_id", scale: 8
    t.bigint "car_id", scale: 8
    t.bigint "driver_id", scale: 8
    t.string "type"
    t.datetime "left_at"
    t.datetime "arrived_at"
    t.date "load_on"
    t.bigint "organ_id", scale: 8
    t.integer "shipment_items_count", scale: 4, default: 0
    t.integer "expected_minutes", scale: 4, comment: "预计路途分钟数"
    t.bigint "current_line_station_id", scale: 8
    t.datetime "expected_leave_at"
    t.datetime "expected_arrive_at"
    t.index ["car_id"], name: "index_ship_shipments_on_car_id"
    t.index ["current_line_station_id"], name: "index_ship_shipments_on_current_line_station_id"
    t.index ["driver_id"], name: "index_ship_shipments_on_driver_id"
    t.index ["line_id"], name: "index_ship_shipments_on_line_id"
    t.index ["organ_id"], name: "index_ship_shipments_on_organ_id"
    t.index ["shipping_type", "shipping_id"], name: "index_ship_shipments_on_shipping_type_and_shipping_id"
  end

  create_table "ship_stations", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "area_id", scale: 8
    t.string "name"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.jsonb "area_ancestors"
    t.string "poiname"
    t.string "poiaddress"
    t.string "cityname"
    t.decimal "lat"
    t.decimal "lng"
    t.point "coordinate"
    t.index ["area_id"], name: "index_ship_stations_on_area_id"
    t.index ["organ_id"], name: "index_ship_stations_on_organ_id"
  end

  create_table "ship_user_lines", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "line_id", scale: 8
    t.bigint "user_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_ship_user_lines_on_line_id"
    t.index ["user_id"], name: "index_ship_user_lines_on_user_id"
  end

  create_table "ship_ways", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "line_id", scale: 8
    t.string "name"
    t.string "start_name"
    t.string "finish_name"
    t.integer "locations_count", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_ship_ways_on_line_id"
    t.index ["organ_id"], name: "index_ship_ways_on_organ_id"
    t.index ["user_id"], name: "index_ship_ways_on_user_id"
  end

  create_table "space_buildings", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "station_id", scale: 8
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_space_buildings_on_station_id"
  end

  create_table "space_desks", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "room_id", scale: 8
    t.string "name"
    t.string "code"
    t.integer "width", scale: 4
    t.integer "height", scale: 4
    t.integer "length", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_space_desks_on_room_id"
  end

  create_table "space_grids", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "room_id", scale: 8
    t.string "name"
    t.string "code"
    t.integer "width", scale: 4
    t.integer "height", scale: 4
    t.integer "length", scale: 4
    t.integer "floor", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_space_grids_on_room_id"
  end

  create_table "space_rooms", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "station_id", scale: 8
    t.bigint "building_id", scale: 8
    t.string "name"
    t.string "code"
    t.integer "floor", scale: 4
    t.integer "grids_count", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_space_rooms_on_building_id"
    t.index ["station_id"], name: "index_space_rooms_on_station_id"
  end

  create_table "space_stations", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "area_id", scale: 8
    t.string "name"
    t.string "code"
    t.string "detail"
    t.integer "buildings_count", scale: 4
    t.integer "rooms_count", scale: 4
    t.jsonb "area_ancestors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "poiname"
    t.string "poiaddress"
    t.string "cityname"
    t.decimal "lat"
    t.decimal "lng"
    t.point "coordinate"
    t.index ["area_id"], name: "index_space_stations_on_area_id"
    t.index ["organ_id"], name: "index_space_stations_on_organ_id"
  end

  create_table "stats", id: { scale: 8 }, force: :cascade do |t|
    t.integer "subscribed_requests_count", scale: 4
    t.integer "oauth_users_count", scale: 4
    t.integer "users_count", scale: 4
    t.integer "requirements_count", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
  end

  create_table "trade_addition_charges", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "addition_id", scale: 8
    t.decimal "min"
    t.decimal "max"
    t.decimal "filter_min"
    t.decimal "filter_max"
    t.boolean "contain_min"
    t.boolean "contain_max"
    t.decimal "parameter"
    t.jsonb "wallet_price"
    t.decimal "base_price"
    t.jsonb "wallet_base_price"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addition_id"], name: "index_trade_addition_charges_on_addition_id"
  end

  create_table "trade_additions", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "deal_type"
    t.bigint "deal_id", scale: 8
    t.string "name"
    t.string "short_name"
    t.string "code"
    t.string "unit_code"
    t.string "description"
    t.string "metering"
    t.boolean "editable", comment: "是否可更改价格"
    t.boolean "verified"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_type", "deal_id"], name: "index_trade_additions_on_deal"
    t.index ["organ_id"], name: "index_trade_additions_on_organ_id"
  end

  create_table "trade_advances", id: { scale: 8 }, force: :cascade do |t|
    t.decimal "price", limit: 2, precision: 10
    t.string "apple_product_id"
    t.decimal "amount", limit: 2, precision: 10
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "card_template_id", scale: 8
    t.string "name"
    t.string "sku"
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.boolean "open", default: false
    t.bigint "wallet_template_id", scale: 8
    t.string "good_type"
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.bigint "organ_id", scale: 8
    t.boolean "lawful", comment: "是否法币"
    t.index ["card_template_id"], name: "index_trade_advances_on_card_template_id"
    t.index ["organ_id"], name: "index_trade_advances_on_organ_id"
    t.index ["wallet_template_id"], name: "index_trade_advances_on_wallet_template_id"
  end

  create_table "trade_card_advances", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "card_id", scale: 8
    t.bigint "advance_id", scale: 8
    t.bigint "trade_item_id", scale: 8
    t.decimal "price", limit: 2, precision: 10
    t.decimal "amount", limit: 2, precision: 10
    t.string "state"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "note"
    t.string "kind"
    t.bigint "card_prepayment_id", scale: 8
    t.index ["advance_id"], name: "index_trade_card_advances_on_advance_id"
    t.index ["card_id"], name: "index_trade_card_advances_on_card_id"
    t.index ["card_prepayment_id"], name: "index_trade_card_advances_on_card_prepayment_id"
    t.index ["trade_item_id"], name: "index_trade_card_advances_on_trade_item_id"
  end

  create_table "trade_card_logs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "card_id", scale: 8
    t.string "source_type"
    t.bigint "source_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.string "title"
    t.string "tag_str"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["card_id"], name: "index_trade_card_logs_on_card_id"
    t.index ["source_type", "source_id"], name: "index_trade_card_logs_on_source_type_and_source_id"
  end

  create_table "trade_card_prepayments", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "card_template_id", scale: 8
    t.string "token"
    t.decimal "amount"
    t.datetime "expire_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_template_id"], name: "index_trade_card_prepayments_on_card_template_id"
  end

  create_table "trade_card_promotes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "card_template_id", scale: 8
    t.bigint "promote_id", scale: 8
    t.decimal "income_min", limit: 2, precision: 10, default: "0.0"
    t.decimal "income_max", limit: 2, precision: 10, default: "99999999.98999999"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_template_id"], name: "index_trade_card_promotes_on_card_template_id"
    t.index ["promote_id"], name: "index_trade_card_promotes_on_promote_id"
  end

  create_table "trade_card_purchases", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "card_id", scale: 8
    t.bigint "item_id", scale: 8
    t.bigint "purchase_id", scale: 8
    t.decimal "price"
    t.integer "days", scale: 4, default: 0
    t.integer "months", scale: 4, default: 0
    t.integer "years", scale: 4, default: 0
    t.string "state"
    t.string "note"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_expire_at"
    t.index ["card_id"], name: "index_trade_card_purchases_on_card_id"
    t.index ["item_id"], name: "index_trade_card_purchases_on_item_id"
    t.index ["purchase_id"], name: "index_trade_card_purchases_on_purchase_id"
  end

  create_table "trade_card_templates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "description"
    t.string "text_color"
    t.integer "cards_count", scale: 4, default: 0
    t.string "code"
    t.integer "grade", scale: 4, default: 1, comment: "会员级别"
    t.bigint "promote_id", scale: 8
    t.bigint "parent_id", scale: 8
    t.boolean "enabled"
    t.index ["organ_id"], name: "index_trade_card_templates_on_organ_id"
    t.index ["parent_id"], name: "index_trade_card_templates_on_parent_id"
    t.index ["promote_id"], name: "index_trade_card_templates_on_promote_id"
  end

  create_table "trade_cards", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "card_template_id", scale: 8
    t.bigint "client_id", scale: 8
    t.string "card_uuid"
    t.integer "lock_version", scale: 4
    t.datetime "effect_at", precision: nil
    t.datetime "expire_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "agency_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.boolean "temporary", default: false, comment: "在购物车勾选临时生效"
    t.bigint "maintain_id", scale: 8
    t.index ["agency_id"], name: "index_trade_cards_on_agency_id"
    t.index ["card_template_id"], name: "index_trade_cards_on_card_template_id"
    t.index ["maintain_id"], name: "index_trade_cards_on_maintain_id"
    t.index ["member_id"], name: "index_trade_cards_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_cards_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_cards_on_organ_id"
    t.index ["user_id"], name: "index_trade_cards_on_user_id"
  end

  create_table "trade_cart_promotes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "cart_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.bigint "order_id", scale: 8
    t.bigint "promote_id", scale: 8
    t.bigint "promote_charge_id", scale: 8
    t.integer "sequence", scale: 4
    t.decimal "original_amount", comment: "初始价格"
    t.decimal "based_amount", default: "0.0", comment: "基于此价格计算，默认为 trade_item 的 amount，与sequence有关"
    t.decimal "computed_amount", default: "0.0", comment: "计算出的价格"
    t.decimal "amount", default: "0.0", comment: "默认等于 computed_amount，如果客服人员修改过价格后，则 amount 会发生变化"
    t.string "note", comment: "备注"
    t.boolean "edited", default: false, comment: "是否被客服改过价"
    t.string "promote_name"
    t.string "status", default: "init"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "value"
    t.index ["cart_id"], name: "index_trade_cart_promotes_on_cart_id"
    t.index ["order_id"], name: "index_trade_cart_promotes_on_order_id"
    t.index ["organ_id"], name: "index_trade_cart_promotes_on_organ_id"
    t.index ["promote_charge_id"], name: "index_trade_cart_promotes_on_promote_charge_id"
    t.index ["promote_id"], name: "index_trade_cart_promotes_on_promote_id"
  end

  create_table "trade_carts", id: { scale: 8 }, force: :cascade do |t|
    t.decimal "amount", limit: 2, precision: 10
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id", scale: 8
    t.bigint "payment_strategy_id", scale: 8
    t.integer "deposit_ratio", scale: 4
    t.bigint "organ_id", scale: 8
    t.decimal "retail_price", default: "0.0", comment: "商品汇总的原价"
    t.decimal "discount_price", default: "0.0"
    t.decimal "bulk_price", default: "0.0"
    t.decimal "total_quantity", default: "0.0"
    t.decimal "item_amount", default: "0.0"
    t.decimal "overall_additional_amount", default: "0.0"
    t.decimal "overall_reduced_amount", default: "0.0"
    t.bigint "address_id", scale: 8
    t.integer "lock_version", scale: 4
    t.decimal "original_amount", default: "0.0", comment: "原价，应用优惠之前的价格"
    t.bigint "member_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.boolean "auto", default: false, comment: "自动下单"
    t.jsonb "extra", default: {}
    t.string "good_type"
    t.string "aim"
    t.integer "items_count", scale: 4, default: 0
    t.bigint "maintain_id", scale: 8
    t.bigint "client_id", scale: 8
    t.boolean "fresh"
    t.decimal "advance_amount"
    t.index ["address_id"], name: "index_trade_carts_on_address_id"
    t.index ["client_id"], name: "index_trade_carts_on_client_id"
    t.index ["maintain_id"], name: "index_trade_carts_on_maintain_id"
    t.index ["member_id"], name: "index_trade_carts_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_carts_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_carts_on_organ_id"
    t.index ["payment_strategy_id"], name: "index_trade_carts_on_payment_strategy_id"
    t.index ["user_id"], name: "index_trade_carts_on_user_id"
  end

  create_table "trade_cash_givens", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "cash_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.string "title"
    t.decimal "amount", default: "0.0"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cash_id"], name: "index_trade_cash_givens_on_cash_id"
    t.index ["organ_id"], name: "index_trade_cash_givens_on_organ_id"
  end

  create_table "trade_cash_logs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "cash_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "source_type"
    t.bigint "source_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.string "title"
    t.string "tag_str"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["cash_id"], name: "index_trade_cash_logs_on_cash_id"
    t.index ["source_type", "source_id"], name: "index_trade_cash_logs_on_source_type_and_source_id"
    t.index ["user_id"], name: "index_trade_cash_logs_on_user_id"
  end

  create_table "trade_cashes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10, default: "0.0"
    t.decimal "income_amount", limit: 2, precision: 10, default: "0.0"
    t.decimal "expense_amount", limit: 2, precision: 10, default: "0.0"
    t.integer "lock_version", scale: 4
    t.string "account_bank"
    t.string "account_name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "account_number"
    t.index ["user_id"], name: "index_trade_cashes_on_user_id"
  end

  create_table "trade_deliveries", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.bigint "scene_id", scale: 8
    t.bigint "order_id", scale: 8
    t.boolean "fetch_oneself", comment: "自取"
    t.datetime "fetch_start_at"
    t.datetime "fetch_finish_at"
    t.date "produce_on", comment: "对接生产管理"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "maintain_id", scale: 8
    t.bigint "client_id", scale: 8
    t.index ["client_id"], name: "index_trade_deliveries_on_client_id"
    t.index ["maintain_id"], name: "index_trade_deliveries_on_maintain_id"
    t.index ["member_id"], name: "index_trade_deliveries_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_deliveries_on_member_organ_id"
    t.index ["order_id"], name: "index_trade_deliveries_on_order_id"
    t.index ["organ_id"], name: "index_trade_deliveries_on_organ_id"
    t.index ["scene_id"], name: "index_trade_deliveries_on_scene_id"
    t.index ["user_id"], name: "index_trade_deliveries_on_user_id"
  end

  create_table "trade_exchange_rates", id: { scale: 8 }, force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_holds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.bigint "item_id", scale: 8
    t.string "rentable_type"
    t.bigint "rentable_id", scale: 8
    t.decimal "amount"
    t.datetime "rent_start_at"
    t.datetime "rent_finish_at", comment: "实际结束时间"
    t.datetime "rent_present_finish_at", comment: "周期性计费时间"
    t.datetime "rent_estimate_finish_at", comment: "预估结束时间"
    t.integer "rent_duration", scale: 4
    t.integer "rent_estimate_duration", scale: 4
    t.jsonb "wallet_amount"
    t.decimal "estimate_amount"
    t.jsonb "estimate_wallet_amount"
    t.decimal "invest_amount", comment: "投资分成"
    t.jsonb "extra"
    t.string "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_trade_holds_on_item_id"
    t.index ["member_id"], name: "index_trade_holds_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_holds_on_member_organ_id"
    t.index ["rentable_type", "rentable_id"], name: "index_trade_holds_on_rentable"
    t.index ["user_id"], name: "index_trade_holds_on_user_id"
  end

  create_table "trade_item_promotes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "item_id", scale: 8
    t.bigint "promote_good_id", scale: 8
    t.bigint "promote_id", scale: 8
    t.decimal "amount", default: "0.0"
    t.string "promote_name"
    t.string "status", default: "init"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "promote_charge_id", scale: 8
    t.decimal "value"
    t.index ["item_id"], name: "index_trade_item_promotes_on_item_id"
    t.index ["promote_charge_id"], name: "index_trade_item_promotes_on_promote_charge_id"
    t.index ["promote_good_id"], name: "index_trade_item_promotes_on_promote_good_id"
    t.index ["promote_id"], name: "index_trade_item_promotes_on_promote_id"
  end

  create_table "trade_items", id: { scale: 8 }, force: :cascade do |t|
    t.string "good_type"
    t.bigint "good_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.decimal "number"
    t.decimal "reduced_amount", limit: 2, precision: 10
    t.decimal "additional_amount", limit: 2, precision: 10
    t.decimal "single_price", limit: 2, precision: 10
    t.decimal "original_amount", limit: 2, precision: 10
    t.decimal "retail_price", limit: 2, precision: 10
    t.decimal "wholesale_price", limit: 2, precision: 10
    t.string "status"
    t.string "good_name"
    t.decimal "weight", default: "0.0", comment: "重量"
    t.string "note"
    t.decimal "advance_amount", default: "0.0"
    t.json "extra", default: {}
    t.bigint "address_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "order_id", scale: 8
    t.bigint "member_id", scale: 8
    t.datetime "expire_at"
    t.bigint "organ_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.string "vip_code"
    t.string "aim", default: "use"
    t.bigint "station_id", scale: 8
    t.bigint "from_address_id", scale: 8
    t.bigint "from_station_id", scale: 8
    t.bigint "current_cart_id", scale: 8
    t.string "uuid"
    t.integer "volume", scale: 4, default: 0, comment: "体积"
    t.bigint "client_id", scale: 8
    t.decimal "done_number", comment: "已达成交易数量"
    t.jsonb "wallet_amount"
    t.string "delivery_status"
    t.bigint "operator_id", scale: 8
    t.integer "holds_count", scale: 4
    t.bigint "scene_id", scale: 8
    t.bigint "desk_id", scale: 8
    t.string "job_id"
    t.date "produce_on", comment: "对接生产管理"
    t.bigint "maintain_id", scale: 8
    t.virtual "rest_number", type: :decimal, as: "(number - done_number)", stored: true
    t.index ["address_id"], name: "index_trade_items_on_address_id"
    t.index ["client_id"], name: "index_trade_items_on_client_id"
    t.index ["current_cart_id"], name: "index_trade_items_on_current_cart_id"
    t.index ["desk_id"], name: "index_trade_items_on_desk_id"
    t.index ["from_address_id"], name: "index_trade_items_on_from_address_id"
    t.index ["from_station_id"], name: "index_trade_items_on_from_station_id"
    t.index ["good_type", "good_id"], name: "index_trade_items_on_good_type_and_good_id"
    t.index ["maintain_id"], name: "index_trade_items_on_maintain_id"
    t.index ["member_id"], name: "index_trade_items_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_items_on_member_organ_id"
    t.index ["operator_id"], name: "index_trade_items_on_operator_id"
    t.index ["order_id"], name: "index_trade_items_on_order_id"
    t.index ["organ_id"], name: "index_trade_items_on_organ_id"
    t.index ["scene_id"], name: "index_trade_items_on_scene_id"
    t.index ["station_id"], name: "index_trade_items_on_station_id"
    t.index ["user_id"], name: "index_trade_items_on_user_id"
  end

  create_table "trade_orders", id: { scale: 8 }, force: :cascade do |t|
    t.string "uuid", null: false
    t.string "state", default: "0"
    t.decimal "amount", limit: 2, precision: 10
    t.decimal "received_amount", limit: 2, precision: 10
    t.decimal "item_amount", limit: 2, precision: 10
    t.string "currency"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "payment_strategy_id", scale: 8
    t.decimal "overall_reduced_amount", limit: 2, precision: 10
    t.decimal "overall_additional_amount", limit: 2, precision: 10
    t.string "payment_status"
    t.bigint "user_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.integer "lock_version", scale: 4
    t.string "note", scale: 4096
    t.datetime "expire_at", precision: nil
    t.json "extra", default: {}
    t.integer "items_count", scale: 4, default: 0
    t.bigint "address_id", scale: 8
    t.bigint "produce_plan_id", scale: 8
    t.decimal "original_amount", default: "0.0", comment: "原价，应用优惠之前的价格"
    t.bigint "member_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.string "serial_number"
    t.datetime "paid_at"
    t.bigint "station_id", scale: 8
    t.bigint "from_address_id", scale: 8
    t.bigint "from_station_id", scale: 8
    t.bigint "current_cart_id", scale: 8
    t.bigint "from_user_id", scale: 8
    t.bigint "from_member_id", scale: 8
    t.bigint "from_member_organ_id", scale: 8
    t.datetime "pay_deadline_at"
    t.decimal "unreceived_amount"
    t.string "generate_mode", default: "myself"
    t.bigint "maintain_id", scale: 8
    t.bigint "client_id", scale: 8
    t.boolean "pay_auto"
    t.string "aim"
    t.decimal "adjust_amount"
    t.bigint "operator_id", scale: 8
    t.decimal "advance_amount"
    t.index ["address_id"], name: "index_trade_orders_on_address_id"
    t.index ["client_id"], name: "index_trade_orders_on_client_id"
    t.index ["current_cart_id"], name: "index_trade_orders_on_current_cart_id"
    t.index ["from_address_id"], name: "index_trade_orders_on_from_address_id"
    t.index ["from_member_id"], name: "index_trade_orders_on_from_member_id"
    t.index ["from_member_organ_id"], name: "index_trade_orders_on_from_member_organ_id"
    t.index ["from_station_id"], name: "index_trade_orders_on_from_station_id"
    t.index ["from_user_id"], name: "index_trade_orders_on_from_user_id"
    t.index ["maintain_id"], name: "index_trade_orders_on_maintain_id"
    t.index ["member_id"], name: "index_trade_orders_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_orders_on_member_organ_id"
    t.index ["operator_id"], name: "index_trade_orders_on_operator_id"
    t.index ["organ_id"], name: "index_trade_orders_on_organ_id"
    t.index ["payment_strategy_id"], name: "index_trade_orders_on_payment_strategy_id"
    t.index ["produce_plan_id"], name: "index_trade_orders_on_produce_plan_id"
    t.index ["station_id"], name: "index_trade_orders_on_station_id"
    t.index ["user_id"], name: "index_trade_orders_on_user_id"
  end

  create_table "trade_payment_methods", id: { scale: 8 }, force: :cascade do |t|
    t.string "type"
    t.string "account_name"
    t.string "account_num"
    t.string "bank"
    t.text "extra"
    t.boolean "verified"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "creator_id", scale: 8
    t.boolean "myself", default: true
    t.index ["creator_id"], name: "index_trade_payment_methods_on_creator_id"
  end

  create_table "trade_payment_orders", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "payment_id", scale: 8
    t.bigint "order_id", scale: 8
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "state"
    t.bigint "user_id", scale: 8
    t.string "kind"
    t.decimal "payment_amount"
    t.decimal "order_amount"
    t.string "wallet_code"
    t.index ["order_id"], name: "index_trade_payment_orders_on_order_id"
    t.index ["payment_id"], name: "index_trade_payment_orders_on_payment_id"
    t.index ["user_id"], name: "index_trade_payment_orders_on_user_id"
  end

  create_table "trade_payment_references", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "payment_method_id", scale: 8
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "state"
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.index ["member_id"], name: "index_trade_payment_references_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_payment_references_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_payment_references_on_organ_id"
    t.index ["payment_method_id"], name: "index_trade_payment_references_on_payment_method_id"
    t.index ["user_id"], name: "index_trade_payment_references_on_user_id"
  end

  create_table "trade_payment_strategies", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "strategy"
    t.integer "period", scale: 4, default: 0
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "organ_id", scale: 8
    t.boolean "from_pay", default: true
    t.index ["organ_id"], name: "index_trade_payment_strategies_on_organ_id"
  end

  create_table "trade_payments", id: { scale: 8 }, force: :cascade do |t|
    t.string "type", scale: 255
    t.decimal "total_amount", limit: 2, precision: 10
    t.decimal "fee_amount", limit: 2, precision: 10
    t.decimal "income_amount", limit: 2, precision: 10
    t.decimal "checked_amount", limit: 2, precision: 10
    t.decimal "adjust_amount", limit: 2, precision: 10, default: "0.0"
    t.string "payment_uuid", scale: 255
    t.string "notify_type", scale: 255
    t.datetime "notified_at", precision: nil
    t.string "pay_status", scale: 255
    t.string "seller_identifier", scale: 255
    t.string "buyer_name", scale: 255
    t.string "buyer_identifier", scale: 255
    t.string "buyer_bank"
    t.integer "user_id", scale: 4
    t.string "currency", scale: 255
    t.string "comment"
    t.bigint "payment_method_id", scale: 8
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "state"
    t.bigint "organ_id", scale: 8
    t.boolean "verified", default: true
    t.integer "lock_version", scale: 4
    t.decimal "refunded_amount", default: "0.0"
    t.jsonb "extra", default: {}
    t.bigint "wallet_id", scale: 8
    t.integer "payment_orders_count", scale: 4, default: 0
    t.integer "payment_id", scale: 4, comment: "for paypal"
    t.bigint "operator_id", scale: 8
    t.jsonb "extra_params"
    t.integer "refunds_count", scale: 4
    t.string "appid"
    t.index ["operator_id"], name: "index_trade_payments_on_operator_id"
    t.index ["organ_id"], name: "index_trade_payments_on_organ_id"
    t.index ["payment_method_id"], name: "index_trade_payments_on_payment_method_id"
    t.index ["wallet_id"], name: "index_trade_payments_on_wallet_id"
  end

  create_table "trade_payouts", id: { scale: 8 }, force: :cascade do |t|
    t.string "type"
    t.string "payable_type"
    t.bigint "payable_id", scale: 8
    t.bigint "operator_id", scale: 8
    t.string "payout_uuid"
    t.decimal "requested_amount", limit: 2, precision: 10
    t.decimal "actual_amount", limit: 2, precision: 10
    t.string "state"
    t.datetime "paid_at", precision: nil
    t.boolean "advance", default: false
    t.string "account_bank"
    t.string "account_name"
    t.string "account_num"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "wallet_id", scale: 8
    t.index ["operator_id"], name: "index_trade_payouts_on_operator_id"
    t.index ["payable_type", "payable_id"], name: "index_trade_payouts_on_payable_type_and_payable_id"
    t.index ["wallet_id"], name: "index_trade_payouts_on_wallet_id"
  end

  create_table "trade_privileges", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "card_template_id", scale: 8
    t.string "name"
    t.integer "amount", scale: 4, comment: "额度"
    t.decimal "price", comment: "价格"
    t.string "code"
    t.integer "position", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "promote_id", scale: 8
    t.index ["card_template_id"], name: "index_trade_privileges_on_card_template_id"
    t.index ["promote_id"], name: "index_trade_privileges_on_promote_id"
  end

  create_table "trade_promote_carts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "promote_id", scale: 8
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "state"
    t.string "status"
    t.integer "trade_promotes_count", scale: 4, default: 0
    t.bigint "promote_good_id", scale: 8
    t.datetime "effect_at", precision: nil
    t.datetime "expire_at", precision: nil
    t.bigint "cart_id", scale: 8
    t.index ["cart_id"], name: "index_trade_promote_carts_on_cart_id"
    t.index ["promote_good_id"], name: "index_trade_promote_carts_on_promote_good_id"
    t.index ["promote_id"], name: "index_trade_promote_carts_on_promote_id"
  end

  create_table "trade_promote_charges", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "promote_id", scale: 8
    t.decimal "min", limit: 2, precision: 10, default: "0.0"
    t.decimal "max", limit: 2, precision: 10, default: "99999999.99"
    t.decimal "parameter", limit: 2, precision: 10
    t.string "type"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "contain_max"
    t.boolean "contain_min"
    t.decimal "base_price", limit: 2, precision: 10
    t.decimal "filter_min", limit: 2, precision: 10
    t.decimal "filter_max", limit: 2, precision: 10
    t.jsonb "wallet_price"
    t.jsonb "wallet_base_price"
    t.jsonb "extra"
    t.index ["promote_id"], name: "index_trade_promote_charges_on_promote_id"
  end

  create_table "trade_promote_extras", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "promote_id", scale: 8
    t.string "extra_name"
    t.string "column_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promote_id"], name: "index_trade_promote_extras_on_promote_id"
  end

  create_table "trade_promote_goods", id: { scale: 8 }, force: :cascade do |t|
    t.string "good_type"
    t.bigint "good_id", scale: 8
    t.bigint "promote_id", scale: 8
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "status"
    t.datetime "effect_at", precision: nil
    t.datetime "expire_at", precision: nil
    t.bigint "organ_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.string "type"
    t.integer "item_promotes_count", scale: 4, default: 0
    t.string "identity"
    t.integer "blacklists_count", scale: 4, default: 0
    t.integer "use_limit", scale: 4
    t.boolean "over_limit", default: false
    t.string "aim", default: "use"
    t.bigint "maintain_id", scale: 8
    t.bigint "client_id", scale: 8
    t.index ["client_id"], name: "index_trade_promote_goods_on_client_id"
    t.index ["good_type", "good_id"], name: "index_trade_promote_goods_on_good_type_and_good_id"
    t.index ["maintain_id"], name: "index_trade_promote_goods_on_maintain_id"
    t.index ["member_id"], name: "index_trade_promote_goods_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_promote_goods_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_promote_goods_on_organ_id"
    t.index ["promote_id"], name: "index_trade_promote_goods_on_promote_id"
    t.index ["user_id"], name: "index_trade_promote_goods_on_user_id"
  end

  create_table "trade_promotes", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "verified", default: false
    t.integer "sequence", scale: 4, default: 1
    t.string "extra", array: true
    t.string "short_name"
    t.string "description"
    t.string "code"
    t.string "deal_type"
    t.bigint "deal_id", scale: 8
    t.string "metering"
    t.boolean "editable"
    t.bigint "organ_id", scale: 8
    t.string "unit_code"
    t.index ["deal_type", "deal_id"], name: "index_trade_promotes_on_deal_type_and_deal_id"
    t.index ["organ_id"], name: "index_trade_promotes_on_organ_id"
  end

  create_table "trade_purchases", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "card_template_id", scale: 8
    t.string "name"
    t.string "sku"
    t.decimal "price"
    t.decimal "advance_price", default: "0.0"
    t.jsonb "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.string "title"
    t.string "note"
    t.integer "years", scale: 4, default: 0
    t.integer "months", scale: 4, default: 0
    t.integer "days", scale: 4, default: 0
    t.boolean "default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "good_type"
    t.jsonb "card_price", default: {}
    t.jsonb "wallet_price", default: {}
    t.decimal "invest_ratio", default: "0.0", comment: "抽成比例"
    t.index ["card_template_id"], name: "index_trade_purchases_on_card_template_id"
  end

  create_table "trade_refunds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "order_id", scale: 8
    t.bigint "payment_id", scale: 8
    t.bigint "operator_id", scale: 8
    t.string "type"
    t.decimal "total_amount", limit: 2, precision: 10
    t.string "buyer_identifier"
    t.string "comment", scale: 512
    t.string "state", default: "0"
    t.datetime "refunded_at", precision: nil
    t.string "reason", scale: 512
    t.string "currency"
    t.string "refund_uuid"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.json "response"
    t.bigint "organ_id", scale: 8
    t.bigint "wallet_id", scale: 8
    t.index ["operator_id"], name: "index_trade_refunds_on_operator_id"
    t.index ["order_id"], name: "index_trade_refunds_on_order_id"
    t.index ["organ_id"], name: "index_trade_refunds_on_organ_id"
    t.index ["payment_id"], name: "index_trade_refunds_on_payment_id"
    t.index ["wallet_id"], name: "index_trade_refunds_on_wallet_id"
  end

  create_table "trade_rent_charges", id: { scale: 8 }, force: :cascade do |t|
    t.string "rentable_type"
    t.bigint "rentable_id", scale: 8
    t.integer "min", scale: 4
    t.integer "max", scale: 4
    t.integer "filter_min", scale: 4
    t.integer "filter_max", scale: 4
    t.boolean "contain_min"
    t.boolean "contain_max"
    t.decimal "parameter"
    t.jsonb "wallet_price"
    t.decimal "base_price"
    t.jsonb "wallet_base_price"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rentable_type", "rentable_id"], name: "index_trade_rent_charges_on_rentable"
  end

  create_table "trade_rents", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.string "rentable_type"
    t.bigint "rentable_id", scale: 8
    t.decimal "amount", comment: "价格小计"
    t.string "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "invest_amount", comment: "投资分成"
    t.string "good_type"
    t.bigint "good_id", scale: 8
    t.jsonb "extra"
    t.datetime "rent_start_at"
    t.datetime "rent_finish_at"
    t.datetime "rent_present_finish_at"
    t.jsonb "wallet_amount"
    t.datetime "rent_estimate_finish_at"
    t.decimal "estimate_amount"
    t.jsonb "estimate_wallet_amount"
    t.index ["good_type", "good_id"], name: "index_trade_rents_on_good"
    t.index ["member_id"], name: "index_trade_rents_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_rents_on_member_organ_id"
    t.index ["rentable_type", "rentable_id"], name: "index_trade_rents_on_rentable"
    t.index ["user_id"], name: "index_trade_rents_on_user_id"
  end

  create_table "trade_trade_promotes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "promote_id", scale: 8
    t.bigint "promote_charge_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "trade_item_id", scale: 8
    t.bigint "promote_good_id", scale: 8
    t.integer "sequence", scale: 4
    t.decimal "based_amount", limit: 2, precision: 10
    t.decimal "original_amount", limit: 2, precision: 10
    t.decimal "computed_amount", limit: 2, precision: 10
    t.string "note"
    t.bigint "promote_cart_id", scale: 8
    t.boolean "edited", comment: "是否被客服改过价"
    t.bigint "cart_id", scale: 8
    t.bigint "order_id", scale: 8
    t.string "status", default: "init"
    t.string "promote_name"
    t.bigint "organ_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.index ["cart_id"], name: "index_trade_trade_promotes_on_cart_id"
    t.index ["member_id"], name: "index_trade_trade_promotes_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_trade_promotes_on_member_organ_id"
    t.index ["order_id"], name: "index_trade_trade_promotes_on_order_id"
    t.index ["organ_id"], name: "index_trade_trade_promotes_on_organ_id"
    t.index ["promote_cart_id"], name: "index_trade_trade_promotes_on_promote_cart_id"
    t.index ["promote_charge_id"], name: "index_trade_trade_promotes_on_promote_charge_id"
    t.index ["promote_good_id"], name: "index_trade_trade_promotes_on_promote_good_id"
    t.index ["promote_id"], name: "index_trade_trade_promotes_on_promote_id"
    t.index ["trade_item_id"], name: "index_trade_trade_promotes_on_trade_item_id"
    t.index ["user_id"], name: "index_trade_trade_promotes_on_user_id"
  end

  create_table "trade_units", id: { scale: 8 }, force: :cascade do |t|
    t.boolean "default"
    t.decimal "rate", comment: "相对于默认单位的计算比率"
    t.string "name"
    t.string "code"
    t.string "metering"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_wallet_advances", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wallet_id", scale: 8
    t.bigint "advance_id", scale: 8
    t.bigint "item_id", scale: 8
    t.decimal "price"
    t.decimal "amount"
    t.string "state"
    t.string "note"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "operator_id", scale: 8
    t.bigint "wallet_prepayment_id", scale: 8
    t.index ["advance_id"], name: "index_trade_wallet_advances_on_advance_id"
    t.index ["item_id"], name: "index_trade_wallet_advances_on_item_id"
    t.index ["operator_id"], name: "index_trade_wallet_advances_on_operator_id"
    t.index ["wallet_id"], name: "index_trade_wallet_advances_on_wallet_id"
    t.index ["wallet_prepayment_id"], name: "index_trade_wallet_advances_on_wallet_prepayment_id"
  end

  create_table "trade_wallet_frozens", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "operator_id", scale: 8
    t.bigint "wallet_id", scale: 8
    t.bigint "item_id", scale: 8
    t.decimal "amount"
    t.string "note"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_trade_wallet_frozens_on_item_id"
    t.index ["operator_id"], name: "index_trade_wallet_frozens_on_operator_id"
    t.index ["wallet_id"], name: "index_trade_wallet_frozens_on_wallet_id"
  end

  create_table "trade_wallet_goods", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wallet_template_id", scale: 8
    t.string "good_type"
    t.bigint "good_id", scale: 8
    t.string "wallet_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_type", "good_id"], name: "index_trade_wallet_goods_on_good"
    t.index ["wallet_template_id"], name: "index_trade_wallet_goods_on_wallet_template_id"
  end

  create_table "trade_wallet_logs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wallet_id", scale: 8
    t.string "source_type"
    t.bigint "source_id", scale: 8
    t.string "title"
    t.string "tag_str"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_type", "source_id"], name: "index_trade_wallet_logs_on_source"
    t.index ["wallet_id"], name: "index_trade_wallet_logs_on_wallet_id"
  end

  create_table "trade_wallet_prepayments", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wallet_template_id", scale: 8
    t.string "token"
    t.decimal "amount"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "lawful"
    t.index ["wallet_template_id"], name: "index_trade_wallet_prepayments_on_wallet_template_id"
  end

  create_table "trade_wallet_sells", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "operator_id", scale: 8
    t.bigint "wallet_id", scale: 8
    t.bigint "item_id", scale: 8
    t.string "selled_type"
    t.bigint "selled_id", scale: 8
    t.decimal "amount"
    t.string "note"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_trade_wallet_sells_on_item_id"
    t.index ["operator_id"], name: "index_trade_wallet_sells_on_operator_id"
    t.index ["selled_type", "selled_id"], name: "index_trade_wallet_sells_on_selled"
    t.index ["wallet_id"], name: "index_trade_wallet_sells_on_wallet_id"
  end

  create_table "trade_wallet_templates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "description"
    t.integer "wallets_count", scale: 4, default: 0
    t.string "code"
    t.string "platform"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unit_name"
    t.string "rate", comment: "相对于默认货币的比率"
    t.string "unit"
    t.integer "digit", scale: 4
    t.boolean "enabled", default: true
    t.string "appid", comment: "推广微信公众号"
    t.index ["organ_id"], name: "index_trade_wallet_templates_on_organ_id"
  end

  create_table "trade_wallets", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wallet_template_id", scale: 8
    t.decimal "amount", default: "0.0"
    t.decimal "withdrawable_amount", comment: "可提现的额度"
    t.decimal "income_amount", default: "0.0"
    t.decimal "expense_amount", default: "0.0"
    t.string "account_bank"
    t.string "account_name"
    t.string "account_number"
    t.integer "lock_version", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "member_organ_id", scale: 8
    t.bigint "maintain_id", scale: 8
    t.bigint "client_id", scale: 8
    t.string "name"
    t.string "type"
    t.decimal "advances_amount"
    t.decimal "sells_amount"
    t.decimal "frozen_amount", comment: "支出：冻结金额"
    t.decimal "payout_amount", comment: "支出：提现"
    t.decimal "payment_amount", comment: "支出：钱包支付"
    t.index ["client_id"], name: "index_trade_wallets_on_client_id"
    t.index ["maintain_id"], name: "index_trade_wallets_on_maintain_id"
    t.index ["member_id"], name: "index_trade_wallets_on_member_id"
    t.index ["member_organ_id"], name: "index_trade_wallets_on_member_organ_id"
    t.index ["organ_id"], name: "index_trade_wallets_on_organ_id"
    t.index ["user_id"], name: "index_trade_wallets_on_user_id"
    t.index ["wallet_template_id"], name: "index_trade_wallets_on_wallet_template_id"
  end

  create_table "users", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "last_login_at", precision: nil
    t.inet "last_login_ip"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "disabled", default: false
    t.integer "pomodoro", scale: 4, default: 25
    t.string "timezone"
    t.string "locale"
    t.string "source"
    t.string "invited_code"
    t.string "notifiable_types", default: [], array: true
    t.jsonb "counters", default: {}
    t.integer "showtime", scale: 4, default: 0
    t.boolean "accept_email", default: true
    t.integer "promote_goods_count", scale: 4, default: 0
  end

  create_table "wechat_agencies", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "platform_id", scale: 8
    t.string "appid"
    t.string "access_token"
    t.datetime "access_token_expires_at", precision: nil
    t.string "refresh_token"
    t.string "func_infos", array: true
    t.string "nick_name"
    t.string "head_img"
    t.string "user_name"
    t.string "principal_name"
    t.string "alias_name"
    t.string "qrcode_url"
    t.json "business_info"
    t.string "service_type"
    t.string "verify_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "platform_template_id", scale: 8
    t.string "type"
    t.jsonb "extra"
    t.integer "auditid", scale: 4
    t.jsonb "version_info"
    t.integer "audit_status", scale: 4
    t.string "confirm_name"
    t.string "confirm_content"
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_wechat_agencies_on_organ_id"
    t.index ["platform_id"], name: "index_wechat_agencies_on_platform_id"
    t.index ["platform_template_id"], name: "index_wechat_agencies_on_platform_template_id"
  end

  create_table "wechat_agents", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "jsapi_ticket"
    t.datetime "jsapi_ticket_expires_at"
    t.string "name"
    t.boolean "inviting", comment: "可邀请加入"
    t.string "corpid"
    t.string "secret"
    t.string "token"
    t.string "agentid"
    t.string "encoding_aes_key"
    t.string "user_name"
    t.string "domain"
    t.string "url_link"
    t.boolean "debug"
    t.string "confirm_name"
    t.string "confirm_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_wechat_agents_on_organ_id"
  end

  create_table "wechat_app_configs", id: { scale: 8 }, force: :cascade do |t|
    t.string "appid"
    t.string "value"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_app_configs_on_appid"
  end

  create_table "wechat_app_menus", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "scene_id", scale: 8
    t.bigint "tag_id", scale: 8
    t.bigint "menu_id", scale: 8
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_wechat_app_menus_on_menu_id"
    t.index ["scene_id"], name: "index_wechat_app_menus_on_scene_id"
    t.index ["tag_id"], name: "index_wechat_app_menus_on_tag_id"
  end

  create_table "wechat_app_payees", id: { scale: 8 }, force: :cascade do |t|
    t.string "appid"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mch_id"
    t.boolean "enabled"
    t.index ["appid"], name: "index_wechat_app_payees_on_appid"
  end

  create_table "wechat_apps", id: { scale: 8 }, force: :cascade do |t|
    t.string "name", null: false
    t.boolean "enabled", default: true
    t.string "appid"
    t.string "secret"
    t.boolean "encrypt_mode"
    t.string "encoding_aes_key"
    t.string "token", null: false
    t.string "access_token"
    t.string "jsapi_ticket"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.string "type"
    t.datetime "access_token_expires_at", precision: nil
    t.datetime "jsapi_ticket_expires_at", precision: nil
    t.boolean "shared"
    t.string "user_name"
    t.boolean "oauth_enable", default: true
    t.boolean "inviting", default: false, comment: "可邀请加入"
    t.string "domain"
    t.string "url_link"
    t.string "weapp_id", comment: "关联的小程序"
    t.boolean "global", default: false
    t.boolean "debug"
    t.string "confirm_name"
    t.string "confirm_content"
    t.index ["organ_id"], name: "index_wechat_apps_on_organ_id"
  end

  create_table "wechat_auths", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "platform_id", scale: 8
    t.string "auth_code"
    t.datetime "auth_code_expires_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_id", scale: 8
    t.boolean "testcase"
    t.index ["platform_id"], name: "index_wechat_auths_on_platform_id"
    t.index ["request_id"], name: "index_wechat_auths_on_request_id"
  end

  create_table "wechat_contacts", id: { scale: 8 }, force: :cascade do |t|
    t.string "corpid"
    t.string "userid"
    t.string "part_id"
    t.string "config_id"
    t.string "qr_code"
    t.string "remark"
    t.string "state"
    t.boolean "skip_verify", default: true
    t.string "suite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_corp_external_users", id: { scale: 8 }, force: :cascade do |t|
    t.string "uid"
    t.string "unionid"
    t.string "external_userid"
    t.string "pending_id"
    t.string "corp_id"
    t.string "subject_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corp_id"], name: "index_wechat_corp_external_users_on_corp_id"
    t.index ["external_userid"], name: "index_wechat_corp_external_users_on_external_userid"
    t.index ["uid"], name: "index_wechat_corp_external_users_on_uid"
    t.index ["unionid"], name: "index_wechat_corp_external_users_on_unionid"
  end

  create_table "wechat_corp_users", id: { scale: 8 }, force: :cascade do |t|
    t.string "corpid"
    t.string "device_id"
    t.string "user_ticket"
    t.datetime "ticket_expires_at"
    t.string "open_userid"
    t.string "open_id"
    t.string "identity"
    t.string "name"
    t.string "gender"
    t.string "avatar_url"
    t.string "qr_code"
    t.integer "department", scale: 4, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suite_id"
    t.integer "follows_count", scale: 4, default: 0
    t.bigint "organ_id", scale: 8
    t.string "userid"
    t.index ["corpid"], name: "index_wechat_corp_users_on_corpid"
    t.index ["organ_id"], name: "index_wechat_corp_users_on_organ_id"
  end

  create_table "wechat_corps", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "corpid"
    t.string "corp_type"
    t.string "subject_type"
    t.datetime "verified_end_at"
    t.string "square_logo_url"
    t.integer "user_max", scale: 4
    t.string "full_name"
    t.string "wxqrcode"
    t.string "industry"
    t.string "sub_industry"
    t.string "location"
    t.jsonb "auth_corp_info"
    t.jsonb "auth_user_info"
    t.jsonb "register_code_info"
    t.jsonb "agent"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "jsapi_ticket"
    t.datetime "jsapi_ticket_expires_at"
    t.string "permanent_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suite_id"
    t.string "token"
    t.string "encoding_aes_key"
    t.string "agent_ticket"
    t.datetime "agent_ticket_expires_at"
    t.boolean "debug"
    t.bigint "organ_id", scale: 8
    t.string "open_corpid"
    t.boolean "enabled"
    t.index ["corpid"], name: "index_wechat_corps_on_corpid"
    t.index ["organ_id"], name: "index_wechat_corps_on_organ_id"
  end

  create_table "wechat_developers", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.string "encoding_aes_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_externals", id: { scale: 8 }, force: :cascade do |t|
    t.string "corp_id"
    t.string "external_userid"
    t.string "name"
    t.string "position"
    t.string "avatar"
    t.string "corp_name"
    t.string "corp_full_name"
    t.string "external_type"
    t.string "gender"
    t.string "unionid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_extractions", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "extractor_id", scale: 8
    t.string "name"
    t.string "matched"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_id", scale: 8
    t.integer "serial_number", scale: 4
    t.index ["extractor_id"], name: "index_wechat_extractions_on_extractor_id"
    t.index ["request_id"], name: "index_wechat_extractions_on_request_id"
  end

  create_table "wechat_extractors", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "prefix"
    t.string "suffix"
    t.boolean "more"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "serial"
    t.integer "serial_start", scale: 4
    t.time "start_at"
    t.time "finish_at"
    t.string "valid_response"
    t.string "invalid_response"
    t.bigint "response_id", scale: 8
    t.index ["response_id"], name: "index_wechat_extractors_on_response_id"
  end

  create_table "wechat_follows", id: { scale: 8 }, force: :cascade do |t|
    t.string "userid"
    t.string "remark"
    t.string "description"
    t.string "state"
    t.string "oper_userid"
    t.string "add_way"
    t.string "corp_id"
    t.string "external_userid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_hooks", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "response_id", scale: 8
    t.string "hooked_type"
    t.bigint "hooked_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hooked_type", "hooked_id"], name: "index_wechat_hooks_on_hooked"
    t.index ["response_id"], name: "index_wechat_hooks_on_response_id"
  end

  create_table "wechat_medias", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "source_type"
    t.bigint "source_id", scale: 8
    t.string "attachment_name"
    t.string "media_id"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_type", "source_id"], name: "index_wechat_medias_on_source"
    t.index ["user_id"], name: "index_wechat_medias_on_user_id"
  end

  create_table "wechat_menu_apps", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "menu_id", scale: 8
    t.bigint "scene_id", scale: 8
    t.bigint "tag_id", scale: 8
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_menu_apps_on_appid"
    t.index ["menu_id"], name: "index_wechat_menu_apps_on_menu_id"
    t.index ["scene_id"], name: "index_wechat_menu_apps_on_scene_id"
    t.index ["tag_id"], name: "index_wechat_menu_apps_on_tag_id"
  end

  create_table "wechat_menu_roots", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.integer "position", scale: 4
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organ_id"], name: "index_wechat_menu_roots_on_organ_id"
  end

  create_table "wechat_menus", id: { scale: 8 }, force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "value"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", scale: 4
    t.string "mp_appid"
    t.string "mp_pagepath"
    t.bigint "organ_id", scale: 8
    t.integer "root_position", scale: 4
    t.index ["organ_id"], name: "index_wechat_menus_on_organ_id"
  end

  create_table "wechat_news_reply_items", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "news_reply_id", scale: 8
    t.string "title"
    t.string "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "raw_pic_url"
    t.index ["news_reply_id"], name: "index_wechat_news_reply_items_on_news_reply_id"
  end

  create_table "wechat_notices", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "template_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "notification_id", scale: 8
    t.string "link", default: "index"
    t.string "msg_id"
    t.string "status"
    t.string "type"
    t.string "appid"
    t.string "open_id"
    t.bigint "msg_request_id", scale: 8
    t.index ["msg_request_id"], name: "index_wechat_notices_on_msg_request_id"
    t.index ["notification_id"], name: "index_wechat_notices_on_notification_id"
    t.index ["template_id"], name: "index_wechat_notices_on_template_id"
  end

  create_table "wechat_partners", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "appid", comment: "sp_appid"
    t.string "mch_id", comment: "支付专用、商户号"
    t.text "key"
    t.text "key_v3"
    t.string "serial_no"
    t.text "apiclient_cert"
    t.text "apiclient_key"
    t.datetime "platform_effective_at"
    t.datetime "platform_expire_at"
    t.string "platform_serial_no"
    t.jsonb "encrypt_certificate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_payee_apps", id: { scale: 8 }, force: :cascade do |t|
    t.string "mch_id"
    t.string "appid"
    t.boolean "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appid"], name: "index_wechat_payee_apps_on_appid"
    t.index ["mch_id"], name: "index_wechat_payee_apps_on_mch_id"
  end

  create_table "wechat_payee_domains", id: { scale: 8 }, force: :cascade do |t|
    t.string "mch_id"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain"], name: "index_wechat_payee_domains_on_domain"
    t.index ["mch_id"], name: "index_wechat_payee_domains_on_mch_id"
  end

  create_table "wechat_payees", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "mch_id", comment: "支付专用、商户号"
    t.text "key"
    t.text "key_v3"
    t.string "serial_no"
    t.text "apiclient_cert"
    t.text "apiclient_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "platform_effective_at"
    t.datetime "platform_expire_at"
    t.string "platform_serial_no"
    t.jsonb "encrypt_certificate"
    t.bigint "partner_id", scale: 8
    t.string "type"
    t.string "name"
    t.index ["organ_id"], name: "index_wechat_payees_on_organ_id"
    t.index ["partner_id"], name: "index_wechat_payees_on_partner_id"
  end

  create_table "wechat_platform_templates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "platform_id", scale: 8
    t.string "user_version"
    t.string "user_desc"
    t.integer "template_id", scale: 4
    t.integer "audit_status", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_wechat_platform_templates_on_platform_id"
  end

  create_table "wechat_platform_tickets", id: { scale: 8 }, force: :cascade do |t|
    t.string "signature"
    t.integer "timestamp", scale: 4
    t.string "nonce"
    t.string "msg_signature"
    t.string "appid"
    t.string "ticket_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "message_hash"
    t.string "info_type"
  end

  create_table "wechat_platforms", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "appid"
    t.string "secret"
    t.string "token"
    t.string "encoding_aes_key"
    t.string "verify_ticket"
    t.string "access_token"
    t.datetime "access_token_expires_at", precision: nil
    t.string "pre_auth_code"
    t.datetime "pre_auth_code_expires_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "domain"
    t.bigint "public_agency_id", scale: 8
    t.bigint "program_agency_id", scale: 8
    t.index ["program_agency_id"], name: "index_wechat_platforms_on_program_agency_id"
    t.index ["public_agency_id"], name: "index_wechat_platforms_on_public_agency_id"
  end

  create_table "wechat_provider_organs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "provider_id", scale: 8
    t.string "corpid"
    t.string "open_corpid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_wechat_provider_organs_on_provider_id"
  end

  create_table "wechat_provider_receives", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "provider_id", scale: 8
    t.string "corp_id"
    t.string "user_id"
    t.string "agent_id"
    t.string "msg_id"
    t.string "msg_type"
    t.string "event"
    t.string "event_key"
    t.string "content"
    t.string "encrypt_data"
    t.jsonb "message_hash"
    t.string "msg_format", default: "xml"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corp_id"], name: "index_wechat_provider_receives_on_corp_id"
    t.index ["provider_id"], name: "index_wechat_provider_receives_on_provider_id"
    t.index ["user_id"], name: "index_wechat_provider_receives_on_user_id"
  end

  create_table "wechat_provider_tickets", id: { scale: 8 }, force: :cascade do |t|
    t.integer "timestamp", scale: 4
    t.string "nonce"
    t.string "msg_signature"
    t.string "suite_id"
    t.string "ticket_data"
    t.string "agent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "message_hash"
    t.string "info_type"
  end

  create_table "wechat_providers", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "corp_id"
    t.string "provider_secret"
    t.string "token"
    t.string "encoding_aes_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_token"
    t.datetime "access_token_expires_at"
  end

  create_table "wechat_qy_medias", id: { scale: 8 }, force: :cascade do |t|
    t.string "medium_type"
    t.bigint "medium_id", scale: 8
    t.string "corpid"
    t.string "suite_id"
    t.string "media_id"
    t.string "url"
    t.string "medium_attach"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corpid"], name: "index_wechat_qy_medias_on_corpid"
    t.index ["medium_type", "medium_id"], name: "index_wechat_qy_medias_on_medium"
    t.index ["suite_id"], name: "index_wechat_qy_medias_on_suite_id"
  end

  create_table "wechat_receivers", id: { scale: 8 }, force: :cascade do |t|
    t.string "account"
    t.string "name"
    t.string "custom_relation"
    t.jsonb "res"
    t.string "receiver_type"
    t.string "relation_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "app_payee_id", scale: 8
    t.index ["app_payee_id"], name: "index_wechat_receivers_on_app_payee_id"
  end

  create_table "wechat_receives", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "platform_id", scale: 8
    t.string "appid"
    t.string "open_id"
    t.string "msg_id"
    t.string "msg_type"
    t.string "content"
    t.string "encrypt_data"
    t.json "message_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "msg_format", default: "xml"
    t.string "info_type"
    t.index ["appid"], name: "index_wechat_receives_on_appid"
    t.index ["open_id"], name: "index_wechat_receives_on_open_id"
    t.index ["platform_id"], name: "index_wechat_receives_on_platform_id"
  end

  create_table "wechat_registers", id: { scale: 8 }, force: :cascade do |t|
    t.string "id_name"
    t.string "id_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state", default: "init"
    t.string "appid"
    t.bigint "user_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.string "email_code"
    t.string "password"
    t.string "mobile"
    t.string "mobile_code"
    t.string "personal_wechat"
    t.string "organ_name"
    t.string "organ_code"
    t.index ["organ_id"], name: "index_wechat_registers_on_organ_id"
    t.index ["user_id"], name: "index_wechat_registers_on_user_id"
  end

  create_table "wechat_replies", id: { scale: 8 }, force: :cascade do |t|
    t.string "messaging_type"
    t.bigint "messaging_id", scale: 8
    t.string "type"
    t.string "value"
    t.json "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "description"
    t.string "appid"
    t.index ["messaging_type", "messaging_id"], name: "index_wechat_replies_on_messaging_type_and_messaging_id"
  end

  create_table "wechat_request_responses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "response_id", scale: 8
    t.string "request_type"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_wechat_request_responses_on_response_id"
  end

  create_table "wechat_requests", id: { scale: 8 }, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "msg_type"
    t.string "event"
    t.string "event_key"
    t.jsonb "raw_body"
    t.string "appid"
    t.string "open_id"
    t.bigint "receive_id", scale: 8
    t.boolean "init_wechat_user"
    t.boolean "init_user_tag"
    t.jsonb "reply_body"
    t.jsonb "reply_encrypt"
    t.datetime "sent_at"
    t.string "userid"
    t.bigint "scene_organ_id", scale: 8
    t.index ["receive_id"], name: "index_wechat_requests_on_receive_id"
    t.index ["scene_organ_id"], name: "index_wechat_requests_on_scene_organ_id"
  end

  create_table "wechat_responses", id: { scale: 8 }, force: :cascade do |t|
    t.string "match_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expire_at", precision: nil
    t.boolean "contain", default: true
    t.string "appid"
    t.boolean "enabled", default: true
    t.bigint "reply_id", scale: 8
    t.index ["reply_id"], name: "index_wechat_responses_on_reply_id"
  end

  create_table "wechat_scene_menus", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "scene_id", scale: 8
    t.bigint "menu_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tag_id", scale: 8
    t.index ["menu_id"], name: "index_wechat_scene_menus_on_menu_id"
    t.index ["scene_id"], name: "index_wechat_scene_menus_on_scene_id"
    t.index ["tag_id"], name: "index_wechat_scene_menus_on_tag_id"
  end

  create_table "wechat_scenes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "match_value"
    t.integer "expire_seconds", scale: 4
    t.datetime "expire_at", precision: nil
    t.string "qrcode_ticket"
    t.string "qrcode_url"
    t.string "appid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "menu_id"
    t.string "aim"
    t.string "handle_type"
    t.bigint "handle_id", scale: 8
    t.index ["appid"], name: "index_wechat_scenes_on_appid"
    t.index ["handle_type", "handle_id"], name: "index_wechat_scenes_on_handle"
    t.index ["organ_id"], name: "index_wechat_scenes_on_organ_id"
  end

  create_table "wechat_services", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "request_id", scale: 8
    t.string "type"
    t.string "msgtype"
    t.string "value"
    t.string "appid"
    t.string "open_id"
    t.json "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_wechat_services_on_request_id"
  end

  create_table "wechat_subscribes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wechat_user_id", scale: 8
    t.bigint "template_id", scale: 8
    t.datetime "sending_at", precision: nil
    t.string "status", default: "accept"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_wechat_subscribes_on_template_id"
    t.index ["wechat_user_id"], name: "index_wechat_subscribes_on_wechat_user_id"
  end

  create_table "wechat_suite_receives", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "provider_id", scale: 8
    t.string "user_id"
    t.string "agent_id"
    t.string "msg_id"
    t.string "msg_type"
    t.string "event"
    t.string "event_key"
    t.string "encrypt_data"
    t.jsonb "message_hash"
    t.string "msg_format", default: "xml"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suiteid"
    t.string "corpid"
    t.string "auth_corp_id"
    t.string "info_type"
    t.index ["provider_id"], name: "index_wechat_suite_receives_on_provider_id"
    t.index ["user_id"], name: "index_wechat_suite_receives_on_user_id"
  end

  create_table "wechat_suite_tickets", id: { scale: 8 }, force: :cascade do |t|
    t.string "ticket_data"
    t.string "agent_id"
    t.jsonb "message_hash"
    t.string "info_type"
    t.string "auth_corp_id"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "suiteid"
    t.string "corpid"
    t.string "to"
  end

  create_table "wechat_suites", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "corp_id"
    t.string "suite_id"
    t.string "secret"
    t.string "token"
    t.string "encoding_aes_key"
    t.string "suite_ticket"
    t.string "suite_ticket_pre"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "pre_auth_code"
    t.datetime "pre_auth_code_expires_at"
    t.string "redirect_controller"
    t.string "redirect_action", default: "index", comment: "默认跳转"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
  end

  create_table "wechat_tags", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "tag_id"
    t.integer "count", scale: 4
    t.integer "user_tags_count", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_tag_id", scale: 8
    t.string "tagging_type"
    t.bigint "tagging_id", scale: 8
    t.string "appid"
    t.string "kind"
    t.index ["tagging_type", "tagging_id"], name: "index_wechat_tags_on_tagging_type_and_tagging_id"
    t.index ["user_tag_id"], name: "index_wechat_tags_on_user_tag_id"
  end

  create_table "wechat_template_configs", id: { scale: 8 }, force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.string "tid"
    t.string "description"
    t.string "notifiable_type"
    t.string "code", default: "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content"
  end

  create_table "wechat_template_key_words", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "template_config_id", scale: 8
    t.integer "position", scale: 4
    t.integer "kid", scale: 4
    t.string "name"
    t.string "example"
    t.string "rule"
    t.string "mapping"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.index ["template_config_id"], name: "index_wechat_template_key_words_on_template_config_id"
  end

  create_table "wechat_templates", id: { scale: 8 }, force: :cascade do |t|
    t.string "appid"
    t.string "template_id"
    t.string "title"
    t.string "content"
    t.string "example"
    t.integer "template_type", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "template_kind"
    t.index ["appid"], name: "index_wechat_templates_on_appid"
  end

  create_table "wechat_user_tags", id: { scale: 8 }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_tagged_id", scale: 8
    t.string "appid"
    t.string "tag_name"
    t.string "open_id"
    t.bigint "member_inviter_id", scale: 8
    t.boolean "synced", default: false
    t.index ["member_inviter_id"], name: "index_wechat_user_tags_on_member_inviter_id"
    t.index ["user_tagged_id"], name: "index_wechat_user_tags_on_user_tagged_id"
  end

end
