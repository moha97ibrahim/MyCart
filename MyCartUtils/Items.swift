//
//  Items.swift
//  MyCartUtils
//
//  Created by Mohammed Ibrahim on 1/7/21.
//

import Combine
import Foundation
import CoreGraphics
import RealmSwift

struct Items: Identifiable{
    var id = UUID()
    var image: String
    var name: String
    var barandName :String
    var rating: Float
    var price : Int
    var seen : Int
    var size : String
    var status : String
    var offset : CGFloat
    var isSwiped : Bool
    var isAdded : Bool
}



