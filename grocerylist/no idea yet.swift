//
//  no idea yet.swift
//  grocerylist
//
//  Created by Tyler Good on 1/17/21.
//

import Foundation
import SwiftUI
import Combine


struct Item: Identifiable {
    
    var id = String();
    var groceryItem = String();
    var count = Int();
    
}

class ItemStore : ObservableObject {
    @Published var items = [Item]();
}
