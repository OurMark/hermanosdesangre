class AddOngIdToOngCalendar < ActiveRecord::Migration
  def change
    add_column :ong_calendars, :ong_id, :integer
  end
end
