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
      include: {workouts: {include: :exercises}}, 
      methods: [:professor_name]
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
      user.to_json(include: {workouts: {include: :exercises}})
    else
      {error: "Incorrect username or password"}
    end
  end


  delete "/workouts/:id" do
    # Dynamic URL, that :id up there is available in our params w/ the key of 'id'
    workout =  Workout.find(params[:id])
    workout.destroy

    workout.to_json
  end


end


#write all our routes in app.js

