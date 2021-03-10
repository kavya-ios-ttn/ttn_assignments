//
//  ButtonSwiftUIView.swift
//  introToSwiftUI
//
//  Created by TTN on 08/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import SwiftUI

struct ButtonSwiftUIView: View {
    var body: some View {
       Button(action: {
                  
              }, label: {
                  Text("BLUE BUTTON")
                      .foregroundColor(.white)
                      .font(.system(size: 35))
              })
                  .padding(.all, 30.0)
                  .background(Color.blue)
                  .cornerRadius(50)
    }
}

struct ButtonSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSwiftUIView()
    }
}
