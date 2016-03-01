class DeleteConstraintNicknameInUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :nickname, true
    remove_index :users, [:provider, :nickname]
  end
end
