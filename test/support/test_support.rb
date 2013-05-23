module TestSupport

  def set_http_referer(url = '/')
    @request.env['HTTP_REFERER'] = url
  end

  def build_attributes(*args)
    attrs = FactoryGirl.build(*args).attributes.delete_if do |k, v| 
      ['id', 'created_at', 'updated_at', 'state', 'accepted_at'].member?(k)
    end
    attrs.symbolize_keys
  end
end