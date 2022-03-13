//
//  ImageModelData.swift
//  ExplorerCoreData
//
//  Created by Runhua Huang on 2022/3/13.
//

import Foundation

final class ImageModelData: ObservableObject {
    @Published var allImage = [
        ImageData(name: "ccat")
    ]
}
