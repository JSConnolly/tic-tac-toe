get '/' do
  # Display a list of available games or create a new game.
  # Players who create a game become Player 1 (X) and players who
  # join an existing game become Player 2 (O).

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