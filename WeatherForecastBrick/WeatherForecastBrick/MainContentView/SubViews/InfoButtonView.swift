import SwiftUI

struct InfoButtonView: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Rectangle()
                .frame(width: 175, height: 65)
                .clipShape(RoundedCorners(corners: [.topLeft, .topRight], radius: 10))
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.orangeTop, Color.orangeBottom]), startPoint: .top, endPoint: .bottom))
                .overlay {
                    Text("INFO")
                        .font(Font.custom("Ubuntu-Bold", size: 18))
                        .foregroundColor(.black)
                }
        }
    }
}
