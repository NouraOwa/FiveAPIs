//
//  ImageBootcamp.swift
//  IconsImageFrames
//
//  Created by Noura Alowayid on 29/10/1444 AH.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        Image("ADA")
            //.renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 300,height: 200)
            .clipped()
            .foregroundColor(Color.red)
            //.cornerRadius(150)
    }
}

struct ImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootcamp()
    }
}
