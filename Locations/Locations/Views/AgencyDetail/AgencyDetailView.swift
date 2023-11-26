import SwiftUI

struct AgencyDetailView: View {

  var body: some View {
    VStack(alignment: .leading, spacing: Spacing.large) {
      Text(viewModel.agency.name)
        .font(.largeTitle)
        .fontWeight(.bold)

      VStack(alignment: .leading, spacing: Spacing.small) {
        Text(viewModel.locationText)
          .font(.headline)
        starsRatingView
        Text(viewModel.lastUpdateText)
        Spacer()
      }
    }
  }
  
  let viewModel: AgencyDetailViewModel

  @ViewBuilder
  private var starsRatingView: some View {
    HStack(spacing: Spacing.small) {
      ForEach(0..<5) { starNumber in
        if starNumber <= viewModel.agency.stars.rawValue {
          Image(Icons.Star.filled)
            .renderingMode(.template)
        } else {
          Image(Icons.Star.outlined)
            .renderingMode(.template)
        }
      }
    }
  }
}

#Preview {
  AgencyDetailView(viewModel: AgencyDetailViewModel(
    agency: Agency(
      name: "STM",
      city: "Montréal",
      countryCode: .canada,
      subCountryCode: "QC",
      stars: Stars.five,
      lastUpdateTimestamp: .now,
      coordinates: Coordinates(
        maxLatitude: 45.7916,
        maxLongitude: -73.3465,
        minLatitude: 45.3081,
        minLongitude: -74.0894
      )
    )
  ))
}
