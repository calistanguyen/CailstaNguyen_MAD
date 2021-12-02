package com.example.exercise

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Gravity
import android.widget.*
import androidx.constraintlayout.widget.ConstraintLayout

class addWorkout : AppCompatActivity() {
    lateinit var workoutNameEditText: TextView
    lateinit var repsEditText: TextView
    lateinit var setsEditText: TextView
    lateinit var weightEditText: TextView
    lateinit var addWorkoutButton: Button
    lateinit var popupLayout: ConstraintLayout

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_add_workout)
        workoutNameEditText = findViewById(R.id.workoutNameEditText)
        repsEditText = findViewById(R.id.repsEditText)
        setsEditText = findViewById(R.id.setsEditText)
        weightEditText = findViewById(R.id.weightEditText)
        addWorkoutButton = findViewById(R.id.addButton)


        addWorkoutButton.setOnClickListener{
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