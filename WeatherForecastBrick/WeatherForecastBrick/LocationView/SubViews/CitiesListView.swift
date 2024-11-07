import SwiftUI

// MARK: - CitiesListView
struct CitiesListView: View {
    @StateObject var viewModel: WeatherLocationViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {

        // MARK: - List
        let cities = viewModel.cities.enumerated().map({ $0 })
        List(cities, id: \.element) { index, city in
            
            // MARK: - Row Select Button
            Button {
                viewModel.updateSelectedCity(at: index)
                dismiss()
              
            } label: {
                HStack {
                    // MARK: - City Name and Country Name
                    Text("\(city.cityName), \(city.countryName)")
                        .font(.system(size: 25, weight: .medium))
                    
                    Spacer()
                    
                    // MARK: - Selected City
                    if city == viewModel.city {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "circle")
                    }
                }
            }
            .listRowBackground(city == viewModel.city ? Color.gray.opacity(0.2) : Color.clear)
        }
        .listStyle(.plain)
    }
}
