express = require 'express'
RecipeItem = require '../../models/recipeItem'

### List recipeItems ###
exports.index = (req, res) ->
	RecipeItem.find (err, recipeItems) ->
		if err then res.send(err)
		else res.json(recipeItems)

### List recipeItems by Recipe ###
exports.listByRecipe = (req, res) ->
	RecipeItem.find recipeId: req.params.recipe_id, (err, recipeItems) ->
		if err then res.send(err)
		else res.json(recipeItems)

### Create recipeItem ###
exports.create = (req, res) ->
	recipeItem = new RecipeItem(req.body)
	
	return recipeItem.save (err) ->
		if (err) then res.send(err)
		else res.send(message: 'RecipeItem created with the id ' + recipeItem._id)

### Create recipeItem in Recipe ###
exports.createByRecipe = (req, res) ->
	newRecipeItem = req.body
	newRecipeItem.recipeId = req.params.recipe_id
	
	recipeItem = new RecipeItem(newRecipeItem)
	
	return recipeItem.save (err) ->
		if err then res.send(err)
		else res.send(message: 'RecipeItem created for Recipe ' + req.params.recipe_id)
	
### Load recipeItem ###
exports.load = (req, res) ->
	RecipeItem.findById req.params.recipeItem_id, (err, recipeItem) ->
		if err then res.send(err)
		else res.json(recipeItem)

### Update recipeItem ###
exports.update = (req, res) ->
	return RecipeItem.findOne _id: req.params.recipeItem_id, (err, recipeItem) ->
		if err then res.send(err)
		else
			for prop in req.body
				recipeItem[prop] = req.body[prop]
				
			return recipeItem.save (err) ->
				if err then res.send(err)
				else res.json(message: 'RecipeItem updated')

### Delete recipeItem ###
exports.destroy = (req, res) ->
	return RecipeItem.remove _id: req.params.recipeItem_id, (err, recipeItem) ->
		if err then res.send(err)
		else res.json 'Successfully deleted recipe item ' + req.params.recipeItem_id

