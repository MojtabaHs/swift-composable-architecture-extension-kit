import SwiftUI
import ComposableArchitecture

public protocol TCAView: View {
    associatedtype Feature: TCAFeature
    var store: StoreOf<Feature> { get }
    var viewStore: ViewStoreOf<Feature> { get }
    init(store: StoreOf<Feature>)
}
