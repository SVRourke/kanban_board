# Kanban Board
## Idea 
This project consists of a very rudimentary version of a Kanban/Trello board, currently usable by a single user (which I know for the most part, is not very useful). The app allows a user to create an account, log in, create projects, add tasks to said projects, and progress the tasks through 3 states of completion: "TO DO", "In-Progress" and "Completed". The app offers a very minimal/barebones/ugly user interface (chose a descriptor based on however polite or accurate you like to be, I did not view this as a front end project.) 

This is a project built to display my understanding of several concepts.  
1. ActiveRecord & Sinatra.  
2. MVC program architecture.  
3. CRUD functionality.
4. Using multiple models.  
5. Modelling user accounts.
6. User authentication.
7. Input validation.

<br>

## Installation
1. clone this repository. 

        git clone https://github.com/SVRourke/kanban_board.git
2. cd into the project directory and run "bundle install
3. At this point you can either start the program with shotgun or rackup.  
4. **BONUS** if you'd like greater security you need to comment out the line in the application controller with the hardcoded session secret and set a random secret as an environment variable.

        app/controllers/application_controller
        # Comment this line out:
        set :session_secret, 'Development'  
        # Uncomment this line
        set :session_secret, ENV.fetch('SESSION_SECRET')
5. Then create an environment variable 'SESSION_SECRET' and set it to a random 64 byte hex. 

        # Generate a key
        ruby -e "require 'securerandom'; puts SecureRandom.hex(64)"  
        
        # copy the output to the clipboard
        $> 6cbb8fa...(shortened for brevity)...55fb724

        # create the environment variable
        echo "export SESSION_SECRET=COPIED-VALUE" >> ~/.bashrc

    
## Contributors Guide 
## license