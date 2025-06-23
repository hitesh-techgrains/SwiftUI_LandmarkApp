import Foundation
import SwiftUI

struct CustomSearchBar: View {
    @Binding var searchText: String
    @Binding var sortOrder: SortOrder

    var body: some View {
        HStack{
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)

                TextField("Search...", text: $searchText)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)

                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
                
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            
            Menu {
                Button {
                    sortOrder = .az
                }
                label: {
                    Label("A to Z", systemImage: sortOrder == .az ? "checkmark" : "")
                }
                Button {
                    sortOrder = .za
                } label: {
                    Label("Z to A", systemImage: sortOrder == .za ? "checkmark" : "")
                }
            }
            label: {
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .font(.title2)
                    .frame(width: 40, height:40)
            }

        }
        .padding(.leading)
        
    }
}
