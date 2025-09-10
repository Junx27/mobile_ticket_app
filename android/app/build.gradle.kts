plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.mobile_ticket_app"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.example.mobile_ticket_app"
        minSdk = 21
        targetSdk = 35
        versionCode = 1
        versionName = "1.0.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    signingConfigs {
        // Hanya release signing jika mau upload ke Play Store
        create("release") {
            // TODO: ganti dengan keystore release jika ada
            // keyAlias = "yourKeyAlias"
            // keyPassword = "yourKeyPassword"
            // storeFile = file("path/to/keystore.jks")
            // storePassword = "yourStorePassword"
        }
    }

    buildTypes {
        getByName("debug") {
            // debug signing default Flutter
        }
        getByName("release") {
            // pakai debug signing untuk testing lokal
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }
}

flutter {
    source = "../.."
}
