//
//  ImageSwiftUIView.swift
//  introToSwiftUI
//
//  Created by TTN on 08/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import SwiftUI

struct ImageSwiftUIView: View {
    var body: some View {
        Image("paris2")
        .frame(width: 200, height: 200)
    }
}

struct ImageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSwiftUIView()
    }
}
