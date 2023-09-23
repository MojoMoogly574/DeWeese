//
//  EditWorkoutView.swift
//  DeWeese
//
//  Created by J. DeWeese on 9/22/23.
//

import SwiftUI

struct EditWorkoutView: View {
    //MARK:  PROPERTIES
    @Binding var workoutData: WorkoutModel.Data
    @Environment(\.presentationMode) var presentationMode
    @State private var newExercise = ""
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
        
        List{
            
                //MARK:  WORKOUT NAME
                Section(header: Text("Workout Name").font(.system(size: 19)).foregroundColor(.primary)) {
                    TextField("Title", text: $workoutData.workoutName)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .lineLimit(1)
                    //  .minimumScaleFactor(0.2)
                        .cornerRadius(10)
                        .foregroundColor(.colorGrey)
                } .fontWeight(.bold)
                //MARK:  WORKOUT DESCRIPTION
                Section(header: Text("Workout Description").font(.system(size: 19)).foregroundColor(.primary)) {
                    TextEditor(text: $workoutData.workoutDescription)
                        .frame(maxWidth: .infinity, minHeight: 75, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .lineLimit(5)
                        .padding(2)
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(10)
                        .font(.system(size: 16))
                        .foregroundColor(.colorGrey)
                }.foregroundStyle(.colorGrey)
                    .fontWeight(.bold)
                //MARK:  WORKOUT TYPE PICKER
                Section(header: Text("").fontWeight(.bold).foregroundColor(.primary).font(.system(size: 19))) {
                    Picker("Workout Type:", selection: $workoutData.workoutType) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }.pickerStyle(MenuPickerStyle())
                            .foregroundStyle(.colorGrey)
                    }.foregroundStyle(.primary)
                        .fontWeight(.bold)
                }
                //MARK:  EXERCISE LIST
            Section(header: Text("Exercises").font(.system(size: 19)).fontWeight(.bold).foregroundStyle(.primary)) {
                    ForEach(workoutData.exercises, id: \.self) { exercise in
                        Text(exercise)
                    }
                    .onDelete { indices in
                        workoutData.exercises.remove(atOffsets: indices)
                    } .foregroundStyle(.colorGrey)
                    
                    HStack {
                        TextField("New Exercise", text: $newExercise)
                        Button(action: {
                            withAnimation {
                                workoutData.exercises.append(newExercise)
                                newExercise = ""
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .accessibilityLabel(Text("Add exercise"))
                        }
                        .disabled(newExercise.isEmpty)
                    }
                }
            }
        }
    }
#Preview {
    EditWorkoutView(workoutData: .constant(WorkoutModel.data[0].data))
}
