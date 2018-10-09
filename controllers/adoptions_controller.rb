require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/adoption.rb')
also_reload('../models/*')


# INDEX
get('/adoptions') do
  @adoptions = Adoption.all()
  erb(:'adoptions/index')
end

# NEW
get('/adoptions/new') do
  @owners = Owner.all()
  @beasts = Beast.all()
  erb(:'adoptions/new')
end

# CREATE
post('/adoptions') do
  @adoption = Adoption.new(params)
  @adoption.save
  redirect "/adoptions"
end

# SHOW
get('/adoptions/:id') do
  @adoption = Adoption.find(params[:id].to_i)
  erb(:'adoptions/show')
end

# DELETE
post('/adoptions/:id/delete') do
  @adoption = Adoption.find(params[:id].to_i)
  @adoption.delete
  redirect "/adoptions"
end

# EDIT
get('/adoptions/:id/edit') do
  @id = params[:id].to_i
  @owners = Owner.all()
  @beasts = Beast.all()
  @adoption = Adoption.find(@id)
  erb(:"adoptions/edit")
end

# UPDATE
post('/adoptions/:id') do
  old_beast = Adoption.find(params[:id].to_i).beast_id
  Adoption.new(params).update(old_beast)
  redirect "/adoptions"
end
