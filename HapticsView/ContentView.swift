//
//  ContentView.swift
//  HapticsView
//
//  Created by Seogun Kim on 2021/06/29.
//

import SwiftUI


class HapticManager {
    
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "iphone.radiowaves.left.and.right").foregroundColor(.orange)
                    Text("Notification type".uppercased())
                }
                .font(.title.bold())
                Button("warning") { HapticManager.instance.notification(type: .warning) }
                Button("error") { HapticManager.instance.notification(type: .error) }
                Button("success") { HapticManager.instance.notification(type: .success) }
                
                //구분선
                Line().stroke(style: StrokeStyle(lineWidth: 1, dash: [5])).frame(height: 2)
                    .padding(.vertical, 30)
                
                Group { //stack이 10개가 넘어가기 때문에 group 적용
                    HStack {
                        Image(systemName: "iphone.radiowaves.left.and.right").foregroundColor(.orange)
                        Text("impact style".uppercased())
                    }
                        .font(.title.bold())
                    Button("heavy") { HapticManager.instance.impact(style: .heavy) }
                    Button("light") { HapticManager.instance.impact(style: .light) }
                    Button("medium") { HapticManager.instance.impact(style: .medium) }
                    Button("rigid") { HapticManager.instance.impact(style: .rigid) }
                    Button("soft") { HapticManager.instance.impact(style: .soft) }
                }
            }
            .navigationBarTitle("서근개발노트")
        }
    }
}

//구분선 Shape
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HapticsView()
    }
}
