class AddUserToBoards < ActiveRecord::Migration[7.0]
  def change
    add_reference :boards, :user, foreign_key: true
  end
end
