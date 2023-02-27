public protocol TCAFeatureLocalAction: Equatable {
    associatedtype Local
    /// Any action that came from another internal action. Basically, anything that raised by the current reducer.
    /// These actions usually came as a result of a chain effect where an action caused this **asynchronously**.
    /// - Experiment: Take a look at these examples:
    /// ```
    /// .onLoginResponse(TaskResult<LoginResponse>)
    /// .onChangeOfConnectionStatus(ConnectionStatus)
    /// .onChangeOfLocation(Location)
    /// ```
    /// - Note: Synchronous actions should be called directly and **NOT** through effects and reducers.
    /// [See more detail about **sharing logic with actions**](https://pointfreeco.github.io/swift-composable-architecture/main/documentation/composablearchitecture/performance#Sharing-logic-with-actions)
    static func local(_: Local) -> Self
}

import ComposableArchitecture

public protocol TCAFeatureLocalActionReducer: ReducerProtocol where Action: TCAFeatureLocalAction {
    func reduce(into state: inout State, localAction action: Action.Local) -> EffectTask<Action>
}

public extension TCAFeature where Action: TCAFeatureLocalAction {
    @available(*, deprecated, message: "Always fails. Must conform to `TCAFeatureLocalActionReducer` and implement stubs.")
    func reduce(into state: inout State, localAction action: Action.Local) -> EffectTask<Action> { fatalError() }
}
