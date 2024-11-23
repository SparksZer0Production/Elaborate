//
//  NewPhotoView.swift
//  Elaborate
//
//  Created by Samuel Faucher on 11/22/24.
//

import SwiftUI
import Photos

struct NewPhotoView: View {
    var body: some View {
        ZStack{
            AngularGradient(colors: [.red, .teal, .blue, .indigo, .purple, .red], center: .center).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                HStack{
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.backward.circle").foregroundStyle(.white)
                        Text("Back").foregroundStyle(.white)
                    }.font(.system(size: 30))
                    Spacer()
                }
                ZStack{
                    Color.white.clipShape(RoundedRectangle(cornerRadius: 20)).padding(.bottom)
                    VStack{
                        Image(systemName: "photo.circle.fill").foregroundStyle(.black).font(.system(size: 80)).padding()
                        Text("Generate a Photo").fontDesign(.monospaced).font(.system(size: 25))
                    }
                }
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "photo")
                            .foregroundStyle(.white)
                        Text("Generate")
                            .foregroundStyle(.white)
                            .fontDesign(.monospaced)
                    }
                    .padding(10)
                }
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.orange, Color.red]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                )
                .foregroundColor(.white)
                .shadow(radius: 10)

            }
            .padding(20)
            .padding(.bottom, 150)
            Spacer()
        }

    }
}

#Preview {
    NewPhotoView()
}
