//
//  AboutView.swift
//  Bull's Eyes SwiftUI
//
//  Created by PARDIEU Timothé on 27/02/2020.
//  Copyright © 2020 PARDIEU Timothé. All rights reserved.
//

import SwiftUI


struct AboutView: View {
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View{
            content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .foregroundColor(.black)
                .padding(.bottom, 20)
                .padding(.leading, 60)
                .padding(.trailing, 60)
        }
    }
    
    
    var body: some View {
        Group {
            VStack{
                Spacer()
                Text("About us").modifier(LabelStyle())
                Spacer()
                Text("Consequat semper viverra nam libero justo laoreet sit. Faucibus nisl tincidunt eget nullam non nisi est. \n Ac turpis egestas maecenas pharetra. Donec massa sapien faucibus et. Blandit aliquam etiam erat velit scelerisque in dictum non consectetur. Amet justo donec enim diam. Lacus vestibulum sed arcu non odio euismod lacinia at. Sagittis vitae et leo duis. Risus nec feugiat in fermentum posuere urna nec.\n Faucibus a pellentesque sit amet porttitor eget. Nibh mauris cursus mattis molestie a iaculis at erat. Auctor augue mauris augue neque gravida in fermentum. Arcu cursus vitae congue mauris rhoncus aenean vel elit. Urna id volutpat lacus laoreet non curabitur. Venenatis a condimentum vitae sapien. \n In tellus integer feugiat scelerisque varius morbi enim. Orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt. Laoreet id donec ultrices tincidunt arcu non.").modifier(LabelStyle())
            }
            .background(Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0))
            .navigationBarTitle("About Bullseye")
        }
        .background(Image("Background"))
        
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))//<= iphone 11 Max Pro )
    }
}
