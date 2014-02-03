module ApplicationHelper
  def render_markdown(text)
    @md ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @md.render(text).html_safe
  end
end
