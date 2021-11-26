//
//  Home.swift
//  UI-339
//
//  Created by nyannyan0328 on 2021/10/22.
//

import SwiftUI

struct Home: View {
    
    @State var currentTab : Int = 1
   
    var body: some View {
        
        TabView{
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                let offset = proxy.frame(in: .global).minX
                
    
                
                let scale = 1 + (offset / size.width)
                TabView(selection:$currentTab){
                    
                    ForEach(1...5,id:\.self){index in
                        
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .cornerRadius(1)
                            .rotationEffect(.init(degrees: -90))
                            .ignoresSafeArea()
                            .tag(index)
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .rotationEffect(.init(degrees: 90))
                .frame(width: size.height)//double widht
                .frame(width: size.width)
                .scaleEffect(scale >= 0.88 ? scale : 0.88,anchor: .center)
                .offset(x: -offset)
                .blur(radius: (1 - scale) * 20)
                        
            }
            .ignoresSafeArea()
            .background(.black)
            
            
           detailView()
                .ignoresSafeArea()
           
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea()
        
        
    }
    
    @ViewBuilder
    func detailView()->some View{
        
        VStack(spacing:20){
            
            Text("Datails")
                .font(.title.bold())
                .foregroundColor(.white)
                .frame(maxWidth: .infinity,alignment: .leading)
              
            
            
            Image("p\(currentTab)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .cornerRadius(20)
                .padding(.vertical)
            
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Dark Soul")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                
                Text("By Roki")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,30)
            
            
            Button {
                
            } label: {
                
                
                Text("Down load Image")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white,lineWidth: 1.5)
                    
                    )
                   
            }
            .padding(15)
            
            Button {
                
            } label: {
                
                
                Text("Report load Image")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .frame(maxWidth: .infinity)
                    .background(
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.red,style: StrokeStyle(lineWidth : 1)))}
            
            
            .padding(15)
        

          
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top,getSafeArea().top)
        .padding(.leading,15)
        .background(Color("bg"))
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
