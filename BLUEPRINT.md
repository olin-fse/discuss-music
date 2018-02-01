# Music Social Media


## Project Abstract
We are creating a platform for friends to share and discuss music online.  Groups of friends will use the platform together and users will be able to create new song postings or comment on existing ones.  It offers users a way for them to share new songs they like and discuss what they like and don’t like about them.  We are imagining that users could be part of more than one group.


## Goals
**Annabel** - I would like to get more comfortable with testing, improve my front-end skills, and get a overall better understanding of how to build a fully-functioning app from scratch.  I’m also interested in learning more about security and how to make apps more stable.

**Franton** - I would like to get experience building a web app with a strong focus on reliability and scalability, rather than focusing only on features and accruing technical debt. I am also looking forward to learning how to work with containers and set up an easy test and deploy system. Finally, I would also like to do some frontend work and learn a bit more about databases.

**Team** - We would like to learn how to set up all of the technologies we’ll be using from scratch and be able to use them effectively.  We are also interested in learning new and up to date technologies like Elm and kubernetes.  We are also interested in learning all the new buzzwords like nginx, selenium, concourse, agile, and kubernetes.


## Feature Set

**MVP** | The things that define your Minimum Viable Product
* User login (FB, Spotify, TBD?)
* Starting and adding to a discussion
* View discussions
* Groups

**Next Steps** | The critical features that you think you'll have time for
* Spotify API call for song info
* Spotify/music player integration
* Better commenting system
* Time-stamped to parts of song
* Ability to edit your comments

**Stretch Goals** | If you end up having extra time, what do you want to accomplish?
* Managing multiple groups
* Song recommendations
* Auto-generating playlist


## System Architecture
* Elm (elm-test)
* Node.js/Express (Jest)
* PostgreSQL
 
In building a social media app, we expect to have many-to-many relationships between users, comments, posts, etc., which can be queried more easily and quickly using a relational database. Therefore, we will use PostgreSQL as our database, since it seems to have better open source support and a clearer timeline than Oracle’s MySQL.

For the backend of our application, we will use Express/Node.js because of its speed compared to Ruby and because it is more likely to be more applicable to our careers after we graduate.  We also wanted to leave time to learn Elm, so working with something we already had experience with makes sense.  We are not planning to use an ORM since it can bottleneck large queries and learning how to query the database directly seems like an equal amount of effort.

For our front-end, we are planning on learning and using Elm.  We were deciding between React and Elm since they are both component based which lends itself nicely to the structure of our social media app.  There will be components that will be reused many times within the app (posts, comments, etc.) that can be easily built and scaled with React or Elm since they are component based frameworks.  We have chosen to work with Elm since we both have experience in React and are interested in learning a new framework.  Additionally, Elm has many features that make it more favorable, such as its error handling, easy routing between pages (which we would eventually like to implement for groups), and better type checking.  We’ll also be using elm-css to mimic the css in js framework, which makes css easier and faster to write.

For out testing suite, we’re going to be using Elm-test for the front-end and Jest for the backend.  We chose Elm-test because it is the most common unit testing suite for Elm and it has the most complete documentation.  We chose Jest because it is a simple, well-supported testing suite that runs on JavaScript.  We are interested in using Jest since it will likely be relevant to us after graduation and are interested in learning how to set it up from scratch and use it successfully.  It makes mocking relatively easy and has a built in assertion library, which will help simplify our tests and set up.
We aren’t sure what integration and browser testing libraries we’ll be using yet, but we’re hoping to figure that out during the class (week 3-4??).


## Project Timeline
**Week 4** - Complete Project Blueprint & have a plan for the rest of the semester. The MVP should be done, so we should have basic commenting, user login (and authentication), and posting all working with a very basic front end. Testing and working environments should all be set up.

**Week 8** - Spotify integration should be supported by this point and the front-end should be more user-friendly. The app should be deployed by now on a new domain using AWS.

**Week 12** - The commenting system improvements should be complete. We will have more than one environment set up and the app should be stable, logged and monitored.

**Week 16** - Extra features are completed.  Design improvements are made and the app is stable even with the new features.


## Risks
We have relatively little database experience, so we may need to spend a lot of time looking through the documentation to make sure we understand everything.

Another concern is being responsible for setting everything up from scratch. We’ve run into a lot of these technologies before but have never had to set them up and don’t fully understand them. In order to make sure this doesn’t become a problem, we will try to understand everything we implement instead of just blindly follow directions.

Spotify integration may not work how we think it does, and we may need to adjust our user experience depending on this.


## Documentation Plan
We will keep you updated on our work through the in-class standups and the Sunday checkins. Also, we will keep our GitHub up to date and use a Trello board to keep track of how much progress we are making and what is coming next for the project.
