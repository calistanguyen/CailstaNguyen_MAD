package com.example.exercise

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Gravity
import android.widget.*
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar

class addWorkout : AppCompatActivity() {
    lateinit var workoutNameEditText: TextView
    lateinit var repsEditText: TextView
    lateinit var setsEditText: TextView
    lateinit var weightEditText: TextView
    lateinit var unitLabel: TextView
    lateinit var addWorkoutButton: Button
    lateinit var popupLayout: ConstraintLayout

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add_workout)
        workoutNameEditText = findViewById(R.id.workoutNameEditText)
        repsEditText = findViewById(R.id.repsEditText)
        setsEditText = findViewById(R.id.setsEditText)
        weightEditText = findViewById(R.id.weightEditText)
        unitLabel = findViewById(R.id.unitLabel)
        addWorkoutButton = findViewById(R.id.addButton)

        popupLayout = findViewById(R.id.popup_layout)

        val unit = intent.getStringExtra("unit")
        unitLabel.text = unit
    }

    fun addWorkout(view: android.view.View) {
        if(workoutNameEditText.text.toString() ==""|| repsEditText.text.toString() == "" || weightEditText.text.toString() == "" || setsEditText.text.toString() == ""){
            val fillingSnackBar = Snackbar.make(popupLayout, "Please make sure to fill out all fields", Snackbar.LENGTH_SHORT)
            fillingSnackBar.show()
        }
        else{
            val data = Intent()
            data.putExtra("workout name", workoutNameEditText.text.toString())
            data.putExtra("reps", repsEditText.text.toString())
            data.putExtra("sets", setsEditText.text.toString())
            data.putExtra("weight", weightEditText.text.toString())
            setResult(Activity.RESULT_OK, data) //must be set before
            finish()
        }
    }
}