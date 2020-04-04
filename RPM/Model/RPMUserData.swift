//
//  RPMUserData.swift
//  RPM
//
//  Created by Alessandro Giaquinto on 23/02/2020.
//  Copyright © 2020 Alessandro Giaquinto. All rights reserved.
//

import Foundation

// Most tutorial suggest to use a wrapper class for access data in UserDefaults. This create more problem with EnvironmentObject and @State.
// The idea born with tutorial see in this video: https://www.youtube.com/watch?v=B-FvaF8cMqQ where a @State private variable store value directly from UserDefaults
// It's a C - like solution... more comfortable for me

let (IDKey, heightKey, weightKey, referenceGyKey, radiusKey, sequenceWelcomeView, goalKey) = ("ID", "height", "weight", "referenceGy", "radius", "sequence", "goal")

func _test() { // Because of persistence, this is intend to launch in SceneDelegate, then delete when app is ready
    setUserID(ID: "Name Surname")
    setUserWeight(weight: 0.0)
    setUserHeight(height: 0)
    setReferenceGy(reference: 7)
    setRadius(radius: 0)
    setGoal(value: "Grimpeur")
    UserDefaults.standard.set(true, forKey: sequenceWelcomeView)
}

func _print() {
    print("Initial value of UserDefaults")
    print("User ID: \(getUserID())")
    print("User height: \(getUserHeight())")
    print("User weight: \(getUserWeight())")
    print("Reference Gy: \(getReferenceGy())")
    print("Radius: \(getRadius())")
    print("Show WelcomeView? \(showSequenceWelcomeView())")
    print("Goal: \(getGoal())")
}

func getUserID() -> String {
    return UserDefaults.standard.string(forKey: IDKey) ?? "Name Surname"
}

func setUserID(ID: String) {
    UserDefaults.standard.set(ID, forKey: IDKey)
}

func getUserHeight() -> Int {
    return UserDefaults.standard.integer(forKey: heightKey)
}

func setUserHeight(height: Int) {
    UserDefaults.standard.set(height, forKey: heightKey)
}

func getUserWeight() -> Double {
    return UserDefaults.standard.double(forKey: weightKey)
}

func setUserWeight(weight: Double) {
    UserDefaults.standard.set(weight, forKey: weightKey)
}

func getReferenceGy() -> Int {
    return UserDefaults.standard.integer(forKey: referenceGyKey)
}

func setReferenceGy(reference: Int) {
    UserDefaults.standard.set(reference, forKey: referenceGyKey)
}

func getRadius() -> Int {
    return UserDefaults.standard.integer(forKey: radiusKey)
}

func setRadius(radius: Int) {
    UserDefaults.standard.set(radius, forKey: radiusKey)
}

func showSequenceWelcomeView() -> Bool {
    return UserDefaults.standard.bool(forKey: sequenceWelcomeView)
}

func setSequenceWelcomeView() {
    UserDefaults.standard.set(false, forKey: sequenceWelcomeView)
}

func getGoal() -> String {
    return UserDefaults.standard.string(forKey: goalKey) ?? "Cronoman"
}

func setGoal(value: String) {
    UserDefaults.standard.set(value, forKey: goalKey)
}
