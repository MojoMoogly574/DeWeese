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
    let HIIT = Color("hiitOrange")
    let Strength = Color("strengthBlue")
    let Cardio = Color("cardioRed")
    let Power = Color("powerGreen")
    let Grappling = Color("grapplingOlive")
    let Boxing = Color("boxingYellow")
    let Stretch = Color("stretchPurple")
    let Recover = Color("recoverGreen")
    let Yoga = Color("yogaFusia")
    let Run = Color("runPink")
    let Walk = Color("walkLime")
    let MMA = Color("mmaSalmon")
    let Sport = Color("sportBrown")
    let Golf = Color("golfSky")
}

struct LaunchTheme {
    
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
    
}


