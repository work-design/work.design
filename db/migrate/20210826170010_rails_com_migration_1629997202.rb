class RailsComMigration1629997202 < ActiveRecord::Migration[6.1]

  def change

    add_column :auth_oauth_users, :identity, :string, index: true

    create_table :auth_apps do |t|
      t.string :appid, index: true
      t.string :jwt_key
      t.timestamps
    end

    add_column :auth_authorized_tokens, :business, :string
    add_column :auth_authorized_tokens, :appid, :string

    add_column :profiled_profiles, :extra, :jsonb, default: {}



    create_table :eventual_plan_participants do |t|
      t.belongs_to :planning, polymorphic: true
      t.belongs_to :event_participant
      t.belongs_to :participant, polymorphic: true
      t.string :type
      t.string :status, comment: "默认 event_participant 有效"
      t.timestamps
    end

    create_table :eventual_event_participants do |t|
      t.belongs_to :event_crowd
      t.belongs_to :event
      t.belongs_to :crowd_member
      t.belongs_to :participant, polymorphic: true
      t.integer :score
      t.string :comment
      t.string :quit_note
      t.string :assigned_status
      t.string :job_id
      t.string :state, default: "in_studying"
      t.timestamps
    end

    add_column :finance_expense_members, :type, :string
    add_column :finance_expense_members, :payout_uuid, :string
    add_column :finance_expense_members, :requested_amount, :decimal
    add_column :finance_expense_members, :actual_amount, :decimal
    add_column :finance_expense_members, :paid_at, :datetime
    add_column :finance_expense_members, :account_bank, :string
    add_column :finance_expense_members, :account_name, :string
    add_column :finance_expense_members, :account_num, :string

    add_belongs_to :roled_role_rules, :meta_action

    create_table :com_meta_actions do |t|
      t.string :namespace_identifier, default: "", null: false, index: true
      t.string :business_identifier, default: "", null: false, index: true
      t.string :controller_path, null: false, index: true
      t.string :controller_name, null: false
      t.string :action_name
      t.string :path
      t.string :verb
      t.string :required_parts, array: true
      t.integer :position
      t.boolean :landmark
      t.string :operation, default: "read"
      t.timestamps
    end

    create_table :com_meta_namespaces do |t|
      t.string :name
      t.string :identifier, default: "", null: false, index: true
      t.boolean :verify_organ
      t.boolean :verify_member
      t.boolean :verify_user
      t.timestamps
    end

    create_table :com_meta_controllers do |t|
      t.string :namespace_identifier, default: "", null: false, index: true
      t.string :business_identifier, default: "", null: false, index: true
      t.string :controller_path, null: false, index: true
      t.string :controller_name, null: false
      t.integer :position
      t.timestamps
    end

    create_table :com_meta_businesses do |t|
      t.string :name
      t.string :identifier, default: "", null: false, index: true
      t.integer :position
      t.timestamps
    end

    create_table :com_meta_operations do |t|
      t.string :action_name
      t.string :operation, default: "read"
      t.timestamps
    end

    create_table :doc_maps do |t|
      t.string :name
      t.jsonb :mappings
      t.timestamps
    end

    create_table :doc_subjects do |t|
      t.belongs_to :rule
      t.string :name
      t.jsonb :path_params
      t.jsonb :request_params
      t.jsonb :request_headers
      t.string :request_type
      t.jsonb :request_body
      t.string :response_status
      t.jsonb :response_headers
      t.string :response_type
      t.string :response_body
      t.string :note
      t.timestamps
    end

    create_table :com_meta_columns do |t|
      t.string :record_name, index: true
      t.string :column_name
      t.string :sql_type
      t.string :column_type
      t.integer :column_limit
      t.string :comment
      t.boolean :defined_db
      t.boolean :defined_model
      t.boolean :belongs_enable
      t.string :belongs_table
      t.timestamps
    end

    create_table :com_meta_models do |t|
      t.string :name
      t.string :record_name, index: true
      t.string :description
      t.boolean :defined_db
      t.boolean :customizable, comment: "是否允许用户定制"
      t.timestamps
    end
  end

end
