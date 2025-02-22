import SwiftUI

struct PlayingHUDView : View{
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject var galaxy : Galaxy
    
    var body : some View{
        Grid(alignment: .bottom){
            GridRow{
                HStack{
                    SpaceButton(imageSystemName: "chevron.backward", textLabel : "Main Menu", disabled: false){
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                }
                VStack{
                    Text(galaxy.selectedAlgorithm)
                        .font(.custom("ChalkDuster", size: 24))
                    Text(" Step Number : \(String(galaxy.getMoveStep()))")         
                        .font(.custom("ChalkDuster", size: 18))
                }
                .gridCellColumns(2)

                         
                DebugButtons()
            }

            Spacer()
            
            
            GridRow{
                
                SpaceList(title : "Frontier",  color: .cyan, planets : galaxy.getFrontierStrings())
                ButtonsAndExplanationBlock().environmentObject(galaxy).gridCellColumns(2)
                SpaceList(title : "Explored", color: .orange, planets : galaxy.getExploredStrings())
            }
            .frame(maxHeight: 200)
        }
        .font(.custom("ChalkDuster", size: 16))
        .foregroundColor(.yellow)
        .padding()
        //.background(.white)
        .opacity(0.8)
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
