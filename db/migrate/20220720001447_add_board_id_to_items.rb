class AddBoardIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :board, foreign_key: true
  end
end
