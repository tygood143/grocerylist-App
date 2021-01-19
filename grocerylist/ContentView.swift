//
//  ContentView.swift
//  grocerylist
//
//  Created by Tyler Good on 1/17/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var itemStore = ItemStore()
    @State var newItem : String = ""
    @State var itemCount: Int = 1
    
    var searchBar: some View {
        HStack {
            TextField("Enter Item...", text: self.$newItem)
            Text("Amt: " + String(itemCount))
            Button(action: self.countUp, label: {
                Text("+")
            })
            Button(action: self.countDown, label: {
                Text("-")
            })
        Button(action: self.addNewItem, label: {
            Text("Add Item")
        })
    }
    }
    func countUp() {
        self.itemCount += 1;
        }
    
    func countDown() {
        if self.itemCount > 1 {
            self.itemCount -= 1;
        }
    }
    
    func addNewItem() {
        itemStore.items.append(Item(id: String(itemStore.items.count+1) , groceryItem: newItem, count: itemCount))
        self.newItem = ""
        self.itemCount = 1
    }
    var itemView: some View {
           
        ForEach(self.itemStore.items) { item in
            Text(item.groceryItem + "                     Amount: "+String(item.count))
        }.onMove(perform: self.move)
        .onDelete(perform: self.delete)
        }
    
    
        
    
    

    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    itemView
                }}.navigationBarTitle("Items")
                .navigationBarItems(trailing: EditButton())
                }
            }
    func delete(at offsets : IndexSet){
        itemStore.items.remove(atOffsets: offsets)
        
        
    }
    func move(from source : IndexSet, to destination : Int) {
        itemStore.items.move(fromOffsets: source, toOffset: destination)
    }}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
