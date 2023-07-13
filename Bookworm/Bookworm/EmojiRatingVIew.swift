//
//  EmojiRatingVIew.swift
//  Bookworm
//
//  Created by Ton Silva on 13/7/23.
//

import SwiftUI

struct EmojiRatingVIew: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("🙈")
        case 2:
            return Text("😔")
        case 3:
            return Text("🙂")
        case 4:
            return Text("☺️")
        default:
            return Text("🤩")
            
        }
    }
}

struct EmojiRatingVIew_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingVIew(rating: 3)
    }
}
