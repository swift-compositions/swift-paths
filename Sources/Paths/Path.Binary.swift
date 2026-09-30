public import Binary

extension Path: Binary.Serializable {

    @inlinable
    public static func serialize<Buffer: RangeReplaceableCollection>(
        _ path: Self,
        into buffer: inout Buffer
    ) where Buffer.Element == Byte {

        buffer.append(contentsOf: path.string.utf8.map(Byte.init(bitPattern:)))
    }
}

extension Path.Component: Binary.Serializable {

    @inlinable
    public static func serialize<Buffer: RangeReplaceableCollection>(
        _ component: Self,
        into buffer: inout Buffer
    ) where Buffer.Element == Byte {
        buffer.append(contentsOf: component.string.utf8.map(Byte.init(bitPattern:)))
    }
}
