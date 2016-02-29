class ChangeColumnUser < ActiveRecord::Migration
  def change
    change_column_null :users, :provider, true
    change_column_null :users, :uid, true
    change_column_null :users, :nickname, true
    change_column_null :users, :image_url, true
  end
end
