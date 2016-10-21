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

if minimum == difference1 {
	print("eunjung")
} else if minimum == difference2 {
	print("ohju")
} else if minimum == difference3 {
	print("sungjin")
} else if minimum == difference4 {
	print("jinkyu")
}