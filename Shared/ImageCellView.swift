//
//  ImageCellView.swift
//  ExplorerCoreData
//
//  Created by Runhua Huang on 2022/3/13.
//

import SwiftUI

struct ImageCellView: View {
    
    @State var imageData: ImageData
    
    var body: some View {
        Image(imageData.name)
            .resizable()
            .aspectRatio(1.618, contentMode: .fit)
    }
}

struct ImageCellView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCellView(imageData: ImageData(name: "cgirl"))
    }
}
