//
//  TextSwiftUIView.swift
//  introToSwiftUI
//
//  Created by TTN on 08/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import SwiftUI

struct TextSwiftUIView: View {
    var body: some View {
        Text("How you doin'? ")
        .bold()
        .foregroundColor(.green)
        .baselineOffset(70)
            .font(.system(size: 50))
    }
}

struct TextSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TextSwiftUIView()
    }
}
