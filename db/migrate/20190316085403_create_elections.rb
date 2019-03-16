class CreateElections < ActiveRecord::Migration[5.2]
  def change
    create_table :elections do |t|
      t.string :position
      t.datetime :deadline
      t.datetime :date_of_election
      t.string :session
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
