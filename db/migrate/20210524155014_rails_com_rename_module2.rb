class RailsComRenameModule2 < ActiveRecord::Migration[6.1]

  def change
    rename_table :task_templates, :bench_task_templates
    rename_table :projects, :bench_projects
    rename_table :schedules, :bench_schedules
    rename_table :facilitate_indicators, :bench_facilitate_indicators
    rename_table :task_timers, :bench_task_timers
    rename_table :project_indicators, :bench_project_indicators
    rename_table :facilitates, :bench_facilitates
    rename_table :facilitate_providers, :bench_facilitate_providers
    rename_table :indicators, :bench_indicators
    rename_table :project_facilitates, :bench_project_facilitates
    rename_table :facilitate_taxons, :bench_facilitate_taxons
    rename_table :project_stages, :bench_project_stages
    rename_table :project_mileposts, :bench_project_mileposts
    rename_table :project_webhooks, :bench_project_webhooks
    rename_table :mileposts, :bench_mileposts
    rename_table :tasks, :bench_tasks
    rename_table :task_template_hierarchies, :bench_task_template_hierarchies
    rename_table :facilitate_taxon_hierarchies, :bench_facilitate_taxon_hierarchies
    rename_table :task_hierarchies, :bench_task_hierarchies
  end

end
