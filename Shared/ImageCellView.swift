//
//  ImageCellView.swift
//  ExplorerCoreData
//
//  Created by Runhua Huang on 2022/3/13.
//

import SwiftUI

struct ImageCellView: View {
    
    @State var imageCard: ImageCard
    
    var body: some View {
        Image(imageCard.name ?? "ccat")
            .resizable()
            .aspectRatio(1.618, contentMode: .fit)
    }
}

struct ImageCellView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        ImageCellView(imageCard: ImageCard(context: context))
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
