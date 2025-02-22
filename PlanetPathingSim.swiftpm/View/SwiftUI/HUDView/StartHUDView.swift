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
