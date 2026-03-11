
| **Name :**<br><br>Noah Marks                    | **Candidate Number : 1146** |
| ----------------------------------------------- | --------------------------- |
| **Agenda :**<br><br>Engaging Graphing Simulator | **Centre Number : 10132**   |

# A level Comp-Sci Writeup 


## Analysis

### Problem Recognition

The problem I am solving is the lack of fun ways to learn about certain Computer Science (CS) concepts, more specifically graphing algorithms.
Interactive simulations are useful tools for learning as they can walk you through new concepts especially for STEM and Computer Science. Good learning also comes from relatable analogies and creative teaching methods. The flexibility of Coding allows you to express this creativity through a program. Therefore a computer simulation a suitable method to teach a topic like graphing algorithms 

From experience I have noticed that when looking for resources online to help learn a new concept there are a separation between the engaging resources which are often videos using creative analogies and the interactive tools used to model them which are often boring and difficult to use and stuck in the browser. This could be due to the relative difficulty to make a program compared to a video.
I want to bridge that gap by creating a graphing algorithm simulator that uses a fun analogy of Space to keep the user engaged. From my research you will later see I believe that space is an engaging subject for many people interested in computer science and even if they are not it is still a fun different way to explore the algorithms.

Graphing algorithms are often found to be a difficult topic for Computer Science Students as they have not been exposed to these concepts before. I will make a educational tool that aims to create a fun way for anyone to learn about graphing algorithms through space. I will do this in the form of an app using Swift and SwiftUI.

### Analysing Other Solutions

I have selected a few educational tools that aimed to create an interactive way to learn something. I tried out these tools and noted down the parts that I liked and disliked about them.

#### Solution 1: Graph Online [[https://graphonline.top/]]

<img width="80%"  alt="Graph Online" src="https://github.com/user-attachments/assets/e6c11fa0-cad3-4ecf-a0de-d02985504591" />

This is a graphing simulator I found online. 
It lets you create a graph manually
The UI was quite tedious 
I thought it was frustrating making a graph manually and thought it would be especially not useful if this was your first time encountering a graph you may not know what graph to make.  
I found the options overwhelming and did not focus on anything specific. I thought It was more suitable for people more experienced with the basics. I want my project to be accessable to people who do not even know what a graph is.
It did not show you the steps of the algorithm and just solved it

#### Solution 2: TUM Shortest Path [[https://algorithms.discrete.ma.tum.de/spp/]]

<img width="80%" alt="TUM Shortest Path Algorithm" src="https://github.com/user-attachments/assets/b8c4fa64-73b3-4a83-9e5d-fe228275d1a5" />

The University of Munich made a graphing algorithm visualisation and learning tool that I enjoyed

I liked how there were different tabs which separated learning about the algorithm, creating the graph and running the algorithm.
I liked the detailed descriptions of the steps and the visual colouring of the nodes an edges I found this to be importaing for the algorithm.
The graph creation was better than graph online and there started with a simple graph thay you could extend but still was quite limiting
My main complaint is that the program was not very engaging. The user had to read long paragraphs of text and the app was not ugly but wasn't super visually appealing.
It also did not have many of the simpler graph traversal algorithms and only shortest path.

#### Solution 3: PhET Simulations ([[https://phet.colorado.edu/]])

This is not a graphing simulator but it is an educational tool making learning interesting.
There are lots of different high quality simulations on this platform. 
PhET Is a non profit organisation founded by Carl Weiman. They have made their own framework for making simulations

I loved using this and found it very useful but one thing I would have liked is if it added a creative twist to it to keep the user engaged. As this is a large platform with lots of pI may want to use an analogy of some sort to make the program more relatable to use.

#### Research Takeaways

The main things I took away is that I wanted to make the program approachable and relatable to the user, intuitive to use and not rely on any knowledge from the user, this would make it accessible to my whole audience which is anyone seeking to learn about graphing algorihms. 

### Stakeholders and Audience

My audience is anyone who is interested in learning about CS. This could be anyone from the age of 8 to 80 who is interested. This may seem like quite a broad audience due to the wide age range but I can slightly narrow it down to those who are more STEM focused.
Specifically I am targeting a younger audience as they are the future generation, and I want to create interest among the younger generation as they are still deciding what they are going to do with their lives. It is also true that this age group spends lots of time on mobile applications, playing video games or using computers so this may appeal more to them.

Therefore I feel like an app is the most accessible form to this audience.

My stakeholders are mostly Students studying graphing algorithms for the first time in A-Level CS as well as some GCSE students and some adults, as my goal is to make this tool accessible to people not actively studying computer science.

I have interviewed these stakeholders and I aim to use this data to tailor the experience to be more engaging across my audience. I am going to refer back to these users as I develop the program.

### Questionnaire for target market

| **When using a tool to learn a new subject would you rather.** | more freedom or a more guided path                                                                                                        |
| -------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Stakeholder 1: Rambo                                           | More control would be nice but it should be easy/intuitive to use                                                                         |
| Stakeholder 2: Noah                                            | I would like both, maybe you could start with a more guided approach and then once you are more familliar you could be given more control |
| Stakeholder 3 : Rocco                                          | I would rather be guided at the start as I can find the options overwhelming                                                              |

| **Which of the following analogies do you find most relatable and interisting** | Space, A Map (City or Rural)                        |
| ------------------------------------------------------------------------------- | --------------------------------------------------- |
| Stakeholder 1: Rambo                                                            | I would love a space analogy                        |
| Stakeholder 2: Noah                                                             | The ruralMap would be cool but also the Space       |
| Stakeholder 3 : Rocco                                                           | The Industrial Map would be cool but also the Space |

| **Which of the following subjects would you find most engaging for a learning tool.** | Space, Geographical or City |
| ------------------------------------------------------------------------------------- | --------------------------- |
| Stakeholder 1: Rambo                                                                  | City                        |
| Stakeholder 2: Noah                                                                   | Space                       |
| Stakeholder 3 : Rocco                                                                 | Geographical Landscape      |

#### Client Questionnaire takeaways

I believe a Space analogy will be the most suitable for the audience. This makes sense as my stakeholders are mostly into STEM so were already fascinated by space.
I think it is important to have at least a slow introduction into the algorithms. From research of other games I found the solutions that had an easy onboarding to be more useful. My stakeholders backed this up

