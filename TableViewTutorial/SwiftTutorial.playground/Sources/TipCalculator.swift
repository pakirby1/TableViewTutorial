import Foundation

public class TipCalculator {
    let total: Double
    let taxPct: Double
    let subtotal: Double
    
    public init(total : Double, taxPct : Double)
    {
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    
    public func calcTipWithTipPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }
    
    public func returnPossibleTips() -> [Int : Double] {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        var retVal = [Int: Double]()
        
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            retVal[intPct] = calcTipWithTipPct(possibleTip)
        }
        
        return retVal
    }
    
    public func calcTipWithTipPct(f:() -> Double) -> Double {
        let customTip = f()
        return calcTipWithTipPct(customTip)
    }
    
    // Anonymous functions
    public func calcTipInCA() -> Double {
        return calcTipWithTipPct() { return 8.5 }    // trailing function
    }
    
    public func calcTipinOR() -> Double {
        return calcTipWithTipPct() { return 0.0 }    // trailing function
    }
}
