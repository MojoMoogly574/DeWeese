//
//  WorkoutCardView.swift
//  DeWeese
//
//  Created by J. DeWeese on 9/22/23.
//

import SwiftUI

struct WorkoutCardView: View {
    //MARK:  PROPERTIES
    let workout: WorkoutModel
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
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(workout.workoutName)
                    .foregroundColor(.primary)
                    .accessibilityAddTraits(.isHeader)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.leading,4)
                    .padding(2)
                    Text(workout.workoutDescription)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.colorBlue)
                        .padding(.leading, 10)
                        .padding(.top,3)
                   
                HStack{
                    Spacer()
                    Text(workout.workoutType)
                        .padding(.horizontal,6)
                        .padding(2)
                        .font(.footnote)
                        .foregroundColor(.primary)
                        .accessibilityLabel("Workout type\(workout.workoutType) ")
                        .font(.caption)
                        .overlay(
                            Capsule().stroke(.primary, lineWidth: 2)
                        )
                }
            }
               
        }.padding(.horizontal, 2)
         //   .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),self.colorize(type: workout.workoutType)]), startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.6))
        
       
}
}
   
 struct CardView_Previews: PreviewProvider {
        
        static var workout = WorkoutModel.data[0]
        static var previews: some View {
            WorkoutCardView(workout: workout)
                .previewLayout(.fixed(width: 400, height: 60))
        }
    }

    
