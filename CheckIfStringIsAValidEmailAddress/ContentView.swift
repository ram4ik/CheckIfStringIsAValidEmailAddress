//
//  ContentView.swift
//  CheckIfStringIsAValidEmailAddress
//
//  Created by Ramill Ibragimov on 15.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var emailString = ""
    @State private var isValid = false
    
    var body: some View {
        VStack {
            if emailString != "" {
                Text(self.isValid ? "VALID" : "NOT VALID")
                    .foregroundColor(self.isValid ? Color.green : Color.red)
            }
            TextField("Enter email", text: $emailString)
                .padding()
            Button(action: {
                self.isValid = self.validate(self.emailString)
            }) {
                Text("Validate email")
            }
        }.padding()
    }
    
    func validate(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return testEmail.evaluate(with: email)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
