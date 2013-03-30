class Player < ActiveRecord::Base
  has_many :games_as_p1, :class_name => "Game", :foreign_key => 'player_1_id'
  has_many :games_as_p2, :class_name => "Game", :foreign_key => 'player_2_id'
  before_create :downcase_email

  include BCrypt

  # create_table :players do |t|
  # t.string :username
  # t.string :email
  # t.string :status
  # t.string :password_hash
  
  def games
    self.games_as_p1 + self.games_as_p2
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  private
  def downcase_email
    self.email.downcase!
  end


end
