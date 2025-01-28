class LotsController < ApplicationController
  def index
    @lots = Lot.all
  end

  def show
    @lot = Lot.find(params[:id])
  end

  def new
    @lot = Lot.new
  end

  def create
    @lot = Lot.new(lot_params)
    if @lot.save
      redirect_to @lot
    else
      render :new
    end
  end

  private

  def lot_params
    params.require(:lot).permit(:title, :location, :size, :description)
  end
end
