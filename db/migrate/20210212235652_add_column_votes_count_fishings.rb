class AddColumnVotesCountFishings < ActiveRecord::Migration[6.0]
  def change
    add_column :fishings, :votes_count, :integer
  end
end
