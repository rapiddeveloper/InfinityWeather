# 🌤 InfinityWeather

**InfinityWeather** is a simple and elegant iOS app built with **SwiftUI**.  
It allows users to search for cities, view current weather data, and save their favorite locations for quick access.

---

## 🏠 Features

- 🚀 **Splash Screen** – Launch screen transitions smoothly to the home page.  
- 🔍 **Home Screen** – Search for any city and instantly view current weather conditions.  
- ☀️ **Weather Details Screen** – Displays detailed weather information including temperature and description.  
- ❤️ **Favorite Location** – Save your favorite cities so the search field is prefilled on next launch.  
- ❤️ **Favorites Screen** – View your favorite cities.  
- 🌍 **Live Weather Data** – Uses the [OpenWeather API](https://openweathermap.org/current) to fetch real-time weather data.  

---

## ⚙️ How It Works

1. On launch, the splash screen transitions automatically to the **Home Screen**.  
2. Enter a city name and tap “Search.” on keyboard  
3. The app retrieves current weather data from the **OpenWeather API**, including:  
   - Current temperature  
   - Weather condition/description  
4. Tap on a city to open the **Weather Details** screen.  
5. Save the city to **Favorites** for quick future access.  

---

## 🧩 Tech Stack

- **SwiftUI** – Declarative UI framework  
- **MVVM Architecture** – Clear separation of UI and logic  
- **OpenWeather API** – Reliable source for weather data  
- **AppStorage / UserDefaults** – Persistent favorites management  

---

## 🚀 Getting Started

### Prerequisites
- macOS with **Xcode 16+**
- A valid **OpenWeather API Key**

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/InfinityWeather.git
   
2. Open the project in Xcode

3. Add your API key to a configuration file (Dev.xcconfig)
OPEN_WEATHER_API_KEY=your_api_key_here

4.  Build and run the app on the iOS Simulator or a real device.

