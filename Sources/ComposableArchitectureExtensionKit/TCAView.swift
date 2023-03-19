import SwiftUI
import ComposableArchitecture

public protocol TCAView: View {
    associatedtype Feature: TCAFeature
    associatedtype ViewState: Equatable
    var store: StoreOf<Feature> { get }
    var viewStore: ViewStore<ViewState, Feature.Action> { get }
    init(store: StoreOf<Feature>)
}
