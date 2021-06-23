# clear the db
User.destroy_all
Workout.destroy_all
Exercise.destroy_all


# make users
eric = User.create(name: "Eric", age: rand(15..75), height: "6\'3\"", weight: rand(100..150), bodyfat: 0.09 )



# make workouts
eric_chest_day = Workout.create(name: "Chest Day", body_part: "Push", user_id: eric.id)
eric_leg_day = Workout.create(name: "Leg Day", body_part: "Legs", user_id: eric.id)

# make exercises

squats = Exercise.create(name: "Squats", workout_id: eric_leg_day.id, sets: 3, reps: 10, duration: 15, calories_burned: 100, weight: 405) 
rdl = Exercise.create(name: "Romanian Deadlifts", workout_id: eric_leg_day.id, sets: 3, reps: 12, duration: 15, calories_burned: 150, weight: 315) 
lunges = Exercise.create(name: "Lunges", workout_id: eric_leg_day.id, sets: 3, reps: 10, duration: 10, calories_burned: 150, weight: 90) 

bench_press = Exercise.create(name: "Bench Press", workout_id: eric_chest_day.id, sets: 3, reps: 10, duration: 15, calories_burned: 100, weight: 405) 
incline_bench = Exercise.create(name: "Incline Bench Press", workout_id: eric_chest_day.id, sets: 3, reps: 10, duration: 15, calories_burned: 100, weight: 405) 

