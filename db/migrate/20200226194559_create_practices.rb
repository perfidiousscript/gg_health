class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
      t.string :name, :null => false
      t.jsonb :contact, null: false, default: '{}'
    end
    add_reference :practices, :user, foreign_key: true, dependent: :delete
  end
end
