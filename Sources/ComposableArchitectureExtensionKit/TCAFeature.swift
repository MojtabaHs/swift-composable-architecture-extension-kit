import ComposableArchitecture

public protocol TCAFeature: Reducer {
    typealias Store = ComposableArchitecture.Store<State, Action>

    /// This store will use for the default preview
    static var previewStore: Store { get }
}

public extension TCAFeature {
    @available(swift, obsoleted: 1.0, message: "Conform to `TCAFeature<T>ActionReducer` and implement stubs.")
    func reduce<T>(into state: inout State, action: T) -> Effect<Action> { fatalError() }
}

public extension TCAFeature {
    @available(swift, obsoleted: 1.0, message: "Conform to `TCAFeatureViewActionReducer` and implement stubs.")
    func reduce<T>(into state: inout State, viewAction action: T) -> Effect<Action> { fatalError() }
}

public extension TCAFeature {
    @available(swift, obsoleted: 1.0, message: "Conform to `TCAFeatureDelegateActionReducer` and implement stubs.")
    func reduce<T>(into state: inout State, delegateAction action: T) -> Effect<Action> { fatalError() }
}

public extension TCAFeature {
    @available(swift, obsoleted: 1.0, message: "Conform to `TCAFeatureLocalActionReducer` and implement stubs.")
    func reduce<T>(into state: inout State, localAction action: T) -> Effect<Action> { fatalError() }
}

public extension TCAFeature {
    @available(swift, obsoleted: 1.0, message: "Conform to `TCAFeatureChildActionReducer` and implement stubs.")
    func reduce<T>(into state: inout State, childAction action: T) -> Effect<Action> { fatalError() }
}
