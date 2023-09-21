import SwiftUI

public extension TCABasicViewStore {
    // TODO: Make the interface cleaner
    // swiftlint:disable identifier_name
    /// Helper method for building a `TextEditor` and directly calling the `ViewAction` with custom placeholder builder.
    @available(iOS 14.0, *)
    @ViewBuilder
    func TextEditor<Content: View>(
        get value: @escaping (State) -> String,
        send action: @escaping (String) -> Action,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        let text = viewStore.binding(get: value, send: action)
        if #available(iOS 16.0, *) {
            SwiftUI.TextField("", text: text, axis: .vertical)
                .placeholder(when: text.wrappedValue.isEmpty, alignment: .leadingFirstTextBaseline, placeholder: placeholder)
        } else {
            SwiftUI
                .TextEditor(text: text)
                .placeholder(when: text.wrappedValue.isEmpty, alignment: .center, placeholder: placeholder)
        }
    }

    // TODO: Make the interface cleaner
    // swiftlint:disable identifier_name
    /// Helper method for building a `TextEditor` and directly calling the `ViewAction` with basic placeholder.
    @available(iOS 14.0, *)
    @ViewBuilder
    func TextEditor(
        _ placeholder: String?,
        get value: @escaping (State) -> String,
        send action: @escaping (String) -> Action
    ) -> some View {
        if #available(iOS 16.0, *) {
            let text = viewStore.binding(get: value, send: action)
            SwiftUI.TextField(placeholder ?? "", text: text, axis: .vertical)
        } else {
            TextEditor(get: value, send: action) {
                if #available(iOS 15.0, *) {
                    Text(placeholder ?? "").foregroundColor(Color(uiColor: .placeholderText))
                } else {
                    Text(placeholder ?? "").opacity(0.2)
                }
            }
        }
    }
}
