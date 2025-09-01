def sum_negative_between_min_max(arr):
    if not arr:
        return 0
    max_idx = arr.index(max(arr))
    min_idx = arr.index(min(arr))
    left, right = sorted((min_idx, max_idx))
    return sum(x for x in arr[left+1:right] if x < 0)

if __name__ == "__main__":
    arr = [3, -2, 7, -5, -1, 10, -3]
    print(arr, "=>", sum_negative_between_min_max(arr))
