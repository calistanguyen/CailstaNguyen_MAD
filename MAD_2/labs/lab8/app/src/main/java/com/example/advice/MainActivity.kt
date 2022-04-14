package com.example.advice

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.TextView
import com.example.advice.model.Slip
import com.example.advice.util.JSONData

class MainActivity : AppCompatActivity() {

    val loader = JSONData()
    var slip: Slip = Slip(0, "")
    lateinit var textView: TextView;
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        textView = findViewById(R.id.textView)
    }

    fun loadAdvice(view: View) {
        loader.loadJSON(this.applicationContext, this)
    }
}