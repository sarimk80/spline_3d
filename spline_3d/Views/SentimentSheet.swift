//
//  SentimentSheet.swift
//  spline_3d
//
//  Created by sarim khan on 14/11/2024.
//

import SwiftUI

struct SentimentSheet: View {
    
    @ObservedObject var sentimentVm:SentimentViewModel
    
    var body: some View {
        VStack{
            TextField(text: $sentimentVm.textFieldText) {
                Text("Enter review")
            }
            Spacer()
            Button {
                sentimentVm.sentimentAnalysis()
            } label: {
                Text("Done")
            }
            .buttonStyle(.borderedProminent)
            

        }
        .padding()
    }
}

#Preview {
    SentimentSheet(
        sentimentVm: SentimentViewModel(sentimentServices: .shared)
    )
}
