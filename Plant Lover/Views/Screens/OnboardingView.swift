//
//  OnboardingView.swift
//  Plant Lovers
//
//  Created by Jiali Han on 2/2/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showOnBoardingPart2: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(radius: 2)
            
            Text("Welcome to Plant Lovers!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.DarkGreen)
                .shadow(radius: 2)
            
            Text("<Plant Lovers> is the #1 app for posting plant pictures around you and sharing them across the world. This is a community for plant lovers and we are so happy to have you here!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.DarkGreen)
                .padding()
            
            // Button for apple sign in
            Button(action: {
                showOnBoardingPart2.toggle()
            }, label: {
                SignInWithAppleButtonCustom()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            })
            // Button for google sign in
            Button(action: {
                showOnBoardingPart2.toggle()
            }, label: {
                HStack {
                    
                    Image(systemName: "globe")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .accentColor(.black)
                    
                    Text("Sign in with Google")
                        .accentColor(.black)
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.white)
// Google Red   .background(Color(.sRGB, red: 222/255, green: 82/255, blue: 70/255, opacity: 1.0))
                .cornerRadius(6)
                .font(.system(size: 23, weight: .medium, design: .default))
            })
            .accentColor(Color.white)
            
            // Button for
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Continue as guest".uppercased())
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
            })
            .accentColor(.black)
        }
        .padding(.all, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.YellowGreen)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showOnBoardingPart2, content: {
            OnboardingViewPart2()
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
