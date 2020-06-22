class CreateServiceSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :service_schedules do |t|
      t.references :client, foreign_key: true
      t.references :service, foreign_key: true
      t.date :date
      t.integer :status

      t.timestamps
    end
  end
end
