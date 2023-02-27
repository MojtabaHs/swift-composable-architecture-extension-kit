public protocol TCAFeatureDelegateAction: Equatable {
    associatedtype Delegate
    /// Any actions that this reducer is responsible to handle, but they came from another `viewStore`.
    /// - Remark: These actions usually starts with `did`, `will`, `should` keywords.
    /// - Experiment: Take a look at these examples:
    /// ```
    /// .didReceiveScopedAction(ScopedFeature.Action)
    /// ```
    static func delegate(_: Delegate) -> Self
}

import ComposableArchitecture

public protocol TCAFeatureDelegateActionReducer: ReducerProtocol where Action: TCAFeatureDelegateAction {
    func reduce(into state: inout State, delegateAction action: Action.Delegate) -> EffectTask<Action>
}

public extension TCAFeature where Action: TCAFeatureDelegateAction {
    @available(*, deprecated, message: "Always fails. Must conform to `TCAFeatureDelegateActionReducer` and implement stubs.")
    func reduce(into state: inout State, delegateAction action: Action.Delegate) -> EffectTask<Action> { fatalError() }
}
