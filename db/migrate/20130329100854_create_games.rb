class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_1
      t.integer :player_2
      t.string :board
      t.integer :winner

      t.timestamps
    end
  end
end
