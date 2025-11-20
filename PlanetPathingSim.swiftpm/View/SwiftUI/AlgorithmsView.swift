import SwiftUI

struct AlgorithmsView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        
        GeometryReader { geometry in
            ZStack {
                StarryBackgroundView()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                VStack(alignment: .center){
                    Text("Algorithms")
                        .modifier(SpaceHeading())
                    ScrollView(){
                        
                        Text("Graph search algorithms are used to find a node in a graph. Software like Apple Maps use more advanced combination of the algorithms displayed here to find the route for you can take. To make this easier to understand I have used space terms instead of the more technical terms to make it easier to understand the core concepts. Instead of the term graph I will use Galaxy, Instead of Node I will use planet and Instead of Edge I will use path. The tem")
                            .padding()
                        
                        Text("The Heuristic used for the more complex algorithms measures the distance on the map as the spaceship flies. This is very accurate for the random galaxies, but less so for the Tree and Square Test galaxies, which makes it more interesting!")
                            .padding()
                        
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
                    }.modifier(SpaceText())
                        .frame(maxWidth: 500)
                    
                    LargeSpaceButton(text: "Main Menu", imageSystemName: "arrowshape.turn.up.backward.fill", action: {presentationMode.wrappedValue.dismiss()})
                        .padding(.vertical, 50)
                    
                }
            }
        }
        
    }
    
}




