class CreateFactions < ActiveRecord::Migration
  def change
    create_table :factions do |t|

      t.timestamps
    end
  end
end
