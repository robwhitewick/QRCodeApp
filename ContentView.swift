//
//  ContentView.swift
//  apicalls
//
//  Created by user240138 on 4/12/23.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var image: UIImage?
}


struct ContentView: View {
    @State var website = ""
    @EnvironmentObject var vm: ViewModel //first time using enviromental objects im sure this isnt the correct way to do it but it works.
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                TextField("Website name", text:$website)
                
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250,height: 250)
                        .background(Color.gray)
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 250,height: 250)
                        .background(Color.gray)
                } // surely there is a better option than to use an if else statement here?
                
                
                Button {
                    @State var data:Data?
                    var url = "https://www.qrtag.net/api/qr.png?url=https://"+website
                    URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in
                                if error != nil {
                                    print(error ?? "No Error")
                                    return
                                }
                                DispatchQueue.main.async(execute: { () -> Void in
                                    let image = UIImage(data: data!)
                                    vm.image = image
                                })
                            }).resume()// url session function taken from stack overflow. The DispatchQueue is used to update the UI but was a pain to figure out
                } label: {
                    Text("GenerateQR Code")
                }

                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
            
    }
}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
