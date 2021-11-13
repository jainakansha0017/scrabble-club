class CreateGameDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :game_details do |t|
      t.integer :member1_id
      t.integer :member2_id
      t.integer :member1_score
      t.integer :member2_score
      t.string :place
      t.date :time_of_game_played
      t.integer :winner_id
      t.timestamps
    end
  end
end
