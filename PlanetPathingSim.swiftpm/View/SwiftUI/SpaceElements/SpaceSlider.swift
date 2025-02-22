import SwiftUI

struct SpaceSlider: View {
    var title: String
    var range: ClosedRange<Double>
    var step: Double
    @Binding var value: Double
    
    var body: some View {
        VStack {
            Text("\(title): \(Int(value))")
                .modifier(SpaceSubheading())
            Slider(value: $value, in: range, step: step)
        }
    }
}
