//
//  Model.swift
//  Secure Notes
//
//  Created by David on 11/5/23.
//

import UIKit

class Note {
    let name: String
    var note: String
    
    init(name: String, note: String) {
        self.name = name
        self.note = note
    }
    
    static let Notes = [
        
        Note(
            name: "Note1",
            note: "This is note1"),
        Note(
            name: "Note2",
            note: "This is note2"),
        Note(
            name: "Note3",
            note: "This is note3"),
        Note(
            name: "Note4",
            note: "This is note4")
    ]
}
