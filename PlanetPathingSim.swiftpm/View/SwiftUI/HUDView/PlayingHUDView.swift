import SwiftUI

struct PlayingHUDView : View{
    @EnvironmentObject var galaxy : Galaxy
    
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
            .frame(maxWidth: .infinity, maxHeight: 200)
        }
    }
}

struct TopPlayingHUDRow : View{
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


struct BottomPlayingHUDRow : View {
    @EnvironmentObject var galaxy : Galaxy

    var body: some View{
        
        SpaceList(title : "Frontier",  color: .cyan, planets : galaxy.getFrontierStrings())
            .frame(maxWidth: .infinity)
            .gridCellColumns(2)
        
        ButtonsAndExplanationBlock().environmentObject(galaxy)
            .frame(maxWidth: .infinity)
            .gridCellColumns(3)
        
        SpaceList(title : "Explored", color: .orange, planets : galaxy.getExploredStrings())
            .frame(maxWidth: .infinity)
            .gridCellColumns(2)

    }
}
