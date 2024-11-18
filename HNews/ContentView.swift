//
//  ContentView.swift
//  HNews
//
//  Created by Mohamed Selim on 04/11/2024.

import SwiftUI

struct ContentView: View {

    @ObservedObject var networkManager = NetworkManager()

    init() {
               UINavigationBar.appearance().barTintColor = UIColor.green 
               UINavigationBar.appearance().tintColor = UIColor.white 
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25),
                                                            NSAttributedString.Key.foregroundColor: UIColor.systemBlue]

    }

    var body: some View {
        NavigationStack {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                            .font(.headline)
                            .foregroundColor(.blue).opacity(0.8)

                            .frame(width: 50, alignment: .leading)

                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.black).opacity(0.8)

                            if let url = post.url {
                                Text(url)
                                    .font(.footnote)
                                    .foregroundColor(.gray)

                            }
                        }
                    }
                    .padding(.vertical, 5) 
                }
            }
            .navigationTitle("Hacker News")
            .navigationBarTitleDisplayMode(.inline)


        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}


#Preview {
    ContentView()
}

