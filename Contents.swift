func findAWall(_ inputMatrix: [[Int]]) -> [Int] {
	var outputArray = [Int]()

	guard inputMatrix.count > 0 else { return outputArray }
	guard inputMatrix[0].count > 0 else { return outputArray }

	var rowBegin = 0
	var colBegin = 0
	var colEnd = inputMatrix[0].count - 1
	var rowEnd = inputMatrix.count - 1
	var direction = 0

	print(colEnd, rowEnd)
	while (rowBegin <= rowEnd && colBegin <= colEnd) {
		// traverse right
		if (direction == 0) {
			for i in stride(from: colBegin, to: colEnd + 1, by: 1) {
				outputArray.append(inputMatrix[rowBegin][i])
			}
			rowBegin += 1
		// traverse down
		} else if (direction == 1) {
			for i in stride(from: rowBegin, to: rowEnd + 1, by: 1) {
				outputArray.append(inputMatrix[i][colEnd])
			}
			colEnd -= 1
		// traverse left
		}else if (direction == 2) {
			for i in stride(from: colEnd, to: colBegin, by: -1)  {
				outputArray.append(inputMatrix[rowEnd][i])
			}
			rowEnd -= 1
		}
		// traverse up
		else if (direction == 3) {
			for i in stride(from: rowEnd + 1, to: rowBegin - 1, by: -1) {
				outputArray.append(inputMatrix[i][colBegin])
			}
			colBegin += 1
		}
		// repeat
		direction = (direction + 1)%4
	}
	return outputArray
}

findAWall([
	[1,2,3,4,5],

	[6,7,8,9,10],

	[11,12,13,14,15]
	])
