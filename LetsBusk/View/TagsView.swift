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
                                withAnimation {
                                    
                                }
                            }) {
                                Text(tag.rawValue).frame(minWidth: 90, minHeight: 30, alignment: .center).padding(.leading).padding(.trailing).clipShape(Capsule()).background(tag.color).cornerRadius(10).padding(2)
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
