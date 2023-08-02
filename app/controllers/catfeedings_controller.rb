class CatfeedingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @catfeeding = Catfeeding.new
    @cats = current_user.cats
  end

  def create
    @cat_feeding = Catfeeding.new(catfeeding_params)
    if @cat_feeding.save
      redirect_to "/", notice: "Feeding reminder created!"
    else
      render :new
    end
  end

  private

  def cat_feeding_params
    params.require(:catfeeding).permit(:datetime, :cat_id, :user_id)
  end
end
