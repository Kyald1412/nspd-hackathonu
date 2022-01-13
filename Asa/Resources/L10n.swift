// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen
// Derived from https://github.com/SwiftGen/SwiftGen/issues/685#issuecomment-782893242
// Origin see https://github.com/SwiftGen/SwiftGen/blob/stable/templates/strings/structured-swift5.stencil
//
// Example:
//
//  var body: some View {
//    VStack {
//      Text(L10n.Login.PageTitle.header.key) // return LocalizedStringKey
//      CustomView(string: L10n.Login.Step1.title.text) // return String
//    }
//  }
// swiftlint:disable all

import SwiftUI
import Foundation

// MARK: - Strings

public enum L10n {
  /// Asa
  public static let asa = L10n.tr("Localizable", "asa")
  /// Login
  public static let login = L10n.tr("Localizable", "login")
  /// No
  public static let no = L10n.tr("Localizable", "no")
  /// Yes
  public static let yes = L10n.tr("Localizable", "yes")
}

extension L10n {
    // MARK: - Implementation Details
    static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
    static func localize(string: String) -> String{
        return L10n.tr("Localizable", string)
    }
}


// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type


