class AddUserToCars < ActiveRecord::Migration[6.1]
  def change
    add_reference :ship_cars, :user
  end
end
