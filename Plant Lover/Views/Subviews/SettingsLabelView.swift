//
//  SettingsLabelView.swift
//  Plant Lover
//
//  Created by Jiali Han on 2/2/23.
//

import SwiftUI

struct SettingsLabelView: View {
    
    var labelText: String
    var labelImage: String
    
    var body: some View {
        VStack {
            HStack {
                
                Text(labelText)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: labelImage)
            }
            
            Divider()
                .padding(.vertical, 4)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Test Label", labelImage: "heart")
            .previewLayout(.sizeThatFits)
    }
}
