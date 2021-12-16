class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.datetime :date
      t.integer :hits
      t.integer :misses
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :sentence, null: false, foreign_key: true

      t.timestamps
    end
  end
end
