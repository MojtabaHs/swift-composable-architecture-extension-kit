import SwiftUI

public extension TCAView {
    // TODO: Make the interface cleaner
    // swiftlint:disable identifier_name
    /// Helper method for building a `TextField` and directly calling the `ViewAction` with custom placeholder builder.
    @ViewBuilder
    func TextField<Content: View>(
        get value: @escaping (State) -> String,
        send action: @escaping (String) -> Action,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        let text = viewStore.binding(get: value, send: action)
        SwiftUI
            .TextField("", text: text)
            .placeholder(when: text.wrappedValue.isEmpty, alignment: .leadingFirstTextBaseline, placeholder: placeholder)
    }

    // TODO: Make the interface cleaner
    // swiftlint:disable identifier_name
    /// Helper method for building a `TextField` and directly calling the `ViewAction` with basic placeholder.
    @ViewBuilder
    func TextField(
        _ placeholder: String?,
        get value: @escaping (State) -> String,
        send action: @escaping (String) -> Action
    ) -> some View {
        let text = viewStore.binding(get: value, send: action)
        SwiftUI.TextField(placeholder ?? "", text: text)
    }
}
