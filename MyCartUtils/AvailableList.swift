//
//  AvailableList.swift
//  MyCartUtils
//
//  Created by Mohammed Ibrahim on 1/7/21.
//

import SwiftUI

struct AvailableList: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                HStack{
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 4, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("Available Items")
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                .padding(.leading,20)
                ScrollView(.vertical){
                    LazyVStack(spacing:0){
                        ForEach(homeViewModel.modelData){ item in
                                AvailableItemView(items: $homeViewModel.modelData[homeViewModel.getIndex(item: item)], item : $homeViewModel.modelData)
                        
                        }
                    }
                }
            }
        }
    }
}



struct AvailableList_Previews: PreviewProvider {
    static var previews: some View {
        AvailableList()
    }
}
