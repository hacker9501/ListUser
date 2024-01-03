//
//  LoaderView.swift
//  UserList
//
//  Created by Elver Mayta Hernández on 3/01/24.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        VStack{
            ProgressView()
                .scaleEffect(3.0, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .padding()
            Text("Cargando...")
                .font(.headline)
                .padding()
        }
        
    }
}

#Preview {
    LoaderView()
}
