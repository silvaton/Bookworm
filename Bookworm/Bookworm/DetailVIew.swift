//
//  DetailView.swift
//  Bookworm
//
//  Created by Ton Silva on 14/7/23.
//

import SwiftUI

struct DetailVIew: View {
    let book: Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss)  var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
            
            if let date = book.date {
                let newDate = date.formatted(date: .abbreviated, time: .omitted)
                Text("Book added on \(newDate)")
                    .padding()
            }
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this Book", systemImage: "trash")
            }
        }
    }
    
    
    func deleteBook() {
        moc.delete(book)
        
        try? moc.save()
        dismiss()
    }
}

//struct DetailVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailVIew()
//    }
//}
