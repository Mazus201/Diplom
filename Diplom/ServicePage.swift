//
//  ServicePage.swift
//  Diplom
//
//  Created by Никита Мазус on 26.04.2022.
//

import SwiftUI

struct ServicePage: View {
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                VStack{
                    ZStack{
                        VStack{
                            Image("smt2")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                                .padding(.top, 30)
                            Spacer()
                        }
                        VStack{
                            HStack{
                                Spacer()
                                Button(action: {
                                    //
                                }){
                                    Image(systemName: "square.and.arrow.up")
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.black)
                                }
                            }
                            Spacer()
                        }
                        .padding(.top, 50)
                    }
                    .ignoresSafeArea(.all)
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 12)
                Text("Замена топливного фильтра")
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .font(.system(size: 25))
                HStack{
                    Text("От 1490 руб.")
                        .padding(.horizontal, 19)
                        .padding(.vertical, 1)
                    Spacer()
                    Text("До 1 часа")
                        .fontWeight(.light)
                        .font(.system(size: 14))
                        .padding(.horizontal, 19)
                        .padding(.vertical, 1)
                }
                .padding(.bottom, 10)
                VStack{
                    ScrollView{
                        Text("Выполнить замену фильтра на Рендж Ровер Спорт с дизельным мотором 3.6 л или с другими двигателями можно в течение 20 минут, при условии обращения в профессиональный автосервис. Работа выполняется в такой последовательности: Мастер открывает капот Range Rover. Фильтр находится ближе к передней части, рядом с радиатором и щупом. Чтобы до него добраться демонтируется воздуховод и пластиковая крышка-накладка. В открытый патрубок для прохода воздуха лучше положить ветошь, чтобы предупредить засорение мелкими деталями. Далее выкручивают 4 гайки с пресс-шайбами для деинсталляции защиты фильтра. Потом снимают четыре патрубка. Их глушат специальными колпачками, чтобы топливо не разливалось по подкапотному пространству Land Rover. Коннектор датчика температуры топлива не трогают (оставляют на патрубке), иначе это может нарушить его работу. Шестигранником выкручивают три болта крепления корпуса фильтрующего элемента. Перед извлечением необходимо отсоединить контакт датчика воды в фильтре. Его снимают со старого блока и перекручивают в новый. Установка нового топливного фильтра в Рендж Ровер осуществляется в обратной последовательности. По такой же схеме меняется фильтрующий элемент на двигателях 4.4 л.")
                            .padding(.horizontal, 20)
                            .frame(height: UIScreen.main.bounds.height / 2.5)
                    }
                    Spacer()
                    HStack{
                        Button(action: {
                            //
                        }) {
                            Image(systemName: "cart")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 2.5)
                                .background(Color("newGreen").opacity(0.8))
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        }
                        Button(action: {
                            //
                        }) {
                            Text("Записаться")
                                .frame(width: 130, height: 35)
                                .background(Color("mainGreen"))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct ServicePage_Previews: PreviewProvider {
    static var previews: some View {
        ServicePage()
    }
}
