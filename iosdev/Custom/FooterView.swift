//
//  FooterView.swift
//  iosdev
//
//  Created by kai cooper on 9/18/23.
//

import SwiftUI

struct FooterView: View {
    @State private var focusedItem: Int?

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("首页")
                    .foregroundColor(focusedItem == 0 ? .black : .gray)
                    .onTapGesture {
                        focusedItem = 0
                        print(focusedItem)
                    }
                Spacer()
                Text("购物")
                    .foregroundColor(focusedItem == 1 ? .black : .gray)
                    .onTapGesture {
                        focusedItem = 1
                    }
                Spacer()
                Image(systemName: "plus")
                    .frame(width: 20, height: 20)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(Color.red)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .onTapGesture {
                        // Actions for plus button
                    }
                Spacer()
                Text("消息")
                    .foregroundColor(focusedItem == 2 ? .black : .gray)
                    .onTapGesture {
                        focusedItem = 2
                    }
                Spacer()
                Text("我")
                    .foregroundColor(focusedItem == 3 ? .black : .gray)
                    .onTapGesture {
                        focusedItem = 3
                    }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width)
            VStack {
                EmptyView()
            }
            .frame(height: 5)
        }
    }
}

#Preview {
    FooterView()
}
