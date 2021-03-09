//
//  PickerSwiftUIView.swift
//  introToSwiftUI
//
//  Created by TTN on 08/03/21.
//  Copyright © 2021 TTN. All rights reserved.
//

import SwiftUI

struct PickerSwiftUIView: View {
    @State private var date = Date()

    var body: some View {
        DatePicker("Picker Example", selection: $date)
    }
    
}

struct PickerSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PickerSwiftUIView()
    }
}
