//
//  ContentView.swift
//  Bull's Eyes SwiftUI
//
//  Created by PARDIEU Timothé on 27/02/2020.
//  Copyright © 2020 PARDIEU Timothé. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible = false
    @State private var sliderValue: Double = 50
    @State private var a: Int = 2
    @State private var roundValue: Int = 1
    @State private var targetValue: Int = Int.random(in: 1...100)
    @State private var totalScore: Int = 0
    @State private var isFirstRound: Bool = false
    
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View{
            content
                .font(Font.custom("Arial Rounded MT Bold", size: 21))
                .foregroundColor(.white)
        }
    }
    
    struct LabelStyleYellow: ViewModifier {
        func body(content: Content) -> some View{
            content
                .font(Font.custom("Arial Rounded MT Bold", size: 26))
                .foregroundColor(.yellow)
        }
    }
    
    struct HitMeButtonStyle: ViewModifier {
        func body(content: Content) -> some View{
            content
                .background(Image("Button"))
                .shadow(radius: 3)
                .foregroundColor(.black)
                .frame(minWidth: 15, maxWidth: .infinity)
        }
    }
    
    
    func pointsForCurrentRound()  -> Int {
        let score = 100 - abs(sliderValueRounded() - targetValue)
        if (score == 100) {
            return score + 100
        }
        if (score == 99) {
            return score + 50
        }
        return score
    }
    
    func sliderValueRounded() -> Int{
        return Int(self.sliderValue.rounded())
    }
    
    func newRound(){
        self.totalScore += pointsForCurrentRound()
        if (isFirstRound){
            self.isFirstRound = false
            self.roundValue = 0
            self.totalScore = 0
        }
        self.roundValue += 1
        self.targetValue = Int.random(in: 1...100)
        self.sliderValue = 50

    }
    
    
    func scoreTitle() -> String {
        let score = 100 - abs(sliderValueRounded() - targetValue)
        switch score {
            case 100:
                return "Perfect"
            case 99:
                return "Almost perfect"
            case _ where score > 80 :
                return "Great"
            case _ where score > 50 :
                return "Good"
            case _ where score > 30 :
                return "Not so bad"
            case _ where score >= 10 :
                return "Uhmm"
            case _ where score < 10 :
                return "Looser"
            default: return "Well done"
        }
    }
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Target : ").modifier(LabelStyle())
                    Text("\(targetValue)" ).modifier(LabelStyleYellow())
                }
            }.padding(.top, 35)
            
            Spacer()
            
            VStack{
                HStack{
                    Text("1").modifier(LabelStyle())
                    Slider(value: self.$sliderValue, in: 1...100, step: 1).accentColor(.white)
                    Text("100").modifier(LabelStyle())
                }
            }
            
            Spacer()
            
            VStack{
                HStack{
                    Button("Hit me !", action: {
                        self.alertIsVisible = true
                    }).alert(isPresented: $alertIsVisible) {
                        return Alert(
                            title: Text("\(self.scoreTitle())"),
                            message: Text("""
                                Hit : \(self.sliderValueRounded())
                                Score : \(self.pointsForCurrentRound())
                            """),
                            dismissButton: .default(Text("OK"), action: {
                                self.newRound()
                            })
                        )
                    }.modifier(HitMeButtonStyle())
                }
            }
            
            Spacer()
            
            
            VStack{
                HStack{
                    Button(action: {
                        self.isFirstRound = true
                        self.newRound()
                    }){
                        HStack{
                            Image("StartOverIcon")
                        }
                    }.modifier(HitMeButtonStyle())
                    
                    Spacer()
                    
                    Text("Score : ").modifier(LabelStyle())
                    Text("\(totalScore)").modifier(LabelStyleYellow())
                    
                    Spacer()
                    
                    Text("Round").modifier(LabelStyle())
                    Text("\(roundValue)").modifier(LabelStyleYellow())
                    
                    Spacer()
                    
                    NavigationLink(destination: AboutView()){
                        HStack{
                            Image("InfoIcon")
                        }
                    }.modifier(HitMeButtonStyle())
                }
            }.padding(.bottom)
        }
        .background(Image("Background"), alignment: .center)
        .navigationBarTitle("Bullseye")
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))//<= iphone 11 Max Pro )
        
    }
}


