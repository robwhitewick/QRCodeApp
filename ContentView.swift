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
    @State var qrCodeImage = UIImage(systemName:"video")!
    @State var gotImage = false
    @EnvironmentObject var vm: ViewModel
    
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
                }
                
                
                
                Button {
                    print("Hellow world")
                    @State var data:Data?
                    var url = "https://www.qrtag.net/api/qr.png?url=https://"+website
                    print(url)
                    URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in

                                if error != nil {
                                    print(error ?? "No Error")
                                    return
                                }
                                DispatchQueue.main.async(execute: { () -> Void in
                                    let image = UIImage(data: data!)
                                    vm.image = nil
                                    vm.image = image
                                })

                            }).resume()
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
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
