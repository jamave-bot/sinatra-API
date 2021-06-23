class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :name, null: false
      t.string :body_part
      t.integer :user_id

      t.timestamps 
    end
  end
end
