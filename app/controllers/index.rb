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
  @game = Game.find(params[:id])
  #make sure the user is a player in this game, if not redirect
  erb :game
end

get '/game/join/:id' do
  # add the current user to the game
  if current_user
    Game.update_attr('player_2_id', current_user.id)
    redirect 'game/:id'
  end

  redirect '/'
end

post '/:game_id/move' do
  g = Game.find(params[:game_id])

  if g.move!(params[:letter], params[:move]) #returns true if the game is over
    return g.winner
  end
  false
end

# post '/poll/:game_id/game_over' do

# end

get '/poll/:game_id/current_board' do
  Game.find(params[:game_id]).board
end

get 'poll/:game_id/two_players' do
  Game.two_players?
end

post '/:game_id/move' do
	Game.move!(params[:letter], params[:position])
	erb :index
end

get '/profile' do
  
  erb :profile
end