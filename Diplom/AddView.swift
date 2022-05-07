//
//  AddView.swift
//  Diplom
//
//  Created by Никита Мазус on 23.04.2022.
//

import SwiftUI
struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Ремонт"
    @State private var time = ""
    @State private var cost = " руб."
    @State private var description = ""
    
    let types = ["Ремонт", "Диагностика", "Модернизация", "Оценка", "Другое"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Название", text: $name)
                Picker("Тип", selection: $type) {
                    ForEach(self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Время", text: $time)
                TextField("Стоимость", text: $cost)
                    .keyboardType(.numberPad)
                TextField("Описание", text: $description)
                ScrollView{
                    Text(description)
                        .frame(height: 200, alignment: .top)
                }
                
            }
            .navigationBarTitle("Добавить")
            .navigationBarItems(trailing: Button("Сохранить") {
                let item = ExpenseItem(name: self.name, type: self.type, time: self.time, cost: self.cost, description: self.description)
                    self.expenses.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
