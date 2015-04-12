mongoose = require 'mongoose'
Schema = mongoose.Schema

RecipeItemSchema = new Schema(
    recipeId: { type: Schema.Types.ObjectId, ref: 'Recipe', required: true}
    item: { type: Schema.Types.ObjectId, ref: 'Item', required: true}
    quantity: { type: Number, min: 1, max: 50 }
)

module.exports = mongoose.model 'RecipeItem', RecipeItemSchema