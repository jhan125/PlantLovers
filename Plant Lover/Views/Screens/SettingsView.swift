//
//  SettingsView.swift
//  Plant Lover
//
//  Created by Jiali Han on 2/2/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                
                //  MARK: SECTION 1 APP
                GroupBox(label: SettingsLabelView(labelText: "Plant Lovers", labelImage: "dot.radiowaves.left.and.right"), content: {
                    // add logo and text
                    HStack(alignment: .center, spacing: 10, content: {
                        
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(12)
                        
                        Text("<Plant Lovers> is the #1 app for posting plant pictures around you and sharing them across the world. This is a community for plant lovers and we are so happy to have you here!")
                            .font(.footnote)
                    })
                })
                .padding()
                
                // MARK: SECTION 2 PROFILE
                GroupBox(label: SettingsLabelView(labelText: "Profile", labelImage: "person.fill"), content: {
                    
                    NavigationLink(
                        destination: SettingsEditTextView(submissionText: "Current Display name", title: "Display name", description: "You can edit your display name here. This will be seen by other users on your profile and your posts!", placeholder: "Your display name here..."),
                        label: {
                            SettingsRowView(leftIcon: "pencil", text: "Display Name", color: Color.MyTheme.Green)
                        })
                    
                    NavigationLink (
                        destination: SettingsEditTextView(submissionText: "Current Bio here", title: "Profile Bio", description: "You can edit your bio here. This will be a great place to let other users know a little bit about you! It will be shown on your profile only.", placeholder: "Your bio here..."),
                        label: {
                            SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.MyTheme.Green)
                            
                        })
                        
                        
                    NavigationLink(
                        destination: SettingsEditImageView(title: "Profile Picture", description: "You can edit your profile picture here. It will be shown on your profile and on your post. Most users make it an image of themselves instead of plants!", selectedImage: UIImage(named: "plant1")!),
                        label: {
                            SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.MyTheme.Green)
                        })

                    
                    SettingsRowView(leftIcon: "figure.walk", text: "Sign out", color: Color.MyTheme.Green)
                })
                .padding()
                
                // MARK: SECTION 3 APPLICATION
                GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "app.iphone"), content: {
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.google.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.DarkGreen)
                    })
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.yahoo.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Terms & Conditions", color: Color.MyTheme.DarkGreen)
                    })
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.bing.com")
                    }, label: {
                        SettingsRowView(leftIcon: "globe", text: "Plant Lovers' Website", color: Color.MyTheme.DarkGreen)
                    })
                   
                })
                .padding()
                
                //  MARK: SECTION 4 SIGN OFF
                GroupBox {
                    Text("Plant Lovers was made with love. \nAll Rights Reserved \nJiali's Apps Inc. \n© Copyright 2023 ♥️")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .padding(.bottom, 80)
                
            })
            .navigationBarTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title)
                    })
                    .accentColor(.primary)
            )
        }
        .accentColor(colorScheme == .light ? Color.MyTheme.DarkGreen : Color.MyTheme.YellowGreen)
    }
    
    // MARK: FUNCTIONS
    
    func openCustomURL(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}