class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]
  def index
    @recipes = current_user.recipes
  end

  def show
    # show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @recipe.destroy
      flash[:success] = 'Deleted successfully.'
    else
      flash[:error] = 'Food is not deleted.'
    end
    redirect_to request.referrer
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :preparation_time, :cooking_time, :description)
  end

end
