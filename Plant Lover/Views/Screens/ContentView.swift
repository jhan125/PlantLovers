//
//  ContentView.swift
//  Plant Lover
//
//  Created by Jiali Han on 1/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var currentUserID: String? = nil //if not signed in then nil
    
    var body: some View {
        TabView{
            NavigationView {
                FeedView(posts: PostArrayObject(), title: "FEED")
            }
                .tabItem{
                    Image(systemName: "book.fill")
                    Text("Feed")
                }
            
            NavigationView {
                BrowseView()
            }
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Browse")
                }
            
//            NavigationView {
                UploadView()
                    .tabItem{
                        Image(systemName: "square.and.arrow.up.fill")
                        Text("Upload")
                    }
//            }
                
            
            ZStack { // avoid app crash
                if currentUserID != nil {
                    NavigationView {
                        ProfileView(isMyProfile: true, profileDisplayName: "My Profile", profileUserID: "")
                    }
                } else {
                    SignUpView()
                }
            }
            
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(colorScheme == .light ? Color.MyTheme.DarkGreen : Color.MyTheme.YellowGreen)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
