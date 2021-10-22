//
//  BackgroundView.swift
//  Elseweather
//
//  Created by Ярослав on 19.10.2021.
//

import SwiftUI

struct BackgroundView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var backgroundImage: Image?
    
    var body: some View {
        
        if Session.shared.appearance == Appearance.minimal {
            Color.customBackground(for: colorScheme)
        } else {
            backgroundImage?
                .resizable()
                .scaledToFill()
                .opacity(backgroundOpacity)
                .transition(AnyTransition.opacity.animation(.easeOut(duration: 0.75)))
                .id(UUID())
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView().preferredColorScheme(.dark)
    }
}