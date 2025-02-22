import SwiftUI

struct PlayingHUDView : View{
    @EnvironmentObject var galaxy : Galaxy
    
    var body : some View{
        Grid(alignment: .top){
            
            GridRow(alignment: .top){
                TopHUDRow()
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
