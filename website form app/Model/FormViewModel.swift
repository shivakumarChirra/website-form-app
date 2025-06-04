import Foundation

class FormViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var businessName = ""
    @Published var message = ""
    @Published var isLoading = false

    func submitForm() {
        let formData = UserFormData(name: name, email: email, businessName: businessName)
        isLoading = true
        message = ""

        NetworkManager.shared.submitForm(data: formData) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.message = " Success! ID: \(response.id ?? "N/A")"
                case .failure(let error):
                    self?.message = " Error: \(error.localizedDescription)"
                }
            }
        }
    }
}
