#encoding:utf-8
#==============================================================================
# ■ Window_DebugLeft
#------------------------------------------------------------------------------
# 　調試畫面中，顯示開關和變量編號的窗口。
#==============================================================================

class Window_DebugLeft < Window_Selectable
  #--------------------------------------------------------------------------
  # ● 類變量
  #--------------------------------------------------------------------------
  @@last_top_row = 0                      # 保存頂行用
  @@last_index   = 0                      # 保存光標位置用
  #--------------------------------------------------------------------------
  # ● 定義實例變量
  #--------------------------------------------------------------------------
  attr_reader   :right_window             # 右窗口
  #--------------------------------------------------------------------------
  # ● 初始化對象
  #--------------------------------------------------------------------------
  def initialize(x, y)
    super(x, y, window_width, window_height)
    refresh
    self.top_row = @@last_top_row
    select(@@last_index)
    activate
  end
  #--------------------------------------------------------------------------
  # ● 獲取窗口的寬度
  #--------------------------------------------------------------------------
  def window_width
    return 164
  end
  #--------------------------------------------------------------------------
  # ● 獲取窗口的高度
  #--------------------------------------------------------------------------
  def window_height
    Graphics.height
  end
  #--------------------------------------------------------------------------
  # ● 獲取項目數
  #--------------------------------------------------------------------------
  def item_max
    @item_max || 0
  end
  #--------------------------------------------------------------------------
  # ● 更新畫面
  #--------------------------------------------------------------------------
  def update
    super
    return unless @right_window
    @right_window.mode = mode
    @right_window.top_id = top_id
  end
  #--------------------------------------------------------------------------
  # ● 獲取模式
  #--------------------------------------------------------------------------
  def mode
    index < @switch_max ? :switch : :variable
  end
  #--------------------------------------------------------------------------
  # ● 獲取頂端 ID 
  #--------------------------------------------------------------------------
  def top_id
    (index - (index < @switch_max ? 0 : @switch_max)) * 10 + 1
  end
  #--------------------------------------------------------------------------
  # ● 刷新
  #--------------------------------------------------------------------------
  def refresh
    @switch_max = ($data_system.switches.size - 1 + 9) / 10
    @variable_max = ($data_system.variables.size - 1 + 9) / 10
    @item_max = @switch_max + @variable_max
    create_contents
    draw_all_items
  end
  #--------------------------------------------------------------------------
  # ● 繪制項目
  #--------------------------------------------------------------------------
  def draw_item(index)
    if index < @switch_max
      n = index * 10
      text = sprintf("S [%04d-%04d]", n+1, n+10)
    else
      n = (index - @switch_max) * 10
      text = sprintf("V [%04d-%04d]", n+1, n+10)
    end
    draw_text(item_rect_for_text(index), text)
  end
  #--------------------------------------------------------------------------
  # ● 按下取消鍵時的處理
  #--------------------------------------------------------------------------
  def process_cancel
    super
    @@last_top_row = top_row
    @@last_index = index
  end
  #--------------------------------------------------------------------------
  # ● 設置右窗口
  #--------------------------------------------------------------------------
  def right_window=(right_window)
    @right_window = right_window
    update
  end
end
