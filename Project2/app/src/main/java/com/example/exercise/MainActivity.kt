package com.example.exercise

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.text.TextWatcher
import android.view.Gravity
import android.view.LayoutInflater
import android.view.View
import android.widget.*
import com.google.android.material.floatingactionbutton.FloatingActionButton
import org.w3c.dom.Text
import android.text.Editable




class MainActivity : AppCompatActivity() {
    lateinit var addWorkoutButton: FloatingActionButton
    lateinit var goalVolumeEditText: TextView
    lateinit var weightSpinner: Spinner
    lateinit var currentVolumeTextView: TextView
    lateinit var currentVolumeDifferenceTextView: TextView
    lateinit var list: ListView
    lateinit var adapter: ArrayAdapter<CharSequence>

    var goalVolume: Double = 0.0
    var currentVolume: Double = 0.0
    var volumeDifference: Double = 0.0

    private val REQUEST_CODE = 1
    val WorkoutList = WorkoutList()
    var workoutListString: Array<CharSequence> = emptyArray()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        addWorkoutButton = findViewById(R.id.floatingActionButton)
        goalVolumeEditText = findViewById(R.id.goalVolumeTextField)
        weightSpinner = findViewById(R.id.spinner)
        currentVolumeTextView = findViewById(R.id.currentVolumeTextView)
        currentVolumeDifferenceTextView = findViewById(R.id.currentVolumeDifferenceTextView)
        list = findViewById<ListView>(R.id.workoutListView)
        adapter = ArrayAdapter<CharSequence>(this, R.layout.list_view, workoutListString)
        list.setAdapter(adapter)

        addWorkoutButton.setOnClickListener{
            val intent = Intent(this, addWorkout::class.java)
            startActivityForResult(intent, REQUEST_CODE);
        }

        goalVolumeEditText.addTextChangedListener(object : TextWatcher {
            //https://stackoverflow.com/questions/35224459/how-to-detect-if-users-stop-typing-in-edittext-android
            override fun onTextChanged(s: CharSequence, start: Int, before: Int, count: Int) {
                if (s.toString() == "") {
                    goalVolume = 0.0
                } else {
                    goalVolume = s.toString().toDouble()
                    updateVolumeDifference()
                }
            }

            override fun beforeTextChanged(s: CharSequence, start: Int, count: Int, after: Int) {}
            override fun afterTextChanged(s: Editable) {}
        })
    }
    fun workoutsString(){
        val current = WorkoutList.list.last()
        workoutListString+= "${current.name}:  ${current.sets} sets x ${current.reps} reps of ${current.weight} ${WorkoutList.unit}"
    }
    fun updateVolumeDifference(){
        if(goalVolume != 0.0){
            volumeDifference = goalVolume - currentVolume
            var currVolDiffText: String = ""
            if(volumeDifference == 0.0){
                currentVolumeDifferenceTextView.setTextColor(getResources().getColor(R.color.volumeReached))
                currVolDiffText = "You hit your goal volume!"
            } else if (volumeDifference > 0.0){
                currentVolumeDifferenceTextView.setTextColor(getResources().getColor(R.color.volumeNotReached))
                currVolDiffText = "You are -${volumeDifference} ${WorkoutList.unit} away from your goal!"

            } else if (volumeDifference < 0.0){
                currentVolumeDifferenceTextView.setTextColor(getResources().getColor(R.color.volumeReached))
                currVolDiffText = "You are +${-volumeDifference} ${WorkoutList.unit} above your goal!"
            }
            currentVolumeDifferenceTextView.text = currVolDiffText
        }

    }
    fun updateCurrentVolume(){
        currentVolume = 0.0
        WorkoutList.list.forEach{
            currentVolume+=it.weight * it.reps * it.sets
        }
        currentVolumeTextView.text = "${currentVolume.toString()} ${WorkoutList.unit}"
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if(requestCode == REQUEST_CODE && (resultCode == Activity.RESULT_OK)) {
            val workoutName = data?.let { data.getStringExtra("workout name") }
            val reps = data?.let { data.getStringExtra("reps")!!.toInt() }
            val sets = data?.let { data.getStringExtra("sets")!!.toInt() }
            val weight = data?.let { data.getStringExtra("weight")!!.toDouble()}
            WorkoutList.addWorkout(Workout(workoutName!!, reps!!, sets!!, weight!!))
            workoutsString()
            adapter = ArrayAdapter<CharSequence>(this, R.layout.list_view, workoutListString)
            list.setAdapter(adapter)
            updateCurrentVolume()
            updateVolumeDifference()
        }
    }
}