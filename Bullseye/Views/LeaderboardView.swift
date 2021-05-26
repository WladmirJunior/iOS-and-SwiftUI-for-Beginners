//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Wladmir  on 25/05/21.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderBoardIsShowing: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices) { i in
                            let leadboardEntry = game.leaderboardEntries[i]
                            RowView(index: i, score: leadboardEntry.score, date: leadboardEntry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundTextView(index: String(1))
            Spacer()
            ScoreText(score: 10)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: Date())
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Binding var leaderBoardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "Leaderboard")
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    leaderBoardIsShowing = false
                }) {
                    RoundImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }.padding(.top)
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    private static let leaderBoardIsShowing = Binding.constant(false)
    private static let game = Binding.constant(Game(testData: true))
    
    static var previews: some View {
        LeaderboardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
        LeaderboardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .preferredColorScheme(.dark)
        LeaderboardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game).previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game).previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
