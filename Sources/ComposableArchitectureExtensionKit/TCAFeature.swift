import ComposableArchitecture

public protocol TCAFeature: ReducerProtocol where Action: TCAFeatureAction {
    func reduce(into state: inout State, viewAction action: Action.View) -> EffectTask<Action>
    func reduce(into state: inout State, localAction action: Action.Local) -> EffectTask<Action>
    func reduce(into state: inout State, delegateAction action: Action.Delegate) -> EffectTask<Action>

    #if DEBUG
    /// This store will use for the default preview
    static var previewStore: Store { get }
    #endif
}

public extension TCAFeature {
    typealias Store = ComposableArchitecture.Store<State, Action>
    typealias ViewStore = ComposableArchitecture.ViewStore<State, Action>
}
