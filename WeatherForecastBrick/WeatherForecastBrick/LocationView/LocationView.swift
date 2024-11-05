//
//  LocationView.swift
//  WeatherForecastBrick
//
//  Created by Mac on 05.11.2024.
//

import SwiftUI

struct LocationView: View {
    
    @ObservedObject var viewModel = WeatherLocationViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LocationView()
}
