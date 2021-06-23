# clear the db
User.destroy_all
Workout.destroy_all
Exercise.destroy_all


# make first user
eric = User.create(name: "Eric", password:"abc123", age: rand(15..75), height: "6'3", weight: rand(100..150), bodyfat: 0.09 )

# make workouts for first user
eric_chest_day = Workout.create(name: "Chest Day", body_part: "Push", user_id: eric.id)
eric_leg_day = Workout.create(name: "Leg Day", body_part: "Legs", user_id: eric.id)

# make exercises for first user
    #Leg day
Exercise.create(name: "Squats", workout_id: eric_leg_day.id, sets: 3, reps: 10, duration: 15, calories_burned: 100, weight: 405) 
Exercise.create(name: "Romanian Deadlifts", workout_id: eric_leg_day.id, sets: 3, reps: 12, duration: 15, calories_burned: 150, weight: 315) 
Exercise.create(name: "Lunges", workout_id: eric_leg_day.id, sets: 3, reps: 10, duration: 10, calories_burned: 150, weight: 90) 
    #Chest day
Exercise.create(name: "Bench Press", workout_id: eric_chest_day.id, sets: 3, reps: 10, duration: 15, calories_burned: 100, weight: 405) 
Exercise.create(name: "Incline Bench Press", workout_id: eric_chest_day.id, sets: 3, reps: 10, duration: 15, calories_burned: 100, weight: 405) 

#======================================================================================================================================================

# make 2nd user
ronnie = User.create(name: "Ronnie Coleman", password:"yeahbuddy", age: rand(15..75), height: "6'", weight: 300, bodyfat: 0.08 )

# make workouts for ronnie
ronnie_chest_day = Workout.create(name: "Chest Day", body_part: "Push", user_id: ronnie.id)
ronnie_back_day = Workout.create(name: "Back Day", body_part: "Pull", user_id: ronnie.id)

# make exercises for ronnie
    #Back day
Exercise.create(name: "Deadlift (conventional)", workout_id: ronnie_back_day.id, sets: 3, reps: 10, duration: 30, calories_burned: 200, weight: 700) 
Exercise.create(name: "Bent Over Dumbbell Row", workout_id: ronnie_back_day.id, sets: 4, reps: 10, duration: 15, calories_burned: 150, weight: 100) 
Exercise.create(name: "Lat Pulldowns", workout_id: ronnie_back_day.id, sets: 5, reps: 10, duration: 15, calories_burned: 150, weight: 200) 
    #Chest day
Exercise.create(name: "Bench Press", workout_id: ronnie_chest_day.id, sets: 3, reps: 10, duration: 15, calories_burned: 100, weight: 585) 
Exercise.create(name: "Incline Bench Press", workout_id: ronnie_chest_day.id, sets: 3, reps: 10, duration: 15, calories_burned: 100, weight: 405) 
    