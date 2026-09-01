// Set the default app for a UTI: set-default-app.swift <uti> <bundle-id>
// Used by install-open-in-cmux so the dotfiles don't need `duti` from Homebrew.
import CoreServices
import Foundation

guard CommandLine.arguments.count == 3 else {
    FileHandle.standardError.write(Data("usage: set-default-app.swift <uti> <bundle-id>\n".utf8))
    exit(2)
}
let uti = CommandLine.arguments[1] as CFString
let bundleID = CommandLine.arguments[2] as CFString

let status = LSSetDefaultRoleHandlerForContentType(uti, .all, bundleID)
let current = LSCopyDefaultRoleHandlerForContentType(uti, .all)?.takeRetainedValue() as String? ?? "(none)"
print("\(uti) -> \(current) (status \(status))")
exit(status == noErr ? 0 : 1)
