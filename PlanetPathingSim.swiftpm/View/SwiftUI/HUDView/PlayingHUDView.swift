import SwiftUI

struct PlayingHUDView : View{
    @EnvironmentObject var galaxy : GameController
    
    var body : some View{
        Grid(alignment: .top){
            
            GridRow(alignment: .top){
                TopPlayingHUDRow()
                    .environmentObject(galaxy)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)            
            
            Spacer()
            
            GridRow{  
                BottomPlayingHUDRow()
                    .environmentObject(galaxy)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: 280)
        }
    }
}

struct TopPlayingHUDRow : View{
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var galaxy : GameController
    var body: some View{
        SpaceButton(imageSystemName: "arrowshape.turn.up.backward.fill", textLabel : "Galaxy Builder", disabled: false){
            galaxy.resetAlgorithm()
            galaxy.startMode.toggle()
        }
        VStack{
            Text("\(galaxy.selectedAlgorithm) Algorithm")
                .modifier(SpaceHeading())
            Text(" Step Number : \(String(galaxy.getMoveStep()))")         
                .modifier(SpaceSubheading())
        }.gridCellColumns(5)
        VStack{
            SpaceButton(imageSystemName: "location.fill", textLabel: "Focus On Ship", disabled: false){
                galaxy.focusOnShip = true  
            }
            SpaceButton(imageSystemName: galaxy.lockOnShip ? "lock.open.fill" : "lock.fill", textLabel: "Lock On Ship", disabled: false){
                galaxy.lockOnShip.toggle()
            }
            
        }
        
    }
}


struct BottomPlayingHUDRow : View {
    @EnvironmentObject var galaxy : GameController

    var body: some View{
        SpaceList(title : "Frontier",  color: .cyan, planets : galaxy.getFrontierStrings())
            .frame(maxWidth: .infinity)
            .gridCellColumns(2)
        
        ButtonsAndExplanationBlock().environmentObject(galaxy)
            .frame(maxWidth: .infinity)
            .gridCellColumns(3)
        
        SpaceList(title : "Explored", color: .red, planets : galaxy.getExploredStrings())
            .frame(maxWidth: .infinity)
            .gridCellColumns(2)

    }
}
