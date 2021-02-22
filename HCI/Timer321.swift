//
//  Timer321.swift
//  HCI
//
//  Created by Kotni Krishna Chaitanya on 26/01/21.
//
 
 import SwiftUI

 struct Timer321: View {
     @State var show_time: Double = 3
     @State var show_time_string: String = "3"
     let timer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()
     @State var countdown_freeze = true
     var experiment1_object: Experiment1
     var experiment2_object: Experiment2
     var body: some View {
         VStack {
             Spacer()
             Spacer()
             Text("Select the color of the word from the options, if \"RED\" is written in blue click on blue option.")
                 .font(.title3)
                 .bold()
                 .padding()
                 .padding()
                 .offset(x: 0, y: 80)
                 .multilineTextAlignment(.center)
             
             Spacer()
             ZStack{
                 GeometryReader{geo in
                     Path{
                         path in
                         path.move(to: CGPoint(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY))
                         path.addArc(center: .init(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY),radius: 125, startAngle: Angle(degrees: Double(show_time * 90)), endAngle: Angle(degrees: -90.0), clockwise: true)
                     }
                     .fill(Color.blue)
                     Circle()
                         .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                         .foregroundColor(Color.green)
                     Text(self.show_time_string)
                         .font(.largeTitle)
                         .fontWeight(.semibold)
                         .foregroundColor(Color.white)
                         .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                         

                 }
 //                Circle()
 //                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
 //                    .foregroundColor(Color.green)
 //                Text(self.show_time_string)
 //                    .font(.largeTitle)
 //                    .fontWeight(.semibold)
 //                    .foregroundColor(Color.white)
             }
 //            .frame(width: 100, height: 100, alignment: .center)
             Spacer()
             Spacer()
         }
         .animation(.default)
         .ignoresSafeArea()
         .background(Image("pinkBackground").resizable().ignoresSafeArea())
 //        .ignoresSafeArea()
         .onReceive(timer, perform: { _ in
         if self.countdown_freeze
         {
             self.show_time -= 0.001
             if(self.show_time > 0.0)
             {
                 self.show_time_string = String(Int(show_time))
             }
             else if(self.show_time > -1.0)
             {
                 self.show_time_string = "Go"
                 
             }
             else{
                 self.countdown_freeze = false
                 self.experiment1_object.show_time_temp = false
                 self.experiment2_object.show_time_temp = false
             }
         }
     })
     }
     
     
 }

 //
 //var Timer_background: some View  {
 //        Path{
 //            path in
 //            path.move(to: CGPoint(x: 215, y: 335))
 ////            path.addArc(center: .init(),radius: 125, startAngle: Angle(degrees: 270.0), endAngle: Angle(degrees: -90.0), clockwise: true)
 //            path.addArc(center: .init(x: 215,y: 335),radius: 125, startAngle: Angle(degrees: 270.0), endAngle: Angle(degrees: -90.0), clockwise: true)
 //        }
 //        .fill(Color.blue)
 ////        .alignmentGuide(HorizontalAlignment.center) { d in d[.leading] }
 ////        .alignmentGuide(VerticalAlignment.center) { d in d[.leading] }
 ////        .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
 //    }


 struct Timer321_Previews: PreviewProvider {
     static var previews: some View {
         
         Timer321(experiment1_object: Experiment1(level: 2,ContentView_object: ContentView()),
                  experiment2_object: Experiment2(level: 2,ContentView_object: ContentView()))
         
     }
 }
 
