//
//  ContentView.swift
//  iExpense
//
//  Created by Rakesh Shrestha on 02/01/2025.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        Text(item.amount, format: .currency(code: "NPR"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle(Text("iExpenses"))
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingExpense = true
                }
                .sheet(isPresented: $showingExpense) {
                    AddView(expenses: expenses)
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
    
}

#Preview {
    ContentView()
}
