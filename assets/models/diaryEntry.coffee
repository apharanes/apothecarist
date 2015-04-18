mongoose = require 'mongoose'
Schema = mongoose.Schema

DiaryEntrySchema = new Schema(
    timestamp: { type: Date, required: true }
    profileId: { type: Schema.Types.ObjectId, required: true, ref: 'Profile' }
    title: { type: String }
)

module.exports = mongoose.model 'DiaryEntry', DiaryEntrySchema