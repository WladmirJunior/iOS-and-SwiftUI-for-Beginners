//
//  Game.swift
//  Bullseye
//
//  Created by Wladmir  on 23/05/21.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(testData: Bool = false) {
        if testData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 89, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 70, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 120, date: Date()))
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let diff = abs(sliderValue - target)
        switch diff {
        case 0:
            return 200 
        case 1...2:
            return 100 - diff + 50
        default:
            return 100 - diff
        }
    }
        
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(points: points)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
    mutating func addToLeaderboard(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
}
