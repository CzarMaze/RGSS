#encoding:utf-8
#==============================================================================
# ■ CardBattle::Sprite_SelectCardButton
#------------------------------------------------------------------------------
#     選擇卡片的按鈕精靈
#==============================================================================
module CardBattle
class Sprite_SelectCardButton < Sprite_Base
  #--------------------------------------------------------------------------
  # ● 加入淡入淡出模組
  #--------------------------------------------------------------------------
  include SpriteFader
  include SpriteSensor
  #--------------------------------------------------------------------------
  # ● 初始化對象
  #--------------------------------------------------------------------------
  def initialize(viewport)
    super(viewport)
    self.opacity = 0
    create_bitmap
    self.x = 521
    self.y = 193
    self.z = 100
    self.opacity = 0
    fader_init
    sensor_init
    sensor_set_sense_hover(method(:hover_handler))
  end
  #--------------------------------------------------------------------------
  # ● 產生點陣圖
  #--------------------------------------------------------------------------
  def create_bitmap
    @bitmap_in = Cache.battle("battle_btn_dealt_selected")
    @bitmap_out =  Cache.battle("battle_btn_dealt")
    self.bitmap = @bitmap_out
  end
  #--------------------------------------------------------------------------
  # ● 釋放
  #--------------------------------------------------------------------------
  def dispose
    super
  end
  #--------------------------------------------------------------------------
  # ● 更新
  #--------------------------------------------------------------------------
  def update
    super
    fader_update
    sensor_update 
  end
  #--------------------------------------------------------------------------
  # ● 呼叫感應器的檢查方法 - 重新定義
  #--------------------------------------------------------------------------
  def sensor_call_input
    if Input.trigger?(:C) && self.opacity > 100
      @sensor_input_handler.call
    end
  end
  #--------------------------------------------------------------------------
  # ● 懸浮處理程序
  #--------------------------------------------------------------------------
  def hover_handler(hover)
    if hover
      #puts "進入出牌"
      self.bitmap = @bitmap_in
    else
      self.bitmap = @bitmap_out
    end
  end
end
end
