# Projects
projects =
  Chats:
    website: "http://chats.lezed1.tk"
    description: "A chat server powered by Socket.io and AngularJS"
    source: "https://github.com/lezed1/chats"
    images: ["/Chats-desktop.png", "/Chats-mobile.png"]
  Homepage:
    website: "http://zanderbolgar.tk"
    description: "My personal homepage, which is this site. How meta."
    source: "https://github.com/lezed1/homepage"
    images: ["/Homepage-desktop.png", "/Homepage-mobile.png"]
  LiveQ:
    website: "http://liveq.lezed1.tk"
    description: "A simple real-time question and answer platform powered by Meteor.js"
    source: "https://bitbucket.org/lezed1/liveq/overview"
    images: ["/LiveQ-desktop.png", "/LiveQ-mobile.png"]

# Hobbies
hobbies = 
  Origami:
    website: "https://secure.flickr.com/photos/lezed1/sets/72157637361797254/"
    description: "A collection of origami models I have made."

# Added name key and value
_.each projects, (value, key) ->
  value.name = key
_.each hobbies, (value, key) ->
  value.name = key

# Pass a refernce to templates
Template.home.projects = Template.navbar.projects = _.sortBy _.values(projects), "name"
Template.home.hobbies = Template.navbar.hobbies = _.sortBy _.values(hobbies), "name"

Template.project.name = -> console.log Router.current().params.project

# Routes
Router.configure
  layoutTemplate: "layout"
  notFoundTemplate: "404"

Router.map ->
  @route "home",
    path: "/"
  @route "project",
    path: "project/:project"
    data: ->
      projects[@params.project]
  @route "hobby",
    path: "hobby/:hobby"
    data: ->
      hobbies[@params.hobby]