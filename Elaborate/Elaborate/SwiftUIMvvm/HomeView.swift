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
                AngularGradient(colors: [.red, .teal, .blue, .indigo, .purple, .red], center: .center)
            }
            .edgesIgnoringSafeArea(.all)
        
            VStack {

                
                Text("Elaborate").font(.system(size: 75)).padding(.bottom).fontDesign(.serif)
                Text("Log In").font(.largeTitle).foregroundStyle(Color.black).fontDesign(.monospaced)
                
                //Username and Password Fields
                HStack{
                    Image(systemName: "person.fill")
                    TextField("Username", text: $viewModel.inpUsername).border(Color.blue).padding(5).fontDesign(.monospaced)
                }.textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal)
                
                HStack{
                    Image(systemName: "lock.fill")
                    TextField("Password", text: $viewModel.inpPassword).border(Color.blue).padding(5).fontDesign(.monospaced)
                }.textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal)
                
                Button {
                    print(viewModel.inpUsername)
                    print(viewModel.inpPassword)
                } label: {
                    
                    Image(systemName: "hand.tap").foregroundStyle(.white)
                    Text("Submit").foregroundStyle(.white).fontDesign(.monospaced)
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .buttonBorderShape(.roundedRectangle)
                .padding(10)
                
                
                Button {
                    //THIS NEEDS TO GO TO ACCOUNT CREATION
                    print("Sending you to Account Creation Page")
                    viewModel.sheetVis.toggle()
                    
                } label: {
                    Image(systemName: "pencil")
                    Text("Create Account").fontDesign(.monospaced)
                }
                /// Present a sheet once `shouldPresentSheet` becomes `true`.
                .sheet(isPresented: $viewModel.sheetVis) {
                    print("Sheet dismissed!")
                } content: {
                    CreateAccountView(viewModel: viewModel)
                }

            }
            .padding(10)
            .background(.white)
            .border(.white, width: 5)
            .cornerRadius(20)
            


        }
    }
}

struct CreateAccountView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                Button("", systemImage: "xmark") {
                    viewModel.sheetVis = false
                }
                .presentationDetents([.fraction(0.8)])
                .padding(25)
                .font(.largeTitle)
            }
            //Spacer()
            
            
            Text("Create Account").font(.largeTitle).fontDesign(.monospaced)
            
            HStack{
                Image(systemName: "person.fill")
                TextField("Username", text: $viewModel.createUser).border(Color.blue).padding(5).fontDesign(.monospaced)
            }.textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal)
            
            HStack{
                Image(systemName: "lock.fill")
                TextField("Password", text: $viewModel.createPass).border(Color.blue).padding(5).fontDesign(.monospaced)
            }.textFieldStyle(RoundedBorderTextFieldStyle()).padding(.horizontal)
            
            Button {
                print(viewModel.createUser)
                print(viewModel.createPass)
            } label: {
                
                Image(systemName: "hand.tap").foregroundStyle(.white)
                Text("Submit").foregroundStyle(.white)
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .buttonBorderShape(.roundedRectangle)
            .padding(10)
            Spacer()
        }
    }
    
}

struct HomeViewPrivew: PreviewProvider {
    static var previews: some View{
        HomeView()
    }
}
