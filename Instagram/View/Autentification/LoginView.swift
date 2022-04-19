//
//  LoginView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 18.03.22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = "toto@test.fr"
    @State private var password = "password"
    @EnvironmentObject private var auth: AuthViewModel
    
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
                    
                    CustomTextField(text: $password, placeHolder: Text("Password"), imageName: "lock", isSecureField: true)
                        .padding()
                        .background(Color.init(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Forgot password ?")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .semibold))
                        }

                    }
                    
                    Button {
                        auth.login(email: email, password: password)
                    } label: {
                        Text("Login")
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(.purple)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }

                    
                    
                    Spacer()
                    
                    NavigationLink(destination: RegistrationView().navigationBarHidden(true)) {
                        HStack(spacing: 2) {
                            Text("Don't have an account?")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                            Text(" Sign up")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }.padding(.bottom, 32)

                }
                .padding(.horizontal, 32)
                .padding(.top, 20)
            }.navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
