express = require 'express'
Brew = require '../../models/brew'

### List brews ###
exports.index = (req, res) ->
    Brew.find {}, (err, brews) ->
        if err then res.send(err)
        else res.json(brews)
   
### List brews by Profile ###
exports.listByProfile = (req, res) ->
	Brew.find profileId: req.params.profile_id, (err, brews) ->
		if err then res.send(err)
		else res.json(brews)

### Create brew by Profile ###
exports.createByProfile = (req, res) ->
	newBrew = req.body
	newBrew.profileId = req.params.profile_id
	
	brew = new Brew(newBrew)
	
	return brew.save (err) ->
		if err then res.send(err)
		else res.send(message: 'Brew created for Profile ' + brew.profileId)

### Create brew ###
exports.create = (req, res) ->
    brew = new Brew(req.body)
    
    return brew.save (err) ->
        if (err) then res.send(err)
        else res.send(message: 'Brew created with id ' + brew._id)

### Load brew ###
exports.load = (req, res) ->
    Brew.findById req.params.brew_id, (err, brew) ->
        if err then res.send(err)
        else res.json(brew)
        
### Update brew ###
exports.update = (req, res) ->    
    return Brew.findOne _id: req.params.brew_id, (err, brew) ->
        if err then res.send(err)
        else
            for prop in req.body
                brew[prop] = req.body[prop]
            
            return brew.save (err) ->
                if err then res.send(err)
                else res.json(message: 'Brew updated')
       
### Delete brew ###
exports.destroy = (req, res) ->
    return Brew.remove _id: req.params.brew_id, (err, brew) ->
        if err then res.send(err)
        else res.json 'Successfully deleted brew ' + brew._id
            
