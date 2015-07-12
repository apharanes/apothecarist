/* @jsx React.DOM */
var APP, React;

React = require('react');

APP = React.createClass({
	getInitialState: function () {
		return { data: [] };	
	},
	render: function () {
		return (
			<div>
				<h1>Apothecarist</h1>
				<ProfileList profiles="/api/profile" />
			</div>
		);
	}
});

var ProfileList = React.createClass({
	getInitialState: function () {
		return { profiles: [] };	
	},
	componentDidMount: function () {
		$.get(this.props.profiles, function (res) {
			if (this.isMounted()) {
				this.setState({
					profiles: res
				});
			}
		}.bind(this));
	},
	render: function () {
		var profiles = this.state.profiles.map(function (profile) {
			return (
				<Profile profile={profile} key={profile._id} />
			);
		});
		
		return (
			<div className="profile-list">
				<h2>Profiles</h2>
				{profiles}
			</div>
		);
	}
});

var Profile = React.createClass({	
	getInitialState: function () {
		return { profile: this.props.profile }
	},
	componentDidMount: function () {
		if (this.isMounted()) {
			this.setState({
				profile: this.props.profile
			});
		}
	},	
	render: function () {
		var profile = this.state.profile;

		return (
			<div className="profile">
				<h3>{profile.name}</h3>
				<Diary profile={profile}/>
			</div>
		);
	}
});

var Diary = React.createClass({
	getInitialState: function () {
		return { diaryEntries: []};
	},
	render: function () {
		var diaryEntries = this.state.diaryEntries.map(function (diaryEntry) {
		  return (
			  <DiaryEntry 
				title={diaryEntry.title}
				date={diaryEntry.date}
				/>
		  );
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
