//
//  RecordingsList.swift
//  VoiceRecorderChetana
//
//  Created by Arakanakere, Chetana on 17/02/21.
//

import SwiftUI


struct RecordingsList: View {
    
    @ObservedObject var audioRecorder: AudioRecorder
        
    var body: some View {
        List{
            ForEach(audioRecorder.recordings, id: \.createdAt) {
                recording in RecordingRow(audioURL: recording.fileURL)
            }
        }
    }
}

struct RecordingsList_Previews: PreviewProvider {
    static var previews: some View {
        RecordingsList(audioRecorder:AudioRecorder())
    }
}

struct RecordingRow: View {
    
    var audioURL : URL
    
    @ObservedObject var audioPlayer = AudioPlayer()
    var body: some View {
        HStack {
            Text("\(audioURL.lastPathComponent)")
            Spacer()
            
            if audioPlayer.isPlaying == false {
               /* Button(action: {
                    print("Start playing audio")
                }) {
                    Image(systemName: "play.circle").imageScale(.large)
                    
                    
                
            }*/
                
                Button(action: {
                    self.audioPlayer.startPlayback(audio: self.audioURL)
                }) {
                    Image(systemName: "play.circle").imageScale(.large)
                }
            } else {
              /*  Button(action: {
                    print("Stop playing audio")
                }) {
                    Image(systemName: "stop.fill").imageScale(.large)
                }*/
                
                Button(action: {
                    self.audioPlayer.stopPlayback()
                }) {
                    Image(systemName: "stop.fill").imageScale(.large)
                }
            }
    }
}
}

