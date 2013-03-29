get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/game' do
	# Game.new()
	
	erb :game
end	

post '/move' do
	send_move
	erb :index
end

get '/profile' do
  erb :profile
end