//
//  WeatherDetailsViewModelTests.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/8/25.
//


import XCTest
@testable import InfinityWeather

final class WeatherDetailsViewModelTests: XCTestCase {
    
    var mockService: MockWeatherService!
    var viewModel: WeatherDetailsViewModel!
    
    override func setUp() {
        super.setUp()
        mockService = MockWeatherService()
        viewModel = WeatherDetailsViewModel(weatherService: mockService)
    }
    
    override func tearDown() {
        mockService = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testLoadWeather_Success() async throws {
        // Arrange
        let mockWeather = LocationWeather(
            displayTempRange: "22° - 30°",
            icon: "sun.max.fill",
            displayActualTemp: "26°",
            avgTemp: "27°",
            condition: "Sunny",
            avgTempLevel: "Warm",
            city: "Lagos",
            attributes: []
        )
        
        mockService.mockWeather = mockWeather
        mockService.shouldFail = false
    
        let location = LocationCoordinate(
            city: "Lagos",
            lat: "6.5244",
            lon: "3.3792",
            countryCode: "NG",
            state: "Lagos"
        )
        
        // Act
       // try await viewModel.loadWeather(forLocation: location)
        
        
        XCTAssertNotNil(viewModel.weather, "Weather should be loaded")
        XCTAssertEqual(viewModel.weather?.city, "Lagos")
        XCTAssertEqual(viewModel.weather?.condition, "Sunny")
        
        // Assert
      
    }
    
    func testLoadWeather_Failure() async throws {
        // Arrange
        mockService.shouldFail = true
        let location = LocationCoordinate(
            city: "Abuja",
            lat: "9.0578",
            lon: "7.4951",
            countryCode: "NG",
            state: "FCT"
        )
        
        // Act
        try await viewModel.loadWeather(forLocation: location)
        
        // Assert
        XCTAssertNil(viewModel.weather, "Weather should not be loaded when API fails")
    }
}
