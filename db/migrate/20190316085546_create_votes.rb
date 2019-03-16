class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.string :prev_hash
      t.integer :data
      t.string :curr_hash
      t.references :vote_chain, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
