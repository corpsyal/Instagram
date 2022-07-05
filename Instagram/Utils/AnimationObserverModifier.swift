//
//  AnimationObserverModifier.swift
//  Instagram
//
//  Created by Anthony Lahlah on 05.07.22.
//

import SwiftUI

public struct AnimationObserverModifier<Value: VectorArithmetic>: ViewModifier, Animatable {
    // this is the view property that drives the animation - offset, opacity, etc.
    private let observedValue: Value
    private let onChange: ((Value) -> Void)?
    private let onComplete: (() -> Void)?
    
    // SwiftUI implicity sets this value as the animation progresses
    public var animatableData: Value {
        didSet {
            notifyProgress()
        }
    }
    
    public init(for observedValue: Value,
                onChange: ((Value) -> Void)?,
                onComplete: (() -> Void)?) {
        self.observedValue = observedValue
        self.onChange = onChange
        self.onComplete = onComplete
        animatableData = observedValue
    }
    
    public func body(content: Content) -> some View {
        content
    }
    
    private func notifyProgress() {
        DispatchQueue.main.async {
            onChange?(animatableData)
            if animatableData == observedValue {
                onComplete?()
            }
        }
    }
}

public extension View {
    func animationObserver<Value: VectorArithmetic>(for value: Value,
                                                    onChange: ((Value) -> Void)? = nil,
                                                    onComplete: (() -> Void)? = nil) -> some View {
        self.modifier(AnimationObserverModifier(for: value,
                                                onChange: onChange,
                                                onComplete: onComplete))
    }
}
