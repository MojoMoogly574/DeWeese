//
//  WorkoutModel.swift
//  DeWeese
//
//  Created by J. DeWeese on 9/21/23.
//

import RealmSwift
import SwiftUI


class WorkoutModel: Object, ObjectKeyIdentifiable {
    @Persisted var workoutName = ""
    @Persisted var workoutDescription = ""
    @Persisted var workoutType = ""
    @Persisted var exerciseList = RealmSwift.List<String>()
    @Persisted var historyList = RealmSwift.List<History>()
    
    var exercises: [String] { Array(exerciseList) }
    var history: [History] { Array(historyList) }
    
    convenience init(workoutName: String, workoutDescription: String, workoutType: String, exercises: [String], history: [History] = []) {
        
        self.init()
        self.workoutName = workoutName
        self.workoutDescription = workoutDescription
        self.workoutType = workoutType
        exerciseList.append(objectsIn: exercises)
        for entry in history {
            self.historyList.insert(entry, at: 0)
        }
    }
}
extension WorkoutModel {
    static var data: [WorkoutModel]{
        
        [ WorkoutModel(workoutName: "Michael", workoutDescription: "3 Round for time.", workoutType: "HIIT", exercises: ["Run 800 Meters", "50 Back Extensions", "50 Sit-Ups"]),
          WorkoutModel(workoutName: "Murph", workoutDescription: "Complete for time.", workoutType: "HIIT", exercises: ["1 Mile Run", "100 Pull-Ups", "200 Push-ups", "300 Squats", "1 Mile Run"]),
          WorkoutModel(workoutName: "Roy", workoutDescription: "5 Round for time.", workoutType: "HIIT", exercises: ["225Lbs Deadlift, 15 Reps", "20 Box Jumps (24 inch box)", "25 Pull-Ups"]),
         WorkoutModel(workoutName: "Severin", workoutDescription: "Complete as Rx'd", workoutType: "HIIT", exercises: ["50 Pull-Ups", "100 Push-Ups", "5K Run"])
         ]
    }
}
extension WorkoutModel {
    struct Data {
        var workoutName: String = ""
        var workoutDescription: String = ""
        var workoutType: String = ""
        var exercises: [String] = []
    }
    var data: Data {
        return Data(workoutName: workoutName, workoutDescription: workoutDescription, workoutType: workoutType, exercises: exercises)
    }
    func update(data: Data) {
        workoutName = data.workoutName
        workoutDescription = data.workoutDescription
        workoutType = data.workoutType
        for exercise in data.exercises {
            if !exercises.contains(exercise) {
                self.exerciseList.append(exercise)
            }
        }
    }
}
