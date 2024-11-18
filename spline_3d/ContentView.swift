//
//  ContentView.swift
//  spline_3d
//
//  Created by sarim khan on 12/11/2024.
//

import SwiftUI
import NaturalLanguage
import SwiftData

struct ContentView: View {
    
    @StateObject private var sentimentVM:SentimentViewModel = SentimentViewModel(sentimentServices: .shared)
    @State var showSheet:Bool = false
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(sentimentVM.listOfSentiment){sentiment in
                    Text(sentiment.review)
                    
                }
                
                
            }
            .listStyle(.plain)
            .padding()
            .navigationTitle("Sentiment Analysis")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        self.showSheet.toggle()

                    } label: {
                        Label("Add", systemImage: "plus")
                            .labelStyle(.titleAndIcon)
                    }

                }
            }
            .sheet(isPresented: $showSheet) {
                SentimentSheet(sentimentVm: sentimentVM)
                    .presentationDetents([.medium])
            }
        }
        
       
       
    }
}

#Preview {
    ContentView()
}
