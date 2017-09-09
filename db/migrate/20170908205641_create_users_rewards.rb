class CreateUsersRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :users_rewards do |t|
      t.references :user, foreign_key: true
      t.references :rewards, foreign_key: true

      t.timestamps
    end
  end
end
