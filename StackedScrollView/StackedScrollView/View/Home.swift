//
//  Home.swift
//  StackedScrollView
//
//  Created by Aaron on 2024/5/19.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            StackedCards(items: items, stackedDisplayCount: 1, opacityDisplayCount: 0, itemHeight: 70) { item in
                CardView(item)
            }
            .padding(.bottom, 20)
            
            BottomActionBar()
        }
        .padding(20)
    }
    
    /// Card View
    @ViewBuilder
    func CardView(_ item: Item) -> some View {
        if item.logo.isEmpty {
            Rectangle()
                .fill(.clear)
        } else {
            HStack(spacing: 12) {
                Image(item.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.callout)
                        .fontWeight(.bold)
                    
                    Text(item.description)
                        .font(.caption)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(10)
            .frame(maxHeight: .infinity)
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 20))
        }
        
    }
    
    /// Bottom Action Bar
    @ViewBuilder
    func BottomActionBar() -> some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "flashlight.off.fill")
                    .font(.title3)
                    .frame(width: 35, height: 35)
            })
            .buttonStyle(.borderedProminent)
            .tint(.white.opacity(0.2))
            .buttonBorderShape(.circle)
            
            Spacer(minLength: 0)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "camera.fill")
                    .font(.title3)
                    .frame(width: 35, height: 35)
            })
            .buttonStyle(.borderedProminent)
            .tint(.white.opacity(0.2))
            .buttonBorderShape(.circle)
        }
    }
}

#Preview {
    ContentView()
}
