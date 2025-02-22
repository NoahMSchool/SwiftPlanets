import SwiftUI

struct StartHUDView : View{
    @EnvironmentObject var galaxy : Galaxy    
    var body : some View{
        Grid(alignment: .bottom){
            GridRow{
                TopHUDRow().environmentObject(galaxy)
            }
            
            Spacer()
            
            
            GridRow{
                Color(.green)
                //ButtonsAndExplanationBlock().environmentObject(galaxy).gridCellColumns(2)
                VStack{
                    
                    HStack{
//                        PlanetCountInput().environmentObject(galaxy)
                        GalaxySliders().environmentObject(galaxy)
                    }
                    
                    
                }.gridCellColumns(2)
                Color(.red)
            }
            .frame(maxHeight: 200)
        }
    }
}
    /*
HStack(alignment: .bottom){
    VStack{
        DebugButtons().environmentObject(galaxy)
        Text(galaxy.getAlgorithmString())
        GalaxySliders().environmentObject(galaxy)
        GalaxyButtons().environmentObject(galaxy)
        HStack{
            SpacePicker(title : "Algorithm",choices : galaxy.searchAlgorithms, selectedValue : $galaxy.selectedAlgorithm)                    
            
        }
    }
    .padding(.vertical)
}
//.frame(height: 500)
.font(.custom("ChalkDuster", size: 24))
.foregroundColor(.yellow)
}
*/

