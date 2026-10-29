public import Foundation
public import Paths

extension Paths.Path {

    public init(_ url: Foundation.URL) throws(Paths.Path.Error) {
        let string = url.path(percentEncoded: false)
        try self.init(string.count > 1 && string.hasSuffix("/") ? Swift.String(string.dropLast()) : string)
    }
}
