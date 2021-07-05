//
//  AvailableItemView.swift
//  MyCartUtils
//
//  Created by Mohammed Ibrahim on 2/7/21.
//

import SwiftUI

struct AvailableItemView: View {
    @Binding var items : Items
    @Binding var item : [Items]
    
    @ObservedObject var globalString = GlobalString()
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.LightBlue, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
            HStack {
                Image("\(items.image)")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                VStack(alignment:.leading){
                    Text("\(items.name)")
                        .padding(.top,10)
                    HStack(){
                        Image("starfiled")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("\(String(format: " %.1f", items.rating))")
                        Text("US")
                            .foregroundColor(.gray)
                        Text("\(items.size)")
                    }
                    HStack{
                        Text("$\(items.price)")
                            .bold()
                        Text("Total")
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom,10)
                }
                Spacer()
                VStack(alignment:.trailing){
                    Spacer()
                    Text("26th Feb")
                        .font(.footnote)
                        .padding(.trailing,10)
                    Spacer()
                    HStack(){
                        Text("Allce Ray")
                        Image("profile")
                            .resizable()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.trailing,10)
                    }
                    
                }
                .padding(.bottom,10)
            }
            .cornerRadius(10)
            .background(Color.lairLightGray)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1))
            .offset(x: items.offset)
            .gesture(DragGesture()
                        .onChanged(onChanged(value:))
                        .onEnded(onEnd(value:)))
        }
        .padding()
        
    }
    func onChanged(value: DragGesture.Value){
        if value.translation.width < 0 {
            if items.isSwiped{
            items.offset = value.translation.width - 90
            }
            else{
                items.offset = value.translation.width
            }
        }
       
    }
    
    func onEnd(value: DragGesture.Value){
        withAnimation(.easeOut){
            if value.translation.width <  0 {
                items.offset = value.translation.width
                if -value.translation.width > UIScreen.main.bounds.width / 2{
                    items.offset = -1000
                    deleteItem()
                }
                else{
                    items.isSwiped = false
                    items.offset = 0
                }
            }
            else{
                items.isSwiped = false
                items.offset = 0
            }
        }
    }
    
    func deleteItem(){
        items.isAdded = true
        item.removeAll{ (items) -> Bool in
            return self.items.id == items.id
        }
        globalString.loaned.append(items)
        print(globalString.loaned)
//        homeViewModel.loanedItem.append(items)
//        homeViewModel.availableItems.remove(at: homeViewModel.getIndexAvailable(item: items))
//        print(homeViewModel.loanedItem)
//        print(homeViewModel.availableItems)
//        globalString.availableCount = homeViewModel.getAvailableCount()
    }

}
