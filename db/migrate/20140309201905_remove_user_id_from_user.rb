class RemoveUserIdFromUser < ActiveRecord::Migration
  def self.up
  	remove_column :users, :user_id
  end
end
