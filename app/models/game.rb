class Game < ActiveRecord::Base
  belongs_to :player_1, :class_name => 'Player', :foreign_key => 'player_1'
  belongs_to :player_2, :class_name => 'Player', :foreign_key => 'player_2'

  before_save :default_values
  def default_values
    self.board ||= '000000000'
  end

  # t.integer :player_1_id
  # t.integer :player_2_id
  # t.string :board
  # t.integer :winner
  
  WINNING_GROUPS = [[0,1,2], [3,4,5], [6,7,8], #horizontal wins
                    [0,3,6], [1,4,7], [2,5,8], #vertical wins
                    [0,4,8], [2,4,6]]          #diagonal wins
  P1_LETTER = 'x'
  P2_LETTER = 'o'
  
  def two_players?
    !(self.player_2_id.nil? && self.player_2_id.nil?)
  end

  def move!(letter, position)
    letter = letter.downcase
    position = position.to_i
    self.board[position] = letter
    check_winner(letter)
  end

  private
  def check_winner(letter)
    # check if self.board has a winner, and update winner column if so
    indices = indexes_of_letter(letter)
    WINNING_GROUPS.each do |group|
      if (group - indices).length == 0
        if letter == P1_LETTER 
          self.winner = self.player_1_id
        else
          self.winner = self.player_2_id
        end

        return true
      end
    end
    false
  end

  def indexes_of_letter(letter)
    indices = []
    self.board.chars.each_with_index{|char, i| indices << i if char == letter}
    indices
  end

end