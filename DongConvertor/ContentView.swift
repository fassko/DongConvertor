//
//  ContentView.swift
//  DongConvertor
//
//  Created by Kristaps Grinbergs on 12/09/2021.
//

import SwiftUI

struct ContentView: View {
  // variable that will keep the vietnamese dong value
  @State var vietnameseDong = ""
  
  // variable that will keep eur value
  @State var eur = ""
  
  var body: some View {
    // main encolosure
    // spacing later
    VStack(spacing: 0) {
      VStack {
        Spacer()
        
        HStack(spacing: 20) {
          // image from assets catalog that we imported
          Image("vietnam-flag")
            .resizable()
            .scaledToFit()
            .frame(height: 80)
          
          // alignement from left
          // leading is where text starts
          // for us it is from the left
          // for arabic it is right to left
          VStack(alignment: .leading) {
            Text("VDN")
              .font(.largeTitle.weight(.semibold))
            
            Text("Vietnamese Dong")
              .font(.title3)
            
            TextField("VDN", text: $vietnameseDong)
              .font(.largeTitle)
              // so the font becomes smaller with long numbers
              .minimumScaleFactor(0.2)
              // minimum height of the text field
              .frame(minHeight: 45)
              // so the keyboar has number entering
              .keyboardType(.decimalPad)
          }
        }
        .padding(.bottom, 60)
        .padding(.horizontal)
      }
      .background(Color.red.opacity(0.3))
      
      VStack {
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
              .keyboardType(.decimalPad)
              // so users can't type inside there
              .disabled(true)
          }
        }
        .padding(.top, 60)
        .padding(.horizontal)
        
        Spacer()
      }
      // don't see color until we put something the VStack
      .background(Color.yellow.opacity(0.8))
    }
  }
  
  // converting from DONG to EUR
  func convert() {
    // convert to number from text
    if let vdnValue = Double(vietnameseDong) {
      // current currency rate is 0.000039 from VDN to EUR
      let eurValue = vdnValue * 0.000039
      
      eur = formatCurrency(value: eurValue)
    } else {
      eur = formatCurrency(value: 0)
      return
    }
  }
  
  // formatting currency
  func formatCurrency(value: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.minimumFractionDigits = 2 // min decimals
    numberFormatter.maximumFractionDigits = 2 // max decimals
    
    // return value in case something is wrong we will return empty text ""
    return numberFormatter.string(from: NSNumber(value: value)) ?? ""
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
