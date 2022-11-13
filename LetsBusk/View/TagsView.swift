//
//  TagsView.swift
//  LetsBusk
//
//  Created by Abdulaziz Albahar on 11/12/22.
//

import SwiftUI

struct TagsView: View {
    @State var allTags: [[Tags]] = nestedTags(maxCol: 3)
    @State var mappedTags = tagMap()
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        VStack {
            ScrollView() {
                    
                ForEach(allTags, id: \.self) { row in
                    
                    HStack {
                        
                        ForEach(row, id: \.self) { tag in
                            Button(action:{
                                
                                mappedTags[tag.rawValue]!.toggle()
                                
                                userVM.artist?.setTags(tags: mappedTags)
                                
                            }) {
                                
                                Text(tag.rawValue).foregroundColor(.white).padding(.horizontal).frame(minWidth: 90, minHeight: 38, alignment: .center).background(tag.color).clipShape(Capsule()).border(Color.orange, width: mappedTags[tag.rawValue] ?? false ? 3 : 0, cornerRadius: 20)
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
        TagsView().environmentObject(UserViewModel())
    }
}
