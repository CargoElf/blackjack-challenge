
module Where
  def where(*search_params)
    results = []
    search_array = search_params.map(&:first)

    search_array.each do |search|
      attr, search_val = search

      found = self.select do |character|
        if search_val.is_a? Regexp
          character[attr].match?(search_val)
        else
          character[attr] == search_val
        end
      end

      results << found unless found.empty?
    end

    results.flatten!
  end
end


Array.include Where
