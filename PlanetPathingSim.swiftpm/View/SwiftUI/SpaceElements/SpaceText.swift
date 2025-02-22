import SwiftUI

struct TitleNameView: View{
    var body : some View{
        Text("Planetary Pathways")
            .font(.custom("Chalkduster", size: 72))
            .foregroundColor(.yellow)
    }
}

struct SpaceHeading: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.custom("Chalkduster", size: 32))
            //.foregroundColor(.yellow)

    }
}

struct SpaceSubheading: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.custom("Chalkduster", size: 20))
            //.foregroundColor(.yellow)

    }
}


struct SpaceText: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.custom("Chalkduster", size: 14))
            //.foregroundColor(.yellow)

    }
}
