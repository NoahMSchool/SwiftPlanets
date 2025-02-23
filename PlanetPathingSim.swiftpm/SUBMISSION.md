# Submission Questions 

### Tell us about your app in one sentence. What specific problem is it trying to solve? Be concise. (50 words)

Planetary Pathways is an interactive pathfinding simulator that aims to display different search algorithms in a fun way using planets. It aims use the growing interest in Space travel with an educational tool for teaching pathfinding algorithms.
  
### List the open source software you used and explain why you used it. You acknowledge and agree that you are solely responsible for the content of your submission and agree to comply with all applicable licensing terms and copyright obligations. (200 words)

I did not include any third party libraries or code, only Apple Libraries.
I developed in the Swift Playground app on a Mac. I used GitHub and GitHub DeskTop for source control. You can see the code and progress on GitHub: https://github.com/NoahMSchool/SwiftPlanets
I created the App Icon using Procreate on my iPad

I found the Red Blob Games article very useful:
https://www.redblobgames.com/pathfinding/a-star/introduction.html

###  Describe the user experience you were aiming for and why you chose the frameworks you used to achieve it. If you used AI tools, provide details about how and why they were used (500 words)

I was aiming for an interface that was simple but also informative. In order for a user to understand the algorithms there is quite a lot of information that needs to be shown. I've tried to only show relevant information. For example, the edges do not sure a weighting for algorithms that ignore weighting. The planets will show the Cost So Far information on them.

I create a Galaxy Builder that allows the user to select the number of planets as well as the maximum distance (or fuel) between them. I like how this regenerates when moving the sliders. I used an orientation based line segment intersection algorithm to ensure that lines do not cross or go through other planets. I also added two pre-made galaxy which are more usual when learning this algorithms and that give different results for each.

I used SwiftUI for the app structure and navigational elements as I wanted it to feel like a standard iOS app. I used SwiftUI Grids and ZStacks to layer the controls on top of the Game Scene.

I wrote the Pathing Algorithms to be independent of the Planets and Galaxies so that they could be used for any problem that needed them. This is done using the Traversable Protocol I created, which only needs 2 functions - getNeighbours() which returns a weighted set of paths and the heuristic().

I discovered that it is much more difficult to write these in a way that allow you to step forward and backwards through the algorithm that it is to simply solve the graph. I used a stack of State objects to implement the History Undo function.

I made base classes for the GalaxyBuilder and SearchAlgorithm which had subclasses for the different builders and algorithms.
 
I used SpriteKit to render the galaxy, planets and ship, as well as for the ship animations. The SpriteKit actions were very useful to move the ship between planets, and to create the Auto function where it stepped forward on a timer. The SpriteKit camera was helpful in creating the star parallax starry background effect.

I used the Model-View-Controller pattern to separate out the UI from the Logic. I put the SpiteKit views into one folder and the SwiftUI views into another.

I started introducing a Setting screen to allow settings such as ship speed or colours, but then decided this complicated the interface more and did not add much value.

I used ChatGPT to generate the Spaceship image and as a coding copilot to help me with syntax. I also used it to generate the code for the Tree Galaxy as it could copy the format of the Square Galaxy that I made.

### If you've used your coding skills to support your community or an organization in your area, let us know. (200 words)

I have not done this yet, but I hope to do this once I have finished my A Levels.
 
### Is there anything else you‘d like us to know? (200 words)

Before this project I had not used Swift before. I had used mainly Python. I had to learn a lot about how it worked and really enjoyed it. Things include?
- Protocols - Identifiable, Equatable, ObservableObject. I created Traversable so my graph code is generic
- Optionals  - a new way of thinking for me
- SwiftUI - Bindings, Navigation Stack, Sheets, Grids any more
- SprikeKit - shapes, animations
- Line Segment intersection algorithm 
- The idea of class variables. I had only seen static before
I am studying the algorithms in my A-Level Computer Science course
