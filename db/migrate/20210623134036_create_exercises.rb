class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name, null: false
      t.integer :workout_id
      t.integer :sets
      t.integer :reps
      t.integer :duration
      t.integer :calories_burned
      t.integer :weight
    end
  end
end
