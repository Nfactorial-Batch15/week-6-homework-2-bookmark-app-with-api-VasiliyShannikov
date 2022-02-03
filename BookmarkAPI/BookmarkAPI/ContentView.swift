//
//  ContentView.swift
//  BookmarkAPI
//
//  Created by Vasiliy Shannikov on 27.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State var bookmarks = [LinkLine]()
    
    var body: some View {
        Text("LAUREATE")
            .padding()
            .onAppear {
                RequestData().post { models in
                    models.forEach { laureatData in
                        bookmarks.append(LinkLine(lableTitle: laureatData.name, link: laureatData.link))
                    }
                }
            }
        
        List {
            ForEach(bookmarks) { line in
                LinkLine(lableTitle: line.lableTitle, link: line.link)
            }
            .onDelete { (indexSet) in
                self.bookmarks.remove(atOffsets: indexSet)
            }
        }
        
        Spacer()
    }
}
struct LinkLine: View, Identifiable {
    let id = UUID()
   @AppStorage("lable") var lableTitle = ""
    @AppStorage("link")var link = ""
    var body: some View {
        VStack {
            HStack(alignment: .center){
                TextView(size1: 17, textColor: Color.black, lineSpasing: 3, text: lableTitle)
                    .frame( height: 22, alignment: .topLeading)
                Spacer()
                Button {
                    if let url = URL(string: link) {
                         UIApplication.shared.open(url)
                     }
                } label: {
                    Image("Group")
                        .frame(width: 18, height: 18, alignment: .topTrailing) // setting the
               }
            }
            .padding(.horizontal,16)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextView: View {
    var size1:CGFloat  = 12
    var textColor = Color.black
    var lineSpasing:CGFloat = 5
    var text = ""
    var body: some View {
        Text(text)
            .font(.system(size: size1, weight: .bold)) // obvious
            .foregroundColor(textColor) // just text color
            .lineSpacing(lineSpasing) // spacing between text lines
            .multilineTextAlignment(.center) // if text is longer than one line
            .lineLimit(nil)
    }
}
