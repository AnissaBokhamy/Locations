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
        Text(viewModel.lastUpdateText)
        Spacer()
      }
    }
  }
  
  let viewModel: AgencyDetailViewModel
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
