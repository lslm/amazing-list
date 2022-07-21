require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = User.new(id: 1, email: 'email@gmail.com')
    sign_in @user
    @board = boards(:one)
    @item = items(:one)
  end

  test "should get index" do
    get board_items_url(@board)
    assert_response :success
  end

  test "should get new" do
    get new_board_item_url(@board)
    assert_response :success
  end

  test "should create item" do
    assert_difference("Item.count") do
      post board_items_url(@board), params: { item: { description: @item.description, done: @item.done } }
    end

    assert_redirected_to board_items_url(@board)
  end

  test "should show item" do
    board = Board.new(description: 'string')
    board.save!
    item = Item.new(description: 'string', board: board)
    item.save!

    get board_item_url(board, item)
    assert_response :success
  end

  test "should get edit" do
    board = Board.new(description: 'string')
    board.save!
    item = Item.new(description: 'string', board: board)
    item.save!

    get edit_board_item_path(board, item)
    assert_response :success
  end

  test "should update item" do
    board = Board.new(description: 'string')
    board.save!
    item = Item.new(description: 'string', board: board)
    item.save!

    patch board_item_url(board, item), params: { item: { description: @item.description, done: @item.done } }
    assert_redirected_to board_items_url(item.board)
  end

  test "should destroy item" do
    board = Board.new(description: 'string')
    board.save!
    item = Item.new(description: 'string', board: board)
    item.save!

    assert_difference("Item.count", -1) do
      delete board_item_url(board, item)
    end

    assert_redirected_to board_items_url(board)
  end
end
