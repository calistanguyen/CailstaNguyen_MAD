package com.example.exercise

import android.app.Activity
import android.content.Intent
import android.content.res.Configuration
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
import android.widget.AdapterView







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
    var currentUnit: String = "lbs"

    private val REQUEST_CODE = 1
    val WorkoutList = WorkoutList()
    var workoutListString: MutableList<CharSequence> = ArrayList()

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

        currentVolumeTextView.text = "$currentVolume"
        addWorkoutButton.setOnClickListener{
            val intent = Intent(this, addWorkout::class.java)
            intent.putExtra("unit", currentUnit)
            startActivityForResult(intent, REQUEST_CODE);
        }

        goalVolumeEditText.addTextChangedListener(object : TextWatcher {
            //https://stackoverflow.com/questions/35224459/how-to-detect-if-users-stop-typing-in-edittext-android
            override fun onTextChanged(s: CharSequence, start: Int, before: Int, count: Int) {
                if (s.toString() == "") {
                    goalVolume = 0.0
                } else {
                    goalVolume = s.toString().toDouble()
                }
                updateVolumeDifference()
            }

            override fun beforeTextChanged(s: CharSequence, start: Int, count: Int, after: Int) {}
            override fun afterTextChanged(s: Editable) {}
        })

        weightSpinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
//            https://stackoverflow.com/questions/20151414/how-can-i-use-onitemselected-in-android
            override fun onItemSelected(
                parent: AdapterView<*>,
                view: View?,
                position: Int,
                id: Long
            ) {
                if(position == 0){
                    WorkoutList.list.forEach{
                        it.setWeightUnit("lbs")
                    }
                    if(WorkoutList.unit != "lbs"){
                        WorkoutList.unit = "lbs"
                        updateCurrentVolume()
                        updateVolumeDifference()
                        workoutsString()
                        changeGoalVolumeUnit()
//                https://newbedev.com/android-notifydatasetchanged-not-working
                        adapter.notifyDataSetChanged()
                    }
                }else {
                    WorkoutList.list.forEach{
                        it.setWeightUnit("kgs")
                    }
                    if(WorkoutList.unit != "kgs") {
                        WorkoutList.unit = "kgs"
                        updateCurrentVolume()
                        updateVolumeDifference()
                        workoutsString()
                        changeGoalVolumeUnit()
//                https://newbedev.com/android-notifydatasetchanged-not-working
                        adapter.notifyDataSetChanged()
                    }
                }

            }

            override fun onNothingSelected(parent: AdapterView<*>?) {
                return
            }
        }
    }
    fun workoutsString(){
        workoutListString.clear()
        WorkoutList.list.forEach{
            workoutListString+= "${it.name}:  ${it.sets} sets x ${it.reps} reps of ${"%.2f".format(it.weight)} ${WorkoutList.unit}"

        }
    }
    fun updateVolumeDifference(){
        if(goalVolume != 0.0){
            volumeDifference = "%.2f".format(goalVolume - currentVolume).toDouble()
            var currVolDiffText: String = ""
            if(volumeDifference == 0.0){
                currentVolumeDifferenceTextView.setTextColor(getResources().getColor(R.color.volumeReached))
                currVolDiffText = "You hit your goal volume!"
            } else if (volumeDifference > 0.0){
                currentVolumeDifferenceTextView.setTextColor(getResources().getColor(R.color.volumeNotReached))
                currVolDiffText = "You are -${"%.2f".format(volumeDifference)} ${WorkoutList.unit} away from your goal!"

            } else if (volumeDifference < 0.0){
                currentVolumeDifferenceTextView.setTextColor(getResources().getColor(R.color.volumeReached))
                currVolDiffText = "You are +${"%.2f".format(-volumeDifference)} ${WorkoutList.unit} above your goal!"
            }
            currentVolumeDifferenceTextView.text = currVolDiffText
        }else{
            currentVolumeDifferenceTextView.text = ""
        }

    }
    fun updateCurrentVolume(){
        currentVolume = 0.0
        WorkoutList.list.forEach{
            currentVolume+=it.weight * it.reps * it.sets
        }

        val text = "${"%.2f".format(currentVolume)} ${WorkoutList.unit}"

        currentVolumeTextView.text = text
    }

    fun changeGoalVolumeUnit(){
        if(WorkoutList.unit == "lbs" && WorkoutList.unit != currentUnit){
            currentUnit = "lbs"
            goalVolume *=2.205
        } else if(WorkoutList.unit == "kgs" && WorkoutList.unit != currentUnit) {
            currentUnit = "kgs"
            goalVolume /= 2.205
        }
        val text = "%.2f".format(goalVolume)
        goalVolumeEditText.text = text
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if(requestCode == REQUEST_CODE && (resultCode == Activity.RESULT_OK)) {
            val workoutName = data?.let { data.getStringExtra("workout name") }
            val reps = data?.let { data.getStringExtra("reps")!!.toInt() }
            val sets = data?.let { data.getStringExtra("sets")!!.toInt() }
            val weight = data?.let { data.getStringExtra("weight")!!.toDouble()}
            WorkoutList.addWorkout(Workout(workoutName!!, reps!!, sets!!, weight!!, currentUnit))
            workoutsString()
            adapter.notifyDataSetChanged()
            updateCurrentVolume()
            updateVolumeDifference()
        }
    }
    override fun onBackPressed() {
        workoutListString.clear()
        WorkoutList.list = emptyArray()
        currentVolume = 0.0
        goalVolume = 0.0
        goalVolumeEditText.text = ""
        updateCurrentVolume()
        updateVolumeDifference()
        adapter.notifyDataSetChanged()
    }


}