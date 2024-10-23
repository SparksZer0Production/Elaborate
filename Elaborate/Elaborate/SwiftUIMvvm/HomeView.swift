//
//  HomeView.swift
//  Elaborate
//
//  Created by Sam Cross on 10/22/24.
//

import SwiftUICore
import SwiftUICore
import SwiftUI

struct HomeView: View{
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View{
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(viewModel.homeModel.welcomeText)
            
            HStack{
                Button(action:{
                    viewModel.buttonPressed()
                }){
                    Text("Inrease Counter")
                }
                Text("Counter:\(viewModel.counter)")
            }
            
        }
        .padding()
    }
}

struct HomeViewPrivew: PreviewProvider {
    static var previews: some View{
        HomeView()
    }
}
