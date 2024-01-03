//
//  ContentView.swift
//  UserList
//
//  Created by Elver Mayta Hernández on 3/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white.ignoresSafeArea()
                
                List(viewModel.user ?? [], id: \.id){user in
                    HStack{
                        AsyncImage(url: URL(string: user.avatarURL )){image in
                            image .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                        }placeholder: {
                            Circle().foregroundColor(.teal)
                        }
                        .frame(width: 50,height: 50)
                        VStack(alignment: .leading){
                            Text(user.login.capitalized)
                                .font(.headline)
                            Text(user.url )
                                .font(.subheadline)
                        }
                    }
                }
                    .listStyle(.plain)
                    .background(Color.white)
                    .listRowInsets(EdgeInsets())
                    .navigationTitle("List Users")
                    
                    if viewModel.isloading{
                        LoaderView()
                    }
                }
        }
        
        .padding()
        .task {
            await viewModel.getUser()
        }
        .alert(isPresented: $viewModel.shoAlert){
            return Alert(title: Text("Error"),message: Text(viewModel.userError?.errorDescription ?? ""))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
