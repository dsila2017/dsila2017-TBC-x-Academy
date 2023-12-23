//
//  dragView.swift
//  Gestures
//
//  Created by David on 12/23/23.
//

import SwiftUI

struct DragView: View {
    @State var offset = CGSize.zero
    @GestureState var updateOffset = CGSize.zero
    
    var body: some View {
        Image("Drag")
            .resizable()
            .frame(width: 170, height: 200)
            .offset(x: updateOffset.width + offset.width, y: updateOffset.height + offset.height)
            .gesture(
                DragGesture()
                    .updating($updateOffset, body: { value, state, _ in
                        state = value.translation
                    })
                    .onEnded {
                        offset.width += $0.translation.width
                        offset.height += $0.translation.height
                    }
            )
    }
}

#Preview {
    DragView()
}
