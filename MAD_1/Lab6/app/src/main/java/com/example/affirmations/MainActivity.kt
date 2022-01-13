package com.example.affirmations

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView
import org.w3c.dom.Text

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
    fun sayCompliment(view: android.view.View) {
        val compliment = findViewById<TextView>(R.id.complimentText)
        val editName = findViewById<EditText>(R.id.name)
        val complimentImage = findViewById<ImageView>(R.id.complimentImage)
        val idx = (0..1).random()
        if (idx == 0){
            compliment.text = getString(R.string.compliment1, editName.text)
            complimentImage.setImageResource(R.drawable.usagyuuun1)
        }
        else if(idx == 1){
            compliment.text = getString(R.string.compliment2, editName.text)
            complimentImage.setImageResource(R.drawable.usagyuuun2)
        }
    }
}