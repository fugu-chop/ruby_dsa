# binary_search searches the content of a provided Array for value.
# Expects the provided array to be sorted in ascending order.
# 
# @param arr [Array] - the array to search through
# @param search_value [Any] - the value to search for
# @return [Integer, nil] - the index at which the element exists, 
#   or nil if the element cannot be found
def binary_search(arr, search_value)
  start_idx = 0
  end_idx = arr.length - 1

  while start_idx <= end_idx
    midpoint = (end_idx + start_idx) / 2
    
    if search_value == arr[midpoint]
      return midpoint   
    elsif arr[midpoint] < search_value
      start_idx = midpoint + 1
    else
      end_idx = midpoint - 1
    end
  end

  return nil
end
