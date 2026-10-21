import Testing

@testable import Paths

extension Path {
    @Suite
    struct Separators {}
}

extension Path.Separators {

    #if os(Windows)

        @Test
        func `a forward slash is stored as a backslash`() throws {
            #expect(try Path("C:/work/canon") == Path("C:\\work\\canon"))
        }

        @Test
        func `appending a mixed relative path yields one separator kind`() throws {
            let joined = try Path("C:\\work").appending(Path("canon/x"))
            #expect(joined == (try Path("C:\\work\\canon\\x")))
            #expect(!joined._storage.buffer.contains(0x2F))
        }

        @Test
        func `appending to a forward slash root yields one separator kind`() throws {
            let joined = try Path("C:/work/").appending(Path.Component("x"))
            #expect(joined == (try Path("C:\\work\\x")))
        }

        @Test
        func `copied code units are normalised like a string`() throws {
            let units = Array("C:/work\\canon/x".utf16)
            let copied = try units.withUnsafeBufferPointer { buffer in
                try Path(copying: Swift.Span(_unsafeElements: buffer))
            }
            #expect(copied == (try Path("C:\\work\\canon\\x")))
        }

    #else

        @Test
        func `a backslash is an ordinary character on POSIX`() throws {
            let joined = try Path("/work").appending(Path("canon\\x"))
            #expect(joined._storage.buffer.dropLast() == Array("/work/canon\\x".utf8)[...])
        }

    #endif
}
