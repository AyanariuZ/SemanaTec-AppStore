//
//  DetailView.swift
//  Semana Tec
//
//  Created by Rafael Alejandro Rivas González on 23/10/24.
//

import SwiftUI
import Charts

struct DetailView: View {
    var body: some View {
        
        VStack {
            Text("De la idea a la App Store").bold().font(.largeTitle)
            ZStack {
                // Círculo de fondo (el fondo de la gráfica)
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                
                // Círculo de progreso (la parte que se llena)
                Circle()
                    .trim(from: 0.0, to: CGFloat(porcent))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.yellow)
                    .rotationEffect(Angle(degrees: 270))  // Rotar para que empiece desde arriba
                    .animation(.linear, value: porcent)
                
                // Texto que muestra el porcentaje
                Text(String(format: "%.0f %%", min(porcent, 1.0)*100.0))
                    .font(.largeTitle)
                    .bold()
            }
            .padding()
            Text("Agrega el la rúbrica de calificación").bold().font(.title2).padding()
            Button(action: {print("Rubrica Subida")}) {
                Label("Subir Rubrica Personal", systemImage: "plus.rectangle.on.folder.fill")
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
            }
        }
        .padding()
        
    }
}

#Preview {
    DetailView()
}
