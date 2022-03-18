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
