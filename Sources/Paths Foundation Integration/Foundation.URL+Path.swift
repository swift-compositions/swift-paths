public import Foundation
public import Paths

extension Foundation.URL {

    public init(_ path: Paths.Path) {
        self.init(filePath: path.string)
    }
}
