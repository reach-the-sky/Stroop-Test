//
//  Experiment.swift
//  HCI
//
//  Created by Kotni Krishna Chaitanya on 20/01/21.
//

import SwiftUI

struct Experiment1: View {
    @State var text_set = ["Red","Orange","Blue","Gray","White","Green"]
    @State var color_set = [Color.red,Color.orange,Color.blue,Color.gray,Color.white,Color.green]
    @State var text_index = 1
    @State var text_color_index = 1
    @State var box_index = [0,1,2,3,4,5]
    @State var score_right: Int = 0
    @State var score_wrong: Int = 0
    @State private var progress = 0.0
    @State var total_score = 10
    var level: Int
    @State var hint = false
    @State var result = false
    @State var change = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var countdown_time = 0
    @State var show_time_temp = true
    @State var show_result_temp = false
    @State var countdown_freeze = true
    var ContentView_object: ContentView
    var body: some View {
    if show_time_temp
        {
        Timer321(experiment1_object: self,experiment2_object: Experiment2(level: self.level,ContentView_object: ContentView()))
        }
    else if (!show_time_temp && show_result_temp)
    {
        ResultView(score: self.score_right, total_score: self.total_score,experiment1_object: self,experiment2_object: Experiment2(level: 2,ContentView_object: ContentView()))
    }
    else
        {
        VStack{
            Spacer()
            HStack {
                Button(action: {
                    self.hint.toggle()
                    
                }, label: {
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/.opacity(0.6))
                        .padding()
                })

                Spacer()
                if(change)
                {
                Text(text_set[self.text_index])
                    .foregroundColor(color_set[self.text_color_index])
                    .font(.largeTitle)
                    .bold()
                    .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.vertical)
                    .padding(.top,60)
                    .shadow(color: Color.black.opacity(0.1),radius: 5)
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .scale))
                    .animation(.default)
                }
                else{
                    Text(text_set[self.text_index])
                        .foregroundColor(color_set[self.text_color_index])
                        .font(.largeTitle)
                        .bold()
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.vertical)
                        .padding(.top,60)
                        .shadow(color: Color.black.opacity(0.1),radius: 5)
                        .transition(.asymmetric(insertion: .move(edge: .top), removal: .scale))
                        .animation(.default)
                }
                Spacer()
                Spacer()
                
                
                
            }
            
            if(hint){
                Text("Select the color of the text(↑) from the options, Not the word.")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
                
            Spacer()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.change(self.box_index[0])
                    }, label: {
                        Capsule()
                            .frame(width: 120, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(color_set[self.box_index[0]])
                    })
                    .shadow(radius: 3)
                    
                    Spacer()
                    
                    Button(action: {
                        self.change(self.box_index[1])
                    }, label: {
                        Capsule().frame(width: 120, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(color_set[self.box_index[1]])
                    })
                    
                    Spacer()
                }
                .shadow(radius: 3)
                
                Spacer()
                
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.change(self.box_index[2])
                    }, label: {
                        Capsule().frame(width: 120, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(color_set[self.box_index[2]])
                    })
                    .shadow(radius: 3)
                    
                    Spacer()
                    
                    Button(action: {
                        self.change(self.box_index[3])
                    }, label: {
                        Capsule().frame(width: 120, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(color_set[self.box_index[3]])
                    })
                    .shadow(radius: 3)

                    Spacer()
                }
                Spacer()
                if(self.level == 3)
                {
                    HStack{
                        Spacer()
                        
                        Button(action: {
                            self.change(self.box_index[4])
                        }, label: {
                            Capsule().frame(width: 120, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(color_set[self.box_index[4]])
                        })
                        .shadow(radius: 3)
                        
                        Spacer()
                        
                        Button(action: {
                            self.change(self.box_index[5])
                        }, label: {
                            Capsule().frame(width: 120, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(color_set[self.box_index[5]])
                        })
                        .shadow(radius: 3)

                        Spacer()
                    }
                }
                Spacer()
                HStack {
                    Text("Score: " + String(self.score_right))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding()
                    
                    Text("Wrong: " + String(self.score_wrong))
                        .font(.title)
                        .foregroundColor(.red)
                        .opacity(1)
                    
                }
                    Spacer()
                
//                Button(action: {}) {
//                    Text("")
//                }
//                .alert(isPresented: $result){
//                    Alert(title: Text("Result"), message: Text("Your Score: \(self.score_right)/\(self.total_score) \nTime taken: \(self.countdown_time)"), dismissButton: .cancel(Text("Close"), action: {
//                        ContentView_object.experiment1_score = self.score_right
//                        ContentView_object.experiment1_time = self.countdown_time
//
//                        print(ContentView_object.experiment1_score)
//                        self.score_right = 0
//                        self.score_wrong = 0
//                        self.show_time_temp = true
//                        self.countdown_time = 0
//                        self.countdown_freeze = true
//                        self.progress = 0.0
//                        self.text_index = Int.random(in: 0...3)
//                        self.text_color_index = self.text_index
//                        ContentView_object.selected_tab = 2
//                    }))
//                }
            }
            ProgressView(value: progress)
                .padding(.bottom)
                
        }
        .background(Image("pinkBackground").resizable())
        .ignoresSafeArea(.container, edges: .top)
        .onReceive(timer, perform: { _ in
            if self.countdown_freeze && ContentView_object.selected_tab == 1
            {
                self.countdown_time += 1
            }
        })
    }
        
}
    
    
    func final(){
        ContentView_object.experiment1_score = self.score_right
        ContentView_object.experiment1_time = self.countdown_time
        
        print(ContentView_object.experiment1_score)
        self.score_right = 0
        self.score_wrong = 0
        self.total_score = 10
        self.show_time_temp = true
        self.countdown_time = 0
        self.countdown_freeze = true
        self.progress = 0.0
        self.text_index = Int.random(in: 0...3)
        self.text_color_index = self.text_index
        ContentView_object.selected_tab = 2
    }
    
    func change(_ user_option: Int){
        if(user_option == self.text_color_index)
        {
            self.score_right += 1
        }
        else{
            self.score_wrong += 1
        }
        if(self.level == 3)
        {
            self.progress += 0.05
            let text_index_temp = self.text_index
            while(self.text_index == text_index_temp)
            {
            self.text_index = Int.random(in: 0..<self.text_set.count)
            }
            self.text_color_index = self.text_index
        }
        else if(self.level == 2)
        {
            self.progress += 0.05
            let text_index_temp = self.text_index
            while(self.text_index == text_index_temp)
            {
                self.text_index = Int.random(in: 0...3)
            }
            self.text_color_index = self.text_index
        }
        else
        {
            self.progress += 0.1
            let text_index_temp = self.text_index
            while(self.text_index == text_index_temp)
            {
                self.text_index = Int.random(in: 0...3)
            }
            self.text_color_index = self.text_index
        }
        
        if(score_right + score_wrong >= 10 && self.level == 1)
        {
            self.countdown_freeze = false
            self.result.toggle()
            self.show_result_temp.toggle()
        }
        else if(score_right + score_wrong >= 20 && self.level >= 2){
            self.countdown_freeze = false
            self.total_score = 20
            self.result.toggle()
            self.show_result_temp.toggle()
        }
        else{
            withAnimation(.easeIn)
            {
                self.change.toggle()
            }
        }
        
    }
}


struct Experiment1_Previews: PreviewProvider {
    static var previews: some View {
        Experiment1(level: 2, ContentView_object: ContentView())
    }
}
