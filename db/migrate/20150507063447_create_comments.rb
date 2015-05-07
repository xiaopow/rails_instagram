class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :post_id
      t.text :tags
      t.timestamps null: false
    end
  end
end
