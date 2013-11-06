# Projects
projects =
  Chats:
    website: 'http://chats.lezed1.tk'
    description: 'A chat server powered by Socket.io and AngularJS'
    source: 'https://github.com/lezed1/chats'
    images: ['/Chats-desktop.png', '/Chats-mobile.png']
  Homepage:
    website: 'http://zanderbolgar.tk'
    description: 'My personal homepage, which is this site'
    source: 'https://github.com/lezed1/homepage'
  LiveQ:
    website: 'http://liveq.lezed1.tk'
    description: 'A simple real-time question and answer platform powered by Meteor.js'
    source: 'https://bitbucket.org/lezed1/liveq/overview'
    images: ['/LiveQ-desktop.png', '/LiveQ-mobile.png']

_.each projects, (value, key) ->
  value.name = key

Template.home.projects = Template.navbar.projects = _.sortBy _.values(projects), 'name'

Template.project.name = -> console.log Router.current().params.project

# Routes
Router.configure
  layoutTemplate: "layout"
  notFoundTemplate: "404"

Router.map ->
  @route "home",
    path: "/"
  @route "project",
    path: "/:project"
    data: ->
      projects[@params.project]