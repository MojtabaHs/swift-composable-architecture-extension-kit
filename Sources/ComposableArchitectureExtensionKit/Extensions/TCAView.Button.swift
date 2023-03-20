import SwiftUI

public extension TCAView {
    /// Helper method for building a `Button` and directly calling the `ViewAction`
    func Button<Label: View>(send action: Action, @ViewBuilder label: () -> Label) -> SwiftUI.Button<Label> {
        // swiftlint:disable:previous identifier_name
        SwiftUI.Button(action: { self.viewStore.send(action) }, label: label)
    }

    /// Helper method for building a `Button` and directly calling the `ViewAction`
    func Button(_ title: LocalizedStringKey, send action: Action, fullWidth: Bool = false) -> Button<_ConditionalContent<some View, Text>> {
        // swiftlint:disable:previous identifier_name
        Button(send: action) {
            if fullWidth {
                Text(title)
                    .frame(maxWidth: .infinity)
            } else {
                Text(title)
            }
        }
    }

    /// Helper method for building a `Button` and directly calling the `ViewAction`
    func Button(systemImage: String, send action: Action) -> SwiftUI.Button<Image> {
        // swiftlint:disable:previous identifier_name
        Button(send: action) { Image(systemName: systemImage) }
    }

    /// Helper method for building a `Button` and directly calling the `ViewAction`
    @available(iOS 15.0, *)
    func Button<Label: View>(role: ButtonRole, send action: Action, @ViewBuilder label: () -> Label) -> SwiftUI.Button<Label> {
        // swiftlint:disable:previous identifier_name
        SwiftUI.Button(role: role, action: { self.viewStore.send(action) }, label: label)
    }
}
