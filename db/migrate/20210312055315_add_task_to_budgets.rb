class AddTaskToBudgets < ActiveRecord::Migration[6.1]
  def change
    add_reference :budgets, :task
  end
end
