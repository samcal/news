module ApplicationHelper
  def render_markdown(text)
    if not @md
      renderer = Redcarpet::Render::HTML.new(:hard_wrap => true)
      @md = Redcarpet::Markdown.new(renderer)
    end
    @md.render(text).html_safe
  end
end
