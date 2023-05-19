//
//  FrameBootcamp.swift
//  IconsImageFrames
//
//  Created by Noura Alowayid on 29/10/1444 AH.
//

import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//           // .frame(width: 300, height: 300, alignment: .topTrailing)
//            .frame(maxWidth: .infinity,alignment: .leading)
//            .background(Color.red)
        
            .background(Color.green)
            .frame(height: 100, alignment: .top)
            .background(Color.orange)
            .frame(height: 150)
            .background(Color.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.purple)
            .frame(height: 400)
            .background(Color.pink)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.yellow)

        
    }
}

struct FrameBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FrameBootcamp()
    }
}
