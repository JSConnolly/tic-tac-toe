get '/' do
  # Display a list of available games or create a new game.
  # Players who create a game become Player 1 (X) and players who
  # join an existing game become Player 2 (O).

  erb :index
end

post '/game' do
	p = Player.create( username: 'dummy' )
  g = Game.create( player_1_id: p.id, board: '000000000')
	
  redirect "/game/#{g.id}"
end

get '/game/:id' do
  #make sure the user is a player in this game, if not redirect
  erb :game
end

get '/game/join/:id' do
  # add the current user to the game
  Game#.change_attr('player_2_id', current_user.id)
  redirect 'game/:id'
end

post '/move' do
	send_move
	erb :index
end

get '/profile' do
  erb :profile
end