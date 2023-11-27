import Foundation

@MainActor
class AgenciesMapViewModel: ObservableObject {

  // MARK: - Lifecycle

  init(
    loadAgencies: @Sendable @escaping () async throws -> Agencies?,
    agencies: [Agency] = []
  ) {
    self.loadAgencies = loadAgencies
    self.agenciesViewModels = agencies.map { AgencyMapViewModel(agency: $0) }
  }

  // MARK: - Properties

  let loadAgencies: @Sendable () async throws -> Agencies?

  @Published private(set) var agenciesViewModels: [AgencyMapViewModel] = []

  // MARK: - Methods

  func loadAgencies() async {
    let agencies = try! await loadAgencies()?.agencies ?? []
    agenciesViewModels = agencies.map { AgencyMapViewModel(agency: $0) }
  }
}
