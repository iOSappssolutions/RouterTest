//
//  ContentView.swift
//  RoutingTest
//
//  Created by Miroslav Djukic on 9.6.21..
//

import SwiftUI

struct AView: View {
    
    @EnvironmentObject var navigatonState: NavigationState
    
    var body: some View {
        NavigationView {
            VStack {
                Text("AView")
                
                Spacer().frame(height: 30)
                
                NavigationLink("Next", destination: BView(), isActive: $navigatonState.bViewActive)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
        .onAppear(perform: {
            navigatonState.navigateToDView()
        })
    }
}

struct BView: View {
    
    @EnvironmentObject var navigatonState: NavigationState
    
    var body: some View {
        VStack {
            Text("BView")
            
            Spacer().frame(height: 30)
            
            NavigationLink("Next", destination: CView(), isActive: $navigatonState.cViewActive)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
    }
}

struct CView: View {
    
    @EnvironmentObject var navigatonState: NavigationState
    
    var body: some View {
        VStack {
            Text("CView")
            
            Spacer().frame(height: 30)
            
            NavigationLink("Next", destination: DView(), isActive: $navigatonState.dViewActive)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
    }
}

struct DView: View {
    var body: some View {
        VStack {
            Text("DView")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
    }
}


final class NavigationState: ObservableObject {
    @Published var bViewActive = false
    @Published var cViewActive = false
    @Published var dViewActive = false
    
    // This doesn't work normal with any delay less then 0.5s, toggle if/else below to see 
    func navigateToDView() {
        #if true // doesn't work
         bViewActive = true
         cViewActive = true
         dViewActive = true
        #else // work
          bViewActive = true
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
              self?.cViewActive = true
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                  self?.dViewActive = true
              }
          }
        #endif
      }
}
