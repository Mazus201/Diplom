//
//  FavoritePage.swift
//  Diplom
//
//  Created by Никита Мазус on 23.04.2022.
//

import SwiftUI


struct FavoritePage: View {
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    //
                })
                {
                    Text("Очистить")
                        .fontWeight(.light)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 20)
            }
            ScrollView{
                VStack{
                    HStack{
                        Image("smt2")
                            .padding()
                        HStack{
                            VStack(alignment: .leading){
                                Text("Промывка топливной системы Range Rover")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .frame(width: 200, alignment: .leading)
                                Text("1.5 часа")
                                    .font(.system(size: 12))
                                    .fontWeight(.light)
                                    .frame(width: 200, alignment: .leading)
                                    .padding(.vertical, 1)
                                Text("От 2700 руб.")
                                    .font(.system(size: 15))
                                    .frame(width: 200, alignment: .leading)
                                Spacer()
                                
                            }
                            .offset(x: -10, y: 15)
                            Spacer()
                        }
                        .frame(width: 200, height: 100)
                        Spacer()
                    }
                    .offset(x: -7, y: -70)
                    HStack{
                        Image("smt3")
                            .padding()
                        HStack{
                            VStack(alignment: .leading){
                                Text("Замена колес Range Rover")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .frame(width: 200, alignment: .leading)
                                Text("1 час")
                                    .font(.system(size: 12))
                                    .fontWeight(.light)
                                    .frame(width: 200, alignment: .leading)
                                    .padding(.vertical, 1)
                                Text("От 1500 руб.")
                                    .font(.system(size: 15))
                                    .frame(width: 200, alignment: .leading)
                                Spacer()
                                
                            }
                            .offset(x: -10, y: 15)
                            Spacer()
                        }
                        .frame(width: 200, height: 100)
                        Spacer()
                    }
                    .offset(x: 0, y: -75)
                }
                .padding(.top, 50)
                
            }
        }
    }
    
}


struct FavoritePage_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePage()
    }
}
