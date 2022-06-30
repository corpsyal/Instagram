//
//  RefreshableScrollView.swift
//  Instagram
//
//  Created by Anthony Lahlah on 23.06.22.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    public typealias UIView = UIActivityIndicatorView
    public var isAnimating: Bool = true
    public var configuration = { (indicator: UIView) in }
    
    // optional
    // run each parent view rerender
    public init(isAnimating: Bool, configuration: ((UIView) -> Void)? = nil) {
        self.isAnimating = isAnimating
        if let configuration = configuration {
            self.configuration = configuration
        }
    }
    
    // run only one time
    public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView {
        return UIView()
    }
    
    // run when one propertie changes
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}

struct PositionTestPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

private enum RefreshState {
  case waiting, loading
}

private let RefreshNamedSpace: String = "RefreshableScroll"

struct RefreshableScrollView<Content: View>: View {
    
    let showsIndicators: Bool
    let content: Content
    let onRefresh: ((() -> Void)?) -> Void
    @State private var state: RefreshState = .waiting
    @State private var height: CGFloat = 0
    @State private var minHeight: CGFloat = 0
    @State private var opacity: Double = 0
    private let THRESOLD: CGFloat = 50
    
    init(@ViewBuilder content: () -> Content) {
        self.showsIndicators = true
        self.content = content()
        self.onRefresh = { _ in }
    }
    
    init(showsIndicators: Bool = true, onRefresh: @escaping ((() -> Void)?) -> Void, @ViewBuilder content: () -> Content) {
        self.showsIndicators = showsIndicators
        self.onRefresh = onRefresh
        self.content = content()
    }
    
    var body: some View {
        ScrollView(showsIndicators: showsIndicators) {
            GeometryReader { geo in
                Spacer()
                    .frame(height: 0)
                    .preference(key: PositionTestPreferenceKey.self, value: geo.frame(in: .named(RefreshNamedSpace)).minY)
            }.frame(height: 0)
            
            ActivityIndicator(isAnimating: state == .loading, configuration: { $0.hidesWhenStopped = false })
                .frame(height: height)
                .frame(minHeight: state != .waiting ? THRESOLD : minHeight)
                .frame(maxWidth: .infinity)
                .opacity(state == .waiting ? opacity : 1)
            
            content
        }
        .coordinateSpace(name: RefreshNamedSpace)
        .onPreferenceChange(PositionTestPreferenceKey.self) { y in
            if y < 0 { return }
            
            height = y
            opacity = (y / 100) * 2.3
            
            if y >= THRESOLD && state == .waiting {
                state = .loading
                refresh()
            }
            
        }
        
        
    }
    
    private func refresh(){
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        state = .loading
        onRefresh { afterRefresh() }
    }
    
    private func afterRefresh(){
        withAnimation { state = .waiting }
    }
}

