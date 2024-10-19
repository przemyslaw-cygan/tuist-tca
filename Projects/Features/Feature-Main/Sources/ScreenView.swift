import ComposableArchitecture
import SwiftUI

@ViewAction(for: Reducer.self)
public struct ScreenView: View {
    @Bindable public var store: StoreOf<Reducer>

    public init(store: StoreOf<Reducer>) {
        self.store = store
    }

    public var body: some View {
        Text("Main View")
            .alert($store.scope(state: \.destination?.alert, action: \.destination.alert))
            .navigationTitle("Main")
            .onAppear { send(.onAppear) }
    }
}

#Preview {
    NavigationStack {
        ScreenView(store: Store(
            initialState: Reducer.State(),
            reducer: { Reducer() }
        ))
    }
}
