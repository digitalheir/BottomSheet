//
//  BottomSheetHandle.swift
//  BottomSheet
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This is the thin, rounded handle that is added topmost in a
 `BottomSheet`. It has no built-in behavior.
 */
public struct BottomSheetHandle: View {
    @Binding private var isExpanded: Bool

    public init(isExpanded: Binding<Bool>, style: BottomSheetHandleStyle = .standard) {
        self.style = style
        self._isExpanded = isExpanded
    }
    
    private let style: BottomSheetHandleStyle
    
    public var body: some View {
        Button(action: { isExpanded.toggle() }, label: {
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: style.cornerRadius)
                        .fill(style.color)
                        .frame(width: style.size.width, height: style.size.height)
                        .padding()
                Spacer()
            }
        })
    }
}

struct BottomSheetHandle_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetHandle(isExpanded: Binding.constant(true))
    }
}
