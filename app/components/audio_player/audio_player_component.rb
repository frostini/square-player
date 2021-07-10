class AudioPlayer::AudioPlayerComponent < ViewComponent::Base
  def initialize(tracks:)
    @tracks = tracks.map do |x|
       y = x.serializable_hash
              .deep_transform_keys! { |key| key.camelize(:lower) }
       y["fileUrl"] = x.full_audio.url
       y.to_json
    end
    
    @track  = tracks.last
  end

end
