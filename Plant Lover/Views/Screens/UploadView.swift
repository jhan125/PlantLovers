//
//  UploadView.swift
//  Plant Lover
//
//  Created by Jiali Han on 1/31/23.
//

import SwiftUI
import UIKit

struct UploadView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var showImagePicker: Bool = false
    @State var ImageSelected: UIImage = UIImage(named: "logo")!
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    @State var showPostImageView: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                
                Button(action: {
                    sourceType = UIImagePickerController.SourceType.camera
                    showImagePicker.toggle()
                }, label: {
                    Text("take photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.YellowGreen)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.MyTheme.DarkGreen)
                
                Button(action: {
                    sourceType = UIImagePickerController.SourceType.photoLibrary
                    showImagePicker.toggle()
                }, label: {
                    Text("import photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.DarkGreen)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.MyTheme.YellowGreen)
            }
            .sheet(isPresented: $showImagePicker, onDismiss: segueToPostImageView, content: {
                ImagePicker(imageSelected: $ImageSelected, sourceType: $sourceType)
                    .preferredColorScheme(colorScheme)
            })
            
            Image("logo.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(radius: 12)
                .fullScreenCover(isPresented: $showPostImageView, content: {
                    PostImageView(imageSelected: $ImageSelected)
                        .preferredColorScheme(colorScheme)
                        .accentColor(colorScheme == .light ? Color.MyTheme.DarkGreen : Color.MyTheme.YellowGreen)
                })
        }
        .edgesIgnoringSafeArea(.top)
    }
                   
    // MARK: FUNCTIONS
    func segueToPostImageView() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showPostImageView.toggle()
        }
        
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
            .preferredColorScheme(.dark)
    }
}
