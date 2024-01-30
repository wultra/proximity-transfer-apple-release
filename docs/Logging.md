# Logging

This SDK logs various situations on different levels for your convenience to filter.


## Example logging configuration

### Set all logs to debug

```swift
import WultraProximityTransfer

WultraLogger.proximityTransfer.setVerboseLevel(.debug)
```

### Set all logs to info

```swift
import WultraProximityTransfer

WultraLogger.proximityTransfer.setVerboseLevel(.info)
```

### Set QR logger to debug


```swift
import WultraProximityTransfer

WultraLogger.proximityTransfer.qr.verboseLevel = .debug
```

## Available loggers

For example `qr` logger can be accessed via `WultraLogger.proximityTransfer.qr`.

- `common` - common logs that does not fit particular category
- `coder` - logs arond `WPTCoder`
- `qr` - logs around QR code generator
- `bluetooth` - logs for the Bluetooth related informations
