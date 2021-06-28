class RailsComRenameModule3 < ActiveRecord::Migration[6.1]

  def change
    rename_table :place_taxons, :eventual_place_taxons
    rename_table :places, :eventual_places
    rename_table :event_items, :eventual_event_items
    rename_table :event_taxons, :eventual_event_taxons
    rename_table :event_crowds, :eventual_event_crowds
    rename_table :plan_attenders, :eventual_plan_attenders
    rename_table :time_lists, :eventual_time_lists
    #rename_table :plan_participants, :eventual_plan_participants
    rename_table :time_items, :eventual_time_items
    rename_table :crowd_members, :eventual_crowd_members
    #rename_table :event_participants, :eventual_event_participants
    rename_table :crowds, :eventual_crowds
    rename_table :bookings, :eventual_bookings
    rename_table :seats, :eventual_seats
    rename_table :event_grants, :eventual_event_grants
    rename_table :events, :eventual_events
    rename_table :plans, :eventual_plans
    rename_table :plan_items, :eventual_plan_items
    rename_table :place_taxon_hierarchies, :eventual_place_taxon_hierarchies
    rename_table :aim_entities, :growth_aim_entities
    rename_table :reward_expenses, :growth_reward_expenses
    rename_table :rewards, :growth_rewards
    rename_table :reward_incomes, :growth_reward_incomes
    rename_table :aim_logs, :growth_aim_logs
    rename_table :aims, :growth_aims
    rename_table :praise_users, :growth_praise_users
    rename_table :aim_codes, :growth_aim_codes
    rename_table :aim_users, :growth_aim_users
    rename_table :praise_incomes, :growth_praise_incomes
  end

end
