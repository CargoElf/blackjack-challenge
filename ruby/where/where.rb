
module ArrayExtension
  module Where
    def where(**search_params)
      results = []

      search_params.each do |search|
        attr, search_val = search

        found = self.select do |character|
          if search_val.is_a? Regexp
            character[attr].match?(search_val)
          else
            character[attr] == search_val
          end
        end

        results += found
      end

      results
    end
  end
end


Array.include ArrayExtension::Where
