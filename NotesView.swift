//
//  NotesView.swift
//  Notes
//
//  Created by SwiftieDev on 10/01/2024.
//  MARK: SwiftieDev

import SwiftUI

struct NotesView: View {
    @State private var selectedColor: backgroundTextColor = .blue
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("one. two. ")
                    .foregroundColor(.gray)
                    .font(.largeTitle) +
                Text("focus!")
                    .font(.largeTitle)
                
                Image(systemName: "plus")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.black)
                    .background(.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
                HStack {
                    ExtractedNoteView(icon: "case", text: "work", background: .green)
                    ExtractedNoteView(icon: "person", text: "personal", background: .purple)
                }
                
                HStack {
                    ExtractedNoteView(icon: "book.closed", text: "reading", background: .brown)
                    ExtractedNoteView(icon: "moon", text: "sleep", background: .blue)
                }
            }
            .padding(25)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Your Notes")
                        .font(.title)
                        .padding()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "calendar")
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {} label: {
                        Image(systemName: "house")
                            .foregroundColor(.black)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Button {} label: {
                        Image(systemName: "chart.bar")
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button {} label: {
                        Image(systemName: "gearshape")
                            .foregroundColor(.black)
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        NotesView()
    }
}

enum backgroundTextColor: String, CaseIterable, Identifiable {
    case blue
    case brown
    case green
    case yellow
    case indigo
    case red
    case cyan
    
    var id: Self { self }
    
    var color: Color {
        switch self {
        case .blue:
            return .blue
        case .brown:
            return .brown
        case .green:
            return .green
        case .yellow:
            return .yellow
        case .indigo:
            return .indigo
        case .red:
            return .red
        case .cyan:
            return .cyan
        }
    }
}

struct ExtractedNoteView: View {
    @State private var selectedColor: backgroundTextColor = .blue
    
    let icon: String
    let text: String
    let background: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .padding()
                    .background(selectedColor.color.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
            }
            Spacer()
            Text(text)
                .font(.title)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(selectedColor.color.opacity(0.2))
        .cornerRadius(15)
        .contextMenu {
            Picker("Select a color", selection: $selectedColor) {
                ForEach(backgroundTextColor.allCases) { item in
                    Label(item.rawValue.capitalized, systemImage: "circle")
                        .tint(item.color)
                }
            }
            .paletteSelectionEffect(.symbolVariant(.fill))
            .pickerStyle(.palette)
        }
    }
}
