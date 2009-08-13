class HighVoltage::PagesController < ApplicationController
  unloadable
  before_filter :ensure_valid

  def show
    render :template => current_page
  end

  protected

  def ensure_valid
    if !template_exists? && !db_entry_exists?
      render :nothing => true, :status => 404 and return false
    end
  end

  def current_page
    "pages/#{db_entry_exists? ? 'show' : page_name}"
  end
  
  def page_name
    params[:id].to_s.downcase
  end
  
  def db_entry_exists?(page_name=page_name)
    !(@page ||= HighVoltage::Page.find_by_permalink(page_name)).nil?
  end

  def template_exists?(path=current_page)
    view_paths.find_template(path, response.template.template_format)
  rescue ActionView::MissingTemplate
    false
  end
end
