# Locations

This App displays a map of transport agencies available in the World. It showcases their location, rating and location coordinates.

## Time spent
It took me between 8 to 10 hours to make this app and correct the bugs.

## Challenges
The part I found the most challenging was the decoding of the JSON. I had introduced middle types that were not available in the JSON, which made me lose time on the decoding. In the end, I should have started simpler to be able to iterate later, instead of having to roll-back on my initial implementation.

## Third parties
I did not use any third parties for this App except the Apple libraries like Foundation, SwiftUI and CoreLocation. This includes the use of URLSession for the loading of the data from the JSON file.

## Potential improvements
Given 8 more hours, here are the different improvements I would have liked to implement:
- introduce a thematic background color (I was not able to, the SwiftUI `.background()` modifier does not accept `any ShapeStyle` as a parameter.)
- add Unit Tests on the different ViewModels.
- add Error handling mechanisms, like alerts to be shown to the user.
- add a display for loading states of the app.
- investigate the lag appearing between the tap on a pin and the display of the Agency detail sheet.
- re-evaluate the use of MVVM as a Design Pattern.
