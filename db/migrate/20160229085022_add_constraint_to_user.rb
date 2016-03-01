class AddConstraintToUser < ActiveRecord::Migration
  def change
    add_index :users, [:provider, :nickname], :unique => true
  end
end
