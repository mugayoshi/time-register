class ChangeManagerFlagDefaultOnUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :manager_flag, from: nil, to: false
  end
end
