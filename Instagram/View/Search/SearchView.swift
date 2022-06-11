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
    @StateObject var searchViewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            SearchBar(text: $searText, isEditing: $isSearchMode)
                .padding()

            ScrollView(showsIndicators: false) {
                if (isSearchMode){
                    UserListView(users: searchViewModel.filterUsers(query: searText))
                } else {
                    PostGridView(config: .explore)
                }
                                
            }
        }.modifier(DefaultNavigationBar())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
