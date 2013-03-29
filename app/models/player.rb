class Player < ActiveRecord::Base
  has_many :games_as_p1, :class_name => "Game", :foreign_key => 'player_1_id'
  has_many :games_as_p2, :class_name => "Game", :foreign_key => 'player_2_id'
  # create_table :players do |t|
  # t.string :username
  # t.string :email
  # t.string :status
  # t.string :password_hash
  
  def games
    self.games_as_p1 + self.games_as_p2
  end


end
