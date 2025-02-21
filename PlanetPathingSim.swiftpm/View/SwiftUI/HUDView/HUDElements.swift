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
                
                SpaceButton(imageSystemName: "backward.end.fill", textLabel : "Previous", disabled: !galaxy.backwardAllowed) {
                    galaxy.backward()
                    galaxy.isRunning = false
                }
                
                SpaceButton(imageSystemName: galaxy.isRunning ? "pause.fill" : "arrowtriangle.forward.fill", textLabel: galaxy.isRunning ? "Pause" : "Play", disabled: !galaxy.forwardAllowed) {
                    galaxy.auto()
                }
                
                SpaceButton(imageSystemName: "forward.end.fill", textLabel : "Next", disabled: !galaxy.forwardAllowed){
                    galaxy.forward()
                    galaxy.isRunning = false
                }
                
                SpaceButton(imageSystemName: "forward.end.alt.fill", textLabel: "Solve", disabled: !galaxy.forwardAllowed) {
                    galaxy.solve()
                }

            }
        }
        
    }
}
struct ExplanationBlock : View{
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .stroke(.yellow, lineWidth: 5)
                .fill(.black)
                .opacity(0.75)
            Text(galaxy.getExplanationString())
                .padding(.horizontal)
        }

        .frame(maxHeight: 250)
    }
}
