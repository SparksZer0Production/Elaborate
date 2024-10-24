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
        
        ZStack{
            
            VStack {
                AngularGradient(colors: [.red, .teal, .blue, .indigo, .red], center: .center)
            }
            .edgesIgnoringSafeArea(.all)
        
            VStack {

                
                Text("Elaborate").font(.system(size: 75)).padding(.bottom).fontDesign(.serif)
                Text("Log In").font(.largeTitle).foregroundStyle(Color.black)
                
                
                //Username and Password Fields
                HStack{
                    Image(systemName: "person.fill")
                    TextField("Input Text", text: $viewModel.inpUsername).border(Color.blue).padding(5)
                }.textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack{
                    Image(systemName: "lock.fill")
                    TextField("Input Text", text: $viewModel.inpPassword).border(Color.blue).padding(5)
                }.textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    print(viewModel.inpUsername)
                    print(viewModel.inpPassword)
                } label: {
                    
                    Image(systemName: "hand.tap").foregroundStyle(.white)
                    Text("Submit").foregroundStyle(.white)
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .buttonBorderShape(.roundedRectangle)
                .padding(10)
                
                
                Button {
                    //THIS NEEDS TO GO TO ACCOUNT CREATION
                    print("Sending you to Account Creation Page")
                } label: {
                    Image(systemName: "pencil")
                    Text("Create Account")
                }

            }
            .padding(10)
            .background(.white)
            .border(.white, width: 5)
            .cornerRadius(20)
            


        }
    }
}

struct HomeViewPrivew: PreviewProvider {
    static var previews: some View{
        HomeView()
    }
}
