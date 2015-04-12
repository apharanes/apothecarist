mongoose = require 'mongoose'
Schema = mongoose.Schema

RecipeSchema = new Schema({
    name: { type: String, required: true}
    description: String
    recipeItems: [{ type: Schema.Types.ObjectId, ref: 'RecipeItem' }]
})

module.exports = mongoose.model 'Recipe', RecipeSchema