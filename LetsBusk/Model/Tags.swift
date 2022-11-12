//
//  Tag.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import Foundation
import SwiftUI

enum Tags: String, CaseIterable, Hashable {
    case Jazz = "Jazz"
    case Classical = "Classical"
    case Magic = "Magic"
    case Vocal = "Vocal"
    case Painting = "Painting"
    case Hiphop = "Hiphop"
    case Saxophone = "Saxophone"
    case Caricature = "Caricature"
    case Acrobatics = "Acrobatics"
    case Piano = "Piano"
    case StandupComedy = "Standup"
    case SlamPoetry = "Slam Poetry"
    case Opera = "Opera"
    case BreakDancing = "Break Dancing"
    case Violin = "Violin"
    
    var color: Color {
        var col: Color
        switch self {
        case .Jazz:
            col = Color.orange.opacity(0.5)
        case .Classical:
            col = Color.orange.opacity(0.5)
        case .Magic:
            col = Color.orange.opacity(0.5)
        case .Vocal:
            col = Color.orange.opacity(0.5)
        case .Painting:
            col = Color.orange.opacity(0.5)
        case .Hiphop:
            col = Color.orange.opacity(0.5)
        case .Saxophone:
            col = Color.orange.opacity(0.5)
        case .Caricature:
            col = Color.orange.opacity(0.5)
        case .Acrobatics:
            col = Color.orange.opacity(0.5)
        case .Piano:
            col = Color.orange.opacity(0.5)
        case .StandupComedy:
            col = Color.orange.opacity(0.5)
        case .SlamPoetry:
            col = Color.orange.opacity(0.5)
        case .Opera:
            col = Color.orange.opacity(0.5)
        case .BreakDancing:
            col = Color.orange.opacity(0.5)
        case .Violin:
            col = Color.orange.opacity(0.5)
        }
        
        return col
    }
        
       
}

func nestedTags(maxCol: Int) -> [[Tags]] {
    var nested: [[Tags]] = [[]]
    var count: Int = 0
    var currRow = 0;
    let allTags =  Tags.allCases
    for tag in allTags {
        nested[currRow].append(tag)
        count += 1
        if (count/maxCol > currRow && count != allTags.count) {
            currRow += 1
            nested.append([])
        }
        
    }
    
    return nested
}

func tagMap() -> [Tags : Bool] {
    var tagDic: [Tags : Bool] = [:]
    for tag in Tags.allCases {
        tagDic[Tags(rawValue: tag.rawValue)!] = false
    }
    return tagDic
}

