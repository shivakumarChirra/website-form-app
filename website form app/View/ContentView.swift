//
//  ContentView.swift
//  website form app
//
//  Created by shivakumar chirra on 04/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FormViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Business Info")) {
                    TextField("Name", text: $viewModel.name)
                    TextField("Email", text: $viewModel.email)
                    TextField("Business Name", text: $viewModel.businessName)
                }

                Section {
                    Button(action: viewModel.submitForm) {
                        HStack {
                            if viewModel.isLoading {
                                ProgressView()
                            }
                            Text("Submit")
                        }
                    }
                    .disabled(viewModel.name.isEmpty || viewModel.email.isEmpty || viewModel.businessName.isEmpty)
                }

                if !viewModel.message.isEmpty {
                    Section {
                        Text(viewModel.message)
                            .foregroundColor(viewModel.message.contains("Success") ? .green : .red)
                    }
                }
            }
            .navigationTitle("Business Form")
        }
    }
}
