//
//  Player.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import Foundation
import SwiftData

@Model
class Player {
    var nickname: String
    var avatar: String?
    var surname: String?
    var name: String?
    var gender: Gender
    
    init(nickname: String, avatar: String?, surname: String? = nil, name: String? = nil, gender: Gender) {
        self.nickname = nickname
        self.avatar = avatar
        self.surname = surname
        self.name = name
        self.gender = gender
    }
}

enum Gender: String, Codable {
    case male
    case female
}
