class AddStatusToAttendments < ActiveRecord::Migration[5.2]
  def change
    add_column :attendments, :status, :integer
  end
end
