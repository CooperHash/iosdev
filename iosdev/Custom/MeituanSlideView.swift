//
//  MeituanSlideView.swift
//  iosdev
//
//  Created by kai cooper on 9/18/23.
//

import SwiftUI

struct Item: Identifiable {
    var id: Int
    var offset: CGFloat
}

struct MeituanSlideView: View {
    @State var items: [Item] = (0..<5).map { Item(id: $0, offset: -CGFloat(($0 + 1) * 20)) }
    
    @GestureState private var ofset: CGFloat = .zero
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .frame(width: 80, height: 120) // 调整大小以适应项目4的一部分
                    .foregroundColor(.gray)
                ZStack {
                    ForEach(Array(items.enumerated()), id: \.element.id) { (index, item) in
                        let width = 80 + CGFloat(index) * 10
                        let height = 65 + CGFloat(index) * 10
                        
                        let scale = min(max(1 - abs(ofset) / width, 1.15), 1.2)
                        
                        ZStack {
                            Text("Item \(item.id)")
                            
                            
                        }
                        .frame(width: width, height: height)
                        .background(Color.white)
                        .border(Color.black, width: 1)
                        .offset(x: ofset - CGFloat((index + 1) * 20))
                        .scaleEffect(index == 4 ? 1.1 : scale)
                        .gesture(
                            DragGesture()
                                .updating($ofset){ dragValue,state,tranaction  in
                                    state = dragValue.translation.width
                                    print("changing")
                                }
                                .onEnded { value in
                                    print("change scroll end end\(value.translation.width)")
                                    let offset = value.translation.width
                                    let screenWidth = CGFloat(90)
                                    
                                    withAnimation {
                                        if offset < -screenWidth / 2 {
                                            items.append(items.removeFirst())
                                        }
                                        else if offset > screenWidth / 2 {
                                            items.insert(items.removeLast(), at: 0)
                                        }
                                    }
                                }
                        )
                    }
                    
                    
                }.offset(x: 110)
            }
            Spacer()
        }
    }
}

struct ItemView: View {
    var body: some View  {
        VStack {}.frame(width: 100, height: 50).background(Color.gray).border(Color.black, width: 1)
    }
}






#Preview {
    MeituanSlideView()
}
