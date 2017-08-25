class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find params[:id]
  end

  def create
    game = Game.new game_params
    if game.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    game = Game.find params[:id]
    if game.update game_params
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :price, :price_with_manual, :is_available)
  end
end