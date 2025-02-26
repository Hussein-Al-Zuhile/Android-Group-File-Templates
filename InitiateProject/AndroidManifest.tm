<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">

    <uses-permission android:name="android.permission.INTERNET" />

    <!--TODO: Replace Theme.AndroidProjectsStandard with your desired theme name.-->
    <!--TODO: Replace the app name in the strings.xml file with your app name.-->
    <application
        android:name=".App"
        android:allowBackup="true"
        android:dataExtractionRules="@xml/data_extraction_rules"
        android:fullBackupContent="@xml/backup_rules"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/Theme.{Project Name}[-C]"
        android:usesCleartextTraffic="true"
        tools:targetApi="31">
        <activity
            android:name=".presentation.main.MainActivity"
            android:exported="true"
            android:theme="@style/Theme.{Project Name}[-C]">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>