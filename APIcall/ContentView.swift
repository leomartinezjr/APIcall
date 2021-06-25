//
//  ContentView.swift
//  APIcall
//
//  Created by Leonardo Paez  on 07/05/21.
//

import SwiftUI




struct ContentView: View {
 
    @State private var quoteData: QuoteData?
    
    var body: some View {
        VStack{
          
            Text("teste")
            
            Text(quoteData?.value ?? " nada")
            
            Text("-\(quoteData?.id ?? " nada2")")
            
            
            Button(action: loadData){
                Image(systemName: "arrow.clockwise")
            }
            
        
        }
        
    }


    
    
    
    
private func loadData(){
    print("test")
    guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else{
        return
        }
    URLSession.shared.dataTask(with: url) { (data, response, erro) in
        guard let data = data else {return}
        if let decodeData = try? JSONDecoder().decode(QuoteData.self, from: data){
            DispatchQueue.main.async {
                print(decodeData)
                self.quoteData = decodeData
            }
            
            
        }
    }.resume()

}
    
}




struct QuoteData: Decodable {
    var icon_url: String
    var id: String
   // var url: String
    var value: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
