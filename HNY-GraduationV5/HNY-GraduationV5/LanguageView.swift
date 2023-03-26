//
//  LanguageView.swift
//  HNY-GraduationV5
//
//  Created by Hilary Young on 25/03/2023.
//

import SwiftUI

import SwiftUI
import LanguageManagerSwiftUI

struct LangaugeView: View {

  // MARK: - Properties

  @EnvironmentObject var languageSettings: LanguageSettings

  // MARK: - body

  var body: some View {
    VStack {
      Text("Select a language")
        .fontWeight(.bold)
        .padding()
      Button("Indonesian") {
        withAnimation {
          languageSettings.selectedLanguage = .id
        }
      }
      Button("English") {
        withAnimation {
          languageSettings.selectedLanguage = .en
        }
      }
    }
    //.buttonStyle(AppButtonStyle())
  }
}

// MARK: - Previews

struct LangaugeView_Previews: PreviewProvider {
  static var previews: some View {
    LangaugeView()
  }
}
