class ChangeChannelAvatarColumn < ActiveRecord::Migration
  def change
    remove_column :channels, :avatar
    add_column    :channels, :avatar, :oid
  end
end
