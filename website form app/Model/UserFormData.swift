import Foundation

struct UserFormData: Codable {
    let name: String
    let email: String
    let businessName: String
}

struct APIResponse: Codable {
    let id: String?
    let createdAt: String?
}