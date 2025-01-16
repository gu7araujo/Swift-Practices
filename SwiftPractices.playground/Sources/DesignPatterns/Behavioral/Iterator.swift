struct Song {
    var title: String
}

protocol Iterator {
    func next() -> Song?
    func hasNext() -> Bool
}

protocol Aggregate {
    func createIterator() -> Iterator
}

class SongIterator: Iterator {
    private var playlist: Playlist
    private var currentSongIndex: Int = 0
    init(playlist: Playlist) {
        self.playlist = playlist
    }
    func next() -> Song? {
        if hasNext() {
            let song = playlist.songs[currentSongIndex]
            currentSongIndex += 1
            return song
        } else {
            return nil
        }
    }
    func hasNext() -> Bool {
        return currentSongIndex < playlist.songs.count
    }
}

class Playlist: Aggregate {
    var songs: [Song] = []
    func createIterator() -> Iterator {
        return SongIterator(playlist: self)
    }
}

class client11 {
    let playlist = Playlist()
    
    init() {
        playlist.songs.append(Song(title: "Song 1"))
        playlist.songs.append(Song(title: "Song 2"))
        
        let iterator = playlist.createIterator()
        
        while iterator.hasNext() {
            if let song = iterator.next() {
                print("Playing: \(song.title)")
            }
        }
    }
}
