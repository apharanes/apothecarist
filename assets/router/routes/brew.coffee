###*
 * Brews are the instances of {@link Recipe}s created by a {@link Profile}.
 * @namespace Routes
 * @module Brew
 * @exports Brew
###
express = require 'express'
Brew = require '../../models/brew'

###*
 * List all Brews
###
exports.index = (req, res) ->
	Brew.find {}, (err, brews) ->
		if err then res.send(err)
		else res.json(brews)

###*
 * List all Brews created by a {@link Profile}
 * @param {string} req.params.profile_id
###
exports.listByProfile = (req, res) ->
	Brew.find profileId: req.params.profile_id, (err, brews) ->
		if err then res.send(err)
		else res.json(brews)

###*
 * Create a Brew under a {@link Profile}
 * @param {string} req.params.profile_id
###
exports.createByProfile = (req, res) ->
	newBrew = req.body
	newBrew.profileId = req.params.profile_id
	
	brew = new Brew(newBrew)
	
	return brew.save (err) ->
		if err then res.send(err)
		else res.send(message: 'Brew created for Profile ' + brew.profileId)

###*
 * Create Brew
 * @param {Object} req.body - metadata of Brew
###
exports.create = (req, res) ->
	brew = new Brew(req.body)

	return brew.save (err) ->
		if (err) then res.send(err)
		else res.send(message: 'Brew created with id ' + brew._id)

###*
 * Load a Brew
 * @param {string} req.params.brew_id
###
exports.load = (req, res) ->
	Brew.findById req.params.brew_id, (err, brew) ->
		if err then res.send(err)
		else res.json(brew)

###*
 * Update Brew
 * @param {string} req.params.brew_id
###
exports.update = (req, res) ->
	return Brew.findOne _id: req.params.brew_id, (err, brew) ->
		if err then res.send(err)
		else
			for prop in req.body
				brew[prop] = req.body[prop]

			return brew.save (err) ->
				if err then res.send(err)
				else res.json(message: 'Brew updated')

###*
 * Delete Brew
 * @param {string} req.params.brew_id
###
exports.destroy = (req, res) ->
	return Brew.remove _id: req.params.brew_id, (err, brew) ->
		if err then res.send(err)
		else res.json 'Successfully deleted brew ' + brew._id

