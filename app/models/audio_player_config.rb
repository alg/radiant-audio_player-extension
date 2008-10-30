require 'hex_colors'
class AudioPlayerConfig < ActiveRecord::Base
  # include HexColors
  extend HexColors
  validates_presence_of :name
  validates_uniqueness_of :name, :message => 'name already in use'
  
  def parameters_for_player
    pa = []
    parameters.each do |key,value|
      pa << "#{key}=#{value}"
    end
    pa
  end
  
  def parameters
    cols = {}
    colors.each do |key|
      value = self.send(key)
      unless value.blank?
        cols[key] = value
      end
    end
    bools = {}
    bools[:loop] = (self.loop ? "yes" : "no")
    bools[:autostart] = (autostart ? "yes" : "no")
    cols.merge bools
  end
  

  
  
  hex_colors :bg, :leftbg, :lefticon, :rightbg, :rightbghover, :righticon, :righticonhover, :text, :slider, :track, :border, :loader
  
  # This badly needs refactored! 
  # Use a Macro: 
  # def bg_hex
  #   if value_or_default(:bg) =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     "##{$2}"
  #   end
  # end
  # def bg_hex=(input)
  #   if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     self[:bg] = "0x#{$2}"
  #   end
  # end
  # def leftbg_hex
  #   if value_or_default(:leftbg) =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     "##{$2}"
  #   end
  # end
  # def leftbg_hex=(input)
  #   if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     self[:leftbg] = "0x#{$2}"
  #   end
  # end
  # def lefticon_hex
  #   if value_or_default(:lefticon) =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     "##{$2}"
  #   end
  # end
  # def lefticon_hex=(input)
  #   if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     self[:lefticon] = "0x#{$2}"
  #   end
  # end
  # def rightbg_hex
  #   if value_or_default(:rightbg) =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     "##{$2}"
  #   end
  # end
  # def rightbg_hex=(input)
  #   if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     self[:rightbg] = "0x#{$2}"
  #   end
  # end
  # def rightbghover_hex
  #   if value_or_default(:rightbghover) =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     "##{$2}"
  #   end
  # end
  # def rightbghover_hex=(input)
  #   if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     self[:rightbghover] = "0x#{$2}"
  #   end
  # end
  # def righticon_hex
  #   if value_or_default(:righticon) =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     "##{$2}"
  #   end
  # end
  # def righticon_hex=(input)
  #   if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     self[:righticon] = "0x#{$2}"
  #   end
  # end
  # def righticonhover_hex
  #   if value_or_default(:righticonhover) =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     "##{$2}"
  #   end
  # end
  # def righticonhover_hex=(input)
  #   if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     self[:righticonhover] = "0x#{$2}"
  #   end
  # end
  # def text_hex
  #   if value_or_default(:text) =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     "##{$2}"
  #   end
  # end
  # def text_hex=(input)
  #   if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     self[:text_hex] = "0x#{$2}"
  #   end
  # end
  # def slider_hex
  #   if value_or_default(:slider) =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     "##{$2}"
  #   end
  # end
  # def slider_hex=(input)
  #   if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     self[:slider_hex] = "0x#{$2}"
  #   end
  # end
  # def track_hex
  #   if value_or_default(:track) =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     "##{$2}"
  #   end
  # end
  # def track_hex=(input)
  #   if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     self[:track] = "0x#{$2}"
  #   end
  # end
  # def border_hex
  #   if value_or_default(:border) =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     "##{$2}"
  #   end
  # end
  # def border_hex=(input)
  #   if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     self[:border] = "0x#{$2}"
  #   end
  # end
  # def loader_hex
  #   if value_or_default(:loader) =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     "##{$2}"
  #   end
  # end
  # def loader_hex=(input)
  #   if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})/
  #     self[:loader] = "0x#{$2}"
  #   end
  # end
  
  def value_or_default(column)
    defaults = {
      :bg => "0xf8f8f8",
      :leftbg => "0xeeeeee",
      :lefticon => "0x666666",
      :rightbg => "0xcccccc",
      :rightbghover => "0x999999",
      :righticon => "0x666666",
      :righticonhover => "0xffffff",
      :text => "0x666666",
      :slider => "0x666666",
      :track => "0xFFFFFF",
      :border => "0x666666",
      :loader => "0x9FFFB8"
    }
    if value = self[column] and !value.blank?
      value
    else
      defaults[column]
    end
  end
  
  def bg=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:bg] = "0x#{$2}"
    end
  end
  def leftbg=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:leftbg] = "0x#{$2}"
    end
  end
  def lefticon=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:lefticon] = "0x#{$2}"
    end
  end
  def rightbg=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:rightbg] = "0x#{$2}"
    end
  end
  def rightbghover=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:rightbghover] = "0x#{$2}"
    end
  end
  def righticon=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:righticon] = "0x#{$2}"
    end
  end
  def righticonhover=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:righticonhover] = "0x#{$2}"
    end
  end
  def text=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:text] = "0x#{$2}"
    end
  end
  def slider=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:slider] = "0x#{$2}"
    end
  end
  def slider=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:slider] = "0x#{$2}"
    end
  end
  def track=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:track] = "0x#{$2}"
    end
  end
  def border=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:border] = "0x#{$2}"
    end
  end
  def loader=(input)
    if input =~ /^(0x|#)([0-9A-Fa-f]{3,6})$/
      self[:loader] = "0x#{$2}"
    end
  end
  
  def colors
    [ :bg, :leftbg, :lefticon, :rightbg, :rightbghover, :righticon, :righticonhover, :text, :slider, :track, :border, :loader ]
  end
  
  
  
end