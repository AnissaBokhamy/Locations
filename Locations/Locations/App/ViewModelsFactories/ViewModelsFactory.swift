@MainActor
enum ViewModelsFactories {
  static var agenciesMapViewModelFactory = AgenciesMapViewModel(loadAgencies: loadAgencies)
}
