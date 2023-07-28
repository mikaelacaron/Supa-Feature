//
//  UpdateView.swift
//  SupaFeatures
//
//  Created by Mikaela Caron on 7/25/23.
//

import SwiftUI

struct UpdateView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let feature: Feature
    
    @State private var text = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Feature Description", text: $text, axis: .vertical)
        }
        .onAppear {
            text = feature.text
        }
        .toolbar {
            ToolbarItem {
                Button {
                    Task {
                        await viewModel.update(feature, with: text)
                        dismiss()
                    }
                } label: {
                    Text("Update")
                }
            }
        }
    }
}

struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateView(viewModel: ViewModel(), feature: Feature(createdAt: Date(), text: "This is an example", isComplete: false, userID: UUID()))
    }
}
