import SwiftUI

struct AgencyDetailView: View {

  var body: some View {
    VStack(alignment: .leading, spacing: Spacing.large) {
      Text(viewModel.agency.name)
        .font(.largeTitle)
        .fontWeight(.bold)

      ScrollView {
        VStack(alignment: .leading, spacing: Spacing.small) {
          Text(viewModel.locationText)
            .font(.headline)
          starsRatingView
          if let lastUpdateText = viewModel.lastUpdateText {
            Text(lastUpdateText)
          }
          moreSectionView
          Spacer()
        }
      }
    }
    .padding(.top, Padding.large)
    .padding(.horizontal, Padding.medium)
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

  @ViewBuilder
  private var moreSectionView: some View {
    List(viewModel.moreItemsSection) { moreItem in
      Section(moreItem.name) {
        ForEach(moreItem.subItems) { subItem in
          HStack {
            Text(subItem.title)
            Spacer()
            Text(subItem.value)
          }
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
