import SwiftUI

struct AgencyDetailView: View {

  var body: some View {
    VStack(alignment: .leading, spacing: Spacing.large) {
      Text(viewModel.agency.name)
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundStyle(selectedTheme.fontAccentStyle)

      ScrollView {
        VStack(alignment: .leading, spacing: Spacing.small) {
          Text(viewModel.locationText)
            .font(.headline)
            .foregroundStyle(selectedTheme.fontDefaultStyle)
          starsRatingView
          if let lastUpdateText = viewModel.lastUpdateText {
            Text(lastUpdateText)
              .foregroundStyle(selectedTheme.fontDefaultStyle)
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
            .foregroundStyle(selectedTheme.accentColor)
        } else {
          Image(Icons.Star.outlined)
            .renderingMode(.template)
            .foregroundStyle(selectedTheme.accentColor)
        }
      }
    }
  }

  @ViewBuilder
  private var moreSectionView: some View {
    ForEach(viewModel.moreItemsSection) { moreItem in
      VStack(alignment: .leading) {
        Text(moreItem.name)
          .font(.headline)
          .foregroundStyle(selectedTheme.fontDefaultStyle)

        ForEach(moreItem.subItems) { subItem in
          HStack {
            Text(subItem.title)
              .font(.body)
              .foregroundStyle(selectedTheme.fontDefaultStyle)
            Spacer()
            Text(subItem.value)
              .font(.body)
              .foregroundStyle(selectedTheme.fontDefaultStyle)
          }
          Divider()
        }
        .padding(.horizontal, Padding.small)
      }
    }
  }

  @EnvironmentObject private var themeSelector: ThemeSelector
  private var selectedTheme: Theme {
    themeSelector.selectedTheme
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
  .environmentObject(ThemeFactory.themeSelector)
}
