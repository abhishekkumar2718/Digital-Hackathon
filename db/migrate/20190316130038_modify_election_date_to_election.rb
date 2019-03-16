class ModifyElectionDateToElection < ActiveRecord::Migration[5.2]
  def change
    add_column :elections, :election_start, :datetime
    add_column :elections, :election_end, :datetime
    remove_column :elections, :date_of_election
  end
end
