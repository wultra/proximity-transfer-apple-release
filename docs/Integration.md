# Integration

## Supported operating systems

The library is supported by the following operating systems:

- **iOS** 12.0+
- **tvOS** 12.0+

## Swift Package Manager

The library is distributed as a package for Swift Package Manager:
   
1. Create (or append to if already exists) `~/.netrc` file in your home directory (for example `/Users/mymacuser/.netrc`) with the following credentials you were provided by our technical staff: 

   ```
   machine wultra.jfrog.io
         login [name@yourcompany.com]
         password [password]
   ```

2. Add the following repository as a dependency into your project:

   ```
   https://github.com/wultra/proximity-transfer-apple-release.git
   ```

## Cocoapods 

The library is also distributed through a public git repository, which contains a podspec and scripts to download the framework from a private artifactory. If you're not using cocoapods in your project, visit [usage guide](https://guides.cocoapods.org/using/using-cocoapods.html).

1. Create (or append to if already exists) `~/.netrc` file in your home directory (for example `/Users/mymacuser/.netrc`) with the following credentials you were provided by our technical staff: 

   ```
   machine wultra.jfrog.io
         login [name@yourcompany.com]
         password [password]
   ``` 

2. Add pod to your `Podfile`:

   ```rb
   target 'MyProject' do
       use_frameworks!
       pod 'WultraProximityTransfer', :git => 'https://github.com/wultra/proximity-transfer-apple-release.git', :tag => '1.0.0'
   end
   ```
   You can check the latest versions of the libraries above on the release pages:
   - [WultraProximityTransfer releases page](https://github.com/wultra/proximity-transfer-apple-release/releases)

3. Run `pod install` in your root project dictionary (where `Podfile` resides) to make the `WultraProximityTransfer` framework available in your project.

## Read next

- [System Permissions](./Permissions.md)
