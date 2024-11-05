import SwiftUI
import Combine

// MARK: - MainContentView
struct MainContentView: View {
    
    @ObservedObject private var viewModel = WeatherLocationViewModel()
    
    @State private var isSheet = false
   
    var body: some View {
        ZStack {
           BackgroundGradientView()
            VStack {
                Spacer()
                
                
                
                LocationButtonView(viewModel: viewModel) {
                    isSheet.toggle()
                }
                
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
       
}

#Preview {
    MainContentView()
}

