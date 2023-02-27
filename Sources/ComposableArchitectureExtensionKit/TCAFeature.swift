import ComposableArchitecture

public protocol TCAFeature: ReducerProtocol {
    typealias Store = ComposableArchitecture.Store<State, Action>
    typealias ViewStore = ComposableArchitecture.ViewStore<State, Action>

    #if DEBUG
    /// This store will use for the default preview
    static var previewStore: Store { get }
    #endif
}

public extension TCAFeature {
}
