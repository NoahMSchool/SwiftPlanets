import SwiftUI

//Playing Elements
struct ButtonsAndExplanationBlock : View{
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        VStack{
            ExplanationBlock().environmentObject(galaxy)
                .padding(.vertical)
            HStack{
                SpaceButton(imageSystemName: "backward.end.alt.fill", textLabel : "Reset", disabled: !galaxy.backwardAllowed, action: {galaxy.resetAlgorithm()})
                SpaceButton(imageSystemName: "backward.end.fill", textLabel : "Previous", disabled: !galaxy.backwardAllowed){galaxy.backward()}
                SpaceButton(imageSystemName: "forward.end.fill", textLabel : "Next", disabled: !galaxy.forwardAllowed){galaxy.forward()}
                SpaceButton(imageSystemName: "forward.end.alt.fill", textLabel: "Solve", disabled: !galaxy.forwardAllowed, action: {galaxy.solve()})
                SpaceButton(imageSystemName: "arrowtriangle.forward.fill", textLabel: "Auto", disabled: !galaxy.forwardAllowed, action: {print("AutoPlay")})

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
