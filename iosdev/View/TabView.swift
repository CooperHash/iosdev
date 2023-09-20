//
//  TabView.swift
//  iosdev
//
//  Created by kai cooper on 9/13/23.
//

import SwiftUI

struct _TabView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView {
            Text("首页")
                .tabItem {
                    HStack {
                        
                    }.frame(width: 100, height: 100).foregroundColor(Color.blue)
                }
            
            Text("消息")
                .tabItem {
                    Image(systemName: "message")
                    Text("消息")
                }
            
            Text("设置")
                .tabItem {
                    Image(systemName: "gear")
                    Text("设置")
                }
        }
        
    }
}


#Preview {
    _TabView()
}
