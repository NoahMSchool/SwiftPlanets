import SwiftUI

struct HUDView : View{

    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        HStack(alignment: .bottom){
                    PlanetList(title : "Frontier", planets : galaxy.getFrontierStrings())
                    VStack{
                        Text(galaxy.getAlgorithmString())
                        ExplanationBlock().environmentObject(galaxy)
                        GalaxySliders().environmentObject(galaxy)
                        GalaxyButtons().environmentObject(galaxy)
                        HStack{
                            StringPicker(title : "Algorithm",choices : galaxy.searchAlgorithms, selectedValue : $galaxy.selectedAlgorithm)                    
                            StringPicker(title : "UILabelSelection", choices : galaxy.UILabelControls, selectedValue : $galaxy.selectedUILabel)
                            PlanetCountInput().environmentObject(galaxy)

                        }
                    }
                    .padding(.vertical)
                    .border(.green, width: 10)
            
                    PlanetList(title : "Explored", planets : galaxy.getExploredStrings())
        }
        //.frame(height: 500)
        .font(.custom("ChalkDuster", size: 24))
    }
    
}


