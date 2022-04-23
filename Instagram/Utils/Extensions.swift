//
//  Extensions.swift
//  Instagram
//
//  Created by Anthony Lahlah on 11.03.22.
//

import UIKit

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


func printDate(string: String) {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss.SSSS"
//    print(string + formatter.string(from: date))
    print("\(string) \(formatter.string(from: date))")
}
