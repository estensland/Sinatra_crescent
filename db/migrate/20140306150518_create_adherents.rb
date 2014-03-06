class CreateAdherents < ActiveRecord::Migration
  def change
    create_table :adherents do |t|

      t.timestamps
    end
  end
end
