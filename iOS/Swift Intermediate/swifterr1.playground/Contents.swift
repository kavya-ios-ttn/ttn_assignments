import UIKit

protocol Avatar {
  var avatar: String { get }
}

enum MagicWords: String {
  case abracadbra = "abracadabra"
  case alakazam = "alakazam"
  case hocusPocus = "hocus pocus"
  case prestoChango = "presto chango"
}

struct Spell {
  var magicWords: MagicWords = .abracadabra
}
