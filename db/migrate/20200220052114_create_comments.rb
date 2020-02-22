class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :text,                           null: false
      t.references :user, foreign_key: true,  null: false
      t.references :book, foreign_key: true,  null: false
      t.timestamps
    end
  end
end
