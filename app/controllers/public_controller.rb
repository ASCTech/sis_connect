class PublicController < ApplicationController

  def lookup_emplid
    if entry = SIS::Directory.find_by_os_namen(params[:name_n])
      render :text => entry.emplid
    else
      render :text => 'Not Found', :status => 404
    end
  end

end
