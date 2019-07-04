//
//  Sentiment.swift
//  PersonalAssistant
//
//  Created by Amanda Tavares on 03/07/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import UIKit

enum Sentiment {
    case neutral
    case positive
    case negative
    
    var emoji: String {
        switch self {
        case .neutral:
            return "😐"
        case .positive:
            return "😃"
        case .negative:
            return "😔"
        }
    }
    
    var message: String {
        switch self {
        case .neutral:
            return "It seems like you had a long day today! Do you want to do something or do you want to rest?"
        case .positive:
            return "It looks like you had a wonderful day today! It would be great to remember that in the future. \(self.emoji)"
        case .negative:
            return "Looks like you did not have a really good day today. \(self.emoji) I'm here for you. What can we do about it?"
        }
    }
    
    var color: UIColor? {
        switch self {
        case .neutral:
            return UIColor.systemBlue
        case .positive:
            return UIColor.systemGreen
        case .negative:
            return UIColor.systemRed
        }
    }
}

