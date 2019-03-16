class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :affiliation
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
