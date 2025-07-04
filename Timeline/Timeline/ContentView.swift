//
//  ContentView.swift
//  Timeline
//
//  Created by Aaron on 2025/7/4.
//

import SwiftUI

struct ContentView: View {
    @State private var timelineItems: [TimelineItem] = [
        TimelineItem(time: "9:00 AM", title: "Project Started", subtitle: "New mobile app development began", color: .blue, icon: "play.circle.fill"),
        TimelineItem(time: "11:30 AM", title: "Design Review", subtitle: "UI/UX mockups approved by team", color: .purple, icon: "paintbrush.fill"),
        TimelineItem(time: "2:15 PM", title: "Code Review", subtitle: "First sprint code review completed", color: .blue, icon: "checkmark.circle.fill"),
        TimelineItem(time: "4:00 PM", title: "Testing Phase", subtitle: "QA testing and bug fixes started", color: .orange, icon: "ladybug.circle.fill"),
        TimelineItem(time: "6:30 PM", title: "Deployment", subtitle: "App deployed to staging environment", color: .red, icon: "cloud.fill"),
        TimelineItem(time: "8:00 PM", title: "Launch Ready", subtitle: "Final preparations for app store release", color: .mint, icon: "airplane.circle.fill"),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(Array(timelineItems.enumerated()), id: \.element.id) { index, item in
                        TimelineRowView(item: item, isLast: index == timelineItems.count - 1)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
            .navigationTitle("Project Timeline")
            .navigationBarTitleDisplayMode(.large)
            .background(
                LinearGradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
        }
    }
}

struct TimelineItem: Identifiable {
    let id = UUID()
    let time: String
    let title: String
    let subtitle: String
    let color: Color
    let icon: String
}

struct TimelineRowView: View {
    let item: TimelineItem
    let isLast: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // left side
            VStack(spacing: 0) {
                // colored circle icon
                ZStack {
                    Circle()
                        .fill(item.color)
                        .frame(width: 40, height: 40)
                        .shadow(color: item.color.opacity(0.3), radius: 4, x: 0, y: 1)
                    	
                    Image(systemName: item.icon)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color.white)
                }
                
                // line
                if !isLast {
                    Rectangle()
                        .fill(item.color.opacity(0.3))
                        .frame(width: 2, height: 60)
                        .padding(.top, 8)
                }
            }
            
            // right side
            VStack(alignment: .leading, spacing: 8) {
                // time
                HStack {
                    Text(item.time)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(item.color)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(item.color.opacity(0.15))
                        .cornerRadius(12)
                    
                    Spacer()
                }
                
                // title and subtitle
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    
                    Text(item.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.leading)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 12)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.background)
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                )
            }
            .padding(.bottom, isLast ? 0 : 20)
        }
    }
}

#Preview {
    ContentView()
}
