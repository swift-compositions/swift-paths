import Foundation
import Paths_Foundation_Integration
import Testing

extension Paths.Path {
    @Suite struct `Foundation URL` {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension Paths.Path.`Foundation URL`.Unit {
    @Test func `a file URL becomes its path and back`() throws {
        let url = URL(filePath: "/Users/a/Letters/Rekening maart.pdf")
        let path = try Paths.Path(url)
        #expect(path.string == "/Users/a/Letters/Rekening maart.pdf")
        #expect(URL(path) == url)
    }
}

extension Paths.Path.`Foundation URL`.`Edge Case` {
    @Test func `a folder URL's trailing separator is dropped`() throws {
        #expect(try Paths.Path(URL(filePath: "/Users/a/Letters/", directoryHint: .isDirectory)).string == "/Users/a/Letters")
    }

    @Test func `the root stays the root`() throws {
        #expect(try Paths.Path(URL(filePath: "/", directoryHint: .isDirectory)).string == "/")
    }
}
