//
//  Model.swift
//  Client_server_gallery_application
//
//  Created by TTN on 20/04/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import Foundation

import Foundation

struct imagesDetails:Decodable {
    
    
    let format: String
    let width: Int
    let height: Int
    let filename: String
    let id: Int
    let author: String
    let author_url: String
    let post_url: String

}
