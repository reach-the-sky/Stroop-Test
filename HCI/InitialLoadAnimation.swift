//
//  InitialLoadAnimation.swift
//  HCI
//
//  Created by Kotni Krishna Chaitanya on 05/02/21.
//

import SwiftUI

struct InitialLoadAnimation: View {
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    @State var name_1: String = ""
    @State var name_2: String = ""
    @Binding var show: Bool
    @State var name_index_1 = 1
    @State var name_index_2 = 0
    var name_list_1 = ["","S","t","r","o","o","p"]
    var name_list_2 = ["E","f","f","e","c","t","","",""]
    var body: some View {
        VStack {
            Text(name_1)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            Text(name_2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        }
        .font(.system(size: 80))
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .opacity(0.8)
        .background(Image("pinkBackground").resizable().ignoresSafeArea())
        .animation(.easeInOut(duration: 0.35))
        .onReceive(timer,perform: {_ in
            if name_index_1 < name_list_1.count{
                name_1 += name_list_1[name_index_1]
                name_index_1 += 1
            }
            else if name_index_2 < name_list_2.count{
                name_2 += name_list_2[name_index_2]
                name_index_2 += 1
            }
            else{
                self.show = false
            }
    })
    }
    
}

struct InitialLoadAnimation_Previews: PreviewProvider {
    static var previews: some View {
        InitialLoadAnimation(show: Binding.constant(true))
    }
}
