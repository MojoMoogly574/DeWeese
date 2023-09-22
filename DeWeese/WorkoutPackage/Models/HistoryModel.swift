//
//  HistoryModel.swift
//  DeWeese
//
//  Created by J. DeWeese on 9/21/23.
//

import Foundation
import RealmSwift

class History: EmbeddedObject, ObjectKeyIdentifiable {
    @Persisted var date: Date?
    @Persisted var workoutName: String
    @Persisted var exerciseList = List<String>()
    @Persisted var transcript: String?
    @Persisted var comments: String
    var exercises: [String] { Array(exerciseList) }

    convenience init(date: Date? = nil, workoutName: String, exerciseList: List<String> = List<String>(), transcript: String? = nil, comments: String) {
        self.init()
        self.date = date
        self.workoutName = workoutName
        exerciseList.append(objectsIn: exercises)
        self.transcript = transcript
        self.comments = comments
    }
    }

