//
//  ContentView.swift
//  Shared
//
//  Created by Runhua Huang on 2022/3/13.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    let imageName = ["ccat", "cgirl", "cforest", "cmoon", "cdog"]
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // @FetchRequest
    // 卡片的排序按.createTime来，
    // ascending: false表示最新的在前
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ImageCard.createTime, ascending: false)], animation: .linear)
    
     private var imageCards: FetchedResults<ImageCard>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(imageCards) { image in
                    ImageCellView(imageCard: image)
                }
                .onDelete(perform: deleteItems)
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
            .navigationTitle("Cards")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = ImageCard(context: viewContext)
            newItem.id = UUID()
            newItem.createTime = Date()
            newItem.name = imageName.randomElement()!

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { imageCards[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
