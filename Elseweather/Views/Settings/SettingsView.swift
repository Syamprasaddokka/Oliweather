//
//  SettingsView.swift
//  Elseweather
//
//  Created by Jarek Šedý on 24.10.2021.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @State private var metricSystem = true
    @State private var showUnits = false
    @State private var minimalisticAppearance = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Settings")
                    .kerning(-0.5)
                    .textStyle(LargeTitle())
                
                Spacer()
            }
            
            Divider(2).opacity(settingsDividerOpacity)
            
            Group {
                Toggle("", isOn: $metricSystem)
                    .toggleStyle(CustomToggleStyle(label: "Metric System",
                                                   onColor: .customSecondary(for: colorScheme),
                                                   offColor: .customBackground(for: colorScheme),
                                                   thumbColor: .customPrimary(for: colorScheme)))
            }.padding(.top, 25).padding(.bottom, 10)
            
            Group {
                Toggle("", isOn: $showUnits)
                    .toggleStyle(CustomToggleStyle(label: "Display Temperature Units",
                                                   onColor: .customSecondary(for: colorScheme),
                                                   offColor: .customBackground(for: colorScheme),
                                                   thumbColor: .customPrimary(for: colorScheme)))
            }.padding(.top, 10).padding(.bottom, 10)
            
            Group {
                Toggle("", isOn: $minimalisticAppearance)
                    .toggleStyle(CustomToggleStyle(label: "Minimalistic Appearance",
                                                   onColor: .customSecondary(for: colorScheme),
                                                   offColor: .customBackground(for: colorScheme),
                                                   thumbColor: .customPrimary(for: colorScheme)))
            }.padding(.top, 10).padding(.bottom, 25)
            
            Divider(2).opacity(settingsDividerOpacity)
            
            HStack {
                Text("""
                     Elseweather v.\(Session.shared.version).
                     Jarek Šedý <jareksedy@icloud.com>
                     GitHub: github.com/jareksedy
                     """.uppercased())
                    .kerning(-0.25)
                    .textStyle(SmallMonospaced())
                    .opacity(0.5)
                
                Spacer()
            }.padding(.top, 10)
            
            
            Spacer()
        }
        .SheetCustomBackground()
        .padding(25)
        .padding(.top, 25)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().preferredColorScheme(.dark)
    }
}
