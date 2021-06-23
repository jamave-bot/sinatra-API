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


end
