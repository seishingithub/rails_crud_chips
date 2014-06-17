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

  def show
    @chip = Chip.find(params[:id])
  end

  def edit
    @chip = Chip.find(params[:id])
  end

  def update
    @chip = Chip.find(params[:id])
    @chip.update_attributes!(chip_params)

    redirect_to chips_path
  end

  def destroy
    @chip = Chip.find(params[:id]).delete

    redirect_to chips_path
  end

  private

  def chip_params
    params.require(:chip).permit(:chip_type, :main_ingredient)
  end
end