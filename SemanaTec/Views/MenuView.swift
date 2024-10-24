//
//  MenuView.swift
//  Semana Tec
//
//  Created by Astrid Quintero Quevedo on 23/10/24.
//


//
//  ContentView.swift
//  proyecto
//
//  Created by Alumno on 22/10/24.
//

import SwiftUI
import Charts





struct MenuView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        HStack {
            Text("Cursos")
                .font(.largeTitle)
                .padding()
        }.onAppear {
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
        ScrollView{
            if(!viewModel.courses.isEmpty){
                ForEach(viewModel.courses) { course in
                    CursoView(name: course.name!, code: course.course_code!)
                        .padding(EdgeInsets(top: 40, leading: 0, bottom: 40, trailing: 0))
                    
                }
            }
        }
        
        
        
        
                
            
        
    }
}

        
    
    
    
        

#Preview {
    MenuView() .environmentObject(AppViewModel())
}
