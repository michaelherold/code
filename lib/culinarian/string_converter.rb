module Culinarian
  class StringConverter
    def humanize(string)
      underscore(string).tr('_', ' ')
    end

    def underscore(string)
      word = string.to_s.split('::'.freeze).last
      word.gsub!(/([A-Z\d]+)([A-Z][a-z])/, '\1_\2'.freeze)
      word.gsub!(/([a-z\d])([A-Z])/, '\1_\2'.freeze)
      word.tr!('-'.freeze, '_'.freeze)
      word.downcase!
      word
    end
  end
end
