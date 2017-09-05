class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.date :date
      t.date :holiday

      t.timestamps
    end
  end
end
