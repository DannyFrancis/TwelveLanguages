//
//  ContentView.swift
//  TwelveSentences
//
//  Created by Macintosh HD on 4/30/20.
//  Copyright © 2020 Frankish Apps. All rights reserved.
//

import SwiftUI

struct WelcomeDetailElement: Codable, Identifiable {
    let name: String
    let id: Int
    let sentence: [String]
}

struct ContentView: View {

    @State var result : [WelcomeDetailElement] = []

    var body: some View{
        NavigationView{
            List{
                ForEach(result){
                    a in NavigationLink(destination: DetailView(sentence: a.sentence)){
                        Text(a.name)
                    }
                }
            }
            
            
        }
        .onAppear(perform: parseJson)
    }
        
        

    func parseJson() {

        if let url = Bundle.main.url(forResource: "twelveData.json", withExtension: nil){

            if let data = try? Data(contentsOf: url){

                let jsondecoder = JSONDecoder()

                do{
                    let result = try jsondecoder.decode([WelcomeDetailElement].self, from: data)
                    self.result = result

                }
                catch {
                    print("error trying parse json")
                }
            }
        }
    }
}
    
struct DetailView: View {
@State var sentence: [String]
    var body: some View {
    List{
        ForEach(sentence, id:\.self){
            s in Text(s)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}




