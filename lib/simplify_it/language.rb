require 'treetop'

module SimplifyIt
  class Language
    def initialize
      Treetop.load "simplify_lang"
      @parser = SimplifyLangParser.new
    end

    def parse(prog)
      @parser.parse(prog)
    end
  end
end