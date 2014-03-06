class CreateClassicalMuslims < ActiveRecord::Migration
  def change
    create_table :classical_muslims do |t|

      t.timestamps
    end
  end
end
