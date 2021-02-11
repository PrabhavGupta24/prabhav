//
//  ContentView.swift
//  prabhav
//
//  Created by 90309089 on 2/3/21.
//

import SwiftUI

struct ContentView: View {
    
    private let koreanFinal = ["Click on any one of the buttons below to begin", "Dobok", "Dee", "Cha-Ryot", "Kyong Ye", "Sabum-Nim Kae Kyong Ye", "Hana", "Dul", "Set", "Net", "Dasot", "Yusot", "Ilgop", "Yodul", "Ahope", "Yul", "Ap Chagi", "Dol Yo Chagi", "Kam Sahm Needa", "Dojang", "Poomse", "Joonbi", "Suhn-Bae Nim Kae Kyong Ye", "Kukiae Dae Hiyo Kyong Ye", "Up Goobi", "Yop Chagi", "Chun Mahn Aeyo", "Baro", "Sheer", "Gyoroogi", "Dwee Goobi", "Choo Choom Sogi", "Anyong Ha Shim Neeka", "Bangap Seumnida", "Sheejak", "Keumahn", "Ilsushik", "Kyukpa", "Momtong Maki", "Arrae Maki", "Olgool Maki", "Shil Ray Hamnida", "Me Ahn Hamnida", "Dweero Dora", "Bal Kyo Dae", "Ho Shin Sool", "Joonbi Woondong", "Olgool Jilugi", "Momtong Jilugi", "Ahnyonghee Ka Ship Sheeyo", "Ahnyonghee Kay Ship Sheeyo", "You have practiced all of the terms. Your final score is shown above. Click on any one of the buttons below to start over."]
    
    private let englishFinal = ["Click here to begin", "Uniform", "Belt", "Attention", "Bow", "Bow to the Master", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Front Snap Kick", "Roundhouse Kick", "Thank You", "School", "Form", "Ready", "Bow to the Instructor", "Bow to the Flags", "Forward Stance", "Side Kick", "You're Welcome", "Return (to Relax)", "At Ease", "Sparring", "Back Stance", "Horse Riding Stance", "Hello", "Good to see you", "Start", "Finish", "One-Step Sparring", "Breaking", "Body Block", "Down Block", "Face Block", "Excuse Me", "I'm Sorry", "Turn Around", "Switch Feet", "Self-Defense", "Warmup Exercise", "Face Punch", "Middle Punch", "Goodbye (leaving)", "Goodbye (staying)", "Click here to start over."]
    
    
    @State private var termNum = 0
    @State private var buttonNum = 0
    @State private var button1 = 0
    @State private var button2 = 0
    @State private var button3 = 0
    @State private var button4 = 0
    @State private var response = ""
    @State private var first = true
    @State private var score = 0
    @State private var totalNum = 0
    @State private var scoreRead = "0"
    @State private var responseColor = Color .green
    @State private var korean = ["Click on any one of the buttons below to begin"]
    @State private var english = ["Click here to begin"]
    @State private var termNum2 = 0
    
    
    var body: some View {
        VStack {
            Text("Score: " + scoreRead)
                .padding().border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                
            
            
            Text(response)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(responseColor)
                .multilineTextAlignment(.center)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
            
            
            Text(korean[termNum])
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
            
            
            //Button 1
            Button(englishFinal[button1]) {
                buttonMain(a: 1)
                
            }.font(.title2).foregroundColor(Color .white).padding() .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1).background(Color .blue)
            
            
            
            //Button 2
            Button(englishFinal[button2]) {
                buttonMain(a: 2)
            }.font(.title2).foregroundColor(Color .white) .padding() .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1) .background(Color .blue)
            
            
            
            //Button3
            Button(englishFinal[button3]) {
                buttonMain(a: 3)
            }.font(.title2).foregroundColor(Color .white) .padding() .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1) .background(Color .blue)
            
            
            
            
            //Button4
            Button(englishFinal[button4]) {
                buttonMain(a: 4)
            }.font(.title2).foregroundColor(Color .white) .padding() .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1) .background(Color .blue)
            
            
            Spacer()
            
        }
    }
    

    private func buttonMain(a:Int){
        if(first){
            first = false
            korean = Array(koreanFinal[1...(koreanFinal.count-1)])
            english = Array(englishFinal[1...(englishFinal.count-1)])
            score = 0
            totalNum = 0
            scoreRead = String(score) + " out of " + String(totalNum)
            
        }
        else{
            //AFTER FIRST
            totalNum += 1
            if(buttonNum == a){
                responseColor = Color .green
                response = "Correct!"
                score += 1
            }
            else{
                responseColor = Color .red
                response = "Incorrect! \n \"" + String(korean[termNum]) + "\" means \"" + String(english[termNum]) + "\""
            }
            scoreRead = String(score) + " out of " + String(totalNum)
            
            korean.remove(at: termNum)
            english.remove(at: termNum)
            
        }
        
        
        
        
        if(korean.count == 1){
            termNum = 0
            buttonNum = 0
            button1 = englishFinal.count-1
            button2 = englishFinal.count-1
            button3 = englishFinal.count-1
            button4 = englishFinal.count-1
            response = ""
            first = true
            termNum2 = 0
        }
        else{
            //Always
            termNum = Int.random(in: 0...(korean.count-2))
            buttonNum = Int.random(in: 1...4)
            
            termNum2 = englishFinal.firstIndex(of: String(english[termNum]))!
           
            button1 = Int.random(in: 1...(englishFinal.count-2))
            while(button1 == termNum2){
                button1 = Int.random(in: 1...(englishFinal.count-2))
            }
            
            button2 = Int.random(in: 1...(englishFinal.count-2))
            while(button2 == button1) || (button2 == termNum2){
                button2 = Int.random(in: 1...(englishFinal.count-2))
            }
            
            button3 = Int.random(in: 1...(englishFinal.count-2))
            while(button3 == button1) || (button3 == button2) || (button3 == termNum2){
                button3 = Int.random(in: 1...(englishFinal.count-2))
            }
            
            button4 = Int.random(in: 1...(englishFinal.count-2))
            while(button4 == button1) || (button4 == button2) || (button4 == button3) || (button4 == termNum2){
                button4 = Int.random(in: 1...(englishFinal.count-2))
            }
            
            
            
            if buttonNum == 1 {
                button1 = termNum2
            }
            else if buttonNum == 2 {
                button2 = termNum2
            }
            else if buttonNum == 3 {
                button3 = termNum2
            }
            else {
                button4 = termNum2
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
