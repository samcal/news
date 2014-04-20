module ArticlesPaginationHelper
  class LinkRenderer < WillPaginate::ActionView::LinkRenderer
    protected

    def page_number(page)
      unless page == current_page
        link(page, page, :class => 'page_number')
      else
        tag(:em, page, :class => 'current')
      end
    end

    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, tag(:span, '', :class => 'glyphicon glyphicon-chevron-left'), 'previous_page')
    end

    def next_page
      num = @collection.current_page < total_pages && @collection.current_page + 1
      previous_or_next_page(num, tag(:span, '', :class => 'glyphicon glyphicon-chevron-right'), 'next_page')
    end
  end
end
