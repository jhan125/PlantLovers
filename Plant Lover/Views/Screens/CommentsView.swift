//
//  CommentsView.swift
//  Plant Lover
//
//  Created by Jiali Han on 1/31/23.
//

import SwiftUI

struct CommentsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State  var submissionText: String = ""
    @State var commentArray = [CommentModel]()
    
    var body: some View {
        VStack {
            
            ScrollView {
                LazyVStack{
                    ForEach(commentArray, id: \.self) { comment in MessageView(comment: comment)
                    }
                }
            }
            
            HStack {
                
                Image("plant4")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                TextField("Add a comment here...", text: $submissionText)
                
                Button(action : {
                    
                }, label: {
                    Image(systemName:  "paperplane.fill")
                        .font(.title2)
                })
                .accentColor(colorScheme == .light ? Color.MyTheme.DarkGreen : Color.MyTheme.YellowGreen)
            }
            .padding(.all, 6)
        }
        .padding(.horizontal)
        .navigationBarTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            getComments()
        })
    }
    
    //  MARK: FUNCTIONS
    
    func getComments(){
        
        print("GET COMMENTS FROM DATABASE")
        
        let comment1 = CommentModel(commentID: "", userID: "", username: "Plant Lover", content: "This is the 1st comment", dateCreated: Date())
        
        let comment2 = CommentModel(commentID: "", userID: "", username: "Lavender Lover", content: "This is the 2nd comment", dateCreated: Date())
        
        let comment3 = CommentModel(commentID: "", userID: "", username: "Dandelion Lover", content: "This is the 3rd comment", dateCreated: Date())
        
        let comment4 = CommentModel(commentID: "", userID: "", username: "Leaf Lover", content: "This is the 4th comment", dateCreated: Date())
        
        self.commentArray.append(comment1)
        self.commentArray.append(comment2)
        self.commentArray.append(comment3)
        self.commentArray.append(comment4)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView()
        }
    }
}
