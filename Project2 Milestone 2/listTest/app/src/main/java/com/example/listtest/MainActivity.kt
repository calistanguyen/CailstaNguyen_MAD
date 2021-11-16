package com.example.listtest

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.MotionEvent

import android.view.Gravity

import com.example.listtest.R
import android.view.LayoutInflater
import android.view.View
import android.widget.*


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val adapter = {
            ArrayAdapter<CharSequence>(
                this,
                R.layout.list_view,
                workoutsString()
            )
        }
        val list = findViewById<ListView>(R.id.listView)
        list.setAdapter(adapter())
        val inflatedView: View = layoutInflater.inflate(R.layout.popup, null)
//        val addButton = inflatedView.findViewById<Button>(R.id.addButton)
//        addButton.setOnClickListener{
//            println("hi")
//            adapter().notifyDataSetChanged()
//        }
    }

    fun workoutsString(): Array<CharSequence>{
        var workoutListString = emptyArray<CharSequence>()
        workouts.forEach{
            workoutListString += "${it.name}"
        }
        return workoutListString
    }

    fun popupWindow(view: android.view.View){
        // inflate the layout of the popup window
        // inflate the layout of the popup window
        val inflater = getSystemService(LAYOUT_INFLATER_SERVICE) as LayoutInflater
        val popupView = inflater.inflate(R.layout.popup, null)
        val inflatedView: View = layoutInflater.inflate(R.layout.popup, null)
        // create the popup window

        // create the popup window
        val width = LinearLayout.LayoutParams.WRAP_CONTENT
        val height = LinearLayout.LayoutParams.WRAP_CONTENT
        val focusable = true // lets taps outside the popup also dismiss it

        val popupWindow = PopupWindow(popupView, width, height, focusable)

        // show the popup window
        // which view you pass in doesn't matter, it is only used for the window tolken

        // show the popup window
        // which view you pass in doesn't matter, it is only used for the window tolken
        popupWindow.showAtLocation(view, Gravity.CENTER, 0, 0)

    }
    fun addWorkout(view: android.view.View) {
        //https://stackoverflow.com/questions/4211189/how-to-get-id-in-different-layout
        val inflatedView: View = layoutInflater.inflate(R.layout.popup, null)
        val workoutName = inflatedView.findViewById<TextView>(R.id.workoutName).text
        println(workoutName)
        workouts+=Exercise(workoutName)
        val adapter = {
            ArrayAdapter<CharSequence>(
                this,
                R.layout.list_view,
                workoutsString()
            )
        }
        val list = findViewById<ListView>(R.id.listView)
        list.setAdapter(adapter())

        inflatedView.visibility = View.GONE

    }




    }