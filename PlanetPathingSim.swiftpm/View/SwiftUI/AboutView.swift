import SwiftUI

struct AboutView : View{
    var body : some View{
        GeometryReader { geometry in
                ZStack {
                    StarryBackgroundView()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)

                    ScrollView(){
                        Text("About").font(.custom("ChalkDuster", size: 32))
                        Text("""
                        Planetary Pathways is an interatctive pathfinding simulator that aims to display different search algorithms in a fun way using planets
                        
                        """)

                        Text("About The Algorithms").font(.custom("ChalkDuster", size: 32))
                        
                        Text("""
                        Dijkstra is an algorithm that finds the shortest path on a graph                        
                        """)

                    }
                    .font(.custom("ChalkDuster", size: 16))
                    .foregroundColor(.yellow)
                    .frame(maxWidth: 500)
                    
                }
        }
    }
}
