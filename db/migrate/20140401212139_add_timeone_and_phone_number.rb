class AddTimeoneAndPhoneNumber < ActiveRecord::Migration
  def change
  	add_column :users, :time_zone, :string
  	add_column :users, :phonenumber, :string
  end
end
