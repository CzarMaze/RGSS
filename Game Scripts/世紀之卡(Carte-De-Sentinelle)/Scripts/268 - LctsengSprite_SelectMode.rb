#encoding:utf-8
#==============================================================================
# ■ Lctseng::Sprite_SelectMode
#------------------------------------------------------------------------------
#     選角色的存檔按鈕
#==============================================================================
module Lctseng
class Sprite_SelectMode < Sprite_SingleButton
  #--------------------------------------------------------------------------
  # ● 加入設定模組
  #--------------------------------------------------------------------------
  include SpriteSlider
  include SpriteFader
  #--------------------------------------------------------------------------
  # ● 初始化對象
  #--------------------------------------------------------------------------
  def initialize(index,viewport)
    @index = index
    super(get_position,get_bitmap_name,viewport)
    self.opacity = 0
    fader_init
  end
  #--------------------------------------------------------------------------
  # ● 懸浮處理程序
  #--------------------------------------------------------------------------
  def get_position
    pos = [0,100]
    case @index
    when 0
      pos[0] = 70
    when 1
      pos[0] = 350
    end
    return pos
  end
  #--------------------------------------------------------------------------
  # ● 取得圖片名稱
  #--------------------------------------------------------------------------
  def get_bitmap_name
    case @index
    when 0
      return 'BattleSelectMode_Attack'
    when 1
      return 'BattleSelectMode_Defend'
    end
  end
  #--------------------------------------------------------------------------
  # ● 更新
  #--------------------------------------------------------------------------
  def update
    super
    fader_update
  end
  #--------------------------------------------------------------------------
  # ● 顯示
  #--------------------------------------------------------------------------
  def show
    super
    self.opacity = 0
    start_animation_id(127)
    fader_set_fade(255,40)
  end
  #--------------------------------------------------------------------------
  # ● 顯示效果
  #--------------------------------------------------------------------------
  def perform_effect
    start_animation_id(128+@index)
  end
end
end
