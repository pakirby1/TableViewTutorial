import Foundation

/* Weekly Compass : consists of multiple Lists with a fixed number of ListItems
    Classes :
        Compass : A Collection of Lists
        List    : A Collection of ListItems
        ListItem: The individual ListItem
*/

/* Holds the lists */
public class Compass
{
    var description : String
    var store : [List] = []
    public var count : Int { return store.count }
    
    public init(description : String)
    {
        self.description = description
    }
    
    public func addList(list : List)
    {
        store.append(list)
    }
    
    // add list with a function that takes a variadic parameter
    public func addListWithItems (listName : String, items : String...)
    {
        let list = List(description: listName, numItems: 4, type: .Unordered)
        
        for s in items {
            list.addListItem(ListItem(description: s))
        }
        
        addList(list)
    }
    
    public func getLists(includeDebug : Bool) -> String
    {
        var ret : String
        
        ret = "\(description)\n\n"
        
        for list in store {
            ret += list.getList(1, includeDebug: includeDebug)
            ret += "\n"
        }
        
        return ret
    }
}

/* A list can be ordered or unordered */
public enum ListType
{
    case Ordered
    case Unordered
}

public class List
{
    public var description : String
    var numItems : Int = 5
    var type : ListType = .Ordered
    var store : [ListItem] = []
    
    public var capacity : Int { return numItems }   // used to limit the number of items the list can hold
    
    public init(description : String, numItems : Int, type: ListType)
    {
        self.description = description
        self.numItems = numItems
        self.type = type
    }
    
    /* appends a list item to the list */
    public func addListItem(item : ListItem) -> Bool
    {
        var ret : Bool
        
        if store.count < numItems {
            store.append(item)
            ret = true
        } else {
            ret = false
        }
        
        return ret
    }

    /* returns a string representation of the list and its items 
        indentLevel : the level of indentation
    */
    public func getList(indentLevel : Int, includeDebug : Bool) -> String
    {
        var ret : String = ""
        
        ret = "\t" * indentLevel + "\(self.description) (\(self.store.count) out of \(numItems) Items)\n" // automatically adds newline
        
        for item in store {
            ret += "\t" * (indentLevel + 1) + item.render(includeDebug)
        }
        
        return ret
    }
}

/* represents the state of the list item */
public enum ListItemState : String
{
    case NotStarted = "[ ]"
    case InProgress = "[*]"
    case Completed = "[X]"
    case Deferred = "[>]"
}

/* the list item
    prefix : String value that will be appended before the item
    postfix : String value that will be appended after the item
*/
public class ListItem
{
    var type : ListItemState
    var description : String
    var prefix : String = "   "
    var postfix : String = "   "
    var UUID: NSUUID /// An underlying identifier to distinguish one `ListItem` from another.
    /*
    Private access restricts the use of an entity to its own defining source file. Use private access to hide the implementation details of a specific piece of functionality. 
    
    Private access in Swift differs from private access in most other languages, as it’s scoped to the enclosing source file rather than to the enclosing declaration. This means that a type can access any private entities that are defined in the same source file as itself, but an extension cannot access that type’s private members if it’s defined in a separate source file.
    */
    
    public init(description : String, state : ListItemState = .NotStarted)
    {
        self.description = description
        type = state
        UUID = NSUUID()
    }
    
    public convenience init(description : String, state : ListItemState, prefix : String, postfix : String)
    {
        self.init(description : description, state: state)
        self.prefix = prefix
        self.postfix = postfix
    }
}

// magic function to repeat a string multipe times (scalar = multiplier)
func *(string: String, scalar: Int) -> String {
    let array = Array(count: scalar, repeatedValue: string)
    return array.joinWithSeparator("")
}

