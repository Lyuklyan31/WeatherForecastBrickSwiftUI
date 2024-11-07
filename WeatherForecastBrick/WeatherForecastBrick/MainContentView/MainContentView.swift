import SwiftUI
import Combine

// MARK: - MainContentView
struct MainContentView: View {
    
    @ObservedObject private var viewModel = WeatherLocationViewModel()
    @State private var isSheet = false
    
    @State private var buttonTitle = ""
    var body: some View {
        
        ZStack {
            // MARK: - BackgroundGradientView
            BackgroundGradientView()
            
            VStack {
                
                // MARK: - WeatherDataView
                VStack {
                    if let weatherData = viewModel.weatherData,
                       let firstCondition = weatherData.weather.first {
                        
                        let tempInCelsius = weatherData.main.temp.kelvinToCelsius()
                        let weatherType = getWeatherType(from: firstCondition.main.rawValue, temperature: tempInCelsius)
                        
                        // MARK: - WeatherTypeView
                        Image(uiImage: weatherType.image)
                            .resizable()
                            .scaledToFit()
                        
                        Spacer()
                        
                        // MARK: - TemperatureView
                        HStack {
                            Text("\(tempInCelsius)")
                                .foregroundColor(.black)
                                .font(Font.custom("Ubuntu-Regular", size: 83))
                                .padding(.leading)
                                .overlay {
                                    Text("0")
                                        .foregroundColor(.black)
                                        .font(Font.custom("Ubuntu-Bold", size: 40))
                                        .offset(x: 65, y: -25)
                                }
                            
                            Spacer()
                        }
                        
                        // MARK: - WeatherTypeView
                        HStack {
                            Text(weatherType.rawValue)
                                .foregroundColor(.black)
                                .font(Font.custom("Ubuntu-Light", size: 36))
                                .padding(.leading)
                                .padding(.bottom, 120)
                            
                            Spacer()
                        }
                    }
                }
                
                // MARK: - LocationButtonView
                LocationButtonView(viewModel: viewModel) {
                    isSheet.toggle()
                }
                
                // MARK: - InfoButtonView
                InfoButtonView {
                    print("Info button tapped")
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.refreshData()
        }
        
        .sheet(isPresented: $isSheet) {
            LocationView(viewModel: viewModel)
        }
    }
    
    // MARK: - Weather Type Handling
    func getWeatherType(from condition: String, temperature: Int) -> WeatherTypes {
        if temperature > 30 {
            return .hot
        }
        return WeatherTypes(rawValue: condition.capitalized) ?? .clear
    }
}

#Preview {
    MainContentView()
}

