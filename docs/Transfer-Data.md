# Transfer Data

You may transfer any data that can be represented by the array of bytes.

<!-- begin box info -->
The only consideration is the size of such data because the final transfer is done via a QR code that will be displayed to the user and will be scanned by the device. Large data will provide large QR codes that might be harder to scan
<!-- end -->

## Example data

Let's imagine that we want to transfer login data about the user to a different device without showing the data to the user.

### Data class that represents the structure

```swift
struct TransferData: Codable {
    let userID: String
    let name: String
    let token: String
    let timestamp: String
}
```

### Serialized Data To Transfer

```json
{"userID":"1862","name":"John Doe","token":"72f828a0-e3a1-4691-ad99-d5a401bf5d5d","timestamp":1706534397}
```

### Final QR code

The string above is then:

1. Turned into a byte array.
2. Encoded with the SDK.
3. Encoded data transformed into a Base64 string.
4. The Base64 string is encoded to the QR code (medium correction level).

The final QR code for such data might look like this:

<p align="left"><img src="res/qr.jpg" alt="Final transfer QR code sample" width="200" /></p>

## Read next

- [Cocoapods and Swift Package Manager integration](Integration.md)
