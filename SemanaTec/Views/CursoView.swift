//
//  CursoView.swift
//  Semana Tec
//
//  Created by Astrid Quintero Quevedo on 23/10/24.
//

import SwiftUI

struct CursoView: View {
    var porcen: CGFloat = 0.75 // Un valor entre 0 y 1
    var name: String
    var code: String
    var body: some View {
        VStack {
            Text(name)
                .font(.title)
            HStack {
                
                VStack {
                    
                    HStack{
                        Text(code)
                            .padding(.leading)
                            .background(Color.yellow)
                        Spacer()
                    }
                    HStack{
                        Text("Tareas recientes")
                            .padding(.leading)
                        Spacer()
                    }
                    HStack {
                        HStack{
                            Image(systemName: "book").padding(.leading);
                            Text("Actividad en Clase Pat")
                                .background(Color.white)
                                .padding(.leading)
                            Spacer()
                            
                        }
                    }
                    
                    
                }
                
                
                VStack{
                    ZStack {
                        // Círculo de fondo (el fondo de la gráfica)
                        Circle()
                            .stroke(lineWidth: 20)
                            .opacity(0.3)
                            .foregroundColor(Color.gray)
                        
                        // Círculo de progreso (la parte que se llena)
                        Circle()
                            .trim(from: 0.0, to: CGFloat(porcen))
                            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.blue)
                            .rotationEffect(Angle(degrees: 270))  // Rotar para que empiece desde arriba
                            .animation(.linear, value: porcen)
                        
                        // Texto que muestra el porcentaje
                        Text(String(format: "%.0f %%", min(porcen, 1.0) * 100.0))
                            .font(.subheadline)
                            .bold()
                            .padding()
                    }.frame(width: 80, height: 80)
                    
                    Text("Max. Calificación")
                }
            }
            
        }
        .background(Color(.systemYellow))
        .cornerRadius(8)
        .padding()
        .frame(width: .infinity, height: 100 )
    }
    
}
