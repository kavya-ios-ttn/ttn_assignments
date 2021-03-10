//
//  VSWSwiftUIView.swift
//  introToSwiftUI
//
//  Created by TTN on 08/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import SwiftUI

struct VSWSwiftUIView: View {
    var body: some View {
        VStack {
            Text("I'll be there for you")
                .italic()
                .font(.system(size: 20))
                .bold()
            Text("when the rain starts to pour")
                .foregroundColor(.blue)
                .font(.system(size: 25))
            Text("cause you're there for me too...")
                .foregroundColor(.red)
                .font(.system(size: 25))
                .italic()
        }
    }
}

struct VSWSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VSWSwiftUIView()
    }
}
