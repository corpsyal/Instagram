//
//  ImagePicker.swift
//  Instagram
//
//  Created by Anthony Lahlah on 13.03.22.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

    @Binding var image: ImageFromPicker?
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker){
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            guard let url = info[.imageURL] as? URL else { return }
//            image.acce = url.pathExtension
            parent.image = ImageFromPicker(name: url.lastPathComponent, pathExtension: url.pathExtension, uiImage: image)
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    
}
