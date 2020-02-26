class AddStaffToLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :staff, :text, array: true, default: []
  end
end
