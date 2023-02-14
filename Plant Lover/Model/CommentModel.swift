//
//  CommentModel.swift
//  Plant Lover
//
//  Created by Jiali Han on 1/31/23.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable, Hashable {
    
    var id = UUID()
    var commentID: String // ID  for the comment in the Database
    var userID: String // ID for  the user in the Database
    var username: String  // username for the user in the Database
    var content: String // comment text
    var dateCreated: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
