express = require 'express'
DiaryEntry = require '../../models/diaryEntry'

### List diary entries ###
exports.index = (req, res) ->
	DiaryEntry.find {}, (err, diaryEntries) ->
		if err 
			console.log('Failed to load DiaryEntries')
			res.send(err)
		else res.json(diaryEntries)

### Load diary entry by Id ###
exports.load = (req, res) ->
	DiaryEntry.findById req.params.diaryEntry_id, (err, diaryEntry) ->
		if err then res.send(err)
		else 
			if diaryEntry == null then res.json([])
			else res.json(diaryEntry)
			
### List diary entries of a profile ###
exports.listByProfile = (req, res) ->
	DiaryEntry.findOne profileId: req.params.profile_id,  (err, diaryEntries) ->
		if err
			res.send(err)
		else
			if diaryEntries == null then res.json([])
			else res.json(diaryEntries)

### Create diaryEntry of a profile ###
exports.createByProfile = (req, res) ->	
	fields = 
		profileId: req.params.profile_id
		timestamp: Date.now()
		title: req.body.title
	
	console.log(fields)
	diaryEntry = new DiaryEntry(fields)
	
	return diaryEntry.save (err) ->
		if err then res.send(err)
		else res.json message: 'DiaryEntry created'

### Update diaryEntry ###
exports.update = (req, res) ->
	return DiaryEntry.findById req.params.diaryEntry_id, (err, diaryEntry) ->
		if err
			console.log(err)
			res.send(err)
		else
			for prop in req.body
				diaryEntry[prop] = req.body[prop]
				
			return diaryEntry.save (err) ->
				if err then res.send(err)
				else res.json message: 'Diary Entry updated'

### Delete diaryEntry ###
exports.destroy = (req, res) ->
	return DiaryEntry.remove _id: req.params.diaryEntry_id, (err, diaryEntry) ->
		if err then res.send(err)
		else res.json message: 'Successfully deleted diaryEntry ' + req.params.diaryEntry_id
			
### Delete all diary entries of a profile ###
exports.destroyByProfile = (req, res) ->
	return DiaryEntry.remove profileId: req.params.profile_id, (err, diaryEntries) ->
	if err then res.send(err)
	else res.json message: 'Successfully deleted all diaryEntries of profile ' + req.params.profile_id
