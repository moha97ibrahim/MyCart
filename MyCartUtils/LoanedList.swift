//
//  LoanedList.swift
//  MyCartUtils
//
//  Created by Mohammed Ibrahim on 1/7/21.
//

import SwiftUI

struct LoanedList: View {
    @StateObject var homeViewModel = HomeViewModel()
    var body: some View {
        let data = homeViewModel.getData()
        ZStack{
            VStack(alignment:.leading){
                HStack{
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 4, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("Loaned Items")
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .onAppear{
                            print(data.count)
                        }
                }
                .padding(.leading,20)
                ScrollView(.vertical){
                    LazyVStack(spacing:0){
                        ForEach(homeViewModel.modelData){ item in
                                LoanedItemView(items: $homeViewModel.modelData [homeViewModel.getIndex(item: item)], item : $homeViewModel.modelData)
                        }
                        
                    }
                }
            }
        }
    }
   
}


struct LoanedList_Previews: PreviewProvider {
    static var previews: some View {
        LoanedList()
    }
}
