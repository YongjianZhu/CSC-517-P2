class CreateWishLists < ActiveRecord::Migration[6.0]
  def change
    create_table :wish_lists do |t|
      t.references :student, null: false, foreign_key: true
      t.references :library_book_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
