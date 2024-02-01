# Transfer Target

The transfer target is the device that __will receive data__ from another device.

In terms of Bluetooth, the transfer source is the one that is broadcasting to another device.

## Example integration

```swift
import WultraProximityTransfer

struct MyTransferData: Codable {
    let id: String
    let token: String
}

class MySampleTarget: WPTTargetDelegate {

    let target: WPTTarget

    let config = WPTConfig(
        serviceUUID: UUID(uuidString: "21f8190c-e4bc-11ed-b5ea-0242ac120001")!, 
        coder: WPTAESCoder(
            salt: "MyApplicationDemoSalt!".data(using: .utf8)!, // static data
            iv: Data(base64Encoded: "7x9ZEvEVf4IqlBxuYmzKhw==")! // 16 bytes encoded in Base64
        )
    )

    init() {
        do {
            let target = try WPTTarget(config: config)
            target.delegate = self
            self.target = target
            target.start()
        } catch let e {
            fatalError("Failed to create WPTTarget: \(e)")
        }
    }
    
    // MARK: - WPTTargetDelegate
    
    func targetStatusChanged(_ sender: WPTTarget, status: WPTTargetStatus) {
        print("WPTTarget status changed: \(status)")
        switch status {
        case .notStarted: 
            // The target is not started.
            break
        case .preparing: 
            // The target is preparing to start.
            break
        case .bluetoothOn:
            // Bluetooth is ready
            break
        case .startingFailed(let e):
            // Bluetooth broadcast failed
            break
        case .unsupported:
            // The Bluetooth isn't available on this device.
            break
        case .unauthorized:
            // The Bluetooth permission not granted
            break
        case .bluetoothOff:
            // The Bluetooth is turned off
            break
        case .active:
            // Target is active and broadcasting
            break
        }
    }
}    
```

## Classes used for the target

### `WPTTarget`

Entrypoint for the target. Just start the target and instruct the user to scan the QR code that will be prepared on the source device.

#### Swift interface of the class

```swift
public class WPTTarget {

    /// Status of the target.
    public var status: WPTTargetStatus { get }

    /// Delegate that receives status changes
    public weak var delegate: WPTTargetDelegate?

    /// Creates an instance of a target.
    ///
    /// Please note that the target configuration must be the same as the Source configuration.
    ///
    /// - Parameter config: Target configuration.
    public init(config: WPTConfig) throws

    /// Starts the Bluetooth broadcast. After a successful start, you should start offering a user a QR scanner.
    public func start()

    /// Stops the Bluetooth broadcast.
    public func stop()

    /// Decodes the data scanned via QR scanner
    /// - Parameter data: Scanned data
    /// - Returns: Decoded (decrypted) data.
    public func decode(data: Data) throws -> Data

    /// Decodes the data scanned via QR scanner to a `Decodable` object.
    ///
    /// - Parameter data: Scanned data
    /// - Returns: Decoded object.
    public func decode<T>(data: Data) throws -> T where T : Decodable
}
```

### `WPTTargetDelegate`

A delegate will be called when the status of the target changes.

#### Swift interface of the class

```swift
public protocol WPTTargetDelegate {
    
    /// Bluetooth broadcasting status changed
    ///
    /// - Parameters:
    ///   - sender: Target that reported the change
    ///   - status: Status of the change
    func targetStatusChanged(_ sender: WPTTarget, status: WPTTargetStatus)
}
```

### `WPTTargetStatus`

Status of the target for you to react upon and display user to appropriate UI (loading, errors, etc).

#### Swift interface of the class

```swift
public enum WPTTargetStatus {
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
    /// Error happened
    case startingFailed(e: Error)
    /// Bluetooth service turned on.
    case bluetoothOn
    /// Service is active
    case active
}
```

## Read next

- [Logging](./Logging.md)