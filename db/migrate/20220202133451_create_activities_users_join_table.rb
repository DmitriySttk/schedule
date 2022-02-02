class CreateActivitiesUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :activities, :users do |t|
      t.index :activity_id
      t.index :user_id
    end
  end
end
