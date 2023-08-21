//
//  LoglistViewModel.swift
//  GradoorateUpdate
//
//  Created by Nibras Fitri Zuhra on 20/08/23.
//

import Foundation
import SwiftUI

extension LoglistView {
    class ViewModel: ObservableObject {
        //MARK: FUNCTION FORMATDATE
        func formatDate(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, dd MMM" // Set the desired date format
            
            return dateFormatter.string(from: date)
        }
        
        //MARK: Function Feeling
        func performFeeling(feeling: Int) -> String {
            switch feeling {
            case 1:
                return "☺️"
            case 2:
                return "😐"
            default:
                return "🤯"
            }
        }
        
        //MARK: Function Significant
        func performSign(sign: Bool) -> String {
            switch sign {
            case true:
                return "GreenOne"
            default:
                return "RedOne"
            }
        }
        
        //MARK: DATA BADGES
        func badgeData(with item: Int) -> String {
            let myBadges = ["image1", "image2", "image3", "image4", "image5", "image6"]
            return myBadges[item-1]
        }
        
        //MARK: Color Badges
        func colorData(with item: Int) -> String {
            let myColor = ["OrangeOne", "RedOne", "GreenOne", "BlueOne", "OrangeOne", "YellowOne"]
            return myColor[item-1]
        }
        func colorData2(with item: Int) -> String {
            let myColor = ["OrangeTwo", "RedTwo", "GreenTwo", "BlueTwo", "OrangeTwo", "YellowTwo"]
            return myColor[item-1]
        }
        
        //MARK: Title Badges
        func titleBadges(with item: Int) -> String {
            let title = ["I Conquer the 1st Milestone!", "I Conquer the 2nd Milestone!", "I Conquer the 3rd Milestone!", "I Conquer the 4th Milestone!", "I Conquer the Last Milestone!", "I Conquer All Milestone!"]
            return title[item-1]
        }
        
        //MARK: Caption Badges
        func captionBadges (with item: Int) -> String {
            let captionBadge = [
                "Proud of myself for taking first step into the door of long chaotic process.",
                "Working till night is not a big deal! I can manage it just like a cat.",
                "Thanks to caffeine so I can manage this step! Take a note and don’t take it too much!",
                "Wow! To be honest, Chapter 4 really drain your brain and soul. Hang in there just wait for awhile!",
                "Finally I won’t feel haunted by the pressure of final research project anymore! Graduation, I’m coming!",
                "Like a rainbow or sunny day after storm, I have unveiled greatest things after those hardship!"
            ]
            return captionBadge[item-1]
        }
        
        //MARK: Text Badges
        func textBadges (with item: Int) -> String {
            let textBadge = [
                "A closed door can be intimidating because you don’t know what’s inside. But look now! Wow! you are brave to open it!",
                "Cats are nocturnal animal that will be most active  at night and rest more during the day.  From them, we can also manage our time as best we can, do everything while we still can.",
                "Making one cup of coffee is a ritual that should be cherished and just as anything you do everyday should. Caring for the process and the result of will be something you can be proud of.",
                "The brain has no knowledge until connections are made between neurons. Your project will have no progress until executions are made between your intentions.",
                "Ghost is oftenly said to appear in the eerie zone where time collapses and our past memories haunts our minds. Just like it, don’t make the unfinished project as past memories that will always haunt you.",
                "Sun has yellow colour, a powerful colour, that exudes joy in passionate bursts of energy. This color acts as a sprinting color. It runs full force toward self gratification, productivity, and physical or emotional gains."
            ]
            return textBadge[item-1]
        }
        
        //MARK: Subject Badges
        func subjectBadges(with item: Int) -> String {
            let subject = ["door", "cat", "coffee", "brain", "ghost", "sun"]
            return subject[item-1]
        }
        
        //MARK: Alert Badges
        func alertBadges()-> Alert{
            Alert(title: Text("Lock"), message: Text("the badges are still locked"), dismissButton: .default(Text("OK")))
        }
    }
}


