class MezuroPluginMyprofileController < ProfileController #MyprofileController?

  append_view_path File.join(File.dirname(__FILE__) + '/../../views')

  rescue_from Exception do |exception|
    @message = process_error_message exception.message
    render :partial => "error_page"
  end

  def error_page
    @message = params[:message]
  end

  def choose_base_tool
    @configuration_content = profile.articles.find(params[:id])
    @base_tools = Kalibro::BaseTool.all_names
  end

  def choose_metric
    @configuration_content = profile.articles.find(params[:id])
    @base_tool = params[:base_tool]
    base_tool = Kalibro::BaseTool.find_by_name(@base_tool)
    @supported_metrics = base_tool.nil? ? [] : base_tool.supported_metrics 
  end

  protected

  def redirect_to_error_page(message)
    message = URI.escape(CGI.escape(process_error_message(message)),'.')
    redirect_to "/myprofile/#{profile.identifier}/plugin/mezuro/error_page?message=#{message}"
  end

  def metric_configuration_has_errors? metric_configuration
    not metric_configuration.errors.empty?
  end

  def process_error_message message
    if message =~ /bla/
      message
    else
      message
    end
  end

end