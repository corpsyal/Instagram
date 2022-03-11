//
//  UserCell.swift
//  Instagram
//
//  Created by Anthony Lahlah on 08.03.22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("joker")
                .resizable()
                .frame(width: 48, height: 48)
                .scaledToFit()
                .clipShape(Circle())
                .clipped()
            
            VStack(alignment: .leading) {
                Text("Joker")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Toto")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
