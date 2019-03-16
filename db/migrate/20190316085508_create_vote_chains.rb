class CreateVoteChains < ActiveRecord::Migration[5.2]
  def change
    create_table :vote_chains do |t|
      t.references :election, foreign_key: true
      t.text :vote_count

      t.timestamps
    end
  end
end