### Using Computational Methods in the solution

#### Thinking Abstractly

I am going to use AI generated 2D sprites as this will not be time consuming and will be easy to implement while also providing an appealing aesthetic.

As My graphing simulator is set in space, I need to consider which features to keep to make the simulation at least somewhat accurate. This is a graphing simulator not an ultra-realistic space simulation so I am able to remove things without making the program useless to the user.
I will abstract lots of details of space and simplify it to just a graph with a few aesthetic objects in the backround for visual appeal.

I have looked at many aspects of space and noticed that there are many extra ideas that seem unnecessary and will overcomplicate the program. For example, adding planet Orbits would mean the nodes on the graph would have to move around. This not only complicates the development of the game but also adds extra complexities the user has to manage which would be frustrating, for example orbits would mean that the shortest path would be constantly changing. This would confuse the user which is a problem for an introduction to the subject.
Even though this may be unreasistic my planets are just going to be floating in space scattered randomly on a 2D plane.

I am going to remove aspects that do not add much value to the experience.
This might include 

#### Thinking Ahead
In each of the subcomponents of my game I am going to decide what are the inputs and outputs of my the function

#### Thinking Procedurally

I am going to break the game down into sub-systems to make it easier to write. When developing I will work on each component individually.
I will use a top down design when designing the architecture.

#### Thinking Logically
My simulator is going to be event driven so will do things in a logical order step by step.
I have to write lots of algorithms of varying complexity.

#### Thinking Concurrently

Lots of parts of my program will hapen at the same time. The ship will need to move, the galaxy will need to be generated, the paths will need to be found. This will mean that I need to do things asynchronously. There will be lots of objects in the game running functions continuously. This means that there will be multiple threads running at once which should be handled by the engine I use.

### Choosing a Framework

