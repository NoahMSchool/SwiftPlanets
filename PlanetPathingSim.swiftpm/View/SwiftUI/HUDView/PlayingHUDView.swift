import SwiftUI

struct PlayingHUDView : View{
    @EnvironmentObject var galaxy : Galaxy
    
    var body: some View{
        Grid(alignment: .bottom){
            GridRow{
                SpaceButton(imageSystemName: "chevron.backward", textLabel : "Main Menu", disabled: false, action: {print("Back")})
                TestButtons().gridCellColumns(3)
                
            }
            //Color(.red)
            Spacer()               
            GridRow{
                
                SpaceList(title : "Frontier", planets : galaxy.getFrontierStrings())
                ButtonsAndExplanationBlock().environmentObject(galaxy).gridCellColumns(2)
                SpaceList(title : "Explored", planets : galaxy.getExploredStrings())
            }
        }
        .font(.custom("ChalkDuster", size: 18))
        .foregroundColor(.yellow)
        .padding()
        //        .background(.white)
    }
}


struct TestButtons : View{
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        VStack{
            HStack{
                
                SpaceButton(imageSystemName: "arrow.3.trianglepath", textLabel : "Reset", disabled: false){
                    galaxy.resetPlanets()
                }
                SpaceButton(imageSystemName: "hand.draw", textLabel : "Redraw", disabled: false){
                    galaxy.updateUI(hasAnimation: false)
                }
                SpaceButton(imageSystemName: "togglepower", textLabel : "Toggle", disabled: false, action: {galaxy.startMode.toggle()})
            }
        }
    }
}
