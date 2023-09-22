//
//  AddWorkoutScreen.swift
//  DeWeese
//
//  Created by J. DeWeese on 9/21/23.
//

import SwiftUI

struct AddWorkoutScreen: View {
    //MARK:  PROPERTIES
    @Binding var workoutData: WorkoutModel.Data
    @State private var newExercise = ""
    @Environment(\.presentationMode) var presentationMode
    //MARK:  WORKOUT TYPES COLORIZATION
    let types = ["Strength", "Power", "Cardio", "HIIT", "Recover", "Yoga", "Run", "Walk", "Stretch", "Grappling", "Boxing",  "MMA", "Sport", "Golf"]
    var body: some View {
        
        
        NavigationView {
            
            VStack{
                List{
                    Section(header: Text("Workout Name").foregroundColor(.primary).fontWeight(.bold)) {
                        TextField("Title", text: $workoutData.workoutName)
                            .padding()
                            .background(Color(UIColor.tertiarySystemFill))
                            .lineLimit(1)
                            .minimumScaleFactor(0.2)
                            .cornerRadius(10)
                            .foregroundColor(.primary)
                    }.foregroundStyle(.primary)
                        .fontWeight(.bold)
                    Section(header: Text("Workout Description").fontWeight(.bold).foregroundColor(.primary)) {
                        TextEditor(text: $workoutData.workoutDescription)
                            .frame(maxWidth: .infinity, minHeight: 75, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .lineLimit(5)
                            .padding(2)
                            .background(Color(UIColor.tertiarySystemFill))
                            .cornerRadius(10)
                            .foregroundColor(.primary)
                    }.foregroundStyle(.primary)
                        .fontWeight(.bold)
                    //MARK:  WORKOUT TYPE PICKER
                    Section(header: Text("Workout Type").fontWeight(.bold).foregroundColor(.primary)) {
                        Picker("Workout Type:", selection: $workoutData.workoutType) {
                            ForEach(types, id: \.self) {
                                Text($0)
                            }.pickerStyle(MenuPickerStyle())
                                .foregroundStyle(.primary)
                        }.foregroundStyle(.primary)
                            .fontWeight(.bold)
                    }
                    Section(header: Text("Exercises")) {
                        ForEach(workoutData.exercises, id: \.self) { exercise in
                            Text(exercise)
                        }
                        .onDelete { indices in
                            workoutData.exercises.remove(atOffsets: indices)
                        }
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
                    }.foregroundStyle(.primary)
                        .fontWeight(.bold)
                }.listStyle(InsetGroupedListStyle())
                //MARK:  SAVE BUTTON
                Button("Save"){
                    HapticManager.notification(type: .success)
                    print("save")
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.system(size: 35))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .cornerRadius(10)
                .frame(width: UIScreen.main.bounds.width / 1.5)
                .background(.colorOrange)
                .cornerRadius(10)
                .padding(.bottom, 75)
            }
            .navigationTitle("Add Workout")
        }
    }
}
#Preview {
    AddWorkoutScreen(workoutData: .constant(WorkoutModel.data[0].data))
}
