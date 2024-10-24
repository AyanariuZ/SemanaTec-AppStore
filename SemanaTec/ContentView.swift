//
//  ContentView.swift
//  SemanaTec
//
//  Created by Rafael Alejandro Rivas González on 22/10/24.
//

import SwiftUI

var porcent: CGFloat = 0.55

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        TabView{
            
            Tab("Cursos",systemImage: "book.circle.fill"){
                
            }
            Tab("Settings",systemImage: "gearshape"){
                
            }
        }
        .onAppear {
            Task{
                do{
                    try await viewModel.fetchCourses()
                    try await viewModel.fetchAssigments()
                }
                catch let error{
                    print(error)
                }
            }
            
            
        }
        
    }
}

#Preview {
    ContentView() .environmentObject(AppViewModel())
}
