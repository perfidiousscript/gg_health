class AddStaffToPractice < ActiveRecord::Migration[6.0]
  def change
    add_column :practices, :staff, :text, array: true, default: []
  end
end
