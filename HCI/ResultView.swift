//
//  ResultView.swift
//  HCI
//
//  Created by Kotni Krishna Chaitanya on 15/02/21.
//

import SwiftUI

struct ResultView: View {
    let score: Int
    let total_score: Int
    var experiment1_object: Experiment1
    var experiment2_object: Experiment2
    var body: some View {
        VStack{
            Image("resultImage1")
                .resizable()
                .aspectRatio(contentMode: .fill)
            Text("You scored")
                .font(.system(size: 50))
                .bold()
            Text("\(score)/\(total_score)")
                .font(.system(size: 40))
                .bold()
                .multilineTextAlignment(.center)
            Spacer()
            Button(action: {
                experiment1_object.final()
                experiment1_object.show_result_temp.toggle()
                experiment2_object.final()
                experiment2_object.show_result_temp.toggle()
            }, label: {
                Text("Continue")
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
            })
            .padding()
            .clipShape(Rectangle())
            .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.green)
            .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 3))
            .cornerRadius(10)
            .padding()
            .padding(.bottom,50)
            .shadow(radius: 6)
            
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(score: 10, total_score: 10, experiment1_object: Experiment1(level: 2,ContentView_object: ContentView()),
                   experiment2_object: Experiment2(level: 2,ContentView_object: ContentView()))
    }
}
