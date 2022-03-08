//
//  SearchView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct SearchView: View {
    @State var searText = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            SearchBar(text: $searText)
                .padding()
            
            PostGridView()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
