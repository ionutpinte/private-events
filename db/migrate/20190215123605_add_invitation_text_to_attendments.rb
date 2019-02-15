class AddInvitationTextToAttendments < ActiveRecord::Migration[5.2]
  def change
    add_column :attendments, :invitation_text, :string
  end
end
