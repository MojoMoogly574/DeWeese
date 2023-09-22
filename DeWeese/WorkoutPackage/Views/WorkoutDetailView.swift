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
    let types = ["Strength", "Power", "Cardio", "HIIT", "Recover", "Yoga", "Run", "Walk", "Stretch", "Grappling", "Boxing",  "MMA", "Sport", "Golf"]
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                List{
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
                                    .padding(.leading, -20)
                                Text(workout.workoutType)
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.gray)
                            }.padding(.top)
                            
                        }
                        
                    }.fontWeight(.bold)
                        .foregroundStyle(.primary)
                    Section(header: Text("Exercises")) {
                        ForEach(workout.exercises, id: \.self) { exercise in
                            Label(exercise, systemImage: "figure.run")
                                .accessibilityLabel(Text("figure.run"))
                                .accessibilityValue(Text(exercise))
                        }
                    }.fontWeight(.bold)
                        .foregroundStyle(.primary)
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
                .listStyle(InsetGroupedListStyle())
                .navigationBarItems(trailing: Button("Edit") {
                    isPresented = true
                    data = workout.data
                })
                .navigationTitle(workout.workoutName)
                .fullScreenCover(isPresented: $isPresented) {
                    NavigationView {
                        EditView()
                            .navigationTitle(workout.workoutName)
                            .navigationBarItems(leading: Button("Cancel") {
                                isPresented = false
                            }, trailing: Button("Update") {
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