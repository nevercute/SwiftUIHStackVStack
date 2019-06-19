//
//  ContentView.swift
//  SwiftUIComplexLayout
//
//  Created by NEVERCUTE on 18/06/2019.
//  Copyright © 2019 NEVERCUTE. All rights reserved.
//

import SwiftUI

struct Post {
    let id: Int
    let username, text, imageName, avatar: String
}

struct ContentView : View {
    
    let posts: [Post] = [
        .init(id: 0, username: "NEVERCUTE", text: "There is a very pretty good car and I'm really can buy Volvo xc60", imageName: "volvo", avatar: "jim"),
        .init(id: 1, username: "DANI", text: "She very loves mopses and I want to make it as a gift for her. I love this dogs too :)", imageName: "mops", avatar: "mops"),
        .init(id: 2, username: "ALEKS LEE", text: "I love electorinc music. It's in my heart, it's in my soul. It is my life", imageName: "bubbles", avatar: "me"),
        .init(id: 3, username: "Daniela Lee", text: "Do you remember that good games? There was awesome, that was some magic and fun. But nature is more realistic and awesome for me", imageName: "paraplan", avatar: "darkwing")
    ]
    
    let groupItems: [GroupItem] = [
    .init(id: 0, imageName: "memorial", text: "Georgian Friendship of Peolples's memorial"),
    .init(id: 1, imageName: "volvo", text: "Brand new car Volvo XC60 released"),
    .init(id: 2, imageName: "jim", text: "Some awesome sega mega drive game"),
    .init(id: 3, imageName: "mops", text: "Your pet is waiting for you"),
    .init(id: 4, imageName: "car", text: "Georgian streets are filled by interesting things"),
    .init(id: 5, imageName: "paraplan", text: "See a magic views getting by paraplan flight")
    ]
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    Text("Trending")
                    ScrollView  {
                        HStack {
                            ForEach(groupItems.identified(by: \.id)) { item in
                                NavigationButton(destination: GroupViewDetails(item: item)) {
                                    GroupView(item: item)
                                    }.font(.footnote)
                            }
                        }
                    }
                    }.frame(height: 195)
                //posts rows
                ForEach(posts.identified(by: \.id)) { post in
                    PostView(post: post)
                }
                }.navigationBarTitle(Text("Groups"))
        }
    }
}

struct GroupViewDetails: View {
    let item: GroupItem
    var body: some View {
        VStack (alignment: .center) {
            Text(item.text)
                .font(.largeTitle)
                .lineLimit(nil)
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 400)
            .clipped()
            }
    }
}

struct GroupView: View {
    let item: GroupItem
    var body: some View {
        VStack (alignment: .leading) {
            Image(item.imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped().cornerRadius(12)
            
            Text(item.text)
                .color(.primary)
                .lineLimit(nil)
                .font(.subheadline)
                .padding(.leading, 0)
            }.frame(width: 100, height: 160)
            .padding(.trailing, 10)
    }
}

struct GroupItem {
    let id: Int
    let imageName, text: String
}

struct PostView: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(post.avatar)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 70, height: 70)
                    .clipped()
                VStack (alignment: .leading, spacing: 5) {
                    Text(post.username)
                        .font(.headline)
                    Text("Posted 10hrs ago")
                        .font(.subheadline)
                    }.padding(.top, -20)
                }.padding(.leading, 10).padding(.top, 10)
            
            Text(post.text)
                .lineLimit(nil)
                .padding(.leading, 8)
                .padding(.trailing, 8)
            Image(post.imageName)
                .resizable()
                .frame(width: 414,height: 400)
                .clipped()
            }.padding(.leading, -20)
            .padding(.bottom, -8)
            .padding(.trailing, -20)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif






