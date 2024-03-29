import Foundation

class NumberFormatComponent {
    func formatDecimal(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(
            from: NSNumber(value: number))
        return formattedNumber ?? "\(number)"
    }
}
