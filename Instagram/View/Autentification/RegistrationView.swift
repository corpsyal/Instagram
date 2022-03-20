//
//  RegistrationView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 20.03.22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.presentationMode) private var mode
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack(spacing: 20) {
                    Image("Instagram_logo")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $email, placeHolder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color.init(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $username, placeHolder: Text("Username"), imageName: "envelope")
                        .padding()
                        .background(Color.init(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $fullName, placeHolder: Text("Fullname"), imageName: "envelope")
                        .padding()
                        .background(Color.init(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $password, placeHolder: Text("Password"), imageName: "lock", isSecureField: true)
                        .padding()
                        .background(Color.init(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                
                    
                    Button {
                        
                    } label: {
                        Text("Sign up")
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(.purple)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }

                    
                    
                    Spacer()
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        HStack(spacing: 2) {
                            Text("Already have an account?")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                            Text(" Sign in")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }
                    .padding(.bottom, 32)

                }
                .padding(.horizontal, 32)
                .padding(.top, -50)
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
