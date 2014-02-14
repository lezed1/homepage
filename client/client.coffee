# Projects
projects =
  Chats:
    website: "http://chats.lezed1.tk"
    description: 
      text: "A proof-of-concept chat server to practice real-time communication between a browser and server while using an MVC framework. "
      bullets: [
          "Powered by Node.js, Socket.io and AngularJS",
          "Responsive design to work well on all screen sizes. (See the mobile and desktop screenshots)"
      ]
    source: "https://github.com/lezed1/chats"
    images: ["/Chats-desktop.png", "/Chats-mobile.png"]
  Homepage:
    website: "http://zanderbolgar.tk"
    description: 
      text: "My personal homepage, which is this site... How meta.. I thought that a website would be able to showcase my work than a resume could."
      bullets: [
          "Single page webapp with working back button",
          "Powered by Meteor.js and IronRouter after removal unnecessary packages"
      ]
    source: "https://github.com/lezed1/homepage"
    images: ["/Homepage-desktop.png", "/Homepage-mobile.png"]
  LiveQ:
    website: "http://liveq.lezed1.tk"
    description: 
      text: "A simple real-time question and answer platform targeted primarily for classroom use. After creating an account, users can ask questions and answer other questions. LiveQ was designed so that all answers are private to the asker and answerer. An example of a simple use case would be a teacher checking for basic understanding at the end of a lesson. A teacher could ask, \"What are the non-price variables of supply\" and the student would respond with their personal answer. The teacher would then be able to quickly check each student's answer, and identify what should be reviewed next lesson."
      bullets: [
          "Powered by Meteor.js and IronRouter",
          "Used in classroom",
          "Handled load of 25+ users on low-spec virtual machine"
      ]
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
