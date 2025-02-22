import SwiftUI

struct PlayingHUDView : View{
    @EnvironmentObject var galaxy : Galaxy
    
    var body : some View{
        Grid{
            GridRow{
                TopHUDRow().environmentObject(galaxy)
            }
            Spacer()
            GridRow{  
                SpaceList(title : "Frontier",  color: .cyan, planets : galaxy.getFrontierStrings()).gridCellColumns(2)
                ButtonsAndExplanationBlock().environmentObject(galaxy).gridCellColumns(3)
                .padding(.horizontal, 55)
                SpaceList(title : "Explored", color: .red, planets : galaxy.getExploredStrings()).gridCellColumns(2)
            }
            
            .frame(maxHeight: 250)
        }
        .frame(maxWidth: .infinity)
    }
}


struct DebugButtons : View{
    @State private var showSettingsSheet = false
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        VStack{
            HStack{
                SpaceButton(imageSystemName: "gearshape.fill", textLabel: "Settings", disabled : false){
                    showSettingsSheet = true
                }
//                SpaceButton(imageSystemName: "arrow.3.trianglepath", textLabel : "Reset", disabled: false){
//                    galaxy.resetPlanets()
//                }
//                SpaceButton(imageSystemName: "hand.draw", textLabel : "Redraw", disabled: false){
//                    galaxy.updateUI(hasAnimation: false)
//                }
                SpaceButton(imageSystemName: "togglepower", textLabel : "Toggle", disabled: false, action: {galaxy.startMode.toggle()})
                
            }
        }
        .sheet(isPresented: $showSettingsSheet){
            SettingsView().environmentObject(galaxy)

        }
    }
}
