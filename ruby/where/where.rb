
module ArrayExtension
  module Where
    def where(**search_params)
      attr, search_val =  search_params.first
      search_params.delete(attr)

      matches = self.select do |character|
        if search_val.is_a? Regexp
          character[attr].match?(search_val)
        else
          character[attr] == search_val
        end
      end

      return matches if search_params.empty? || matches.empty?

      matches.where(search_params)
    end
  end
end


Array.include ArrayExtension::Where
