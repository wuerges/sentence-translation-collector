class CreateSentences < ActiveRecord::Migration[6.1]
  def change
    create_table :sentences do |t|
      t.string :text
      t.belongs_to :language, null: false, foreign_key: true
      t.belongs_to :origin, foreign_key: { to_table: :sentences }
      t.belongs_to :author, null: false, foreign_key:  { to_table: :users }

      t.timestamps
    end
    add_index :sentences, :text, unique: true
  end
end
