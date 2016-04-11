RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

def divide(num, divisor, running_sum = 0)
  return running_sum if num < divisor
  num_divides_into = 1
  num_divides_into *= 2 while num_divides_into * 2 * divisor < num
  divide(num - divisor * num_divides_into, divisor, num_divides_into + running_sum) # tail recursion
end

def modulo(num, divisor)
  num - divide(num, divisor) * divisor
end

def divmod(num, divisor)
  [divide(num, divisor), modulo(num, divisor)]
end

big = 4869258
small = 26

p divmod(big, small) == big.divmod(small)
