def decreasing?(report)
  decreasing = true

  report.each_cons(2) do |a, b|
    if a < b
      decreasing = false
      break
    end
  end
  return decreasing
end

def increasing?(report)
  increasing = true

  report.each_cons(2) do |a, b|
    if a > b
      increasing = false
      break
    end
  end
  return increasing
end

def levelsDifferByAtLeast1orAtMost3(report)
  levelsDifferBy = true
  differAccepted = [1, 2, 3, -1, -2, -3]

  report.each_cons(2) do |a, b|
    if !differAccepted.include?(a - b)
      levelsDifferBy = false
      break
    end
  end
  return levelsDifferBy
end

def isReportsafe?(report)
  safe = (decreasing?(report) || increasing?(report)) && levelsDifferByAtLeast1orAtMost3(report)
  # 1 for safe
  # 0 for unsafe
  return safe == true ? true : false
end

# p decreasing?([7, 6, 4, 2, 1])
# p decreasing?([7, 8, 4, 2, 1])
# p increasing?([7, 6, 4, 2, 1].reverse)
# p increasing?([7, 6, 4, 2, 4].reverse)

# p isReportsafe?([7, 6, 4, 2, 1])
# p isReportsafe?([1, 2, 7, 8, 9])
# p isReportsafe?([9, 7, 6, 2, 1])
# p isReportsafe?([1, 3, 2, 4, 5])
# p isReportsafe?([8, 6, 4, 4, 1])
# p isReportsafe?([1, 3, 6, 7, 9])
