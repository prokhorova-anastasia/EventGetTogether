

import Foundation

struct ServerCard: Codable {
    var id: Int?
    var name: String?
    var statusString: String?
    var authorName: String?
    var authorPhone: String?
    var authorEmail: String?
    var participantCount: Int?
    var description: String?
    var eventAvatar: String?
    var images: [String?]
    var status: Int?
    var startDate: Int?
    var endDate: Int?
    var room: String?
    var content: String?
}

struct ServerCardResponse: Codable {
    var results: [ServerCard]?
    var resultsCount: Int?
}
