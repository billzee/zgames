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

    if game.price_with_manual
      original_format = currency_to_number game.price_with_manual
      game.price_with_manual = original_format
    end

    if game.price
      original_format = currency_to_number game.price
      game.price = original_format
    end

    p game

    if game.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    game = Game.find params[:id]

    if game.price_with_manual
      original_format = currency_to_number game.price_with_manual
      game.price_with_manual = original_format
    end

    if game.price
      original_format = currency_to_number game.price
      game.price = original_format
    end

    p game

    if game.update game_params
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :price, :image, :price_with_manual, :is_available)
  end

  def currency_to_number currency
    p currency

    currency.to_s.gsub(/[$.]/,'').gsub(/[$,]/,'.').to_f
  end
end
