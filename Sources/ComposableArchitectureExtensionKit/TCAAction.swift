public protocol TCAFeatureAction: Equatable {
    /// View actions like button taps, appearing a view. Basically, what ever the user does.
    /// These actions usually starts with `on` word like `onAppear`, `onSubmitButtonTap`
    associatedtype View

    /// Local actions like the response of an API call.
    /// These actions usually came as a result of a chain effect where an action caused this asynchronously.
    /// - Note: Synchronous actions should be called directly and **NOT** through effects and reducers.
    /// [See more detail about **sharing logic with actions**](https://pointfreeco.github.io/swift-composable-architecture/main/documentation/composablearchitecture/performance#Sharing-logic-with-actions)
    associatedtype Local

    /// Delegate actions that this reducer is responsible to handle, even if they came from another `viewStore`.
    /// These actions usually has the word `did`, `will`, `should` in their name
    associatedtype Delegate

    static func view(_: View) -> Self
    static func local(_: Local) -> Self
    static func delegate(_: Delegate) -> Self
}
