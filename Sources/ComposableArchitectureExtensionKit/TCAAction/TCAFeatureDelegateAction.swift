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
