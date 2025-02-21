import SwiftUI

struct StartHUDView : View{
    
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        HStack(alignment: .bottom){
            VStack{
                Text(galaxy.getAlgorithmString())
                GalaxySliders().environmentObject(galaxy)
                GalaxyButtons().environmentObject(galaxy)
                HStack{
                    SpacePicker(title : "Algorithm",choices : galaxy.searchAlgorithms, selectedValue : $galaxy.selectedAlgorithm)                    
                    SpacePicker(title : "UILabelSelection", choices : galaxy.UILabelControls, selectedValue : $galaxy.selectedUILabel)
                    PlanetCountInput().environmentObject(galaxy)
                    
                }
            }
            .padding(.vertical)
            .border(.green, width: 10)
        }
        //.frame(height: 500)
        .font(.custom("ChalkDuster", size: 24))
        .foregroundColor(.yellow)
    }
    
}
