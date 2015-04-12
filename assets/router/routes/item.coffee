express = require 'express'
Item = require '../../models/item'

### List items ###
exports.index = (req, res) ->
	Item.find (err, items) ->
		if err then res.send(err)
		else res.send(items)

### Create item ###
exports.create = (req, res) ->
	item = new Item(req.body)
	
	return item.save (err) ->
		if (err) then res.send(err)
		else res.send(message: 'Item created with id ' + item._id)
			
### Load item ###
exports.load = (req, res) ->
	Item.findById req.params.item_id, (err, item) ->
		if err then res.send(err)
		else res.json(item)

### Update item ###
exports.update = (req, res) ->
	return Item.findOne _id: req.params.item_id, (err, item) ->
		if err then res.send(err)
		else
			for prop in req.body
				item[prop] = req.body[prop]
		
		return item.save (err) ->
			if err then res.send(err)
			else res.json(message: 'Item updated')

### Delete item ###
exports.destroy = (req, res) ->
	return Item.remove _id: req.params.item_id, (err, item) ->
		if err then res.send(err)
		else res.json 'Successfully delete item ' + item._id
