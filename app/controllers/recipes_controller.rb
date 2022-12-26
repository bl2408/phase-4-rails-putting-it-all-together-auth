class RecipesController < ApplicationController

  # GET /recipes
  def index
    render json: Recipe.all
  end

  # GET /recipes/1
  def show
    recipe = Recipe.find_by(id: params[:id])
    render json: recipe
  end

  # POST /recipes
  def create
    user = User.find_by(id: session[:user_id])
    recipe = user.recipes.create!(recipe_params)
    render json: recipe, status: :created
  end

  # PATCH/PUT /recipes/1
  def update
    recipe = Recipe.find(id: params[:id])
    if recipe.update(recipe_params)
      render json: recipe
    else
      render json: recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    recipe = Recipe.find(id: params[:id])
    recipe.destroy
  end

  private
    # Only allow a list of trusted parameters through.
    def recipe_params
      params.permit(:title, :instructions, :minutes_to_complete)
    end
end
