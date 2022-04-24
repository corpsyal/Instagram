//
//  Extensions.swift
//  Instagram
//
//  Created by Anthony Lahlah on 11.03.22.
//

import UIKit
import SwiftUI
import Kingfisher

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension Image {
    func profileImageModifier(width: CGFloat, height: CGFloat) -> some View {
        return self
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(Circle())
            .clipped()
    }
}

extension KFImage {
    func profileImageModifier(width: CGFloat, height: CGFloat) -> some View {
        return self
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(Circle())
            .clipped()
    }
}


func printDate(string: String) {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss.SSSS"
//    print(string + formatter.string(from: date))
    print("\(string) \(formatter.string(from: date))")
}
