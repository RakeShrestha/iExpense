//
//  AddView.swift
//  iExpense
//
//  Created by Rakesh Shrestha on 05/01/2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var type: String = "Personal"
    @State private var amount: Double = 0
    
    let types = ["Personal", "Business"]
    
    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "NPR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
