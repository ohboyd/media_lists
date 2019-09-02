module MediaHelper
  def media_types_collection
    Medium.media_types.to_a.collect{ |c| [c[0].titleize, c[0]] }
  end
end
