extension Path.Component {

    /// The names Windows reserves for devices, in upper case.
    ///
    /// Windows refuses a file whose name, before its first dot, is one of these, compared
    /// case-insensitively: `con`, `CON.txt` and `Nul.tar.gz` all name a device. The rule is Windows',
    /// but the set is not behind `#if os(Windows)`: ``init(cleaning:)`` applies it on every platform,
    /// so a name made on macOS or Linux still opens on Windows.
    public static let reserved: Set<Swift.String> = [
        "CON", "PRN", "AUX", "NUL",
        "COM1", "COM2", "COM3", "COM4", "COM5", "COM6", "COM7", "COM8", "COM9",
        "LPT1", "LPT2", "LPT3", "LPT4", "LPT5", "LPT6", "LPT7", "LPT8", "LPT9",
    ]
}
