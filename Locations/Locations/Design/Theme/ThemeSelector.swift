import Foundation

class ThemeSelector: ObservableObject {

  init(selectedTheme: any Theme) {
    self.selectedTheme = selectedTheme
  }

  @Published public var selectedTheme: any Theme
}
