//
//  ColorModel.swift
//  DeWeese
//
//  Created by J. DeWeese on 9/22/23.
//

import SwiftUI
import Foundation


extension Color {

    static let theme = ColorTheme( )
    static let launch = LaunchTheme( )
}


struct ColorTheme {
    
    let colorAccent = Color("AccentColor")
    let colorSecondaryText = Color("SecondaryTextColor")
    let colorGreen = Color("ColorGreen")
    let colorRed = Color("ColorRed")
    let colorOrange = Color("ColorOrange")
    let colorBlue = Color("ColorBlue")
    let colorGrey = Color("ColorGrey")
    let colorGray = Color("ColorGray")
    let colorBlack = Color("ColorBlack")
    let colorBackground = Color("ColorBackground")
    let HIIT = Color("hiit")
    let Strength = Color("strength")
    let Cardio = Color("cardio")
    let Power = Color("power")
    let Grappling = Color("grappling")
    let Boxing = Color("boxing")
    let Stretch = Color("stretch")
    let Recover = Color("recover")
    let Yoga = Color("yoga")
    let Run = Color("run")
    let Walk = Color("walk")
    let MMA = Color("mma")
    let Sport = Color("sport")
    let Golf = Color("golf")
    
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
}

struct LaunchTheme {
    
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
    
}


