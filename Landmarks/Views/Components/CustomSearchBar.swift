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
        }
        .padding(.leading)
        
    }
}
