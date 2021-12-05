//
//  User-Serialization.swift
//  SwiftyCamp
//
//  Created by Ali Fayed on 04/12/2021.
//  Copyright © 2021 Ali Fayed.
//

import UIKit

extension User {
    /// The UserDefaults key where the real user is stored.
    fileprivate static var liveKeyName: String { return "User" }

    /// The UserDefaults key where the test user is stored so we don't break the live user when running tests.
    fileprivate static var testKeyName: String { return "TestUser" }

    /// Loads a user from UserDefaults, or returns nil if there was none.
    static func load(testMode: Bool = false) -> User? {
        let keyName: String

        if testMode == true {
            keyName = testKeyName
        } else {
            keyName = liveKeyName
        }

        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: keyName) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            if let decodedUser = try? decoder.decode(User.self, from: data) {
                return decodedUser
            }
        }

        return nil
    }

    /// Saves a user to user defaults.
    func save(testMode: Bool = false) {
        let keyName: String

        if testMode == true {
            keyName = User.testKeyName
        } else {
            keyName = User.liveKeyName
        }

        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601

        if let encodedUser = try? encoder.encode(self) {
            defaults.set(encodedUser, forKey: keyName)
        } else {
            print("Failed to save user.")
        }
    }

    /// Destroys any existing user so we can be sure we have a blank slate when testing.
    static func destroyTestUser() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: testKeyName)
    }
}
