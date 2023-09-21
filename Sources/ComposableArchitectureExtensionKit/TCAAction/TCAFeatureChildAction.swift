public protocol TCAFeatureChildAction: Equatable {
    associatedtype Child
    /// Any actions that this reducer scopes and passes to its children.
    /// - Remark: These actions usually named after the child feature.
    /// - Experiment: Take a look at these examples:
    /// ```
    /// .item(ListItemFeature.Action)
    /// ```
    static func child(_: Child) -> Self
}

import ComposableArchitecture

public protocol TCAFeatureChildActionReducer: Reducer where Action: TCAFeatureChildAction {
    func reduce(into state: inout State, childAction action: Action.Child) -> Effect<Action>
}

public extension TCAFeature where Action: TCAFeatureChildAction {
    @available(*, deprecated, message: "Always fails. Must conform to `TCAFeatureChildActionReducer` and implement stubs.")
    func reduce(into state: inout State, childAction action: Action.Child) -> Effect<Action> { fatalError() }
}
