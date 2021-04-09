class AddReplyToResponses < ActiveRecord::Migration[6.1]
  def change
    add_reference :wechat_responses, :reply
    Wechat::Response.find_each do |i|
      i.reply_id = i.effective_id
      i.save
    end

    remove_columns :wechat_responses, :effective_id, :effective_type
  end
end
