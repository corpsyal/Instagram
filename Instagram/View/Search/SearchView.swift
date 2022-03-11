//
//  SearchView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct SearchView: View {
    @State var searText = ""
    @State var isSearchMode = false
    
    var body: some View {
        VStack {
            SearchBar(text: $searText, isEditing: $isSearchMode)
                .padding()

            ScrollView(showsIndicators: false) {

                if (isSearchMode){
                    UserListView()
                } else {
                    PostGridView()
                }
                                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
