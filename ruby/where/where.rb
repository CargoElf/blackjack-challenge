# include Exception::StandardError::ArgumentError

module ArrayExtension
  module Where

    def where **search_params
      return self if search_params.empty? || self.empty?

      attr, search_val =  search_params.first
      search_params.delete attr

      select_matches(search_val, attr).where search_params
    end

    private

    def select_matches(search_val, attr)
      self.select do |character|
        raise_where_arg_error attr unless character[attr]
        char_is_a_match?(search_val, attr, character)
      end
    end

    def char_is_a_match?(search_val, attr, character)
      if search_val.is_a? Regexp
        character[attr].match? search_val
      else
        character[attr] == search_val
      end
    end

    def raise_where_arg_error attr
      raise ArgumentError.new "Invalid attribute: '#{attr}'"
    end

  end
end

Array.include ArrayExtension::Where
