mongoose = require 'mongoose'
Schema = mongoose.Schema

DiaryEntryItemSchema = new Schema(
	diaryEntryId: { type: Schema.Types.ObjectId, required: true, ref: 'DiaryEntry'}
	type: { type: String, required: true }
	metadata: {type: Object }
	displayOrder: { type: Number, required: true }
)

module.exports = mongoose.model 'DiaryEntryItem', DiaryEntryItemSchema
