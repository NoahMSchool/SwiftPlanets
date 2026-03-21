# A Level Comp-Sci Write-Up

| **Name :**Noah Marks                        | **Candidate Number : 1146** |
| ------------------------------------------- | --------------------------- |
| **Agenda :**<br>Engaging Graphing Simulator | **Centre Number : 10132**   |
## Analysis

### Problem Recognition

The problem I am solving is the lack of fun ways to learn about certain Computer Science (CS) concepts, more specifically graph algorithms.
Interactive simulations are useful tools for learning as they can walk you through new concepts, especially for STEM and Computer Science. Good learning also comes from relatable analogies and creative teaching methods. The flexibility of coding allows you to express this creativity through a program. Therefore, a computer simulation is a suitable method to teach a topic like graph algorithms.

From experience I have noticed that when looking for resources online to help learn a new concept there is a separation between the engaging resources, which are often videos using creative analogies, and the interactive tools used to model them, which are often boring, difficult to use, and stuck in the browser. This could be due to the relative difficulty of making a program compared to a video.
I want to bridge that gap by creating a graph algorithm simulator that uses a fun analogy of space to keep the user engaged. From my research, which I will refer to later, I believe that space is an engaging subject for many people interested in computer science and, even if they are not, it is still a fun and different way to explore the algorithms.

Graph algorithms are often a difficult topic for Computer Science students as they have not been exposed to these concepts before. I will make an educational tool that aims to create a fun way for anyone to learn about graph algorithms through space. I will do this in the form of an app using Swift and SwiftUI.

### Analysing Other Solutions

I have selected a few educational tools that aimed to create an interactive way to learn something. I tried out these tools and noted down the parts that I liked and disliked about them.

#### Solution 1: Graph Online [[https://graphonline.top/]]

<img width="80%"  alt="Graph Online" src="https://github.com/user-attachments/assets/e6c11fa0-cad3-4ecf-a0de-d02985504591" />

This is a basic graphing simulator I found online. 
It lets you create a graph manually, to do this there were a few tools: panning, dragging, adding nodes, adding edges and more.
The UI was quite tedious, especially when moving nodes and edges or creating a connection between two nodes, where there is a menu for selecting weights and direction and text which seemed unnecessary and time consuming.
<img width="40%" alt="image" src="https://github.com/user-attachments/assets/3ee0ca7a-41fe-48b0-8e66-f04a5cb3dc73" />

I thought it was frustrating to make a graph manually and that it would be unhelpful if this was your first time encountering a graph, because you may not know what graph to make.  
I found the options overwhelming and not focused on anything specific. I thought it was more suitable for people who were already familiar with the basics. I want my project to be accessible to people who do not even know what a graph is.
It did not show you the steps of the algorithm and just solved it, which I believe is important for understanding the algorithm.

#### Solution 2: TUM Shortest Path [[https://algorithms.discrete.ma.tum.de/spp/]]

<img width="80%" alt="TUM Shortest Path Algorithm" src="https://github.com/user-attachments/assets/b8c4fa64-73b3-4a83-9e5d-fe228275d1a5" />

The University of Munich made a graph algorithm visualisation and learning tool that I enjoyed.

I liked how there were different tabs which separated learning about the algorithm, creating the graph, and running the algorithm.
I liked the detailed descriptions of the steps and the visual colouring of the nodes and edges. I found this to be important for the algorithm simulation.
The graph creation was better than Graph Online and it started with a simple graph that you could extend, but it was still quite limiting.
My main complaint is that the program was not very engaging. The user had to read long paragraphs of text and, while the site was not ugly, it was not especially visually appealing.
It also did not have many of the simpler graph traversal algorithms (like BFS and DFS) and only shortest path.

#### Solution 3: PhET ([[https://phet.colorado.edu/]])

This is not a graphing simulator but it is an educational tool making learning interesting.
There are lots of different high quality simulations on this platform. 
PhET is a non-profit organisation founded by Carl Wieman. They have made their own framework for making simulations.

This is a math simulation that shows you the derivitive of a function. I thought it was useful visualisation and the controls were minimal and neccessary. 
<img width="919" height="509" alt="image" src="https://github.com/user-attachments/assets/b8d34bd6-4bcc-41c7-abbc-4c6d7ed96b32" />


The following simulation is about keplers laws, you can choose between the three (this screenshot is specifically for keplers 3rd law). This is a theme across most simulations but you can turn of relevant information. Lots of the tools to help learn were consistant across the simulations. This would mean that the user is familiar of how to use these tools before even starting the simulation.
<img alt="image" src="https://github.com/user-attachments/assets/cf1432e1-f6b3-4230-beee-052b980449d5" />

I loved using all the simulations and found them very useful however one thing I would have liked is if it added a creative twist to keep the user engaged. As this is a large platform with lots of similar simulations I understand that it is good to keep consistancy between them so I understand why they in some cases can look a bit boring. Since my program is only for one tool I can take advantage to this to make my project more unique to make the program more relatable to use.

#### Research Takeaways
The main things I took away is that I wanted to make the program approachable and relatable to the user, intuitive to use and not rely on any knowledge from the user, this would make it accessible to my whole audience which is anyone seeking to learn about graphing algorithms. 

### Stakeholders and Audience
My audience is anyone who is interested in learning about CS. This could be anyone from the age of 8 to 80 who is interested. This may seem like quite a broad audience due to the wide age range, but I can narrow it slightly to those who are more STEM focused.
Specifically I am targeting a younger audience, as they are the future generation, and I want to create interest while they are still deciding what they are going to do with their lives. It is also true that this age group spends lots of time on mobile applications, playing video games, or using computers, so this may appeal more to them. 

For my stakeholders I tried to find Computer Science students, who will likely study graph algorithms, doing A-Levels or GCSEs, as well as an adult, as my goal is to make this tool accessible to people not actively studying computer science.

First I gave a quick questionaire these stakeholders and I aim to use this data to better understand my audience and tailor the experience to be more engaging to them. 

I am going to refer back to these stakeholders once I have developed the app and allow them to test the feedback.

### Questionnaire for target market

| **Are you studying computer science, if so what course: **                                                                                                         | A level, GCSE, University, None or Other |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------- |
| Stakeholder 1: Rambo                                                                                                                                               | GCSE OCR computer Science                |
| Stakeholder 2: Rocco                                                                                                                                               | OCR comp-sci A-Le                        |
| Stakeholder 3 : Jim                                                                                                                                                | A Level Computer Sci                     |
| Stakeholder 4 : Jon                                     I am not currently studying computer science but finished a degree in comp-sci and maths a while back e, I |                                          |
From this It seems like my stakeholders will or already have encountered graphing algorithms which gives me confidence that I have selected a useful topic. 

| What devices do you use the most to learn:** | Options: Tablet, Phone, Desktop or other    |
| -------------------------------------------- | ------------------------------------------- |
| Stakeholder 1: Rambo                         | I got a ipad 9th gen which I use for school |
| Stakeholder 2: Rocco                         | I use a m2 macbook pro                      |
| Stakeholder 3 : Jim                          | I have a m2 macbook air                     |
| Stakeholder 4 : Jon                          | Mac Mini desktop for work                   |
I noticed all my stakeholders use apple devices. It is only a small sample but I do think targeting this audience is a good start.

| **How Long are you willing to spend to learn a new topic: ** | A time based measurement from 5 minutes to over a few days |
| ------------------------------------------------------------ | ---------------------------------------------------------- |
| Stakeholder 1: Rambo                                         | 40 minutes, just under a lesson                            |
| Stakeholder 2: Rocco                                         | 20 minutes for something small                             |
| Stakeholder 3 : Jim                                          | half a school period or half an hour                       |
| Stakeholder 4 : Jon                                          | half an hour                                               |
I wouldnt be suprised if it takes slightly longer (or shorter) than the stakeholders quoted times but my target is that this should be done in about half a school lesson. The tool will not be used the whole time so this would also provide time for other forms of research or creating trace tables while using the program.

| **Which of the following analogies do you find most relatable and interesting out of: ** | Options: Space, A Map (City or Rural) or other                           |
| ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| Stakeholder 1: Rambo                                                                     | I would love a space analogy                                             |
| Stakeholder 2: Rocco                                                                     | Space or City would be interesting                                       |
| Stakeholder 3 : Jim                                                                      | I like the idea of a rural geographical map but Space would also be cool |
| Stakeholder 4 : Jon                                                                      | The Industrial Map would be cool but also the Space                      |
Space seems to be the most popular

