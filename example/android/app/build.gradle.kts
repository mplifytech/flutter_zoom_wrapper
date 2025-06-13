plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")

}
android {
    namespace = "com.mfy.flutter_zoom_wrapper_example"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }




    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.mfy.flutter_zoom_wrapper_example"
        minSdk = 26
        targetSdk = 35
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

repositories {
    flatDir {
        dirs(project(":flutter_zoom_wrapper").projectDir.resolve("libs"))
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation(mapOf("name" to "mobilertc", "ext" to "aar"))
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.11.0")
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
    implementation("com.google.crypto.tink:tink-android:1.6.1")
    implementation("com.github.bumptech.glide:glide:4.12.0")
}

