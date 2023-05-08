//
//  NewCardView.swift
//  HighOcean
//
//  Created by jisukwon on 2023/05/05.
//
import SwiftUI

struct NewCardView: View {
    var body: some View {
        Home()
    }
}

struct Home : View {
    
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 100
    @State var op : CGFloat = 0
    @State var cards = Cards().uncheckedCards
    
    var body : some View{
        NavigationView{
            VStack{
                Spacer()
                HStack(spacing: 30){
                    ForEach(cards){i in
                        CardView(card: i)
                        .offset(x: self.x)
                        .highPriorityGesture(DragGesture()
                        .onChanged({ (value) in
                                if value.translation.width > 0{
                                    self.x = value.location.x
                                }
                                else{
                                    self.x = value.location.x - self.screen
                                }
                            })
                            .onEnded({ (value) in
                                if value.translation.width > 0{
                                    if value.translation.width > ((self.screen - 80) / 2) && Int(self.count) != 0{
                                        self.count -= 1
                                        self.updateHeight(value: Int(self.count))
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                    else{
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                }
                                else{
                                    if -value.translation.width > ((self.screen - 80) / 2) && Int(self.count) !=  (self.cards.count - 1){
                                        
                                        self.count += 1
                                        self.updateHeight(value: Int(self.count))
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                    else{
                                        self.x = -((self.screen + 15) * self.count)
                                    }
                                }
                            })
                        )
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .offset(x: self.op)
                Spacer()
            }
            .background(Color("Secondary").edgesIgnoringSafeArea(.bottom))
            .navigationBarTitle("New Card View")
            .animation(.spring(), value: self.x)
            .onAppear {
                self.op = ((self.screen + 15) * CGFloat(self.cards.count / 2)) - (self.cards.count % 2 == 0 ? ((self.screen + 15) / 2) : 0)
                self.cards[0].show = true
            }
        }
    }
    func updateHeight(value : Int){
        for i in 0..<cards.count{
            cards[i].show = false
        }
        cards[value].show = true
    }
}

struct NewCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardView()
    }
}
