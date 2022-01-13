package com.example.pokemon

import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView

class PokemonDisplay : AppCompatActivity() {
    lateinit var image: ImageView
    lateinit var caption: TextView
    lateinit var button: Button

    var type = ""
    var region = ""
    var url = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_pokemon_display)

        image = findViewById(R.id.pokemonImage)
        caption = findViewById(R.id.imageCaption)
        button = findViewById(R.id.learnMoreButton)

        type = intent.getStringExtra("type")!!
        region = intent.getStringExtra("region")!!
        url = intent.getStringExtra("url")!!

        println("URL $url")
        println("URL $type")

        if(type == "fire") {
            if(region == "Sinnoh") {
                image.setImageResource(R.drawable.chimchar)
                caption.text = getString(R.string.you_got_chimchar)
            }else{
                image.setImageResource(R.drawable.cyndaquil)
                caption.text = getString(R.string.you_got_cyndaquil)
            }
        }
        else if(type == "water") {
            if(region == "Sinnoh") {
                image.setImageResource(R.drawable.piplup)
                caption.text = getString(R.string.you_got_piplup)
            }else{
                image.setImageResource(R.drawable.oshawott)
                caption.text = getString(R.string.you_got_oshawott)
            }
        }
        else if(type == "grass") {
            if(region == "Sinnoh") {
                image.setImageResource(R.drawable.turtwig)
                caption.text = getString(R.string.you_got_turtwig)
            }else{
                image.setImageResource(R.drawable.rowlet)
                caption.text = getString(R.string.you_got_rowlett)
            }
        }

        button.setOnClickListener{
            view -> loadWebsite()
        }
    }

    private fun loadWebsite(){
        var intent = Intent()
        intent.action = Intent.ACTION_VIEW
        intent.data = url?.let{Uri.parse(url)}
        println(url)
        startActivity(intent)

    }
}