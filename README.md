# 🔗 Flutter Zoom Wrapper

A simple and lightweight Flutter plugin that wraps the Zoom SDK for Android and iOS using platform channels. It allows you to initialize the Zoom SDK with a JWT token and join Zoom meetings with minimal setup.

> ✅ **Cross-platform:** Android & iOS  
> 🔐 **Security Note:** Always generate JWT tokens from a **secure backend** in production.

---

## ✨ Features

- Initialize Zoom SDK using JWT
- Join Zoom meetings with meeting ID and password
- Clean and minimal API
- Built-in JWT generator for testing

---

## 📦 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_zoom_wrapper: ^1.0.0
  
---  

## ⚙️ Zoom SDK Setup Instructions

Zoom SDKs are **not bundled** due to licensing restrictions.  
You must **download and configure them manually** for Android and iOS.

---

### ✅ Step 1: [Download Zoom SDKs](https://marketplace.zoom.us/docs/sdk/native-sdks/)

Download the SDKs directly from the official Zoom Marketplace:

**Required SDK Versions:**

- **Android SDK:** `v6.3.1.26548`  
- **iOS SDK:** `v6.4.10.25465`

---

### ✅ Step 2: Setup Android SDK

1. Extract the downloaded **Android SDK ZIP**.
2. Locate the file: `mobilertc.aar`.
3. Copy it to the following path:

.flutter-zoom-wrapper/
└── android/
└── libs/
└── mobilertc.aar


---

### ✅ Step 3: Setup iOS SDK

1. Extract the **iOS SDK ZIP**.
2. Inside the `lib/` folder, you'll find:
   - `MobileRTC.xcframework`
   - `MobileRTCResources.bundle`
3. Create a `ZoomSDK` folder inside:

.flutter-zoom-wrapper/
└── ios/


4. Copy both files into this path:

.flutter-zoom-wrapper/
└── ios/
└── ZoomSDK/


5. Then also copy `MobileRTCResources.bundle` into your main app’s Runner project:

ios/
└── Runner/
└── MobileRTCResources.bundle


---

### 🛠️ Final Step

Run the following commands to install required iOS dependencies:

```bash
flutter pub get
cd ios
pod install


