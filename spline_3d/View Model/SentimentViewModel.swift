//
//  SentimentViewModel.swift
//  spline_3d
//
//  Created by sarim khan on 13/11/2024.
//

import Combine
import NaturalLanguage
import SwiftData

class SentimentViewModel : ObservableObject{
    
    @Published var sentimentText:String = "Loading"
    @Published var textFieldText:String = ""
    @Published var listOfSentiment:[SentimentModel] = []
    
    private var sentimentServices:SentimentServices
    
   
    
    init(sentimentServices: SentimentServices) {
        self.sentimentServices = sentimentServices
        
        self.listOfSentiment =  sentimentServices.getSentiment()
    }
    
    
    
    
    
    @MainActor
    func sentimentAnalysis() {
        
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = textFieldText.description
        
        let (sentiment,_) = tagger.tag(at: textFieldText.description.startIndex, unit: .paragraph, scheme: .sentimentScore)
          
        if let sentimentScore = sentiment , let score = Double(sentimentScore.rawValue){
            switch score {
            case _ where score > 0:
                self.sentimentText = "Positive"
            case _ where score < 0:
                self.sentimentText = "Negative"
            default:
                self.sentimentText = "Neutral"
            }
            sentimentServices.putSentiment(sentimentModel: SentimentModel(review: textFieldText.description, sentiment: sentimentText, color: ""))
            self.listOfSentiment =  sentimentServices.getSentiment()
            
        }else{
            self.sentimentText = "Error"
        }
        
    }
}
