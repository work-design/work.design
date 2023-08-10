class ExtendMigration61 < ActiveRecord::Migration[7.0]

  def change

    add_column :cms_carousels, :enabled, :boolean

    create_table :wechat_supporters do |t|
      t.belongs_to :agent
      t.string :avatar
      t.string :name
      t.string :open_kfid
      t.boolean :manage_privilege
      t.timestamps
    end

    create_table :wechat_menu_root_apps do |t|
      t.belongs_to :menu_root
      t.string :name
      t.string :appid
      t.integer :position
      t.timestamps
    end

    remove_column :wechat_menu_roots, :organ_id, :integer, scale: 8
    remove_column :wechat_menu_roots, :appid, :string

    create_table :wechat_menu_disables do |t|
      t.belongs_to :menu
      t.string :appid, index: true
      t.timestamps
    end

    add_belongs_to :wechat_menu_apps, :menu_root
    add_belongs_to :wechat_menu_apps, :menu_root_app
    add_column :wechat_menu_apps, :type, :string
    add_column :wechat_menu_apps, :name, :string
    add_column :wechat_menu_apps, :value, :string
    add_column :wechat_menu_apps, :mp_appid, :string
    add_column :wechat_menu_apps, :mp_pagepath, :string
    add_column :wechat_menu_apps, :position, :integer

    add_belongs_to :wechat_menus, :menu_root
    remove_column :wechat_menus, :appid, :string
    remove_column :wechat_menus, :organ_id, :integer, scale: 8
    remove_column :wechat_menus, :root_position, :integer, scale: 4

    add_column :wechat_agencies, :open_appid, :string
    remove_column :wechat_agencies, :oauth_enable, :boolean
    remove_column :wechat_agencies, :inviting, :boolean, comment: "可邀请加入"

  end

end