| **Platform**                                | **Description**                                                                                                                                                                                     | **Pros**                                                                                                                                                                                                                                       | **Cons**                                                                                                                                                                                                                                                                                                                          |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Unity](https://unity.com/)/Unreal          | Game engines will provide me with<br><br>Some examples of game engines I could use are Godot, Unity and Unreal Engine.                                                                              | I could make the program 3D however my game<br><br>Lots of lower-level UI interactions, e.g. panning, can be managed by the engine.<br><br>Lots of functionality is pre-baked into the engine meaning I will not have to code these elements.  | A game engine like this can be overly complex for my program , they are designed for video games involving more complex graphics. <br><br>I will have less control over the program if it is using pre-made functions which means I don't write as many algorithms. For a unique project like graphing I would want more control. |
| [Godot](https://godotengine.org/)           | Godot is a lightweight Game engine used for both 2D and 3D games                                                                                                                                    | Very lightweight and simple to use.<br><br>I can write in GDScript which is a simple language similar of python but can still be statically typed for efficiency.<br><br>I can easily export to many different platforms including ios devices | Like Unity, this is probably overkill<br><br>Too many functions provided in the framework so less algorithms to write                                                                                                                                                                                                             |
| [Swift](https://www.swift.org/) / SpriteKit | Swift is Apples programming language and SpriteKitis a simple graphics API I could use with it to make my game. SpriteKit is still feature ritch and powerful with their Node System and SKActions. | I could make my app work on all Apple devices such as tablets and phones which is a more convenient for my target audience.<br><br>It will be more efficient as Swift is statically typed meaning it will be more optimised by the compiler    | The game will not be playable on other platforms like Android or Windows as will be exclusively iOS.                                                                                                                                                                                                                              |
| [Pygame](https://www.pygame.org/)<br>       | Pygame is a simple 2D graphics library that uses python.                                                                                                                                            | I can write the project in Python which has easy syntax and is quite lightweight.                                                                                                                                                              | It is very basic so I will have to program all user interface components from scratch                                                                                                                                                                                                                                             |


#### Choice

The main three contenders are Swift / SpriteKit, Pygame and Godot.

After considering the benefits and drawbacks of each framework I have decided to use Swift for my project. I will specifically be using SpriteKit for the graphics and SwiftUI for the controls and User Interface. I like the simplicity of this as it means I have more control over my game. Another main factor in my decision means I can program it in Swift which is a strongly typed language meaning great efficiency compared to something like using python with Pygame which was a close second choice. I prefer this over a game engine which would require me to code in C# or C++ which are more complex.

However this will mean that the app can only be played on Apple devices, this could be a good start as they are popular with my audience. I found it is also quite difficult to have an Android version as I would need to rewrite it due to the specific frameworks I have selected. It may be more accessible if I make a Web App but Swift does not allow this.

### System Requirements


#### Software

As I am using Swift/SwiftUI it will have to run an apple operating system.

| **Requirement**                   | **Reason**                                                         |
| --------------------------------- | ------------------------------------------------------------------ |
| Runs macOS, iOS, iPadOS, VisionOS | Swift, SwiftUI and SpriteKit only works on these operating systems |

#### Hardware

My game will be played on either a computer, tablet or a mobile device.
It also must be an apple device such as an iPad, Mac or iPhone to run a required operating system

| **Requirement**               | **Reason**                                      |
| ----------------------------- | ----------------------------------------------- |
| Computer Mouse or touchscreen | Used for selecting objects and playing the game |

### Features of Proposed solution

### Limitations of Solution

As I am targeting to make the simulator accessable and focussed on introducing to graphs it is naturally going to be less feature rich and the user will not have full control over the program. It is not targeted at experienced people simulating lots of graphs to test efficiency or testing unusual cases on algorithms. It is more a learning tool
### Other Requirements
#### Usability Requirements
##### Menu with Navigation across screens
My app should allow the user to navigate between different screens. This should be intuitive and the user should not get lost.
##### Clean Design
I will make the appearance of the app minimal with clear controls.

##### Performance
The simulation should be able to run on lower end older hardware. This will make it more accessible to more people.
The program should not abruptly crash. It should not be too processeur intensive so it should be fast to run with decent frame rates, not drain the devices battery life and boot up quickly. I do not want performance to be an issue as it is importaint that the user enjoys using the program.

##### Bugs/Exploits
There should not be any Major bugs or Exploits in the program.  
My focus will be on minimizing bugs that are accedentaly triggered that cause unexpected behaviour as this would confuse/mislead the user. 

#### Information/Teaching

As this is an educational tool everything needs to be factually correct.
After and during development.
I will also make small quality of life improvements that make explanations more true to what is actually happening


### Success Criteria
| **Criteria** | **Reason** |
| --- | --- |
| Teach what a graph algorithm is | The user needs a clear foundation before exploring specific algorithms. |
| Show the uses of graph algorithms | The user should understand real-world uses of graph and graph traversal algorithms (for example, maps and routing). |
| Simulate a variety of graph algorithms on different graphs | This demonstrates that different algorithms have different strengths and weaknesses, and that performance depends on graph structure. |

## Design

### Problem Decomposition
I have broken down my problem into the following subcomponents.
When developing I will do sprints for each of these components.

#### Hierachy Diagram 
```mermaid

flowchart LR
    Program --> GraphGeneration
    Program --> GraphRendering
    Program --> AlgorithmSolving
    Program --> AlgorithmControl
    Program --> AlgorithmVisualisation
    Program --> UserInterface

    %%AlgorithmControl ---> |uses| AlgorithmSolving
    %%AlgorithmVisualisation ---> |uses| AlgorithmControl
    %%AlgorithmVisualisation ---> |uses| GraphRendering
```

#### Subcomponents
At a very high level, this are the six subcomponents I'm going to divide the problem into:

* **Graph generation** : This generates a random graph of planets for algorithms to solve
* **Graph rendering** : this will be a UI compontent that will show the graph visually as planets in a galaxy
* **Algorithm Solving** : this will implement all the Graph Traversal algorithms from A Level Computer Science
* **Algorithm Control** : this will store the state of an algorithm to allow users to step back and forwards through the solution
* **Algorithm Visualisation** : this is add more information to the graph rendering interface to show progress through the algorithm
* **User Interface** : this is how the user interacts with the app and navigates between the screens


### In depth structure of components of Solution
Here is an in depth summary of each of the components of my solution
 
#### Subcomponent One : Graph generation
##### Description
Generates a undirected graph that the algorithms can operate on and the spacship can move between. Each node will be a planet in the graph which knows its neighbours. I will start simpler by using an unweighted graph (or all the weights equal to one) and then add weights later for neccessary algorithms. To keep with the analogy I will call the weights fuel needed.
This will also include choosing a start planet and an end planet. The graph does not neccessarily have to be solvable 
##### Inputs
Number of Planets, Connection Length
##### Outputs
Graph with connected nodes or planets
##### Validation
At least two planets and up to a sensible limit which will be decided.	The start and end planets should not be the same planet. Planets should not be too close to each other or go on top of each other.

Learnings (things added later)
Non random test galaxies
Edges should not intersect as it makes it hard to visualise. This is why i introduced the checklines
Implemnt in future: 
The start and end planets should be a reasonable distance from each other to prevent graphs being solved too quickly and start planet has neighbours


#### Subcomponent Two : Graph Rendering
##### Description
Now that I have a graph which are nodes that store their positions and know their neighbours I need a way to visualise them
The first part of this is to add circles to the correct coordinates and lines showing the connections for edges.
The graph also needs to give an interface that alows external classes to access the colors of nodes and edges aswell as other effects and info about the node. This will mean that when writing the algorithm it will be easy to change the visuals for the user.
##### Inputs
A graph Datastructure that stores nodes and edges
##### Outputs
A visual display of the graph that appears like planets in a galaxy with lines showing the edges. All text labels should be readable.
This graph should be able to change using code so it can also be used as a tool to display what is happening during the graph traversal
##### Validation
The nodes and edges in the graph is in valid locations and are linked correcly. The graph rendering will assume that the graph is valid and will render even if nodes are in incorrect locations.

#### Subcomponent Three : Algorithm Solving
##### Description
I will make a simple graph traversal algorithm such as Breadth First Search and Depth Firt Search to traverse the graph and find a path from the start to the finish.
It will record neccessary data such as the queue or stack of nodes to visit next aswell as the visited nodes.
I plan to then implement the rest of the algorithms in the A-level specification including dijkstra and A* using a heuristic of distance to target.
I will not have a UI at this stage but plan to visualise data in the console or debugger.
##### Inputs
A graph and a chosen algorithm
##### Outputs
A solved graph storing the backtrace path taken to get from start to finish it should also be able to report if it is solvable
##### Validation
There should be a start and and end node and an algorithm to use needs to be selected


#### Subcomponent Four : Algorithm Control
##### Description
The first part of the problem is just solving the algorithm instantly however I want the user to see each stage of the solving along with the state of the variables being used at this time. The user should be able to easily use this to make a trace table for the solving of the algorithm. This is because this is meant to be a learning tool not just a graph solver.
The ability to undo and redo
##### Inputs
Graph Algorithm 
##### Outputs
Step by step state of graph algorithm
##### Validation
Not Undo at the first stage and redo at the last stage

#### Subcomponent Five : Algorithm Visualisation
##### Description
Now that I have data for all the states of the algorithm I need to be able to display it to the user.
In this section I will heavily use the interface I created for the graph changing colors.
I will also create lists and other UI elements to help display algorithm state and other factors.
I am also going to add a spaceship that shows the current node
##### Inputs
A graph that provides a interface for changing visuals, UI elements
The Algorithm State
##### Outputs
A visual display of the state of the algorithm
##### Validation


#### Subcomponent Six : User Interface
##### Description
This component is not to do with the main program but is about the app as a whole. I want a easily navigatable UI that will show all the different screens and should be intuitive to use.
This is not just putting the screens together but also covers the creation of these UI elements. I am going to use reusable components which will save time in development, increase performance and create a consistant User Interface
##### Inputs
Buttons that The user can press. Menus the user can sellect
##### Outputs
Affect program when buttons are pressed or items are selected by calling functions or updating variables.
Give a visual interface of the program
##### Validation
The views should only allow for valid inputs such as selecting objects that exist or numbers in a correct range. 

### System Overview / Architecture

I will use the Model View Controller design pattern to separate the components of my app.

**Explain diagram and high level of components, Model veiw controller**

#### Model (Data Structures)
As I am using the Model View Controller Pattern I am going to keep the data in the Model.
This will ensure there is a single source of truth which ensures consistancy of data.
I am going to use an Observable Object which is a *"A type of object with a publisher that emits before the object has changed."*
This means when changing the objects properties it will update any views using the data.

##### The Models include :
* Graph Genearation
* Algorithm Solving
* Alogorithm Control

#### View (User Interface)
The Views Provides a GUI for the user to see and interact with the program. 

For this I will need to use a graphcs library. I am going to be using two, SpriteKit and SwiftUI.
SpriteKit will be used for the areas where I need more control such as drawing graphs and custom animations.
SwiftUI is going to be used for the overall adaptive app UI and navigation between screens.
##### Spritekit 
```SpriteKit is a general-purpose framework for drawing shapes, particles, text, images, and video in two dimensions.```
SpriteKit is imperitive so I have control over exactly what is being rendered. It has a 2D coordinate system and allows me to place nodes in precise positions and draw shapes. This is importaint as I have control so I can draw graphs exacly how I want.
It is a game engince that uses apples metal framework which will mean high performance rendering.

##### SwiftUI
```SwiftUI is a declarative framework for building user interfaces for iOS, iPadOS, watchOS, tvOS, visionOS and macOS, developed by Apple Inc```
Declaritive programming languages are higher level than imperitive so it uses Abstraction so I dont need to worry about the low level how the UI is created.
This will mean that my UI will adapt to all screen sizes with little effort! This is because I define what I want the UI to look like and it will generate it so it is not generated with a particular screen size in mind. 

#### Controller (Program Logic)

The controller while was not included in the subcomponents is still a large section of the program. It provides a bridge between the Models and the views and is essential for the program to run.
I am going to use swiftUI observable object which is an an object that will notify and update observers when it changes


```mermaid
erDiagram
	GALAXY {
	}
	PLANET {
	}
	SHIP {
	}
	BUILDER {
	}
	ALGORITHM {
	}
	TRAVERSABLE {
	}
	GALAXY||--|{PLANET:"has"
	GALAXY||--||SHIP:"owns"
	SHIP||--||PLANET:"located_on"
	GALAXY||--||BUILDER:"generated_by"
	GALAXY||--||ALGORITHM:"uses"
	PLANET||--||TRAVERSABLE:"implements"
	ALGORITHM||--|{TRAVERSABLE:"operates_on"

```


### Implementation of Subcomponnets

#### Subcomponent One : Graph generation : Model
As this is not to do with the graphics I do not need to use any graphics libraries however It will use coordinates. This will be provided to the graph rendering component which will use SpriteKit to render it.

I decided that the graphs I use are going to be undirected meaning there is no one way relationships between nodes, I think this is simpler for someone new to graphs. The graphs are going to be weighted however as algorithms like dijkstra and A* are more suitable for weighted graphs. My graphs are not required to be fully connected so it is possible that the graphs are unsolvable. I think this is importaint as it exposes the user to the case that algorithm finishes on the case that it has not found a path to the target node.

I need to create some algorithm that I use to generate a 2D graph that fits the requirements:
* The nodes should not be too close or on top of each other
* The nodes are distributed roughly evenly but still look random.
* Most graphs created should be solvable
* The connected nodes should be based on the distance between the nodes.

![GalaxyGeneration](https://github.com/user-attachments/assets/54ac3060-4519-4aa2-befa-87da94b83d19)

#### Subcomponent Two : Graph rendering : View

For rendering the Graph I am going to use Spritekit. This is because I can draw exact shapes of planets and lines. I will have very exact control over what I am doing. 

##### Planets/Nodes
The planets are going to be rendered using filled circles which are randomly selected from the planets. They will have a custom border whose color can be changed.
The planets will have labels below them which should be readable. These will be used to show the name of which planet it is as the names will be used in other places.

##### Edges/Paths
The edges will be represented by lines
There should be a text box on the lines which will be used represent the weight. This should also be readable and the graph rendering is not responsable for what is in the text box, It just needs to be able to be changed.

#### Subcomponent Three : Algorithm Solving : Model
For the search algorithms I realised they are not that different from each other. They all have a list of nodes to visit and the nodes they have visited. The only difference is the order they are visited in.

![Algorithms](https://github.com/user-attachments/assets/bd547fbb-1660-4bb2-b38b-7d9e4bf8b2e4)

##### General Search
I will implement a general search class that the other algorithms will inherit from this will have the core functinality that all the search algorithms require.
The way these search algorithms work is:

1. They have a (priority)queue/stack to decide what is the next node to visit and visit that node.
2. They add this node to a visited list so the algorithm knows not to return.
3. They check if they are on the target node, if so then they have found the target and the search has been completed.
4. If not they see which nodes are connected to the current node and add them to the queue/stack, first checking if they are not there already using the list of already visited nodes
5. Then continue back to step 1 until the target node is found or the nodes to visit list is empty which means that the node could not be found. (Maybe the start and end are not connected)

##### Breadth First Search (BFS)
Breadth First Search uses a standard First In First Out queue. This will provide a broad search so will go to the nodes closer before going to further away nodes

##### Depth First Search (DFS)
Depth First Search uses a Last In First Out stack.
This will provide a deep search that will go until it hits a dead end then backtrack.
I am using a Pre-Order Traversal so it will start at the root then go left then right.

##### Dijkstra's shortest path
Dijkstra uses a priority queue. The condition is the node that the selected node is is the node with the current shortest distance to get to. This ensures it will not go to the a node until there are no other nodes that are closer. This guarantees that there will be no shorter path to the next node via other nodes. Assuming there are no negative weights this will always return the shortest path.

##### A* shortest path
A* uses a priority queue based on a combination (A 50/50 split) between the closest node and a given Heuristic. The heuristic that I am going to use is the distance as the crow flies to the target node from the current node.

##### Greedy Best First Search (Bonus)
When researching the algorithms I found there was one more algorithm that would complete the program. Although Greedy (BFS) is not in the A-Level spec it has the same core idea of the others as it uses a prioriy queue which only has


Here is a summary table of the algorithms and the features they use:

| Feature | GalaxyBuilder | BFS | DFS | Greedy BFS | Dijkstra | A* |
| --- | --- | --- | --- | --- | --- | --- |
| Frontier Data Structure | Queue | Stack | Priority Queue | Priority Queue | Priority Queue | Priority Queue |
| Use Weights | --- | --- | --- | Y | Y | Y |
| Use Heuristic | --- | --- | --- | Y | --- | Y |
| Priority Function | --- | --- | --- | Heuristic | Weight | Heuristic + Weight |


#### Subcomponent Four : Algorithm Control : Model

![GraphControl](https://github.com/user-attachments/assets/ab664823-7ee0-4fb6-8102-55429821660a)

##### Solving Step By Step
When writing these algorithms normally and how it is described previously in algorithm solving is that they use iteration or recursion. This means that local variables are created in a loops or functions and they are overidden on each iteration and do not persist in memory. If I want to run the algorithm step by step so the user can view it the options are:

| **Method** | **Benifit** | **Drawback** |
| --- | --- |
| Pausing the execution in the loop waiting for user input before continuing | Reletively easy to implement | The algorithm code would need to be run in a separate thread so it doesnt pause excecution of the main program. | 
| Storing state of the variables externally so they persist in memory so I can jump to certain steps without having to rerun the algorithm from the start. | I need to make a datastructure to store the state of the algorithm and write other functionality to use this datastructure to step forward and back or to steps in the algorithm |

I am going to go with the 2nd choice as I beleve the ability to undo redo and move to certain steps is importaint. And 

One thing worth mentioning about this decision is that running these search algorithms are not computationally expensive (especially as I would do it on imput) so running it every time on user input is not actually a major problem. Running it once compared to 10 times will have almost zero affect on performance. It is likely the processes rendering the graphics are more expensive than these algorithms. Although this is likely also not expensive as I am keeping it simple to allow it to run on low end/old hardward.

##### Undo/Redo Stack
One of my requirements is that the user should be able to replay the steps of the algorithm
Another Requirement is that my program is efficeint to optimise performance on less powerful devices.
To implement this I am going to use a stack that stores the state.

I will create a data structure that saves the state of the algorithm
When Moving forwards a step I wil push the importaint data of the algorithms state onto a stack.
When Undoing a step I will pop the top of the stack and 
However for this I need to reacalculate the steps when going forwards but not backwards.
To fix this I could make anouther stack that stores the next instructions
together these two stacks and current state will store all the possible states of the algorithm.
When moving forwards I will pop the current state from the forwards stack and when going backwards I will push the current state on the forwards stack.

This will mean I calculate all the possible states at the start and the algorithms dont need to be run every step.

#### Subcomponent Five : Algorithm Visualisation : View
This componnet is very importaint which is to display progress of the algorithm to the user. This needs to be well done as it it the main purpose of the program.

![Frontier](https://github.com/user-attachments/assets/fb01a530-c8b6-4520-8383-fe3cdbd789eb)
![GraphSolving](https://github.com/user-attachments/assets/9a66c195-65f1-4da8-ab85-12e208d0c1b5)


##### Spaceship
The spaceship Is going to be the object that traverses the graph. It will place emphasis on the current node being visited.
I am going to use SpriteKits SKSpriteNode which allows me to put 2D textures on a object.

##### Frontier and Explored Lists
As well as UI elements it is importaint to show text based info. I want to show the lists of nodes that have been visited and are next to be visited.

The list of nodes to visit is the frontier. This is the queue/stack/priority queue that the algorithm uses to select the next node to visit.
The list of visited node is the visited. This is a list of the nodes that have already been visited. I could add information next to these about the weight to get to it so far or the node it came from for more information.
##### Explanation Boxes
To Tie all the Visualisation together I am going to have a text box.
This will explain what is happening in each of the steps of the algorithm. It will say what the algorithm is acctually doing while it is happening to help the user understand.
I will premake a selection of strings that allow me to insert specific information in the correct location (such as the node name).
I will also give the ability for the user to swap between Space Explanations (which use space vocab to increase engagement such as: Galaxy, Planet, Path) and a more Technically accurite Graph Explanations (which uses words like graph, node, edge).

##### Planet and Path Colouring
As the user Is looking at the graph for most of their time using the program the graph should also show the state of the algorithm.
These will be the same colours as I coloured the lists for the frontier and the visited. I am going to highlight different nodes and color code them based off their significance.
I am going to do this using the graph's interface i will create

#### Subcomponent Six : User Interface : View
All of the User Interface is going to be made with SwiftUI.


![AboutScreen](https://github.com/user-attachments/assets/d716bdb5-385f-4f5d-aef6-e2467646e336)
![StartScreen](https://github.com/user-attachments/assets/da99b1e1-7ab1-4a8d-8e15-9ca406712a2f)
![SettingsScreen](https://github.com/user-attachments/assets/0ba99730-a5ca-43fb-a628-675401961496)

##### Adaptability
The User Interface needs to be able to adapt to different screen sizes. Although iPads are all the same 4:3 aspect ratio they can be rotated to be in portrait and my app still needs to work. It should also work on Mac's, iPhones and Headsets. If it is being windowed the size should adapt similar to a web page
I therefore should make sure my app can adjust the size and locations of UI elements to fit and not obscure the screen.
##### Validation of input data

##### Navigation
As I am going to allow the user to navigate around different Views.
I am going to use SwiftUI's Navigation stack for this.
As I want to have control and stylise my app I am not going to be using Apples built in components and will heavily customise them.

These screens should include:
* Menu (for selection)
* Settings (changing preferences for user such as ship speed, space/graph descriptions, planet names, I will use a swiftUI element called a sheet which will provide a semi-transparent popup overlay to allow the user to see the content while changing the settings)
* How to use (explains how to use the program)
* About Graphs/Algorithms (Teaches the user about graphs using a text page (not the simulation)
* Graph/Galaxy Builder (Allows the user to create/select/generate graph)
* Simulation (Where the program performs the Graph Traversal Algorithms on the generated graph
Here is a short graph of how these screens will interact
```mermaid
stateDiagram-v2
	[*] --> Menu
    Menu --> Instructions
    Instructions --> Menu
    
    GalaxyBuilder --> Simulation
    Simulation --> GalaxyBuilder
    
    Menu --> Information
    Information --> Menu

    Menu --> GalaxyBuilder
    GalaxyBuilder --> Menu

	GalaxyBuilder --> Settings
	Simulation --> Settings
	Settings --> GalaxyBuilder
	Settings --> Simulation

```


##### Menu Screen
This is the Screen that the user will start with. The user should be able to navigate to all the other screens from here
##### About Graphs/Algorithms
This is going to be a scrollable text screen that will tell the user about the algorithms.
It is going to also contain images and tables to compare the algorithms as they are not too different from one anouther.
##### How to use screen
Like the about screen this is going to be a scrollable screen with not much interaction.
##### Settings View
This is not so much going to be a separate screen but will be placed on top of the current view. This will always be the galaxy builder or simlation as it is only accessible via these pages.
I am going to use a swiftUI element called a sheet which allows me to overlay the settings view on top of the current view, this will allow me to keep the background visible while changing settings to keep the context of the graph.
##### Graph Genaratian
This will contain the SpriteKit View

##### Simulation
This will contain the SpriteKit View


### Test Data

When writing the algorithms In order to debug and ensure they are working as intended I will need to make graphs that will produce different outcomes for each algorithm. I wrote some down on paper and manually solved them step by step using a trace table. When developing I will compare the state with the expected state to make sure they work.
These test graphs looked more strange as the length of the paths were not what determined the weight. In my random graph generation the weights will be proportional to the distance between the nodes (with some random noise for variation).

### Further Post Development Test Data

## Development

### Stage One/Two : Random Galaxy Generation/Rendering
I did the genaration of the galaxy and the rendering in parralell as it means I can visualise what is being done which is importaint to know if I am doing it correctly 
#### Generation

My first task was to randomly generate a graph/galaxy. This would consists of nodes/planets and edges which connect the path.

* My objectives is that each galaxy should feel random and different. 
* You should have some control over the graph structure without having to micromanage nodes
* Select the Number of nodes in the graph and lengths of paths
* The graph should look visually appealing and look like a galaxy

I started by using a nested for loop to create a square grid of possible positions for a planet and I added these to a array. I need to select a fixed number of positions from this list of positions. To do this I randomised the order of the planets array and selected the first planetCount of this array.

I then

Here is the create Planets for random galaxy
```swift
override class func createPlanets(planetCount: Int, spacing : Double = 100, mapSize : Double = 1000)->[Planet]{
        var planets : [Planet] = []
        var options : [CGPoint] = []
        let jitter = Int(spacing/10)
        let offset : Double = 50
        for y in stride(from: -mapSize/2, to: mapSize/2, by: spacing){
            for x in stride(from: -mapSize/2, to: mapSize/2, by: spacing){
                options.append(CGPoint(x: x+offset, y: y+offset))
            }
        }
        options = options.shuffled()
        var planetNamesShuffled = planetNames.shuffled()
        
        for i in 0...min(planetCount, options.count)-1{
            var name = "No Name \(i)"
            if !planetNamesShuffled.isEmpty{
                name = planetNamesShuffled.removeFirst()
            }
            var offsetPos = options[i]
            offsetPos.x += CGFloat(Int.random(in: -jitter...jitter))
            offsetPos.y += CGFloat(Int.random(in: -jitter...jitter))
            
            let planet = Planet(position: offsetPos, name: name)
            planets.append(planet)
        }
        return planets
    }

```


```mermaid
classDiagram
        class GalaxyBuilder{
            createPlanets(planetCount, spacing, mapSize)
            calculatePlanetPaths(maxDistance)
            planetNames : Array[string]
        }
    class RandomGalaxyBuilder{
    }
    class SquareGalaxyBuilder{
    }
    class TreeGalaxyBuilder{
    }
    GalaxyBuilder <|-- RandomGalaxyBuilder
    GalaxyBuilder <|-- SquareGalaxyBuilder
    GalaxyBuilder <|-- TreeGalaxyBuilder
```
#### CheckLines
After Creating the random galaxy generator I realised there were lots of intersections of edges in the graph. The edges went through planets. This looked ugly and could be confusing to the user.

In order to delete edges and I need to decide which edges to delete.
I decided to keep the shorter edges and remove the longer edges that intersect with the shorter edges.

I used a closure with the sorted to compare which is the shorter edge. I am using a built in sort function for efficiency
```swift
// Example of comparitor implemented as a closure
let sortedPaths = potentialPaths.sorted {
    return $0.distance<$1.distance
}
```

To fix the Lines going through planets  I thought of putting edges across the planet nodes. This meant that when an edge passed through a planet it would be deleted.
However when developing this I encountered a bug that caused edges that ... to be deleted
The fix to this was to put 4 edges from the centre of the planet to the circumference.

Here is a function on the planet that returns the checklines
```swift
func getCheckLines()->[(start: CGPoint, end: CGPoint)]{
        let horizontalFirst = (start: CGPoint(x: self.position.x-planetRadius, y: self.position.y), 
                               end: CGPoint(x: self.position.x, y: self.position.y))
        let horizontalSecond = (start: CGPoint(x: self.position.x, y: self.position.y), 
                                end: CGPoint(x: self.position.x+planetRadius, y: self.position.y))
        
        let verticalFirst = (start: CGPoint(x: self.position.x, y: self.position.y-planetRadius), 
                             end: CGPoint(x: self.position.x, y: self.position.y))
        let verticalSecond = (start: CGPoint(x: self.position.x, y: self.position.y), 
                              end: CGPoint(x: self.position.x, y: self.position.y+planetRadius))
        let checkLines : [(start: CGPoint, end : CGPoint)] = [horizontalFirst, horizontalSecond, verticalFirst, verticalSecond]
        return checkLines
    }
```
#### Intersection Algorithm using Orientation
To check if two lines intersect I did some research online and found an algorithm that uses orientation to check if two lines intersect. I used an article from GeeksforGeeks to help understand the concepts before implementing it

To deterimine the orientation of a line I used the sign of the cross product.
Here is the code I used to check two lines intersect

#### Minor improvements to prior stages


### Stage Three - **Implementing Search Algorithms**

#### Traversable protocol
As I want my code to be generic to any graph. I defined a protocol that nodes in a graph must conform to. The functions are quite simple and is a requirement for any graph to be traversed so it should not be that hard to adapt some other graphs protocol to work with this.
This means that my search algorithms should work on any graph that conforms to this protocol.
In my case the Planets are the nodes so they conform to **Traversable**

```swift
protocol Traversable: Identifiable {
    // This property requirement comes from Identifiable.
    var id: UUID { get }

    func getNeighbours()->[(neighbour : any Traversable, weight : Double)]
    func heuristic(to end: any Traversable) -> Double   
    func isEqual(to other: any Traversable) -> Bool
}
```
The functions that are required are:
* **getNeighbours** which should return the nodes that a node is connected to. These will be added to the frontier list
* **heuristic** will give a the chosen heuristic to guide the search. In my case this was the absolute distance to the target.
* **isEqual** will alow two nodes to be compared to check if two nodes are the same so the program knows if the graph has been solved when (current node == target node).

#### BaseSearch
I made my Search Algorithms all inherit from a Generic BaseSearch class.
This acted partly like a protocol as it defined the functions the child classes should have. However the base search implemented some basic generic functionality that was overriden when neccessary.

#### Breath First Search
#### Depth First Search
#### Dijkstra

#### A*

For A* the priority function was still extremely simple:
```swift
getNewWeight(n: n) + n.neighbour.heuristic(to: to)
```

#### Greedy Best First Search 


#### Diagram of searching components

```mermaid
classDiagram
        class BaseSearch{
            start : Traversable
            end : Traversable

            useWeights : Bool
            useHeuristic : Bool

            getQueuePriority()
        }

        class Traversable{

        }
        BaseSearch <|-- Dijkstra
        BaseSearch <|-- AStar
        BaseSearch <|-- BreadthFirst
        BaseSearch <|-- DepthFirst
        BaseSearch <|-- GreedyBestFirst
        BaseSearch *-- Traversable
```



#### Minor improvements to prior stages


### Stage Four : Algorithm Control



```mermaid
classDiagram
        class BaseSearch{
            start : Traversable
            end : Traversable

            useWeights : Bool
            useHeuristic : Bool

            getQueuePriority()
        }

        class Traversable{

        }
        class AlgorithmState{
            current : Traversable
            frontier : Array[neighbour: Traversable, weight: Double]
            explored : [Traversable]
            cameFrom : [UUID: (Traversable)?] = [:]
            weightSoFar : [UUID: Double] = [:]
            path : [Traversable] = []
            backtrackPathFromPrevious : [Traversable] = []
            completed : Bool
            pathExists : Bool
            explanation : String
        }
        BaseSearch *-- Traversable
        BaseSearch *-- AlgorithmState
```

#### Step by Step Solving

#### Undo/Redo Stack
I made an UNDO stack to store the history of the algorithm.

When I went forward in the algorithm I created an object that stored all the key variables of the algorithm state. This is similar to how the contents of the registors are pushed onto a stack when there is an interupt.
This is the AlgorithmState Object I created. It stores a the simple data aswell as dictionaries of all the nodes and the relevant data.
```swift
struct AlgorithmState{
    var current: (any Traversable)
    var frontier : [(neighbour: any Traversable, weight: Double)]
    var explored : [any Traversable]
    var cameFrom : [UUID: (any Traversable)?] = [:]
    var weightSoFar : [UUID: Double] = [:]
    var path : [any Traversable] = []
    var backtrackPathFromPrevious : [any Traversable] = []
    var completed : Bool
    var pathExists : Bool
    var explanation : String
}
```

Different to design I did not include a redo Stack that stored the future stages. The argument that it is less efficient I do not think is a problem as it is only being done on event and the calculations are actually not that big.

### Stage Five : Algorithm Visualisation
This stage was taking longer than expected and I found a few improvements I found necessary as well as using a new part of SpriteKit SKActions which allowed me to animate things

#### Heirachy of SpriteKit elements

##### Text Bubble
To put UI elemnts over the spritekit scene turned out to be difficult and not the best way to do it. Instead I created my own SpriteKit elements which I could reuse. This inherited from SKNode and uses a lebelNode for text and a shapeNode for the border.
The size of the border is not passed in but is calculated to fit the passed text. This means it is easy to use this uiElement. The text can be changed and this simply will recalcualte the border size

##### ShipNode
The Ship turned out to be more of a UI element than an actual object that I expected. I used a SKspriteNode for this, these are nodes that take in an image which should be in the projects filesystem


#### SKActions
To create animations in the program I used SKActions.
SKActions are a class that allows me to transition properties and run actions one after each other.
This is how I added all the animations and moving elements in my game, it is not only for animations but is also used for moving nodes and can even run code. I used this for these purposes.

##### ShipRingPulse
I added a pulse for when the ship explores a planet. The radius is dependant on the ships shortest distance so the ships it can travel too. Hopefully this makes it more obvious what planets are added to the frontier
##### NodeTeleport
##### MoveShipNode

#### Algorithm Backtracking
After implementing the search algorithms I realised algorithms that used backtracking would do large jumps across the graph. I thought this was unclear and may be confusing for my target audience. I wanted to implement a feature that showed the nodes the spaceship backtracks to on the way to the next node.
To do this I made each node store the node which the ship came from.

#### Minor improvements to prior stages


### Stage Six : User Interface

My User Interface needs to adapt and scale to fit different sized screens by looking consistant. visible and unintrusive for different devices. During this stage I used my ipad mini a lot for testing and tested using different window sizes on my laptop. 
Overall I found this to be harder than expected.

The Screens that I included were the Menu Screen, Graph screen, How to use screen and a Algorithms Descriptions screen.
I did not include a settings page as I did not find there were many controls in the program so I didn't think it was neccessary.

#### SwiftUI Reusable Components
##### Space Text
To save time developing the program and to increase the consistancy of the UI across the user interface I used reuasable components such as buttons, sliders and text.

I started by creating a custom view modifier that could change the text in a view. A view modifier in switui is function that can change aspects of a view. I made my own custom modifers which could make elements in my custom style. I made three for basic text, headings and subheadings. When making them I was just using built in view modifiers but my custom one just packaged them together so I can change all elements using this modifier by just changing the modifier. For the font I used a system font called"chalkduster" which is preinstalled on most new iOS devices.

Here is the text modifier
```swift
struct SpaceText: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.custom("Chalkduster", size: 14))
            .foregroundColor(.white)
    }
}
```
Here is an example of them being used
```swift Text("this is a subheading").modifier(SpaceSubheading()) ```
I also made a title View which was a fixed string I could use from the title screen

##### Space Buttons
I made two stylised buttons that I could reuse. These are custom small SwiftUI views that I can reuse. They use the standard swiftUI buttons but apply further styling. This includes adding the spaceText modifier I already created.
SwiftUI buttons take in a closure which is a function that is called when they are pressed. This meant my buttons had to take in a closure and then relay it to the button I use in the view.
For the larger buttons I wanted to pass in text to them

```swift 
SpaceButton(imageSystemName: "moon", textLabel: "SpaceStyle", disabled: false, action: {print("hello there")})
LargeSpaceButton(text: "SpaceIsBig", imageSystemName: "star", action: {print("spaceIsBig")})
```
<img width="251" height="225" alt="image" src="https://github.com/user-attachments/assets/82fde299-3d98-4bce-95fc-3ce84f15b713" />

##### SpaceList
This and the remaining components are primarily used for the HUD for the algorithm Control
##### SpaceSlider
##### SpacePicker

#### Menu Screen
This is the first screen that is shown on launch so it should allow the user to navigate from here to the rest of the program. I did this by passing the closures to change the state of the 
The Main Menu Screen was made up of The main title text which was defined in the spaceText and Three Large Space Buttons 

<img width="622" height="347" alt="image" src="https://github.com/user-attachments/assets/187e5d8b-58a2-48d6-bb88-78cb56637585" />

#### Graph Genaration Screen

#### Graph Solving Screen

#### How to use Screen
This is a screen that shows the user how to interact with the program incase they are confuesd. It tells them what the colors codes mean and what the stacks and other UI elements represent.
It also shows the user the controls and how to interact with the program.

#### Algorithms Descriptions Page
The start of my algorithms page is generic to all the algorithms. Similar to how I realised how similar the algorithms core concepts really are I wanted to amplify this in the descriptions.

For the algorithm description I wrote it so the information is not stored as text strings in the page.
but are accessed from the algorithm object itself. I loop through all the algorithms and then display their individual descriptions. This way if I add new algorithms I dont need to edit the descriptions page but if I add a description to the algorithm object it will just update the page automatically.

Here is the code in the algorithm descriptions page that loops through all the algorithms and adds the descriptions to the page:

```swift
ForEach(GameController.searchAlgorithms, id: \.self) { algorithm in
	if let algorithmType = GameController.algorithmTypes[algorithm] {
		//Image(systemName: algorithmType.getIcon()) 
		Text(algorithm).modifier(SpaceSubheading())
			.padding()
		Text(algorithmType.getDescription())
		HStack {
			Text("Use Weights")
			Image(systemName: algorithmType.usesWeights() ? "checkmark.circle.fill" : "xmark.circle.fill")
				.foregroundColor(algorithmType.usesWeights() ? .green : .red)
		}
		HStack {
			Text("Use Heuristic")
			Image(systemName: algorithmType.useHeuristic() ? "checkmark.circle.fill" : "xmark.circle.fill")
			.foregroundColor(algorithmType.useHeuristic() ? .green : .red)
	}
	}
}
```

Here is an example of the algorithms get description function which is in the algorithms class. this function is overriden by each algorithm 
```swift
override class func getDescription()->String{
        return "Dijkstra's Algorithm was created by Edsger Dijkstra in 1956. It always finds the shortest weighted path from start to goal. It uses a priority queue to explore the lowest-cost path first."
    }  
```

#### Heirachy of SwiftUI elements
Similar to SpriteKit I used reusable components to save development time and increase consistancy in the UI.

#### Making it adapt to screen size.
I found this to be the most challenging part of creating the UI. 


#### Minor improvements to prior stages

##### Starry Background
This is a bonus SpriteKitView I created for decorative reasons. It uses spriteKit to create a nice starry background for the screens. It's algorithm was random so each starry background is different. The alogrithm is vry simple as it simply randomly places stars a random number in a random position in a given range for a set number of iterations. I used some of spriteKits effects like glow which gave a glow around the border on the individual stars which were just small dots/circles.

This code is the code that generates the stars and puts it under the stars node which is added to the SpriteKit game tree.
``` swift
let stars = SKNode()
        for _ in 0...starCount{
			// Randomly Generates Position
            let position = CGPoint(
	            x: Int.random(in: -size...size), 
	            y: Int.random(in: -size...size)) 
            let star = SKShapeNode(circleOfRadius: 0.5)
            star.glowWidth = 0.5
            star.position = position
            stars.addChild(star)
        }
```
This is shown behind all the screens

## Evaluation
In this section I will go through the differnt components, Show the related success criteria in a table and mention any relevent added features and improvements that could be made.

| Success Criteria | Achieved | Why/WhyNot |
| --- | --- | --- | --- |


#### Subcomponent One : Graph generation
Learnings (things added later)
Non random test galaxies
Edges should not intersect as it makes it hard to visualise. This is why i introduced the checklines

Implement in future: 
The start and end planets should be a reasonable distance from each other to prevent graphs being solved too quickly and start planet has neighbours

#### Subcomponent Two : Graph Rendering

#### Subcomponent Three : Algorithm Solving

#### Subcomponent Four : Algorithm Control

#### Subcomponent Five : Algorithm Visualisation

#### Subcomponent Six : User Interface

##### Text Based SwiftUI pages
One small thing was I found the text/image based information pages to be quite static and boring. One reason being that I used images in theses screens which were simply screenshots It may have been better if I used small SpriteKit windows in the swiftUI view to make it more interactive. This would future-proof it too as if I updated the gameplay screens it will automatically update in the screenshots instead of me having to take new screenshots.
This also meant that the starry background in the screenshots would move relative to the starry background in the page which was a small issue but still could be better.

I also thought the text and UI components did not optimise space particularly well. The back button limited the available screen real estate. To do this better I would have overlayed the UI components and used transparent images. 

## Sources

Orientation Algorithm For Line Intersection
https://www.geeksforgeeks.org/dsa/check-if-two-given-line-segments-intersect/


https://www.ocr.org.uk/Images/324587-project-setting-guidance.pdf
https://www.ocr.org.uk/images/170844-specification-accredited-a-level-gce-computer-science-h446.pdf
