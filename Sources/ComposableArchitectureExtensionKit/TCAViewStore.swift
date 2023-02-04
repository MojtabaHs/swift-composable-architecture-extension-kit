import ComposableArchitecture

/// More readable function for using view actions inside the body of the View
public extension ViewStore where ViewAction: TCAFeatureAction {
    @discardableResult
    func send(viewAction action: ViewAction.View) -> ViewStoreTask { send(.view(action)) }
}