| **When using a tool to learn a new subject would you rather have :** | Options: more freedom or a more guided path or other                                                                                                               |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Stakeholder 1: Rambo                                                 | More control would be nice but it should be easy and intuitive to use                                                                                              |
| Stakeholder 2: Rocco                                                 | I would like both, maybe you could start with a more guided approach and then once you are more familiar you could be given more control                           |
| Stakeholder 3 : Jim                                                  | I would rather be guided at the start as I can find the options overwhelming                                                                                       |
| Stakeholder 4 : Jon                                                  | I think it is good to take it slow while learning so I think there should be the abiltiy to experement ontop of a overall guide to make sure we dont go off track. |

#### Client Questionnaire takeaways

I believe a space analogy will be the most suitable for the audience. This makes sense as my stakeholders are mostly into STEM, so they were already fascinated by space.

I think it is important to have at least a gentle introduction to the algorithms. From research into other tools I found the solutions that had an easy onboarding to be more useful, and my stakeholders backed this up.

I think that 30 minutes is a suitable length of time for the user to spend on the program. This is close to the length of a school lesson and I believe it will take slightly longer than they first expect so this will allow people more flexibility around time.

I beleve an app is the most accessible form for this audience, especially as the stakeholders seem to be using Apple devices. Apple makes it easy to develop for their platforms so It seems suitable.

**TODO:** improve this section by linking each takeaway directly to a design decision.
* State which questionnaire result led to each design choice.
* Explain how the preference for guidance affected onboarding, help screens, and step-by-step controls.
* Explain how device answers supported choosing Swift, SwiftUI, and Apple platforms.
* Explain why the space theme was chosen even though not every stakeholder chose it as their first preference.

### Using Computational Methods in the solution

#### Iteration
I am going to be using iteration throught the solution especcially when I need to repeat code on multiple intances like nodes and edges. Iteration is also used while running the graphing algorithms as a process is repeated until the graph is solved.

#### Recursion
Some algorithms such as depth first search can use recursion instead of iteration. I will decide on the implementation later but I wouldnt be suprised if I use recursion at some point in the solution.

#### Computational Methods

##### Backtracking
All graph algorithms use backtracking all the time either if they reach a dead-end or have to return to a previous node to visit the next one on their frontier.
##### Data mining
My program does not require any data mining as I am not storing data.
##### Heuristics
Algorithms like A* use heuristics to help guide the search. For graph algorithms a sensible heuristic is the absolute distance to the target node

##### Pipelining
I doubt I am going to be doing pipelining myself as I am going to use a high level language.

##### Performance modelling
I can look at the time complexities of the components of the solution to see if the calculations are realistic on the kind of hardware I am using. I can look at the time complexities of the graphing algorithms I am using.

#### Abstraction
As My graphing simulator is set in space, I need to consider which features to keep to make the simulation at least somewhat accurate. This is a graphing simulator not an ultra-realistic space simulation so I am able to remove things without making the program useless to the user.
I will abstract lots of details of space and simplify it to just a graph with a few aesthetic objects in the background for visual appeal.
I have looked at many aspects of space and noticed that there are many extra ideas that seem unnecessary and will overcomplicate the program. For example, adding planet Orbits would mean the nodes on the graph would have to move around. This not only complicates the development of the game but also adds extra complexities the user has to manage which would be frustrating, for example orbits would mean that the shortest path would be constantly changing. This would confuse the user which is a problem for an introduction to the subject.
Even though this may be unrealistic, my planets are just going to be floating in space scattered randomly on a 2D plane.

In terms of the graph simulation there is more abstraction going on. There are lots of aditional features such as extra algorithms I could add, other variables I can show and other UI elements.
I want to keep the program minimal showing only neccessary features and information to avoid confusing the user

#### Other Computational Thinking
##### Thinking Ahead
In each of the subcomponents of my game I am going to decide what are the inputs and outputs of these components. Reusing components will make it easier to develop aswell as making it more conistant.

##### Thinking Procedurally
I am going to break the game down into sub-systems to make it easier to write. When developing I will work on each component individually.
I will use a top down design when designing the architecture.

##### Thinking Logically
My simulator is going to be event driven so will do things in a logical order step by step.
I have to write lots of algorithms of varying complexity.

##### Thinking Concurrently
Lots of parts of my program will hapen at the same time. The ship will need to move, the galaxy will need to be generated, the paths will need to be found. This will mean that I need to do things asynchronously. There will be lots of objects in the game running functions continuously. This means that there will be multiple threads running at once which should be handled by the engine I use.

### Choosing a Framework

