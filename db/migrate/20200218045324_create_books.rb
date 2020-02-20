class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :image
      t.string :author
      t.string :publisher
      t.text :review, null: false
      t.timestamps
    end
  end
end
