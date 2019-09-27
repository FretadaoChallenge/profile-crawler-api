# Profile Crawler

  The Profile Crawler is a project where you can type a name and a twitter url and your username and description from twitter are saved too. To get username and description the Profile Crawler uses a web scraper.


# Tools

  This application is separated in two modules. The first module is the back-end of the application that was build in Ruby on Rails, a very robust and open-source framework used to develop web applications. The other one is the front-end developed in Quasar, a open-source Vue.js based framework.

# Features

  The Profile Crawler back-end was build in Ruby on Rails version 5.2.3 and Ruby version 2.6.3.

  ## Architecture

  The project uses Ruby on Rails framework to build an API, a architectural decision made because with two separated application is much mor easy maintain the code after all, the concerns about user interface and usability are focused on front-end, and the core logic code are maintained on the back-end application.

  ### Models, Controllers and helpers

  The project has a member model, where the members attributes are defined, a member controller where are action methods, a search controller where the search method are defined and a twitter informations helper.

  * The member model make some validations like:
    * Required name between 1..50
    * Twitter description with max length 160
    * Twitter url unique and validate with a regex to certify that it's a valid address
  
    Besides make validations has some methods too. There are methods to shortens the given twitter url, to fix the twitter url format adding `https://www.` if the url doesn't have and to search by a key serach word on database.

  * A helper was used to keep the communication with the twitter because was not responsability of member model or controller makes the web scraper.

  * A controller to the search was created because the method needs to recive params from user input and send that params to the database to filter member, it's clearly a controller job, but it's not related to the member controller so a new one was created for this.

  ## Atributes

  # Endpoints

  * `/members`
    * post - create a member
  * `/members/:id`
    * get - show a member
    * put - edit a member
    * delete - delete a member

  # Tests

  To run the applications tests just type:

  `rails test`

# How to run the project

  To run the project you need to have docker and docker compose installed on your computer.

  if it's your first time running the project just type 
  
  `docker-compose up --build`
  
  In the next time you run the project type only

  `docker-compose up`

# Continuous Integrations

  The repository has continuous integration that checks some code metrics and the tests of the application. The used tool to make the continuous was the travis, a open-source application very simple to use that allows the code CI.
