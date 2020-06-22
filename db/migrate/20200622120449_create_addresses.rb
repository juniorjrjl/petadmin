class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :state
      t.string :city
      t.string :zip_code
      t.string :street
      t.string :number
      t.string :complement
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
