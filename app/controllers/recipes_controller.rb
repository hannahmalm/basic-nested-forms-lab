class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  #This will render the new view which has the first and second ingredients
  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "First Ingredient")
    @recipe.ingredients.build(name: "Second Ingredient")
  end


  #this will create recipies and redirect them 
  def create
    Recipe.create(recipe_params)
    redirect_to recipes_path
  end


  #this is permitting you to change the title and the ingredient name and quantity
  #remember to change this and the new field when updating
  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [:name, :quantity]
    )
  end 
end
