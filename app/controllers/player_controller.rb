
post '/players/new' do
  @player = Player.new(params[:signup])
  
  if @player.save
    login(@player)
  else
    @errors = []
    @errors = @player.errors.full_messages
  end

  redirect '/'
end

post '/sessions/new' do
  # content_type :text
  
  @player = Player.find_by_email(params[:email])

  if @player.nil?
    @errors = []
    @errors << "EMAIL NOT IN THE DATABASE."
  elsif @player.password == params[:password]
    login(@player)
  else
    @errors = []
    @errors << "Sorry brah, INVALID PASSWORD"
  end
  redirect '/'
end

get '/profile' do
  if logged_in?
    @player = current_player
    erb :profile
  else
    @errors = []
    @errors << "You have to be logged-in to view that page"
    redirect '/'
  end
end


get '/player/logout' do
  session.clear
  redirect '/'
end