import SwiftUI

// MARK: - TextFieldView
struct TextFieldView: View {
    
    // MARK: - WeatherLocationViewModel
    @StateObject var viewModel: WeatherLocationViewModel
    
    //  MARK: - Properties
    @State private var searchText: String = ""
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack {
            // MARK: - RoundedRectangle
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 50)
                .padding()
            
            HStack {
                // MARK: - Image Magnifyingglass
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 24)
                
                // MARK: - SearchTextField
                TextField("Enter location", text: $searchText)
                    .focused($isTextFieldFocused)
                
                // MARK: - Clear Search Text
                if isTextFieldFocused {
                    Button {
                        searchText = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 24)
                    }
                }
            }
        }
        // MARK: - Fetch Cities
        .onChange(of: searchText) {
            Task {
                await self.viewModel.fetchCities(for: searchText)
            }
        }
        
        // MARK: - Get City Name and Country Name
        .onAppear {
            searchText = "\(viewModel.city.cityName), \(viewModel.city.countryName)"
        }
    }
}
