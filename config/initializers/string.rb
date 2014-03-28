# TODO - move this to lib

class String
  class << self
    def random_alphanumeric(length = 256)
      n = (0..9).to_a+('a'..'z').to_a
      ((1..length).map { n[rand(n.length)] } ).join
    end
  end
end
