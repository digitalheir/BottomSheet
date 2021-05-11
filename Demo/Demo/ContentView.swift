//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2021-05-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
import BottomSheet

struct ContentView: View {
    
    @State private var isExpanded = false
    @State private var useTallerMinHeight = false
    @State private var useShorterMaxHeight = false
    @State private var maxHeight = BottomSheetHeight.available
    @State private var minHeight = BottomSheetHeight.points(150)
    @State private var sheetStyle = BottomSheetStyle.standard
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("").frame(height: 1)) {
                    Toggle("Is expanded", isOn: $isExpanded)
                    Toggle("Taller min height", isOn: $useTallerMinHeight)
                    Toggle("Shorter max height", isOn: $useShorterMaxHeight)
                }
                
                Section(header: Text("Styles").frame(height: 1)) {
                    styleButton("Standard", style: .standard)
                    styleButton("(Demo) Red", style: .red)
                    styleButton("(Demo) Green", style: .green)
                    styleButton("(Demo) Blue", style: .blue)
                    styleButton("(Demo) Larger Corner Radius", style: .round)
                }
                
            }
            .buttonStyle(PlainButtonStyle())
            .navigationTitle("Bottom Sheet Demo")
            .listStyle(InsetGroupedListStyle())
        }
        .bottomSheet(sheet)
    }
}

private extension ContentView {
    
    var sheet: some BottomSheetView {
        BottomSheet(
            isExpanded: $isExpanded,
            minHeight: useTallerMinHeight ? .points(300) : .points(150),
            maxHeight: useShorterMaxHeight ? .percentage(0.5) : .available,
            style: sheetStyle) {
            sheetContent
        }
    }
    
    var sheetContent: some View {
        List {
            ForEach(0..<100, id: \.self) {
                Text("\($0)")
            }.listRowBackground(sheetStyle.color)
        }
    }
    
    func styleButton(_ text: String, style: BottomSheetStyle) -> some View {
        Button(action: { sheetStyle = style }) {
            HStack {
                Text(text)
                Spacer()
            }.background(Color.white.opacity(0.0001))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}