import ComposableArchitecture
import SwiftUI

import Feature_Main

@main
struct CurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                Feature_Main.ScreenView(store: Store(
                    initialState: Feature_Main.Reducer.State(),
                    reducer: { Feature_Main.Reducer()}
                ))
            }
        }
    }
}
