import SwiftUI

// MARK: - LocationButtonView
struct LocationButtonView: View {
    var viewModel: WeatherLocationViewModel
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(.placeArrow)
                    .padding(.trailing, 5)
                
                Text("\(viewModel.city.cityName), \(viewModel.city.countryName)")
                    .foregroundColor(.black)
                    .font(Font.custom("Ubuntu-Bold", size: 17))
                
                Image(.magnifyingGlass)
                    .padding(.leading, 5)
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 30)
    }
}
