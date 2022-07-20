class ItemsController < ApplicationController
  def index
    @items = Item.where(board_id: params[:board_id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new(board_id: params[:board_id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.board_id = params[:board_id]

    respond_to do |format|
      if @item.save
        format.html { redirect_to board_items_url(@item.board), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to board_items_url(@item.board), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Item.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to board_items_url(params[:board_id]), notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def item_params
    params.require(:item).permit(:description, :done)
  end
end
