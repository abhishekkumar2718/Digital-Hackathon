class CreateCandidateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :candidate_details do |t|
      t.decimal :cgpa
      t.text :experience
      t.text :about_me
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
