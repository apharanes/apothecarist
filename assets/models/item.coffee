mongoose = require 'mongoose'
Schema = mongoose.Schema

ItemSchema = new Schema(
    name: { type: String, required: true }
    description: { type: String }
    itemType: { type: String, uppercase: true, required: true }
)

module.exports = mongoose.model 'Item', ItemSchema