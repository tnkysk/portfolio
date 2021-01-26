class CreateBagels < ActiveRecord::Migration[5.2]
  def change
    create_table :bagels do |t|
      t.integer :user_id
      t.string :name
      t.string :image
      t.string :store
      t.integer :price
      t.text :introduction
      t.timestamps
    end
  end
end
