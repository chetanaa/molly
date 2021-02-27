//
//  SpeechRecognizer.swift
//  VoiceRecorderChetana
//
//  Created by Arakanakere, Chetana on 24/02/21.
//

import Foundation
import Speech
/*
func requestTrabscibePermission() {
    SFSpeechRecognizer.requestAuthorizatio { [unowned self] authStatus in
        DispatchQueue.main.async {
            if authStatus == .authorized {
                print("Good to go!")
            } else {
                print("Transcription permission was declined")
            }
        }
    }
}

func transcribeAudio(url: URL) {
    let recognizer = SFSpeechRecognizer()
    let request = SFSpeechURLRecognitionRequest(url: url)
    
    recognizer?.recognitionTask(with: request) { [unonwed self] (result, error) in
        gaurd let result = result else {
            print("there was an error: \(error!)")
            return
        }
        if result?.isFinal {
            print(result?.bestTranscription.formattedString)
        }
    }
}
*/
