class CreateWorkRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :work_records do |t|
      t.date :worked_on
      t.time :started_at
      t.time :ended_at
      t.references :employee_id, foreign_key: { to_table: :users }
      t.references :manager_id, foreign_key: { to_table: :users }
      t.boolean :holiday
      t.integer :status

      t.timestamps
    end
  end
end
