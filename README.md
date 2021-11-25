# Back-end for a weather app

# Weather Api.

In this App, you are part of a team building a travel company platform. One requirement is for a REST API service to provide weather information using the Ruby on Rails framework. You will need to add functionality to add and delete information as well as to perform some queries. You will be dealing with typical information for weather data like latitude, longitude, temperature, etc. The team has come up with a set of requirements including filtering and ordering requirements, response codes and error messages for the queries you must implement.

Each weather data is a JSON entry with the following keys:

- id: This is the unique weather data ID.
- date: This is the weather data record date given in the format yyyy-mm-dd.
- location: The place for which the weather data was recorded. The location itself is a JSON object consisting of the following fields:
- lat: The latitude (up to four decimal places) of the location.
- lon: The longitude (up to four decimal places) of the location.
- city: This is the city name.
- state: This is the state name.
- temperature: This is an array of 24 float values (up to one decimal place), describing the hourly temperature (in F) for the given location.

## Objectives

The REST service should implement the following functionalities:

- Erasing all the weather data: The service should be able to erase all the weather data by the `DELETE request at /erase` The HTTP response code should be 200.

- Erasing all the weather data by the date range inclusive and the location coordinates: The service should be able to erase all the weather data by the date range inclusive and the location coordinates by the
  `DELETE request at /erase?start={startDate}&end={endDate}&lat={latitude}&lon={longitude}`
  The HTTP response code should be 200.

- Adding new weather data: The service should be able to add a new weather data by the ` POST request at /weather` The weather JSON is sent in the request body. If weather data with the same ID already exists then the HTTP response code should be 400; otherwise, the response code should be 201.

- Returning all the weather data: The service should be able to return the JSON array of all the weather data by the `GET request at /weather` The HTTP response code should be 200. The JSON array should be sorted in ascending order of weather data ID.

- Returning the weather data filtered by the date: The service should be able to return the JSON array of all the weather data recorded on the given date by the `GET request at /weather?date={date}` If the requested location does not exist then HTTP response code should be 404; otherwise, the response code should be 200. The JSON array should be sorted in ascending order of weather data ID.

- Returning the weather data filtered by the location coordinates: The service should be able to return the JSON array of all the weather data which are associated with the given latitude and longitude by the `GET request at /weather?lat={latitude}&lon={longitude}` If the requested location does not exist then HTTP response code should be 404; otherwise, the response code should be 200. The JSON array should be sorted in ascending order of weather data ID.

## Built With

- Rails-api Back-end
- active_model_serializers
- hirb

## How to start the project from your Local environment

- Open your terminal and cd where you want to store the project
- Run the following command - `git clone https://github.com/Wusinho/React-Redux-Catalogue.git `
- Cd into the directory - `cd React-Redux-Catalogue`
- Run `bundle install`
- To run the pogram type `npm run dev` on your terminal.
- By default it will open in google-chrome however you can configure `./config/webpack.dev` to open it another browser.

- To run the tests `npm run test`

## Author

👤 **Heber Lazo**

- Github: [@Wusinho](https://github.com/Wusinho)
- LinkedIn: [Heber Lazo](https://www.linkedin.com/in/heber-lazo-benza-523266133/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a star if you :star: like this project!

## 📝 License

This project is [MIT](LICENSE) licensed.
