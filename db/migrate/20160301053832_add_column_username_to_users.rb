class AddColumnUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    change_column_null :users, :username, false
  end
end
