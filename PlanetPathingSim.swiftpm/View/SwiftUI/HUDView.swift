import SwiftUI

struct HUDView : View{

    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        HStack(alignment: .bottom){
                    PlanetList(title : "Frontier", planets : galaxy.getFrontierStrings())
                    VStack{
                        ExplanationBlock().environmentObject(galaxy)
                        GalaxySliders().environmentObject(galaxy)
                        GalaxyButtons().environmentObject(galaxy)        
                    }
                    .border(.green, width: 10)
            
                    PlanetList(title : "Explored", planets : galaxy.getExploredStrings())
        }
        .frame(height: 500)
        .font(.custom("ChalkDuster", size: 24))
    }
    
}


