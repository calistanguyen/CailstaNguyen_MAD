package com.example.pokemon

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.text.Layout
import android.widget.Button
import android.widget.RadioButton
import android.widget.Spinner
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar

class MainActivity : AppCompatActivity() {
    lateinit var radioButton1: RadioButton
    lateinit var radioButton2: RadioButton
    lateinit var radioButton3: RadioButton
    lateinit var spinner: Spinner
    lateinit var button: Button
    lateinit var layoutRoot: ConstraintLayout

    val Pokemon: Pokemon = Pokemon()

    var flag = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        radioButton1 = findViewById(R.id.radioButton1)
        radioButton2 = findViewById(R.id.radioButton2)
        radioButton3 = findViewById(R.id.radioButton3)

        spinner = findViewById(R.id.spinner)

        button = findViewById(R.id.button)

        layoutRoot = findViewById(R.id.layoutRoot)
    }

    fun setPokemonInfo(view: android.view.View){
        flag = 1
        if (radioButton1.isChecked()) {
            Pokemon.setPokemonType(radioButton1.text.toString())
        }else if(radioButton2.isChecked()){
            Pokemon.setPokemonType(radioButton2.text.toString())
        }else if(radioButton3.isChecked()){
            Pokemon.setPokemonType(radioButton3.text.toString())
        }else {
            val typeSnackBar = Snackbar.make(layoutRoot, "please pick a type", Snackbar.LENGTH_SHORT)
            typeSnackBar.show()
            flag = -1
        }
        Pokemon.setPokemonRegion(spinner.selectedItemPosition)
        Pokemon.setPokemonUrl()

        if(flag == 1){
            val intent = Intent(this, PokemonDisplay::class.java)
            intent.putExtra("type", Pokemon.type)
            intent.putExtra("region", Pokemon.region)
            intent.putExtra("url", Pokemon.url)
            startActivity(intent)

        }
    }
}