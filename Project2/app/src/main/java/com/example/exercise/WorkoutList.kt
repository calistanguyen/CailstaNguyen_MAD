package com.example.exercise

class WorkoutList(var list: Array<Workout> = emptyArray(), var unit: String = "lb") {
    //function to add workout to the list
    fun addWorkout(workout: Workout){
        list += workout
    }
    //function that changes the weight unit
    fun changeUnit(toUnit: String){
        list.forEach{
            it.setWeightUnit(toUnit)
        }
    }

}