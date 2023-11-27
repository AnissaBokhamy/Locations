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
