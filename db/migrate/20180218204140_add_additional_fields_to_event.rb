class AddAdditionalFieldsToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :online_event, :boolean, default: false
    add_column :events, :ticket_class, :integer, default: 0
    add_column :events, :refund_policy, :text
    add_column :events, :currency, :float
  end
end
