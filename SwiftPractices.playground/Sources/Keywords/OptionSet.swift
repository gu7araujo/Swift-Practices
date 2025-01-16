struct MessageType : OptionSet {
    let rawValue: Int
    
    static let text = MessageType([])
    static let image = MessageType(rawValue: 1 << 0)
    static let video = MessageType(rawValue: 1 << 1)
    static let audio = MessageType(rawValue: 1 << 2)
    static let file = MessageType(rawValue: 1 << 3)
    static let mms: MessageType = [.image, .text]
}

class Client {
    let messageReceived: MessageType = [.audio, .text]
    let videoPlusTextMessage: MessageType = [.video, .text]
    
    init() {
        print(videoPlusTextMessage.contains(.video)) // true
        print(videoPlusTextMessage.contains(.image)) // false
        
        // Combining

        let textMessage : MessageType = [.text]
        let imageMessage : MessageType = [.image]

        var mmsMessage = textMessage.union(imageMessage)
        
        // Comparing

        mmsMessage = textMessage.union(imageMessage)

        let common = mmsMessage.intersection(textMessage)

        let subtracted = mmsMessage.subtracting(textMessage)
    }
}
