//
//  Tweet.swift
//  TweeterClone
//
//  Created by Gru/dakoch on 01/05/15.
//  Copyright (c) 2015 GruTech. All rights reserved.
//
// --------------------------------------------------------------------------------------------------------
// Monday, 2015-Jan-05
// W1.D1.02[x] Create your Tweet class with an initializer that takes a Dictionary
//             in as a parameter/

import Foundation

class Tweet {

    var text : String

    // Open the json file and extract the 'text' value.                         W1.D1.02
    init( _ jsonDictionary : [String : AnyObject] ) {
        self.text = jsonDictionary["text"] as String
    }
}
