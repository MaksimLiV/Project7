# Project7 - Petitions App

This iOS app displays a list of petitions and allows users to search for specific petitions by title. The data is fetched from a sample API provided by [Hacking with Swift](https://www.hackingwithswift.com). This project was created as part of the Hacking with Swift course to enhance skills in using `UITableViewController`, JSON parsing, and integrating search functionality in iOS apps.

## Features

- **Petition List**: The app displays a list of petitions with their title and a short description. Users can tap on any petition to see detailed information.
- **Credits Button**: A "Credits" button in the navigation bar shows the source of the petition data.
- **Search Functionality**: Users can search through petitions using the `UISearchBar` at the top of the screen. The list updates dynamically based on the search input.

## Code Highlights

- **UITableViewController**: Used to display petitions in a list format.
- **JSON Parsing**: Data is parsed from JSON using `JSONDecoder`.
- **Navigation and Detail View**: When a petition is selected, it navigates to a detail view to show more information.
- **UISearchBar Integration**: The app filters petitions based on the text entered in the search bar.

## Implementation Details

1. **API Integration**: 
   - The app fetches data from two sample JSON endpoints based on the selected tab. 
   - Endpoints used:
     - `https://www.hackingwithswift.com/samples/petitions-1.json`
     - `https://www.hackingwithswift.com/samples/petitions-2.json`

2. **Search Functionality**:
   - A `UISearchBar` is added to the `UITableView` header.
   - Filtering is implemented using a secondary array (`filteredPetitions`) and a boolean flag (`isSearching`) to differentiate between normal and search modes.

3. **Error Handling**:
   - If the app fails to load data from the API, an alert is presented to the user with an error message.

## Screenshots

<!-- Add screenshots of the app's main screens here -->

## How to Run

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run on a simulator or physical device with an internet connection.

## Credits

Data provided by the [Hacking with Swift](https://www.hackingwithswift.com) sample API.

## License

This project is licensed under the MIT License.
