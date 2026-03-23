# A Level Computer Science Programming Project WriteUp

| **Name: Noah Marks  **                    | **Candidate Number: 1146** |
| ----------------------------------------- | -------------------------- |
| **Project: Engaging Graphing Simulator ** | **Centre Number: 10132**   |

<p align="center"><img src="./screenshots/IntroScreen.png" alt="Intro Screen" width="75%"></p>

<div style="page-break-before: always;"></div>

## Table of Contents

<div style="font-size: 0.72em; line-height: 1.15;">
<ul>
  <li><a href="#introduction">Introduction</a> .... 3</li>
  <li><a href="#analysis">Analysis</a> .... 3
    <ul>
      <li><a href="#problem-recognition">Problem Recognition</a> .... 4</li>
      <li><a href="#analysing-other-solutions">Analysing Other Solutions</a> .... 5</li>
      <li><a href="#stakeholders-and-audience">Stakeholders and Audience</a> .... 9</li>
      <li><a href="#using-computational-methods-in-the-solution">Using Computational Methods in the solution</a> .... 14</li>
      <li><a href="#choosing-a-framework">Choosing a Framework</a> .... 16</li>
      <li><a href="#system-requirements">System Requirements</a> .... 18</li>
      <li><a href="#features-of-proposed-solution">Features of Proposed solution</a> .... 19</li>
      <li><a href="#limitations-of-solution">Limitations of Solution</a> .... 19</li>
      <li><a href="#other-requirements">Other Requirements</a> .... 19</li>
      <li><a href="#success-criteria-definition">Success Criteria Definition</a> .... 21</li>
    </ul>
  </li>
  <li><a href="#design">Design</a> .... 23
    <ul>
      <li><a href="#problem-decomposition">Problem Decomposition</a> .... 23
        <ul>
          <li><a href="#subcomponent-one--graph-generation">Subcomponent One : Graph generation</a> .... 25</li>
          <li><a href="#subcomponent-two--graph-rendering">Subcomponent Two : Graph Rendering</a> .... 27</li>
          <li><a href="#subcomponent-three--algorithm-solving">Subcomponent Three : Algorithm Solving</a> .... 28</li>
          <li><a href="#subcomponent-four--algorithm-control">Subcomponent Four : Algorithm Control</a> .... 29</li>
          <li><a href="#subcomponent-five--algorithm-visualisation">Subcomponent Five : Algorithm Visualisation</a> .... 30</li>
          <li><a href="#subcomponent-six--user-interface">Subcomponent Six : User Interface</a> .... 31</li>
        </ul>
      </li>
      <li><a href="#system-overview--architecture">System Overview / Architecture</a> .... 32</li>
      <li><a href="#implementation-of-subcomponents">Implementation of Subcomponents</a> .... 33
        <ul>
          <li><a href="#subcomponent-one--graph-generation--model">Subcomponent One : Graph generation : Model</a> .... 33</li>
          <li><a href="#subcomponent-two--graph-rendering--view">Subcomponent Two : Graph rendering : View</a> .... 34</li>
          <li><a href="#subcomponent-three--algorithm-solving--model">Subcomponent Three : Algorithm Solving : Model</a> .... 35</li>
          <li><a href="#subcomponent-four--algorithm-control--model">Subcomponent Four : Algorithm Control : Model</a> .... 36</li>
          <li><a href="#subcomponent-five--algorithm-visualisation--view">Subcomponent Five : Algorithm Visualisation : View</a> .... 37</li>
          <li><a href="#subcomponent-six--user-interface--view">Subcomponent Six : User Interface : View</a> .... 38</li>
        </ul>
      </li>
    </ul>
  </li>
  <li><a href="#development">Development</a> .... 42
    <ul>
      <li><a href="#object-model">Object Model</a> .... 42</li>
      <li><a href="#stage-one--random-galaxy-generation">Stage One : Random Galaxy Generation</a> .... 45</li>
      <li><a href="#stage-two--galaxy-rendering">Stage Two : Galaxy Rendering</a> .... 50</li>
      <li><a href="#stage-three---implementing-search-algorithms">Stage Three - Implementing Search Algorithms</a> .... 52</li>
      <li><a href="#stage-four--algorithm-control">Stage Four : Algorithm Control</a> .... 56</li>
      <li><a href="#stage-five--algorithm-visualisation">Stage Five : Algorithm Visualisation</a> .... 61</li>
      <li><a href="#stage-six--user-interface">Stage Six : User Interface</a> .... 65</li>
      <li><a href="#source-control-project-tracking-tools-and-ai">Source Control, Project Tracking, Tools and AI</a> .... 74
        <ul>
          <li><a href="#source-control">Source Control</a> .... 74</li>
          <li><a href="#issue-tracking">Issue Tracking</a> .... 74</li>
          <li><a href="#development-environment">Development Environment</a> .... 75</li>
          <li><a href="#use-of-ai">Use of AI</a> .... 75</li>
        </ul>
      </li>
      <li><a href="#testing-to-inform-development">Testing to Inform Development</a> .... 76
        <ul>
          <li><a href="#test-plan">Test Plan</a> .... 76</li>
          <li><a href="#testing-the-graph-algorithms">Testing the Graph Algorithms</a> .... 79</li>
          <li><a href="#bugs-fixed-during-testing">Bugs Fixed During Testing</a> .... 87</li>
        </ul>
      </li>
    </ul>
  </li>
  <li><a href="#evaluation">Evaluation</a> .... 93
    <ul>
      <li><a href="#testing-to-inform-evaluation">Testing to Inform Evaluation</a> .... 93</li>
      <li><a href="#stakeholder-testing-results">Stakeholder Testing Results</a> .... 94</li>
      <li><a href="#open-feedback-summary">Open Feedback Summary</a> .... 98</li>
      <li><a href="#usefulness-and-improvements">Usefulness and Improvements</a> .... 98</li>
      <li><a href="#high-level-evaluation">High Level Evaluation</a> .... 98</li>
      <li><a href="#success-criteria-evaluation">Success Criteria Evaluation</a> .... 99</li>
      <li><a href="#component-evaluation">Component Evaluation</a> .... 101
        <ul>
          <li><a href="#subcomponent-one--graph-generation-1">Subcomponent One : Graph generation</a> .... 101</li>
          <li><a href="#subcomponent-two--graph-rendering-1">Subcomponent Two : Graph Rendering</a> .... 101</li>
          <li><a href="#subcomponent-three--algorithm-solving-1">Subcomponent Three : Algorithm Solving</a> .... 101</li>
          <li><a href="#subcomponent-four--algorithm-control-1">Subcomponent Four : Algorithm Control</a> .... 101</li>
          <li><a href="#subcomponent-five--algorithm-visualisation-1">Subcomponent Five : Algorithm Visualisation</a> .... 102</li>
          <li><a href="#subcomponent-six--user-interface-1">Subcomponent Six : User Interface</a> .... 102</li>
        </ul>
      </li>
    </ul>
  </li>
  <li><a href="#conclusion">Conclusion</a> .... 103</li>
  <li><a href="#appendix-sources">Appendix: Sources</a> .... 104
    <ul>
      <li><a href="#example-solutions">Example Solutions</a> .... 104</li>
      <li><a href="#documentation-and-reference-sources">Documentation and Reference Sources</a> .... 104</li>
      <li><a href="#software-and-tools">Software and Tools</a> .... 104</li>
    </ul>
  </li>
</ul>
</div>

<div style="page-break-before: always;"></div>

## Introduction

This project is an engaging educational graph algorithm simulator with a space theme. The main aim was to make graph algorithms more engaging and easier to understand by allowing the user to interact with them in an app, rather than only reading about them or solving them from boring diagrams. The finished program allows the user to generate or choose a graph, select an algorithm, and then step through the solution while seeing what is happening visually on the graph.

I will be using Swift and SwiftUI to develop an app which will be able to run on 2.5 billion Apple devices all over the world.

This document is organised into the main stages of the project. It begins with analysis of the problem, the audience and stakeholders interviews, and existing solutions, and then moves into the design of the system. In the design section I use tables, hand-drawn sketches, and diagrams such as hierarchy diagrams, navigation diagrams, and class diagrams to show how the solution was planned. The development section then explains how the main parts of the program were implemented, using screenshots, code samples, and further diagrams where they help explain the structure. I tried to show the most interesting algorithms and code snippets. When designing and developing I divided the program into six main components and each section tries to cover them separately. After this there are sections on testing during development and testing after development. At the end there is the evaluation section, where I revisit my requirements from analysis and re-interview my stakeholders to evaluate how well the final program met my specified criteria. Finally there is an appendix containing the sources used.

There is also a video of the final project in use, alongside other key tools I used during development. I hope you enjoy reading it as much as I enjoyed writing it!

<div style="page-break-before: always;"></div>

## Analysis

### Problem Recognition

The problem I am solving is the lack of fun ways to learn about certain Computer Science (CS) concepts, more specifically graph algorithms. Interactive simulations are useful tools for learning as they can walk you through new concepts, especially for STEM and Computer Science. Good learning also comes from relatable analogies and creative teaching methods. The flexibility of coding allows you to express this creativity through a program. Therefore, a computer simulation is a suitable method to teach a topic like graph algorithms.

From experience I have noticed that when looking for resources online to help learn a new concept there is a separation between the engaging resources, which are often videos using creative analogies, and the interactive tools used to model them, which are often boring, difficult to use, and stuck in the browser. This could be due to the relative difficulty of making a program compared to a video.

I want to bridge that gap by creating a graph algorithm simulator that uses a fun analogy of space to keep the user engaged. From my research, which I will refer to later, I believe that space is an engaging subject for many people interested in computer science and, even if they are not, it is still a fun and different way to explore the algorithms.

Graph algorithms are often difficult for Computer Science students because they may not have been exposed to these ideas before. One limitation with learning them is that there are lots of things changing at once while the algorithm runs. The student has to keep track of the current node, which nodes have already been explored, which nodes are still waiting to be visited, and sometimes the cost so far as well. This can be difficult to follow on paper, especially for someone who is new to trace tables or weighted graphs. It can also mean that a student learns the order of the steps without fully understanding why the algorithm made that choice or how it is different from another algorithm. I will make an educational tool that aims to create a fun way for anyone to learn about graph algorithms through space.

<div style="page-break-before: always;"></div>

### Analysing Other Solutions

I have selected a few educational tools that aimed to create an interactive way to learn something. I tried out these tools and noted down the parts that I liked and disliked about them.

#### Solution 1: Graph Online [[https://graphonline.top/]]

<p align="center"><img src="./exampletools/graphonline.png" alt="Graph Online" width="80%"></p>

This is a basic graphing simulator I found online.  It lets you create a graph manually, to do this there were a few tools: panning, dragging, adding nodes, adding edges and more. The UI was quite tedious, especially when moving nodes and edges or creating a connection between two nodes, where there is a menu for selecting weights and direction and text which seemed unnecessary and time consuming.

<p align="center"><img src="./exampletools/noweight.png" alt="Graph Online No Weights" width="40%"></p>

I thought it was frustrating to make a graph manually and that it would be unhelpful if this was your first time encountering a graph, because you may not know what graph to make. I found the options overwhelming and not focused on anything specific. I thought it was more suitable for people who were already familiar with the basics.

I want my project to be accessible to people who do not even know what a graph is. It did not show you the steps of the algorithm and just solved it, which I believe is important for understanding the algorithm.

#### Solution 2: TUM Shortest Path [[https://algorithms.discrete.ma.tum.de/spp/]]

<p align="center"><img src="./exampletools/munich.png" alt="TUM Shortest Path Algorithm" width="80%"></p>

The University of Munich made a graph algorithm visualisation and learning tool that I enjoyed.

I liked how there were different tabs which separated learning about the algorithm, creating the graph, and running the algorithm. I liked the detailed descriptions of the steps and the visual colouring of the nodes and edges. I found this important for the algorithm simulation.

The graph creation was better than Graph Online because it started with a simple graph that you could extend, but it was still quite limiting.

My main complaint is that the program was not very engaging. The user had to read long paragraphs of text and, while the site was not ugly, it was not especially visually appealing.

It also did not have many of the simpler graph traversal algorithms, like BFS and DFS, and mainly focused on shortest path algorithms.

#### Solution 3: PhET ([[https://phet.colorado.edu/]])

This is not a graphing simulator, but it is an educational tool that makes learning more interesting. There are lots of different high quality simulations on this platform. PhET is a non-profit organisation founded by Carl Wieman. They have made their own framework for making simulations.

This is a math simulation that shows you the derivative of a function. I thought it was a useful visualisation and the controls were minimal and necessary.

<p align="center"><img src="./exampletools/phet.png" alt="PhET Graph Example" width="80%"></p>

The following simulation is about Kepler's laws, and you can choose between the three of them. This screenshot is specifically for Kepler's 3rd law. This is a theme across most simulations, but you can turn off relevant information. Lots of the tools to help learning were consistent across the simulations. This would mean that the user is familiar with how to use these tools before even starting the simulation.

<p align="center"><img src="./exampletools/targetorbit.png" alt="PhET Orbit Example" width="80%"></p>

I loved using all the simulations and found them very useful. However, one thing I would have liked is if they added a creative twist to keep the user engaged. As this is a large platform with lots of similar simulations I understand that it is good to keep consistency between them, so I understand why they can in some cases look a bit boring.

Since my program is only one tool, I can take advantage of this and make my project more unique and more relatable to use.

#### Research Takeaways

To compare the three solutions more directly, I made the following table. This helps me identify the main areas where I want my own solution to be different.

| Aspect to Compare                                | Graph Online                                                                          | TUM Shortest Path                                                                                                                                       | PhET                                                                                | How My Solution Will Be Different                                                                                                                                               |
| ------------------------------------------------ | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Ease of use for beginners                        | Quite difficult for beginners because there are lots of controls and little guidance. | Better than Graph Online, but still expects some understanding of computer science.                                                                     | Very approachable, with simple intuitive controls and clear instructions.           | I will keep a simple minimal interface giving the user what they need, nothing more, nothing less.                                                                              |
| Step-by-step explanation of the algorithm        | It just solves the graph instantly without instructions.                              | Strong step-by-step explanation with colouring and detailed descriptions.                                                                               | Strong step-by-step teaching in general, but not for graph algorithms specifically. | I will keep the step by step instructions from TUM but give options for explanations in less techincal words to make it easier for a younger or less experienced person to use. |
| How the user creates or interacts with the graph | The user builds a graph manually, which can be slow and awkward.                      | The user can edit an existing graph, but the graph creation is still difficult if you want something else.                                              | The user interacts with ready-made simulations using simple controls.               | I will generate the graph for the user with a few simple but powerful inputs. The user does not need to confuse themselves making a graph.                                      |
| How engaging the visuals and theme are           | Functional but not very visually engaging.                                            | Clear and useful, but not especially exciting or creative.                                                                                              | Polished and attractive, but mostly consistent rather than themed.                  | I am going to use an analogy that relates to the graph to keep it more engaging. This will make the                                                                             |
| Range of algorithms or learning content included | Covers graph solving, but not much teaching support.                                  | Focuses mostly on shortest path algorithms. For teaching it has non simulation based lessons which provide the user with foundations before jumping in. | Wide range of science and maths topics, but not graph theory.                       | I plan to implement the key algorithms that most people should know. It will focus on giving the user a strong base understanding.                                              |

The main takeaways are that I wanted to make the program approachable and relatable to the user, intuitive to use with step-by-step instructions, and not rely on any prior knowledge from the user. I believe stepping through the algorithm while giving explanations and showing state will be an essential part of the program, as it is about teaching the algorithms rather than just showing them. I noticed the graphing simulations out there had interfaces with lots of options. At the cost of making it more approachable my program may have less features exposed to the user which should make it easier to use. This will differentiate my program to the competition which should make it more appealing to my audience which is anyone seeking to learn about graphing algorithms with less experience or from scratch.

<div style="page-break-before: always;"></div>

### Stakeholders and Audience

My audience is anyone who is interested in learning about CS. This could be anyone from the age of 8 to 80 who is interested. This may seem like quite a broad audience due to the wide age range, but I can narrow it slightly to those who are more STEM focused.

Specifically I am targeting a younger audience, as they are the future generation, and I want to create interest while they are still deciding what they are going to do with their lives. It is also true that this age group spends lots of time on mobile applications, playing video games, or using computers, so this may appeal more to them.

For my stakeholders I tried to find Computer Science students, who will likely study graph algorithms, doing A-Levels or GCSEs, as well as an adult, as my goal is to make this tool accessible to people not actively studying computer science.

First I gave a quick questionnaire to these stakeholders and I aim to use this data to better understand my audience and tailor the experience to be more engaging to them.

I am going to refer back to these stakeholders once I have developed the app and allow them to test it.

#### Questionnaire for target market

These are pictures of some of the surveys that were filled in.

<p align="center"><img src="./surveys/pre_surveys.jpeg" alt="Pre evaluation surveys" width="75%"></p>

| **Are you studying computer science, if so what course: ** | A level, GCSE, University, None or Other                                                             |
| ---------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Stakeholder 1 : Rambo                                      | GCSE OCR computer Science                                                                            |
| Stakeholder 2 : Rocco                                      | OCR comp-sci A-Level                                                                                 |
| Stakeholder 3 : Jim                                        | A Level Computer Sci                                                                                 |
| Stakeholder 4 : Jon                                        | I am not currently studying computer science but finished a degree in comp-sci and maths a while ago |
| Stakeholder 5 : Willow                                     | GCSE                                                                                                 |
| Stakeholder 6 : Caspian                                    | no                                                                                                   |
| Stakeholder 7 : Inge                                       | no                                                                                                   |

From this it seems like my stakeholders will, or already have, encountered graphing algorithms, which gives me confidence that I have selected a useful topic.

| What devices do you use the most to learn: | Options: Tablet, Phone, Desktop or other    |
| ------------------------------------------ | ------------------------------------------- |
| Stakeholder 1 : Rambo                      | I got a ipad 9th gen which I use for school |
| Stakeholder 2 : Rocco                      | I use a m2 macbook pro                      |
| Stakeholder 3 : Jim                        | I have a iPad Pro M4                        |
| Stakeholder 4 : Jon                        | Mac Mini desktop for work                   |
| Stakeholder 5 : Willow                     | Laptop - MacBook                            |
| Stakeholder 6 : Caspian                    | iPad                                        |
| Stakeholder 7 : Inge                       | Chrome or iPhone                            |

Most of my stakeholders use Apple devices. It is only a small sample, but I still think targeting this audience is a good start.

| **How Long are you willing to spend to learn a new topic: ** | A time based measurement from 5 minutes to over a few days |
| ------------------------------------------------------------ | ---------------------------------------------------------- |
| Stakeholder 1 : Rambo                                         | 40 minutes, just under a lesson                            |
| Stakeholder 2 : Rocco                                         | 20 minutes for something small                             |
| Stakeholder 3 : Jim                                          | half a school period or half an hour                       |
| Stakeholder 4 : Jon                                          | half an hour                                               |
| Stakeholder 5 : Willow                                       | 1 hour                                                          |
| Stakeholder 6 : Caspian                                      | 20 minutes                                                           |
| Stakeholder 7 : Inge                                         | 1 hour                                                           |

I wouldn't be surprised if it takes slightly longer (or shorter) than the stakeholders quoted times but my target is that this should be done in about half a school lesson. The tool will not be used the whole time so this would also provide time for other forms of research or creating trace tables while using the program.

| **Which of the following analogies do you find most relatable and interesting out of: ** | Options: Space, A Map (City or Rural) or other                           |
| ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| Stakeholder 1 : Rambo                                                                     | Space                                             |
| Stakeholder 2 : Rocco                                                                     | Space or City                                        |
| Stakeholder 3 : Jim                                                                      | Rural or Space |
| Stakeholder 4 : Jon                                                                      | The Industrial Map or Space                      |
| Stakeholder 5 : Willow                                                                   | Map/City                                                                        |
| Stakeholder 6 : Caspian                                                                  | Space                                                                       |
| Stakeholder 7 : Inge                                                                     | Other: Fantasy                                                                         |

Space seems to be the most popular theme among my stakeholders.

| **When using a tool to learn a new subject would you rather have :** | Options: more control or a more guided path or other                                                                                                                   |
| -------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Stakeholder 1 : Rambo                                                 | More control                                                                                                  |
| Stakeholder 2 : Rocco                                                 | A mixture of both                               |
| Stakeholder 3 : Jim                                                  | More guided                                                                                           |
| Stakeholder 4 : Jon                                                  | More control |
| Stakeholder 5 : Willow                                               | A mixture of both                                                                                                                                                                       |
| Stakeholder 6 : Caspian                                              | More guided                                                                                                                                                                    |
| Stakeholder 7 : Inge                                                 | A mixture of both                                                                                                                                                                       |

