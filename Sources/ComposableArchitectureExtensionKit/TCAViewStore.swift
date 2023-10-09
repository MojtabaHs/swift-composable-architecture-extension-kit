import ComposableArchitecture

/// More readable function for using view actions inside the body of the View
public extension ViewStore where ViewAction: TCAFeatureViewAction {
    @discardableResult
    func send(viewAction action: ViewAction.View) -> StoreTask { send(.view(action)) }
}
