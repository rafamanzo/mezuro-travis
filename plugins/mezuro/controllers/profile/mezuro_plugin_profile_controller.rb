class MezuroPluginProfileController < ProfileController

  append_view_path File.join(File.dirname(__FILE__) + '/../../views')

  rescue_from Exception do |exception|
    @message = process_error_message exception.message
    render :partial => "error_page"
  end

  def error_page
    @message = params[:message]
  end

  protected

  def process_error_message message
    if message =~ /undefined method `module' for nil:NilClass/
      "Kalibro did not return any result. Verify if the selected configuration is correct."
    else
      message
    end
  end

  def project_content_has_errors?
    not @content.errors[:base].nil?
  end

end
