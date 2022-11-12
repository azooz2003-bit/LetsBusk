//
//  TagsView.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import SwiftUI

struct TagsView: View {
    var allTags: [[Tags]] = nestedTags(maxCol: 3)
    var addedTags: [Tags : Bool] = tagMap()
    
    var body: some View {
        VStack {
            ScrollView() {
                
                ForEach(allTags, id: \.self) { row in
                    
                    HStack {
                        
                        ForEach(row, id: \.self) { tag in
                            
                            Button(action:{
                                
                            }) {
                                Text(tag.rawValue).frame(minWidth: 90, minHeight: 38, alignment: .center).padding(.horizontal).background(tag.color).clipShape(Capsule()).cornerRadius(10).padding(1).foregroundColor(.white)
                            }
                            
                        }
                    }
                    
                }


            }
        }
    }
    
    
    
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView()
    }
}
