import SwiftUI
import ComposableArchitecture

// TODO: Make the constraint restricted only to actionable views
public protocol TCAView: View where Feature.Action: TCAFeatureViewAction {
    /// The actual feature behind the view.
    associatedtype Feature: TCAFeature

    /// The state behind the `ViewStore`.
    /// It could be the original `Feature.Sate` but for the sake of performance, it may be a local struct inside the view itself.
    /// This way you can scope the changes
    associatedtype State: Equatable

    /// Actions inside a `TCAView`.
    /// They must be view actions only
    associatedtype Action = Feature.Action.View

    var store: StoreOf<Feature> { get }

    /// The store for the `View`
    /// It **MUST** be `@ObservedObject`, otherwise, the view will NOT detect the changes.
    // TODO: Force the conformer to use `@ObservedObject`
    var viewStore: ViewStore<State, Action> { get }

    init(store: StoreOf<Feature>)
}
