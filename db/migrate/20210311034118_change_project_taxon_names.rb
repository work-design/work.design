class ChangeProjectTaxonNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :project_taxon_id, :taxon_id
    rename_column :task_templates, :project_taxon_id, :taxon_id
    rename_column :project_taxon_facilitates, :project_taxon_id, :taxon_id
    rename_column :project_taxon_indicators, :project_taxon_id, :taxon_id
    rename_column :project_preferences, :project_taxon_id, :taxon_id
    rename_column :indicators, :project_taxon_id, :taxon_id

    remove_columns :tasks, :repeat_days, :repeat_type
    add_column :tasks, :cost_fund, :decimal
    add_column :tasks, :cost_stock, :integer
  end
end
