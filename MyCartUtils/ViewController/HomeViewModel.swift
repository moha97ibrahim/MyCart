//
//  File.swift
//  MyCartUtils
//
//  Created by Mohammed Ibrahim on 2/7/21.
//

import Foundation
import CoreData
import RealmSwift

class HomeViewModel: ObservableObject {
    
    
    @Published var loanedItem = [Items]()
    @Published var availableItems = [Items]()
    @Published var modelData  =
        [Items(id : UUID(), image: "dress1", name: "Linen Dress with No Pattern", barandName: "Tommy", rating: 2.5, price: 32, seen: 12, size: "XL", status: "upcomming", offset : 0, isSwiped: false, isAdded : false),
         Items(id : UUID(),image: "dress2", name: "Saffron Red", barandName: "Rockstar", rating: 4.5, price: 123, seen: 12, size: "XLL", status: "", offset : 0, isSwiped: false, isAdded : false),
         Items(id : UUID(),image: "dress3", name: "Cotton Dress with No Pattern", barandName: "Ajio", rating: 1.5, price: 342, seen: 12, size: "XS", status: "", offset : 0, isSwiped: false, isAdded : false),
         Items(id : UUID(),image: "dress4", name: "Fabric Dress with No Pattern", barandName: "Nike", rating: 345, price: 453, seen: 12, size: "L", status: "", offset : 0, isSwiped: false, isAdded : false),
         Items(id : UUID(),image: "dress5", name: "Cotton Dress with Pattern", barandName: "H&M", rating: 3.5, price: 123, seen: 12, size: "M", status: "upcomming", offset : 0, isSwiped: false, isAdded : false),
         Items(id : UUID(),image: "dress6", name: "Fabric Dress with Pattern", barandName: "Trigger", rating: 2.5, price: 987, seen: 12, size: "L", status: "", offset : 0, isSwiped: false, isAdded : false),
         Items(id : UUID(),image: "dress7", name: "Perl White", barandName: "GAS", rating: 3.0, price: 273, seen: 12, size: "XLL", status: "upcomming", offset : 0, isSwiped: false, isAdded : false),
         Items(image: "dress1", name: "Pure White Denim,", barandName: "American", rating: 5.0, price: 421, seen: 12, size: "XL", status: "upcomming", offset : 0, isSwiped: false, isAdded : false),
         Items(id : UUID(),image: "dress8", name: "Pure Cotton", barandName: "Ramraj", rating: 4.7, price: 937, seen: 12, size: "M", status: "", offset : 0, isSwiped: false, isAdded : false),
         Items(id : UUID(),image: "dress9", name: "Fabric Pattern", barandName: "Woodland", rating: 3.0, price: 127, seen: 12, size: "S", status: "upcomming", offset : 0, isSwiped: false, isAdded : false),
         Items(id : UUID(),image: "dress10", name: "Denim", barandName: "Puma", rating: 2.5, price: 937, seen: 12, size: "XLLL", status: "", offset : 0, isSwiped: false, isAdded : false),
        ]
    
    var config : Realm.Configuration
    var realm : Realm
    
    init(){
        config = Realm.Configuration(schemaVersion : 1)
        realm = try! Realm(configuration: config)
        if false{
            availableItems.append(contentsOf: modelData)
        }
    }
    
    func addTask(title: String,desc:String){
            do{
                let newData = Task()
                newData.title = title
                newData.desc = desc
                try? realm.write({
                    realm.add(newData)
                    print("success")
                })
                }
        }
        
        func getData() -> Results<Task> {
            let data = realm.objects(Task.self)
            return data
        }
    

    func getIndex(item: Items) -> Int{
        return self.modelData.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }

    func getIndexLoaned(item: Items) -> Int{
        return self.loanedItem.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    func getIndexAvailable(item: Items) -> Int{
        return self.availableItems.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    func getAvailableCount() -> Int{
        var count : Int = 0
        modelData.forEach{(item) in
            if(!item.isAdded){
                count = count+1
            }
        }
        return count
    }
    
    func getLoanedCount() -> Int{
        var count : Int = 0
        modelData.forEach{(item) in
            if(item.isAdded){
                count = count+1
            }
        }
        return count
    }
    
  
}
