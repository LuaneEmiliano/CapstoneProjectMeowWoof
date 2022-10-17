//
//  LaunchScreenView.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 10/8/22.
//
//MARK: I turned off this view because I'm not if I'll keep it or not.



import SwiftUI
struct LaunchScreenView: View {
    
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    @State private var finishPhaseIsAnimating: Bool = false
    @State private var secondPhaseIsAnimating: Bool = false
    
    private let timer = Timer.publish(every: 0.65,
                                      on: .main,
                                      in: .common).autoconnect()
    var body: some View {
        ZStack {
            background
            logo
        }
        .onReceive(timer) { input in
            
            switch launchScreenManager . state {
            case .first:
                withAnimation(.spring()) {
                    finishPhaseIsAnimating.toggle()
                }
            case .second :
                withAnimation(.easeInOut) {
                    secondPhaseIsAnimating.toggle()
                }
            default: break
            }
        }
        //        .opacity(secondPhaseIsAnimating ? 0 : 1)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenManager())
    }
}

private extension LaunchScreenView {
    var background: some View {
        Color("PetAlbum")
            .edgesIgnoringSafeArea(.all)
    }
    var logo: some View {
        Image("logo")
            .scaleEffect(finishPhaseIsAnimating ? 0.6 : 1)
            .scaleEffect(secondPhaseIsAnimating ? UIScreen.main.bounds.size.height / 4 : 1)
    }
}
