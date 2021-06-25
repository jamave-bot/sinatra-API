class ApplicationController < Sinatra::Base
  register Sinatra::CrossOrigin

  configure do
    enable :cross_origin
    set :allow_origin, "*" 
    set :allow_methods, [:get, :post, :patch, :delete, :options] # allows these HTTP verbs
    set :expose_headers, ['Content-Type']
  end

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  end

  # method "URL" do
    
  # end

  # BODY OF FETCH BECOMES THE KEYS IN PARAMS

  get "/users" do 
    # User.all.to_json(include: [:workouts, :exercises])

    User.all.to_json(
      include: {workouts: {include: :exercises}}
    )
  end

  #methods is a way to return the return value of a method



  # React frontend makes the fetch request
  # go back here do a binding.pry to make sure we're getting the info
  # write the code within the block, figure out the response we want to send back


  #We're going to treat our state as our User POJO
  #   e.g. 
  #   state = {
  #   id: 0, 
  #   name: "",
  #   password: "",
  #   age: 0, 
  #   height: 0,
  #   weight: 0,
  #   bodyfat: 0.0, 
  #   workouts: []
  # }

  post "/login" do
    # user = User.find_by(name: params[:username], password: params[:password])
    user = User.find_by(params.slice(:name, :password))
    if user
      puts "found them"
      user.to_json(include: {workouts: {include: :exercises}})
    else
      puts "didn't find them"
      return {error: "Incorrect username or password"}.to_json
    end
  end


  delete "/workouts/:id" do
    # Dynamic URL, that :id up there is available in our params w/ the key of 'id'
    workout =  Workout.find(params[:id])
    workout.destroy

    workout.to_json
  end

  post "/workouts" do 
    newWorkout = Workout.create(name: params[:name], body_part: params[:body_part], user_id: params[:user_id])
    newWorkout.to_json
  end

  post "/exercises" do 
    newExercise = Exercise.create(
      name: params[:name],
      workout_id: params[:workout_id],
      sets: params[:sets],
      reps: params[:reps],
      duration: params[:duration],
      calories_burned: params[:calories_burned],
      weight: params[:weight]
    )
    newExercise.to_json
  end

  post "/users" do 
    new_user = User.create(name: params[:name], age: params[:age], height: params[:height], weight: params[:weight],bodyfat: params[:bodyfat], password:params[:password])
    new_user.to_json
  end

  get "/workouts/:id" do 
    # Dynamic URL, that :id up there is available in our params w/ the key of 'id'
    workout =  Workout.find(params[:id])
    workout.to_json
  end

  get "/workouts/:id/recent" do
    user = User.find(params[:id])
    user.workouts.order('created_at desc').to_json
  end

end


#write all our routes in app.js

