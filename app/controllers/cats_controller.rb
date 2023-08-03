class CatsController < ApplicationController
  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user

    if @cat.save
      redirect_to "/user_dashboard", notice: "Cat created successfully!"
    else
      render :new
    end
  end

  private

  def cat_params
    params.require(:cat).permit(
      :name,
      :age,
      :breed,
      :color,
      feeding_times_attributes: [:id, :datetime, :_destroy],
    )
  end

  def edit_feeding_times
    @cat = Cat.find(params[:id])
  end

  def update_feeding_times
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to "/user_dashboard", notice: "Feeding times updated successfully!"
    else
      render :edit_feeding_times
    end
  end

  private

  def cat_params
    params.require(:cat).permit(
      feeding_times_attributes: [:id, :datetime, :_destroy],
    )
  end
end
