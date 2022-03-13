//
//  ContentView.swift
//  Shared
//
//  Created by Runhua Huang on 2022/3/13.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var imageModelData: ImageModelData
    
    let imageName = ["ccat", "cgirl", "cforest", "cmoon", "cdog"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(imageModelData.allImage) { image in
                    ImageCellView(imageData: image)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    private func addItem() {
        let randomNumber = Int.random(in: 0..<imageName.count)
        print(randomNumber)
        let newImageData = ImageData(name: imageName[randomNumber])
        imageModelData.allImage.append(newImageData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ImageModelData())
    }
}
