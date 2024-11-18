//
//  SentimentServices.swift
//  spline_3d
//
//  Created by sarim khan on 16/11/2024.
//

import Foundation
import SwiftData


class SentimentServices {
    
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SentimentServices()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: SentimentModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        self.modelContext = modelContainer.mainContext
    }
    
    func getSentiment() -> [SentimentModel] {
        do{
            return try modelContext.fetch(FetchDescriptor<SentimentModel>())
        }catch{
            return []
        }
        
    }
    
    func putSentiment(sentimentModel:SentimentModel)  {
        modelContext.insert(sentimentModel)
        
        do{
            try modelContext.save()
           
        }catch{
            print("Error")
        }
    }
    
}
