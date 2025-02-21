import SwiftUI

struct PlayingHUDView : View{
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject var galaxy : Galaxy
    
    var body: some View{
        Grid(alignment: .bottom){
            GridRow{
                SpaceButton(imageSystemName: "chevron.backward", textLabel : "Main Menu", disabled: false){
                    presentationMode.wrappedValue.dismiss()
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
                
                SpaceList(title : "Frontier", planets : galaxy.getFrontierStrings())
                ButtonsAndExplanationBlock().environmentObject(galaxy).gridCellColumns(2)
                SpaceList(title : "Explored", planets : galaxy.getExploredStrings())
            }
            .frame(maxHeight: 200)
        }
        .font(.custom("ChalkDuster", size: 14))
        .foregroundColor(.yellow)
        .padding()
        .opacity(0.8)
//                .background(.white)
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
                SpaceButton(imageSystemName: "arrow.3.trianglepath", textLabel : "Reset", disabled: false){
                    galaxy.resetPlanets()
                }
                SpaceButton(imageSystemName: "hand.draw", textLabel : "Redraw", disabled: false){
                    galaxy.updateUI(hasAnimation: false)
                }
                SpaceButton(imageSystemName: "togglepower", textLabel : "Toggle", disabled: false, action: {galaxy.startMode.toggle()})
            }
        }
        .sheet(isPresented: $showSettingsSheet){
            SettingsView().environmentObject(galaxy)

        }
    }
}
