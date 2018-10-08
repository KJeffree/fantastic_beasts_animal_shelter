require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/beast.rb')
also_reload('../models/*')

get
