//
//  ContentView.swift
//  MyCartUtils
//
//  Created by Mohammed Ibrahim on 1/7/21.
//

import SwiftUI

class GlobalString: ObservableObject {
    @Published var availableCount = 0
    @Published var loanedCount = 0
    @Published var loaned = [Items]()
}

struct ContentView: View {
    @State private var selectedTab: Int = 0
    @State private var LoanedTab: Bool = true
    @State private var availableTab: Bool = false
    @StateObject var homeViewModel = HomeViewModel()

    @ObservedObject var globalString = GlobalString()
    
    var body: some View {
        ZStack(alignment:.top){
            Color.white
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(){
                Button(action: {
                    homeViewModel.availableItems.append(contentsOf: homeViewModel.modelData)
                }, label: {
                    Text("My Closet")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.black)
                })
                HStack(alignment:.center){
                    Image("profile")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    VStack(alignment:.leading){
                        Text("Maud Garret")
                            .font(.title2)
                            .padding(3)
                        HStack{
                            Text("#123412")
                                .foregroundColor(.gray)
                                .padding(3)
                                .font(.footnote)   
                        }
                    }
                    VStack(alignment:.trailing){
                        Text("Your Rating")
                            .padding(6)
                            .font(.footnote)
                        
                        HStack{
                            ForEach(0..<5){ row in
                                if(row<3){
                                    Image("starfiled")
                                        .resizable()
                                        .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                                else{
                                    Image("starempty")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                            }
                        }
                    }
                }
                
                HStack(){
                    VStack(alignment:.leading){
                        Text("Your Rating")
                            .foregroundColor(.gray)
                            .padding(6)
                            .font(.footnote)
                        Text("14")
                            .padding(6)
                            .font(.title3)
                    }
                    VStack(alignment:.leading){
                        Text("Pending")
                            .foregroundColor(.gray)
                            .padding(6)
                            .font(.footnote)
                        Text("1")
                            .padding(6)
                            .font(.title3)
                    }
                    VStack(alignment:.leading){
                        Text("Loaned")
                            .foregroundColor(.gray)
                            .padding(6)
                            .font(.footnote)
                        Text("4")
                            .padding(6)
                            .font(.title3)
                    }
                    VStack(alignment:.leading){
                        Text("Available")
                            .foregroundColor(.gray)
                            .padding(6)
                            .font(.footnote)
                        Text("10")
                            .padding(6)
                            .font(.title3)
                    }
                    Spacer()
                }
                .padding()
                VStack{
                    HStack{
                        Spacer()
                        VStack{
                            Text("LOANED ITEMS")
                                .padding(6)
                                .font(.footnote)
                            Rectangle()
                                .frame( width: LoanedTab ? 100 : 0, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .animation(LoanedTab ? .linear : .easeOut)
                        }
                        .onTapGesture {
                            self.LoanedTab = true
                            self.availableTab = false
                        }
                        Spacer()
                        VStack{
                            Text("AVAILABLE ITEMS")
                                .padding(6)
                                .font(.footnote)
                            Rectangle()
                                .frame( width: availableTab ? 100 : 0, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .animation(availableTab ? .linear : .easeOut)
                        }
                        .onTapGesture {
                            self.availableTab = true
                            self.LoanedTab = false
                        }
                        Spacer()
                    }
                    if(LoanedTab){
                        LoanedList()
                    }
                    else{
                        AvailableList()
                    }
                }
            }
            .padding(5)
        }
        
    }
    func getAvailableCount() -> Int{
        var count : Int = 0
        homeViewModel.modelData.forEach{(item) in
            if(!item.isAdded){
                count = count+1
            }
        }
        return count
    }
    
    func getLoanedCount() -> Int{
        var count : Int = 0
        homeViewModel.modelData.forEach{(item) in
            if(item.isAdded){
                count = count+1
            }
        }
        return count
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static let lairLightGray = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let LightBlue = Color(red: 71 / 255, green: 179 / 255, blue: 255 / 255)
    static let WhiteBlue = Color(red: 133 / 255, green: 227 / 255, blue: 253 / 255)
    static let LightRed = Color(red: 243 / 255, green: 85 / 255, blue: 133 / 255)
    static let WhiteRed = Color(red: 245 / 255, green: 137 / 255, blue: 173 / 255)
    static let LightYellow = Color(red: 255 / 255, green: 169 / 255, blue: 66 / 255)
    static let WhiteYellow = Color(red: 255 / 255, green: 209 / 255, blue: 158 / 255)
    static let LightVoilet = Color(red: 142 / 255, green: 120 / 255, blue: 252 / 255)
    static let WhiteVoilet = Color(red: 170 / 255, green: 151 / 255, blue: 249 / 255)
}
