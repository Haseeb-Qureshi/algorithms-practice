require 'set'

PERIODIC_ELS = %w(Ag Al Am Ar As At Au B Ba Be Bh Bi Bk Br C Ca Cd Ce Cf Cl Cm Cn Co Cr Cs Cu Db Ds Dy Er Es Eu F Fe Fl Fm Fr Ga Gd Ge H He Hf Hg Ho Hs I In Ir K Kr La Li Lr Lu Lv Md Mg Mn Mo Mt N Na Nb Nd Ne Ni No Np O Os P Pa Pb Pd Pm Po Pr Pt Pu Ra Rb Re Rf Rg Rh Rn Ru S Sb Sc Se Sg Si Sm Sn Sr Ta Tb Tc Te Th Ti Tl Tm U V W Xe Y Yb Zn)

# note: took out length 3 element abbreviations: Uup, Uun, etc., for simplification

TABLE = Set.new(PERIODIC_ELS)

def is_periodic?(str)
  one_back_is_valid = true # seed the empty string as being valid
  two_back_is_valid = false

  str.length.times do |i|
    if valid_seq_ends_here?(str, i, one_back_is_valid, two_back_is_valid)
      two_back_is_valid = one_back_is_valid
      one_back_is_valid = true
    else
      two_back_is_valid = one_back_is_valid
      one_back_is_valid = false
    end

    return false unless one_back_is_valid || two_back_is_valid
  end
  true
end

def valid_seq_ends_here?(str, i, one_back_is_valid, two_back_is_valid)
  prev = str[i]
  prev_two = str[i - 1..i] # no need to bounds check for i = 0 because str[-1..1] = ""
  (TABLE.include?(prev) && one_back_is_valid) || (TABLE.include?(prev_two) && two_back_is_valid)
end

def is_periodic_rec?(str, i = 0, cache = {})
  return cache[i] if cache[i]
  return true if i >= str.length
  if TABLE.include?(str[i]) && TABLE.include?(str[i..i + 1])
    cache[i] = is_periodic_rec?(str, i + 1, cache) || is_periodic_rec?(str, i + 2, cache)
  elsif TABLE.include?(str[i])
    cache[i] = is_periodic_rec?(str, i + 1, cache)
  elsif TABLE.include?(str[i..i + 1])
    cache[i] = is_periodic_rec?(str, i + 2, cache)
  else
    false
  end
end

30.times do
  random_els = PERIODIC_ELS.sample(30)
  p is_periodic?(random_els.join) == true
  p is_periodic_rec?(random_els.join) == true

  (random_els << "FaKe").shuffle!
  p is_periodic?(random_els.join) == false
  p is_periodic_rec?(random_els.join) == false
end
