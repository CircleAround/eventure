class ChangeConstraintNicknameInUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :nickname, false
  end
end
