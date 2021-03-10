//
//  ContentView.swift
//  introToSwiftUI
//
//  Created by TTN on 08/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
           return NavigationView{
               List{
                   NavigationLink(destination: ImageSwiftUIView()){
                       Text("Image")
                   }
                   NavigationLink(destination: TextSwiftUIView()){
                       Text("Text")
                   }
                   NavigationLink(destination: VSWSwiftUIView()){
                       Text("Vertical Stack View")
                   }
                   NavigationLink(destination: HSWSwiftUIView()){
                        Text("Horizontal Stack View")
                   }
                   NavigationLink(destination: ButtonSwiftUIView()){
                       Text("Button")
                   }
                   NavigationLink(destination: PickerSwiftUIView()){
                        Text("Picker")
                   }
                  
               }
           }
       }
}
struct MultiplePreviewSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
                    ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                    .previewDisplayName("iphone 11")
            
                   ContentView()
                   .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
                   .previewDisplayName("iPhone 11 Pro Max")

                    ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 11 pro"))
                    .previewDisplayName("iphone 11 pro")
            

                    ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 8 plus"))
                    .previewDisplayName("iphone 8 plus")
            

                    ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                    .previewDisplayName("iphone 8")
            
            
                    ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                    .previewDisplayName("iphone SE")
        }
    }
}
