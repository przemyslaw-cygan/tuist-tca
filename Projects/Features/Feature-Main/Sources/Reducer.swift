import ComposableArchitecture

@Reducer
public struct Reducer {
    @ObservableState
    public struct State: Equatable {
        @Presents
        public var destination: Destination.State?

        public init(destination: Destination.State? = nil) {
            self.destination = destination
        }
    }

    @CasePathable
    public enum Action: ViewAction, Sendable {
        case view(View)
        case destination(PresentationAction<Destination.Action>)

        @CasePathable
        public enum View: Sendable {
            case onAppear
        }
    }

    @CasePathable
    public enum AlertAction: Equatable, Sendable {
    }

    @Reducer(state: .equatable, action: .sendable)
    public enum Destination {
        case alert(AlertState<AlertAction>)
    }

    public var body: some ComposableArchitecture.Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .view(.onAppear):
                state.destination = .alert(AlertState(title: { TextState("Main is waiting for development!") }))
                return .none

            case .view:
                return .none

            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }

    public init() {}
}
