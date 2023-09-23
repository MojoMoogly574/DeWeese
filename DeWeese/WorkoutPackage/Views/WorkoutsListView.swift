//
//  WorkoutsListView.swift
//  DeWeese
//
//  Created by J. DeWeese on 9/22/23.
//

import SwiftUI
import RealmSwift



struct WorkoutsListView: View {
    //MARK: PROPERTIES
    @ObservedResults(WorkoutModel.self) var workouts
    @State private var isPresented = false
    @State private var newWorkoutData = WorkoutModel.Data()
    @State private var currentWorkout = WorkoutModel()
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
        NavigationView{
            ZStack {
              
                List {
                    ForEach(workouts) { workout in
                        NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                            WorkoutCardView(workout: workout)
                        }.cornerRadius(12.0)
                        .padding(7)
                        .listRowBackground(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),self.colorize(type: workout.workoutType)]), startPoint: .bottom, endPoint: .top).opacity(0.6))
                    }.overlay(
                        RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(self.colorize(type: newWorkoutData.workoutType ), lineWidth: 3.0))
                   
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Daily Workouts")
                .navigationBarItems(trailing: Button(action: {
                    isPresented = true
                }) {
                    Image(systemName: "plus")
            })
            }
        }
            .sheet(isPresented: $isPresented) {
                NavigationView {
                    EditWorkoutView(workoutData: $newWorkoutData)
                        .navigationBarItems(leading: Button("Dismiss") {
                            isPresented = false
                        }, trailing: Button("Add") {
                            let newWorkout = WorkoutModel(
                                workoutName: newWorkoutData.workoutName, workoutDescription: newWorkoutData.workoutDescription, workoutType: newWorkoutData.workoutType, exercises: newWorkoutData.exercises
                            )
                            $workouts.append(newWorkout)
                            isPresented = false
                        })
                }
            }
        }
    }

#Preview {
    NavigationView{
        WorkoutsListView()
    }
}

