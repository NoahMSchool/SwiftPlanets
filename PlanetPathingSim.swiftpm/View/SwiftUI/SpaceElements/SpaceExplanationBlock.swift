import SwiftUI

struct ExplanationBlock : View{
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.black)
            Text(galaxy.getExplanationString())
            
        }
        .frame(maxWidth: 500, maxHeight: 250)
        .border(Color.pink, width: 5)
    }
}
