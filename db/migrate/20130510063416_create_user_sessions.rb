class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
