//
//  CatalogePage.swift
//  Diplom
//
//  Created by Никита Мазус on 23.04.2022.
//

import SwiftUI


struct ExpenseItem: Identifiable, Codable{
    let id = UUID()
    let name: String
    let type: String
    let time: String
    let cost: String
    let description: String
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
    }
}

struct CatalogePage: View {
    
    @State private var showAdd = false
    @ObservedObject var expenses = Expenses()
    @State private var adminMode = false
    @State private var goTo = 0
    @State private var goodView = false
    
    var body: some View {
        NavigationView{
            List{
                VStack{
                    ScrollView(.horizontal){
                        HStack{
                            Button (action:{
                                //
                            })
                            {
                                Text("Ремонт")
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                    .background(Color("mainGreen"))
                                    .cornerRadius(7)
                                    .padding(10)
                                    .foregroundColor(.white)
                            }
                            Button (action:{
                                //
                            })
                            {
                                Text("Диагностика")
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                    .background(Color("LightGrayTrue"))
                                    .cornerRadius(7)
                                    .foregroundColor(.gray)
                            }
                            Button (action:{
                                //
                            })
                            {
                                Text("Модернизация")
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                    .background(Color("LightGrayTrue"))
                                    .cornerRadius(7)
                                    .padding(10)
                                    .foregroundColor(.gray)
                            }
                            Button (action:{
                                //
                            })
                            {
                                Text("Оценка авто")
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                    .background(Color("LightGrayTrue"))
                                    .cornerRadius(7)
                                    .foregroundColor(.gray)
                            }
                        }
                        //                        .frame(width: UIScreen.main.bounds.width)
                    }
                    //                    HStack{
                    //                        Button(action:{
                    //                            //
                    //                        })
                    //                        {
                    //                            Text("По популярности↓")
                    //                                .font(.system(size: 15))
                    //                                .foregroundColor(.gray)
                    //                        }
                    //                        .padding(.horizontal, 15)
                    //                        Spacer()
                    //                    }
                    ZStack{
                        Image("banerBack")
                        VStack(alignment: .leading, spacing: 8){
                            Text("ТО в подарок")
                                .fontWeight(.bold)
                            Text("При записи через приложение")
                                .font(.system(size: 13))
                        }
                        .offset(x: -50)
                        Image("human")
                            .resizable()
                            .frame(width: 140 ,height: 110)
                            .offset(x: 110, y: -15)
                    }
                    .foregroundColor(.black)
                }
                
                ForEach(expenses.items) { item in
                   
                    Button(action: {
                        goodView.toggle()
                    })
                    {
                        HStack{
                            Image("smt3")
                                .padding()
                                .offset(y: -15)
                            HStack{
                                VStack(alignment: .leading){
                                    Text(item.name)
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                        .frame(width: 200, alignment: .leading)
                                    Text(item.time)
                                        .font(.system(size: 12))
                                        .fontWeight(.light)
                                        .frame(width: 200, alignment: .leading)
                                        .padding(.vertical, 1)
                                    Text(item.cost)
                                        .font(.system(size: 15))
                                        .frame(width: 200, alignment: .leading)
                                    Spacer()
                                    
                                }
                                Spacer()
                            }
                            .frame(width: 200, height: 100)
                            Spacer()
                        }
                        .padding(.bottom, -20)
                    }
                    NavigationLink(destination: ServicePage(), isActive: $goodView){

                    }
                    .frame(width: 30, height: 0)
                    .opacity(0)
                    Divider()
                        .padding(.right, 50)
                        .offset(y: -10)
                }
                .navigationBarHidden(self.adminMode ? false : true)
                .navigationBarItems(trailing:
                                        Button(action:{
                    self.showAdd = true
                })
                                    {
                    if adminMode == true {
                        Image(systemName: "plus")
                            .foregroundColor(.black.opacity(0.6))
                    }
                }
                    .ignoresSafeArea(.all)
                                    //                    .frame(width: self.adminMode ? UIScreen.main.bounds.width : 0, height: self.adminMode ? 20 : 0)
                )
                .sheet(isPresented: $showAdd) {
                    AddView(expenses: self.expenses)
                }

            }
            .listRowSeparator(.hidden)
            .padding(.top, UIScreen.main.bounds.width / 10)
            .frame(width: UIScreen.main.bounds.width + 40, height: UIScreen.main.bounds.height)
            .offset(y: self.adminMode ? 20: -20)
        }
    }
}

enum NoFlipEdge {
    case left, right
}

struct NoFlipPadding: ViewModifier {
    let edge: NoFlipEdge
    let length: CGFloat?
    @Environment(\.layoutDirection) var layoutDirection
    
    private var computedEdge: Edge.Set {
        if layoutDirection == .rightToLeft {
            return edge == .left ? .trailing : .leading
        } else {
            return edge == .left ? .leading : .trailing
        }
    }
    
    func body(content: Content) -> some View {
        content
            .padding(computedEdge, length)
    }
}

extension View {
    func padding(_ edge: NoFlipEdge, _ length: CGFloat? = nil) -> some View {
        self.modifier(NoFlipPadding(edge: edge, length: length))
    }
}

struct CatalogePage_Previews: PreviewProvider {
    static var previews: some View {
        CatalogePage(expenses: Expenses())
    }
}
