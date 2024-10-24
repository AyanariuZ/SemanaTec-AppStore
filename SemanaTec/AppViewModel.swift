//
//  AppViewModel.swift
//  SemanaTec
//
//  Created by Rafael Alejandro Rivas González on 22/10/24.
//

import Foundation

class AppViewModel: ObservableObject {
    let token: String = "14328~ACkfv3QvxPP7XG3DMVV8WFVLEGCFWRKPhkfQNAZ9fQBJzzuNchKPM3yvRCfRuEBG"
    var coursesLoaded: Bool = false
    @Published var courses : [Course] = []
    
    func fetchCourses() async throws {
        let url = URL(string: "https://experiencia21.tec.mx/api/v1/courses")
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        let courses = try JSONDecoder().decode([Course].self, from: data)
        
        //Clean courses
        DispatchQueue.main.async {
            for course in courses {
                if(course.course_code != nil){
                    self.courses.append(course)
                }
            }
            print(courses)
            self.coursesLoaded = true
            
        }
        try await fetchAssigments()
    }
    
    
    func fetchAssigments() async throws {
        for i in 0..<courses.count {
            var course = courses[i]
            let course_code = course.id
            let url = URL(string: "https://experiencia21.tec.mx/api/v1/courses/\(String(describing: course_code))/assignments")
            var request = URLRequest(url: url!)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            let (data, reponse) = try await URLSession.shared.data(for: request)
            print(reponse)
            print(data)
            let assignments = try JSONDecoder().decode([Assignment].self, from: data)
                course.assigments = assignments
            print(assignments)
            DispatchQueue.main.async {
                self.courses[i] = course
            }
            
        }
    }
    
}
