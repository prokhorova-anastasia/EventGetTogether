

import Foundation

extension Array {
    public func get(_ index: Int) -> Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}
