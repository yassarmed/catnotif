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
end
