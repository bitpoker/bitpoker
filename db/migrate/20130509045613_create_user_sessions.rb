class CreateUserSessions < ActiveRecord::Migration
  def change
    drop_table :user_sessions
    create_table :user_sessions do |t|

      t.timestamps
    end
  end
end
