//
//  ContentView.swift
//  VoiceRecorderChetana
//
//  Created by Arakanakere, Chetana on 17/02/21.
//

import SwiftUI
import Foundation
import Combine
import AVFoundation


struct ContentView: View {
    
    @ObservedObject var audioRecorder : AudioRecorder
    
    var body: some View {
        
        NavigationView {
         
            VStack {
 
                RecordingsList(audioRecorder:AudioRecorder())
                  
               
                if audioRecorder.recording == false {
                        
                       Button(action: {self.audioRecorder.startRecording()}) {
                                                Image(systemName: "circle.fill").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width:100, height: 100).clipped().foregroundColor(.green).padding(.bottom, 40)
                                                    //...
                                            }
                } else {
                    
                    Button(action: {self.audioRecorder.stopRecording()}) {
                        Image(systemName: "circle.fill").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width:100, height: 100).clipped().foregroundColor(.red).padding(.bottom, 40)
                    }
                }
            }
            .navigationBarTitle("Howlers")
            .listStyle(InsetGroupedListStyle())

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audioRecorder: AudioRecorder())
        
    }
     
}

