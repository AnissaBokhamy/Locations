@MainActor
enum ViewModelsFactories {
  static var agenciesMapViewModelFactory = AgenciesMapViewModel(
    loadAgencies: loadAgencies,
    agenciesMapTheme: ThemeFactory.themeSelector.selectedTheme.agenciesMapTheme
  )
}
