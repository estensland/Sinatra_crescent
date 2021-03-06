class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :user_name, unique: true
  end
end
