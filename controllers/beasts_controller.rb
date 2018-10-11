require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/beast.rb')
also_reload('../models/*')

# INDEX
get("/beasts") do
  @beasts = Beast.all()
  erb(:"beasts/index")
end

# ADOPTABLE INDEX
get('/beasts/adoptable') do
  @beasts = Beast.all()
  erb(:"beasts/adoptable/index")
end

# NOT ADOPTABLE INDEX
get('/beasts/not-adoptable') do
  @beasts = Beast.all()
  erb(:"beasts/not_adoptable/index")
end

# TYPE INDEX
get('/beasts/type') do
  @array_of_types = Beast.array_of_types().sort
  erb(:"beasts/type/index")
end

# POST FORM TYPE
post('/beasts/type') do
  redirect to "/beasts/type/#{params[:type]}"
end


# ADD
get("/beasts/new") do
  erb(:"beasts/new")
end

# CREATE
post("/beasts") do
  @beast = Beast.new(params)
  @beast.save
  redirect "/beasts"
end

# SHOW
get("/beasts/:id") do
  @beast = Beast.find(params[:id].to_i)
  erb(:"beasts/show")
end

# DELETE
post('/beasts/:id/delete') do
  id = params[:id].to_i
  @beast = Beast.find(id)
  @beast.delete
  redirect to '/beasts'
end

# EDIT
get('/beasts/:id/edit') do
  @id = params[:id].to_i
  @beast = Beast.find(@id)
  erb(:"beasts/edit")
end

# UPDATE
post('/beasts/:id') do
  Beast.new(params).update
  redirect "/beasts"
end

# SHOW TYPE
get('/beasts/type/:type') do
  type = params[:type]
  @beasts = Beast.find_type(type)
  erb(:"beasts/type/show")
end
