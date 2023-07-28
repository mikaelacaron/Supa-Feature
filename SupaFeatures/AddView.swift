//
//  AddView.swift
//  SupaFeatures
//
//  Created by Mikaela Caron on 7/23/23.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @State private var text = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Feature Description", text: $text)
        }
        .toolbar {
            ToolbarItem {
                Button {
                    Task {
                        try await viewModel.createFeatureRequest(text: text)
                        dismiss()
                    }
                } label: {
                    Text("Send")
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(viewModel: ViewModel())
    }
}
