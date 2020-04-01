require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'active_support/inflector'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "double render" if @already_built_response
    @already_built_response = true
    @res.status = 302
    @res.location = url
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "double render" if @already_built_response
    @already_built_response = true
    @res["Content-Type"] = content_type
    @res.write(content)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    current_path = File.dirname(__FILE__)
    template_path = File.join(current_path, "..", "views", "#{self.class.to_s.underscore}", "#{template_name}.html.erb")
    content = File.read(template_path)
    result = ERB.new(content).result(binding)
    render_content(result, "text/html")
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

