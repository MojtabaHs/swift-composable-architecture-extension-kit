public protocol TCAFeatureViewAction: Equatable {
    associatedtype View
    /// Any action that came from the `view`'s body. Basically, what ever the user does.
    /// - Remark: These actions usually starts with `on` keyword.
    /// - Experiment: Take a look at these examples:
    ///```
    /// .onCloseButtonTap
    /// .onChangeOfUsername(String)
    /// .onAppear
    /// .onChangeOfFocusField(Field?)
    /// ```
    static func view(_: View) -> Self
}

import ComposableArchitecture

public protocol TCAFeatureViewActionReducer: Reducer where Action: TCAFeatureViewAction {
    func reduce(into state: inout State, viewAction action: Action.View) -> Effect<Action>
}

public extension TCAFeature where Action: TCAFeatureViewAction {
    @available(*, deprecated, message: "Always fails. Must conform to `TCAFeatureViewActionReducer` and implement stubs.")
    func reduce(into state: inout State, viewAction action: Action.View) -> Effect<Action> { fatalError() }
}
