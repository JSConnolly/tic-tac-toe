helpers do

  def current_player
    if session[:player_id] && Player.find(session[:player_id])
      @current_player ||= Player.find(session[:player_id])
    end
  end

  def logged_in?
    !current_player.nil?
  end

  def login(player)
    session[:player_id] = player.id
    current_player
  end


end