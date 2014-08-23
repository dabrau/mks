class Cookbook
	attr_accessor :title, :recipes

	def initialize(title)
		@title = title
		@recipes = []
	end

	def add_recipe(recipe)
		@recipes.push(recipe)
		puts "Added a recipe to the collection: #{recipe.title}"
	end

	def recipe_titles
		@recipes.each {|recipe| puts recipe.title}
	end

	def recipe_ingredients
		@recipes.each { |recipe| puts "These are the ingredients for #{recipe.title}: #{recipe.ingredients}" }
	end

	def print_cookbook
		@recipes.each { |recipe| recipe.print_recipe }
	end

	def find_by_ingredient(ingredient)
		recipe_list = @recipes.select { |recipe| recipe.ingredients.include?(ingredient) }
		if recipe_list.empty?   
			puts ("Ingredient not found in recipes.")
		else
			recipe_list.each { |recipe| recipe.print_recipe }
		end
	end

end

class Recipe

	attr_accessor :title, :ingredients, :steps
	
	def initialize(title, ingredients, steps)
		@title = title
		@ingredients = ingredients
		@steps = steps
	end

	def print_recipe
		puts "#{@title}\ningredients: #{@ingredients.join(", ")}\nsteps:\n"
		counter = 1
		steps.each { |step|
			puts "#{counter}. #{step}"
			counter = counter + 1
		}
	end

	def add_step(next_step)
		@steps.push(next_step)
	end

end

