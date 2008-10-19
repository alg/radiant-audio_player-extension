module Admin::AudioHelper
  
  def admin_player_params(audio_track)
    player_prefs = Radiant::Config.find(:all, 
      :conditions => ["config.key LIKE ?", "audio_player.admin%"] )
    player_params = ["playerID=#{audio_track.id}","soundFile=#{audio_track.track.url}"]
    player_prefs.each do |pref|
      player_params << "#{pref.key.sub(/audio_player\.admin_/, "")}=#{pref.value}"
    end
    # debugger
    player_params.join("&amp;")
  end
  
  
  
end