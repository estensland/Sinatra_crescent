class CreateLifeEvents < ActiveRecord::Migration
  def change
    create_table :life_events do |t|

      t.timestamps
    end
  end
end
