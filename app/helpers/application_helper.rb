module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def comment_url_helper(comment)
  post = comment.post
  topic = post.topic
  [topic, post, comment]
  end

  def set_tooltip(id, data_title)
    { "class" => 'btn btn-primary btn-sm',
      "id" => id,
      "data-toggle" => "tooltip",
      "data-placement" => "bottom",
      "data-original-title" => data_title }
  end
end
