class CreateSentences < ActiveRecord::Migration[6.1]
  def change
    create_table :sentences do |t|
      t.string :text
      t.belongs_to :language, null: false, foreign_key: true
      t.belongs_to :origin, null: false, foreign_key: true
      t.belongs_to :author, null: false, foreign_key: true
      t.belongs_to :schedule, null: false, foreign_key: true

      t.timestamps
    end
    add_index :sentences, :text, unique: true
  end
end
