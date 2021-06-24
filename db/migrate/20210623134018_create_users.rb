class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :age
      t.string :height
      t.string :weight
      t.string :bodyfat
    end
  end
end
