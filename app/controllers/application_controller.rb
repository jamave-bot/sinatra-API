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

  # ERIC'S WORKSHOP NOTES
  # --------------------------------------------------------------
  # controller handles our request responses
  # We want to be returning json from our db 


  # verb address do block
  get '/hello_world' do
    {message: "Hello World"}.to_json
  end

  get '/goodbye_world' do
    "Goodbye World"
  end


  # example of a POST
  # say we have a Cat model/db

  #=================================================
  # THE BODY OF YOUR FETCH GOES INTO YOUR PARAMS
  #   - THROUGH THE USE OF PARAMS IT ENTERS THE DB
  #=================================================

  # params is a hash that is the body of our fetch!!!!
  # this is assuming we had a post request with a body of {name: someName, weight: someWeight}
  post "/cats" do 
    binding.pry
    Cat.create(name: params[:name], weight: params[:weight])
  end


  # method "URL" do
    
  # end

end
