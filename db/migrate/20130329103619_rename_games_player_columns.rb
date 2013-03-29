class RenameGamesPlayerColumns < ActiveRecord::Migration
  def change
    rename_column :games, :player_1, :player_1_id
    rename_column :games, :player_2, :player_2_id
  end
end
