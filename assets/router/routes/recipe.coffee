express = require 'express'
Recipe = require '../../models/recipe'

### List recipes ###
exports.index = (req, res) ->
	Recipe.find (err, recipes) ->
		if err then res.send(err)
		else res.json(recipes)

### Create recipe ###
exports.create = (req, res) ->
	recipe = new Recipe(req.body)
	
	return recipe.save (err) ->
		if err then res.send(err)
		else res.send(message: 'Recipe created with id ' + recipe._id)

### Load recipe ###
exports.load = (req, res) ->
	Recipe.findById req.params.recipe_id, (err, recipe) ->
		if err then res.send(err)
		else res.json(recipe)

### Update recipe ###
exports.update = (req, res) ->
	return Recipe.findOne _id: req.params.recipe_id, (err, recipe) ->
		if err then res.send(err)
		else
			for prop in req.body
				recipe[prop] = req.body[prop]
		
		return recipe.save (err) ->
			if err then res.send(err)
			else res.json(message: 'Recipe updated')

### Delete recipe ###
exports.destroy = (req, res) ->
	return Recipe.remove _id: req.params.recipe_id, (err, recipe) ->
		if err then res.send(err)
		else res.json 'Successfully deleted recipe ' + recipe._id

