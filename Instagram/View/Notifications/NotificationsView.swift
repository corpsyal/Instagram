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
        List(notificationViewModel.notifications)  { notification in
            NotificationCell(notificationCellViewModel: NotificationCellViewModel(notification: notification))
                .listRowSeparator(.hidden)
        }
        .padding(.top)
        .listStyle(PlainListStyle())
        .refreshable {
            notificationViewModel.fetchNotifications()
        }
        
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
