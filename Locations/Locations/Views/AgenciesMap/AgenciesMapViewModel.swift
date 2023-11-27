import Foundation
import SwiftUI

@MainActor
class AgenciesMapViewModel: ObservableObject {

  // MARK: - Lifecycle

  init(
    loadAgencies: @Sendable @escaping () async throws -> Agencies?,
    agencies: [Agency] = [],
    agenciesMapTheme: AgenciesMapTheme
  ) {
    self.loadAgencies = loadAgencies
    self.agenciesMapTheme = agenciesMapTheme
    self.agenciesViewModels = agencies.map { AgencyMapViewModel(agency: $0, agenciesMapTheme: agenciesMapTheme) }
  }

  // MARK: - Properties

  let agenciesMapTheme: AgenciesMapTheme
  let loadAgencies: @Sendable () async throws -> Agencies?

  @Published private(set) var agenciesViewModels: [AgencyMapViewModel] = []

  // MARK: - Methods

  func loadAgencies() async {
    let agencies = try! await loadAgencies()?.agencies ?? []
    agenciesViewModels = agencies.map { AgencyMapViewModel(agency: $0, agenciesMapTheme: agenciesMapTheme) }
  }
}
