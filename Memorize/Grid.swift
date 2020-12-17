//
//  Grid.swift
//  Memorize
//
//  Created by Austin Zheng on 2020/12/17.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { gemotry in
            body(for: GridLayout(itemCount: items.count, in: gemotry.size))
        }
    }
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    func body(for item: Item, in layout: GridLayout ) -> some View {
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
        
    }
//    func index(of item: Item) -> Int {
//        for index in 0..<items.count {
//            if item.id == items[index].id {
//                return index
//            }
//        }
//        return 0
//    }
    
}

