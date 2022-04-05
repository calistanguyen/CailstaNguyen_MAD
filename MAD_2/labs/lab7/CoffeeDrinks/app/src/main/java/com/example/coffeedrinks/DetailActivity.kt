package com.example.coffeedrinks

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageView
import android.widget.TextView

class DetailActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)
        //get intent
        val name = intent.getStringExtra("name")
        val description = intent.getStringExtra("description")
        val resourceID = intent.getIntExtra("resourceID", -1)

        //update view
        val drinkImage: ImageView = findViewById(R.id.drinkImageView)
        drinkImage.setImageResource(resourceID)
        val drinkName: TextView = findViewById(R.id.nameTextView)
        drinkName.text = name
        val drinkDescription: TextView = findViewById(R.id.descriptionTextView)
        drinkDescription.text = description
    }
}