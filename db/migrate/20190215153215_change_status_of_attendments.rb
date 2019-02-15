class ChangeStatusOfAttendments < ActiveRecord::Migration[5.2]
  def change
    change_column :attendments, :status, :string
  end
end
