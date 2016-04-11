def make_change(change, coins, cache = {})
  return [] if change.zero?
  best_change = nil
  coins.each do |coin|
    next if coin > change
    return [coin] if coin == change

    remainder = change - coin
    cache[remainder] = make_change(remainder, coins, cache) unless cache.has_key?(remainder)
    next if cache[remainder].nil?

    best_change = [best_change, [coin] + cache[remainder]].compact.min_by(&:length)
  end
  best_change
end

p make_change(14, [10, 7, 1])
