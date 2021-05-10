class AddReasonToSubscriptions < ActiveRecord::Migration[6.1]
  def change
    add_reference :email_subscriptions, :reason
  end
end
