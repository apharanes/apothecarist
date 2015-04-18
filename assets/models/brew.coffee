mongoose = require 'mongoose'
Schema = mongoose.Schema

BrewSchema = new Schema(
	name: String
	recipeId: { type: Schema.Types.ObjectId, required: true, ref: 'Recipe'}
	profileId: { type: Schema.Types.ObjectId, required: true, ref: 'Profile'}
)

module.exports = mongoose.model 'Brew', BrewSchema