class AddCalendarToLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :calendar, :jsonb, default: {},
  end
end
