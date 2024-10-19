import ComposableArchitecture
import XCTest

@testable import Feature_Main
typealias Reducer = Feature_Main.Reducer

@MainActor
final class Tests: XCTestCase {
    var store: TestStore<Reducer.State, Reducer.Action>!

    override func setUp() async throws {
        self.store = TestStore(
            initialState: Reducer.State(),
            reducer: { Reducer() }
        )
    }

    func testInitial() async throws {
        await store.send(\.view.onAppear) {
            $0.destination = .alert(AlertState(title: { TextState("Main is waiting for development!") }))
        }
    }

    override func tearDown() async throws {
        await store.finish()
    }
}
