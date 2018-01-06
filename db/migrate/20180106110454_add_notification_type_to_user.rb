class AddNotificationTypeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :notification_sending_rule, :string, null: false, default: :email
  end
end
