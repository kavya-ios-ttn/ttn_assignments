//
//  Stats.swift
//  CocoaPods
//
//  Created by TTN on 22/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import Foundation

struct Stats:Decodable {
    
    let id: String
    let author: String
    let width: Int
    let height: Int
    let download_url: String
}

