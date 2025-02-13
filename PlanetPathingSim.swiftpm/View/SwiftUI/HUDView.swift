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
                        Picker("Search Algorithm", selection: $galaxy.selectedAlgorithm){
                            ForEach (galaxy.searchAlgoritm, id : \.self){
                                option in Text(option).tag(option)
                            }
                        }

                        .pickerStyle(MenuPickerStyle())

                        .background(Color(.systemBackground))
                        .cornerRadius(50)
                        PlanetCountInput().environmentObject(galaxy)
                    }
                    .padding(.vertical)
                    .border(.green, width: 10)
            
                    PlanetList(title : "Explored", planets : galaxy.getExploredStrings())
        }
        //.frame(height: 500)
        .font(.custom("ChalkDuster", size: 24))
    }
    
}


