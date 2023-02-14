//
//  SignUpView.swift
//  Plant Lover
//
//  Created by Jiali Han on 2/2/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State var showOnBoarding: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            
            Spacer()
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            
            Text("You're not signed in! 🙁")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.MyTheme.DarkGreen)
            
            Text("Click the button below to create an account and join the fun! 😉")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.DarkGreen)
            
            Button(action: {
                showOnBoarding.toggle()
            }, label: {
                Text("Sign in / Sign up".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.MyTheme.DarkGreen)
                    .cornerRadius(12)
                    .shadow(radius: 12)
            })
            .accentColor(Color.MyTheme.YellowGreen)
            
            Spacer()
            Spacer()
        })
        .padding(.all, 40)
        .background(Color.MyTheme.YellowGreen)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showOnBoarding, content: {
          OnboardingView()
        })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .preferredColorScheme(.dark)
    }
}
