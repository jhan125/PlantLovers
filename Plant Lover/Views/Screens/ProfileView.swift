//
//  ProfileView.swift
//  Plant Lover
//
//  Created by Jiali Han on 2/1/23.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var isMyProfile: Bool
    @State var profileDisplayName: String // can be changed
    var profileUserID: String // cannot change
    
    var posts = PostArrayObject()
    
    @State var showSettings: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ProfileHeaderView(profileDisplayName: $profileDisplayName)
            Divider()
            ImageGridView(posts: posts)
        })
        .navigationBarTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                Button(action: {
                    showSettings.toggle()
                }, label: {
                    Image(systemName: "line.horizontal.3")
                })
                    .accentColor(colorScheme == .light ? Color.MyTheme.DarkGreen : Color.MyTheme.YellowGreen)
                .opacity(isMyProfile ? 1.0 : 0.0)
        )
        .sheet(isPresented: $showSettings, content: {
            SettingsView()
                .preferredColorScheme(colorScheme)
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(isMyProfile: true, profileDisplayName: "Angel", profileUserID: "")
                .preferredColorScheme(.light)
        }
    }
}
