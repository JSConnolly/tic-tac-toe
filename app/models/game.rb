class Game < ActiveRecord::Base
  belongs_to :player_1, :class_name => 'Player', :foreign_key => 'player_1'
  belongs_to :player_2, :class_name => 'Player', :foreign_key => 'player_2'

  # t.integer :player_1_id
  # t.integer :player_2_id
  # t.string :board
  # t.integer :winner

end
