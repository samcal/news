module ApplicationHelper
  def render_markdown(text)
    if not @md
      renderer = Redcarpet::Render::HTML.new(:hard_wrap => true)
      @md = Redcarpet::Markdown.new(renderer)
    end
    @md.render(text).html_safe
  end

  def time_ago(timestamp)
    time_ago_in_words(timestamp) + " ago"
  end
end
