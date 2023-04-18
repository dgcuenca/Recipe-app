class RecipesController < ApplicationController
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
    # destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :preparation_time, :cooking_time, :description)
  end

end
