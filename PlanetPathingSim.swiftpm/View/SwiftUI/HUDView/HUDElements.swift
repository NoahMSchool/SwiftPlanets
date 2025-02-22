import SwiftUI

//Playing Elements
struct ButtonsAndExplanationBlock : View{
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        VStack{
            ExplanationBlock().environmentObject(galaxy)
                .padding(.vertical)
            
            HStack{
                SpaceButton(imageSystemName: "backward.end.alt.fill", textLabel : "Reset", disabled: !galaxy.backwardAllowed) {
                    galaxy.resetAlgorithm()
                }
                
                SpaceButton(imageSystemName: "backward.end.fill", textLabel : "Undo", disabled: !galaxy.backwardAllowed) {
                    galaxy.backward()
                    galaxy.isRunning = false
                }
                
                SpaceButton(imageSystemName: "forward.end.fill", textLabel : "Next", disabled: !galaxy.forwardAllowed){
                    galaxy.forward()
                    galaxy.isRunning = false
                }
                
                SpaceButton(imageSystemName: "forward.end.alt.fill", textLabel: "Solve", disabled: !galaxy.forwardAllowed) {
                    galaxy.solve()
                }
                
                SpaceButton(imageSystemName: galaxy.isRunning ? "pause.fill" : "arrowtriangle.forward.fill", textLabel: galaxy.isRunning ? "Pause" : "Auto", disabled: !galaxy.forwardAllowed) {
                    galaxy.auto()
                }
                //.padding(.horizontal, 25)
                
            }
            
        }
    }
}
struct ExplanationBlock : View{
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .stroke(.yellow, lineWidth: 5)
                .fill(.black)
                .opacity(0.8)
            
            Text(galaxy.getExplanationString())
                .padding(.horizontal)
            
        }
        
        //.frame(maxHeight: 100)
        //    }
    }
}
struct TopHUDRow : View{
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var galaxy : Galaxy
    var body: some View{
        SpaceButton(imageSystemName: "arrowshape.turn.up.backward.fill", textLabel : "Main Menu", disabled: false){
            presentationMode.wrappedValue.dismiss()
        }
        VStack{
            Text(galaxy.selectedAlgorithm)
                .modifier(SpaceHeading())
            Text(" Step Number : \(String(galaxy.getMoveStep()))")         
                .modifier(SpaceSubheading())
        }.gridCellColumns(5)
        
        DebugButtons()
        
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
