require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:one)
    @item = items(:one)

    @item.board_id = @board.id
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
    post board_items_url(@board), params: { item: { description: @item.description, done: @item.done } }
    item = Item.last

    get board_item_url(item.board, item)
    assert_response :success
  end

  test "should get edit" do
    post board_items_url(@board), params: { item: { description: @item.description, done: @item.done } }

    get edit_board_item_path(@board, Item.last)
    assert_response :success
  end

  test "should update item" do
    post board_items_url(@board), params: { item: { description: @item.description, done: @item.done } }

    item = Item.last

    patch board_item_url(@board, item), params: { item: { description: @item.description, done: @item.done } }
    assert_redirected_to board_items_url(item.board)
  end

  test "should destroy item" do
    post board_items_url(@board), params: { item: { description: @item.description, done: @item.done } }

    item = Item.last

    assert_difference("Item.count", -1) do
      delete board_item_url(@board, item)
    end

    assert_redirected_to board_items_url(@board)
  end
end
