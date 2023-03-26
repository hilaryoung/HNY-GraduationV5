//
//  QuickAddView.swift
//
//  Created by Hilary Young on 25/03/2023.
//

import SwiftUI

struct QuickAddView: View {
    // Linking to user model
    @EnvironmentObject var user: UserViewModel
    
    @State var selectedItems = [String]()
    
    // Ingredients dataset
    // I want to change the "allItems" to the data with "Ingredients.csv" dataset
    // In the "Ingredients.csv" there is 2 values each row, If possible I would want this to be shown in the list as well
    @State var allItems:[String] = ["Apple",
                         "Grape",
                         "Orange",
                         "Peach",
                         "Mango",
                         "Watermelon"]
    
    var body: some View {
        MultiSelectPickerView(allItems: allItems, selectedItems: $selectedItems)
    }
}


struct MultiSelectPickerView: View {
    // The list of items we want to show
    @State var allItems: [String]
    // Binding to the selected items we want to track
    @Binding var selectedItems: [String]
    
    var body: some View {
        Form {
            List {
                ForEach(allItems, id: \.self) { item in
                    Button(action: {
                        withAnimation {
                            if self.selectedItems.contains(item) {
                                // Previous comment: you may need to adapt this piece
                                self.selectedItems.removeAll(where: { $0 == item })
                            } else {
                                self.selectedItems.append(item)
                            }
                        }
                    }) {
                        HStack {
                            Image(systemName: "checkmark")
                                .opacity(self.selectedItems.contains(item) ? 1.0 : 0.0)
                            Text(item)
                        }
                    }
                    .foregroundColor(.primary)
                }
            }
        }
        
        NavigationLink("Add Items", destination: QuickSummaryview(selectedItems: selectedItems, allItems: allItems))
    }
}



struct QuickSummaryview:View {
    @State var selectedItems:[String]
    @State var allItems:[String]
    
    var body: some View {
        NavigationView {
            Form {
                
                // Made a quick text section so we can see what we selected
                Section("My selected items are:", content: {
                    Text(selectedItems.joined(separator: "\n"))
                        .foregroundColor(Color(red: 0.4192, green: 0.2358, blue: 0.3450))
                })
            }
            .navigationTitle("Selected Items")
        }
        NavigationLink("Add to firebase database", destination: ProfileView())
    }
}



struct QuickAddView_Previews: PreviewProvider {
    static var previews: some View {
        QuickAddView()
    }
}
