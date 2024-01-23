//
//  TLButton.swift
//  ToDoListApp
//
//  Created by Sonoma on 23/01/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let bgColor: Color
    let action : () -> Void
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(bgColor)
                Text(title)
                    .foregroundStyle(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", bgColor: Color.pink){
        //action
    }
}
