# Permissions

## Bluetooth

Bluetooth permission is needed for Proximity Transfer to work properly. SDK handles the permission itself - it will ask the user if necessary and report you when the permission is not granted.

### Declaration in `Info.plist`

To be able to use Bluetooth in your app, declare `NSBluetoothAlwaysUsageDescription` (`Privacy - Bluetooth Always Usage Description` with the Xcode translated variant) key with an explanation of why you want to use Bluetooth. For example "We use Bluetooth to secure device-to-device activation transfer.". This text is presented to the user when the SDK asks for Bluetooth access for the first time.

### Permission not granted

When the user decides to reject the permission dialog, the SDK will return an `unauthorized` status and you need to instruct the user to go to the application settings and turn this permission manually otherwise the transfer won't work.

To go directly to the app settings, use the following snippet:

```swift
let url = URL(string: UIApplicationOpenSettingsURLString)!
UIApplication.shared.open(url, options: [:], completionHandler: nil)
```

### Bluetooth off

When the user has Bluetooth turned off in the system, the SDK will report the status `bluetoothOff`. In this situation instruct the user to turn the Bluetooth on (for example in the Control Center).

## Camera

To be able to scan the QR code, you need camera permissions. The SDK does not provide any functionality for this purpose, so please follow [the official documentation](https://developer.apple.com/documentation/avfoundation/capture_setup/requesting_authorization_to_capture_and_save_media) when needed.

## Read next

- [Configuration](./Configuration.md)