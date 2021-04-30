class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :content
      t.date :day
      t.integer :sleep_n
      t.text :memo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
