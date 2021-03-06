module Buoys
  module Helper
    # Declare the breadcrumb which want to render in view.
    #
    # <%= buoy :help, true %>
    def buoy(key, *args)
      @_buoys_renderer = Buoys::Renderer.new(self, key, *args)
    end
    alias_method :breadcrumb, :buoy

    # <% buoys.tap do |links| %>
    #   <% if links.any? %>
    #     <ul>
    #       <% links.each do |link| %>
    #         <li class="<%= link.class %>">
    #           <%= link_to link.text, link.url %>
    #         </li>
    #       <% end %>
    #     </ul>
    #   <% end %>
    # <% end %>
    def buoys
      buoys_renderer.render
    end
    alias_method :breadcrumbs, :buoys

    def buoys_renderer
      @_buoys_renderer ||= Buoys::Renderer.new(self, nil)
    end
  end
end
