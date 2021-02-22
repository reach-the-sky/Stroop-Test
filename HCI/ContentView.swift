//
//  ContentView.swift
//  HCI
//
//  Created by Kotni Krishna Chaitanya on 20/01/21.
//

import SwiftUI

struct ContentView: View {
    init() {
           //Use this if NavigationBarTitle is with Large Font
//           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        
//        UINavigationBar.appearance().backgroundColor = UIColor.systemPink
           //Use this if NavigationBarTitle is with displayMode = .inline
        
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.blue]
        
        
        // this is not the same as manipulating the proxy directly
                let appearance = UINavigationBarAppearance()
                
                // this overrides everything you have set up earlier.
                appearance.configureWithTransparentBackground()
                
                // this only applies to big titles
                appearance.largeTitleTextAttributes = [
                    
                    NSAttributedString.Key.foregroundColor : UIColor.black
                ]
                // this only applies to small titles
                appearance.titleTextAttributes = [
                    
                    NSAttributedString.Key.foregroundColor : UIColor.black
                ]
                
//                appearance.backgroundColor = UIColor.systemPink
            appearance.backgroundImage = UIImage(named: "pinkBackground")
                //In the following two lines you make sure that you apply the style for good
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
                UINavigationBar.appearance().standardAppearance = appearance
                
                // This property is not present on the UINavigationBarAppearance
                // object for some reason and you have to leave it til the end
//                UINavigationBar.appearance().tintColor = .white
        
        
       }
    
    @State var selected_tab = 0
    @State var show_initial_screen = true
    let numTabs = 3
    let minDragTranslationForSwipe: CGFloat = 50
    @State var experiment1_score = 0
    @State var experiment2_score = 0
    @State var experiment1_time = 0
    @State var experiment2_time = 0
    @State var level = 2
    var body: some View {
        if(show_initial_screen){
            InitialLoadAnimation(show: $show_initial_screen)
        }
        
        else {
            TabView(selection: $selected_tab)
            {
                NavigationView{
                    
                    ScrollView {
                        
                        VStack(alignment: .leading){
                            Text("Stroop Effect: ")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                                .padding([.horizontal,.top])
                            
                        
                        Text(Content.definition)
                            .padding(.horizontal)
                            .padding(.top,8)
                        
                        
                        Image("colors2")
                            .resizable()
                            .padding()
                            
                        }
                        
                        
                        

                        VStack {
                            
                            Picker(selection: $level,label: Text("Level")) {
                                Text("Level: 1").tag(1)
                                Text("Level: 2").tag(2)
                                Text("Level: 3").tag(3)
                            }
    //                        .padding(.horizontal,60)
                            
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 165, height: 65, alignment: .center)
                                    .foregroundColor(.blue)
                                    .cornerRadius(10)
                                    .padding()
                                    .padding(.bottom,50)
                                
                                Button(action: {
                                    self.selected_tab = 1
                                }, label: {
                                    Text("Stroop Test")
                                        .fontWeight(.black)
                                        .foregroundColor(Color.white)
                                })
                                .padding()
                                .clipShape(Rectangle())
                                .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color.green)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 1))
                                .cornerRadius(10)
                                .padding()
                                .padding(.bottom,50)
                                
                            }
                            .shadow(radius: 6)
                            
                        }
                        
                        
                        Text("Why?")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            Text(Content.why)
                                .padding()
                            
                            Text(Content.a)
                                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                                .bold()
                                .padding(.vertical)
                            Text(Content.b)
                                .padding(.horizontal)
                            
                            Text(Content.c)
                                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                                .bold()
                                .padding(.vertical)
                            Text(Content.d)
                                .padding(.horizontal)
                        .accessibilityLabel(Text("Why").bold())
                        .padding()
                        
                        
                        HStack{
                            Spacer()
                            VStack{

                                Text("Experiment - 1")
                                    .bold()
                                    .padding(.bottom,7)
                                Text("Score \(experiment1_score)")
                                    .fontWeight(.medium)
                                Text("Time: \(experiment1_time)")
                                    .fontWeight(.medium)
                            }
                            .font(.title3)
                            
                            Spacer()
                            VStack{

                                Text("Experiment - 2")
                                    .bold()
                                    .padding(.bottom,7)
                                Text("Score \(experiment2_score)")
                                    .fontWeight(.medium)
                                    
                                Text("Time: \(experiment2_time)")
                                    .fontWeight(.medium)
                            }
                            .font(.title3)
                            Spacer()
                        }
                        .padding(.top)
                        .padding(.top)
                        .padding(.bottom)
                    }
                    .navigationBarTitle("NeuroScience")
                    .background(Image("pinkBackground").resizable())
                    .animation(.default)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationViewStyle(StackNavigationViewStyle())
                
                }
                .animation(.default)
                .tabItem { Image(systemName: "homekit")
                    Text("Home") }.tag(0)
                
                Experiment1(level: self.level, ContentView_object: self).tabItem {
                    Image(systemName: "doc.plaintext")
                    Text("Experiment1") }.tag(1)

                
                
                Experiment2(level: self.level, ContentView_object: self).tabItem {
                    Image(systemName: "doc.plaintext")
                    Text("Experiment2") }.tag(2)
            }
        }
        
        
        
    }
    private func handleSwipe(translation: CGFloat) {
        if translation > minDragTranslationForSwipe && selected_tab > 0 {
            selected_tab -= 1
        } else  if translation < -minDragTranslationForSwipe && selected_tab < numTabs-1 {
            selected_tab += 1
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        NavigationView{
        ContentView()
            .previewLayout(PreviewLayout.fixed(width: 428, height: 1500))
        ContentView()
        //    }
        //    .previewLayout(.sizeThatFits)
        //        TabView {
        //            NavigationView{
        //            ContentView()
        //            }.tabItem { Text("Home") }.tag(1)
        //            Text("Tab Content 2").tabItem { Text("Experiment") }.tag(2)
        //        }
        
    }
}
