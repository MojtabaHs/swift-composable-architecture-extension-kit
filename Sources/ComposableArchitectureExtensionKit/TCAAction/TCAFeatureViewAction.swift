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
