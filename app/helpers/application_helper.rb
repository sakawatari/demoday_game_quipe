module ApplicationHelper
  def markdown(text)
    unless @markdown
      renderer = Redcarpet::Render::HTML.new
      renderer = Redcarpet::Render::HTML.new(filter_html: true)
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
      @markdown = Redcarpet::Markdown.new(renderer, tables: true)
      @markdown = Redcarpet::Markdown.new(renderer)
    end

    @markdown.render(text).html_safe
  end
end
