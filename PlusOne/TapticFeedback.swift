//
//  TapticFeedback.swift
//  PlusOne
//
//  Created by Tobias Ruano on 15/04/2019.
//  Copyright © 2019 Tobias Ruano. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

class TapticEffectsService {
    
    // MARK: Public type methods - Haptic Feedback
    
    /// Performs haptic feedback - impact.
    static func performFeedbackImpact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        if #available(iOS 10.0, *) {
            let mediumImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: style)
            mediumImpactFeedbackGenerator.prepare()
            mediumImpactFeedbackGenerator.impactOccurred()
        }
    }
    
    /// Performs haptic feedback - notification.
    static func performFeedbackNotification(type: UINotificationFeedbackGenerator.FeedbackType) {
        if #available(iOS 10.0, *) {
            let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
            notificationFeedbackGenerator.prepare()
            notificationFeedbackGenerator.notificationOccurred(type)
        }
    }
}
