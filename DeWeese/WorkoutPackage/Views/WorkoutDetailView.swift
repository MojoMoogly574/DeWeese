//
//  WorkoutDetailView.swift
//  DeWeese
//
//  Created by J. DeWeese on 9/22/23.
//

import SwiftUI
import RealmSwift


struct WorkoutDetailView: View {
    //MARK:  PROPERTIES
    @ObservedRealmObject var workout: WorkoutModel
    @Environment(\.presentationMode) var presentationMode
    @State private var data = WorkoutModel.Data()
    @State private var isPresented = false
    //MARK:  WORKOUT TYPES COLORIZATION
    let types = ["Strength", "Power", "Cardio", "HIIT", "Recover", "Yoga","Sport", "Run", "Walk", "Grappling", "Boxing", "MMA", "Golf", "Stretch", "Swim"]
    func colorize(type: String) -> Color {
        switch type {
        case "HIIT":
            return .HIIT
        case "Recover":
            return .recover
        case "Strength":
            return .strength
        case "Cardio":
            return .cardio
        case "Power":
            return .power
        case "Yoga":
            return .yoga
        case "Boxing":
            return .boxing
        case "Grappling":
            return .grappling
        case "Run":
            return .run
        case "Walk":
            return .walk
        case "Golf":
            return .golf
        case "MMA":
            return .MMA
        case "Stretch":
            return .stretch
        case "Sport":
            return .sport
        case "Swim":
            return .swim
        default:
            return .gray
            
        }
    }
    var body: some View {
            
        ZStack {
           
            Color.primary.opacity(0.1).ignoresSafeArea()
            VStack{
                    
                    Form{
                        Section(header: Text("Workout Detail")) {
                            VStack {
                                VStack(alignment: .leading){
                                    Text("Workout Description:").padding(.horizontal)
                                        .font(.system(size: 18))
                                        .fontWeight(.bold)
                                        .padding(.leading, -20)
                                    Text(workout.workoutDescription)
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.gray)
                                }
                                HStack {
                                    Text("Workout Type:")
                                        .font(.system(size: 18))
                                        .fontWeight(.bold)
                                        .padding(.leading, -30)
                                    Text(workout.workoutType)
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.colorGrey)
                                }.padding(.top)
                                    
                                
                            }
                            
                        }.fontWeight(.bold)
                            .foregroundStyle(.primary)
                        Section(header: Text("Exercises")) {
                            ForEach(workout.exercises, id: \.self) { exercise in
                                Label(exercise, systemImage: "circle.fill")
                                    .font(.system(size: 16))
                                    .accessibilityLabel(Text("circle.fill"))
                                    .accessibilityValue(Text(exercise))
                            }
                            .foregroundStyle(.colorGrey)
                        }.fontWeight(.bold)
                            .foregroundStyle(.primary)
                            
                        NavigationLink(
                            destination: WorkoutScreen()
                        ) {
                            Label("Begin Workout", systemImage: "timer")
                                .font(.headline)
                                .foregroundColor(.black)
                                .accessibilityLabel(Text("Begin Workout"))
                        }
                        //MARK:  HISTORY-COMPLETED WORKOUTS
                        Section(header: Text("Completed Workouts")) {
                            if workout.history.isEmpty {
                                Label("Once completed, completed workout summaries will appear here.", systemImage: "calendar.badge.exclamationmark")
                            }
                            ForEach(workout.history) { history in
                                NavigationLink(destination: HistoryView()) {
                                    HStack {
                                        Image(systemName: "calendar")
                                        if let date = history.date {
                                            Text(date, style: .date)
                                        } else {
                                            Text("Date is missing")
                                        }
                                    }
                                }
                            }
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                        }
                    }
                    .navigationBarItems(trailing: Button("Edit") {
                        isPresented = true
                        HapticManager.notification(type: .success)
                        data = workout.data
                    })
                    .navigationTitle(workout.workoutName)
                    .fullScreenCover(isPresented: $isPresented) {
                        NavigationView {
                            EditWorkoutView(workoutData: $data)
                                .navigationTitle(workout.workoutName)
                                .navigationBarItems(leading: Button("Cancel") {
                                    HapticManager.notification(type: .success)
                                    isPresented = false
                                }, trailing: Button("Update") {
                                    HapticManager.notification(type: .success)
                                    isPresented = false
                                    do {
                                        try Realm().write() {
                                            guard let thawedWorkout = workout.thaw() else {
                                                print("Unable to thaw workout")
                                                return
                                            }
                                            thawedWorkout.update(data: data)
                                        }
                                    } catch {
                                        print("Failed to save workout: \(error.localizedDescription)")
                                    }
                                })
                        }
                    }
            }
        }
        }
    }
#Preview {
    WorkoutDetailView(workout: WorkoutModel.data[0])
}
