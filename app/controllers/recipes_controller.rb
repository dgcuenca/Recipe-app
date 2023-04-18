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
    # create
  end

  def destroy
    # destroy
  end
end
