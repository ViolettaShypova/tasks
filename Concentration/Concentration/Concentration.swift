//
//  Concentration.swift
//  Concentration
//
//  Created by Vaylet on 20.08.2018.
//  Copyright © 2018 Vaylet. All rights reserved.
//

import Foundation

class Concantration
{
    private(set) var cards = [Card]()
    private var indexOfOneAndOnlyFaceUp: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUp, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUp = nil
            } else {
                indexOfOneAndOnlyFaceUp = index
            }
        }
    }
    init(numberOfPairsOfCards: Int) {
         assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)): you must at least ne pair of cards")
        for _ in 1...numberOfPairsOfCards 
        {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shufle the cards
    }
}
