import SwiftUI

struct AboutView : View{
    
    @Environment(\.presentationMode) var presentationMode
    
    var body : some View{
        GeometryReader { geometry in
            ZStack {
                StarryBackgroundView()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                VStack(alignment: .center){
                    Text("About")
                        .modifier(SpaceHeading())
                    ScrollView(){
                        Text("""
                            Planetary Pathways is an interactive pathfinding simulator that aims to display different search algorithms in a fun way using planets
                            """)
                        
                        AboutAlgorithmsView()                        
                        
                    }
                    .modifier(SpaceText())
                    .frame(maxWidth: 500)
                    LargeSpaceButton(text: "Main Menu", imageSystemName: "arrowshape.turn.up.backward.fill", action: {presentationMode.wrappedValue.dismiss()})
                        .padding(.vertical, 50)
                }
            }
        }
    }
}
struct AboutAlgorithmsView: View {
    
    var body: some View {
        ForEach(Galaxy.searchAlgorithms, id: \.self) { algorithm in
            if let algorithmType = Galaxy.algorithmTypes[algorithm] {
                Image(systemName: algorithmType.getIcon()) 
                Text(algorithm)  
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
    }
}
