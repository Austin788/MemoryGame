//
//  MemoryGame.swift
//  Memorize
//
//  Created by Austin Zheng on 2020/12/15.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{
//
//            var faceUpCardIndices = [Int]()
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    faceUpCardIndices.append(index)
//                }
//            }
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    var name: String {
        return "123"
    }
    
    
    
    
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatchd {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatchd = true
                    cards[potentialMatchIndex].isMatchd = true
                }
                cards[chosenIndex].isFaceUp = true
            }else{
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }        
        }
    }
//    func index(of card: Card) -> Int {
//        for index in 0..<cards.count {
//            if cards[index].id == card.id{
//                return index
//            }
//        }
//        return 0
//    }
    
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatchd: Bool = false
        var content: CardContent
        var id: Int
    }
}
