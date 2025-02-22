import SwiftUI

struct StartHUDView : View{
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
                BottomStartHUDRow()
                    .environmentObject(galaxy)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
        }
    }
}

struct BottomStartHUDRow : View {
    @EnvironmentObject var galaxy : Galaxy
    var body: some View{
        
        // Color(.blue)
        GalaxySliders().environmentObject(galaxy)
            .frame(maxWidth: .infinity)
            .gridCellColumns(2)
        
        LargeSpaceButton(text : "Start", imageSystemName: "play.fill") {
            
        }
            .padding()
            .frame(maxWidth: .infinity)
            .gridCellColumns(3)
        
         SpacePicker(title : "Search Algo", choices : galaxy.searchAlgorithms, selectedValue : $galaxy.selectedAlgorithm)
            .frame(maxWidth: .infinity)
            .gridCellColumns(2)
    }
}

