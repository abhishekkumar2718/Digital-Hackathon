class Vote < ApplicationRecord
  belongs_to :vote_chain
  belongs_to :user

  alias_attribute :voter, :user

  # Proof Of Work Function - Whether hash contains substring data

  after_create do
    create_genesis
  end

  def compute_hash
    loop do
      sha = Digest::SHA256.new
      prev_hash = "" if prev_hash.nil?
      sha.update(data.to_s + id.to_s + created_at.to_s + updated_at.to_s + prev_hash)
      if sha.hexdigest.include? data.to_s
        curr_hash = sha.hexdigest
        update!
      end
    end
  end

  def create_genesis
    sha = Digest::SHA256.new
    sha.update(data.to_s + id.to_s + created_at.to_s + updated_at.to_s)
    return
  end
end
