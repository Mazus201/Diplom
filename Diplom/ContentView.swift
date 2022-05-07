//
//  ContentView.swift
//  Diplom
//
//  Created by Никита Мазус on 10.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    @State var loginAgree = false
    @State private var agreeLogin = false
    
    var body: some View {
        NavigationView{
            
            GeometryReader{ _ in
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(width: 130, height: 70)
                    
                    ZStack{
                        Signup(index: self.$index)
                            .zIndex(Double(self.index))
                        Login(index: self.$index, loginAgree: self.$loginAgree)
                    }
                    
                    HStack(spacing: 15) {
                        Rectangle()
                            .fill(Color("newGreen"))
                            .frame(height: 1)
                        
                        Text("ОR")
                            .foregroundColor(.white)
                        
                        Rectangle()
                            .fill(Color("newGreen"))
                            .frame(height: 1)
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 50)
                    
                    HStack{
                        Button(action: {
                            agreeLogin.toggle()
                        })
                        {
                            Image("apple")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .colorInvert()
                        }
                        
                        Button(action: {
                            //
                        })
                        {
                            Image("twitter")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .colorInvert()
                        }
                        Button(action: {
                            //
                        })
                        {
                            Image("facebook")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .colorInvert()
                        }
                    }
                    .padding(.top, 30)
                    
                    //                NavigationLink("", isActive: $agreeLogin) {
                    //                    menuPage()
                    //                }
                    //                .opacity(0)
                    
                    
                    Spacer()
                }
                .padding(.vertical)
            }
            .background(Color("Gray"))
            .edgesIgnoringSafeArea(.all)
//            .preferredColorScheme(.dark)
        }
    }
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0 ))
        }
    }
}

struct CShape1: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0 ))
        }
    }
}


struct Login : View {
    @State var email = ""
    @State var pass = ""
    @Binding var index : Int
    @Binding var loginAgree : Bool
    @State private var showAlert = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer()
                    
                }
                .padding(.top, 30)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("newGreen"))
                        
                        TextField("Email Address", text: self.$email)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    
                    Divider()
                        .background(
                            .white
                            .opacity(0.5)
                        )
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("newGreen"))
                        
                        SecureField("Password", text: self.$pass)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack{
                    Spacer()
                    
                    Button(action: {
                        //
                    })
                    {
                        Text("Forget password")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65.0)
            .background(Color("lightGray"))
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20.0)
            
            Button(action: {
                if email.isEmpty || pass.isEmpty {
                    showAlert = true
                }
                else {
                    self.loginAgree.toggle()
                }
            })
            {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("newGreen"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 35)
            .opacity(self.index == 0 ? 1 : 0)
            .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Вы не ввели логин или пароль")
                    )
                }
            
            NavigationLink(destination: menuPage().navigationBarHidden(true), isActive: $loginAgree){
                withAnimation {
                    menuPage()
                }
            }
            .navigationBarBackButtonHidden(true)
            .opacity(0)
            .frame(width: 1, height: 1)
        }
    }
}

struct Signup: View {
    @State var email = ""
    @State var pass = ""
    @State var rePass = ""
    @Binding var index : Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack{
                HStack{
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10){
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("newGreen"))
                        
                        TextField("Email Address", text: self.$email)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    
                    Divider()
                        .background(Color.white
                            .opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("newGreen"))
                        SecureField("Password", text: self.$pass)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    Divider()
                        .background(Color.white
                            .opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("newGreen"))
                        SecureField("Password", text: self.$rePass)
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("lightGray"))
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action: {
                //
            })
            {
                Text("SignUp")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("newGreen"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: -5)
            }
            .offset(y: 35)
            .opacity(self.index == 1 ? 1 : 0)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
