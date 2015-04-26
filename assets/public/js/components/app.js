/* @jsx React.DOM */
var APP, React;

React = require('react');

APP = React.createClass({
  render: function () {
    return (
		<div>
			<h1>Apothecarist</h1>
			<Diary profile="Matthieu"></Diary>
		</div>
	);
  }
});

var Diary = React.createClass({
	render: function () {
	  var diaryEntries = this.props.data.map(function (diaryEntry) {
		  return (
			  <DiaryEntry 
			  	title={diaryEntry.title}
			  	date={diaryEntry.date}
				/>
		  )
	  });
		return (
			<div className="diary">
				<h2>Diary of {this.props.profile}</h2>
				{diaryEntries}
			</div>
		);
	}
});

var DiaryEntry = React.createClass({
	render: function () {
		return (
			<div className="diary-entry">
				<h2>{this.props.title} - {this.props.date}</h2>
				<DiaryEntryItem type="text">Text</DiaryEntryItem>
				<DiaryEntryItem type="photo">Photo</DiaryEntryItem>
			</div>
		);
	}
});

var DiaryEntryItem = React.createClass({
	render: function () {
		return (
			<div className="diary-entry-item">
				{this.props.children}
			</div>
		);
	}
});

module.exports = APP;
