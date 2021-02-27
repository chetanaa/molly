//
//  VoiceRecorderChetanaApp.swift
//  VoiceRecorderChetana
//
//  Created by Arakanakere, Chetana on 17/02/21.
//

import SwiftUI

@main
struct VoiceRecorderChetanaApp: App {
    var body: some Scene {
        WindowGroup {
            
            ContentView(audioRecorder: AudioRecorder())
        }
    }
}
