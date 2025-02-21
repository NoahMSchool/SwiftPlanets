import SwiftUI

struct StartHUDView : View{
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        HStack(alignment: .bottom){
            VStack{
                DebugButtons().environmentObject(galaxy)
                Text(galaxy.getAlgorithmString())
                GalaxySliders().environmentObject(galaxy)
                GalaxyButtons().environmentObject(galaxy)
                HStack{
                    SpacePicker(title : "Algorithm",choices : galaxy.searchAlgorithms, selectedValue : $galaxy.selectedAlgorithm)                    
                    PlanetCountInput().environmentObject(galaxy)
                    
                }
            }
            .padding(.vertical)
        }
        //.frame(height: 500)
        .font(.custom("ChalkDuster", size: 24))
        .foregroundColor(.yellow)
    }
    
}
