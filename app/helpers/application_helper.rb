module ApplicationHelper

  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

  def youtube(url)
    return url.match(/(?<=v=)[a-zA-Z0-9-_]+(?=&)|(?<=[0-9]\/)[^&\n]+|(?<=v=)[^&\n]+/)[0]
  end

end
