//
//  AudioRecorder.swift
//  VoiceRecorderChetana
//
//  Created by Arakanakere, Chetana on 17/02/21.
//
import SwiftUI
import Foundation
import Combine
import AVFoundation
import Speech

class AudioRecorder: NSObject,   ObservableObject {
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    var audioRecorder : AVAudioRecorder!
    var recordings = [Recording]()
    var recording = false {
        didSet {
            objectWillChange.send(self)
        }
        
    }
    
    
    func startRecording(){

        let recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("failed to setup recording session")
            
        }
        
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at' _HH:mm:ss")).m4a")
        let settings = [
                    AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                    AVSampleRateKey: 12000,
                    AVNumberOfChannelsKey: 1,
                    AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
                ]
        
        do {
                    audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
                    audioRecorder.record()

                    recording = true
                } catch {
                    print("Could not start recording")
                }
    }
    
    func stopRecording() {
            audioRecorder.stop()
            recording = false
            fetchRecordings()
        }
    
    func fetchRecordings() {
        recordings.removeAll()
        let fileManager = FileManager.default
        
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
           
        let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
        
        for audio in directoryContents {
            let recording = Recording(fileURL: audio, createdAt: getCreationDate(for: audio))
            recordings.append(recording)
         //   recordings.insert(recording, at:0)
          
            recordings.sort(by: {$0.createdAt.compare($1.createdAt) == .orderedDescending})
            objectWillChange.send(self)
    
            
        }
        
    }
    
    override init() {
        super.init()
        fetchRecordings()
    }
    
    
    
}

