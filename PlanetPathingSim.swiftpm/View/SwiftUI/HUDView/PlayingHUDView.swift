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
                Spacer().gridCellColumns(3)
                DebugButtons()
                Spacer().gridCellColumns(3)
            }
            
            GridRow{  
                DebugGridCell{
                    SpaceList(title : "Frontier",  color: .cyan, planets : galaxy.getFrontierStrings()).gridCellColumns(2)
                }
                DebugGridCell{
                    ButtonsAndExplanationBlock().environmentObject(galaxy).gridCellColumns(3)
                }
                .padding(.horizontal)
                DebugGridCell{
                    SpaceList(title : "Explored", color: .orange, planets : galaxy.getExploredStrings()).gridCellColumns(2)
                    
                }
            }
            
            .frame(maxHeight: 200)
        }
        .frame(maxWidth: .infinity)
        .border(Color.green)
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

struct DebugGridCell<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                Rectangle()
                    .stroke(Color.red, lineWidth: 2) // ✅ Debug Border
            )
    }
}
