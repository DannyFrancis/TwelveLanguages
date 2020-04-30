//
//  ContentView.swift
//  TwelveSentences
//
//  Created by Macintosh HD on 4/30/20.
//  Copyright © 2020 Frankish Apps. All rights reserved.
//

import SwiftUI

// MARK: - WelcomeDetailElement
struct WelcomeDetailElement: Codable, Identifiable {
        let name: String
        let id: Int
        let sentence: [String]
}

// MARK: - Sentence
struct Sentence:Codable {
        let sentence1, sentence2, sentence3, sentence4: String
        let sentence5, sentence6, sentence7, sentence8: String
        let sentence9, sentence10, sentence11, sentence12: String
        let sentence1A, sentence1B, sentence2A, sentence2B: String?
        let sentence3A, sentence3B, sentence4A, sentence4B: String?
        let sentence5A, sentence5B, sentence6A, sentence6B: String?
        let sentence7A, sentence7B, sentence8A, sentence8B: String?
        let sentence9A, sentence9B, sentence10A, sentence10B: String?
        let sentence11A, sentence11B, sentence12A, sentence12B: String?
    
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

        if let url = Bundle.main.url(forResource: "twelveData", withExtension: "json"){

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

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




