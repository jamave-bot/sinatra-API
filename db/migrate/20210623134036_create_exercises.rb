class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name, null: false
      t.integer :workout_id
      t.string :sets
      t.string :reps
      t.string :duration
      t.string :calories_burned
      t.string :weight
    end
  end
end
