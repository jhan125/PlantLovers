//
//  PostArrayObject.swift
//  Plant Lover
//
//  Created by Jiali Han on 1/31/23.
//

import Foundation
class PostArrayObject: ObservableObject {
    
    @Published var dataArray = [PostModel] ()
    
    init() {
        
        print("FETCH FROM DATABASE HERE")
        
        let post1 = PostModel(postID: "", userID: "", username: "Dandelion Lover", caption: "I have lost my smile, but don’t worry. The dandelion has it.",dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post2 = PostModel(postID: "", userID: "", username: "Leaf Lover", caption: nil,dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post3 = PostModel(postID: "", userID: "", username: "Lavender Lover", caption: nil,dateCreated: Date(), likeCount: 0, likedByUser: false)
        let post4 = PostModel(postID: "", userID: "", username: "Peach Blossom", caption: "A kind word is like a peach blossom.",dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }
    
    // USED FOR SINGLE POST SELECTION
    init(post: PostModel) {
        self.dataArray.append(post)
    }
    
}
