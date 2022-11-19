class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = current_user.boards.all.order(:created_at)
  end

  def show
    @board = current_user.boards.find(params[:id])
  end

  def new
    @board = current_user.boards.build
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user

    respond_to do |format|
      if @board.save
        format.html { redirect_to board_url(@board), notice: 'Lista criada' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @board = current_user.boards.find(params[:id])

      if @board.update(board_params)
        format.html { redirect_to board_url(@board), notice: 'Lista atualizada' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Lista apagada' }
      format.json { head :no_content }
    end
  end

  private
    
  def board_params
    params.require(:board).permit(:description)
  end
end
