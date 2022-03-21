//
//  NotificationsView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(0..<5) {_ in 
                    NotificationCell()
                }
            }
            .padding(.top)
            .padding(.horizontal, 16)
        }.modifier(DefaultNavigationBar())
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
