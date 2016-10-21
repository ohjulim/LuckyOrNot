import UIKit

let eunjung = Int(arc4random_uniform(100))
let ohju = Int(arc4random_uniform(100))
let sungjin = Int(arc4random_uniform(100))
let jinkyu = Int(arc4random_uniform(100))

let targetValue = Int(arc4random_uniform(100))

let difference1 = abs(targetValue - eunjung)
let difference2 = abs(targetValue - ohju)
let difference3 = abs(targetValue - sungjin)
let difference4 = abs(targetValue - jinkyu)

let minimum = min(difference1, difference2, difference3, difference4)

// MARK: Control Flow
switch minimum {
case difference1:
	print("eunjung")
case difference2:
	print("ohju")
case difference3:
	print("sungjin")
case difference4:
	print("jinkyu")
default:
	break
}