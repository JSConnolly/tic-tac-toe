class Game < ActiveRecord::Base
  belongs_to :player_1, :class_name => 'Player', :foreign_key => 'player_1'
  belongs_to :player_2, :class_name => 'Player', :foreign_key => 'player_2'
end
