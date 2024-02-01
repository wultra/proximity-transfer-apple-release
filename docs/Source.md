# Transfer Source

The transfer source is the device that __has the data__ and wants to __transfer it to another device__.

In terms of Bluetooth, the transfer source is the one that is scanning and searching for another device (target).

## Example integration

```swift
import WultraProximityTransfer

struct MyTransferData: Codable {
    let id: String
    let token: String
}

class MySampleSource: WPTSourceDelegate {

    let source: WPTSource

    let config = WPTConfig(
        serviceUUID: UUID(uuidString: "21f8190c-e4bc-11ed-b5ea-0242ac120001")!, 
        coder: WPTAESCoder(
            salt: "MyApplicationDemoSalt!".data(using: .utf8)!, // static data
            iv: Data(base64Encoded: "7x9ZEvEVf4IqlBxuYmzKhw==")! // 16 bytes encoded in Base64
        )
    )

    init() {
        source = WPTSource(config: config)
        source.delegate = self
        source.start()
    }
    
    // MARK: WPTSourceDelegate
    
    func scannedDevicesChanged(_ sender: WPTSource, scannedDevices: WPTScannedDevices) {
                
        guard let device = scannedDevices.bestCandidate else {
            // no device to target
            return
        }
        
        print("Best candidate is \(device.name) with id \(device.id)")
        
        do {
            let dataToTransfer = MyTransferData(id: "123", token: "10a82fe8d1c4df")
            let result = try device.encode(value: dataToTransfer)
            // Show the QR code to the user.
            // You can use "result.generateQRCode".
        } catch let e {
            print("Error during encoding: \(e)")
        }
    }
    
    func sourceStatusChanged(_ sender: WPTSource, status: WPTSourceStatus) {
        print("WPTSource status changed: \(status)")
        switch status {
        case .notStarted:
            //The source did not start yet.
        case .preparing:
            // source is preparing
        case .unsupported:
            // Bluetooth is not available on this device
            break
        case .unauthorized:
            // Bluetooth permission not granted
            // Ask the user to solve it (see System Permissions section in the documentation)
        case .bluetoothOff:
            // Bluetooth is turned off.
            // Tell the user to turn it on.
        case .active:
            // Source is active and waiting for a target device to be discovered.
        }
    }
}
```

## Classes used for the source

### `WPTSource`

Entrypoint for the source. Just start the source and wait for the device to be discovered.

#### Swift interface of the class

```swift
public class WPTSource {

    /// Available devices to target.
    public var targetDevices: WPTTargetDevices { get }

    /// Status of the source
    public var status: WPTSourceStatus { get }

    /// Delegate that will be notified when a target device or status of the source changes
    public weak var delegate: WPTSourceDelegate?

    /// Creates an `WPTSource`
    /// - Parameter config: Configuration of the source. Must be the same as the configuration of the Target.
    public init(config: WPTConfig)

    /// Starts the source (in Bluetooth terms - starts scanning for Bluetooth devices)
    public func start()

    /// Stops the source
    public func stop()
}
```

### `WPTSourceDelegate`

A delegate will be called when the status of the source changes or the device is discovered/changed.

#### Swift interface of the class

```swift
public protocol WPTSourceDelegate {

    /// When possible target device was found or was changed.
    /// - Parameters:
    ///   - sender: Source
    ///   - targetDevices: Devices available for the transfer
    func targetDevicesChanged(_ sender: WPTSource, targetDevices: WPTTargetDevices)

    /// When the status of the source has changed
    /// - Parameters:
    ///   - sender: Source
    ///   - status: Status of the source
    func sourceStatusChanged(_ sender: WPTSource, status: WPTSourceStatus)
}
```

### `WPTSourceStatus`

Status of the source for you to react upon and display user to appropriate UI (loading, errors, etc).

#### Swift interface of the class

```swift
public enum WPTSourceStatus {
    /// Service is not started.
    case notStarted
    /// Service or bluetooth is starting.
    case preparing
    /// Bluetooth is not supported on this device.
    case unsupported
    /// Bluetooth permission not granted for the app.
    ///
    /// Show an error to the user and navigate him to the app settings.
    /// ```
    /// let url = URL(string: UIApplicationOpenSettingsURLString)!
    /// UIApplication.shared.open(url, options: [:], completionHandler: nil)
    /// ```
    case unauthorized
    /// Bluetooth is turned off in the system.
    case bluetoothOff
    /// Service is active
    case active
}
```


### `WPTTargetDevices`

Devices that are currently found and suitable to target.

Unless you have some internal logic, it's best to use `bestCandidate` as a device to target (and generate the QR for).

#### Swift interface of the class

```swift
public struct WPTTargetDevices {

    /// All found devices.
    public var allDevices: [WPTTargetDevice] { get }

    /// Best candidate to target in case more than one target was found.
    public var bestCandidate: WPTTargetDevice? { get }
}
```
### `WPTTargetDevice`

A device that represents a transfer target.

```swift
public struct WPTTargetDevice {

    /// Name of the device
    public let name: String

    /// ID of the device
    public let id: String

    /// State of the device
    public var state: WPTTargetDevices.WPTTargetDevice.State { get }

    /// When a device is found, encrypted data needs to be transferred via a generated/scanned QR code.
    /// Use this method for a particular device to encode your data.
    /// - Parameter value: Object to encode
    /// - Returns: Encoded data
    public func encode(value: Encodable) throws -> EncodeResult

    /// When a device is found, encrypted data needs to be transferred via a generated/scanned QR code.
    /// Use this method for a particular device to encode your data.
    /// - Parameter data: Data to encode
    /// - Returns: Encoded data
    public func encode(data: Data) throws -> EncodeResult
}
```

## Read next

- [Transfer Target](./Target.md)