There is a wide range of all the answers here.

| **Before using this app, how confident do you feel about graph algorithms :** | Options: very, fairly, not very, not at all                                                                                                                  |
| -------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Stakeholder 1: Rambo                                                 | fairly                                                                                                  |
| Stakeholder 2: Rocco                                                 | very                               |
| Stakeholder 3 : Jim                                                  | fairly                                                                                           |
| Stakeholder 4 : Jon                                                  | very |
| Stakeholder 5 : Willow                                               | not at all                                                                                                                                                                       |
| Stakeholder 6 : Caspian                                              | not at all                                                                                                                                                                       |
| Stakeholder 7 : Inge                                                 | not at all                                                                                                                                                                       |

The Comp Sci students are quite confident, and the others are not at all confident.

| **Before using this app, how well do you understand BFS/DFS/Dijkstra/A Star :** | Options: well, little, not at all                                                                                                                  |
| -------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Stakeholder 1: Rambo                                                 | little                                                                                                  |
| Stakeholder 2: Rocco                                                 | well                               |
| Stakeholder 3 : Jim                                                  | little                                                                                           |
| Stakeholder 4 : Jon                                                  | well |
| Stakeholder 5 : Willow                                               | not at all                                                                                                                                                                       |
| Stakeholder 6 : Caspian                                              | not at all                                                                                                                                                                       |
| Stakeholder 7 : Inge                                                 | not at all                                                                                                                                                                       |

The answers to this were pretty much the same as the previous question. I do not think I needed this question.

| Question                                                             | Summary of answers                                                               |
| -------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| What would you expect from a good learning app for graph algorithms? | Easy to understand and nice graphs.                                              |
| What would you expect from a good learning app for graph algorithms? | Clear visualisation of the steps and solution. Ability to step forward and back. |
| What would you expect from a good learning app for graph algorithms? | To do all the work for me                                                        |
| What would you expect from a good learning app for graph algorithms? | Clear instructions, fun, beautiful                                               |
| What would you expect from a good learning app for graph algorithms? | Help me do well in my A Levels                                                   |
| What would you expect from a good learning app for graph algorithms? | Make sure I understand everything                                                |
The feedback from the Computer Science students was focussed on learning and understanding the algorithms. The feedback from the others was more about the graphics and UI and having fun.

#### Client Questionnaire takeaways

I believe a space analogy will be the most suitable for the audience. This makes sense as my stakeholders are mostly into STEM, so they were already fascinated by space. This will influence choices of themes and visuals of the program when designing and developing.

I think it is important to have at least a gentle introduction to the algorithms and a clear, easy-to-use interface. From research into other tools I found the solutions that had direct onboarding were more useful, and my stakeholders backed this up. This will also mean I will have a multi-page interface so the user can focus on individual sections at once, with each page having clear start and end points so the user knows when to move on.

These answers also supported my view that I should sacrifice control over the program for ease of use and not confusing the user.

I think that 30 minutes is a suitable length of time for the user to spend on the program. This is close to the length of a school lesson and I believe it will take slightly longer than they first expect so this will allow people more flexibility around time.

I believe an app is the most accessible form for this audience, especially as the stakeholders seem to be using Apple devices. I understand my sample was small but if I can focus on a smaller group I can focus on creating the best experience for them. Apple also makes it easy to develop for their platforms, which further supports the suitability. However In future an android or web based version would be nice to make it more accessible to a wider audience.

<div style="page-break-before: always;"></div>

### Using Computational Methods in the solution

#### Iteration
I am going to be using iteration throughout the solution, especially when I need to repeat code on multiple instances like nodes and edges. Iteration is also used while running the graph algorithms as a process is repeated until the graph is solved.
#### Recursion
Some algorithms such as depth first search can use recursion instead of iteration. I will decide on the implementation later but I wouldn't be surprised if I use recursion at some point in the solution.
#### Computational Methods

##### Backtracking
All graph algorithms use backtracking all the time either if they reach a dead-end or have to return to a previous node to visit the next one on their frontier.
##### Data mining
My program does not require any data mining as I am not storing data.
##### Heuristics
Algorithms like A* use heuristics to help guide the search. For graph algorithms a sensible heuristic is the absolute distance to the target node.
##### Pipelining
Pipelining is not something I am directly controlling in this project, so it is not a relevant method in my solution.
##### Performance modelling
I can look at the time complexities of the components of the solution to see if the calculations are realistic on the kind of hardware I am using. I can look at the time complexities of the graphing algorithms I am using.
#### Abstraction
As my graphing simulator is set in space, I need to consider which features to keep to make the simulation at least somewhat accurate. This is a graphing simulator, not an ultra-realistic space simulation, so I am able to remove things without making the program useless to the user.

I will abstract lots of details of space and simplify it to just a graph with a few aesthetic objects in the background for visual appeal. The planets are the nodes and the graphs are the edges. I also used a protocol to make sure my graph code could work on any graph, not just planets.

I have looked at many aspects of space and noticed that there are many extra ideas that seem unnecessary and will overcomplicate the program. For example, adding planet Orbits would mean the nodes on the graph would have to move around. This not only complicates the development of the game but also adds extra complexities the user has to manage which would be frustrating, for example orbits would mean that the shortest path would be constantly changing. This would confuse the user which is a problem for an introduction to the subject.

Even though this may be unrealistic, my planets are just going to be floating in space scattered randomly on a 2D plane.

In terms of the graph simulation there is more abstraction going on. There are lots of additional features such as extra algorithms I could add, other variables I can show, and other UI elements. I want to keep the program minimal, showing only necessary features and information to avoid confusing the user.
#### Other Computational Thinking
##### Thinking Ahead
In each of the subcomponents of my game I am going to decide what the inputs and outputs of these components are. Reusing components will make it easier to develop, as well as making it more consistent.
##### Thinking Procedurally
I am going to break the game down into sub-systems to make it easier to write. When developing I will work on each component individually. I will use a top down design when designing the architecture.
##### Thinking Logically
My simulator is going to be event driven so will do things in a logical order step by step. I have to write lots of algorithms of varying complexity.
##### Thinking Concurrently
Lots of parts of my program will happen at the same time. The ship will need to move, the galaxy will need to be generated, and the paths will need to be found. This will mean that I need to do things asynchronously. There will be lots of objects in the game running functions continuously. This means that there will be multiple threads running at once, which should be handled by the engine I use.

<div style="page-break-before: always;"></div>

### Choosing a Framework
#### Framework Options

