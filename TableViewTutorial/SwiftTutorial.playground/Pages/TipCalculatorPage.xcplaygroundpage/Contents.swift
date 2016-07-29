// 1

// 6
let tipCalc = TipCalculator(total: 50, taxPct: 0.06)
var tips = tipCalc.returnPossibleTips()

// print the tips
for (key, value) in tips {
    print("\(key) : \(value)");
}

// send a function as a parameter
func TipTest() -> Double {
    print("Tip Test!")
    return 0.10
}

print(tipCalc.calcTipWithTipPct(TipTest))
print(tipCalc.calcTipInCA())

// specify the tip by Country USA = 5.5%
print (tipCalc.calcTipWithTipPct{ 5.5 })     // remove ()'s to call function that takes a function param & remove return statement

/* Closures & Functions */

print (tipCalc.calcTipWithTipPct
    {
        let i: Double = 10.85
        return i;
    })





