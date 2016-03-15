class AddCanceledAtToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :canceled_at, :datetime
    add_index :tickets, :canceled_at
  end
end
