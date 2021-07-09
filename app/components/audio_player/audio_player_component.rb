class AudioPlayer::AudioPlayerComponent < ViewComponent::Base
  def initialize(track:)
    @track = track
  end

end
