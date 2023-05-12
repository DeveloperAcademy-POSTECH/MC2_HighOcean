//
//  WeekButton.swift
//  HighOcean
//
//  Created by apple on 2023/05/11.
//

import SwiftUI

struct WeekButtonView: View {
    @Binding var week: Bool
    var weekName: String
    
    var body: some View {
        Button(action: {
            self.week.toggle()
        }) {
            ZStack(){
                Circle()
                    .fill(self.week ? Color("Accent") : Color.clear )
                    .opacity(0.1)
                Text(weekName)
                    .foregroundColor(self.week ? Color("Accent") : Color("Primary"))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
        }
        .frame(width: 40, height: 40)
    }
}

struct WeekButton_Previews: PreviewProvider {
    static var previews: some View {
        WeekButtonView(week: .constant(true), weekName: "일")
    }
}
