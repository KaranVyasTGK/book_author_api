class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :star
      t.string :review_title
      t.string :review_description
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
