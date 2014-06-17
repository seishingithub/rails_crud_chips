class ChipsController < ApplicationController

  def index
    @chip = Chip.new
    @chips = Chip.all
  end

  def create
    @chip = Chip.create(chip_params)
    if @chip.save
      redirect_to chips_path
    else
      render :index
    end
  end

  private

  def chip_params
    params.require(:chip).permit(:chip_type, :main_ingredient)
  end
end