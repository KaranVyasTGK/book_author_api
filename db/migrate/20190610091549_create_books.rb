class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :s_description
      t.string :l_description
      t.string :publish_date
      t.integer :genre
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
