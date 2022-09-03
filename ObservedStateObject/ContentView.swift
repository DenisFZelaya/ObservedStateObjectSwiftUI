//
//  ContentView.swift
//  ObservedStateObject
//
//  Created by David Canaca on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var counter: Int = 0
    var body: some View {
        VStack {
            Text("Contador: \(counter)")
                .bold()
                .font(.largeTitle)
                .padding()
            Button("Incrementar Contador") {
                counter += 1
            }
            ListVideos()
            Spacer()
        }
    }
}

struct ListVideos: View {
    @StateObject private var videoViewModel = VideoViewModel()
    
    var body: some View {
        NavigationView {
            List(videoViewModel.videosModel, id: \.self) { video in
                Text(video)
            }
            .navigationTitle("DFZ LIST VIDEOS")
            .navigationBarItems(leading:
                Button("Agregar", action: videoViewModel.addMoreTopics)
            )
            RemoveVideos(videoViewModel: videoViewModel)
        }
    }
}

struct RemoveVideos: View {
    @ObservedObject var videoViewModel: VideoViewModel
    
    var body: some View {
        Text("Remove Videos")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

final class VideoViewModel: ObservableObject {
    @Published var videosModel: [String] = []
    
    init(){
        videosModel = ["Aprende SwiftUI", "Aprende Go", "Aprende Swift"]
    }
    
    func addMoreTopics(){
        videosModel.append("Aprende NodeJS")
        videosModel.append("Aprender MF")
    }
}
