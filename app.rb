require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/beasts_controller')
require_relative('controllers/owners_controller')
require_relative('controllers/adoptions_controller')

get '/' do
  erb( :index )
end
