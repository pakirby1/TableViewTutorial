import Foundation

extension ListItem
{
    func lie_renderForUIView() -> (labels:[String], values:[String])
    {
        return (["Type", "Description", "Prefix", "Postfix"], [type.rawValue, description, prefix, postfix])
    }
    
    func render(includeUUID : Bool) -> String
    {
        var ret : String = "\(prefix) \(type.rawValue) \(description) \(postfix) "
        
        if includeUUID == true {
            ret += "\(self.UUID.UUIDString)"    // Have to make UUID non-private (internal or public)
        }
        
        ret += "\n" 
        
        return ret
    }
}