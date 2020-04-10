class AddGamesAndMoves < ActiveRecord::Migration[6.0]

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  def change
    create_table :games, :id => :uuid do |t|
      t.timestamps
    end

    create_table :plies, :id => :uuid do |t|
      t.belongs_to :game, :foreign_key => true, :index => true, :type => :uuid

      t.text :move

      t.timestamps
    end
  end
end
