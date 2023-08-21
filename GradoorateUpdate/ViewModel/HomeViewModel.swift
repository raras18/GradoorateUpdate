//
//  HomeView+Logic.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 16/08/23.
//

import Foundation
import CoreData
import SwiftUI

//MARK: Function Convert Deadline
func deadline(from items: FetchedResults<Milestones>, at index: Int) -> String {
    var dateFormat: String = ""
    
    if items.indices.contains(index) {
        let date = items[index].deadline
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM" // Set the desired date format
        dateFormat = formatter.string(from: date!)
    } else {
        dateFormat = "No Date"
    }
    
    return dateFormat
}

//MARK: STRUCT FOR LOGIC HOME
struct logicHome{
    
    //MARK: Function Lock
    static func lock1(with items: FetchedResults<Milestones>) -> Bool{
        var logic: Bool = true
        if (Date() > items[0].deadline ?? Date() || items[0].badgeArray.count > 0) {
                logic = false
            } else {
                logic = true
            }
        return logic
    }
    
    static func lock2(with items: FetchedResults<Milestones>) -> Bool{
        var logic: Bool = true
        if (Date() > items[1].deadline ?? Date() || items[1].badgeArray.count > 0) {
                logic = false
            } else {
                logic = true
            }
        return logic
    }
    
    static func lock3(with items: FetchedResults<Milestones>) -> Bool{
        var logic: Bool = true
        if (Date() > items[2].deadline ?? Date() || items[2].badgeArray.count > 0) {
                logic = false
            } else {
                logic = true
            }
        return logic
    }
    
    static func lock4(with items: FetchedResults<Milestones>) -> Bool{
        var logic: Bool = true
        if (Date() > items[3].deadline ?? Date() || items[3].badgeArray.count > 0) {
                logic = false
            } else {
                logic = true
            }
        return logic
    }
    
    static func lock5(with items: FetchedResults<Milestones>) -> Bool{
        var logic: Bool = true
        if !items[0].badgeArray.isEmpty && !items[1].badgeArray.isEmpty && !items[2].badgeArray.isEmpty && !items[3].badgeArray.isEmpty && !items[4].badgeArray.isEmpty
        {
            logic = false
        }
        else
        {
            logic = true
        }
        
        return logic
    }
}

