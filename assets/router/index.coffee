express = require 'express'
app = express()

brew 		= require './routes/brew'
profile 	= require './routes/profile'
diaryEntry 	= require './routes/diaryEntry'
item 		= require './routes/item'
recipe 		= require './routes/recipe'
recipeItem 	= require './routes/recipeItem'

module.exports = (app) ->
	app.get 	'/api/brew', brew.index
	app.post 	'/api/brew', brew.create
	app.get		'/api/brew/by/profile/:profile_id', brew.listByProfile
	app.post	'/api/brew/by/profile/:profile_id', brew.createByProfile
	app.get 	'/api/brew/:brew_id', brew.load
	app.put 	'/api/brew/:brew_id', brew.update
	app.delete 	'/api/brew/:brew_id', brew.destroy

	app.get 	'/api/profile', profile.index
	app.post 	'/api/profile', profile.create
	app.get 	'/api/profile/:profile_id', profile.load
	app.put 	'/api/profile/:profile_id', profile.update
	app.delete 	'/api/profile/:profile_id', profile.destroy

	app.get 	'/api/diaryEntry', diaryEntry.index
	app.get 	'/api/diaryEntry/by/profile/:profile_id', diaryEntry.listByProfile
	app.post 	'/api/diaryEntry/by/profile/:profile_id', diaryEntry.createByProfile
	app.delete 	'/api/diaryEntry/by/profile/:profile_id', diaryEntry.destroyByProfile
	app.get 	'/api/diaryEntry/:timestamp', diaryEntry.load
	app.put 	'/api/diaryEntry/:timestamp', diaryEntry.update
	app.delete 	'/api/diaryEntry/:timestamp', diaryEntry.destroy
	
	app.get 	'/api/item', item.index
	app.post 	'/api/item', item.create
	app.get 	'/api/item/:item_id', item.load
	app.put 	'/api/item/:item_id', item.update
	app.delete 	'/api/item/:item_id', item.destroy

	app.get 	'/api/recipeItem', recipeItem.index
	app.post 	'/api/recipeItem'
	app.get 	'/api/recipeItem/by/recipe/:recipe_id', recipeItem.listByRecipe
	app.post 	'/api/recipeItem/by/recipe/:recipe_id', recipeItem.createByRecipe
	app.get 	'/api/recipeItem/:recipe_id', recipeItem.load
	app.put 	'/api/recipeItem/:recipe_id', recipeItem.update
	app.delete 	'/api/recipeItem/:recipe_id', recipeItem.destroy

	app.get 	'/api/recipe', recipe.index
	app.post 	'/api/recipe', recipe.create
	app.get 	'/api/recipe/:recipe_id', recipe.load
	app.put 	'/api/recipe/:recipe_id', recipe.update
	app.delete 	'/api/recipe/:recipe_id', recipe.destroy

	