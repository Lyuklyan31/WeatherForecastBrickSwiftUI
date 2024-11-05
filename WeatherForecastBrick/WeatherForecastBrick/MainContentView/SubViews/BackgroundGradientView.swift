import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color(UIColor.lineaGradientYellow.withAlphaComponent(0.30)), location: 0.4),
                .init(color: Color(UIColor.lineaGradientBlue.withAlphaComponent(0.30)), location: 0.6)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
