class AddManagerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :manager, foreign_key: { to_table: :users}
  end
end
