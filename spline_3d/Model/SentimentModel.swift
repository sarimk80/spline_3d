//
//  SentimentModel.swift
//  spline_3d
//
//  Created by sarim khan on 15/11/2024.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class SentimentModel :  Identifiable{
    
    @Attribute(.unique)  var id:String
    var review:String
    var sentiment:String
    var color:String
    
    init(review: String, sentiment: String, color: String) {
        self.id = UUID().uuidString
        self.review = review
        self.sentiment = sentiment
        self.color = color
    }
}
