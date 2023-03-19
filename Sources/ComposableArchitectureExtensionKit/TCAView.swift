import SwiftUI
import ComposableArchitecture

public protocol TCAView: View {
    associatedtype Feature: TCAFeature
    associatedtype State: Equatable
    var store: StoreOf<Feature> { get }
    var viewStore: ViewStore<State, Feature.Action> { get }
    init(store: StoreOf<Feature>)
}
