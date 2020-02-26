class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.jsonb :contact, null: false, default: '{}'
      t.jsonb :services, null: false, default: '{}'
    end
    add_reference :locations, :practices, foreign_key: true, dependent: :delete
  end
end
