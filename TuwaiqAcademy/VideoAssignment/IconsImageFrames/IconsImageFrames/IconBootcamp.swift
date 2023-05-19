//
//  IconBootcamp.swift
//  IconsImageFrames
//
//  Created by Noura Alowayid on 29/10/1444 AH.
//

import SwiftUI

struct IconBootcamp: View {
    var body: some View {
        Image(systemName: "mic.badge.plus")
            .renderingMode(.original)
        // .resizable()
        //.aspectRatio(contentMode: .fill)
        // .scaledToFit()
        //.scaledToFill()
            .font(.largeTitle)
        //.font(.system(size: 200))
        // .foregroundColor(Color.red)
        //.frame(width: 300, height: 300)
    }
}

struct IconBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IconBootcamp()
    }
}
