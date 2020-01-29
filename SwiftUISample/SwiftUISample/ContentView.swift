//
//  ContentView.swift
//  SwiftUISample
//
//  Created by jungwook on 2020/01/29.
//  Copyright © 2020 jungwook. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    let array = ["John","Lena","Steve","Chris","Catalina"]
    
    var body: some View {
        NavigationView{
            List{
                TextField("Type your search",text: $searchText)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self){searchText in
                    Text(searchText)
                }
            }
            .navigationBarTitle(Text("Search"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
