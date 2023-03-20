import ComposableArchitecture

public protocol TCAFeature: ReducerProtocol {
    typealias Store = ComposableArchitecture.Store<State, Action>

    #if DEBUG
    /// This store will use for the default preview
    static var previewStore: Store { get }
    #endif
}

public extension TCAFeature {
    @available(swift, obsoleted: 1.0, message: "Conform to `TCAFeatureViewActionReducer` and implement stubs.")
    func reduce<T>(into state: inout State, viewAction action: T) -> EffectTask<Action> { fatalError() }
}

public extension TCAFeature {
    @available(swift, obsoleted: 1.0, message: "Conform to `TCAFeatureDelegateActionReducer` and implement stubs.")
    func reduce<T>(into state: inout State, delegateAction action: T) -> EffectTask<Action> { fatalError() }
}

public extension TCAFeature {
    @available(swift, obsoleted: 1.0, message: "Conform to `TCAFeatureLocalActionReducer` and implement stubs.")
    func reduce<T>(into state: inout State, localAction action: T) -> EffectTask<Action> { fatalError() }
}

public extension TCAFeature {
    @available(swift, obsoleted: 1.0, message: "Conform to `TCAFeatureChildActionReducer` and implement stubs.")
    func reduce<T>(into state: inout State, childAction action: T) -> EffectTask<Action> { fatalError() }
}
