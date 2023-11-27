import SwiftUI

struct DefaultTheme: Theme {

  var backgroundStyle: any ShapeStyle {
    Color.Neutrals.paper
  }

  var accentColor: Color {
    Color.Accent.yellow
  }

  var fontDefaultStyle: any ShapeStyle {
    Color.Neutrals.darkGrey
  }

  var fontAccentStyle: any ShapeStyle {
    Color.Neutrals.black
  }
}

// MARK: - AgenciesMapTheme

extension DefaultTheme {

  var agenciesMapTheme: AgenciesMapTheme {
    AgenciesMapTheme(
      canadaPinColor: Colors.Accent.red,
      unitedStatesPinColor: Colors.Accent.pink,
      francePinColor: Colors.Accent.darkBlue,
      unitedKingdomPinColor: Colors.Accent.green,
      germanyPinColor: Colors.Accent.yellow,
      defaultPinColor: Colors.Accent.lightBlue
    )
  }
}
