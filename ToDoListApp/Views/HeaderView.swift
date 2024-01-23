//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let degree: Double
    let bgColor: Color
    var body: some View {
        ZStack{
                RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(bgColor)
                .rotationEffect(Angle(degrees: degree))
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
            }
            .padding(.top , 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "To Do List", subTitle: "Get Things Done", degree: 15, bgColor: Color.pink)
}
