//
//  Questions.swift
//  Crosstable
//
//  Created by Atin Agnihotri on 10/06/21.
//

import SwiftUI

struct Questions {
    var a: Int
    var b: Int
    
    func getQuestionHeader() -> String {
        return "\(a) into \(b) is?"
    }
    
    func getQuestionLabel() -> String {
        return "\(a) X \(b) = "
    }
    
    func getAnswer() -> String {
        return String(a*b)
    }
}


