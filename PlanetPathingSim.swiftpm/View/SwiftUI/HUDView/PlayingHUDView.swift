import SwiftUI

struct PlayingHUDView : View{
    @EnvironmentObject var galaxy : Galaxy
    
    var body: some View{
        Grid(alignment: .bottom){
            GridRow{
                Spacer()               
            }
            
            GridRow{
                SpaceList(title : "Frontier", planets : galaxy.getFrontierStrings())
                PlayingButtons().environmentObject(galaxy).gridCellColumns(3)
                SpaceList(title : "Explored", planets : galaxy.getExploredStrings())
            }
        }
        .padding()
        //.background(.white)
    }
}

struct StartHUDView : View{
    
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        HStack(alignment: .bottom){
            VStack{
                Text(galaxy.getAlgorithmString())
                ExplanationBlock().environmentObject(galaxy)
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


struct PlayingButtons : View{
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        VStack{
            ExplanationBlock().environmentObject(galaxy)
            HStack{
                
                SpaceButton(imageSystemName: "arrowtriangle.backward.fill", disabled: !galaxy.backwardAllowed){
                    galaxy.backward()
                }
                
                SpaceButton(imageSystemName: "arrowtriangle.forward.fill", disabled: !galaxy.forwardAllowed){
                    galaxy.forward()
                }
                SpaceButton(imageSystemName: "arrow.3.trianglepath", disabled: false){
                    galaxy.reset()
                }
                SpaceButton(imageSystemName: "hand.draw", disabled: false){
                    galaxy.updateUI(hasAnimation: false)
                }
                SpaceButton(imageSystemName: "togglepower", disabled: false, action: {galaxy.startMode.toggle()})
            }
        }
    }
}
