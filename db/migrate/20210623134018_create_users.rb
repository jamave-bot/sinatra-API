class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :age
      t.string :height
      t.integer :weight
      t.float :bodyfat
    end
  end
end
