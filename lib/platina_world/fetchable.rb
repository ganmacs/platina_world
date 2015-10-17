module PlatinaWorld
  module Fetchable
    def contents
      @contents ||= (contents_fetcher && contents_fetcher.fetch)
    end

    def has_contents?
      !!contents
    end

    private

    def contents_path
      fail NotImplementedError
    end

    def has_contents_path?
      !!contents_path
    end

    def contents_fetcher
      return @contents_fetcher if instance_variable_defined?(:@contents_fetcher)
      @contents_fetcher =
        if has_contents_path?
          FetcherBuilder.new(contents_path).build
        else
          nil
        end
    end
  end
end
