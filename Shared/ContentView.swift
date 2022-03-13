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

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ImageCard.name, ascending: true)],
        animation: .default)
    
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
#if os(iOS)
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
#endif
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = ImageCard(context: viewContext)
            newItem.id = UUID()
            let randomNumber = Int.random(in: 0..<imageName.count)
            newItem.name = imageName[randomNumber]

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
