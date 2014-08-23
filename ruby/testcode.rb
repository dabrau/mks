require_relative 'cookbook'


mex_cuisine = Cookbook.new("Mexican Cooking")
burrito = Recipe.new("Bean Burrito", ["tortilla", "bean"], ["heat beans", "place beans in tortilla", "roll up"])

puts mex_cuisine.title # Mexican Cooking
puts burrito.title # Bean Burrito
p burrito.ingredients # ["tortilla", "bean", "cheese"]
p burrito.steps # ["heat beans", "heat tortilla", "place beans in tortilla", "sprinkle cheese on top", "roll up"]
# mex_cuisine.title = "Mexican Recipes"


mex_cuisine.recipes # []
mex_cuisine.add_recipe(burrito) # Added a recipe to the collection: Bean Burrito
p mex_cuisine.recipes # [#<Recipe:0x007f8ff39cbc58 @title="Bean Burrito", @ingredients=["tortilla", "bean"], @steps=["1. heat beans", "2. place beans in tortilla", "3. roll up"]>
mex_cuisine.recipe_titles # Bean Burrito
mex_cuisine.recipe_ingredients # These are the ingredients for Bean Burrito: ["tortilla", "bean"]

burrito.print_recipe 
=begin 
Bean Burrito
ingredients: tortilla, bean
steps:
1. heat beans.
2. place beans in tortilla.
3. roll up
=end

make_believe = Recipe.new("Unicorn meat", ["magic", "pixie dust"], ["boil frogs", "break a mirror", "spin 5 times"])
mex_cuisine.add_recipe(make_believe) #Added a recipe to the collection: Unicorn meat
p mex_cuisine.recipes #[#<Recipe:0x007f9eb308de10 @title="Veggie Burrito", @ingredients=["tortilla", "tomatoes"], @steps=["heat tomatoes", "place tomatoes in tortilla", "roll up"]>, #<Recipe:0x007f9eb308d230 @title="Unicorn meat", @ingredients=["magic", "pixie dust"], @steps=["boil frogs", "break a mirror", "spin 5 times"]>]


mex_cuisine.recipe_titles
=begin
Bean Burrito
Unicorn meat
=end

mex_cuisine.recipe_ingredients 
=begin
These are the ingredients for Bean Burrito: ["tortilla", "bean"]
These are the ingredients for Unicorn meat: ["magic", "pixie dust"]
=end

mex_cuisine.print_cookbook
=begin
Bean Burrito
ingredients: tortilla, bean
steps:
1. heat beans.
2. place beans in tortilla.
3. roll up

Unicorn meat
ingredients: magic, pixie dust
steps:
1. boil frogs.
2. break a mirror.
3. spin 5 times

#<Recipe:0x007f8ff39cbc58>
#<Recipe:0x007f8ff3978eb8>
=end

mex_cuisine.find_by_ingredient("magic")
# Unicorn meat
# ingredients: magic, pixie dust
# steps:
# 1. boil frogs.
# 2. break a mirror.
# 3. spin 5 times

mex_cuisine.find_by_ingredient("horse") #Ingredient not found in recipes.

make_believe.add_step("light incense") #["1. boil frogs", "2. break a mirror", "3. spin 5 times", "4. light incense"] 

make_believe.print_recipe
# Unicorn meat
# ingredients: magic, pixie dust
# steps:
# 1. boil frogs.
# 2. break a mirror.
# 3. spin 5 times.
# 4. light incense

