mongoose = require 'mongoose'
Schema = mongoose.Schema

DiaryEntrySchema = new Schema(
    profileId: { type: Schema.Types.ObjectId, required: true, ref: 'Profile' }
    title: { type: String }
    timestamp: { type: Date, required: true }
)

module.exports = mongoose.model 'DiaryEntry', DiaryEntrySchema