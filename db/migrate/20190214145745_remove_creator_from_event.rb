class RemoveCreatorFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :creator, :creator_id
  end
end
