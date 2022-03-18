//
//  ProfileUserStatView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 12.03.22.
//

import SwiftUI

struct ProfileUserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
            
            Text(title)
                .font(.system(size: 14))
        }
        .frame( alignment: .center)
//        .background(Color.yellow)
    }
}

struct ProfileUserStatView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUserStatView(value: 280, title: "Followers")
    }
}
