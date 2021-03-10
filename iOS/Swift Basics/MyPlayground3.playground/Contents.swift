import UIKit

class MOVIE {
    var title: String
    var director: String
    var publish_date: Int
    
    init(title:String, director:String, publish_date:Int){
        self.title = title
        self.director = director
        self.publish_date = publish_date
    }
    convenience init() {
        self.init(title:"Not set", director:"Not set", publish_date:0)
    }
}
let mov1 = MOVIE()
let mov2 = MOVIE(title:"Zindagi Na Milegi Dobara", director: "Zoya Akhtar", publish_date: 2011)
print(mov2.title)

