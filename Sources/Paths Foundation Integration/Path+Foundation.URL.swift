public import Foundation
public import Paths

extension Paths.Path {

    public init(_ url: Foundation.URL) throws(Paths.Path.Error) {
        let native = unsafe url.withUnsafeFileSystemRepresentation { unsafe $0.map { unsafe Swift.String(cString: $0) } }
        try self.init(Self.folder(native ?? url.path(percentEncoded: false)))
    }

    static func folder(_ string: Swift.String) -> Swift.String {
        var string = string
        while string.count > 1, let last = string.last, last == "/" || last == "\\",
            string.dropLast().last != ":"
        {
            string.removeLast()
        }
        return string
    }
}
