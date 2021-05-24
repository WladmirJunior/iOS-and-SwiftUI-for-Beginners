//
//  ContentView.swift
//  Bullseye
//
//  Created by Wladmir  on 23/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN")
                .bold()
                .kerning(2.0)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
            Text(String(game.target))
                .font(.largeTitle)
                .fontWeight(.black)
                .kerning(-1.0)
            HStack {
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            .padding()
            Button(action: {
                alertIsVisible.toggle()
            }) {
                Text("Hit me".uppercased())
                    .bold()
                    .font(.title3)
            }
            .padding(20.0)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(21.0)
            .alert(isPresented: $alertIsVisible, content: {
                let roundedValue = Int(sliderValue.rounded())
                
                return Alert(title: Text("Hello There!"),
                             message: Text("The slider's values is \(roundedValue).\n" +
                                            "You scored \(game.points(sliderValue: roundedValue)) points this round."),
                             dismissButton: .default(Text("Awesome!")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
