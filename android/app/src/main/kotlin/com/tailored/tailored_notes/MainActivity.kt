package com.tailored.tailored_notes

import android.os.Bundle
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    // FLAG_SECURE blocks screenshots and hides app content in the recent-apps
    // (app switcher) preview. TailorEd holds children's safeguarding records on
    // shared care-home devices, so the screen contents must not be capturable
    // or visible outside the app.
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        window.setFlags(
            WindowManager.LayoutParams.FLAG_SECURE,
            WindowManager.LayoutParams.FLAG_SECURE,
        )
    }
}
