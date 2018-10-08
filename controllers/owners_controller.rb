require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )


# INDEX
get("/owners") do
  @owners = Owner.all()
  erb(:"owners/index")
end

# NEW
get("/owners/new") do
  erb(:"owners/new")
end

# CREATE
post("/owners") do
  @owner = Owner.new(params)
  @owner.save
  redirect "/owners"
end

# SHOW
get("/owners/:id") do
  @owner = Owner.find(params[:id].to_i)
  erb(:"owners/show")
end

# DELETE
post('/owners/:id/delete') do
  id = params[:id].to_i
  @owner = Owner.find(id)
  @owner.delete
  redirect '/owners'
end

# EDIT
get("/owners/:id/edit") do
  @id = params[:id].to_i
  @owner = Owner.find(@id)
  erb(:"owners/edit")
end

# UPDATE
post('/owners/:id') do
  Owner.new(params).update
  redirect "/owners"
end
