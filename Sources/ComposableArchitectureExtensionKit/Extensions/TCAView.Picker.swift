import SwiftUI

public extension TCABasicViewStore {
    // TODO: Make the interface cleaner
    // swiftlint:disable identifier_name
    /// Helper method for building a `Picker` and directly calling the `ViewAction`
    func Picker<SelectionValue: Hashable & CaseIterable, Content: View>(
        title titleKey: LocalizedStringKey,
        get value: @escaping (State) -> SelectionValue,
        send action: @escaping (SelectionValue) -> Action,
        @ViewBuilder content: @escaping (SelectionValue) -> Content
    ) -> Picker<
        Text, SelectionValue,
        ForEach<[SelectionValue], SelectionValue, Content>
    > {
        SwiftUI.Picker(
            titleKey,
            selection: viewStore.binding(get: value) { action($0) }
        ) {
            ForEach(
                Array(SelectionValue.self.allCases),
                id: \.self,
                content: content
            )
        }
    }
}
