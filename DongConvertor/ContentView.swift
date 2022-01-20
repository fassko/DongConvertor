//
//  ContentView.swift
//  DongConvertor
//
//  Created by Kristaps Grinbergs on 12/09/2021.
//

import SwiftUI

struct ContentView: View {
  @State var vietnameseDong = ""
  @State var eur = ""
  
  var body: some View {
    VStack(spacing: 0) {
      ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
        Color.red
          .opacity(0.3)
          .edgesIgnoringSafeArea(.all)
        
        VStack {
          Spacer()
          
          HStack(spacing: 20) {
            Image("vietnam-flag")
              .resizable()
              .scaledToFit()
              .frame(height: 80)
            
            VStack(alignment: .leading) {
              Text("VDN")
                .font(.largeTitle.weight(.semibold))
              
              Text("Vietnamese Dong")
                .font(.title3)
              
              TextField("VDN", text: $vietnameseDong)
                .font(.largeTitle)
                .minimumScaleFactor(0.2)
                .frame(minHeight: 45)
                .foregroundColor(.black)
                .keyboardType(.decimalPad)
            }
            .foregroundColor(.black)
          }
          .padding(.bottom, 60)
          .padding(.horizontal)
        }
      }
      
      ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
        Color.yellow
          .opacity(0.8)
          .edgesIgnoringSafeArea(.all)
        
        HStack {
          Spacer()
          Button(action: convert) {
            Image(systemName: "equal")
              .font(.system(size: 60))
              .foregroundColor(.black)
              .padding(10)
          }
          .background(Color.orange)
          .cornerRadius(10)
        }
        .padding(.top, -30)
        .padding(.horizontal)
        
        VStack {
          HStack(spacing: 20) {
            Image("eu-flag")
              .resizable()
              .scaledToFit()
              .frame(height: 80)
            
            VStack(alignment: .leading) {
              Text("EUR")
                .font(.largeTitle.weight(.semibold))
              
              Text("Euro")
                .font(.title3)
              
              TextField("EUR", text: $eur)
                .font(.largeTitle)
                .minimumScaleFactor(0.2)
                .frame(minHeight: 45)
                .foregroundColor(.black)
                .keyboardType(.decimalPad)
            }
            .foregroundColor(.black)
          }
          
          Spacer()
        }
        .padding(.top, 60)
        .padding(.horizontal)
      }
    }
  }
  
  func convert() {
    guard let vdnValue = Double(vietnameseDong) else {
      eur = "0"
      return
    }
    
    let eurValue = vdnValue * 0.000037
    
    eur = formatCurrency(value: eurValue)
  }
  
  func formatCurrency(value: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.usesGroupingSeparator = true
    numberFormatter.currencyCode = ""
    numberFormatter.minimumFractionDigits = 2
    numberFormatter.maximumFractionDigits = 2
    
    return numberFormatter.string(from: NSNumber(value: value)) ?? ""
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
