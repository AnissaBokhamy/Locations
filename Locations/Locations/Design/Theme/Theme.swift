import SwiftUI

protocol Theme {

  var accentColor: Color { get }

  var fontDefaultStyle: any ShapeStyle { get }

  var fontAccentStyle: any ShapeStyle { get }
}
