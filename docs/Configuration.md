# Configuration

To configure the SDK properly for both transfer __target__ and __source__, `WPTConfig` instance is needed.

<!-- begin box info -->
Configuration must be the same on both sides of the transfer otherwise the Bluetooth connection won't be successful.

The same configuration also needs to be implemented on Android.
<!-- end -->

## Configuration items

- `serviceUUID` - UUID used for the Bluetooth service
- `characteristicUUID` - UUID used for the Bluetooth connection
- `coder` - will provide encryption and decryption for the transfer

## Coder

Currently, only one coder is available `WPTAESCoder`. To configure this coder, you need to provide two byte arrays:

- `salt` - salt that will be mixed into the cipher. No length limitation.
- `iv` - IV for the cipher. Needs to be 16 bytes long. Smaller IV will produce an error and longer will be truncated.

## Example configuration

```swift
let config = WPTConfig(
    serviceUUID: UUID(uuidString: "21f8190c-e4bc-11ed-b5ea-0242ac120001")!, 
    characteristicUUID: UUID(uuidString: "21f8190c-e4bc-11ed-b5ea-0242ac120002")!, 
    coder: WPTAESCoder(
        salt: "MyApplicationDemoSalt!".data(using: .utf8)!, // static data
        iv: Data(base64Encoded: "7x9ZEvEVf4IqlBxuYmzKhw==")! // 16 bytes encoded in Base64
    )
)
```

## Read next

- [Transfer Source](./Source.md)