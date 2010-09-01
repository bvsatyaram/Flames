################################################################################
# Flames - Game
# Author : Satyaram B V
# Website: http://bvsatyaram.com
################################################################################
class Flames
  FLAMES_STRING = "FLAMES"
  RELATIONS = ["Friends", "Lovers", "Ancestors", "Married", "Enemies", "Sisters"]

  def self.compute(name1, name2)
    compute_flames(name1, name2)
  end

  private

  def self.map_relation_code_to_relation_string(relation_code)
    raise "Invalid relation code" unless ((0..(FLAMES_STRING.length - 1)).to_a).include?(relation_code)

    return RELATIONS[relation_code]
  end

  def self.strike_flames(score, relation_codes = (0..(FLAMES_STRING.length - 1)).to_a, offset = 0)
    # Strike flames with the number input
    relation_codes_length = relation_codes.size
    return relation_codes.first if relation_codes_length == 1

    remainder = ((score + offset) % relation_codes_length)

    if remainder == 0
      new_offset = relation_codes_length - 1
    else
      new_offset = remainder - 1
    end
    new_codes = []

    (0..(relation_codes_length - 1)).each do |i|
      new_codes << relation_codes[i] if i != new_offset
    end

    return strike_flames(score, new_codes, new_offset)
  end

  def self.get_flames_count(chars1, chars2)
    flames_score = chars1.size + chars2.size
    chars1 = chars1.sort
    chars2 = chars2.sort
    chars1.uniq.each do |char|
      a = chars1.select{|x| x == char}.size
      b = chars2.select{|x| x == char}.size
      flames_score -= 2*[a,b].min
    end

    flames_score = strike_flames(flames_score)

    return flames_score
  end

  def self.compute_relation_code(name1, name2)
    chars1 = name1.split("")
    chars2 = name2.split("")

    return get_flames_count(chars1, chars2)
  end

  def self.compute_flames(name1, name2)
    return map_relation_code_to_relation_string(compute_relation_code(name1, name2))
  end
end