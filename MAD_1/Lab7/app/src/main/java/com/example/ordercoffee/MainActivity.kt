package com.example.ordercoffee

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.*
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar
import com.google.android.material.switchmaterial.SwitchMaterial

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun createLatte(view: android.view.View){

        val layoutRoot = findViewById<ConstraintLayout>(R.id.root_layout)

        val hotOrIced = findViewById<RadioGroup>(R.id.hotOrIced)
        val hotOrIcedId = hotOrIced.checkedRadioButtonId

        val vanilla = findViewById<CheckBox>(R.id.checkBox1)
        val caramel = findViewById<CheckBox>(R.id.checkBox2)
        val mocha = findViewById<CheckBox>(R.id.checkBox3)
        var syrupList = ""
        syrupList += if(vanilla.isChecked) {vanilla.text} else{""}
        syrupList += if(caramel.isChecked) {" " + caramel.text} else{""}
        syrupList += if(mocha.isChecked) {" " + mocha.text} else{""}

        val milkSpinner = findViewById<Spinner>(R.id.spinner)
        val milk = milkSpinner.selectedItem.toString()

        val whippedCream = findViewById<SwitchMaterial>(R.id.switch1)
        var withWhip = if(whippedCream.isChecked){" with whipped cream"} else{""}

        if(hotOrIcedId == -1){
            val fillingSnackBar = Snackbar.make(layoutRoot, "please choose hot or iced!", Snackbar.LENGTH_SHORT)
            fillingSnackBar.show()
        }else{
            val image = findViewById<ImageView>(R.id.coffeeImage)
            val coffeeOrder = findViewById<TextView>(R.id.coffeeMessage)
            if(findViewById<RadioButton>(hotOrIcedId).text == "iced"){
                coffeeOrder.text = getString(R.string.icedLatte, milk, syrupList, withWhip)
                image.setImageResource(R.drawable.ice_coffee)
            }else{
                coffeeOrder.text = getString(R.string.hotLatte, milk, syrupList, withWhip)
                image.setImageResource(R.drawable.hot_coffee)
            }

            coffeeOrder.setBackgroundResource(R.drawable.rectangle)
        }
    }
}