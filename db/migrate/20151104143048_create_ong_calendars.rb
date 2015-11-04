class CreateOngCalendars < ActiveRecord::Migration
  def change
    create_table :ong_calendars do |t|
      t.time :start_time
      t.time :end_time
      t.time :start_time_differential
      t.time :end_time_differental
      t.string :day

      t.timestamps
    end
  end
end