| **Platform**                                | **Description**                                                                                                                                                                                     | **Pros**                                                                                                                                                                                                                                       | **Cons**                                                                                                                                                                                                                                                                                                                          |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Unity](https://unity.com/)/Unreal          | Game engines will provide me with<br><br>Some examples of game engines I could use are Godot, Unity and Unreal Engine.                                                                              | I could make the program 3D however my game<br><br>Lots of lower-level UI interactions, e.g. panning, can be managed by the engine.<br><br>Lots of functionality is pre-baked into the engine meaning I will not have to code these elements.  | A game engine like this can be overly complex for my program , they are designed for video games involving more complex graphics. <br><br>I will have less control over the program if it is using pre-made functions which means I don't write as many algorithms. For a unique project like graphing I would want more control. |
| [Godot](https://godotengine.org/)           | Godot is a lightweight Game engine used for both 2D and 3D games                                                                                                                                    | Very lightweight and simple to use.<br><br>I can write in GDScript which is a simple language similar of python but can still be statically typed for efficiency.<br><br>I can easily export to many different platforms including ios devices | Like Unity, this is probably overkill<br><br>Too many functions provided in the framework so less algorithms to write                                                                                                                                                                                                             |
| [Swift](https://www.swift.org/) / SpriteKit | Swift is Apple's programming language and SpriteKit is a simple graphics API I could use with it to make my game. SpriteKit is still feature rich and powerful with its node system and SKActions. | I could make my app work on all Apple devices such as tablets and phones which is more convenient for my target audience.<br><br>It will be more efficient as Swift is statically typed, meaning it will be more optimised by the compiler    | The game will not be playable on other platforms like Android or Windows as it will be exclusively iOS.                                                                                                                                                                                                                              |
| [Pygame](https://www.pygame.org/)<br>       | Pygame is a simple 2D graphics library that uses python.                                                                                                                                            | I can write the project in Python which has easy syntax and is quite lightweight.                                                                                                                                                              | It is very basic so I will have to program all user interface components from scratch                                                                                                                                                                                                                                             |

#### Choice

The main three contenders are Swift / SpriteKit, Pygame and Godot.

After considering the benefits and drawbacks of each framework I have decided to use Swift for my project. I will specifically be using SpriteKit for the graphics and SwiftUI for the controls and User Interface. I like the simplicity of this as it means I have more control over my game. Another main factor in my decision means I can program it in Swift which is a strongly typed language meaning great efficiency compared to something like using python with Pygame which was a close second choice. I prefer this over a game engine which would require me to code in C# or C++ which are more complex.

However this will mean that the app can only be played on Apple devices, this could be a good start as they are popular with my audience. I found it is also quite difficult to have an Android version as I would need to rewrite it due to the specific frameworks I have selected. It may be more accessible if I make a Web App but Swift does not allow this.

To develop I am going to be using swift Playgrounds.
This is a simple environment that should make it fast and easy to develop in.
I may consider moving it to XCode later if neccessary but to start Swift Playrounds is Sufficent.

### System Requirements

#### Software

| **Requirement**                        | Description                                                                                                                                  | **Justification**                                                                                                                                |
| -------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| Runs macOS, iOS, iPadOS, VisionOS      | As I am using Swift/SwiftUI it will have to run an apple operating system.                                                                   | Swift, SwiftUI and SpriteKit only works on these operating systems                                                                               |
| macOS Sonoma 14.5 or iOS 17.5 or later | I cannot support all versions of the OS so I need to decide how far back I can go                                                            | For iOS/macOS it is recommended that you support the last version and two preceding versions. Apple devices tend to be well within the last two OS versions |
| Mac Catalyst 17.5                      | This is only related to macOS but Mac Catalyst makes a version of my iPad app that works on Mac. Mac Catalyst 17.5 corresponds to macOS 14.5 | I am developing for iOS so I need to be able to convert it to a version that can run on Mac                                                      |
|                                        |                                                                                                                                              |                                                                                                                                                  |
#### Hardware

| **Requirement**               | Description                                                                                                                                                                                                                                                         | **Justification**                                                                                   |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| Computer Mouse or touchscreen | The device they use must be a touchscreen, or have a screen and mouse or trackpad or some mechanism to view and select elements                                                                                                                                     | Used for selecting objects and playing the game                                                     |
| Apple Device                  | It must be an apple device such as an iPad, Mac or iPhone                                                                                                                                                                                                           | The device needs to run a required operating system                                                 |
| Screen Aspect Ratio/Size      | I will not be too strict about the aspect ratio but it should not be too wide or too small. I am going to test it using an iPad and a Mac which have 3:2 and 16:10 aspect ratios so it will be designed around that as well as 2:3 for portrait iPads.              | Most users will be running this on iPads or Macs so optimising for these aspect ratios is important |
| 8GB of RAM                    | At least 8gb of RAM will be required. For Intel Macs 16gb would be preffered as apple silicon macs are more efficient in managing RAM. 4gb is also okay on ipad as it is well optimised and my program itself is not storing much data so It will not use much RAM. | I need to be able to run swift playgrounds which is reccomened to have at least 8gb.                |
|                               |                                                                                                                                                                                                                                                                     |                                                                                                     |

### Features of Proposed solution

| Feature                                                   | Explanation                                                                                                               | Reason                                                                                                                                                                             |
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| An app with navigatable screen                            | As well as the simulation I will need an app with navigation                                                              | The user should be able to move between all the sections of the app.                                                                                                               |
| Generating the graph                                      | The program should automatically generate a  simple graph with few user inputs this will mean that the user does not need | I need a graph to perform the search algorithms on                                                                                                                                 |
| Visualising the Graph                                     | There should be a user interface that allows the user to interact with the graph                                          | In order to understand the graph it is important to see the graph. Graph algorithms can still be done without seeing the nodes and edges but for a learning tool this is important |
| Performing Search Algorithms on Graph<br>                 | This may seem obvious but I need to be able to run the algorithms on the graph                                            | To simulate the algorithms I must be able to programmatically solve them                                                                                                           |
| Step By Step through the Graph                            | I need to be able to run each algorithm slowly to explain the algorithm                                                   | The user should be able to pause the algorithm and in theory make a trace table of the key variables of the algorithm.                                                             |
| Explanations and Visualisation of graph being operated on | I will have text boxes explaining what is happening at each step                                                          | I need to also explain what is happening at each step.                                                                                                                             |
### Limitations of Solution

| Limitation                         | Explanation                                                                                                                                         | Justification                                                                                                                                                                                                                  |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Simplicity                         | The program will have an easy to use simple interface                                                                                                | As I am targeting the simulator at introducing graphs it is naturally going to be less feature rich and the user will not have full control over the program.                               |
| Less Control over Graph Generation | As I am quickly generating the graph with minimal inputs it means the user will not be able to have the control to create the exact graph they want | Giving more control to the user will make it more complicated to use. It is not targeted at experienced people simulating lots of graphs to test efficiency or unusual cases on algorithms. It is more of a learning tool. |
| No Saved Data                      | I have not included the ability to store app data.                                                                                                  | I could not find enough features and reasons to store user data. There are no major practical benefits and the user likely prefers not to be tracked.                                                                            |

### Other Requirements
#### Usability Requirements
##### Menu with Navigation across screens
My app should allow the user to navigate between different screens. This should be intuitive and the user should not get lost.
##### Clean Design
I will make the appearance of the app minimal. 
I will have clear controls with suitable labels explaining what they do.
##### Performance
The simulation should be able to run on lower end older hardware. This will make it more accessible to more people.
The program should not abruptly crash. It should not be too processor intensive so it should run with decent frame rates, not drain the device's battery life, and boot up quickly. I do not want performance to be an issue as it is important that the user enjoys using the program.

##### Bugs/Exploits
There should not be any Major bugs or Exploits in the program.  
My focus will be on minimising bugs that are accidentally triggered that cause unexpected behaviour as this would confuse/mislead the user. 

#### Information/Teaching
As this is an educational tool everything needs to be factually correct.
After and during development I will run tests involving trace tables to check the algorithms are doing the correct steps. When writing factual information I will refer to credible sources
I will also make small quality of life improvements that make the explanations more true to what is actually happening.

**TODO:** explain how I will check that the algorithm facts and teaching points are correct.
* Cross-check the algorithm explanations against the OCR A Level specification and at least one other reliable source.
* Verify that the simulator behaviour matches the textbook rules for BFS, DFS, Dijkstra, and A*.
* Use worked examples on paper and compare them with the simulator step by step.
* Ask at least one stakeholder studying Computer Science to confirm that the explanations are understandable and accurate.

### Success Criteria

**TODO:** turn this table into clear measurable goals. Give every success criterion an ID, a full description, a reason, and a measurable test.
* Have at least one functional criterion for each of the 6 subcomponents.
* Add a column showing how each criterion will be tested and what evidence will be used.
* Replace vague wording like "good", "clear", or "enjoyable" with measurable wording such as "user can complete task X" or "algorithm returns the correct path on test graph Y".
* Remove every blank row and make sure each criterion can later be judged as met, partially met, or not met.

Maybe Match Functional Requirements to Design and Development Sprints


| ID                                  | **Criteria**                                   | **Description**                                                                                                                                                      | **Reason**                                                                                                                                                                                                                                                                                                | **Analysis Link** |
| ----------------------------------- | ---------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------- |
| **Functional**                      |                                                |                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                           |                   |
| FR1                                 | Generate A graph                               | The program should generate a random graph for the user with a few simple inputs. They should be ranges of shapes and sizes.                                         | These graphs should highlight the main features, benefits and drawbacks of each algorithm.                                                                                                                                                                                                                | ---               |
| FR2                                 | Teach what a graph algorithm is and their uses | A page providing text/image based description about what graphing algorithms are and examples of their uses                                                          | The user needs a clear foundation before exploring specific algorithms, the user should understand real-world uses of graph and graph traversal algorithms (for example, maps and routing)                                                                                                                | --                |
| FR3                                 | Simulate all Graph Algorithms                  | It should be able to simulate all the graphing algorithms in the A Level specification. (These include: BFS, DFS, Dijkstra and A*)                                   | A Level is often the first time students come across graphs so I think it is important to include at a minimum all the content these students will require. This allows demonstration that different algorithms have different strengths and weaknesses, and that performance depends on graph structure. |                   |
| FR4                                 | Step by step                                   | The user should be able to run through each step of the algorithm individually on command. This would mean they could create a trace table of the steps.             | To truly understand the algorithm the user must be able to know what is happening in each iteration. For Comp-Sci courses you often need to make trace tables for the algorithm                                                                                                                           |                   |
| FR5                                 | Visualisation                                  | The Graph should also provide a visualisation of what is happening on the graph algorithm while it is being searched. This means the useage of color and animations. | It is essential that the user can visualise the algorithm or they might as well be just reading text.                                                                                                                                                                                                     |                   |
| FR6                                 |                                                |                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                           |                   |
| **Performance**                     |                                                |                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                           |                   |
| PR1                                 | Abrupt Crashes                                 | The program should not crash due to runtime errors such as invalid data types (eg if strings are assigned to floats).                                                | If the app crashes the user will lose their progress which will mean they will have to restart. This could prevent them from finishing the lesson.                                                                                                                                                        |                   |
| PR2                                 | Decently high Frame Rates and minimal Lag      | It should run at 60fps and have little to no lag. To do this I will need to make sure the program is not too computationally expensive especially per frame.         | The user should not be getting frustrated by the program while running so it should run smoothly.                                                                                                                                                                                                         |                   |
| PR3                                 | No Misleading bugs or logic errors             | There should be no major bugs in the program meaning things work not as intended.                                                                                    | It is essential not to misslead the user as they are learning something new and are not able to know if something is wrong.                                                                                                                                                                               |                   |
| PR4                                 |                                                |                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                           |                   |
| **Usability**                       |                                                |                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                           |                   |
| UR1                                 | Adaptive UI                                    | The program's user interface should resize and scale to fit the users' device screens                                                                                | The program should run equally well on all iOS devices to make it accessible.                                                                                                                                                                                                                             |                   |
| UR2                                 | Theme                                          | The overall program's theme should stick to the chosen analogy of space                                                                                              | If users do not engaged by the program they won't use it long enough to learn                                                                                                                                                                                                                             |                   |
| UR3                                 | Navigatable App                                | As my app will have multiple pages, they should all be straightforward to navigate between                                                                           | The user should not have any trouble finding the pages and parts of the program they are looking for they should spend their time looking at the content                                                                                                                                                  |                   |
| UR4 **maybe belongs in Functional** | Explanations during graph simulations          | Aswell as slowly stepping through the graph algorithm steps the user should see explanations of what is happening.                                                   | Just seeing variables and coloured nodes may be confusing                                                                                                                                                                                                                                                 |                   |
|                                     |                                                |                                                                                                                                                                      |                                                                                                                                                                                                                                                                                                           |                   |


## Design

### Problem Decomposition
I have broken down my problem into the following subcomponents.
When developing I will do sprints for each of these components.

#### Hierarchy Diagram 
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
Here is an in depth summary of the inputs, outputs, preconditions with suitable validation and error handling for the main components of my solution
 
#### Subcomponent One : Graph generation
##### Description
Generates an undirected graph that the algorithms can operate on and the spaceship can move between. Each node will be a planet in the graph which knows its neighbours. I will start more simply by using an unweighted graph, or all the weights equal to one, and then add weights later for necessary algorithms. To keep with the analogy I will call the weights fuel needed.
This will also include choosing a start planet and an end planet. The graph does not necessarily have to be solvable.

**TODO:** make the inputs, outputs, and validation equally clear for every subcomponent, using the same format and data-type detail throughout this section.
* For each subcomponent, list the main data items with their types.
* State what valid input looks like and what invalid input is rejected.
* Make sure each output is specific enough to be tested later.
* Link each subcomponent back to the success criteria it supports.
##### Inputs

| Input                     | Type                                                                                                                                                       |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Number of Planets         | This is an integer which specifies the number of planets in the graph. I will do the necessary validation to make sure this number is in the correct range |
| Maximum Connection Length | This will be a integer which will be the maximum distance two nodes can be connected by                                                                    |

##### Outputs
A Graph Object with connected nodes or planets. The nodes themselves should also be objects. The graph object should control the nodes in the graph.
##### Validation
Before using the inputs I need to check they are reasonable.
There must be at least two planets and up to a sensible limit roughly around 10 but this will be finalised in development (as then I can test and visualise to choose the suitable count). The start and end planets should not be the same planet as the graph would already be solved and the graph should not be within less than 3 steps of completion so runs dont end instantly. Planets should not be too close to each other or go on top of each other as this will confuse the user.

#### Subcomponent Two : Graph Rendering
##### Description
Now that I have a graph which are nodes that store their positions and know their neighbours I need a way to visualise them
The first part of this is to add circles to the correct coordinates and lines showing the connections for edges.
The graph also needs to give an interface that allows external classes to access the colours of nodes and edges as well as other effects and information about the node. This will mean that when writing the algorithm it will be easy to change the visuals for the user.
##### Inputs
A graph Datastructure that stores nodes and edges
##### Outputs
A visual display of the graph that appears like planets in a galaxy with lines showing the edges. All text labels should be readable.
This graph should be able to change using code so it can also be used as a tool to display what is happening during the graph traversal
##### Validation
The nodes and edges in the graph are in valid locations and are linked correctly. The graph rendering will assume that the graph is valid and will render even if nodes are in incorrect locations.

#### Subcomponent Three : Algorithm Solving
##### Description
I will make a simple graph traversal algorithm such as Breadth First Search and Depth First Search to traverse the graph and find a path from the start to the finish.
It will record necessary data such as the queue or stack of nodes to visit next as well as the visited nodes.
I plan to then implement the rest of the algorithms in the A Level specification including Dijkstra and A* using a heuristic of distance to the target.
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
A graph that provides an interface for changing visuals, UI elements
The Algorithm State
##### Outputs
A visual display of the state of the algorithm
##### Validation
This component will be built on top of the graph which has lots of validataion to check it is correctly genarated. Therefore I can trust the inputs and operate on them without having to revalidate.

#### Subcomponent Six : User Interface
##### Description
This component is not to do with the main program but is about the app as a whole. I want an easily navigable UI that will show all the different screens and should be intuitive to use.
This is not just putting the screens together but also covers the creation of these UI elements. I am going to use reusable components which will save time in development, increase performance and create a consistent user interface.
##### Inputs
This kind of input is passed from the user not other components of the program. Examples are just UI elements such as:
* Buttons that the user can press.
* Menus the user can select.

##### Outputs
Affect program when buttons are pressed or items are selected by calling functions or updating variables.
Give a visual interface of the program
##### Validation
The views should only allow for valid inputs such as selecting objects that exist or numbers in a correct range. 

### Revisiting Requirements
Now that I have a slightly better understanding of the program I am going to revisit and make some adjustments to the requirements. I may rename or match them to the subcomponents of my program to make them easier to track

| ID                                  | **Criteria**                                   | **Description**                                                                                                                                                      |
| ----------------------------------- | ---------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Functional**                      |                                                |                                                                                                                                                                      |
| FR1                                 | Generate A graph                               | The program should generate a random graph for the user with a few simple inputs. They should be ranges of shapes and sizes.                                         |
| FR2                                 | Teach what a graph algorithm is and their uses | A page providing text/image based description about what graphing algorithms are and examples of their uses                                                          |
| FR3                                 | Simulate all Graph Algorithms                  | It should be able to simulate all the graphing algorithms in the A Level specification. (These include: BFS, DFS, Dijkstra and A*)                                   |
| FR4                                 | Step by step                                   | The user should be able to run through each step of the algorithm individually on command. This would mean they could create a trace table of the steps.             |
| FR5                                 | Visualisation                                  | The Graph should also provide a visualisation of what is happening on the graph algorithm while it is being searched. This means the useage of color and animations. |
| FR6                                 |                                                |                                                                                                                                                                      |
| **Performance**                     |                                                |                                                                                                                                                                      |
| PR1                                 | Abrupt Crashes                                 | The program should not crash due to runtime errors such as invalid data types (eg if strings are assigned to floats).                                                |
| PR2                                 | Decently high Frame Rates and minimal Lag      | It should run at 60fps and have little to no lag. To do this I will need to make sure the program is not too computationally expensive especially per frame.         |
| PR3                                 | No Misleading bugs or logic errors             | There should be no major bugs in the program meaning things work not as intended.                                                                                    |
| PR4                                 |                                                |                                                                                                                                                                      |
| **Usability**                       |                                                |                                                                                                                                                                      |
| UR1                                 | Adaptive UI                                    | The program's user interface should resize and scale to fit the users' device screens                                                                                |
| UR2                                 | Theme                                          | The overall program's theme should stick to the chosen analogy of space                                                                                              |
| UR3                                 | Navigatable App                                | As my app will have multiple pages, they should all be straightforward to navigate between                                                                           |
| UR4 **maybe belongs in Functional** | Explanations during graph simulations          | Aswell as slowly stepping through the graph algorithm steps the user should see explanations of what is happening.                                                   |
### System Overview / Architecture

#### Model View Controller
I will use the Model View Controller design pattern to separate the components of my app.
This allows me to separate the functionality into three main components.

I will explain the three components at a lower level next but at a high level:
* The Mode is a collection of object that encapsulates the data of the app
* The View is the user interface 
* The Controller ties the Model and the View together

**TODO:** explain this architecture clearly using my actual classes and screens. Include a screenshot of the directory structure of the project
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

For this I will need to use a graphics library. I am going to be using two, SpriteKit and SwiftUI.
SpriteKit will be used for the areas where I need more control such as drawing graphs and custom animations.
SwiftUI is going to be used for the overall adaptive app UI and navigation between screens.
##### SpriteKit 
```SpriteKit is a general-purpose framework for drawing shapes, particles, text, images, and video in two dimensions.```
SpriteKit is imperative so I have control over exactly what is being rendered. It has a 2D coordinate system and allows me to place nodes in precise positions and draw shapes. This is important as I have control so I can draw graphs exactly how I want.
It is a game engine that uses Apple's Metal framework which will mean high performance rendering.

##### SwiftUI
```SwiftUI is a declarative framework for building user interfaces for iOS, iPadOS, watchOS, tvOS, visionOS and macOS, developed by Apple Inc```
Declarative programming languages are higher level than imperative so they use abstraction and I do not need to worry about the low-level details of how the UI is created.
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


### Implementation of Subcomponents

#### Subcomponent One : Graph generation : Model
As this is not to do with the graphics I do not need to use any graphics libraries however It will use coordinates. This will be provided to the graph rendering component which will use SpriteKit to render it.

I decided that the graphs I use are going to be undirected, meaning there are no one-way relationships between nodes. I think this is simpler for someone new to graphs. The graphs are going to be weighted, however, as algorithms like Dijkstra and A* are more suitable for weighted graphs. My graphs are not required to be fully connected, so it is possible that the graphs are unsolvable. I think this is important because it exposes the user to the case where an algorithm finishes without finding a path to the target node.

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
There should be a text box on the lines which will be used to represent the weight. This should also be readable and the graph rendering is not responsible for what is in the text box, it just needs to be able to be changed.

#### Subcomponent Three : Algorithm Solving : Model
For the search algorithms I realised they are not that different from each other. They all have a list of nodes to visit and the nodes they have visited. The only difference is the order they are visited in.

##### General Search
I will implement a general search class that the other algorithms will inherit from this will have the core functionality that all the search algorithms require.
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
When researching the algorithms I found there was one more algorithm that would complete the program. Although Greedy (BFS) is not in the A-Level spec it has the same core idea of the others as it uses a priority queue which only has

Here is a summary table of the algorithms and the features they use:

#### Subcomponent Four : Algorithm Control : Model

![GraphControl](https://github.com/user-attachments/assets/ab664823-7ee0-4fb6-8102-55429821660a)

##### Solving Step By Step
When writing these algorithms normally and how it is described previously in algorithm solving is that they use iteration or recursion. This means that local variables are created in a loops or functions and they are overidden on each iteration and do not persist in memory. If I want to run the algorithm step by step so the user can view it the options are:

| **Method**                                                                                                                                               | **Benefit**                                                                                                                                                                      | **Drawback**                                                                                                    |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Pausing the execution in the loop waiting for user input before continuing                                                                               | Relatively easy to implement                                                                                                                                                     | The algorithm code would need to be run in a separate thread so it does not pause execution of the main program. |
| Storing state of the variables externally so they persist in memory so I can jump to certain steps without having to rerun the algorithm from the start. | I need to make a data structure to store the state of the algorithm and write other functionality to use this data structure to step forward and back or to steps in the algorithm | I am storing additional data for every step in the algorithm.                                                    |
|                                                                                                                                                          |                                                                                                                                                                                  |                                                                                                                 |

I am going to go with the 2nd choice as I believe the ability to undo, redo, and move to certain steps is important.

One thing worth mentioning about this decision is that running these search algorithms is not computationally expensive, especially as I would do it on input, so running it every time on user input is not actually a major problem. Running it once compared to 10 times will have almost zero effect on performance. It is likely the processes rendering the graphics are more expensive than these algorithms. Although this is also likely not expensive as I am keeping it simple to allow it to run on low-end or old hardware.

**TODO:** replace this note with a clear explanation of why fixed test graphs were needed, how they were introduced, and how they supported step-by-step verification during development.

**TODO:** explain the design decision for what happens when graph-generation parameters change, for example whether the graph should regenerate immediately or only when the user presses a button, and justify why that is better for usability.
* State the final behaviour in the app.
* Explain how this avoids confusing the user or unexpectedly losing a graph they were studying.
* Refer to any stakeholder feedback or testing that influenced this decision.

##### Example of Step by step running
When testing running the algorithm step by step I wanted to make sure it was done correctly.
I solved a simple graph I made on paper and then i made it in the simulation.
This is an example with BFS about how i want the algorithms to be visualised with the stacks on the side

![Algorithms](https://github.com/user-attachments/assets/bd547fbb-1660-4bb2-b38b-7d9e4bf8b2e4)
![Frontier](https://github.com/user-attachments/assets/fb01a530-c8b6-4520-8383-fe3cdbd789eb)

##### Undo/Redo Stack
One of my requirements is that the user should be able to replay the steps of the algorithm
Another requirement is that my program is efficient to optimise performance on less powerful devices.
To implement this I am going to use a stack that stores the state.

I will create a data structure that saves the state of the algorithm
When moving forwards a step I will push the important data of the algorithm's state onto a stack.
When Undoing a step I will pop the top of the stack and 
However for this I need to reacalculate the steps when going forwards but not backwards.
To fix this I could make another stack that stores the next instructions
together these two stacks and current state will store all the possible states of the algorithm.
When moving forwards I will pop the current state from the forwards stack and when going backwards I will push the current state on the forwards stack.

This will mean I calculate all the possible states at the start and the algorithms dont need to be run every step.

#### Subcomponent Five : Algorithm Visualisation : View
This component is very important because it displays the progress of the algorithm to the user. This needs to be done well as it is the main purpose of the program.

![GraphSolving](https://github.com/user-attachments/assets/9a66c195-65f1-4da8-ab85-12e208d0c1b5)


##### Spaceship
The spaceship Is going to be the object that traverses the graph. It will place emphasis on the current node being visited.
I am going to use SpriteKits SKSpriteNode which allows me to put 2D textures on a object.
I am going to use AI generated 2D sprites as this will not be time consuming and will be easy to implement while also providing an appealing aesthetic.

##### Frontier and Explored Lists
As well as UI elements it is important to show text-based information. I want to show the lists of nodes that have been visited and are next to be visited.

The list of nodes to visit is the frontier. This is the queue/stack/priority queue that the algorithm uses to select the next node to visit.
The list of visited node is the visited. This is a list of the nodes that have already been visited. I could add information next to these about the weight to get to it so far or the node it came from for more information.
##### Explanation Boxes
To Tie all the Visualisation together I am going to have a text box.
This will explain what is happening in each of the steps of the algorithm. It will say what the algorithm is actually doing while it is happening to help the user understand.
I will pre-make a selection of strings that allow me to insert specific information in the correct location, such as the node name.
I will also give the ability for the user to swap between Space Explanations (which use space vocab to increase engagement such as: Galaxy, Planet, Path) and a more Technically accurite Graph Explanations (which uses words like graph, node, edge).

##### Planet and Path Colouring
As the user Is looking at the graph for most of their time using the program the graph should also show the state of the algorithm.
These will be the same colours as I coloured the lists for the frontier and the visited. I am going to highlight different nodes and color code them based off their significance.
I am going to do this using the graph's interface i will create

#### Subcomponent Six : User Interface : View
All of the User Interface is going to be made with SwiftUI.
##### Adaptability
The user interface needs to be able to adapt to different screen sizes. Although iPads are all the same 4:3 aspect ratio they can be rotated to portrait and my app still needs to work. It should also work on Macs, iPhones and headsets. If it is windowed the size should adapt similarly to a web page.
I therefore should make sure my app can adjust the size and locations of UI elements to fit and not obscure the screen.
##### Validation of input data

##### Navigation
As I am going to allow the user to navigate around different Views.
I am going to use SwiftUI's Navigation stack for this.
As I want to have control and stylise my app I am not going to be using Apple's built in components and will heavily customise them.

These screens should include:
* Menu (for selection)
* Settings (changing preferences for user such as ship speed, space/graph descriptions, planet names, I will use a swiftUI element called a sheet which will provide a semi-transparent popup overlay to allow the user to see the content while changing the settings)
* How to use (explains how to use the program)
* About Graphs/Algorithms (Teaches the user about graphs using a text page (not the simulation)
* Graph/Galaxy Builder (Allows the user to create/select/generate graph)
* Simulation (Where the program performs the Graph Traversal Algorithms on the generated graph

Here is a short graph of how the user can navigate between these screens.

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
This is the Screen that the user will start with. The user should be able to navigate to all the other screens from here.
![StartScreen](https://github.com/user-attachments/assets/da99b1e1-7ab1-4a8d-8e15-9ca406712a2f)
##### About Graphs/Algorithms
This is going to be a scrollable text screen that will tell the user about the algorithms.
It is going to also contain images and tables to compare the algorithms as they are not too different from one another.

![AboutScreen](https://github.com/user-attachments/assets/d716bdb5-385f-4f5d-aef6-e2467646e336)
I will add more text  and information describing each algorithm individually
##### How to use screen
Like the about screen this is going to be a scrollable screen with not much interaction.
The objectives of this screen are:
* Explain the meaning of the highlight colours on the nodes.
* Show the use what all the buttons on the program do to control the algorithm.
* Explain what each of the lists is representing in relation to the algorithm, for example whether it is a stack or queue, showing how I will link the colours.
* Show the user how to select the different algorithms.

##### Settings View
This is not so much going to be a separate screen but will be placed on top of the current view. This will always be the galaxy builder or simulation as it is only accessible via these pages.
I am going to use a swiftUI element called a sheet which allows me to overlay the settings view on top of the current view, this will allow me to keep the background visible while changing settings to keep the context of the graph.
![SettingsScreen](https://github.com/user-attachments/assets/0ba99730-a5ca-43fb-a628-675401961496)
This is what the sheet will look like. I will put the controls inside the sheet.
##### Graph Generation
This will contain the SpriteKit View. Here the nodes will not be colored exluding coloring indicating the start and end. This is because the algorithm isnt currently being run.
The swiftUI controls will mostly be inputs such as buttons and sliders.
There will be the controls for generating the graph and choosing the search algorithm for example:
* Selecting the algorithm
* Regenerating Graph
* Changing the number of planets in the graph
* Changing The maximum node connection


##### Simulation
This will contain the SpriteKit View which will include a ship and necessary highlight colours depending on the state of the algorithm.

The SwiftUI controls will be mostly output based:
* List of Frontier nodes and visited nodes
* Explanation Boxes explaining the steps of the algorithms.

### Further Post Development Test Data

**TODO:** add tests done after finishing the program, including function, robustness, and usability tests.
* Include invalid input tests such as too many planets, 1 planet, 0 planets, impossible paths, or extreme values.
* Include at least one usability test and one robustness test.
* Annotate the evidence with what was expected, what happened, and whether the test passed.
* If this remains a planning section, rename it clearly as planned post-development testing. If the testing has been completed, move the final evidence into the later testing section.

## Development

### Source Control, Project Tracking and Tools

Throughout development I used source control with Git and GitHub. This was useful because it allowed me to save versions of the project over time, experiment with changes more safely, and go back to an earlier version if I introduced a bug. It also helped me keep a clearer record of how the project developed, which is useful when reviewing progress across multiple stages. I made over 300 commits to this project, although about half of these were to this file, the WRITEUP.md file.

<img  alt="image" src="https://github.com/user-attachments/assets/d22bb71f-91e8-48b0-942a-282ccc3b1125" />

Git was especially useful for a project like this because I was changing several parts of the program at once, such as the graph generation, algorithm logic, and user interface. Source control reduced the risk of losing work and made it easier to compare new code with older versions when I was debugging.

I also tried to use GitHub Issues to track tasks and bugs during development. This was helpful when I remembered to use it, because it gave me a simple way to record problems and planned improvements in one place. However, I was not very consistent in using it, so it was only a partial record of the work rather than a complete project log. The issues page is here: [GitHub Issues](https://github.com/NoahMSchool/SwiftPlanets/issues).

<img  alt="image" src="https://github.com/user-attachments/assets/29c8c4d2-4f8e-40d2-b66e-061032ac5594" />

I used GitHub desktop on my Mac as the source control client. I used Obsidian as a markdown editor for the writeup. I used Mermaid.js for the charts in this write up as you can describe different kinds of diagrams using Markdown. Markdown was a good choice because I think the diagrams are clear and they work on the GitHub markdown pages.

The IDE that I used was Swift Playgrounds, which is slightly easier to use than XCode for iOS Projects. I referred heavily to the Swift Documentation. Links to all of these tools can be found at the end of this document.

### Stage One/Two : Random Galaxy Generation/Rendering
I developed the galaxy generation and rendering in parallel because it meant I could immediately visualise what was being done, which was important for checking whether I was doing it correctly.
#### Generation

My first task was to randomly generate a graph or galaxy. This would consist of nodes or planets and edges which connect the paths.

* My objective was that each galaxy should feel random and different.
* You should have some control over the graph structure without having to micromanage nodes
* Select the number of nodes in the graph and the lengths of paths
* The graph should look visually appealing and look like a galaxy

I started by using a nested `for` loop to create a square grid of possible positions for a planet and I added these to an array. I then needed to select a fixed number of positions from this list. To do this I randomised the order of the options array and selected the first `planetCount` positions.

I then added a small random offset to each selected position so the planets did not sit in a perfectly regular grid. This kept a minimum spacing between planets while still making the galaxy feel more natural. After generating the planets, the next stage was to calculate which planets should be connected based on distance and then remove bad-looking edge intersections. Later in development, after stakeholder feedback, I also introduced subclasses for fixed test graphs so I could swap between random generation and known graphs for testing.

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
After creating the random galaxy generator I realised there were lots of intersections of edges in the graph. Some edges went through planets. This looked ugly and could be confusing to the user.

In order to delete edges I needed to decide which edges to remove.
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

Here is a diagram of the checklines on a Planet Node

**TODO:** explain what the bug was in simple terms and how I found it. 

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

**TODO:** add the line intersection code and explain why this method works.

#### Procedural Planet appearance

Each planet has a border which is used to indicate the information about the planet.
Inside the border there is a procedurally generated planet which is not conveying any information.

The following code is a static function on the PlanetNode class that will return a SpriteKit Node which is the planetNode, it takes in a base colour and an accent colour and applies it to the fillColor and strokeColor which are attributes of all SKShapeNodes. (SKShapeNodes are just spritekit nodes that can be given a shape which it rendrs as, a circle is suitbale for a planet.)
SKShapeNodes has a built in glow parameter which added a subtle effect.
I made this a static function as there is no functionallity related to a specific 

```swift 
static func generatePlanet(baseColor: UIColor, accentColor: UIColor, size: CGFloat) -> SKNode {
        let planetNode = SKNode() // makes the SKNode
        let planetBody = SKShapeNode(circleOfRadius: size)
        planetBody.fillColor = baseColor
        planetBody.strokeColor = accentColor
        planetBody.glowWidth = 1.0
        planetBody.zPosition = 4
        planetNode.addChild(planetBody)
        return planetNode
    }
```

#### Planet UI elements
Once the PlanetNode has been added the other UI elements are then added as a child of it
This code is run on the SpriteKit node to generate this
```swift 
//name of planet
self.planetNameLabel = TextBubbleNode(textString: planetName)
self.planetNameLabel.position = CGPoint(x: 0, y: 35)
//border which is used to highlight
self.border = SKShapeNode(circleOfRadius: borderRadius)        
self.border.lineWidth = 2
self.border.fillColor = .black
```
### Graph Edges or Paths

To do this I used a SpriteKit CGMutablePath.
I made a seperate draw helper file which provided me with a few functions with a simpler more relevant interface that I can use to create the connections for the spritekit graph. 
These currenlyfunctions include
* **drawline** which draws a line between two given positions
* **drawArrow** which uses drawline and places a arrowhead SKShape node. There was a bit more complexity here with rotation which I solved with a bit of trig.
* **drawlines** which takes in a list of lines and draws them all using drawLine. This was not only usefull for drawing lots of lines at the same time but also puts them all under a container node so these lines are in the same place.

This is the code for drawline. It takes in the two points and relevant parameters and creates a CGMutablePath Object.
```swift
func drawLine(from start: CGPoint, to end: CGPoint, lineWidth: CGFloat, color: UIColor) -> SKNode{
    let path = CGMutablePath()
    path.move(to: start)
    path.addLine(to: end)
    let line = SKShapeNode(path: path)
    line.zPosition = 0
    line.strokeColor = color
    return line    
}
```


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
At this stage I implemented the different graph search algorithms by building them all on top of the same `BaseSearch` class. The base search implemented some basic generic functionality that was overriden when neccesary This meant the shared logic for stepping forward, tracking the frontier, storing history, and reconstructing the final path only had to be written once. Each individual algorithm then only needed to override the small parts that changed its behaviour, such as how the frontier was read or how priorities were calculated.

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


Here is the table of the different search algorithms and how they differ, which helps to understand what functions need to be overridden for each.

| Feature                 | Breadth First | Depth First    | Greedy BFS     | Dijkstra       | A*                 |
| ----------------------- | ------------- | -------------- | -------------- | -------------- | ------------------ |
| Frontier Data Structure | Stack         | Priority Queue | Priority Queue | Priority Queue | Priority Queue     |
| Use Weights             | ---           | ---            | Y              | Y              | Y                  |
| Use Heuristic           | ---           | ---            | Y              | ---            | Y                  |
| Priority Function       | ---           | ---            | Heuristic      | Weight         | Heuristic + Weight |

#### Breadth First Search
Breadth First Search uses a queue to decide which is the next node to visit. 
This provides a broad search around the start node in general visiting closer nodes before further nodes

Breadth First Search did not need its own `getNextFrontier()` override because the default implementation in `BaseSearch` already behaves like a queue:

```swift
func getNextFrontier()->(neighbour: any Traversable, weight: Double){
    currentState.frontier.removeFirst()
}
```

#### Depth First Search
Depth First provides a deep search so it will search deeper unitl it reaches a dead end before backtracking.
I am using a pre order traversal so on a tree it will go root left right.

To turn the frontier into a stack instead of a queue, I overrode `getNextFrontier()` so it removes the most recently added node:

```swift
override func getNextFrontier()->(neighbour: any Traversable, weight: Double){
    currentState.frontier.removeLast()
}
```

I also overrode `getFrontier()` so the visualised frontier appears in the same order that the stack will process it:

```swift
override func getFrontier()->[any Traversable]
{
    super.getFrontier().reversed()
}
```
#### Greedy Best First Search 
This priority function only used the heuristic. In my random graphs, with some exceptions when the start and end are separated by a void without nodes, it often found the shortest path quickly as my weights were based on the distance to the node.

For Greedy Best First Search I overrode the class flags so the UI knows it uses both weights and a heuristic, and then set the priority queue to use only the heuristic:

```swift
override class func useHeuristic()->Bool{
    return true
}

override class func usesWeights()->Bool{
    return true
}

override func getQueuePriority(n : (neighbour : any Traversable, weight : Double), to: any Traversable) -> Double {
    return n.neighbour.heuristic(to: to)
}
```

#### Dijkstra

For the algorithms that uses weights I decided to show them on the edges. 
The priority function only uses the distance to the node

So for Dijkstra I overrode `usesWeights()` and `getQueuePriority()`:

```swift
override func getQueuePriority(n : (neighbour : any Traversable, weight : Double), to: any Traversable) -> Double {
    return getNewWeight(n: n)
}
```

#### A*

For A* the priority function was still extremely simple:
```swift
getNewWeight(n: n) + n.neighbour.heuristic(to: to)
```


#### Minor improvements to prior stages
I added the ability to show and hide text on the edges for only Dijkstra and A* to use edge weights. For algorithms that do not use the weights, the weight for all edges is 1.

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

At A high level to solve step by step I have a current state, a forward function and a backward function. 
I have a stack that stores the history of the algorithm with an object.
When going forwards I do the necessary steps which will 
Different to design I did not include a redo Stack that stored the future stages. The argument that it is less efficient I do not think is a problem as it is only being done on event and the calculations are actually not that big.

#### Undo Stack
I made an UNDO stack to store the history of the algorithm.
When I went forward in the algorithm I created an object that stored all the key variables of the algorithm state and pushed this object onto the stack. This is similar to how the contents of the registers are pushed onto a stack when there is an interrupt. I could then freely change the original variables for the next step without losing the data for the previous step.
This is the `AlgorithmState` object I created. It stores the simple data as well as dictionaries of all the nodes and the relevant data.
```swift
struct AlgorithmState{
    var current: (any Traversable) //current node
    var frontier : [(neighbour: any Traversable, weight: Double)] // a list of nodes at the frontier
    var explored : [any Traversable] // a list of the explored nodes at this step
    var cameFrom : [UUID: (any Traversable)?] = [:] // a dictionary of where each node came from
    var weightSoFar : [UUID: Double] = [:] // a dictionary of each node to the node it came from
    var path : [any Traversable] = [] // A list of the nodes it took to reach this point
    var backtrackPathFromPrevious : [any Traversable] = [] //
    var completed : Bool
    var pathExists : Bool
    var explanation : String
}
```

#### Steps to Undo
To Undo I pop the last Algorithm State of the Object. I override the current algorithm state.
```swift
func restoreHistory(){
	//previous state is an optional variable so may not exist(it is nil), this if statement unwraps it so this code will run using the variable only if it exists.
	if let previousState = history.popLast(){  
		currentState = previousState
}
```

#### Steps To Redo
To redo there are two parts
* Put the current state of the listed variables onto a new Algorithm State Object. I put this on the top of the stack.
* Run the next step of the chosen algorithm to go calculate the new state for the next step.

The first part is simple:
```swift
func storeHistory(){
	history.append(currentState)
}
```

In the second part there are few steps
* Get the Next node (this uses the frontier queue which is based of the priorities of the chosen algorithm)
* Check if the next node is the target node

This is the code. There is some additional validation that I had to include.
```swift
//move to next node (getNextFrontier returns a tuple of weight and neighbour)
currentState.current = getNextFrontier().neighbour
            
// Don't add to explored twice
if !currentState.explored.contains(where: { $0.id == currentState.current.id }) {
	currentState.explored.append(currentState.current)
}            
calculatePathFromPreviousToCurrent(previousNode: previousNode)


if let end = end{
	if end.isEqual(to : currentState.current){
		
		let reconstructedPath = getPathToStart(end: end)
		
		currentState.path = reconstructedPath.reversed()
		currentState.pathExists = true
		currentState.explanation = Explanations.getCompletedExplanation(
			current: end, 
			exploreCount: currentState.explored.count,
			cost: Int(currentState.weightSoFar[end.id] ?? 0)
		)
		currentState.completed = true
		return
	}
}
		   
var justAdded : [any Traversable] = []

for n in currentState.current.getNeighbours(){
	let newWeight = getNewWeight (n: n)
	let queuePriority = getQueuePriority(n : n, to:end!)                      
	
	// let newWeight = weightToCurrent + n.weight
	if shouldAddToFrontier(n : n, newWeight : newWeight){
		currentState.frontier.append((neighbour: n.neighbour, weight: queuePriority))
		justAdded.append(n.neighbour)
		currentState.cameFrom[n.neighbour.id] = currentState.current
		currentState.weightSoFar[n.neighbour.id] = newWeight                    
	}
	}
	currentState.explanation = Explanations.getAddToFrontierExplanation(current: currentState.current, neighbours: justAdded)
	
	//added to frontier so can resort
	prioritizeAndDedupeFrontier()
	
	if currentState.frontier.isEmpty{
		
		currentState.explanation = Explanations.getFullyExploredExplanation(current: currentState.current)
		currentState.completed = true
	}
```

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

**TODO**: Add example code for SKActions

##### ShipRingPulse
I added a pulse for when the ship explores a planet. The radius is dependent on the ship's shortest distance so the ship it can travel to. Hopefully this makes it more obvious which planets are added to the frontier.

**TODO**: Add example code for this animation
##### NodeTeleport
##### MoveShipNode

#### Algorithm Backtracking
After implementing the search algorithms I realised algorithms that used backtracking would do large jumps across the graph. I thought this was unclear and may be confusing for my target audience. I wanted to implement a feature that showed the nodes the spaceship backtracks to on the way to the next node.
To do this I made each node store the node which the ship came from.

#### Minor improvements to prior stages

### Stage Six : User Interface

My user interface needs to adapt and scale to fit different sized screens while looking consistent, visible, and un-intrusive for different devices. During this stage I used my iPad mini a lot for testing and tested using different window sizes on my laptop. 
Overall I found this to be harder than expected.

The Screens that I included were the Menu Screen, Graph screen, How to use screen and a Algorithms Descriptions screen.
I did not include a settings page as I did not find there were many controls in the program so I didn't think it was necessary.

#### SwiftUI Reusable Components
##### Space Text
To save time developing the program and to increase the consistency of the UI across the user interface I used reusable components such as buttons, sliders and text.

I started by creating a custom view modifier that could change the text in a view. A view modifier in SwiftUI is a function that can change aspects of a view. I made my own custom modifiers which could make elements in my custom style. I made three for basic text, headings and subheadings. When making them I was just using built-in view modifiers but my custom one just packaged them together so I can change all elements using this modifier by just changing the modifier. For the font I used a system font called "Chalkduster" which is preinstalled on most new iOS devices.

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

#### Graph Generation Screen

#### Graph Solving Screen

#### How to use Screen
This is a screen that shows the user how to interact with the program in case they are confused. It tells them what the colour codes mean and what the stacks and other UI elements represent.
It also shows the user the controls and how to interact with the program.

#### Algorithms Descriptions Page

TODO addd screenshot

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
This is a bonus SpriteKitView I created for decorative reasons. It uses SpriteKit to create a nice starry background for the screens. Its algorithm was random so each starry background is different. The algorithm is very simple as it simply places a random number of stars in random positions in a given range for a set number of iterations. I used some of SpriteKit's effects like glow which gave a glow around the border on the individual stars which were just small dots or circles.

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


## Testing to Inform Development

When writing the algorithms, in order to debug them and ensure they were working as intended, I needed graphs that would produce different outcomes for each algorithm. I wrote some down on paper and manually solved them step by step using a trace table. During development I then compared the program state with the expected state to make sure the implementations were correct.
These test graphs looked more artificial than the random galaxies because their purpose was correctness rather than appearance. In my random graph generation the weights are usually proportional to the distance between nodes, with some random noise for variation, but for the fixed tests I wanted graphs that clearly separated the behaviour of the algorithms.

I ended up using two main non-random test graphs throughout development:
* A weighted square graph, which was useful for comparing algorithms that do and do not account for edge weights.
* A tree graph, which was useful for checking traversal order and the behaviour of stacks and queues.

I used the weighted square graph and the tree graph repeatedly while implementing the algorithms and the step system. These were useful because they gave me known expected answers, so I could check whether the frontier, explored nodes, and final path matched what I had worked out on paper.

This testing was also useful for the user experience, not just correctness. During stakeholder play testing, one piece of feedback was that random graphs could look impressive but it was hard to tell whether the answer was actually right. That feedback was one of the reasons I added the fixed test graphs and changed the galaxy generator into subclasses so I could deliberately choose between a random graph and a known test case.

**TODO:** insert labelled screenshots of the weighted square graph and the tree graph before solving.

**TODO:** insert screenshots of both test graphs fully solved with BFS, DFS, Dijkstra, Greedy Best First Search, and A* so the reader can compare the outputs visually.

#### Test Results Summary

##### Unweighted Tree Test Graph

| Algorithm                | Correct (Y/N) | Shortest length | Number of steps | Solved Graph Image              |
| ------------------------ | ------------- | --------------: | --------------- | ------------------------------- |
| BFS                      | **Y**         |           **3** | **13**          | ![[BreadthFirstTreeSolved.png]] |
| DFS                      | **Y**         |           **3** | **7**           | ![[DepthFirstTreeSolved.png]]   |
| Greedy Best First Search | **Y**         |           **3** | **4**           | ![[GreedyTreeSolved.png]]       |
| Dijkstra                 | **Y**         |           **3** | **13**          | ![[DijkstraTreeSolved.png]]     |
| A*                       | **Y**         |           **3** | **4**           | ![[AStarTreeSolved.png]]        |
For the tree graph

##### Weighted Square Test Graph

| Algorithm                | Correct (Y/N) | Shortest length | Number of steps | Solved Graph Image |
| ------------------------ | ------------- | --------------: | --------------- | ------------------ |
| BFS                      | **Y**         |           **3** |                 |                    |
| DFS                      | **Y**         |           **3** |                 |                    |
| Greedy Best First Search | **Y**         |        **TODO** |                 |                    |
| Dijkstra                 | **Y**         |           **3** |                 |                    |
| A*                       | **Y**         |        **TODO** |                 |                    |
For the square the 


##### Generated Graph

| Algorithm                | Correct (Y/N) | Shortest length | Number of steps | Solved Graph Image |
| ------------------------ | ------------- | --------------: | --------------- | ------------------ |
| BFS                      | **Y**         |           **3** | **13**          |                    |
| DFS                      | **Y**         |           **3** | **7**           |                    |
| Greedy Best First Search | **Y**         |        **TODO** | **4**           |                    |
| Dijkstra                 | **Y**         |           **3** | **13**          |                    |
| A*                       | **Y**         |        **TODO** | **4**           |                    |
For the Generated Graph the 



**TODO:** fill this table with the actual measured results from the fixed test graphs and refer back to it in the algorithm-solving and evaluation sections.
* Use real values taken from the finished program, not estimated ones.
* Highlight where different algorithms behave differently on the same graph.
* State explicitly which algorithms found the shortest path and which did not.

**TODO:** add one worked step-by-step trace table for at least one algorithm on one test graph, showing the frontier, visited list, current node, and any distance updates at each step.
* Make sure the trace table matches the screenshots and the implementation.
* Use this as direct evidence that the step system is correct.

## Testing to Inform Evaluation

**TODO:** add brief evidence from post-development user testing here, including who tested it, what level of experience they had, and what I asked them to try.
* Generate their own graphs and choose their algorithm.
* Understand how to step through the algorithm.
* Understand how the visual representation of the progress made sense to them.
* Understand the final visual representation of the path that was found.
* Navigate to the about and help screens.
* Use the help screens if they got stuck.
* Record whether each task was completed successfully and how much support the user needed.

**TODO:** add the findings from this testing and explain what I changed because of them.
* For each finding, state the issue, the evidence, the change made, and whether the issue was fully resolved.
* Found a bug generating a galaxy with 0 planets.
* Found the colours quite confusing.
* Nobody bothered reading the help section.
* It was hard to know if the algorithm found the correct path.

## Evaluation
In this section I will go through the different components, show the related success criteria in a table, and mention any relevant added features and improvements that could be made.

**TODO:** evaluate each success criterion one by one using evidence.
* For every criterion, state whether it was met, partially met, or not met.
* Quote the evidence source, such as a test table, screenshot, stakeholder result, or specific implementation section.
* Keep the judgement honest where the evidence is mixed.
**TODO:** say clearly what works well, what does not, and what I would improve next.
* Separate strengths, weaknesses, and future improvements instead of mixing them together.
* Make sure every proposed improvement links back to a limitation or partially met criterion.

### Success Criteria

For visualising the difference in the algorithms I definitely achieved the main goal of getting them all running correctly, and visualising the backtracking helps a lot.
However, the way the random graphs were generated, with weights proportional to the distance to the node, meant that a few algorithms performed quite similarly. What I could have done was add more noise to the weights in generation.

#### Subcomponent One : Graph generation

##### Learnings and things added
I later added non-random test galaxies so that I could verify whether each algorithm had solved the graph correctly. This was useful because random graphs were not always easy to judge by eye.
Edges should not intersect as it makes the graph harder to visualise. This is why I introduced the `CheckLines` stage.

##### Implement in future
Validating distance between start and end
I did mention this in design but the start and end planets should be a reasonable distance from each other to prevent graphs being solved too quickly. There are three main conditions I could use to determine this:
* Is the absolute distance between the start and end nodes are less than some predetermined threashold.
* Check if the number of edges between the start and end, this will mean I can specify the minimum number of steps for an algorithm.
* Check if the total weight to the finish is less than a certain value. (This would be the same as the number of edges for algorithms that dont do weights.
For the way I have structured the graph generation I think all of these will have similar effect as deciding if there is a connection and the weight is based off of absolute distance 

#### Subcomponent Two : Graph Rendering

#### Learnings

**TODO:** say how well the graph was displayed and mention any visual problems.

#### Subcomponent Three : Algorithm Solving

**TODO:** say whether each algorithm worked correctly and refer directly to the weighted square graph and tree graph test results table.

#### Subcomponent Four : Algorithm Control

**TODO:** evaluate the step system and undo system.

#### Subcomponent Five : Algorithm Visualisation

**TODO:** evaluate how clear the colours, ship movement,animations and explanations were. Refer back to the user testing. Mention the problems with the ship timing when doing the auto play

#### Subcomponent Six : User Interface

**TODO:** evaluate the menus, navigation and screen layout on different devices. Say how well they fitted.

##### Text Based SwiftUI pages
One small thing I found was that the text and image based information pages were quite static and boring. One reason was that I used images in these screens which were simply screenshots. It may have been better if I had used small SpriteKit windows in the SwiftUI view to make them more interactive. This would future-proof it too, as if I updated the gameplay screens it would automatically update in the information pages instead of me having to take new screenshots.
This also meant that the starry background in the screenshots would move relative to the starry background in the page which was a small issue but still could be better.

I also thought the text and UI components did not optimise space particularly well. The back button limited the available screen real estate. To do this better I would have overlayed the UI components and used transparent images. 

## Sources

Orientation Algorithm For Line Intersection
https://www.geeksforgeeks.org/dsa/check-if-two-given-line-segments-intersect/
Model View Controller explanation
https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html

https://www.ocr.org.uk/Images/324587-project-setting-guidance.pdf
https://www.ocr.org.uk/images/170844-specification-accredited-a-level-gce-computer-science-h446.pdf

## Tools
Swift Playgrounds - https://developer.apple.com/swift-playground/
Swift Documentation - https://www.swift.org/documentation/
Github - https://github,com/
GitHub Desktop - https://github.com/apps/desktop
Obsidian Markdown Editor - https://obsidian.md/
Memaid JS Chart Library - https://mermaid.js.org/
