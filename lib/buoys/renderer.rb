module Buoys
  class Renderer
    def initialize(context, key, *args)
      @context, @key, @args = context, key, *args
      Buoys::Loader.load_buoys_files if Buoys::Loader.buoys.keys.empty?
    end

    def render
      return [] unless @key

      buoy = Buoys::Buoy.new(@context, @key, @args)
      build_links(buoy)
    end

    private

    def build_links(buoy)
      links = buoy.links.dup

      links.unshift *collect_previous_links(buoy)
      links.last.mark_as_current!

      links
    end

    def collect_previous_links(buoy)
      links = []

      while buoy = buoy.previous
        links.unshift *buoy.links
      end

      links
    end
  end
end
