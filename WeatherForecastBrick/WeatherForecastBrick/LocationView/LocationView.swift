import SwiftUI

// MARK: - LocationView
struct LocationView: View {
    @StateObject var viewModel: WeatherLocationViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            
            // MARK: - Text Field View
            TextFieldView(viewModel: viewModel)
            
            // MARK: - City Button View
            CitiesListView(viewModel: viewModel)
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

