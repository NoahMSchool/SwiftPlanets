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






struct SettingsButton : View{
    @State private var showSettingsSheet = false
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        VStack{
            SpaceButton(imageSystemName: "gearshape.fill", textLabel: "Settings", disabled : false){
                showSettingsSheet = true
            }
            
        }
        .sheet(isPresented: $showSettingsSheet){
            SettingsView().environmentObject(galaxy)
            
        }
    }
}
