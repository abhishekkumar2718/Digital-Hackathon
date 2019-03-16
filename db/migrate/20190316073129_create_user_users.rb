class CreateUserUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_users do |t|
      t.string :username
      t.string :password_digest

      t.timestamps
    end
    add_index :user_users, :username, unique: true
  end
end
