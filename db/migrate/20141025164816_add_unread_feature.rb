class AddUnreadFeature < ActiveRecord::Migration
  def change
    add_column :items, :unread, :boolean, null: false, default: true
  end
end
