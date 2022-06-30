//
//  NotificationsView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 06.03.22.
//

import SwiftUI

struct NotificationsView: View {
    @StateObject var notificationViewModel = NotificationViewModel()
    
    var body: some View {
        List(notificationViewModel.notifications)  {_ in
            NotificationCell()
                .listRowSeparator(.hidden)
        }
        .padding(.top)
        .listStyle(PlainListStyle())
        .refreshable {
            notificationViewModel.fetchNotifications()
        }.modifier(DefaultNavigationBar())
        
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
