class GamesController < ApplicationController
  before_action :authenticate_admin!, :except => [:index]

  def index
    if admin_signed_in?
      @games = Game.all.order(title: :asc)
    else
      @games = Game.where(available: true).order(title: :asc)
    end
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
      @game = game
      render :new
    end
  end

  def update
    game = Game.find params[:id]

    if game.update game_params
      redirect_to root_path
    else
      @game = game
      render :edit
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :price, :image, :price_with_manual,
    :available, :region, :translated, :disc_quantity)
  end
end
