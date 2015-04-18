###*
 * DiaryEntryItems are ordered snippets that compose a {@link DiaryEntry}. Possible types are images, text, sketches, etc.
 * @namespace Routes
 * @memberOf DiaryEntry
 * @exports DiaryEntryItem
###
express = require 'express'
DiaryEntryItem = require '../../models/diaryEntryItem'

###*
 * List all DiaryEntryItems
###
exports.index = (req, res) ->
	DiaryEntryItem.find (err, diaryEntryItems) ->
		if err then res.send(err)
		else res.json(diaryEntryItems)
###*
 * List all DiaryEntryItems of a {@link DiaryEntry}
 * @param {string} req.params.diaryEntry_id - DiaryEntry id
###
exports.listByDiaryEntry = (req, res) ->
	DiaryEntryItem.find diaryEntryId: req.params.diaryEntry_id, (err, diaryEntryItems) ->
		if err then res.send(err)
		else res.json(diaryEntryItems)

###*
 * Create a DiaryEntryItem under a {@link DiaryEntry}
 * @param {string} req.params.diaryEntry_id - DiaryEntry id
 * @param {Object} req.body - DiaryEntryItem
###
exports.createByDiaryEntry = (req, res) ->
	newDiaryEntryItem = req.body
	newDiaryEntryItem.diaryEntryId = req.params.diaryEntry_id
	
	diaryEntryItem = new DiaryEntryItem(newDiaryEntryItem)
	
	return diaryEntryItem.save (err) ->
		if err then res.send(err)
		else res.send(message: 'DiaryEntryItem created for DiaryEntry ' + req.params.diaryEntry_id)

###*
 * Create DiaryEntryItem
 * @param {Object} req.body - DiaryEntryItem
###
exports.create = (req, res) ->
	diaryEntryItem = new DiaryEntryItem(req.body)
	
	return diaryEntryItem.save (err) ->
		if (err) then res.send(err)
		else res.send(message: 'DiaryEntryItem created with id ' + diaryEntryItem._id)
			
###*
 * Load DiaryEntryItem
 * @param {string} req.params.diaryEntryItem_id - DiaryEntryItem id
###
exports.load = (req, res) ->
	DiaryEntryItem.findById req.params.diaryEntryItem_id, (err, diaryEntryItem) ->
		if err then res.send(err)
		else res.json(diaryEntryItem)
			
###*
 * Update DiaryEntryItem
 * @param {string} req.params.diaryEntryItem_id
 * @param {Object} req.body - DiaryEntryItem
###
exports.update = (req, res) ->
	return DiaryEntryItem.findOne _id: req.params.diaryEntryItem_id, (err, diaryEntryItem) ->
		if err then res.send(err)
		else
			for prop in req.body
				diaryEntryItem[prop] = req.body[prop]
			
			return diaryEntryItem.save (err) ->
				if err then res.send(err)
				else res.json(message: 'DiaryEntryItem updated')

###*
 * Delete DiaryEntryItem
 * @param {string} req.params.diaryEntryItem_id
###
exports.destroy = (req, res) ->
	return DiaryEntryItem.remove _id: req.params.diaryEntryItem_id, (err) ->
		if err then res.send(err)
		else res.send(message: 'Successfully deleted DiaryEntryItem')

###*
 * Delete all DiaryEntryItems of a DiaryEntry
 * @param {string} req.params.diaryEntry_id - DiaryEntry id
###
exports.destroyByDiaryEntry = (req, res) ->
	return DiaryEntryItem.remove diaryEntryId: req.params.diaryEntry_id, (err) ->
		if err then res.send(err)
		else res.send(message: 'Successfully deleted all DiaryEntryItems of DiaryEntry')