| **Platform**                                                             | **Description**                                                                                                                                                                                    | **Pros**                                                                                                                                                                                                                                          | **Cons**                                                                                                                                                                                                                                                                                                                             |
| ------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [Unity](https://unity.com/)[Unreal] (https://www.unrealengine.com/en-US) | Large Scale Game engines such as Unity and Unreal Engine will provide me with lots of tools and options for creating the project.<br>                                                              | I could make the program 3D if I wanted to.<br><br>Lots of lower-level UI interactions, e.g. panning, can be managed by the engine.<br><br>Lots of functionality is pre-baked into the engine, meaning I will not have to code these elements.    | A game engine like this can be overly complex for my program, as they are designed for video games involving more complex graphics. <br><br>I will have less control over the program if it is using pre-made functions, which means I don't write as many algorithms. For a unique project like graphing I would want more control. |
| [Godot](https://godotengine.org/)                                        | Godot is a lightweight game engine used for both 2D and 3D games                                                                                                                                   | Very lightweight and simple to use.<br><br>I can write in GDScript, which is a simple language similar to Python but can still be statically typed for efficiency.<br><br>I can easily export to many different platforms including iOS devices   | Like Unity, this is probably overkill.<br><br>Too many functions are provided in the framework, so there are fewer algorithms for me to write                                                                                                                                                                                        |
| [Swift](https://www.swift.org/) / SpriteKit                              | Swift is Apple's programming language and SpriteKit is a simple graphics API I could use with it to make my game. SpriteKit is still feature rich and powerful with its node system and SKActions. | I could make my app work on all Apple devices such as tablets and phones which is more convenient for my target audience.<br><br>It will be more efficient as Swift is statically typed, meaning it will be more optimised by the compiler        | The game will not be playable on other platforms like Android or Windows as it will be exclusively iOS.                                                                                                                                                                                                                              |
| [Pygame](https://www.pygame.org/)<br>                                    | Pygame is a simple 2D graphics library that uses python.                                                                                                                                           | I can write the project in Python which has easy syntax and is quite lightweight. This means I will have lots of control. I can also make it playable in the web which would mean it is usable by almost anyone if they have internet connection. | It is very basic so I will have to program all user interface components from scratch                                                                                                                                                                                                                                                |

#### Final Choice

The main three contenders are Swift (using SpriteKit), Pygame and Godot.

After considering the benefits and drawbacks of each framework I have decided to use Swift for my project. I will specifically be using SpriteKit for the graphics and SwiftUI for the controls and User Interface. I like the simplicity of this as it means I have more control over my game.

Another factor in my decision means I can program it in Swift which is a strongly typed language meaning great efficiency compared to something like using python with Pygame which was a close second choice. I prefer this over a game engine which would require me to code in C# or C++ which are more complex.

However this will mean that the app can only be played on Apple devices, this could be a good start as they are popular with my audience. I found it is also quite difficult to have an Android version as I would need to rewrite it due to the specific frameworks I have selected. It may be more accessible if I make a Web App but Swift does not allow this.

To develop I am going to be using Swift Playgrounds. This is a simple environment that should make it fast and easy to develop in. I may consider moving it to Xcode later if necessary, but to start Swift Playgrounds is sufficient.
<div style="page-break-before: always;"></div>

### System Requirements

#### Software

| **Requirement**                        | Description                                                                                                                                  | **Justification**                                                                                                                                           |
| -------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Runs macOS, iOS, iPadOS, VisionOS      | As I am using Swift/SwiftUI it will have to run an apple operating system.                                                                   | Swift, SwiftUI and SpriteKit only works on these operating systems                                                                                          |
| macOS Sonoma 14.5 or iOS 17.5 or later | I cannot support all versions of the OS so I need to decide how far back I can go                                                            | For iOS/macOS it is recommended that you support the last version and two preceding versions. Apple devices tend to be well within the last two OS versions |
| Mac Catalyst 17.5                      | This is only related to macOS but Mac Catalyst makes a version of my iPad app that works on Mac. Mac Catalyst 17.5 corresponds to macOS 14.5 | I am developing for iOS so I need to be able to convert it to a version that can run on Mac                                                                 |
#### Hardware

| **Requirement**               | Description                                                                                                                                                                                                                                                         | **Justification**                                                                                   |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| Computer Mouse or touchscreen | The device they use must be a touchscreen, or have a screen and mouse or trackpad or some mechanism to view and select elements                                                                                                                                     | Used for selecting objects and playing the game                                                     |
| Apple Device                  | It must be an apple device such as an iPad, Mac or iPhone                                                                                                                                                                                                           | The device needs to run a required operating system                                                 |
| Screen Aspect Ratio/Size      | I will not be too strict about the aspect ratio but it should not be too wide or too small. I am going to test it using an iPad and a Mac which have 3:2 and 16:10 aspect ratios so it will be designed around that as well as 2:3 for portrait iPads.              | Most users will be running this on iPads or Macs so optimising for these aspect ratios is important |
| 8GB of RAM                    | At least 8GB of RAM will be required. For Intel Macs 16GB would be preferred, as Apple silicon Macs are more efficient in managing RAM. 4GB is also acceptable on iPad as it is well optimised and my program itself is not storing much data, so it will not use much RAM. | I need to be able to run Swift Playgrounds, which is recommended to have at least 8GB.                |

<div style="page-break-before: always;"></div>

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

| Limitation                         | Explanation                                                                                                                                         | Justification                                                                                                                                                                                                              |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Simplicity                         | The program will have an easy to use simple interface                                                                                               | As I am targeting the simulator at introducing graphs it is naturally going to be less feature rich and the user will not have full control over the program.                                                              |
| Less Control over Graph Generation | As I am quickly generating the graph with minimal inputs it means the user will not be able to have the control to create the exact graph they want | Giving more control to the user will make it more complicated to use. It is not targeted at experienced people simulating lots of graphs to test efficiency or unusual cases on algorithms. It is more of a learning tool. |
| No Saved Data                      | I have not included the ability to store app data.                                                                                                  | I could not find enough features and reasons to store user data. There are no major practical benefits and the user likely prefers not to be tracked.                                                                      |

### Other Requirements
#### Usability Requirements
##### Menu with Navigation across screens
My app should allow the user to navigate between different screens. This should be intuitive and the user should not get lost.
##### Clean Design
I will make the appearance of the app minimal. I will have clear controls with suitable labels explaining what they do.
##### Performance
The simulation should be able to run on lower end older hardware. This will make it more accessible to more people. The program should not abruptly crash. It should not be too processor intensive so it should run with decent frame rates, not drain the device's battery life, and boot up quickly. I do not want performance to be an issue as it is important that the user enjoys using the program.

##### Bugs/Exploits
There should not be any Major bugs or Exploits in the program.   My focus will be on minimising bugs that are accidentally triggered that cause unexpected behaviour as this would confuse/mislead the user.

#### Information/Teaching
As this is an educational tool everything needs to be factually correct. After and during development I will run tests involving trace tables to check the algorithms are doing the correct steps. When writing factual information I will refer to credible sources. I will also make small quality of life improvements that make the explanations more true to what is actually happening.

<div style="page-break-before: always;"></div>

### Success Criteria Definition

Based on the problem I'm trying to solve, the responses from my client stakeholders and the features and limitations of the proposed solution I have come up with the following success criteria. I will compare against these in the evaluation of the project. I have tried to make sure that they are all measurable so I will know if I have succeeded on each.

| ID              | **Criteria**                                  | **Description**                                                                                                                 | **Reason**                                                                                                              | **Analysis Link**             |
| --------------- | --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ----------------------------- |
| **Functional**  |                                               |                                                                                                                                 |                                                                                                                         |                               |
| FR1             | Generate a graph                              | The user can generate a graph using simple controls.                                                                            | This allows the user to create a graph quickly without having to build one manually.                                    | Features of Proposed solution |
| FR2             | Teach what graphs and algorithms are used for | The app includes a page that explains what graphs and the algorithms are used for.                                              | The user needs some background knowledge before using the simulator so they understand why these algorithms matter.     | Features of Proposed solution |
| FR3             | Simulate the algorithms                       | The program correctly runs BFS, DFS, Greedy Best First Search, Dijkstra, and A* on fixed test graphs.                           | These are the main algorithms I want to teach, so the program must implement them correctly.                            | Features of Proposed solution |
| FR4             | Step through the algorithm                    | The user can step forwards and backwards through the algorithm one step at a time.                                              | This helps the user follow the algorithm carefully and create a trace table if needed.                                  | Features of Proposed solution |
| FR5             | Auto-play the full algorithm                  | The user can auto-play the whole algorithm from start to finish.                                                                | This gives the user a quicker way to watch the full process and compare it with manual step-by-step control.            | Features of Proposed solution |
| FR6             | Show the algorithm state                      | The simulation shows the current node, explored nodes, frontier nodes, and final path using distinct visual changes.            | The user needs to be able to tell the state of the algorithm apart while it is running.                                 | Features of Proposed solution |
| FR7             | Explain each step                             | The simulation gives a text explanation of what is happening at each step.                                                      | The visual changes alone may not be enough for a new user to understand the algorithm.                                  | Features of Proposed solution |
| FR8             | Show unsolvable graphs                        | The simulation shows when a graph cannot be solved by ending safely and displaying that no path was found.                      | Some generated graphs may not contain a valid path, so the user should not be misled.                                   | Limitations of Solution       |
| FR9             | Show visit order with the ship                | The ship animation shows the order in which the algorithm visits and backtracks between nodes.                                  | This makes the search order easier to follow and helps the user understand what the algorithm is doing.                 | Features of Proposed solution |
| FR10            | Avoid crossing lines                          | Graphs should not be rendered with lines crossing each other where possible.                                                    | Crossing lines make the graph harder to read and can confuse the user when following the algorithm.                     | Features of Proposed solution |
| **Performance** |                                               |                                                                                                                                 |                                                                                                                         |                               |
| PR1             | No crashes                                    | The app does not crash during normal use or robustness testing.                                                                 | Crashes would interrupt learning and make the program unreliable to use in a lesson.                                    | Other Requirements            |
| PR2             | Quick response                                | On the tested devices, the app updates without noticeable delay when the user changes the graph or uses the algorithm controls. | Delays would make the simulator frustrating to use and would weaken the learning experience.                            | System Requirements           |
| PR3             | Prevent invalid graph setups                  | The app checks inputs and prevents invalid graph setups.                                                                        | Validation is needed so the program stays in a valid state and the user cannot accidentally create a broken simulation. | Other Requirements            |
| PR4             | No misleading algorithm results               | The algorithms do not give incorrect or misleading results on the fixed test graphs.                                            | As this is an educational tool, the algorithms must behave correctly and not teach the user the wrong thing.            | Information/Teaching          |
| **Usability**   |                                               |                                                                                                                                 |                                                                                                                         |                               |
| UR1             | Readable on tested devices                    | Most stakeholder testers can read and use the main screens properly on the tested iPad and Mac screen sizes.                    | The app should work well on the devices most likely to be used by my stakeholders.                                      | Client Questionnaire          |
| UR2             | Easy to navigate                              | Most stakeholder testers can move between the main screens without help.                                                        | The user should be able to find the main parts of the app easily instead of wasting time looking for them.              | Usability Requirements        |
| UR3             | Help users understand the algorithm           | Most stakeholder testers say the step-by-step simulation helped them understand what the algorithm was doing.                   | The main purpose of the app is to make graph algorithms easier to understand.                                           | Client Questionnaire          |
| UR4             | Help users compare algorithms                 | Most stakeholder testers can explain at least one difference between two of the algorithms after using the app.                 | The app should help users understand that the algorithms behave differently, not just show them as animations.          | Problem Recognition           |
| UR5             | Explain the Frontier and Explored boxes       | Most stakeholder testers can explain what the Frontier and Explored boxes mean.                                                 | These boxes are a key part of the simulation, so users need to understand them for the app to teach effectively.        | Features of Proposed solution |
| UR6             | Use an engaging space theme                   | Most stakeholder testers say the space theme is engaging and suitable for the target audience.                                  | The theme is an important part of making the app feel more appealing and less dry than a standard graph simulator.      | Client Questionnaire          |


<div style="page-break-before: always;"></div>

## Design

Using the requirements, stakeholder feedback, and success criteria from the analysis, I then designed the structure of the system before implementation.

### Problem Decomposition
I have broken down my problem into the following subcomponents. When developing I will do sprints for each of these components. At a very high level, these are the six subcomponents I am going to divide the problem into:

```mermaid
flowchart LR
    Program["Program"]

    subgraph Row1[" "]
        direction LR
        GraphGeneration["Graph Generation"]
        GraphRendering["Graph Rendering"]
    end

    subgraph Row2[" "]
        direction LR
        AlgorithmControl["Algorithm Control"]
        AlgorithmSolving["Algorithm Solving"]

    end

    subgraph Row3[" "]
        direction LR
        AlgorithmVisualisation["Algorithm Visualisation"]
        UserInterface["User Interface"]
    end
    
    Program --> GraphGeneration
    Program --> GraphRendering
    Program --> AlgorithmSolving
    Program --> AlgorithmControl
    Program --> AlgorithmVisualisation
    Program --> UserInterface
```

* **Graph generation** : This generates a random graph of planets for algorithms to solve
* **Graph rendering** : this will be a UI component that will show the graph visually as planets in a galaxy
* **Algorithm Solving** : this will implement all the Graph Traversal algorithms from A Level Computer Science
* **Algorithm Control** : this will store the state of an algorithm to allow users to step back and forwards through the solution
* **Algorithm Visualisation** : this is add more information to the graph rendering interface to show progress through the algorithm
* **User Interface** : this is how the user interacts with the app and navigates between the screens

Here is an in depth summary of the inputs, outputs, preconditions with suitable validation and error handling for the main components of my solution. I have also listed which of my success criteria belong in each subcomponent. The only exception is PR1 (No crashes), which affects the whole program rather than one specific subcomponent because any part of the system could cause the app to crash.

<div style="page-break-before: always;"></div>
#### Subcomponent One : Graph generation
##### Description
Generates an undirected graph that the algorithms can operate on and the spaceship can move between. Each node will be a planet in the graph which knows its neighbours. I will start more simply by using an unweighted graph, or all the weights equal to one, and then add weights later for necessary algorithms. To keep with the analogy I will call the weights fuel needed. This will also include choosing a start planet and an end planet. The graph does not necessarily have to be solvable.

##### Inputs

| Input                     | Type                                                                                                                                                       |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Number of Planets         | This is an integer which specifies the number of planets in the graph. I will do the necessary validation to make sure this number is in the correct range |
| Maximum Connection Length | This will be a integer which will be the maximum distance two nodes can be connected by                                                                    |

##### Outputs
A Graph Object with connected nodes or planets. The nodes themselves should also be objects. The graph object should control the nodes in the graph.
##### Validation
Before using the inputs I need to check they are reasonable. There must be at least two planets and up to a sensible limit roughly around 10, but this will be finalised in development when I can test and visualise to choose the suitable count. The start and end planets should not be the same planet as the graph would already be solved, and the graph should not be within less than 3 steps of completion so runs do not end instantly. Planets should not be too close to each other or go on top of each other, as this will confuse the user.
##### Related Success Criteria

| ID   | Criteria                     | Why this subcomponent supports it                                                                |
| ---- | ---------------------------- | ------------------------------------------------------------------------------------------------ |
| FR1  | Generate a graph             | This subcomponent is responsible for generating the graph the user will work with.               |
| FR8  | Show unsolvable graphs       | It can produce graphs that are unsolvable, so it must support ending safely and showing that no path was found. |
| FR10 | Avoid crossing lines         | The generation logic should try to avoid creating graphs with crossing edges.                    |
| PR3  | Prevent invalid graph setups | It must validate inputs and avoid invalid graph setups such as impossible start and end choices. |

<div style="page-break-before: always;"></div>

#### Subcomponent Two : Graph Rendering
##### Description
Now that I have a graph which are nodes that store their positions and know their neighbours I need a way to visualise them The first part of this is to add circles to the correct coordinates and lines showing the connections for edges.

The graph also needs to give an interface that allows external classes to access the colours of nodes and edges as well as other effects and information about the node. This will mean that when writing the algorithm it will be easy to change the visuals for the user.
##### Inputs
A graph data structure that stores nodes and edges and can provide information about neighbours
##### Outputs
A visual display of the graph that appears like planets in a galaxy with lines showing the edges. All text labels should be readable. This graph should be able to change using code so it can also be used as a tool to display what is happening during the graph traversal.
##### Validation
The nodes and edges in the graph are in valid locations and are linked correctly. The graph rendering will assume that the graph is valid and will render even if nodes are in incorrect locations. Lines should not cross each other.

##### Related Success Criteria

| ID  | Criteria                  | Why this subcomponent supports it |
| --- | ------------------------- | --------------------------------- |
| FR6 | Show the algorithm state  | It is responsible for displaying nodes, edges, and the final path using distinct visual changes. |
| FR10 | Avoid crossing lines     | If crossing lines are left in the graph, the rendered graph becomes harder to understand. |
| UR1 | Readable on tested devices | The graph display must remain easy for most stakeholder testers to read and use on the tested devices. |

<div style="page-break-before: always;"></div>

#### Subcomponent Three : Algorithm Solving
##### Description
I will make a simple graph traversal algorithm such as Breadth First Search and Depth First Search to traverse the graph and find a path from the start to the finish. It will record necessary data such as the queue or stack of nodes to visit next as well as the visited nodes.

I plan to then implement the rest of the algorithms in the A Level specification including Dijkstra and A* using a heuristic of distance to the target. I will not have a UI at this stage but plan to visualise data in the console or debugger.
##### Inputs
A graph and a chosen algorithm
##### Outputs
A solved graph storing the backtrace path taken to get from start to finish it should also be able to report if it is solvable
##### Validation
There should be a start and and end node and an algorithm to use needs to be selected

##### Related Success Criteria

| ID  | Criteria                      | Why this subcomponent supports it |
| --- | ----------------------------- | --------------------------------- |
| FR3 | Simulate the algorithms       | This is where the search algorithms themselves are implemented and solved. |
| FR8 | Show unsolvable graphs        | It must detect when no valid path exists, end safely, and report that no path was found. |
| PR4 | No misleading algorithm results | The correctness of the algorithms depends on this subcomponent. |
<div style="page-break-before: always;"></div>



#### Subcomponent Four : Algorithm Control
##### Description
The first part of the problem is just solving the algorithm instantly however I want the user to see each stage of the solving along with the state of the variables being used at this time. The user should be able to easily use this to make a trace table for the solving of the algorithm. This is because this is meant to be a learning tool not just a graph solver. The user should also have the ability to undo and redo.
##### Inputs
Graph Algorithm
##### Outputs
Step by step state of graph algorithm
##### Validation
Not Undo at the first stage and redo at the last stage.

##### Related Success Criteria

| ID  | Criteria                     | Why this subcomponent supports it                                                           |
| --- | ---------------------------- | ------------------------------------------------------------------------------------------- |
| FR4 | Step through the algorithm   | It allows the user to move forwards and backwards through the algorithm one step at a time. |
| FR5 | Auto-play the full algorithm | It controls the automatic playback of the whole algorithm.                                  |
| PR2 | Quick response               | The controls need to update without noticeable delay when the user interacts with them.     |

<div style="page-break-before: always;"></div>

#### Subcomponent Five : Algorithm Visualisation
##### Description
Now that I have data for all the states of the algorithm I need to be able to display it to the user. In this section I will heavily use the interface I created for the graph changing colors. I will also create lists and other UI elements to help display algorithm state and other factors. I am also going to add a spaceship that shows the current node.
##### Inputs
A graph that provides an interface for changing visuals, together with the `AlgorithmState`.
##### Outputs
A visual display of the state of the algorithm
##### Validation
This component will be built on top of the graph which has lots of validataion to check it is correctly genarated. Therefore I can trust the inputs and operate on them without having to revalidate.

##### Related Success Criteria

| ID  | Criteria                                | Why this subcomponent supports it                                                                |
| --- | --------------------------------------- | ------------------------------------------------------------------------------------------------ |
| FR6 | Show the algorithm state                | It shows the algorithm state such as the current node, explored nodes, frontier, and final path using distinct visual changes. |
| FR7 | Explain each step                       | It displays the text explanations for what is happening at each step.                            |
| FR9 | Show visit order with the ship          | It includes the ship movement that shows visit order and backtracking.                           |
| UR3 | Help users understand the algorithm     | The step-by-step visualisation should help users understand the algorithm.                       |
| UR5 | Explain the Frontier and Explored boxes | It contains the Frontier and Explored boxes that users need to understand.                       |

<div style="page-break-before: always;"></div>


#### Subcomponent Six : User Interface
##### Description
This component is not to do with the main program but is about the app as a whole. I want an easily navigable UI that will show all the different screens and should be intuitive to use. This is not just putting the screens together but also covers the creation of these UI elements. I am going to use reusable components which will save time in development, increase performance and create a consistent user interface.
##### Inputs
This kind of input is passed from the user not other components of the program. Examples are just UI elements such as:
* Buttons that the user can press.
* Menus the user can select.
##### Outputs
Again these include outputs to the user and also converts the inputs to outputs to the rest of the program.
* Give a visual interface of the program.
* Affect program when buttons are pressed or items are selected by calling functions or updating variables.
##### Validation
The views should only allow for valid inputs such as selecting objects that exist or numbers in a correct range.
##### Related Success Criteria

| ID  | Criteria                                      | Why this subcomponent supports it                                                                          |
| --- | --------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| FR2 | Teach what graphs and algorithms are used for | The user interface includes the information page about graphs and algorithms.                              |
| UR1 | Readable on tested devices                    | The screens need to be easy for most stakeholder testers to read and use on the tested devices.           |
| UR2 | Easy to navigate                              | Navigation between the main screens is handled by this part of the solution.                               |
| UR4 | Help users compare algorithms                 | The interface allows the user to choose algorithms and view information pages that help them compare them. |
| UR6 | Use an engaging space theme                   | The overall look and feel of the app, including the space theme, should be engaging and suitable for the target audience. |

<div style="page-break-before: always;"></div>

### System Overview / Architecture

#### Model View Controller
I will use the Model View Controller design pattern to separate the components of my app. This allows me to separate the functionality into three main components.

I will explain the three components at a lower level next but at a high level:
* The Model is a collection of objects that encapsulates the data of the app
* The View is the user interface 
* The Controller ties the Model and the View together

#### Model (Data Structures)
I am going to keep the data in the Models. This will ensure there is a single source of truth which ensures consistency of data. I am going to use an Observable Object which is a *"A type of object with a publisher that emits before the object has changed."* This means when changing the objects properties it will update any views using the data.

The Models include :
* Graph Generation
* Algorithm Solving
* Algorithm Control

#### View (User Interface)
The View provides a GUI for the user to see and interact with the program.

For this I will need to use a graphics library. I am going to be using two, SpriteKit and SwiftUI. SpriteKit will be used for the areas where I need more control such as drawing graphs and custom animations. SwiftUI is going to be used for the overall adaptive app UI and navigation between screens.
##### SpriteKit 
> SpriteKit is a general-purpose framework for drawing shapes, particles, text, images, and video in two dimensions.

SpriteKit is imperative so I have control over exactly what is being rendered. It has a 2D coordinate system and allows me to place nodes in precise positions and draw shapes. This is important as I have control so I can draw graphs exactly how I want.
It is a game engine that uses Apple's Metal framework which will mean high performance rendering.

##### SwiftUI
> SwiftUI is a declarative framework for building user interfaces for iOS, iPadOS, watchOS, tvOS, visionOS and macOS, developed by Apple Inc.

Declarative programming languages are higher level than imperative so they use abstraction and I do not need to worry about the low-level details of how the UI is created. This will mean that my UI will adapt to all screen sizes with little effort! This is because I define what I want the UI to look like and it will generate it so it is not generated with a particular screen size in mind.

#### Controller (Program Logic)

The controller, while not included directly in the subcomponents, is still a large section of the program. It provides a bridge between the Models and the Views and is essential for the program to run. I am going to use a SwiftUI observable object, which is an object that will notify and update observers when it changes.

This diagram shows the main flow of data for one user action in the finished program:

```mermaid
flowchart TD
    A["User presses a control in SwiftUI"]
    B["Controller updates state"]
    C["BaseSearch / Galaxy model changes"]
    D["AlgorithmState is updated"]

    subgraph Outputs[" "]
        direction LR
        E["SpriteKit graph redraws highlights and ship"]
        F["SwiftUI lists and explanation boxes refresh"]
    end

    G["User sees the new step"]

    A --> B
    B --> C
    C --> D
    D --> E
    D --> F
    E --> G
    F --> G
```

### Implementation of Subcomponents

#### Subcomponent One : Graph generation : Model

<p align="center"><img src="./sketches/sketch_generator.jpeg" alt="Graph Generation Sketch" width="75%"></p>
As this is not to do with the graphics I do not need to use any graphics libraries however It will use coordinates. This will be provided to the graph rendering component which will use SpriteKit to render it.

I decided that the graphs I use are going to be undirected, meaning there are no one-way relationships between nodes. I think this is simpler for someone new to graphs. The graphs are going to be weighted, however, as algorithms like Dijkstra and A* are more suitable for weighted graphs. My graphs are not required to be fully connected, so it is possible that the graphs are unsolvable. I think this is important because it exposes the user to the case where an algorithm finishes without finding a path to the target node.

I need to create some algorithm that I use to generate a 2D graph that fits the requirements:
* The nodes should not be too close or on top of each other
* The nodes are distributed roughly evenly but still look random.
* Most graphs created should be solvable
* The connected nodes should be based on the distance between the nodes.

#### Subcomponent Two : Graph rendering : View
<p align="center"><img src="./sketches/sketch_visualise.jpeg" alt="Graph Rendering Sketch" width="75%"></p>
For rendering the graph I am going to use SpriteKit. This is because I can draw exact shapes of planets and lines. I will have precise control over what I am doing.
##### Planets/Nodes
The planets are going to be rendered using filled circles which are randomly selected from the planets. They will have a custom border whose color can be changed. The planets will have labels below them which should be readable. These will be used to show the name of which planet it is as the names will be used in other places.
##### Edges/Paths
The edges will be represented by lines. There should be a text box on the lines which will be used to represent the weight. This should also be readable and the graph rendering is not responsible for what is in the text box, it just needs to be able to be changed.

#### Subcomponent Three : Algorithm Solving : Model

For the search algorithms I realised they are not that different from each other. They all have a list of nodes to visit and the nodes they have visited. The only difference is the order they are visited in and whether they use a heuristic.

##### General Search
I will implement a general search class that the other algorithms will inherit from this will have the core functionality that all the search algorithms require. The way these search algorithms work is:

1. They have a (priority) queue/stack to decide what is the next node to visit and visit that node.
2. They add this node to a visited list so the algorithm knows not to return.
3. They check if they are on the target node, if so then they have found the target and the search has been completed.
4. If not they see which nodes are connected to the current node and add them to the queue/stack, first checking if they are not there already using the list of already visited nodes
5. Then continue back to step 1 until the target node is found or the nodes to visit list is empty which means that the node could not be found. (Maybe the start and end are not connected)

##### Breadth First Search (BFS)
Breadth First Search uses a standard First In First Out queue. This will provide a broad search so will go to the nodes closer before going to further away nodes

##### Depth First Search (DFS)
Depth First Search uses a Last In First Out stack. This will provide a deep search that will go until it hits a dead end then backtrack. I am using a Pre-Order Traversal so it will start at the root then go left then right.

##### Dijkstra's shortest path
Dijkstra uses a priority queue. The condition is that the selected node is the node with the current shortest distance to reach. This ensures it will not go to a node until there are no other nodes that are closer. This guarantees that there will be no shorter path to the next node through other nodes. Assuming there are no negative weights, this will always return the shortest path.

##### A* shortest path
A* uses a priority queue based on a combination of the current path cost and a heuristic. The heuristic that I am going to use is the distance as the crow flies to the target node from the current node.

##### Greedy Best First Search (Bonus)
When researching the algorithms I found there was one more algorithm that would complete the program. Although Greedy Best First Search is not in the A-Level spec, it has the same core idea as the others because it also uses a priority queue.

#### Subcomponent Four : Algorithm Control : Model


##### Solving Step By Step
When writing these algorithms normally, as described previously in algorithm solving, they use iteration or recursion. This means that local variables are created in loops or functions and are overridden on each iteration, so they do not persist in memory. If I want to run the algorithm step by step so the user can view it, the options are:

| **Method**                                                                                                                                               | **Benefit**                                                                                                                                                                        | **Drawback**                                                                                                     |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Pausing the execution in the loop waiting for user input before continuing                                                                               | Relatively easy to implement                                                                                                                                                       | The algorithm code would need to be run in a separate thread so it does not pause execution of the main program. |
| Storing state of the variables externally so they persist in memory so I can jump to certain steps without having to rerun the algorithm from the start. | I need to make a data structure to store the state of the algorithm and write other functionality to use this data structure to step forward and back or to steps in the algorithm | I am storing additional data for every step in the algorithm.                                                    |

I am going to go with the 2nd choice as I believe the ability to undo, redo, and move to certain steps is important.

One thing worth mentioning about this decision is that running these search algorithms is not computationally expensive, especially as I would do it on input, so running it every time on user input is not actually a major problem. Running it once compared to 10 times will have almost zero effect on performance. It is likely the processes rendering the graphics are more expensive than these algorithms. Although this is also likely not expensive as I am keeping it simple to allow it to run on low-end or old hardware.

##### Example of Step by step running
When testing running the algorithm step by step I wanted to make sure it was done correctly. I solved a simple graph I made on paper and then i made it in the simulation. This is an example with BFS of how I want the algorithms to be visualised, with the stacks on the side.

<p align="center"><img src="./sketches/sketch_algorithms.jpeg" alt="Algorithms Sketch" width="75%"></p>
##### Undo/Redo Stack
One of my requirements is that the user should be able to replay the steps of the algorithm Another requirement is that my program is efficient to optimise performance on less powerful devices. To implement this I am going to use a stack that stores the state.

I will create a data structure that saves the state of the algorithm. When moving forwards a step I will push the important data of the algorithm's state onto a stack. When undoing a step I will pop the top of the stack and restore the previous state.

However, for this I need to recalculate the steps when going forwards but not backwards. To fix this I could make another stack that stores the next instructions. Together, these two stacks and the current state would store all the possible states of the algorithm. When moving forwards I would pop the current state from the forwards stack, and when going backwards I would push the current state on the forwards stack.

This would mean I calculate all the possible states at the start and the algorithms do not need to be run every step.

#### Subcomponent Five : Algorithm Visualisation : View
This component is very important because it displays the progress of the algorithm to the user. This needs to be done well as it is the main purpose of the program.

<p align="center"><img src="./sketches/sketch_solver.jpeg" alt="Solver Sketch" width="75%"></p>


##### Spaceship
The spaceship is going to be the object that traverses the graph. It will place emphasis on the current node being visited. I am going to use SpriteKit's `SKSpriteNode`, which allows me to put 2D textures on an object. I am going to use AI-generated 2D sprites as this will not be time consuming and will be easy to implement while also providing an appealing aesthetic.

##### Frontier and Explored Lists
As well as UI elements it is important to show text-based information. I want to show the lists of nodes that have been visited and are next to be visited.

The list of nodes to visit is the frontier. This is the queue/stack/priority queue that the algorithm uses to select the next node to visit. The list of visited node is the visited. This is a list of the nodes that have already been visited. I could add information next to these about the weight to get to it so far or the node it came from for more information.
##### Explanation Boxes
To tie all the Visualisation together I am going to have a text box. This will explain what is happening in each of the steps of the algorithm. It will say what the algorithm is actually doing while it is happening to help the user understand. I will pre-make a selection of strings that allow me to insert specific information in the correct location, such as the node name. I will also give the user the ability to swap between Space Explanations, which use space vocabulary to increase engagement, and more technically accurate Graph Explanations, which use words like graph, node, and edge.

##### Planet and Path Colouring
As the user is looking at the graph for most of their time using the program, the graph should also show the state of the algorithm. These will be the same colours as I used for the frontier and visited lists. I am going to highlight different nodes and colour-code them based on their significance. I am going to do this using the graph's interface that I will create.

#### Subcomponent Six : User Interface : View

All of the User Interface is going to be made with SwiftUI.
##### Adaptability
The user interface needs to be able to adapt to different screen sizes. Although iPads are all the same 4:3 aspect ratio they can be rotated to portrait and my app still needs to work. It should also work on Macs, iPhones and headsets. If it is windowed the size should adapt similarly to a web page. I therefore should make sure my app can adjust the size and locations of UI elements to fit and not obscure the screen.
##### Validation of input data

##### Navigation
As I am going to allow the user to navigate around different views, I am going to use SwiftUI's `NavigationStack` for this. As I want to have control and stylise my app, I am not going to be using Apple's built-in components and will heavily customise them.

These screens should include:
* Menu (for selection)
* Settings (changing preferences for the user such as ship speed, space/graph descriptions, and planet names. I will use a SwiftUI element called a sheet, which will provide a semi-transparent popup overlay to allow the user to see the content while changing the settings)
* How to use (explains how to use the program)
* About Graphs/Algorithms (Teaches the user about graphs using a text page (not the simulation)
* Graph/Galaxy Builder (Allows the user to create/select/generate graph)
* Simulation (where the program performs the graph traversal algorithms on the generated graph)

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

<p align="center"><img src="./sketches/sketch_main.jpeg" alt="Main Menu Sketch" width="75%"></p>
##### About Graphs/Algorithms
This is going to be a scrollable text screen that will tell the user about the algorithms. It is also going to contain images and tables to compare the algorithms, as they are not too different from one another.

<p align="center"><img src="./sketches/sketch_about.jpeg" alt="About Page Sketch" width="75%"></p>
I will add more text and information describing each algorithm individually.
##### How to use screen
Like the about screen this is going to be a scrollable screen with not much interaction. The objectives of this screen are:
* Explain the meaning of the highlight colours on the nodes.
* Show what all the buttons on the program do to control the algorithm.
* Explain what each of the lists is representing in relation to the algorithm, for example whether it is a stack or queue, showing how I will link the colours.
* Show the user how to select the different algorithms.

##### Settings View
This is not so much going to be a separate screen but will be placed on top of the current view. This will always be the galaxy builder or simulation as it is only accessible via these pages. I am going to use a SwiftUI element called a sheet which allows me to overlay the settings view on top of the current view. This will allow me to keep the background visible while changing settings so the context of the graph is not lost.

<p align="center"><img src="./sketches/sketch_settings.jpeg" alt="Settings Sketch" width="75%"></p>
This is what the sheet will look like. I will put the controls inside the sheet.
##### Graph Generation
This will contain the SpriteKit View. Here the nodes will not be coloured, excluding colouring that indicates the start and end. This is because the algorithm is not currently being run. The SwiftUI controls will mostly be inputs such as buttons and sliders. There will be the controls for generating the graph and choosing the search algorithm for example:
* Selecting the algorithm
* Regenerating Graph
* Changing the number of planets in the graph
* Changing The maximum node connection

##### Simulation
This will contain the SpriteKit View which will include a ship and necessary highlight colours depending on the state of the algorithm.

The SwiftUI controls will be mostly output-based:
* List of Frontier nodes and visited nodes
* Explanation Boxes explaining the steps of the algorithms.

<div style="page-break-before: always;"></div>

## Development

After planning the system in the design section, I implemented the solution in stages. I kept the same six-subcomponent structure so it was easier to build, test, and explain each part.

### Object Model

There is a series of objects that rely on each other in the program which work together to implement all the subcomponents.
* The Galaxy is the graph that stores the nodes. It will be created in graph generation and visualised in graph visualisation.
* The Builder is the object that generates the galaxy graph. These will be classes with static methods to return a generated graph. This will be covered in the graph generation subcomponents.
* The planet is a single node in the graph so will sit under 
* The Ship is a pointer to the current node to highlight which node is currently being visited. It is the object that will traverse the graph moving between nodes and exploring This will be a part of algorithm control and algorithm visualisation.
* Traversable is a protocol that the graph algorithm operates on. This means that the algorithm can operate on any graph that follows this protocol which doesn't need to be a planet.
* The algorithm class will contain the logic of all the implemented graph algorithms. I will use inheritance to implement the core shared functionality of these algorithms.

Here is an Entity Relationship diagram of the components:
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

This diagram shows the final file structure of the project and how I separated all of the Swift code into Model, View and Controller sections. The Controller is only one file. The models contain the Galaxy and Planet, as well as all the Builder and Pathing code. The View is split into SpriteKit and SwiftUI. This structure developed iteratively as I built and refined the project, which can be seen in the commit history.

```mermaid
flowchart LR
    Root["PlanetPathingSim.swiftpm"]

    Root --> Model["Model"]
    Root --> View["View"]
    Root --> Controller["Controller"]

    Model --> Galaxy["Galaxy.swift"]
    Model --> Planet["Planet.swift"]
    Model --> Builders["Builders"]
    Model --> Pathing["Pathing"]

    Builders --> BuilderBase["GalaxyBuilder.swift"]
    Builders --> BuilderRandom["RandomGalaxyBuilder.swift"]
    Builders --> BuilderSquare["SquareGalaxyBuilder.swift"]
    Builders --> BuilderTree["TreeGalaxyBuilder.swift"]

    Pathing --> Traversable["Traversable.swift"]
    Pathing --> Explanations["SpaceExplanations.swift"]
    Pathing --> Algorithms["Algorithms"]

    Algorithms --> BFS["BreadthFirst.swift"]
    Algorithms --> DFS["DepthFirst.swift"]
    Algorithms --> Dijkstra["Dijkstra.swift"]
    Algorithms --> Greedy["GreedyBestFirst.swift"]
    Algorithms --> AStar["A-Star.swift"]
    Algorithms --> SearchBase["SearchAlgorithms.swift"]

    View --> SwiftUI["SwiftUI"]
    View --> SpriteKit["SpriteKit"]

    SwiftUI --> ContentView["ContentView.swift"]
    SwiftUI --> HomeView["HomeView.swift"]
    SwiftUI --> InstructionsView["InstructionsView.swift"]
    SwiftUI --> AboutView["AboutView.swift"]
    SwiftUI --> AlgorithmsView["AlgorithmsView.swift"]
    SwiftUI --> HUDView["HUDView"]
    SwiftUI --> SpaceElements["SpaceElements"]

    SpriteKit --> MainScene["MainScene.swift"]
    SpriteKit --> DrawHelper["DrawHelper.swift"]
    SpriteKit --> Actions["Actions.swift"]
    SpriteKit --> SKNodes["SKNodes"]

    Controller --> GameController["GameController.swift"]
```


<div style="page-break-before: always;"></div>

### Stage One : Random Galaxy Generation

I developed the galaxy generation and rendering in parallel because it meant I could immediately visualise what was being done, which was important for checking whether I was doing it correctly.
#### Generation

My first task was to randomly generate a graph or galaxy. This would consist of nodes or planets and edges which connect the paths.

* My objective was that each galaxy should feel random and different.
* You should have some control over the graph structure without having to micromanage nodes
* Select the number of nodes in the graph and the lengths of paths
* The graph should look visually appealing and look like a galaxy

If the graph generation parameter ***number of planets*** changed, I immediately regenerate the entire graph and recalculate the path. However, if the ***max connection length*** changed I only recalculate the paths but leave the planets as they were. This allows the user to slide the max length and see how the paths work.

I started by using a nested `for` loop to create a square grid of possible positions for a planet and I added these to an array. I then needed to select a fixed number of positions from this list. To do this I randomised the order of the options array and selected the first `planetCount` positions.

I then added a small random offset to each selected position so the planets did not sit in a perfectly regular grid. This kept a minimum spacing between planets while still making the galaxy feel more natural. After generating the planets, the next stage was to calculate which planets should be connected based on distance and then remove bad-looking edge intersections.

This part of the generator is quite efficient for the size of graphs I use. Shuffling and sorting  positions or paths is fast enough for small (less than 100 node) graphs, and I accepted the more expensive intersection checks because they greatly improved the look of the final graph.

This flowchart summarises the main stages of the random galaxy generation process:

```mermaid
flowchart TD
    A["Create position grid"]

    subgraph Setup["Planet setup"]
        direction LR
        B["Shuffle positions"]
        C["Select first n"]
        D["Add random jitter"]
    end

    subgraph Paths["Path building"]
        direction LR
        E["Create candidate paths"]
        F["Sort paths by distance"]
        G["Remove intersecting paths"]
    end

    subgraph Finish["Finish"]
        direction LR
        H["Choose start and end"]
        I["Return galaxy"]
    end

    A --> B
    A --> C
    B --> D
    C --> D
    D --> E
    E --> F
    E --> G
    F --> H
    G --> H
    H --> I
```

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

Later in development, after stakeholder feedback and me trying to test the algorithms, I also introduced subclasses for fixed test graphs so I could swap between random generation and known graphs for testing. Initially I only planned to have the random galaxies. The class hierarchy looked like this once I introduce the new Galaxy Builder - TreeGalaxyBuilder and SquareGalaxyBuilder.

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
#### Check Lines
After creating the random galaxy generator I realised there were lots of intersections of edges in the graph. Some edges went through planets. This looked ugly and could be confusing to the user.

In order to delete edges I needed to decide which edges to remove. I decided to keep the shorter edges and remove the longer edges that intersect with the shorter edges.

I used a closure with the sorted to compare which is the shorter edge. I am using a built in sort function for efficiency
```swift
// Example of comparator implemented as a closure
let sortedPaths = potentialPaths.sorted {
    return $0.distance<$1.distance
}
```

To fix the Lines going through planets  I thought of putting edges across the planet nodes. This meant that when an edge passed through a planet it would be deleted. However when developing this I encountered a bug that caused all edges to collide. This was because the start and end points of the lines were the exact center point of the planets. The fix to this was to put 4 lines from the centre of the planet to the circumference so no lines actually pass through the center, only started on it. The algorithm does not treat lines that start at the same point as a collision.

Here is a diagram of the four checklines on a Planet Node showing how any line through the planet will collide.

<p align="center"><img src="./sketches/Checklines diagram.png" alt="Checklines diagram" width="456"></p>

Here is the function on the planet that returns an array of four checklines for a planet:

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
To check if two lines intersect I did some research online and found an algorithm that uses orientation to check if two lines intersect. I used an article from GeeksforGeeks to help understand the concepts before implementing it.

Before writing the Swift code, I first planned the logic in pseudocode:

```text
FUNCTION linesIntersect(p1, q1, p2, q2)
    // p1 to q1 is the first line
    // p2 to q2 is the second line

    IF the two lines share an endpoint
        RETURN false

    // Work out which side of the first line the two points
    // from the second line are on
    o1 = orientation(p1, q1, p2)
    o2 = orientation(p1, q1, q2)

    // Work out which side of the second line the two points
    // from the first line are on
    o3 = orientation(p2, q2, p1)
    o4 = orientation(p2, q2, q1)

    // If the two points from one line are on different sides
    // of the other line, and vice versa, then the lines cross
    IF o1 is different from o2 AND o3 is different from o4
        RETURN true
    ELSE
        RETURN false
END FUNCTION

FUNCTION orientation(a, b, c)
    // Look at the direction of the turn when moving
    // from point a to point b to point c
    // This tells us whether c is to one side of the line ab
    // or the other side
    value = sign of the cross product of a, b and c

    IF value is positive
        RETURN clockwise
    ELSE
        RETURN anticlockwise
END FUNCTION
```

To determine the orientation of a line I used the sign of the cross product. Here is the code I used to check two lines intersect:
```swift
func checkIntersections(p1: CGPoint, q1: CGPoint, p2: CGPoint, q2: CGPoint) -> Bool {
    func orientation(_ a: CGPoint, _ b: CGPoint, _ c: CGPoint) -> Int {
        let val = (b.y - a.y) * (c.x - b.x) - (b.x - a.x) * (c.y - b.y)
        return (val > 0) ? 1 : -1
    }
    // We don't want lines that touch to count or the planet checklines always make collisions
    if p1 == q1 || p1 == q2 || p2 == q1 || p2 == q2{
        return false
    }
    let o1 = orientation(p1, q1, p2)
    let o2 = orientation(p1, q1, q2)
    let o3 = orientation(p2, q2, p1)
    let o4 = orientation(p2, q2, q1)
    
    return (o1 != o2) && (o3 != o4)
}
```

This works because the orientation (which is the direction we travel to visit the three points) tells me which side of a line another point is on. If the two points from one line are on different sides of the other line, and the same is also true the other way round, then the two lines must cross. I also added a small check to ignore lines that share an endpoint, because graph edges meeting at a node should not count as an intersection.

#### Test Galaxy Builders

These galaxies were not random but designed so that I could test on known graphs with known results. I only decided to make them when I started testing the algorithms as they were more predictable.

The square and tree galaxy builder let me create the same fixed graph every time, which was useful when comparing how the different algorithms behaved on exactly the same layout and weights. The code below shows how I just give it the positions of the planets and the paths between them. This also gives you a better idea of the kind of objects that the random builder generates. I used ChatGPT to generate the lines that start "let PA" etc by passing it all the x,y coordinates.

```swift
class SquareGalaxyBuilder : GalaxyBuilder {
  
    override class func createPlanets(planetCount: Int, spacing : Double = 100, mapSize : Double = 1000)->[Planet]{
        
        var planetNamesShuffled = planetNames.shuffled()

        let PA = Planet(position: CGPoint(x:-200,y:200), name: planetNamesShuffled.removeFirst())        
        let PB = Planet(position: CGPoint(x:0,y:200), name: planetNamesShuffled.removeFirst())
        let PC = Planet(position: CGPoint(x:-100,y:000), name: planetNamesShuffled.removeFirst())
        let PD = Planet(position: CGPoint(x:100,y:000), name: planetNamesShuffled.removeFirst())
        let PE = Planet(position: CGPoint(x:200,y:200), name: planetNamesShuffled.removeFirst())
        let PF = Planet(position: CGPoint(x:200,y:000), name: planetNamesShuffled.removeFirst())
        let PG = Planet(position: CGPoint(x:0,y:-100), name: planetNamesShuffled.removeFirst())
        let PH = Planet(position: CGPoint(x:0,y:-200), name: planetNamesShuffled.removeFirst())
        let PX = Planet(position: CGPoint(x:-200,y:0), name: planetNamesShuffled.removeFirst()) 
        let PY = Planet(position: CGPoint(x:-200,y:-200), name: planetNamesShuffled.removeFirst())
        let PI = Planet(position: CGPoint(x:200,y:-200), name: planetNamesShuffled.removeFirst())
        
        return [PA, PB, PC, PD, PE, PF, PG, PH, PX, PY, PI]
    }
    
    override class func calculatePlanetPaths(planets : [Planet], maxDistance : CGFloat)->[(start : Planet, end : Planet, distance : Double)]{
        return [
            (planets[0], planets[1],1),
            (planets[1], planets[4],4),
            (planets[0], planets[2],3),
            (planets[1], planets[3],2),
            (planets[4], planets[5],1),
            (planets[2], planets[3],1),
            (planets[3], planets[5],5),
            (planets[2], planets[6],7),
            (planets[5], planets[10],2),
            (planets[6], planets[7],7),
            (planets[7], planets[10],2),
            (planets[0], planets[8],10),
            (planets[8], planets[7],10),
            (planets[8], planets[9],2),
            (planets[9], planets[7],2)
        ]
    }
}
```

This was especially useful for the weighted shortest path algorithms, because I could choose exact weights that made Dijkstra and A* behave differently and then check that the program matched my expected result.

### Stage Two : Galaxy Rendering
#### Procedural Planet appearance

Each planet has a border which is used to indicate the information about the planet. Inside the border there is a procedurally generated planet which is not conveying any information.

The following code is a static function on the `PlanetNode` class that returns a SpriteKit node for the planet. It takes in a base colour and an accent colour and applies them to the `fillColor` and `strokeColor`, which are attributes of all `SKShapeNode`s. `SKShapeNode`s are SpriteKit nodes that can be given a shape to render, and a circle is suitable for a planet. `SKShapeNode` has a built-in glow parameter which adds a subtle effect. I made this a static function as there is no functionality related to a specific planet.

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

#### Planet Border

Once the PlanetNode has been added I gave it a border which was a child of the planet. This code is run on the SpriteKit node to generate this
```swift
//border which is used to highlight
self.border = SKShapeNode(circleOfRadius: borderRadius)        
self.border.lineWidth = 2
self.border.fillColor = .black
```

#### Graph Edges or Paths

To do this I used a SpriteKit CGMutablePath. I made a separate draw helper file which provided me with a few functions with a simpler, more relevant interface that I can use to create the connections for the SpriteKit graph. These functions currently include:
* **drawline** which draws a line between two given positions
* **drawArrow** which uses drawline and places a arrowhead SKShape node. There was a bit more complexity here with rotation which I solved with a bit of trig.
* **drawlines** which takes in a list of lines and draws them all using `drawLine`. This was not only useful for drawing lots of lines at the same time but also puts them all under a container node so these lines are in the same place.

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
### Stage Three - Implementing Search Algorithms

#### Traversable protocol
As I want my code to be generic to any graph. I defined a protocol that nodes in a graph must conform to. The functions are quite simple and is a requirement for any graph to be traversed so it should not be that hard to adapt some other graphs protocol to work with this. This means that my search algorithms should work on any graph that conforms to this protocol. In my case the Planets are the nodes so they conform to **Traversable**

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
* **heuristic** will give a the chosen heuristic to guide the search. In my case this was the absolute distance to the target which is calculated using Pythagoras .
* **isEqual** will alow two nodes to be compared to check if two nodes are the same so the program knows if the graph has been solved when (current node == target node).

#### BaseSearch
At this stage I implemented the different graph search algorithms by building them all on top of the same `BaseSearch` class. The base search implemented some basic generic functionality that was overridden when necessary. This meant the shared logic for stepping forward, tracking the frontier, storing history, and reconstructing the final path only had to be written once. Each individual algorithm then only needed to override the small parts that changed its behaviour, such as how the frontier was read or how priorities were calculated.

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

| Feature                 | Breadth First | Depth First | Greedy BFS     | Dijkstra       | A*                 |
| ----------------------- | ------------- | ----------- | -------------- | -------------- | ------------------ |
| Frontier Data Structure | Normal Queue  | Stack       | Priority Queue | Priority Queue | Priority Queue     |
| Use Weights             | ---           | ---         | ---            | Y              | Y                  |
| Use Heuristic           | ---           | ---         | Y              | ---            | Y                  |
| Priority Function       | ---           | ---         | Heuristic      | Weight         | Heuristic + Weight |

I also had one shared function in `BaseSearch` that made the frontier work like a priority queue for the algorithms that needed one:

```swift
func prioritizeAndDedupeFrontier() {
    currentState.frontier.sort { $0.weight < $1.weight }
    
    // keep only the first version of each node
    var seen: Set<UUID> = []
    currentState.frontier = currentState.frontier.filter { entry in
        let id = entry.neighbour.id
        return seen.insert(id).inserted
    }
}
```

This first sorts the frontier by priority, then removes duplicate nodes so the same node does not appear multiple times in the queue.

This was also a sensible place to keep the more expensive frontier work. Breadth First Search and Depth First Search still behave like simple graph traversals, while Dijkstra, Greedy Best First Search, and A* pay the extra cost of sorting because they need a priority queue. That trade-off was worthwhile because my graphs are small, but correct queue ordering is essential for the weighted and heuristic algorithms.

#### Breadth First Search
Breadth First Search uses a queue to decide which is the next node to visit. This provides a broad search around the start node in general visiting closer nodes before further nodes

Breadth First Search did not need its own `getNextFrontier()` override because the default implementation in `BaseSearch` already behaves like a queue:

```swift
func getNextFrontier()->(neighbour: any Traversable, weight: Double){
    return currentState.frontier.removeFirst()
}
```

#### Depth First Search
Depth First provides a deep search so it will search deeper until it reaches a dead end before backtracking. I am using a pre order traversal so on a tree it will go root left right.

To turn the frontier into a stack instead of a queue, I overrode `getNextFrontier()` so it removes the most recently added node:

```swift
override func getNextFrontier()->(neighbour: any Traversable, weight: Double){
    return currentState.frontier.removeLast()
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
Greedy Best First Search only uses the heuristic to decide which node to visit next. This means it often finds a path quickly, but it does not always find the shortest path.

For Greedy Best First Search I set it so the UI knows it uses a heuristic, and then I made the priority queue use only the heuristic:

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
This means Greedy Best First Search chooses the node that looks closest to the goal. The queue priority is based on the heuristic, not the total path cost so far.

#### Dijkstra

For the algorithms that uses weights I decided to show them on the edges. The priority function only uses the distance to the node

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

I added the ability to show and hide text on the edges for only Dijkstra and A* to use edge weights. For algorithms that do not use the weights, the weight for all edges is 1.

<div style="page-break-before: always;"></div>

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

At a high level to solve step by step I have a current state, a forward function and a backward function.  I have a stack that stores the history of the algorithm with an object.

Different to design, I did not include a redo Stack that stored the future stages. The argument that it is less efficient I do not think is a problem as it is only being done on an event and the calculations are actually not that big.

This design uses more memory because every step stores a full `AlgorithmState`, but I thought this was a good trade-off. The graphs are small enough that the extra storage is not a problem, and it makes stepping backwards immediate instead of having to rerun the whole algorithm from the beginning every time.

This flowchart shows the main logic of one step of the algorithm:

```mermaid
flowchart TD
    A["User presses Forward"] --> B["Take next node from frontier"]
    B --> C["Mark node as current and explored"]
    C --> D{"Is it the target?"}
    D -->|Yes| E["Reconstruct final path"]
    E --> F["Mark search as completed"]
    D -->|No| G["Check neighbours"]
    G --> H["Add valid neighbours to frontier"]
    H --> I["Update explanation and stored state"]
    I --> J["Prioritise and dedupe frontier"]
    J --> K{"Frontier empty?"}
    K -->|Yes| L["Mark search as completed with no path"]
    K -->|No| M["Wait for next step"]
```
#### Undo Stack
I made an UNDO stack to store the history of the algorithm. When I went forward in the algorithm I created an object that stored all the key variables of the algorithm state and pushed this object onto the stack. This is similar to how the contents of the registers are pushed onto a stack when there is an interrupt. I could then freely change the original variables for the next step without losing the data for the previous step. This is the `AlgorithmState` object I created. It stores the simple data as well as dictionaries of all the nodes and the relevant data.
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
* Get the next node (this uses the frontier queue which is based on the priorities of the chosen algorithm)
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

One more important part of the step system was working out how the ship should move from one explored node to the next. If I only moved it directly, the ship would sometimes jump across the graph in a way that looked confusing. To solve this I calculated the path from the previous node back to a common ancestor and then forwards again to the next node:

```swift
func calculatePathFromPreviousToCurrent(previousNode: any Traversable){
    self.currentState.backtrackPathFromPrevious = []
    // path from the old node back to the start
    let backtrackPrevious = getPathToStart(end: previousNode)
    // path from the new current node back to the start
    let backtrackNext = Array(getPathToStart(end: currentState.current).reversed())
    if let firstPreviousIndex = backtrackPrevious.firstIndex(where: { obj in backtrackNext.contains { $0.isEqual(to: obj) } }) {
        let commonNode = backtrackPrevious[firstPreviousIndex]
        if let firstNextIndex = backtrackNext.firstIndex(where:  { $0.isEqual(to: commonNode) }) {
            let previous = backtrackPrevious[...firstPreviousIndex]
            let next = backtrackNext[firstNextIndex...].dropFirst()
            // go back to the shared node, then go forwards again
            self.currentState.backtrackPathFromPrevious = Array(previous+next)
        }
    }
}
```

This works by finding the point where the two routes share a common node. The ship can then move back to that shared point and then out to the next node, which makes the movement look much more natural.

<div style="page-break-before: always;"></div>

### Stage Five : Algorithm Visualisation
This stage took longer than expected as I found a few improvements I found necessary as well as using a new part of SpriteKit SKActions which allowed me to create animation. The first part was easier where I added a few more spriteKit nodes which were added to the graph


#### Reusable Text Bubble
Putting UI elements over the SpriteKit scene turned out to be difficult and not the best way to do it. Instead I created my own reusable SpriteKit elements. This inherited from `SKNode` and uses a `labelNode` for text and a `shapeNode` for the border. The size of the border is not passed in but is calculated to fit the passed text. This means it is easy to use this UI element. The text can be changed and this simply recalculates the border size.

This was reused in any area where I need to create labels on the graph such as planet names and labelling weights on the graph.

This is it being used to give a planet a label for its name and other information

```swift 
self.planetNameLabel = TextBubbleNode(textString: planetName)
self.planetNameLabel.position = CGPoint(x: 0, y: 35)
self.planetUILabel = TextBubbleNode(textString: "")
self.planetUILabel.position = CGPoint(x: 0, y: -35)
```

I added the ability to show and hide text on the edges. Here is an updated planetNode:
<p align="center"><img src="./screenshots/IndividualPlanetNode.png" alt="Individual Planet Node" width="100"></p>
#### ShipNode
The Ship turned out to be more of a UI element than an actual object that I expected. I used a SKSpriteNode for this, these are nodes that take in an image which should be in the projects filesystem. I used an AI generated image for this which I will talk about later in Use of AI

#### SKActions
To create animations in the program I used SKActions. SKActions are a class that allows me to transition properties and run actions one after each other. This is how I added all the animations and moving elements in my game, it is not only for animations but is also used for moving nodes and can even run code. I used this for these purposes.

##### Pulsing action
For example, I used SKActions to create a repeating pulse animation Here is the code that generates it:

```swift
func createPulsingAction(scaleAmount: CGFloat, duration: TimeInterval) -> SKAction {
    let scaleUp = SKAction.scale(to: scaleAmount, duration: duration)
    let scaleDown = SKAction.scale(to: 1.0, duration: duration)
    let sequence = SKAction.sequence([scaleUp, scaleDown])
    return SKAction.repeatForever(sequence)
}
```

This shows how actions can be ordered and repeated. First the node grows, then it shrinks back to its normal size, and the whole sequence loops forever.

##### ShipRingPulse
I added a pulse for when the ship explores a planet. The radius is dependent on the ship's shortest distance so the ship it can travel to. Hopefully this makes it more obvious which planets are added to the frontier. The pulse itself was implemented as a grouped animation so the ring grows and fades at the same time:

```swift
func ringPulseAction(scaleBy : CGFloat) -> SKAction{
    let grow = SKAction.scale(by: scaleBy, duration: 1)
    let fade = SKAction.fadeOut(withDuration: 1.5)
    let groupAction = SKAction.group([grow, fade])
    return groupAction
}
```

I then called this from the `Planet` object when I wanted to highlight a node:

```swift
func pulseRing(outerDistance : CGFloat){
    let ring = SKShapeNode(circleOfRadius: self.planetRadius)
    ring.strokeColor = UIColor.cyan
    ring.lineWidth = 2
    ring.fillColor = .clear
    self.shape.addChild(ring)
    ring.run(ringPulseAction(scaleBy: outerDistance/self.planetRadius))
}
```
As you can see I run this on a blue circle that increases in radius and fades out to create a scanning effect. The radius of the scan is equal to the maximum distance nodes can be connected by, which is set when creating the graph. This was useful because it made the current search radius visible without permanently changing the planet itself.

##### MoveShipNode
For the main ship movement I used another SKAction that rotates the ship to face the direction of travel and then moves it smoothly:
```swift
func moveShipNode(from : CGPoint, to : CGPoint, duration: TimeInterval) -> SKAction {
    let dy = to.y-from.y
    let dx = to.x-from.x
    let direction = -atan2(dx, dy)
    let rotatePlanet = SKAction.rotate(toAngle: direction, duration: duration, shortestUnitArc: true)
    
    let moveAction = SKAction.move(to: to, duration: duration)
    moveAction.timingMode = .easeInEaseOut
    let shrink = SKAction.scale(to: 0.8, duration: duration)
    let grow = SKAction.scale(to: 1, duration: duration)
    let shrinkGrow = SKAction.sequence([shrink, grow])
    // first turn, then move and scale at the same time
    let groupAction = SKAction.sequence([rotatePlanet, SKAction.group([moveAction, shrinkGrow])])
    
    return groupAction
}
```

The ship turns to face the next planet which uses the tan function to get the direction, then moves there. While moving it slightly shrinks and grows to make it feel like it is taking off and landing.

I also made a ```teleportNode``` action which instantly moves the ship. This was because I found moving backwards strange and confusing and thought just skipping back would be better. This just uses the move SKaction with a duration of 0.
#### Algorithm Backtracking
After implementing the search algorithms I realised algorithms that used backtracking would do large jumps across the graph. I thought this was unclear and may be confusing for my target audience. I wanted to implement a feature that showed the nodes the spaceship backtracks to on the way to the next node. To do this I made each node store the node which the ship came from. It finds the intersection of the two paths from the current node and the next node and returns to this point before going forwards

To animate this I added an action to move the ship multiple steps which just repeats move ShipNode.

#### AutoPlay
This feature aims to run the steps slowly without the user having to press forward. I had to use the async await feature in swift.

The isRunning is a boolean variable that will be controlled by the User Interface. This is the condition I use to decide if I should be autoplaying. If it is autoplaying every 2.5s (the sleep uses nanoseconds so I have to convert) I will try run the next step. Most steps are under this length but it was a bit buggy and jumped around for when there are lots of movements in the step.

```swift 
func startLoop() {
        isRunning = true
        Task {
            while isRunning {
                await performTask()
                try? await Task.sleep(nanoseconds: 2500000000)
            }
        }
    }
    
    func performTask() async {
        await MainActor.run {
            forward() 
        }
    }

```
The overall implementation I found difficult and the final result did not work perfectly for long sequences with backtracking.

<div style="page-break-before: always;"></div>

### Stage Six : User Interface

My user interface needs to adapt and scale to fit different sized screens while looking consistent, visible, and un-intrusive for different devices. During this stage I used my iPad mini a lot for testing and tested using different window sizes on my laptop. Overall I found this to be harder than expected.

The screens that I included were the Menu Screen, Graph screen, How to use screen, and an Algorithms Descriptions screen. I did not include a settings page as I did not find there were many controls in the program so I didn't think it was necessary.

In the controller I used `@Published` properties so that changing a setting in SwiftUI would automatically update the app state:

```swift
@Published var selectedUILabel : String = "Cost" { didSet {updateUI(hasAnimation: false)}}
@Published var selectedAlgorithm : String = "Breadth First Search" { didSet{resetAlgorithm()}}
@Published var selectedBuilder : String = "Random" { didSet{resetPlanets()}}
@Published var planetCount : Int { didSet {resetPlanets()}}
@Published var maxDistance : Double { didSet {recalculatePaths()}}
```

This meant I did not have to manually refresh the user interface every time the user changed a control. When one of these values changes, SwiftUI notices and the program updates the graph or algorithm automatically.
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
```swift 
Text("this is a subheading").modifier(SpaceSubheading()) ```
```
I also made a title View which was a fixed string I could use from the title screen
##### Space Buttons
I made two stylised buttons that I could reuse. These are custom small SwiftUI views. They use the standard SwiftUI buttons but apply further styling. This includes adding the `SpaceText` modifier I already created. SwiftUI buttons take in a closure which is a function that is called when they are pressed. This meant my buttons had to take in a closure and then relay it to the button I use in the view. For the larger buttons I wanted to pass in text to them
```swift 
SpaceButton(imageSystemName: "moon", textLabel: "SpaceStyle", disabled: false, action: {print("hello there")})
LargeSpaceButton(text: "SpaceIsBig", imageSystemName: "star", action: {print("spaceIsBig")})
```
<p align="center"><img src="./screenshots/BottomPlayingHUD.png" alt="Reusable Buttons and HUD Controls" width="70%"></p>

##### SpaceList
This and the remaining components are primarily used for the HUD for the algorithm Control
##### SpaceSlider
<p align="center"><img src="./screenshots/GalaxySlider.png" alt="Galaxy Slider" width="40%"></p>
This is a slider ui element which will be used to easily change numerical values. It has a title which can show the user what it does, as well as the current value so the user can see the exact selected number. This is useful if the user wants an exact number of nodes in the graph. I experimented with text fields but decided as the majority of users are using on touch first devices a slider is more intuitive. The `value` variable uses the `@Binding` property wrapper, which means the slider can directly update a value owned by another view.
```swift
struct SpaceSlider: View {
    var title: String
    var range: ClosedRange<Double>
    var step: Double
    @Binding var value: Double
    var body: some View {
        VStack {
            Text("\(title): \(Int(value))")
                .modifier(SpaceSubheading())
            Slider(value: $value, in: range, step: step)
                .tint(.yellow)
        }
    }
}
```

##### SpacePicker
This UI component allows me to pick from a list of elements. I will use it when there are many options for the user to choose between. There will be lots of images of these components being used when I piece the UI together in the next sections.

#### Menu Screen
This is the first screen that is shown on launch, so it should allow the user to navigate from here to the rest of the program. I did this by passing closures to change the state of the app. The Main Menu Screen was made up of the main title text, which was defined in `SpaceText`, and three large Space Buttons.

<p align="center"><img src="./screenshots/IntroScreen.png" alt="Main Menu Screen" width="75%"></p>

#### SpriteKit Screens

There are two SwiftUI screens that overlay on top of the SpriteKit view. They are the Graph Generation and the Graph Solving.

For the UI elements of these two SwiftUI control views I realised that half of the SwiftUI components were shared between the two views. The repeated sections were mainly the top half, which was for navigation of the SpriteKit scene and app navigation. This meant that I could just reuse the top half of the SwiftUI that I created for the graph generation screen by packaging it into a reusable component. I used a 1 by 2 grid as it seemed to be the best way to swap out the views.

```swift
var body : some View{
	Grid(alignment: .top){
		GridRow(alignment: .top){
			TopBuilderHUDRow()
				.environmentObject(galaxy)
				.frame(maxWidth: .infinity)
		}
		.frame(maxWidth: .infinity)            
		Spacer()
		GridRow{  
			BottomBuilderHUDRow()
				.environmentObject(galaxy)
				.frame(maxWidth: .infinity)
	}
	.frame(maxWidth: .infinity, maxHeight: 280)
}
```

To do the overlay I used a `ZStack`. I had been using `HStack` and `VStack`, which align views horizontally and vertically, but a `ZStack` can place views on top of each other from back to front, which is perfect for overlaying one view on another. I need to pass the environment object to the views as it is the data model.
```swift
ZStack {
	SpriteKitView()
		.environmentObject(galaxy)
		.scaledToFill()
		.frame(width: geometry.size.width, height: geometry.size.height)	
	HUDView
		.environmentObject(galaxy)
		.padding()
		.opacity(0.8)
		.modifier(SpaceText())
		.frame(width: .infinity, height: .infinity)
}
```
The HUDView is a new view that just swaps between the Graph generation HUD and the Graph solving HUD

The two HUDs are very similar because they both share the top half. This is the generic top `HUDView`, which was placed at the top of both SpriteKit screens.
```swift
struct TopPlayingHUDRow : View{
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var galaxy : GameController
    var body: some View{
        SpaceButton(imageSystemName: "arrowshape.turn.up.backward.fill", textLabel : "Galaxy Builder", disabled: false){
            galaxy.resetAlgorithm()
            galaxy.startMode.toggle()
        }
        VStack{
            Text("\(galaxy.selectedAlgorithm) Algorithm")
                .modifier(SpaceHeading())
            Text(" Step Number : \(String(galaxy.getMoveStep()))")         
                .modifier(SpaceSubheading())
        }.gridCellColumns(5)
        VStack{
            SpaceButton(imageSystemName: "location.fill", textLabel: "Focus On Ship", disabled: false){
                galaxy.focusOnShip = true  
            }
            SpaceButton(imageSystemName: galaxy.lockOnShip ? "lock.open.fill" : "lock.fill", textLabel: "Lock On Ship", disabled: false){
                galaxy.lockOnShip.toggle()
            }
        }
    }
}
```

#### Graph Generation Screen

To create the more complex UI sections like a HUD I further broke down the screens into components that used the components I made. These views are not generic or reusable but are for packaging related components therefore they don't take in any UI based parameters (these are hardcoded in the view). This Galaxy Sliders screen combined the two sliders required to change the parameters of the Graph Generation and placed them on top of each other.

```swift
struct GalaxySliders : View{
    var planetCountRange: ClosedRange<Double> = 2.0...100.0
    var maxDistanceRange: ClosedRange<Double> = 1.0...20.0

    @EnvironmentObject var galaxy : GameController

    var body : some View{

        VStack {
            SpaceSlider(
                title: "Number of Planets",
                range: planetCountRange,
                step: 1.0,
                value: Binding(
                    get: { Double(galaxy.planetCount) },
                    set: { galaxy.planetCount = Int($0) }
                )
            )
            SpaceSlider(
                title: "Max Fuel",
                range: maxDistanceRange,
                step: 0.5,
                value: Binding(
                    get: { Double(galaxy.maxDistance / 25) },
                    set: { galaxy.maxDistance = $0 * 25 }
                )
            )
        }
        .padding()
    }
}

```
For the bottom I made a large Space Button to start and used the Galaxy Sliders and the Algorithm Selector.
<p align="center"><img src="./screenshots/BottomPlayingHUD.png" alt="Bottom Playing HUD" width="70%"></p>

#### Graph Solving Screen

This is the BottomHUDView for the graph solving screen

```swift
struct BottomPlayingHUDRow : View {
    @EnvironmentObject var galaxy : GameController

    var body: some View{
        SpaceList(title : "Frontier",  color: .cyan, planets : galaxy.getFrontierStrings())
            .frame(maxWidth: .infinity)
            .gridCellColumns(2)
        
        ButtonsAndExplanationBlock().environmentObject(galaxy)
            .frame(maxWidth: .infinity)
            .gridCellColumns(3)
        
        SpaceList(title : "Explored", color: .red, planets : galaxy.getExploredStrings())
            .frame(maxWidth: .infinity)
            .gridCellColumns(2)

    }
```

The `ButtonsAndExplanationBlock` is another container view I created to decompose the layout further. Here is the image of the generated view.

<p align="center"><img src="./screenshots/BottomPlayingHUD 1.png" alt="Bottom Playing HUD Detail" width="70%"></p>
#### How to use Screen

This is a screen that shows the user how to interact with the program if they are unsure. It tells them what the colour codes mean and what the stacks and other UI elements represent. It also shows the user the controls and how to interact with the program.

<p align="center"><img src="./screenshots/HowToUseScreen.png" alt="How To Use Screen" width="70%"></p>
#### Algorithms Descriptions Page

The start of my algorithms page is generic to all the algorithms. Similar to how I realised how similar the algorithms' core concepts really are, I wanted to amplify this in the descriptions.

For the algorithm description I wrote it so the information is not stored as text strings in the page, but is accessed from the algorithm object itself. I loop through all the algorithms and then display their individual descriptions and if they use heuristics or weights. This way, if I add new algorithms I do not need to edit the descriptions page, but if I add a description to the algorithm object it will just update the page automatically.

Here is the code in the algorithm descriptions page that loops through all the algorithms and adds the descriptions to the page:

```swift
ForEach(GameController.searchAlgorithms, id: \.self) { algorithm in
	if let algorithmType = GameController.algorithmTypes[algorithm] { 
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

Here is an example of the algorithm `getDescription` function, which is in the algorithms class. This function is overridden by each algorithm.
```swift
override class func getDescription()->String{
        return "Dijkstra's Algorithm was created by Edsger Dijkstra in 1956. It always finds the shortest weighted path from start to goal. It uses a priority queue to explore the lowest-cost path first."
    }  
```
<p align="center"><img src="./screenshots/AboutScreen.png" alt="About Screen" width="70%"></p>
#### Hierarchy of SwiftUI elements
Similar to SpriteKit I used reusable components to save development time and increase consistency in the UI.

Here is a hierarchy of how the reusable SwiftUI views I created are being used. Note that I omitted `SpaceText` as it is a view modifier that was placed on other UI views but kept when it was simply applied to a `Text()` view.

```
HomeView - MenuScreen
	TitleNameView
	LargeSpaceButton X3
	StarryBackgroundView

AboutView - How to use
	SpaceHeading
	SpaceText
	LargeSpaceButton
	StarryBackgroundView
	
AlgorithmsView - descriptions
	SpaceHeading
	SpaceText
	LargeSpaceButton
	StarryBackground

ContentView - both graph screens
	SpriteKitView
	
	TopHUDRow
		SpaceButton X2
		SpaceText
	
	StartBottomHUDRow
		SpaceButton X3
		SpaceText
		GalaxySliders
		LargeSpaceButton
		SpacePicker
	
	PlayingBottomHUDRow
		SpaceList
		ButtonsAndExplanationBlock
		SpaceList
```

#### Starry Background
This is a bonus SpriteKitView I created for decorative reasons. It uses SpriteKit to create a nice starry background for the screens. Its algorithm was random so each starry background is different. The algorithm is very simple as it simply places a random number of stars in random positions in a given range for a set number of iterations. I used some of SpriteKit's effects like glow which gave a glow around the border on the individual stars which were just small dots or circles.

This code generates the stars and puts them under the stars node, which is then added to the SpriteKit game tree.

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

This background is shown behind all the screens in the game

<div style="page-break-before: always;"></div>

### Source Control, Project Tracking, Tools and AI

Alongside implementing the app itself, I also used supporting tools to manage the project, track changes, and speed up development.

#### Source Control

Throughout development I used source control with Git and GitHub. This was useful because it allowed me to save versions of the project over time, experiment with changes more safely, and go back to an earlier version if I introduced a bug. It also helped me keep a clearer record of how the project developed, which is useful when reviewing progress across multiple stages. I made over 300 commits to this project, although about half of these were to this file, the WRITEUP.md file.

<p align="center"><img src="./screenshots/github_code.png" alt="GitHub Commit History" width="85%"></p>

Git was especially useful for a project like this because I was changing several parts of the program at once, such as the graph generation, algorithm logic, and user interface. Source control reduced the risk of losing work and made it easier to compare new code with older versions when I was debugging.

#### Issue Tracking

I also tried to use GitHub Issues to track tasks and bugs during development. This was helpful when I remembered to use it, because it gave me a simple way to record problems and planned improvements in one place. However, I was not very consistent in using it and only made 23 issues so it was only a partial record of the work rather than a complete project log. I think it would be more useful if more than one person was working on the project. The issues page is here: [GitHub Issues](https://github.com/NoahMSchool/SwiftPlanets/issues).

<p align="center"><img src="./screenshots/github_issues.png" alt="GitHub Issues" width="85%"></p>

#### Development Environment

The IDE that I used was Swift Playgrounds, which is slightly easier to use than XCode for iOS Projects. I referred heavily to the Swift Documentation. Links to all of these tools can be found at the end of this document.

I used GitHub desktop on my Mac as the source control client. I used Obsidian as a markdown editor for the writeup. Obsidian is quite good at exporting markdown as a PDF I think. I used Mermaid.js for the charts in this write up as you can describe different kinds of diagrams using Markdown. Markdown was a good choice because I think the diagrams are clear and they work on the GitHub markdown pages.

The one big problem I had with the markdown and Obsidian is that is could not generate page numbers, which makes my Table of Contents a bit harder to use.

#### Use of AI

| Type       | Use                                                                                                                                       | Example                                                                                                                                                                                                       |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Assets     | The only AI generated item in my project was the Spaceship sprite which I made with OpenAI ChatGPT (19 Feb 2025).                         | "Prompt: Generate a transparent PNG image that I can download of a cartoony silver spaceship with cyan accents that would explore a galaxy" <img src="./screenshots/Ship8.png" alt="Ship sprite" width="20%"> |
| Code<br>   | None of the code in the project was AI Generated, but ChatGPT did tell me about the orientation algorithm for line intersections.         | "What is the easiest way to tell if two line segments intersect if I have the x,y positions of their start and end points"                                                                                    |
| Test Graph | For the test graph, I passed ChatGPT a list of co-ordinates and edges, and it gave me the repetitive code to add all the nodes and edges. | "Given these co-ordinates can you generate the code to add the nodes and the edges using the functions available in the galaxy builder"                                                                       |
| Debugging  | I did ask ChatGPT for help when I had problems and error messages that I did not understand. It helped me understand the root cause.      | What does “Value of optional type must be unwrapped” mean?<br>Why am I getting “Operation not permitted” when running my program?<br>                                                                         |

<div style="page-break-before: always;"></div>

### Testing to Inform Development

Although this section is presented near the end of Development, the testing itself happened iteratively throughout development. As I built each part of the program, I tested it, found bugs, and then used those results to improve the next version before continuing.

#### Test Plan

Before finishing the program I made a test plan so I could check the main functional parts of the app and also note down bugs that appeared during development. I used this to test the algorithm logic, the step system, the graph generation, and the UI state. If a test failed, I then used the result to find the cause of the bug and fix it. In reality I fixed bugs as I found them, but this table is showing tests that failed at least once during testing. After the plan, I first show the fixed graph algorithm tests that I used to check correctness, and then I show some of the bugs that those tests uncovered and how I fixed them.

| Test ID | Area being tested            | What I tested                                                                             | Expected result                                                                         | Actual result before fix                                                                   | Status before fix                                          |
| ------- | ---------------------------- | ----------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | ---------------------------------------------------------- |
| DEV-01  | Graph generation             | Generating a random graph with valid settings                                             | A graph should be created with connected planets and paths                              | Graph generated correctly                                                                  | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-02  | Graph generation             | Checking that generated lines do not cross each other                                     | Paths should avoid overlapping where possible                                           | Graph generated correctly                                                                  | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-03  | Path reconstruction          | Solving a graph where no valid path exists                                                | The app should finish safely and not try to draw a final path                           | The program could still try to reconstruct and draw a path, which caused a crash           | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-04  | Path drawing                 | Solving a graph where the reconstructed path only contains one node                       | The program should handle this safely without crashing                                  | The code assumed the path had more than one node and could crash                           | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-05  | Step system                  | Pressing step forward once at the start of a search                                       | The current node, frontier, and explored list should update once                        | Updated correctly                                                                          | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-06  | Step system                  | Pressing step backward after moving forward                                               | The program should return to the previous stored state                                  | Returned to the previous state correctly                                                   | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-07  | Ship animation / step system | Moving between steps where there was no movement animation to play                        | The update closure should still run so the UI and graph state continue updating         | The action was empty, so the closure did not run and the update never happened             | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-08  | Search algorithm state       | Stepping through an algorithm and checking when nodes are added to `explored`             | A node should only be added to `explored` when it is actually visited                   | Nodes were being marked explored too early when they were only discovered                  | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-09  | Graph controls               | Changing the start node                                                                   | The start node should update and the visual state should change clearly                 | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-10  | Graph controls               | Changing the end node                                                                     | The end node should update and the visual state should change clearly                   | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-11  | Graph recalculation          | Changing `maxDistance` after generating a graph                                           | The paths, neighbours, and drawn lines should all update together                       | Only the paths were recalculated, so related graph state became wrong                      | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-12  | Graph rebuilding             | Regenerating a graph after changing planet count                                          | The graph should regenerate with the new number of planets                              | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-13  | Priority frontier            | Running weighted algorithms on graphs where the same node could be reached more than once | The frontier should not contain duplicate entries for the same node                     | The same node could appear in the frontier multiple times                                  | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-14  | Explored list                | Stepping through algorithms repeatedly and checking the explored list                     | A node should only appear once in `explored`                                            | The same node could be added to the explored list more than once                           | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-15  | Screen navigation            | Moving between the main menu, about page, and simulator                                   | The app should change screens without losing state unexpectedly                         | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-16  | Rebuilding graphs            | Changing the selected graph type and then recalculating paths                             | The current graph builder should be used when recalculating paths                       | The program recalculated using the base builder instead of the selected builder            | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-17  | Weighted display             | Running a weighted algorithm and checking displayed costs                                 | The UI should show cost values where relevant                                           | Cost values were not always shown correctly at first                                       | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-18  | Weighted display             | Running a weighted algorithm after the fix and checking displayed costs                   | The explored and frontier displays should show useful cost values                       | Worked correctly after fix                                                                 | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-19  | Algorithm descriptions       | Opening the algorithm descriptions page                                                   | Each algorithm should show the correct information from the model                       | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-20  | UI layout                    | Viewing the screens on different device sizes                                             | The main content should still fit and remain readable                                   | Mostly worked, with some minor spacing issues                                              | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-21  | Help screen                  | Opening the help screen and reading the controls                                          | The controls and colour meanings should be explained clearly                            | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-22  | Animation timing             | Running autoplay on a solved graph                                                        | The ship and state changes should remain understandable                                 | Mostly worked, but some timings could still be improved                                    | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-23  | Random graph solving         | Solving multiple generated graphs in a row                                                | The app should keep updating correctly and not crash                                    | Worked correctly after the main fixes                                                      | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-24  | Algorithm correctness        | BFS on the unweighted tree graph                                                          | The algorithm should find the correct path for the tree graph                           | Correct path found                                                                         | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-25  | Algorithm correctness        | DFS on the unweighted tree graph                                                          | The algorithm should find the correct path for the tree graph                           | Correct path found                                                                         | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-26  | Algorithm correctness        | Greedy Best First Search on the unweighted tree graph                                     | The algorithm should find the correct path for the tree graph                           | Correct path found                                                                         | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-27  | Algorithm correctness        | Dijkstra on the unweighted tree graph                                                     | The algorithm should find the correct path for the tree graph                           | Correct path found                                                                         | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-28  | Algorithm correctness        | A* on the unweighted tree graph                                                           | The algorithm should find the correct path for the tree graph                           | Correct path found                                                                         | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-29  | Algorithm correctness        | BFS on the weighted square graph                                                          | The algorithm should solve the graph in a valid way for its own logic                   | Valid path found                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-30  | Algorithm correctness        | DFS on the weighted square graph                                                          | The algorithm should solve the graph in a valid way for its own logic                   | Valid path found                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-31  | Algorithm correctness        | Greedy Best First Search on the weighted square graph                                     | The algorithm should prioritise using the heuristic and solve according to greedy logic | The priority logic was not set up properly yet, so the solving behaviour was wrong         | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-32  | Algorithm correctness        | Dijkstra on the weighted square graph                                                     | The algorithm should find the shortest weighted path                                    | Dijkstra was originally behaving like a stack-based search, so the solving order was wrong | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-33  | Algorithm correctness        | A* on the weighted square graph                                                           | The algorithm should solve the graph using both cost so far and heuristic               | The queue priority was not combining the real cost with the heuristic correctly            | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-34  | Algorithm correctness        | BFS on a generated random graph                                                           | The algorithm should solve the graph without crashing                                   | Correct path found for the generated graph                                                 | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-35  | Algorithm correctness        | DFS on a generated random graph                                                           | The algorithm should solve the graph without crashing                                   | Correct path found for the generated graph                                                 | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-36  | Algorithm correctness        | Greedy Best First Search on a generated random graph                                      | The algorithm should solve the graph using heuristic priority                           | The queue priority logic was still wrong at first, so Greedy was not behaving properly     | <span style="color: red;"><strong>FAILED</strong></span>   |
| DEV-37  | Algorithm correctness        | Dijkstra on a generated random graph                                                      | The algorithm should solve the graph and return the shortest weighted path              | Correct weighted path found for the generated graph after the fix                          | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-38  | Algorithm correctness        | A* on a generated random graph                                                            | The algorithm should solve the graph and use the heuristic correctly                    | Correct path found for the generated graph after the fix                                   | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-39  | Graph generation             | Generating several random graphs one after another                                        | The app should generate a new valid graph each time                                     | Worked correctly across repeated generations                                               | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-40  | Visual feedback              | Checking the colour of the start and end planets after selection                          | The start and end planets should always be clearly highlighted                          | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-41  | Reset behaviour              | Resetting the graph after partially solving it                                            | The graph state should return to its initial unsolved state                             | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-42  | Frontier display             | Viewing the frontier panel while stepping through an algorithm                            | The frontier list should update to match the current algorithm state                    | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-43  | Explored display             | Viewing the explored panel while stepping through an algorithm                            | The explored list should update to match the current algorithm state                    | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-44  | Algorithm switching          | Changing algorithm before solving the same graph                                          | The selected algorithm should change and the solver should use the new one              | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-45  | Graph type switching         | Changing between a random graph and a fixed test graph                                    | The app should load the selected graph type correctly                                   | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-46  | About / help pages           | Opening the information pages and returning to the simulator                              | Navigation should work and return the user to the correct place                         | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-47  | Algorithm completion         | Running an algorithm until the end                                                        | The final path should be shown and the solved state should be clear                     | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-48  | Input robustness             | Trying a range of graph settings such as different planet counts and maximum distances    | The app should continue working with valid values without crashing                      | Worked correctly with the tested valid values                                              | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-49  | Step controls                | Pressing step backward when already at the first step                                     | The app should not go back any further and should keep the current state                | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-50  | Step controls                | Pressing step forward when already at the final step                                      | The app should not move forward any further and should keep the solved state            | Worked correctly                                                                           | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-51  | Unsolvable graphs            | Running an algorithm on a graph where the end node cannot be reached                      | The app should stop safely, show that no path was found, and not crash                  | Worked correctly after the earlier path reconstruction fix                                 | <span style="color: green;"><strong>PASSED</strong></span> |
| DEV-52  | Input validation             | Creating a graph where the start and end node could become the same                       | The app should always make sure the start and end node are different                    | The start and end could both be chosen as the same planet                                  | <span style="color: red;"><strong>FAILED</strong></span>   |

#### Testing the Graph Algorithms

When writing the algorithms, in order to debug them and ensure they were working as intended, I needed graphs that would produce different outcomes for each algorithm. I wrote some down on paper and manually solved them step by step using a trace table. During development I then compared the program state with the expected state to make sure the implementations were correct. This comes before the bug-fix examples because these correctness tests were one of the main ways I discovered which parts of the search logic still needed to be improved.

These test graphs looked more artificial than the random galaxies because their purpose was correctness rather than appearance. In my random graph generation the weights are usually proportional to the distance between nodes with some randomness for variation, but for the fixed tests I wanted graphs that clearly separated the behaviour of the algorithms.

I ended up using two main non-random test graphs throughout development:
* A weighted square graph, which was useful for comparing algorithms that do and do not account for edge weights.
* A tree graph, which was useful for checking traversal order and the behaviour of stacks and queues.

I used the weighted square graph and the tree graph repeatedly while implementing the algorithms and the step system. These were useful because they gave me known expected answers, so I could check whether the frontier, explored nodes, and final path matched what I had worked out on paper.

This testing was also useful for the user experience, not just correctness. During stakeholder play testing, one piece of feedback was that random graphs could look impressive but it was hard to tell whether the answer was actually right. That feedback was one of the reasons I added the fixed test graphs and changed the galaxy generator into subclasses so I could choose between a random graph and a known test case.

<div style="page-break-before: always;"></div>
##### Unweighted Tree Test Graph

For the tree graph there is no weighting and only one path. All of the algorithms find the path, but they take very different numbers of steps. Greedy BFS and A* were the quickest because the heuristic guided them down the correct branch early. The distance heuristic is very accurate on an unweighted graph.

| Algorithm                | Correct (Y/N) | Shortest length | Number of steps | Solved Graph Image                                                                                                    |
| ------------------------ | ------------- | --------------: | --------------- | --------------------------------------------------------------------------------------------------------------------- |
| BFS                      | Y             |              3 | 13              | <img src="./solvedgraphs/BreadthFirstTreeSolved.png" alt="Breadth First Tree Solved" style="width:70%; height:auto;"> |
| DFS                      | Y             |              3 | 7               | <img src="./solvedgraphs/DepthFirstTreeSolved.png" alt="Depth First Tree Solved" style="width:70%; height:auto;">     |
| Greedy Best First Search | Y             |              3 | 4               | <img src="./solvedgraphs/GreedyTreeSolved.png" alt="Greedy Tree Solved" style="width:70%; height:auto;">              |
| Dijkstra                 | Y             |              3 | 13              | <img src="./solvedgraphs/DijkstraTreeSolved.png" alt="Dijkstra Tree Solved" style="width:70%; height:auto;">          |
| A*                       | Y             |              3 | 4               | <img src="./solvedgraphs/AStarTreeSolved.png" alt="A Star Tree Solved" style="width:70%; height:auto;">               |

<div style="page-break-before: always;"></div>

##### Weighted Square Test Graph

| Algorithm                | Correct (Y/N) |  Cost | Number of steps | Solved Graph Image                                                                                                        |
| ------------------------ | ------------- | ----: | --------------- | ------------------------------------------------------------------------------------------------------------------------- |
| BFS                      | Y             |   N/A | 11              | <img src="./solvedgraphs/BreadthFirstSquareSolved.png" alt="Breadth First Square Solved" style="width:56%; height:auto;"> |
| DFS                      | Y             |   N/A | 5               | <img src="./solvedgraphs/DepthFirstSquareSolved.png" alt="Depth First Square Solved" style="width:56%; height:auto;">     |
| Greedy Best First Search | Y             |    11 | 5               | <img src="./solvedgraphs/GreedySquareSolved.png" alt="Greedy Square Solved" style="width:56%; height:auto;">              |
| Dijkstra                 | Y             |     8 | 7               | <img src="./solvedgraphs/DijkstraSquareSolved.png" alt="Dijkstra Square Solved" style="width:56%; height:auto;">          |
| A*                       | Y             |    11 | 5               | <img src="./solvedgraphs/AStarSquareSolved.png" alt="A Star Square Solved" style="width:56%; height:auto;">               |

For the weighted square graph, Dijkstra was the only algorithm that found the shortest path. Even though A* is also designed to find the shortest path and in most cases it does, in this test the route with the lowest total cost was not the most direct-looking path. Dijkstra still found that lower-cost route, but it also took the second longest to solve after Breadth First Search. The heuristic is not that accurate in this weighted graph, which is what I wanted.
<div style="page-break-before: always;"></div>

##### Generated Random Graph Test Example
This table shows the results of running all the algorithms on one of the random graphs. Both Dijkstra and A* found the same shortest path although A* did it a lot more quickly. This makes sense because for the Generated Graph the heuristic is very good because the path weights and heuristic both rely on the distance between two nodes.

| Algorithm                | Correct (Y/N) | Cost | Number of steps | Solved Graph Image                                                                                                        |
| ------------------------ | ------------- | ---: | --------------- | ------------------------------------------------------------------------------------------------------------------------- |
| BFS                      | Y             |  N/A | 13              | <img src="./solvedgraphs/BreadthFirstRandomSolved.png" alt="Breadth First Random Solved" style="width:56%; height:auto;"> |
| DFS                      | Y             |  N/A | 5               | <img src="./solvedgraphs/DepthFirstRandomSolved.png" alt="Depth First Random Solved" style="width:56%; height:auto;">     |
| Greedy Best First Search | Y             |  N/A | 5               | <img src="./solvedgraphs/GreedyRandomSolved.png" alt="Greedy Random Solved" style="width:56%; height:auto;">              |
| Dijkstra                 | Y             |   34 | 11              | <img src="./solvedgraphs/DijkstraRandomSolved.png" alt="Dijkstra Random Solved" style="width:56%; height:auto;">          |
| A*                       | Y             |   34 | 6               | <img src="./solvedgraphs/AStarRandomSolved.png" alt="A Star Random Solved" style="width:56%; height:auto;">               |

Taken together, these development tests show that the final program can generate graphs, solve the fixed and random test cases correctly, step through and replay algorithm state reliably, and recover from the main bugs that were found during implementation.

##### Generated Random Graph Breadth First Search Trace Table

This is a trace table for the following graph using Breadth First Search on the following graph. The start node is planet "Gelyra" and the end is planet "Yithos"

<p align="center"><img src="./tracetables/BFSTraceTableStep0.png" alt="Breadth First Search trace graph" width="600"></p>

<table>
  <thead>
    <tr>
      <th style="width:5%;">Step</th>
      <th style="width:8%;">Current</th>
      <th style="width:14%;">Frontier</th>
      <th style="width:13%;">Explored</th>
      <th style="width:60%;">Image</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>---</td>
      <td>Gelyra</td>
      <td>---</td>
      <td><img src="./tracetables/BFSTraceTableStep0.png" alt="BFS trace step 0" width="100%"></td>
    </tr>
    <tr>
      <td>1</td>
      <td>Gelyra</td>
      <td>Borealis, Hextara</td>
      <td>Gelyra</td>
      <td><img src="./tracetables/BFSTraceTableStep1.png" alt="BFS trace step 1" width="100%"></td>
    </tr>
    <tr>
      <td>2</td>
      <td>Borealis</td>
      <td>Hexara, Draxion, Arkena</td>
      <td>Gelyra, Borealis</td>
      <td><img src="./tracetables/BFSTraceTableStep2.png" alt="BFS trace step 2" width="100%"></td>
    </tr>
    <tr>
      <td>3</td>
      <td>Hextara</td>
      <td>Draxion, Arkena, Wytheris, Odythos</td>
      <td>Gelyra, Borealis, Hextara</td>
      <td><img src="./tracetables/BFSTraceTableStep3.png" alt="BFS trace step 3" width="100%"></td>
    </tr>
    <tr>
      <td>4</td>
      <td>Draxion</td>
      <td>Arkena, Wytheris, Odythos, Yithos, Zenthos</td>
      <td>Gelyra, Borealis, Hextara, Draxion</td>
      <td><img src="./tracetables/BFSTraceTableStep4.png" alt="BFS trace step 4" width="100%"></td>
    </tr>
    <tr>
      <td>5</td>
      <td>Arkena</td>
      <td>Wytheris, Odythos, Yithos, Zenthos</td>
      <td>Gelyra, Borealis, Hextara, Draxion, Arkena</td>
      <td><img src="./tracetables/BFSTraceTableStep5.png" alt="BFS trace step 5" width="100%"></td>
    </tr>
    <tr>
      <td>6</td>
      <td>Wytheris</td>
      <td>Odythos, Yithos, Zenthos</td>
      <td>Gelyra, Borealis, Hextara, Draxion, Arkena, Wytheris</td>
      <td><img src="./tracetables/BFSTraceTableStep6.png" alt="BFS trace step 6" width="100%"></td>
    </tr>
    <tr>
      <td>7</td>
      <td>Odythos</td>
      <td>Yithos, Zenthos</td>
      <td>Gelyra, Borealis, Hextara, Draxion, Arkena, Wytheris, Odythos</td>
      <td><img src="./tracetables/BFSTraceTableStep7.png" alt="BFS trace step 7" width="100%"></td>
    </tr>
    <tr>
      <td>8</td>
      <td>Yithos</td>
      <td>Zenthos</td>
      <td>Gelyra, Borealis, Hextara, Draxion, Arkena, Wytheris, Odythos, Yithos</td>
      <td><img src="./tracetables/BFSTraceTableStep8.png" alt="BFS trace step 8" width="100%"></td>
    </tr>
  </tbody>
</table>

The trace table correctly shows that the shortest path is shown in the correct way for the algorithm. You can see the blue frontier box and the red explored box at each step. It explores 8 planets and finds a path 4 long. You can see the explored planets are coloured in red until the final path is revealed in yellow.

<div style="page-break-before: always;"></div>

#### Bugs Fixed During Testing

After carrying out the development tests, I found several bugs by stepping through the algorithms, changing graph settings, and testing the User Interface. These bugs were useful because they helped me improve the logic of the program and make the visualisation more reliable. This section shows some of the commits I made to fix the bugs I found. Because I was using GitHub it was easy to see the changes I made to fix them. The testing and bug fixing was an iterative process.

##### DEV-03 BUG: Crash when reconstructing an empty path

I found a bug where the app could still try to draw a completed path even when no path had actually been found. This meant the code could access the first element of an empty list and crash.

Before:

```swift
if path.completed{
    var complete_path = path.getPath()
    var from = complete_path[0]
```

After:

```swift
if path.pathExists{
    var complete_path = path.getPath()
    var from = complete_path[0]
```

I also added a separate variable in the search class:

```swift
var pathExists : Bool
```

This fixed the bug because `completed` only means the algorithm has finished, while `pathExists` means a real path was successfully found. The program now only tries to draw the final path when one actually exists.

##### DEV-04 BUG: Crash when the path only had one node

I also found a crash when the reconstructed path only had one node in it. The old code removed the first item from the list and then assumed there were still nodes left to process.

Before:

```swift
var complete_path = path.getPath()
var from = complete_path.removeFirst()
for to in complete_path{
```

After:

```swift
var complete_path = path.getPath()
var from = complete_path[0]
for to in complete_path{
```

This fixed the bug because the code no longer changes the list before looping through it. It simply reads the first node safely and keeps the path list intact.

##### DEV-07 BUG: Empty animation meant the update never happened

When stepping through the algorithm, sometimes there was no movement animation to run. In that case the closure after the animation did not run, which meant the UI update did not happen.

Before:

```swift
ship.shape.run(moveAction){
    [self] in 
    if hasAnimation{
        x.pulseRing(outerDistance: self.maxDistance)
    }
```

After:

```swift
let actionToRun = moveAction ?? SKAction.run {}

ship.shape.run(actionToRun){ [self] in
    if hasAnimation{
        x.pulseRing(outerDistance: self.maxDistance)
    }
```

This fixed the bug because an empty `SKAction` is still a valid action, so the closure now always runs. That means the step system continues updating even when there is no visible movement.

##### DEV-08 BUG: Nodes were being added to explored too early

When testing the step-by-step state, I found that some nodes were being added to `explored` as soon as they were discovered, instead of when they were actually visited. This made the visualisation less logical.

Before:

```swift
currentState = AlgorithmState(
    current: start,
    frontier: [(neighbour: start, weight : 0)],
    explored: [start],
```

```swift
if !currentState.explored.contains(where: {$0.isEqual(to: n.neighbour)}){
    currentState.frontier.append(n)
    currentState.cameFrom[n.neighbour.id] = currentState.current
    currentState.explanation += " adding \(n.neighbour)"
    currentState.explored.append(n.neighbour)
}
```

After:

```swift
currentState = AlgorithmState(
    current: start,
    frontier: [(neighbour: start, weight : 0)],
    explored: [],
```

```swift
currentState.current = getNextFrontier().neighbour
currentState.explored.append(currentState.current)
```

```swift
if !currentState.explored.contains(where: {$0.isEqual(to: n.neighbour)}) &&
   !currentState.frontier.contains(where: {$0.neighbour.isEqual(to: n.neighbour)}) {
    currentState.frontier.append(n)
    currentState.cameFrom[n.neighbour.id] = currentState.current
    currentState.explanation += " adding \(n.neighbour)"
}
```

This fixed the bug because a node is now only marked as explored when it is actually taken from the frontier and visited. That made the trace tables and the on-screen state match properly.

##### DEV-11 BUG: Changing max distance did not fully rebuild the graph

When I changed the maximum connection distance, the graph paths changed but the neighbour data and drawn path lines were not fully rebuilt. This was confusing because the graph looked correct but they paths were not.

Before:

```swift
didSet{
    self.planetPaths = GalaxyBuilder.calculatePlanetPaths(planets: self.planets, maxDistance: self.maxDistance)
}
```

After:

```swift
didSet{
    self.planetPaths = GalaxyBuilder.calculatePlanetPaths(planets: self.planets, maxDistance: self.maxDistance)
    self.setPlanetNeighbours()
    self.setInitialPlanetPathsSKNodes()
}
```

This fixed the bug because all of the related graph data is now refreshed together. The visual graph and the underlying model stay in sync.

##### DEV-13 BUG: Duplicate nodes in the frontier

While testing the weighted algorithms, I found that the same node could appear in the frontier multiple times. This made the search state harder to understand.

Before:

```swift
prioritizeFrontier()
```

After:

```swift
prioritizeAndDedupeFrontier()
```

```swift
func prioritizeAndDedupeFrontier() {
    currentState.frontier.sort { $0.weight < $1.weight }

    var seen: Set<UUID> = []
    currentState.frontier = currentState.frontier.filter { entry in
        let id = entry.neighbour.id
        return seen.insert(id).inserted
    }
}
```

This fixed the bug because the frontier is now sorted and then filtered so only the first copy of each node remains. That made the frontier display and the step logic much cleaner.

##### DEV-14 BUG: A node could be added to explored more than once

I also found that the same node could be added to the explored list multiple times when stepping through the algorithm.

Before:

```swift
currentState.explored.append(currentState.current)
```

After:

```swift
if !currentState.explored.contains(where: { $0.id == currentState.current.id }) {
    currentState.explored.append(currentState.current)
}
```

This fixed the bug because the code now checks whether the node is already in the list before adding it. That made the explored list accurate.

##### DEV-16 BUG: Recalculating paths used the wrong graph builder

When I changed graph settings, the app sometimes recalculated paths using the base builder instead of the currently selected graph builder. This caused the wrong graph logic to be used.

Before:

```swift
self.planetPaths = GalaxyBuilder.calculatePlanetPaths(planets: self.planets, maxDistance: self.maxDistance)
```

After:

```swift
let myBuilder = Galaxy.builderTypes[selectedBuilder] ?? RandomGalaxyBuilder.self

self.planetPaths = myBuilder.calculatePlanetPaths(planets: self.planets, maxDistance: self.maxDistance)
```

This fixed the bug because the app now uses the correct builder for the current graph type. That means recalculating paths behaves properly for different kinds of graphs.

##### DEV-32 BUG: Dijkstra was behaving like DFS

When I first added Dijkstra, it was not actually choosing the next node based on the smallest current path cost. Instead, it was removing the last item from the frontier like a stack. This meant it could solve weighted graphs in the wrong order and return the wrong weighted path.

Before:

```swift
class Dijkstra: BaseSearch{
    override func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        currentState.frontier.removeLast()
    }
    override func getFrontier()->[any Traversable] {
        super.getFrontier().reversed()
    }
}
```

After:

```swift
override func getQueuePriority(n : (neighbour : any Traversable, weight : Double), to: any Traversable) -> Double {
    return getNewWeight(n: n)
}
```

This fixed the bug because Dijkstra now uses the cost so far as the queue priority. That means it chooses the next node in the correct order for shortest path solving.

##### DEV-33 BUG: A* and Greedy were not using the right queue priority

I also found a more serious algorithm bug in A* and Greedy Best First Search. At first, the frontier stored the normal path cost as its weight for every algorithm. This meant Greedy was not properly using the heuristic, and A* was not correctly combining the heuristic with the cost so far.

Before:

```swift
let newWeight = getNewWeight(n: n)
if shouldAddToFrontier(n : n, newWeight : newWeight){
    currentState.frontier.append((neighbour: n.neighbour, weight: newWeight))
}
```

After:

```swift
let newWeight = getNewWeight(n: n)
let queuePriority = getQueuePriority(n : n, to:end!)

currentState.frontier.append((neighbour: n.neighbour, weight: queuePriority))
currentState.weightSoFar[n.neighbour.id] = newWeight
```

For Greedy:

```swift
override func getQueuePriority(n : (neighbour : any Traversable, weight : Double), to: any Traversable) -> Double {
    return n.neighbour.heuristic(to: to)
}
```

For A*:

```swift
override func getQueuePriority(n : (neighbour : any Traversable, weight : Double), to: any Traversable) -> Double {
    return getNewWeight(n: n) + n.neighbour.heuristic(to: to)
}
```

This fixed the bug because the frontier priority is now different for each algorithm. Greedy uses only the heuristic, while A* uses both the real cost and the estimated remaining cost. This made their solving behaviour match the actual algorithms.

##### DEV-52 BUG: Start and end could be the same node

I also found a bug where the graph could choose the same planet for both the start and end. This made the graph invalid because the algorithm would begin and finish on the same node.

Before:

```swift
self.startPlanet = randomPlanet()
self.endPlanet = randomPlanet()
```

After:

```swift
self.startPlanet = planets[0]
self.endPlanet = planets[1]
```

The old helper function was also removed:

```swift
func randomPlanet()->Planet?{
    planets.randomElement()
}
```

This fixed the bug because the program now deliberately chooses two different planets instead of choosing both randomly. That guarantees that the start and end are not the same, as long as there are at least two planets in the graph. I only found this bug quite late because it was not likely to happen on a big random graph.

<div style="page-break-before: always;"></div>

## Evaluation

In this section I will go through the different components, show the related success criteria in a table, and mention any relevant added features and improvements that could be made. This will be based on the development test results and the user post evaluation survey.

### Testing to Inform Evaluation

To evaluate whether the final program met the success criteria, I planned a short set of stakeholder questions to ask after users had tested the app. This focuses on the main usability, learning, and functionality goals of the program. The results of this testing will help me have an evaluation that is based on real user feedback. I also ran a final check on the entire system once it was complete.
<div style="page-break-before: always;"></div>

#### Stakeholder Testing Results

The following results show the responses from the post-development stakeholder testing that I used as evidence in the evaluation.

These are pictures of some of the surveys that were filled in after the users had used the app.

<p align="center"><img src="./surveys/post_surveys.jpeg" alt="Post evaluation surveys" width="75%"></p>

#### Structured Feedback 

The options for all of these questions were one of Yes (Y), Partly (P), No (N). I made a mistake on the form because the last two questions had N as a good result and Y as a bad result which makes the form more confusing. The table below shows all the responses to the multiple choice questions. In this table I change the wording to be the opposite for the bad question and changed N to Y to that I could show what is good and what is bad.

| Question                                                     | Rambo                                                  | Rocco                                                  | Jim                                                   | Jon                                                    | Willow                                                 | Caspian                                                | Inge                                                   | Totals                                                                                                                                                                   |
| ------------------------------------------------------------ | ------------------------------------------------------ | ------------------------------------------------------ | ----------------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------ | ------------------------------------------------------ | ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Could move between the main screens without help             | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  |
| Screens were easy to read on their device                    | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: red;"><strong>N</strong></span>   | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>6 Y</strong></span>, <span style="color: red;"><strong>1 N</strong></span>                                                           |
| Space theme was engaging and suitable                        | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: orange;"><strong>P</strong></span> | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>6 Y</strong></span>, <span style="color: orange;"><strong>1 P</strong></span>                                                        |
| Step-by-step simulation helped them understand the algorithm | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: orange;"><strong>P</strong></span> | <span style="color: orange;"><strong>P</strong></span> | <span style="color: orange;"><strong>P</strong></span> | <span style="color: green;"><strong>4 Y</strong></span>, <span style="color: orange;"><strong>3 P</strong></span>                                                        |
| Could explain what the `Frontier` box meant                  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: orange;"><strong>P</strong></span> | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: orange;"><strong>P</strong></span> | <span style="color: red;"><strong>N</strong></span>    | <span style="color: red;"><strong>N</strong></span>    | <span style="color: green;"><strong>3 Y</strong></span>, <span style="color: orange;"><strong>2 P</strong></span>, <span style="color: red;"><strong>2 N</strong></span> |
| Could explain what the `Explored` box meant                  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: red;"><strong>N</strong></span>    | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: orange;"><strong>P</strong></span> | <span style="color: red;"><strong>N</strong></span>    | <span style="color: green;"><strong>4 Y</strong></span>, <span style="color: orange;"><strong>1 P</strong></span>, <span style="color: red;"><strong>2 N</strong></span> |
| Ship movement helped show visit order                        | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  |
| Text explanations were helpful                               | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: red;"><strong>N</strong></span>   | <span style="color: orange;"><strong>P</strong></span> | <span style="color: orange;"><strong>P</strong></span> | <span style="color: orange;"><strong>P</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>3 Y</strong></span>, <span style="color: orange;"><strong>3 P</strong></span>, <span style="color: red;"><strong>1 N</strong></span> |
| Felt they understood graph algorithms better after use       | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: orange;"><strong>P</strong></span> | <span style="color: orange;"><strong>P</strong></span> | <span style="color: green;"><strong>5 Y</strong></span>, <span style="color: orange;"><strong>2 P</strong></span>                                                        |
| Could explain a difference between two algorithms            | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: red;"><strong>N</strong></span>   | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: orange;"><strong>P</strong></span> | <span style="color: red;"><strong>N</strong></span>    | <span style="color: green;"><strong>4 Y</strong></span>, <span style="color: orange;"><strong>1 P</strong></span>, <span style="color: red;"><strong>2 N</strong></span> |
| Could generate a graph successfully                          | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  |
| Could step forwards and backwards through the algorithm      | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  |
| Could use auto-play successfully                             | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  |
| Unsolvable graphs were clearly shown                         | <span style="color: red;"><strong>N</strong></span>    | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span> | <span style="color: red;"><strong>N</strong></span>    | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>5 Y</strong></span>, <span style="color: red;"><strong>2 N</strong></span>                                                           |
| Graph looked clear and easy to follow                        | <span style="color: orange;"><strong>P</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>6 Y</strong></span>, <span style="color: orange;"><strong>1 P</strong></span>                                                        |
| There were **NO** crossing lines                             | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  |
| App did **NOT** crash at any point                           | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  |
| NO bugs or confusing behaviour                               | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: red;"><strong>N</strong></span>   | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: red;"><strong>N</strong></span>    | <span style="color: green;"><strong>5 Y</strong></span>, <span style="color: red;"><strong>2 N</strong></span>                                                           |
| Overall, the app helped them learn graph algorithms          | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span> | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>Y</strong></span>  | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  |

The following table is a summary of the responses. I have included an average where I count Y=2, P=1 and N=0, along with my ideas on the reasons for the responses.

| Question                                                     | Totals                                                                                                                                                                   | Average                                                   | Summary                                                                                                                                       |
| ------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| Could move between the main screens without help             | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  | <span style="color: green;"><strong>2.00</strong></span>  | All of my stakeholders could navigate the app without help, which suggests the main navigation was clear.                                     |
| Screens were easy to read on their device                    | <span style="color: green;"><strong>6 Y</strong></span>, <span style="color: red;"><strong>1 N</strong></span>                                                           | <span style="color: green;"><strong>1.71</strong></span>  | The UI adapted well to different screen sizes, although Jim said the large screen on his 13-inch iPad Pro was not used well enough.           |
| Space theme was engaging and suitable                        | <span style="color: green;"><strong>6 Y</strong></span>, <span style="color: orange;"><strong>1 P</strong></span>                                                        | <span style="color: green;"><strong>1.86</strong></span>  | The theme was received positively overall, although one stakeholder was less enthusiastic than the others.                                    |
| Step-by-step simulation helped them understand the algorithm | <span style="color: green;"><strong>4 Y</strong></span>, <span style="color: orange;"><strong>3 P</strong></span>                                                        | <span style="color: green;"><strong>1.57</strong></span>  | Most found the step-by-step process useful, but for the non comp sci people it did not explain everything.                                    |
| Could explain what the `Frontier` box meant                  | <span style="color: green;"><strong>3 Y</strong></span>, <span style="color: orange;"><strong>2 P</strong></span>, <span style="color: red;"><strong>2 N</strong></span> | <span style="color: orange;"><strong>1.14</strong></span> | Many stakeholders did not understand the Frontier box clearly, often because they did not understand queues or the overall search process.    |
| Could explain what the `Explored` box meant                  | <span style="color: green;"><strong>4 Y</strong></span>, <span style="color: orange;"><strong>1 P</strong></span>, <span style="color: red;"><strong>2 N</strong></span> | <span style="color: orange;"><strong>1.29</strong></span> | More users understood the Explored box than the Frontier box, probably because the name is more self-explanatory.                             |
| Ship movement helped show visit order                        | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  | <span style="color: green;"><strong>2.00</strong></span>  | The ship gave a clear pointer of what users should focus on, and Jon said the backtracking helped show what the algorithm was actually doing. |
| Text explanations were helpful                               | <span style="color: green;"><strong>3 Y</strong></span>, <span style="color: orange;"><strong>3 P</strong></span>, <span style="color: red;"><strong>1 N</strong></span> | <span style="color: orange;"><strong>1.29</strong></span> | The response was positive overall, but some felt the wording was not technical enough.                                                        |
| Felt they understood graph algorithms better after use       | <span style="color: green;"><strong>5 Y</strong></span>, <span style="color: orange;"><strong>2 P</strong></span>                                                        | <span style="color: green;"><strong>1.71</strong></span>  | Everyone said it made more sense afterwards, although some younger users still did not fully understand the wider point.                      |
| Could explain a difference between two algorithms            | <span style="color: green;"><strong>4 Y</strong></span>, <span style="color: orange;"><strong>1 P</strong></span>, <span style="color: red;"><strong>2 N</strong></span> | <span style="color: orange;"><strong>1.29</strong></span> | Most explained differences correctly, but some likely repeated what they had read rather than fully understanding it.                         |
| Could generate a graph successfully                          | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  | <span style="color: green;"><strong>2.00</strong></span>  | They all spent time making graphs and said this part was fun and visually appealing.                                                          |
| Could step forwards and backwards through the algorithm      | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  | <span style="color: green;"><strong>2.00</strong></span>  | The labelled buttons made this easy to use.                                                                                                   |
| Could use auto-play successfully                             | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  | <span style="color: green;"><strong>2.00</strong></span>  | The labelled button and the play/pause icon did not confuse anyone.                                                                           |
| Unsolvable graphs were clearly shown                         | <span style="color: green;"><strong>5 Y</strong></span>, <span style="color: red;"><strong>2 N</strong></span>                                                           | <span style="color: orange;"><strong>1.43</strong></span> | Some missed the explanation text at the end, so a clearer visual indicator would help.                                                        |
| Graph looked clear and easy to follow                        | <span style="color: green;"><strong>6 Y</strong></span>, <span style="color: orange;"><strong>1 P</strong></span>                                                        | <span style="color: green;"><strong>1.86</strong></span>  | The graph was generally clear and easy to follow.                                                                                             |
| There were NO crossing lines                                 | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  | <span style="color: green;"><strong>2.00</strong></span>  | No stakeholder reported crossing lines in the tested graphs.                                                                                  |
| App did NOT crash at any point                               | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  | <span style="color: green;"><strong>2.00</strong></span>  | No crashes occurred during any of the stakeholder test runs.                                                                                  |
| NO bugs or confusing behaviour                               | <span style="color: green;"><strong>5 Y</strong></span>, <span style="color: red;"><strong>2 N</strong></span>                                                           | <span style="color: orange;"><strong>1.43</strong></span> | Two users noticed confusing behaviour, mainly autoplay jumping on large graphs and awkward scrolling.                                         |
| Overall, the app helped them learn graph algorithms          | <span style="color: green;"><strong>7 Y</strong></span>                                                                                                                  | <span style="color: green;"><strong>2.00</strong></span>  | All stakeholders said the app helped them understand graph algorithms better.                                                                 |

#### Open Question Feedback

This table shows the responses to the open feedback questions in the survey:

| Question                                  | Response                                                             |
| ----------------------------------------- | -------------------------------------------------------------------- |
| What was the most useful part of the app? | Made the algorithms clear                                            |
| What was the most useful part of the app? | Helping to understand the graphs                                     |
| What was the most useful part of the app? | Stepping through the algorithms                                      |
| What was the most useful part of the app? | Good intro to graphs                                                 |
| What was the most useful part of the app? | I liked the graphics                                                 |
| What most needs improving?                | Nothing!                                                             |
| What most needs improving?                | It is difficult to know if the solution to a random graph is correct |
| What most needs improving?                | Sound                                                                |
| What most needs improving?                | I'd like to build my own graphs or upload standard graph formats     |
| What most needs improving?                | An explanation of concepts like stacks and queues                    |
| What most needs improving?                | A bit complicated for me                                             |
| What most needs improving?                | More explanation for someone who is not tech savvy like me           |

#### Final Systems Testing Results

As a final check beyond the stakeholder questionnaire, I also reviewed the completed app against the main functional and stability requirements using the finished version of the program after the development bug fixes had been applied.

**TODO**: Refer to the video

| Check ID | Area      | Final check carried out                                                                               | Evidence from final version                                                                                                                                                | Result                                                             |
| -------- | --------- | ----------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| EVAL-01  | Function  | Generate a random graph using normal settings and change graph size and distance                      | Graphs generated successfully and rebuilt correctly after the `planetCount` and `maxDistance` fixes from development testing                                               | <span style="color: green;"><strong>PASSED</strong></span>         |
| EVAL-02  | Function  | Run BFS, DFS, Greedy Best First Search, Dijkstra, and A* on the fixed tree and weighted square graphs | The final results matched the expected behaviour shown in the development correctness tables, including Dijkstra finding the lowest-cost path on the weighted square graph | <span style="color: green;"><strong>PASSED</strong></span>         |
| EVAL-03  | Function  | Step forwards and backwards through an algorithm run                                                  | The current node, explored list, frontier list, and explanation text updated consistently without losing state                                                             | <span style="color: green;"><strong>PASSED</strong></span>         |
| EVAL-04  | Function  | Use auto-play from start to finish on typical graphs                                                  | The full algorithm could be played automatically to completion, although the ship timing was less clear on some larger graphs                                              | <span style="color: orange;"><strong>PARTLY PASSED</strong></span> |
| EVAL-05  | Stability | Run an unsolvable graph to the end                                                                    | The algorithm finished safely without crashing and did not attempt to draw a completed path when no path existed                                                           | <span style="color: green;"><strong>PASSED</strong></span>         |
| EVAL-06  | Stability | Check for obvious invalid graph states                                                                | The start and end planets remained different and the graph stayed usable after rebuilding and recalculating                                                                | <span style="color: green;"><strong>PASSED</strong></span>         |
| EVAL-07  | Stability | Use the app across the main tested screens during stakeholder testing                                 | No crashes occurred during stakeholder use and all seven stakeholders reported that the app did not crash                                                                  | <span style="color: green;"><strong>PASSED</strong></span>         |

<div style="page-break-before: always;"></div>
<div style="page-break-before: always;"></div>

### Success Criteria Evaluation

In the status column I will use the following labels:

| Label                                                              | Meaning                                                                                                                                      |
| ------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| <span style="color: green;"><strong>Met</strong></span>            | The success criterion was achieved fully. Requires an average of 1.5 in user testing.                                                        |
| <span style="color: orange;"><strong>Partially Met</strong></span> | The success criterion was achieved to some extent, but there were still weaknesses or limitations. Requires an average of 1 in user testing. |
| <span style="color: red;"><strong>Not Met</strong></span>          | The success criterion was not achieved. Average of less than 1 in user testing.                                                              |

These work well because they are simple, clear, and easy to justify with evidence from testing and stakeholder feedback. 

| ID              | Description                                                                                                                     | Evidence / Summary                                                                              | Development Tests                                         | Status                                                             |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------------ |
| **Functional**  |                                                                                                                                 |                                                                                                 |                                                           |                                                                    |
| FR1             | The user can generate a graph using simple controls.                                                                            | 7/7 stakeholders were able to generate graphs                                                   | DEV-01, DEV-09, DEV-10, DEV-11, DEV-12, DEV-16            | <span style="color: green;"><strong>Met</strong></span>            |
| FR2             | The app includes a page that explains what graphs and the algorithms are used for.                                              | Satisfied by about page and algorithm page.                                                     | DEV-19, DEV-46                                            | <span style="color: green;"><strong>Met</strong></span>            |
| FR3             | The program correctly runs BFS, DFS, Greedy Best First Search, Dijkstra, and A* on fixed test graphs.                           | All the algorithms I implemented passed the tests producing the correct output for each step.   | DEV-24 to DEV-38                                          | <span style="color: green;"><strong>Met</strong></span>            |
| FR4             | The user can step forwards and backwards through the algorithm one step at a time.                                              | 7/7 stakeholders were able to step through graphs                                               | DEV-05, DEV-06                                            | <span style="color: green;"><strong>Met</strong></span>            |
| FR5             | The user can auto-play the whole algorithm from start to finish.                                                                | 7/7 stakeholders were able to auto play graphs<br>                                              | DEV-07, DEV-22, DEV-47, DEV-49, DEV-50                    | <span style="color: green;"><strong> Met</strong></span>           |
| FR6             | The simulation shows the current node, explored nodes, frontier nodes, and final path using distinct visual changes.            | Satisfied by two labeled lists and the connections with nodes had arrows and could change color | DEV-40, DEV-42, DEV-43, DEV-47                            | <span style="color: green;"><strong>Met</strong></span>            |
| FR7             | The simulation gives a text explanation of what is happening at each step.                                                      | Satisfied by the text element at the centre of the page                                         | No test supplied                                          | <span style="color: green;"><strong> Met</strong></span>           |
| FR8             | The simulation shows when a graph cannot be solved by ending safely and displaying that no path was found.                      | 5/7 stakeholders felt this was clear. 2/7 did not see the message.                              | DEV-47,DEV-51                                             | <span style="color: orange;"><strong>Partially Met</strong></span> |
| FR9             | The ship animation shows the order in which the algorithm visits and backtracks between nodes.                                  | This failed test EVAL-04 on large graphs on autoplay<br>2/7 stakeholders also reported this     | DEV-22                                                    | <span style="color: orange;"><strong>Partially Met</strong></span> |
| FR10            | Graphs should not be rendered with lines crossing each other where possible.                                                    | 7/7 stakeholders had no intersecting lines                                                      | DEV-02                                                    | <span style="color: green;"><strong>Met</strong></span>            |
| **Performance** |                                                                                                                                 |                                                                                                 |                                                           |                                                                    |
| PR1             | The app does not crash during normal use or robustness testing.                                                                 | 7/7 stakeholders reported no crash                                                              | All tests                                                 | <span style="color: green;"><strong>Met</strong></span>            |
| PR2             | On the tested devices, the app updates without noticeable delay when the user changes the graph or uses the algorithm controls. | 7/7 stakeholders did not mention performance as an issue                                        | There was no noticable delay on any screens in my testing | <span style="color: green;"><strong>Met</strong></span>            |
| PR3             | The app checks inputs and prevents invalid graph setups.                                                                        | 7/7 did not report issues                                                                       | DEV-52                                                    | <span style="color: green;"><strong>Met</strong></span>            |
| PR4             | The algorithms do not give incorrect or misleading results on the fixed test graphs.                                            | 7/7 did not report issues                                                                       | DEV-24 to DEV-33                                          | <span style="color: green;"><strong>Met</strong></span>            |
| **Usability**   |                                                                                                                                 |                                                                                                 |                                                           |                                                                    |
| UR1             | Most stakeholder testers can read and use the main screens properly on the tested iPad and Mac screen sizes.                    | 6/7 stakeholders had no issues                                                                  | DEV-20                                                    | <span style="color: green;"><strong>Met</strong></span>            |
| UR2             | Most stakeholder testers can move between the main screens without help.                                                        | 7/7 stakeholders could navigate                                                                 | DEV-15, DEV-46                                            | <span style="color: green;"><strong>Met</strong></span>            |
| UR3             | Most stakeholder testers say the step-by-step simulation helped them understand what the algorithm was doing.                   | 5/7 stakeholders said yes, 2/7 said partially                                                   | DEV-05, DEV-06                                            | <span style="color: green;"><strong> Met</strong></span>           |
| UR4             | Most stakeholder testers can explain at least one difference between two of the algorithms after using the app.                 | 4/7 could expain                                                                                | Partially met user testing requirements                   | <span style="color: orange;"><strong>Partially Met</strong></span> |
| UR5             | Most stakeholder testers can explain what the Frontier and Explored boxes mean.                                                 | 4/7 for Explored<br>3/7 for Frontier                                                            | Failed user testing requirements                          | <span style="color: red;"><strong>Not Met</strong></span>          |
| UR6             | Most stakeholder testers say the space theme is engaging and suitable for the target audience.                                  | 6/7 users said they enjoyed it in the survey.                                                   | Passed user testing requirements                          | <span style="color: green;"><strong>Met</strong></span>            |
While filling in this table for the success criteria, I realised that there were some important tests that I did not include in my test table in development. In particular **FR7** and **PR2** should have been covered.
### Overall Program Evaluation

The feedback from the users was overall very positive. They thought that it made the problem clear with good visual explanations. The overall appearance and theme of the app was rated highly.

The overall usability was great with no users struggling to perform all the functions.  There were some usability issues where I provided a feature but it wasn't understood well. These include the text explanation box and the message when a graph wasn't solvable.

However, three of my users found the program assumed to much as it is meant to target a broad STEM audience. Even these people said it helped their understanding but they found some aspects such as stacks and queues confusing. The word Frontier also meant nothing to them.

Missing features or requests included sound and more graph customisation.

Most of the Usability Tests were well met although people did not find the explanation text as useful as I thought.

From the stakeholder feedback I concluded that the program could assume too much if the user is brand new to computer science. Some users found it harder than I expected to think in terms of logical rather than physical concepts.
<div style="page-break-before: always;"></div>

### Component Evaluation

After judging the success criteria as a whole, I then evaluated each main component of the system in more detail. This helps show which parts of the app worked best, which were weaker, and what I would improve next. 

#### Subcomponent One : Graph generation

| ID                                                                        | Description                                                                                                | Thoughts                                                                                                                                                                                                                                                                                                                                                                                       |
| ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| FR1<br><span style="color: green;"><strong>Met</strong></span>            | The user can generate a graph using simple controls.                                                       | I think the graph generation component was a big success. I could use it to build the random graphs and the test graphs. Every one of my users was able to generate graphs properly. In fact it was the most positively commented on across all sections by the users. Some spend maybe too much time messing around with graph generation trying to create different shapes and patterns.<br> |
| FR8<br><span style="color: orange;"><strong>Partially Met</strong></span> | The simulation shows when a graph cannot be solved by ending safely and displaying that no path was found. | FR8 was partially met as                                                                                                                                                                                                                                                                                                                                                                       |
| FR10<br><span style="color: green;"><strong>Met</strong></span>           | Graphs should not be rendered with lines crossing each other where possible.                               |                                                                                                                                                                                                                                                                                                                                                                                                |
| PR3<br><span style="color: green;"><strong>Met</strong></span>            | The app checks inputs and prevents invalid graph setups.                                                   |                                                                                                                                                                                                                                                                                                                                                                                                |

##### Learnings and things added
I later added non-random test galaxies so that I could verify whether each algorithm had solved the graph correctly. This was useful because random graphs were not always easy to judge by eye. Edges should not intersect as it makes the graph harder to visualise. This is why I introduced the `CheckLines` stage.

##### Implement in future
Validating distance between start and end I did mention this in design but the start and end planets should be a reasonable distance from each other to prevent graphs being solved too quickly. There are three main conditions I could use to determine this:
* Whether the absolute distance between the start and end nodes is less than some predetermined threshold.
* Check if the number of edges between the start and end, this will mean I can specify the minimum number of steps for an algorithm.
* Check if the total weight to the finish is less than a certain value. This would be the same as the number of edges for algorithms that do not use weights.
For the way I have structured the graph generation, I think all of these would have a similar effect because deciding whether there is a connection and the weight itself are both based on absolute distance.

#### Subcomponent Two : Graph Rendering

| ID                                                              | Description                                                                                                          | Thoughts |
| --------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | -------- |
| FR6<br><span style="color: green;"><strong>Met</strong></span>  | The simulation shows the current node, explored nodes, frontier nodes, and final path using distinct visual changes. |          |
| FR10<br><span style="color: green;"><strong>Met</strong></span> | Graphs should not be rendered with lines crossing each other where possible.                                         |          |
| UR1<br><span style="color: green;"><strong>Met</strong></span>  | Most stakeholder testers can read and use the main screens properly on the tested iPad and Mac screen sizes.         |          |


For visualising the difference in the algorithms I definitely achieved the main goal of getting them all running correctly, and visualising the backtracking helps a lot. However, the way the random graphs were generated, with weights proportional to the distance to the node, meant that a few algorithms performed quite similarly. What I could have done was add more noise to the weights in generation.

FR10 was met as I had a function that removed all intersecting paths. In my testing I could not see any intersecting paths.

UR1 was met as none of the users had any issues with reading the text. The only comment was that the UI could have been bigger on larger screens however this did not cause any readability problems.

I used layers to ensure UI elements did not appear ontop of each other prioritising showing text. I used high contrast for text with light colors on a black backround.

#### Subcomponent Three : Algorithm Solving

| ID                                                                        | Description                                                                                                | Thoughts |
| ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | -------- |
| FR3<br><span style="color: green;"><strong>Met</strong></span>            | The program correctly runs BFS, DFS, Greedy Best First Search, Dijkstra, and A* on fixed test graphs.      |          |
| FR8<br><span style="color: orange;"><strong>Partially Met</strong></span> | The simulation shows when a graph cannot be solved by ending safely and displaying that no path was found. |          |
| PR4<br><span style="color: green;"><strong>Met</strong></span>            | The algorithms do not give incorrect or misleading results on the fixed test graphs.                       |          |

**TODO: CRITICAL:** say whether each algorithm worked correctly and refer directly to the weighted square graph and tree graph test results table.

#### Subcomponent Four : Algorithm Control

| ID                                                                        | Description                                                                                                                     | Thoughts |
| ------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | -------- |
| FR4<br><span style="color: green;"><strong>Met</strong></span>            | The user can step forwards and backwards through the algorithm one step at a time.                                              |          |
| FR5<br><span style="color: orange;"><strong>Partially Met</strong></span> | The user can auto-play the whole algorithm from start to finish.                                                                |          |
| PR2<br><span style="color: green;"><strong>Met</strong></span>            | On the tested devices, the app updates without noticeable delay when the user changes the graph or uses the algorithm controls. |          |

UR5 (Most stakeholder testers can explain what the Frontier and Explored boxes mean) was not met as the majority of the stakeholders had no idea what the frontier was and complained that it could be better explained.

**TODO: CRITICAL:** evaluate the step system and undo system.

#### Subcomponent Five : Algorithm Visualisation

| ID                                                                        | Description                                                                                                          | Thoughts |
| ------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | -------- |
| FR6<br><span style="color: green;"><strong>Met</strong></span>            | The simulation shows the current node, explored nodes, frontier nodes, and final path using distinct visual changes. |          |
| FR7<br><span style="color: green;"><strong>Met</strong></span>            | The simulation gives a text explanation of what is happening at each step.                                           |          |
| FR9<br><span style="color: orange;"><strong>Partially Met</strong></span> | The ship animation shows the order in which the algorithm visits and backtracks between nodes.                       |          |
| UR3<br><span style="color: green;"><strong>Met</strong></span>            | Most stakeholder testers say the step-by-step simulation helped them understand what the algorithm was doing.        |          |
| UR5<br><span style="color: red;"><strong>Not Met</strong></span>          | Most stakeholder testers can explain what the Frontier and Explored boxes mean.                                      |          |

**TODO: CRITICAL:** evaluate how clear the colours, ship movement,animations and explanations were. Refer back to the user testing. Mention the problems with the ship timing when doing the auto play

#### Subcomponent Six : User Interface

| ID                                                                        | Description                                                                                                     | Thoughts |
| ------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | -------- |
| FR2<br><span style="color: green;"><strong>Met</strong></span>            | The app includes a page that explains what graphs and the algorithms are used for.                              |          |
| UR1<br><span style="color: green;"><strong>Met</strong></span>            | Most stakeholder testers can read and use the main screens properly on the tested iPad and Mac screen sizes.    |          |
| UR2<br><span style="color: green;"><strong>Met</strong></span>            | Most stakeholder testers can move between the main screens without help.                                        |          |
| UR4<br><span style="color: orange;"><strong>Partially Met</strong></span> | Most stakeholder testers can explain at least one difference between two of the algorithms after using the app. |          |
| UR6<br><span style="color: green;"><strong>Met</strong></span>            | Most stakeholder testers say the space theme is engaging and suitable for the target audience.                  |          |

FR2 was met as I included the how to use and algorithms text based pages. 
This requirement was 
If I were to redo this requirement it would be that this page was useful useful to all users. I could measure this by giving the users a test after they read these pages and see what they understand.
In this case it would only be partially met as some youger less experienced users thought it assumed too much computer science knowledge paticularly around stacks and queues. I found these pages to be a weaker section of the app which could be improved in future.

FR1
FR2
FR3
FR4
FR5
This had a bug for large graphs
FR6
Yes the graph could highlight and I chose different colors to help indicate the current node

FR7
The explanation box had suitable 
However I would have
FR8
Some useres found this confusing as 
When the graph had no connections it confused the user
The only indication was in the explanation box which some users found texious to read each time
FR9
This was met as the ship would move between planets 1 after anouther and correctuly backtracks to the node.
This was one aspect that was affected by the autoplay bug but if used step by step it works great.
FR10

UR1
UR1 was met as the users did not have problems reading the text or information on the screen with no complaints it was too small to read. However Jim infomed me that It would be nice to take advantage if the user has a bigger screen

UR6
For the space theme and visuals UR6 My stakeholders gave complements and were engaged in the theme and visuals
Some users with devices with OLED screens like Jims iPad Pro and Roccos Monitor said the blacks looked great and made it easy to look at 
The Menu Screen looked good on all devices. This is because there are just three buttons and some text.
The Algorithm Description and About pages are 

I liked how swiftUI automatically wraps text on overflow and added "... " if out of space. This made lots of the text still look nice and not overlap with other elements.

**TODO: CRITICAL:** evaluate the menus, navigation and screen layout on different devices. Say how well they fitted.




##### Text Based SwiftUI pages
One small thing I found was that the text and image based information pages were quite static and boring. One reason was that I used images in these screens which were simply screenshots. It may have been better if I had used small SpriteKit windows in the SwiftUI view to make them more interactive. This would future-proof it too, as if I updated the gameplay screens it would automatically update in the information pages instead of me having to take new screenshots. This also meant that the starry background in the screenshots would move relative to the starry background in the page which was a small issue but still could be better.

I also thought the text and UI components did not optimise space particularly well. The back button limited the available screen real estate. To do this better I would have overlayed the UI components and used transparent images.

In terms of maintainability, I think the system is reasonably strong. The program is split into separate areas such as graph generation, search logic, visualisation, and user interface, which should make future changes easier to manage. Using Git and GitHub throughout development also improved maintainability because I could track changes, compare versions, and return to earlier working versions when needed. This would make it much easier to continue developing the project or fix bugs in future.

<div style="page-break-before: always;"></div>

## Conclusion

To conclude, I think I achieved the main goal of this project. I created an app that can generate graphs, solve them using multiple algorithms, and show the solution step by step in a way that is easier to follow. The main functional requirements were met, and the program succeeded in making graph algorithms more accessible and easier to learn by using an engaging analogy that was relatable to my stakeholders.

One of the main strengths of the project is that it is interactive. The user can generate different graphs, choose different algorithms, and watch the process happen visually instead of only reading about it. I believe I gave the user just the right amount of control to allow the user to create useful interesting graphs without being overwhelming.

I think the step-by-step system, the colour coding, and the movement of the ship all helped make the algorithms clearer. The feedback from stakeholders was also positive, and they said that they enjoyed using it, found it pretty and engaging, and better understood the algorithms by the end.

Based on the user feedback, it probably is not a great tool for people that know nothing about computer science. It might be best to use it for students doing GCSE computer science or above.

Another important outcome of the project was what I learned while making it. I developed the app in Swift, which was a new language for me, so this project helped me learn a new programming language as well as new frameworks like SwiftUI and SpriteKit. I also had to learn about new programming concepts like protocols and optionals and new design patterns like Model View Controller. This made the project more difficult, but it also made it more fun.

There are still some improvements that could be made in future, such as refining parts of the interface further, improving some of the timings and animations, and extending the app with more features such as sound or ability to add your own graphs. However, overall I think the project was successful and produced a useful engaging educational tool.

<p align="center"><img src="./screenshots/ConclusionScreen.png" alt="Conclusion Screen" width="75%"></p>

<div style="page-break-before: always;"></div>

## Appendix: Sources

### Example Solutions
- Graph Online - https://graphonline.top/
- TUM Shortest Path Visualisation - https://algorithms.discrete.ma.tum.de/spp/
- PhET Interactive Simulations - https://phet.colorado.edu/

### Documentation and Reference Sources
- Orientation Algorithm For Line Intersection https://www.geeksforgeeks.org/dsa/check-if-two-given-line-segments-intersect/
- Model View Controller explanation - https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html
- Swift Documentation - https://www.swift.org/documentation/
- SwiftUI Documentation - https://developer.apple.com/documentation/swiftui/
- SpriteKit Documentation - https://developer.apple.com/documentation/spritekit/
- Reddit 
- OCR Guidance - https://www.ocr.org.uk/Images/324587-project-setting-guidance.pdf
- OCR Specification - https://www.ocr.org.uk/images/170844-specification-accredited-a-level-gce-computer-science-h446.pdf

### Software and Tools
- Swift Playgrounds - https://developer.apple.com/swift-playground/
- GitHub - https://github.com/
- GitHub Desktop - https://desktop.github.com/
- Obsidian - https://obsidian.md/
- Obsidian Markdown Editor - https://obsidian.md/
- Excalidraw Drawing Tool - https://excalidraw.com/
- Mermaid JS Chart Library - https://mermaid.js.org/
