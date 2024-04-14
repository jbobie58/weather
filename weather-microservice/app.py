from flask import Flask, jsonify
import requests
import requests_cache
import pandas as pd
import matplotlib.pyplot as plt

app = Flask(__name__)

# Set up requests caching
requests_cache.install_cache('weather_cache', expire_after=3600)  # Cache responses for 1 hour

@app.route('/', methods=['GET'])
def get_weather():
    # Define API URL and parameters
    url = "https://api.open-meteo.com/v1/forecast"
    params = {
        'latitude': 38.89511,  # Latitude for Washington, DC
        'longitude': -77.03637,  # Longitude for Washington, DC
        # "latitude": 52.52,
        # "longitude": 13.41,
        "hourly": "temperature_2m",
        "daily": "weather_code"
    }

    # Fetch historical weather data
    try:
        response = requests.get(url, params=params)
        response.raise_for_status()  # Raise an exception for bad responses

        weather_data = response.json()
        print("Weather data:", weather_data)  # Debugging print statement

        # Extract relevant information from weather data
        timestamps = weather_data['hourly']['time']
        temperatures = weather_data['hourly']['temperature_2m']

        # Create a DataFrame
        df = pd.DataFrame({'timestamp': timestamps, 'temperature': temperatures})

        # Generate a line chart
        plt.figure()  # Create a new Figure object
        df.plot(x='timestamp', y='temperature', title='Hourly Temperature Forecast')
        plt.xlabel('Timestamp')
        plt.ylabel('Temperature (°C)')

        # Save the chart as a PNG image
        plt.savefig('weather_chart.png')

        return jsonify({'message': 'Chart generated successfully', 'weather_data': weather_data})
    except Exception as e:
        print("Error fetching or processing weather data:", e)
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)





# from flask import Flask, jsonify
# import requests

# app = Flask(__name__)

# @app.route('/weather', methods=['GET'])
# def get_weather():
#     api_url = "https://api.open-meteo.com/v1/forecast"
#     params = {
#         'latitude': 38.89511,  # Latitude for Washington, DC
#         'longitude': -77.03637,  # Longitude for Washington, DC
#         'current_weather': True,
#         'language': 'en'
#     }

#     response = requests.get(api_url, params=params)
#     if response.status_code == 200:
#         weather_data = response.json()
#         print("Weather data:", weather_data)  # Debugging print statement
#         current_weather = weather_data.get('current_weather', {})
#         return jsonify(current_weather)
#     else:
#         print("Error fetching weather data. Status code:", response.status_code)
#         return jsonify({'error': 'Failed to fetch weather data'}), 500

# if __name__ == '__main__':
#     app.run(debug=True)