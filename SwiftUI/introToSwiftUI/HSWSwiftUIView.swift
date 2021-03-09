//
//  HSWSwiftUIView.swift
//  introToSwiftUI
//
//  Created by TTN on 08/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import SwiftUI

struct HSWSwiftUIView: View {
    var body: some View {
        HStack {
                   Text("I'm Joey Tribbiani!")
                       .font(.system(size: 20))
                   Text("How you doin'?")
                       .foregroundColor(.green)
                       .font(.system(size: 20))
               }
    }
}

struct HSWSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HSWSwiftUIView()
    }
}
