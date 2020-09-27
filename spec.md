# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app 
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)
      I used User, Project and Task models

- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
      User has_many Projects
      Project has_many Tasks
      User has_many Tasks through Projects

- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Project belongs_to User
    Task belongs_to User
    Task belongs_to Project

- [x] Include user accounts with unique login attribute (username or email)
      The user model uses ActiveRecord validations to check uniqueness of username and email

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
      The project_controller has routes for all CRUD actions

- [x] Ensure that users can't modify content created by other users
      the application relies on 2 helper methods #current_user and #unauthorized_redirect to check
      the authorization before doing actions

- [x] Include user input validations
      All models use ActiveRecord validations which return error messages if an invalid action is attempted
      the error messages are then passed to the session and displayed by the views

- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
      All models use ActiveRecord validations which return error messages if an invalid action is attempted
      the error messages are then passed to the session and displayed by the views

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
      It Does

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
