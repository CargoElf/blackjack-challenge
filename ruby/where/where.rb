# include Exception::StandardError::ArgumentError

module ArrayExtension
  module Where
    def where(**search_params)
      return self if search_params.empty?
      attr, search_val =  search_params.first
      search_params.delete(attr)

      matches = self.select do |character|
        where_arg_error attr unless character[attr]
        if search_val.is_a? Regexp
          character[attr].match?(search_val)
        else
          character[attr] == search_val
        end
      end

      return matches if search_params.empty? || matches.empty?

      matches.where(search_params)
    end

    private

    def where_arg_error attr
      raise ArgumentError.new "Invalid attribute: '#{attr}'"
    end
  end

end

Array.include ArrayExtension::Where
