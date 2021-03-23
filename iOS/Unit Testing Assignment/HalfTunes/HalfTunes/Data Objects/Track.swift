

struct Track {
  let Name: String?
  let Artist: String?
  let PreviewUrl: String?
  
  init(name: String?, artist: String?, previewUrl: String?) {
    self.Name = name
    self.Artist = artist
    self.PreviewUrl = previewUrl
  }
}
