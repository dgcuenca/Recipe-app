class FoodsController < ApplicationController
  before_action :set_food, only: %i[show destroy]
  def index
    @foods = current_user.foods
  end

  def show
    @food
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      redirect_to food_path(@food), notice: 'Food was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @food.destroy
      flash[:success] = 'Deleted successfully.'
    else
      flash[:error] = 'Food is not deleted.'
    end
    redirect_to request.referrer
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:user_id, :name, :measurement_unit, :price, :quantity)
  end
end
