//
//  menuPage.swift
//  Diplom
//
//  Created by Никита Мазус on 10.04.2022.
//

import SwiftUI

struct menuPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var index = 0
    @State var show = false
    @State private var btnBack = false
    
    var body: some View {
        ZStack{
            HStack{
                VStack(alignment: .leading, spacing: 12){
                    Image("avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                    
                    Text("Привет,")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    Text("Никита")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        self.index = 0
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    })
                    {
                        HStack(spacing: 25) {
                            Image(systemName: "list.bullet")
                                .foregroundColor(self.index == 0 ? Color("lightGray") : Color.white)
                            Text("Каталог")
                                .foregroundColor(self.index == 0 ? Color("lightGray") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(self.index == 0 ? Color("lightGray").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    .padding(.top, 25)
                    
                    Button(action: {
                        self.index = 1
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    })
                    {
                        HStack(spacing: 25) {
                            Image(systemName: "cart")
                                .foregroundColor(self.index == 1 ? Color("lightGray") : Color.white)
                            Text("Корзина")
                                .foregroundColor(self.index == 1 ? Color("lightGray") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(self.index == 1 ? Color("lightGray").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                        
                    }
                    
                    Button(action: {
                        self.index = 2
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    })
                    {
                        HStack(spacing: 25) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(self.index == 2 ? Color("lightGray") : Color.white)
                            Text("Избранное")
                                .foregroundColor(self.index == 2 ? Color("lightGray") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(self.index == 2 ? Color("lightGray").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                        
                    }
                    
                    Button(action: {
                        self.index = 3
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    })
                    {
                        HStack(spacing: 25) {
                            Image(systemName: "creditcard.fill")
                                .foregroundColor(self.index == 3 ? Color("lightGray") : Color.white)
                            Text("Мои заказы ")
                                .foregroundColor(self.index == 3  ? Color("lightGray") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(self.index == 3 ? Color("lightGray").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                        
                    }
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .foregroundColor(.white)
                        .padding(.vertical, 30)
                    
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    {
                        HStack{
                            Image(systemName: "pip.exit")
                                .foregroundColor(.white)
                            Text("Выход")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    }
                    //Spacer()
                    //                    NavigationLink("", isActive: $btnBack){
                    //                        Stack1()
                    //                    }
                    //                    .opacity(0)
                }
                .padding(.top, 25)
                .padding(.horizontal, 20)
                
                Spacer(minLength: 0)
            }
            //.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
//            .frame(width: 395, height: 848)
            .ignoresSafeArea(.all)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack(spacing: 0) {
                HStack(spacing: 15) {
                    Button(action: {
                        withAnimation {
                            self.show.toggle()
                        }
                    })
                    {
                        Image(systemName: self.show ?  "quote.opening" : "line.horizontal.3")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.5))
                    }
                    Text(self.index == 0 ?  "Каталог" : (self.index == 1 ? "корзина" : (self.index == 2 ? "Избранное" : "мои заказы")))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, UIScreen.main.bounds.height / 50)
                .padding()
                
                GeometryReader { _ in
                    VStack {
                        if self.index == 0 {
                            CatalogePage()
                        }
                        else if self.index == 1 {
                            CartPage()
                        }
                        else if self.index == 2 {
                            FavoritePage()
                        }
                        else {
                            OrderPage()
                        }
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(self.show ? 30 : 0)
            .scaleEffect(self.show ? 0.9 : 1)
            .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
            .rotationEffect(.init(degrees: self.show ? -5 : 0))
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
        }
        .background(Color("Gray").edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
        .frame(width: UIScreen.main.bounds.width - 140, height: UIScreen.main.bounds.height)
        .onTapGesture {
            withAnimation {
                if show == true {
                    self.show.toggle()
                }
            }
        }
    }
}


struct menuPage_Previews: PreviewProvider {
    static var previews: some View {
        menuPage()
    }
}
