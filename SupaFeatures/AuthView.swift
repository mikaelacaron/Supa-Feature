//
//  AuthView.swift
//  SupaFeatures
//
//  Created by Mikaela Caron on 7/25/23.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Sign Up or Sign In", selection: $viewModel.authAction) {
                    ForEach(AuthAction.allCases, id: \.rawValue) { action in
                        Text(action.rawValue).tag(action)
                    }
                }
                .pickerStyle(.segmented)
                
                TextField("Email", text: $viewModel.email)
                SecureField("Password", text: $viewModel.password)
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        Task {
                            try await viewModel.authorize()
                            dismiss()
                        }
                        
                    } label: {
                        Text(viewModel.authAction.rawValue)
                    }
                }
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(viewModel: ViewModel())
    }
}
