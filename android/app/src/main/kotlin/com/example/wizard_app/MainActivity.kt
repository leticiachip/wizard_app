package com.example.wizard_app
import android.view.WindowManager
import android.os.Bundle;
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity(){
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // below line prevents the user from taking screenshot or record the screen
        window.setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE)
    }
}
